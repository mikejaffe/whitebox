// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

	$(".size-option").click(function(){
		$.ajax({
		  url: '/products/' + this.value,
		  type: 'GET',
		  dataType: 'html',
		  data: { },
		  success: function(data) {
 
		    $(".medias").html(data).show();
		  } 
		});
		
	});

});