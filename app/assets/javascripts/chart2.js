function tinh()
{

var sp5 = document.getElementById("sp5").innerHTML;
// var a = parseFloat(document.mt.sp5.value);
var sp4 = document.getElementById("sp4").innerHTML;
var sp3 = document.getElementById("sp3").innerHTML;
var sp2 = document.getElementById("sp2").innerHTML;
var sp1 = document.getElementById("sp1").innerHTML;
var tong = document.getElementById("tongsp").innerHTML;
var s5 = document.getElementById("s5").innerHTML=Math.round((sp5/tong)*100);
var s4 = document.getElementById("s4").innerHTML=Math.round((sp4/tong)*100);
var s3 = document.getElementById("s3").innerHTML=Math.round((sp3/tong)*100);
var s2 = document.getElementById("s2").innerHTML=Math.round((sp2/tong)*100);
var s1 = document.getElementById("s1").innerHTML=100 - (s5 + s4 + s3 + s2);
var pieData = [
        {
            value: s5,
            color:"#878BB6"
        },
        {
            value : s4,
            color : "#4ACAB4"
        },
        {
            value : s3,
            color : "#FF8153"
        },
        {
            value : s2,
            color : "#FFEA88"
        },
        {
            value : s1,
            color : "#FFEA18"
        }
    ];

    // pie chart options
    var pieOptions =
    {
        segmentShowStroke : false,
        animateScale : true
    }

    // get pie chart canvas
    var quality= document.getElementById("quality").getContext("2d");

    // draw pie chart
    new Chart(quality).Pie(pieData, pieOptions);
    }
