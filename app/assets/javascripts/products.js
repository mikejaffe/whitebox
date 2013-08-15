// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

/**
Whitebox ad preview text rotation plugin
*/
(function($, docObj, winObj){
    		
	$.fn.whiteboxPreview = function (opts) {
		var win = winObj,
			doc = docObj;

		var settings = $.extend({
			rotationSpeed: 4000
		}, opts);

		return this.each(function() {
			var $this = $(this),
				lines = $(this).children('.ad-text'),
				timer = null,
				currentLine = 0,
				maxLines = lines.length,
				type = $(this).hasClass('whitebox-ad-tall') ? 'tall' : 'flat';

				init();

				function init() {
					if (type == 'tall') {
						setTimeout(verticalAlign, 100);
					}

					startRotation();
				}

				function verticalAlign() {
					for (var i = 0; i < maxLines; i++) {
						var $line = $(lines[i]);
						var topVal = (187 - $line.height() ) / 2;
						$line.css({ top: topVal });
					}
				}

				function startRotation() {
					$(lines[currentLine]).fadeIn();

					if (maxLines > 1) {
						timer = setInterval(rotate, settings.rotationSpeed);
					}
				}

				function stopRotation() {
					clearInterval(timer);
				}

				function rotate() {
					var nextLine = (currentLine == maxLines - 1) ? 0 : currentLine + 1;
					$(lines[currentLine]).fadeOut();
					$(lines[nextLine]).fadeIn({ complete: function() {
						currentLine = nextLine;
					}});
				}

		});
	}

}(jQuery, document, window));

/**
Custom jQuery input character counter plugin
*/
(function($, docObj, winObj){
    		
	$.fn.charCount = function (opts) {

		var win = winObj,
			doc = docObj;

		return this.each(function() {
			var $this = $(this),
				lineNum = $(this).data('line').toString(),
				maxCount = $(this).attr('maxlength'),
				counterId = '#count' + lineNum,
				$counter = $(counterId);

			// events
			$this.on("keyup", keypressHandler);

			function keypressHandler() {
				var count = $(this).val().length;
				if (count <= maxCount) {
					$counter.html($(this).val().length);
				}
			}

		});
	}

}(jQuery, document, window));

/**
preview form validation
*/
function validatePreview() {

	$('.error').hide();

	var hasErrors = false;
	var srcType = $("input[name='adSource']:checked").val();
	var $srcInput = $('#source' + srcType);
	
	if ($srcInput.val() == "") {
		hasErrors = true;
		$('#adSourceError').fadeIn();
	}
	
	if (!isValid($("#startDate")) || !isValid($("#endDate"))  || !isValid($("#runDays"))) {
		hasErrors = true;
		$('#adRunError').fadeIn();
	}

	if (!hasErrors) {
		$("#previewForm").submit();
	}
}

/**
about form validation
*/
function validateAbout() {
	var hasErrors = false;

	var $inputs = $('#about-form input');
	
	$inputs.each(function() {
		if (!isValid($(this))) {
			hasErrors = true;
		}
	});

	if (!hasErrors) {
		$("#previewForm").submit();
	}
	else {
		$('.error').fadeIn();
	}
}

/**
ad text validation
*/
function validateAdText() {
	var hasErrors = false;

	var $inputs = $('input.lineTextInput');
	var emptyLineCount = 0;
	
	$inputs.each(function() {
		if (!isValid($(this))) {
			emptyLineCount++;
		}
	});

	// valid if at least 1 line of text
	if (emptyLineCount < $inputs.length) {
		$("#newOrderForm").submit();
	}
	else {
		$('.error').fadeIn();
	}
}

/** 
helper validation 
*/

function isValid($input) {
	if ($input.val() !== "") {
		return true;
	}
	else {
		return false;
	}
}


