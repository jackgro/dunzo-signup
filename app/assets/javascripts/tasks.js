jQuery.fn.loadOnCreate = function() {
	this.find('a.delete-task').show();
	return this;
}

$(function(){
	$('#new_task').loadOnCreate();
});