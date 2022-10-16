
$(document).ready(function()
	{ 
/* 		$('#fst_pic').mouseover(function(){
		$('#main_pic').css('background-image','url(main_pic.png)');
		});
		$('#snd_pic').mouseover(function(){
			$('#main_pic').css('background-image','url(new_2nd_pic.png)');
		});
		$('#trd_pic').mouseover(function(){
			$('#main_pic').css('background-image','url(new_3rd_pic.png)');
		}); */
		const previews = $('.mini_pic');
		const zoom = $('#main_pic');
		for(let i = 0; i < previews.length; i++) {
			$(previews[i]).on('mouseover', function () {
				const src = $(this).attr('data-full-img');
				zoom.attr('src', src);
			})
		}

		let el = $('#num_count');
		function change(v){
			let upd = +el.val()+v;
			if (upd > 0) {
				el.val(upd)
				const div = document.getElementById('minus');
				if (el.val() > 1) {
					div.classList.remove('minus_non');
				}
				else {
					div.classList.add('minus_non');
				}
			}
			else {
				el.val(1)
			}
			/* el.val( upd>0 ? upd : 1);     */
		};
		$('#plus').on('click', function(){ change(1);}); 
		$('#minus').on('click', function(){ change(-1);});

		$(".in_shop").click(function()
		{
			let el = $('#num_count');
			if (el.val() == '1') {
				$.notice('В корзину добавлено ' + el.val() + ' товар')
			}
			else if ((el.val() >= '2') && (el.val() <= '4')) {
				$.notice('В корзину добавлено ' + el.val() + ' товара')
			}
			else {
				$.notice('В корзину добавлено ' + el.val() + ' товаров')
			}
			
		})	
})