// $(document).ready(function()
//       {
//       var ctx = document.getElementById("myChart").getContext("2d");


//  var dataset = {
//           type: 'Line',
//           data: {
//             labels: [],
//             datasets: [{
//               label: 'Downtime / Menit ',
//               backgroundColor: '#f39c127a',
//                      borderColor: 'white',
//                      hoverBackgroundColor: 'white',
//                      hoverBorderColor: 'white',
//               data: []
//             }]
//           },
//           options: {
//             scales: {
//               yAxes: [{
//                 ticks: {
//                   beginAtZero: true
//                 }
//               }]
//             }
//           }
//         }

//   var getData = function(chartdata)
//    {
//     $.ajax({
//       url: 'http://localhost:1111/quartal',//http://localhost:1111/BarangAll
//       success: function(data)
//        {
//         data.forEach(function(dt)
//         {
//           chartdata.data.labels.push(dt[0]);
//           chartdata.data.datasets[0].data.push(dt[1]);
//         });
//         var myChart = new Chart.Line(ctx, chartdata);

//       }
//     });
//   };
//   getData(dataset);
//   });



// $(document).ready(function()
//       {
// var ct = document.getElementById('myChart1').getContext('2d');
//   var dataset = {
//     type: 'bar',
//     data: {
//       labels: [],
//       datasets: [{
//         label: 'Cost',
//          backgroundColor: '#052c8d7d',
//         borderColor: 'rgba(200, 200, 200, 0.75)',
//         hoverBackgroundColor: 'rgba(151,187,205,0.8)',
//         hoverBorderColor: 'rgba(200, 200, 200, 1)',
//         data: []
//       }]
//     },
//     options: {
//       scales: {
//         yAxes: [{
//           ticks: {
//             beginAtZero: true
//           }
//         }]
//       }
//     }
//   }

//   var getData = function(chartdata) {
//     $.ajax({
//       url: 'http://localhost:1111/RestBiayaAll',
//       success: function(data)
//       {
//         data.forEach(function(el)
//         {
//           chartdata.data.labels.push(el[0]);
//            chartdata.data.datasets[0].data.push(el[1]);
//         });
//         var myChart = new Chart(ct, chartdata);

//       }
//     });
//   };
//   getData(dataset);

//     });









//     $(document).ready(function()
//           {
//     var cx = document.getElementById('myChart2').getContext('2d');
//       var dts = {
//         type: 'bar',
//         data: {
//           labels: [],
//           datasets: [{
//             label: 'Margin ',
//             backgroundColor: '#1fe60c87',
//             borderColor: 'rgba(200, 200, 200, 0.75)',
//             hoverBackgroundColor: 'rgba(151,187,205,0.8)',
//             hoverBorderColor: 'rgba(200, 200, 200, 1)',
//             data: []
//           }]
//         },
//         options: {
//           scales: {
//             yAxes: [{
//               ticks: {
//                 beginAtZero: true
//               }
//             }]
//           }
//         }
//       }

//       var getData = function(chartdata) {
//         $.ajax({
//           url: 'http://localhost:1111/quartal',
//           success: function(data)
//           {
//             data.forEach(function(dts)
//             {
//               chartdata.data.labels.push(dts[0]);
//               chartdata.data.datasets[0].data.push(dts[1]);
//             });
//             var myChart = new Chart(cx, chartdata);

//           }
//         });
//       };
//       getData(dts);
//       });














//       $(document).ready(function()
//             {
//       var ct = document.getElementById('myChart3').getContext('2d');
//         var dataset = {
//           type: 'Line',
//           data: {
//             labels: [],
//             datasets: [{
//               label: 'Cost Moveout ',
//               backgroundColor: '#ec101075',
//                      borderColor: 'white',
//                      hoverBackgroundColor: 'white',
//                      hoverBorderColor: 'white',
//               data: []
//             }]
//           },
//           options: {
//             scales: {
//               yAxes: [{
//                 ticks: {
//                   beginAtZero: true
//                 }
//               }]
//             }
//           }
//         }

//         var getData = function(chartdata) {
//           $.ajax({
//             url: 'http://localhost:1111/move',
//             success: function(data)
//             {
//               data.forEach(function(el)
//               {
//                 chartdata.data.labels.push(el[0]);
//                  chartdata.data.datasets[0].data.push(el[1]);
//               });
//               var myChart = new Chart.Line(ct, chartdata);

//             }
//           });
//         };
//         getData(dataset);

//           });