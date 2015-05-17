@order_new =
  # スライダーにお気に入り画像を描画する
  renderFavImages: ->
    $('#order_new .photo-items-area').empty();
    #detail_favorited.photoIds = [];

    $divPhotoItems = $("<div class='photo-items'></div>")
    $divPhotoItems.slick(
      infinite: false,
      slidesToShow: 2,
    )
    $('#order_new .photo-items-area').append($divPhotoItems)

    catalogFavorites = JSON.parse(localStorage.getItem('favorites'))
    catalogFavorites ||= {}

    for key, value of catalogFavorites
      console.log(key, ':', value)
      $div = $("<div id='relative-area' class='photo-image' style='position:relative;height:220px;'></div>");
      $img = $("<img src='#{key}' style='width:100%;position:absolute;' class='photo-img' />");
      $div.append($img);

      favPoints = value['favoritePoints']
      for favPoint in favPoints
        order_new.prot($div, favPoint)

      $divPhotoItems.slick('slickAdd', $div);
      #detail_favorited.photoIds.push(key);


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

  order: ->
    orders = JSON.parse(localStorage.getItem('orders'))
    orders ||= []

    console.log()

    orders.push(
      slide1: $('#order_new .slide1').val(),
      slide2: $('#order_new .slide2').val(),
      slide3: $('#order_new .slide3').val(),
      "frizzy-hair": $('#order_new #frizzy-hair').val(),
      "diff-perm": $('#order_new #diff-perm').val(),
      "spread-hair": $('#order_new #spread-hair').val(),
      "failue": $('#order_new #failue').val(),
    )

    localStorage.setItem('orders', JSON.stringify(orders));

    #// 次回表示用にクリアする
    #favoriteEdit.favoritePoints = [];
    #favoriteEdit.clearFavPoint();
    #$( "#favorite_edit #photo" ).attr( "src", '');
    #photoId = null;

$ ->
  # 期待したブロックが開けないためコメントアウト
  #$("#order_new #atmos-button").on 'tap', ->
  #  $("#order_new #feature-area").collapsible("expand")

  #$("#order_new #feature-button").on 'tap', ->
      #$("#order_new #failue-area").collapsible("expand")

  $('#order_new #order').on 'tap', order_new.order

  $("#order_new").on 'pageshow', ->
    console.log('order_new')
    #order_new.renderFavImages()
