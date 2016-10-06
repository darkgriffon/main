jQuery("#addimg").click(function (){
	var imgCount = jQuery("#images .img").length+1;
	jQuery("#images").append('<div class="span9 img">' + imgCount++ + '. <input type="file" name="img' + imgCount++ + '" class="span6" /></div>');
});
jQuery("#addparagraph").click(function (){
	var pCount = jQuery("#paragraphs .pageparagraph").length+1;
	jQuery("#paragraphs").append('<div class="span9 pageparagraph"><textarea rows="5" id="p' + pCount++  +'" class="span8"></textarea></div>');
});
