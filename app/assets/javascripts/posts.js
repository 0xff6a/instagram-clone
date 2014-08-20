$(document).ready(function(){
	
	$('#post_tag_list').inputosaurus({
		width: '200px',
		outputDelimiter : ' OR ',
		parseHook : function(valArr){
			return $.map(valArr, function(val) {
				val = $.trim(val);
				return /\s/.test(val) ? '"' + val + '"' : val;
			});
		},
		change : function(ev) {
			$('#post_tag_list_reflect').val(ev.target.value);
		}
	});

});