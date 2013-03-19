 $(function () {
/*
    $('#reservation_no_adults').on('change', function () {

      $.ajax({
      //url: "#{party_schedules_parties_path}",
       url: "getcols",
       type: "GET",
       data: { 'no_adults' : this.value } ,
       //url: "getcols",       
       success:function(data){
       	$('#reservation_no_children').val(data);
        $('#party-schedule').html(data);
       },
      dataType:'JSON',
       error: function (xhr, textStatus, errorThrown) {
        alert(errorThrown);
        }
      });

    })
*/

    $('#reservation_hotel_id').on('change', function () {

      $.ajax({
       url: "/admin/reservations/getRooms",
       type: "GET",
       data: { 'hotel_id' : this.value } ,
       success:function(data){
       	$('#reservation_room_id').find('option').remove();
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
