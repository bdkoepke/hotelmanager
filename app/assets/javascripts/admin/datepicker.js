

$(document).ready( function()
{

    var datepicker_widgets = $('input.ui-date-picker');
    //restrictrange();
    if (datepicker_widgets != null)
    {
//		datepicker_widgets.datepicker( 'option', 'minDate', new Date(2013, 10 - 1, 25));
	    datepicker_widgets.datepicker( 'option', 'changeMonth', true );

	    restrictrange();
	}
 }
)

// restric start and end date in registration module

function restrictrange()
{
var datepicker_widgets = $('input.ui-date-picker');
var startDateTextBox = $('#reservation_date_in');
var endDateTextBox = $('#reservation_date_out');

startDateTextBox.datepicker({ 
	onClose: function(dateText, inst) {
		if (endDateTextBox.val() != '') {
			var testStartDate = startDateTextBox.datepicker('getDate');
			var testEndDate = endDateTextBox.datepicker('getDate');
			if (testStartDate > testEndDate)
				endDateTextBox.datepicker('setDate', testStartDate);
		}
		else {
			endDateTextBox.val(dateText);
		}
	},
	onSelect: function (selectedDateTime){
		endDateTextBox.datepicker('option', 'minDate', startDateTextBox.datepicker('getDate') );
	}
});
endDateTextBox.datepicker({ 
	onClose: function(dateText, inst) {
		if (startDateTextBox.val() != '') {
			var testStartDate = startDateTextBox.datepicker('getDate');
			var testEndDate = endDateTextBox.datepicker('getDate');
			if (testStartDate > testEndDate)
				startDateTextBox.datepicker('setDate', testEndDate);
		}
		else {
			startDateTextBox.val(dateText);
		}
	},
	onSelect: function (selectedDateTime){
		startDateTextBox.datepicker('option', 'maxDate', endDateTextBox.datepicker('getDate') );
	}
});
}