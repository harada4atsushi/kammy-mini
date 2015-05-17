@ordering =
  # スライダーにお気に入り画像を描画する
  renderFavImages: ->
    $('#ordering .photo-items-area').empty();
    #detail_favorited.photoIds = [];

    $divPhotoItems = $("<div class='photo-items'></div>")
    $divPhotoItems.slick(
      infinite: false,
      slidesToShow: 2,
    )
    $('#ordering .photo-items-area').append($divPhotoItems)

    catalogFavorites = JSON.parse(localStorage.getItem('favorites'))
    catalogFavorites ||= {}

    for key, value of catalogFavorites
      console.log(key, ':', value)
      $div = $("<div id='relative-area' class='photo-image' style='position:relative;height:220px;'></div>");
      $img = $("<img src='#{key}' style='width:100%;position:absolute;' class='photo-img' />");
      $div.append($img);

      favPoints = value['favoritePoints'] || []
      for favPoint in favPoints
        ordering.prot($div, favPoint)

      $divPhotoItems.slick('slickAdd', $div);


  # お気に入りポイントをプロットする
  prot: ($photoArea, favPoint) ->
    $divObj = $("<div></div>")
    $divObj.css('width', 30)
    $divObj.css('height', 30)
    $divObj.css('border', 'solid 2px red')
    $divObj.css('position', 'absolute')
    $divObj.addClass('fav-point')
    $divObj.offset({top: favPoint.offsetTop / 2 , left: favPoint.offsetLeft / 2})
    $photoArea.append($divObj)

  # 前画面の入力値を画面にセットする
  setValues: ->
    orders = JSON.parse(localStorage.getItem('orders'))
    orders ||= []

    console.log(orders)
    order = orders[orders.length - 1]

    $('#ordering .slide1').val(order.slide1).slider("refresh")
    $('#ordering .slide2').val(order.slide2).slider("refresh")
    $('#ordering .slide3').val(order.slide3).slider("refresh")
    $('#ordering #frizzy-hair').val(order["frizzy-hair"]).slider("refresh")
    $('#ordering #diff-perm').val(order["diff-perm"]).slider("refresh")
    $('#ordering #spread-hair').val(order["spread-hair"]).slider("refresh")
    $('#ordering .failue').html(order["failue"])

###
    #// 次回表示用にクリアする
    #favoriteEdit.favoritePoints = [];
    #favoriteEdit.clearFavPoint();
    #$( "#favorite_edit #photo" ).attr( "src", '');
    #photoId = null;
###

$ ->
  $("#ordering").on 'pageshow', ->
    console.log('ordering pageshow')
    ordering.renderFavImages()
    ordering.setValues()

  #$('#ordering #order').on 'tap', ordering.order
