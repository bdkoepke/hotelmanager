$(document).ready(function() {
    // change status of a reservation
    //$('#status').on('change', function(){
    $('body').on('change','#status',function(){
      var status = this.options[this.selectedIndex].text;
      var reservation_id = this.value;
      $.ajax({
       url: "/admin/reservations/changeStatus",
       type: "GET",
       data: { 'status' : status ,'reservation_id' : reservation_id } ,
       dataType:'JSON',
       success:function(data){
           reloadReservationTable();
       }
      });
      
    })

    // change the hotel and room type if combination is no longer valid
    $('body').on('change','#reservation_room_id',function(){
    //$('#reservation_room_id').on('change', function(){
       var roomID = this.options[this.selectedIndex].text;
       $.ajax({
       url: "/admin/reservations/checkValidRoom",
       type: "GET",
       dataType: 'json',
       data: { 'room_name' : roomID, 'hotel_id' : $('#reservation_hotel_id').val() , 'room_type' : $('#reservation_room_type').val() } ,
       success:function(data){
          if (data == false)
          {
            $('#reservation_hotel_id').val("");
            $('#reservation_room_type').val("");          
          }          
       },
      dataType:'JSON'
      });

    })
    // get the rooms based on the room type selected
    $('body').on('change','#reservation_room_type',function(){
    //$('#reservation_room_type').on('change', function () {

      $.ajax({
       url: "/admin/reservations/getRooms",
       type: "GET",
       data: { 'room_type' : this.value, 'hotel_id' : $('#reservation_hotel_id').val() } ,
       success:function(data){
          $('#reservation_room_id').find('option').remove();          
          for (var i = 0 ; i < data.length ; i++)
          {
            $('#reservation_room_id').append("<option value='" + ( i + 1) + "'>" + data[i] + "</option>");

          }
       },
      dataType:'JSON'
      });

    })

    // get rooms based on the hotel a person is staying
    $('body').on('change','#reservation_hotel_id',function(){
    //$('#reservation_hotel_id').on('change', function () {

      $.ajax({
       url: "/admin/reservations/getRooms",
       type: "GET",
       data: { 'hotel_id' : this.value } ,
       success:function(data){
       	$('#reservation_room_type').val("");
        $('#reservation_room_id').find('option').remove();
       	$('#reservation_room_id').append('<option value=' + ""+ '></option>');
        for (var i = 0 ; i < data.length ; i++)
       	{
       		$('#reservation_room_id').append("<option selected='selected' value='" + (i + 1) + "'>" + data[i] + "</option>");
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
function reloadReservationTable()
{
  var docurl = document.URL;
  $("#collection_selection").fadeOut('slow').load(docurl + '  #collection_selection').fadeIn("slow");
}