class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :stripeToken

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :feedbacks, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :likeships, dependent: :destroy
  has_many :likeship_comment_products, through: :likeships,
    class_name: CommentProduct.name
  has_many :products, dependent: :destroy
  has_many :comment_products, dependent: :destroy
  has_many :cmt_products, through: :comment_products,
    class_name: Product.name
  has_many :relationships
  has_many :comment_products
  has_many :rating_products
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_attached_file :image, styles: {small: "80x80#", med: "100x100#",
    large: "200x200#", verysmall: "30x30#"}

  validates_attachment :image, presence: true,
    content_type: {content_type: /\Aimage/},
    size: {in: 0..10.megabytes}

  scope :not_is_admin, (->_user{where admin: false})

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  before_create :pay_with_card, unless: Proc.new { |user| user.admin? }
  after_create :sign_up_for_mailing_list

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end

  def current_user? user
    self == user
  end

  def like comment_id
    likeships.create comment_product_id: comment_id
  end

  def unlike liking
    liking.destroy
  end

  def liking? comment_id
    likeships.find_by comment_product_id: comment_id
  end

  def set_default_role
    self.role ||= :user
  end

  def pay_with_card
    if self.stripeToken.nil?
      self.errors[:base] << t ".not_verify"
      raise ActiveRecord::RecordInvalid.new(self)
    end
    customer = Stripe::Customer.create(
      :email => self.email,
      :card  => self.stripeToken
    )
    price = Rails.application.secrets.product_price
    title = Rails.application.secrets.product_title
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => "#{price}",
      :description => "#{title}",
      :currency    => t ".usd"
    )
    Rails.logger.info(t ".transaction", self_email: self.email)
      if charge[:paid] == true
  rescue Stripe::InvalidRequestError => e
    self.errors[:base] << e.message
    raise ActiveRecord::RecordInvalid.new(self)
  rescue Stripe::CardError => e
    self.errors[:base] << e.message
    raise ActiveRecord::RecordInvalid.new(self)
  end

  def sign_up_for_mailing_list
    MailingListSignupJob.perform_later(self)
  end

  def subscribe
    mailchimp = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
    list_id = Rails.application.secrets.mailchimp_list_id
    result = mailchimp.lists(list_id).members.create(
      body: {
        email_address: self.email,
        status: "subscribed"
    })
    Rails.logger.info(t ".subscribed", self_email: self.email) if result
  end
end
