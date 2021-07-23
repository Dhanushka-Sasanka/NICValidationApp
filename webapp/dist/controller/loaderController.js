


setTimeout(
    function () {
      	$.get('user-manage-view.jsp',function(res){
      	    $('#main-content').empty().append(res);
      		$('#animate_section').hide();
      	});
    },
    1000
);