// line chart data
var t1 = document.getElementById("t1").innerHTML;
var t2 = document.getElementById("t2").innerHTML;
var t3 = document.getElementById("t3").innerHTML;
var t4 = document.getElementById("t4").innerHTML;
var t5 = document.getElementById("t5").innerHTML;
var t6 = document.getElementById("t6").innerHTML;
var t7 = document.getElementById("t7").innerHTML;
var t8 = document.getElementById("t8").innerHTML;
var t9 = document.getElementById("t9").innerHTML;
var t10 = document.getElementById("t10").innerHTML;
var t11 = document.getElementById("t11").innerHTML;
var t12= document.getElementById("t12").innerHTML;
var buyerData =
{
	labels : ["Tháng 1","Tháng 2","Tháng 3","Tháng 4","Tháng 5","Tháng 6",
	"Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
	datasets :
	[
		{
				fillColor : "lightblue",
				strokeColor : "red",
				pointColor : "#fff",
				pointStrokeColor : "#9DB86D",
				data : [t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12]
		}
	]
}

// get line chart canvas
var buyers = document.getElementById('buyers').getContext('2d');

// draw line chart
new Chart(buyers).Line(buyerData);
//Pie Chart
