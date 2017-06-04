class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @category.save
      flash[:info] = t ".info"
      redirect_to admin_categories_url
    else
      render :new
    end
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".success"
      redirect_to admin_categories_url
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_url
  end

  private
  def category_params
    params.require(:category).permit :id, :name
  end
end
