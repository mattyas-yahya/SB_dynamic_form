
	$(document).ready(function() 
        {
        $('#calendar').fullCalendar({
            header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,basicWeek,basicDay'
      },
           navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true,
            events: "../calendar"
        });
 
    });







