$(document).ready(function(){

    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Date', 'Balance'],
          ['14-07-2017',  10000000],
          ['15-07-2017',  10000000],
          ['16-07-2017',  10000000],
          ['17-07-2017',  9730000],
          ['18-07-2017',  9000000],
          ['19-07-2017',  9000000],
          ['20-07-2017',  9000000],
          ['21-07-2017',  8700000],
          ['22-07-2017',  8700000],
          ['23-07-2017',  8321000],
          ['24-07-2017',  8010000],
          ['25-07-2017',  7900000],
          ['26-07-2017',  8320000],
          ['27-07-2017',  8000000],
          ['28-07-2017',  7880000],
          ['29-07-2017',  7600000]
        ]);

        var options = {
          title: 'Balance Tracker',
          hAxis: {title: 'Date',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
    }
});

// $(document).ready(function(){
//
//
//   function loadChart(chartData) {
//       debugger
//       var dataChart = [];
//       var headChart = ['Date', 'Balance'];
//       dataChart.push(headChart);
//       var bodyChart = chartData['duration_balance'].forEach(combineData);
//
//       function combineData(item, index) {
//         var arr = [item, chartData['balance_array'][index]]
//         dataChart.push(arr);
//       }
//
//       var data = google.visualization.arrayToDataTable(chartData);
//
//       var options = {
//         title: 'Balance Tracker',
//         hAxis: {title: 'Date',  titleTextStyle: {color: '#333'}},
//         vAxis: {minValue: 0}
//       };
//
//       var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
//       chart.draw(data, options);
//   };
//
//   // var current_href = window.location.href.slice(21)
//   function drawChart(){
//     $.ajax({
//       url: current_href,
//       method: 'get',
//       success: loadChart
//     })
//   }
// })
