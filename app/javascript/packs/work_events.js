$(document).ready(function() {
    $('button#breakfast').on('click', function() {
        document.getElementById('title').value = 'Breakfast';
        document.getElementById('description').value = 'This is Breakfast';
        document.getElementById('helpers_needed').value = 4;
        document.getElementById('work_event_start_time_4i').value = "08";
        document.getElementById('work_event_start_time_5i').value = "00";
        document.getElementById('work_event_end_time_4i').value = "11";
        document.getElementById('work_event_end_time_5i').value = "00";
        }
    );
    $('button#lunch').on('click', function() {
            document.getElementById('title').value = 'Lunch';
            document.getElementById('description').value = 'This is Lunch';
            document.getElementById('helpers_needed').value = 4;
            document.getElementById('work_event_start_time_4i').value = "12";
            document.getElementById('work_event_start_time_5i').value = "00";
            document.getElementById('work_event_end_time_4i').value = "15";
            document.getElementById('work_event_end_time_5i').value = "00";
        }
    );
    $('button#dinner').on('click', function() {
            document.getElementById('title').value = 'Dinner';
            document.getElementById('description').value = 'This is Dinner';
            document.getElementById('helpers_needed').value = 4;
            document.getElementById('work_event_start_time_4i').value = "18";
            document.getElementById('work_event_start_time_5i').value = "00";
            document.getElementById('work_event_end_time_4i').value = "20";
            document.getElementById('work_event_end_time_5i').value = "00";
        }
    );
});