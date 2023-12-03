
$(document).ready(function()
{
$.ajax({
 type:"GET",
url: 'http://localhost:1111/sumwo',
success: function(data)
{
data.forEach(function(d)
{
 console.log(d);
$("#allwo").append
(
"<h1>"+JSON.stringify(d)+"</h1>"
);
});
}
});
});


$(document).ready(function()
{
 type:"GET",
$.ajax({
url: 'http://localhost:1111/sumend',
success: function(data)
{
data.forEach(function(d)
{
$("#end").append
(
"<h1>"+d+"</h1>"
);
});
}
});
});



$(document).ready(function()
{
 type:"GET",
$.ajax({
url: 'http://localhost:1111/sumwip',
success: function(data)
{
data.forEach(function(d)
{
$("#wip").append
(
"<h1>"+d+"</h1>"
);
});
}
});
});



$(document).ready(function()
{
 type:"GET",
$.ajax({
url: 'http://localhost:1111/sumtake',
success: function(data)
{
data.forEach(function(d)
{
$("#to").append
(
"<h1>"+d+"</h1>"
);
});
}
});
});
