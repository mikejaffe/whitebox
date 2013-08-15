// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require_tree .
$(document).ready(function() {

	if($("#about-submit")) {
		$("#about-submit").click(function(e) {
			e.preventDefault();
			if ( validateCheckout() ) {

				//-- send order vars --- 
				$.ajax({
					url: '/checkout/0',
					type: 'PUT', 
					data: $("#checkout_form").serialize(),
					success : function(data) {
						$("#paypal").html(data);
						$("#send_to_paypal").submit();
					}
				})
				 
				
				//$("#checkout_form").submit();
			}
		});
	}



	if ($('#startDate') && $('#endDate')) {

    	$( "#startDate" ).datepicker({ 
    		minDate: 'today',
    		onSelect: function() {
    			//enable end datepicker
				$('#endDate').datepicker('option', { disabled: false });
				setRun();
    		}
    	});

    	$( "#endDate" ).datepicker({
    		beforeShow: setMinDate,
    		onSelect: setRun,
    		disabled: true
    	});

    	$('.btn-calendar').on('click', function(e){
    		var calendarId = '#' + $(this).data('date');
    		$(calendarId).datepicker('show');
		});

		$('.btn-clear').on('click', function(e){
			$(this).siblings('input').val('');
		});
  	
  		$('.src-input').on('focus', function(e){
  			var opt = $(this).attr('id');
  			var $elem = (opt == 'sourceweb') ? $("input[name='adSource'][value='web']") : $("input[name='adSource'][value='email']");
  			
  			if ($elem.prop('checked') == false) {
	  			$("input[name='adSource']").parent('span').toggleClass('checked');
	  			$elem.prop('checked', true);
  			}
  		});
	}

	if ($(".size-option")) {
		$(".size-option").click(function(){
			$.ajax({
			  url: '/products/' + this.value,
			  type: 'GET',
			  dataType: 'html',
			  data: { },
			  success: function(data) {
	 
			    $(".medias").html(data).show();
			   	$('.lineTextInput').charCount();
			   	$('#adTextSubmit').on('click', function(e){
					e.preventDefault();
					validateAdText();
				});
			  } 
			});
			
		});
	}

	if ($('.whitebox-ad')) {
		$('.whitebox-ad').whiteboxPreview({ rotationSpeed: 5000 });
	}

	setTimeout(function() { $(".radio").uniform(); }, 100);

	if ($('#previewSubmit')) {
		$('#previewSubmit').on('click', function(e){
			e.preventDefault();
			validatePreview();
		});
	}


	if ($('#cost')) {

		// set cost (if applicable)
		if ($('#runDays').val() !== '') {
			var numDays = $('#runDays').val();
			setPrice(numDays);
		}

		// blur event
		$('#runDays').on('blur', function(e) {
			setPrice($(this).val());
		});
	}
});

function setMinDate(elem, obj) {
	var startDate = $('#startDate').datepicker('getDate');
	$('#endDate').datepicker('option', 'minDate', startDate);
}

function setPrice(days) {
	var price = $('#product_price').val();
	var totalCost = price * days;
	$('#cost').val('$' + totalCost);
}

function setRun(date, obj) {
	
	if ($('#startDate').val() !== '' && $('#endDate').val() !== '') {
		var oneDay = 24*60*60*1000; 
		var start = $('#startDate').datepicker('getDate');;
		var end = $('#endDate').datepicker('getDate');;

		var days = Math.round(Math.abs((start.getTime() - end.getTime())/(oneDay)));
		$('#runDays').val(days);
		setPrice(days);
	}
}

function validateCheckout() {
	if($("#fname").val() == "") {
		$(".error").html("Please enter your first name").show();
		return false;
	}
	if($("#lname").val() == "") {
		$(".error").html("Please enter your last name").show();
		return false;
	}
	if($("#email").val() == "") {
		$(".error").html("Please enter your email address").show();
		return false;
	}
	if($("#address").val() == "") {
		$(".error").html("Please enter your address").show();
		return false;
	}
	return true;
 
}