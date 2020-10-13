$(function () {
  // カテゴリー開閉メニュー
  $(".category-lists").hide();
  $(".header-category").hover(
    function(){
      $(".category-lists").stop().slideToggle();
    }
  );
});