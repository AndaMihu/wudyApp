var date_range_picker;
date_range_picker = function() {
  $('.date-range-picker').each(function(){
    $(this).daterangepicker({
        timePicker: true,
        timePicker24Hour: true,
        startDate: moment().startOf('hour'),
         endDate: moment().startOf('hour').add(32, 'hour'),
       locale: { format: 'M/DD hh:mm A'},
        timePickerIncrement: 30,
        alwaysShowCalendars: true
    }, function(start, end, label) {
      $('.start_hidden').val(start.format('YYYY-MM-DD HH:mm'));
      $('.end_hidden').val(end.format('YYYY-MM-DD HH:mm'));
    });
  })
};
$(document).on('turbolinks:load', date_range_picker);
