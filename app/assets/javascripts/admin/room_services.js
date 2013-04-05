/**
 * @author Garrick
 */
$(function () {

    // change the hotel and room type if combination is no longer valid
 /*   $('#reservation_room_id').on('change', function(){

       $.ajax({
       url: "/admin/reservations/checkValidRoom",
       type: "GET",
       data: { 'room_name' : this.value, 'hotel_id' : $('#reservation_hotel_id').val() , 'room_type' : $('#reservation_room_type').val() } ,
       success:function(data){
          if (data == false)
          {
            $('#reservation_hotel_id').val("");
            $('#reservation_room_type').val("");          
          }          
       },
      dataType:'JSON'
      });

    })*/
    // get the rooms based on the room type selected


    // get rooms based on the hotel a person is staying
    $('#room_service_hotel_id').on('change', function () {

      $.ajax({
       url: "/admin/room_services/getRooms",
       type: "GET",
       data: { 'hotel_id' : this.value } ,
       success:function(data){
        $('#room_service_room_id').find('option').remove();
       	$('#room_service_room_id').append('<option value=' + ""+ '></option>');
        for (var i = 0 ; i < data.length ; i++)
       	{
       		$('#reservation_room_id').append('<option value=' + data[i] + '> ' + data[i] + '</option>');
        }
       },
      dataType:'JSON',
       error: function (xhr, textStatus, errorThrown) {
        ///alert(errorThrown);
        }
      });

    })

});
