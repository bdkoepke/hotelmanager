$(document).ready(function() {

    // get rooms based on the hotel a person is staying
    $('body').on('change','#room_service_hotel_id',function(){
    //$('#room_service_hotel_id').on('change', function () {

      $.ajax({
       url: "/admin/room_services/getRooms",
      type: "GET",
       data: { 'hotel_id' : $('#room_service_hotel_id').val() } ,
       success:function(data){
        $('#room_service_room_id').find('option').remove();
       	$('#room_service_room_id').append('<option value=' + ""+ '></option>');
        for (var i = 0 ; i < data.length ; i++)
       	{
       		$('#room_service_room_id').append("<option selected='selected' value='" + (i + 1) + "'>" + data[i] + "</option>");
          $("#elementid").append("<option value='1'>Apples</option>")
        }
       },
      dataType:'JSON',
       error: function (xhr, textStatus, errorThrown) {
        ///alert(errorThrown);
        }
      });

    })
    
        $('body').on('change','#room_service_room_id',function(){
    //$('#room_service_hotel_id').on('change', function () {

      $.ajax({
       url: "/admin/room_services/getReservation",
      type: "GET",
       data: { 'room_id' : $('#room_service_room_id').val() } ,
       success:function(data){
        $('#room_service_reservation_id').find('option').remove();
       	$('#room_service_reservation_id').append('<option value=' + ""+ '></option>');
        for (var i = 0 ; i < data.length ; i++)
       	{
       		$('#room_service_reservation_id').append("<option selected='selected' value='" + (i + 1) + "'>" + data[i] + "</option>");
          $("#elementid").append("<option value='1'>Apples</option>")
        }
       },
      dataType:'JSON',
       error: function (xhr, textStatus, errorThrown) {
        ///alert(errorThrown);
        }
      });

    })

});


// reload the index table for the reservations
/*
function reloadReservationTable()
{
  var docurl = document.URL;
  $("#collection_selection").fadeOut('slow').load(docurl + '  #collection_selection').fadeIn("slow");
}*/