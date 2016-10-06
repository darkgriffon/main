// Copyright (c) 2010 TrendMedia Technologies, Inc., Brian McNitt. 
// All rights reserved.
//
// Released under the GPL license
// http://www.opensource.org/licenses/gpl-license.php
//
// **********************************************************************
// This program is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
// **********************************************************************

$(window).load(function() {	//start after HTML, images have loaded
	
	//initial fade-in time (in milliseconds)
	var initialFadeIn = 1000;
	
	//interval between items (in milliseconds)
	var itemInterval = 5000;
	
	//cross-fade time (in milliseconds)
	var fadeTime = 2500;
	
	//count number of items
	var numberOfItems = $('.rotating-item').length;
	
	var InfiniteRotator = 
	{
		init: function()
		{
			
			//set first item
			var currentItem = 0;

			//set active class to first image
			$('.rotating-item:nth-child(1)').addClass('active');
			
			//show first item
			$('.rotating-item').eq(currentItem).fadeIn(initialFadeIn);
			
			//loop through the items	
			var infiniteLoop = setInterval(function(){
				$('.rotating-item').eq(currentItem).fadeOut(fadeTime);

				if(currentItem == numberOfItems -1){
					currentItem = 0;
					$('.rotating-item').removeClass('active');
					$('.rotating-item:nth-child('+ currentItem +')').next().addClass('active');
					
					//for thumbs
					$('#thumbs a img').removeClass('highlighted');
					$('#thumbs a img').eq(currentItem).addClass('highlighted');
				}else{
					currentItem++;
					$('.rotating-item').removeClass('active');
					$('.rotating-item:nth-child('+ currentItem +')').next().addClass('active');
					
					//for thumbs
					$('#thumbs a img').removeClass('highlighted');
					$('#thumbs a img').eq(currentItem).addClass('highlighted');
				}
				$('.rotating-item').eq(currentItem).fadeIn(fadeTime);

			}, itemInterval);
			this.infiniteLoop = infiniteLoop;
			
		},
		
		stop: function()
		{
			clearInterval(this.infiniteLoop);
		},
		
		switchImage: function(toImg)
		{
			
			//set current item as var
			var currentItem = toImg;
			//console.log(currentItem);
			
			if(currentItem == numberOfItems){
					currentItem = 0;
					//show first item
					$('#rotating-item-wrapper img').attr("style", "display: none;");
					$('.rotating-item').eq(currentItem).fadeIn(initialFadeIn);
					$('#thumbs a img').removeClass('highlighted');
					$('#thumbs a img').eq(currentItem).addClass('highlighted');
			}else{
					//show first item
					$('#rotating-item-wrapper img').attr("style", "display: none;");
					$('.rotating-item').eq(currentItem).fadeIn(initialFadeIn);
					$('#thumbs a img').removeClass('highlighted');
					$('#thumbs a img').eq(currentItem).addClass('highlighted');
			}

			//loop through the items	
			
			var infiniteLoop = setInterval(function(){
				$('.rotating-item').eq(currentItem).fadeOut(fadeTime);

				if(currentItem == numberOfItems -1){
					currentItem = 0;
					$('.rotating-item').removeClass('active');
					$('.rotating-item:nth-child('+ currentItem +')').next().addClass('active');
					
					//for thumbs
					$('#thumbs a img').removeClass('highlighted');
					$('#thumbs a img').eq(currentItem).addClass('highlighted');
				}else{
					currentItem++;
					$('.rotating-item').removeClass('active');
					$('.rotating-item:nth-child('+ currentItem +')').next().addClass('active');
					
					//for thumbs
					$('#thumbs a img').removeClass('highlighted');
					$('#thumbs a img').eq(currentItem).addClass('highlighted');
				}
				$('.rotating-item').eq(currentItem).fadeIn(fadeTime);

			}, itemInterval);
			this.infiniteLoop = infiniteLoop;
			
		},
	};

	InfiniteRotator.init();
	
	//switch to image
	jQuery("#thumbs a").click(function(){
	
		InfiniteRotator.stop();
		var toImg = jQuery("#thumbs a").index(this);
		
		InfiniteRotator.switchImage(toImg);
		return false;

	});
	
	//switch to next image
	jQuery("#next").click(function(){
	
		InfiniteRotator.stop();
		var toImg = jQuery("#thumbs img").index($('.highlighted'));
		
		InfiniteRotator.switchImage(toImg+1);
		return false;

	});
	
	//switch to prev image
	jQuery("#prev").click(function(){
	
		InfiniteRotator.stop();
		var toImg = jQuery("#thumbs img").index($('.highlighted'));
		
		InfiniteRotator.switchImage(toImg-1);
		return false;

	});
	
});