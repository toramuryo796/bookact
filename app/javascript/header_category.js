$(function () {
  // カテゴリー開閉メニュー
  $(".category-lists").hide();
  $(".header-category").click(
    function(){
      $(".category-lists").slideToggle(200);
    }
  );
});