$(document).ready(function() {
	$("#type").on("change", function() {
		var selected = $(this).val();
		if (selected === "url") {
			$("#url-group").show();
		} else {
			$("#url-group").hide();
		}
	});
});
