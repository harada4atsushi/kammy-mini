@order_new =
  hoge: ->
    alert('hoge')

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

###




      }

renderCatalogFavorited = ->
  $("#catalog_favorited .catalog-list > .ui-grid-a").html('');

  catalog_favorites = JSON.parse(localStorage.getItem('favorites'))
  #console.log(catalog_favorites)
  #catalog_favorites = JSON.parse(localStorage.getItem('favorites'))
  #console.log(catalog_favorites.length)
  catalog_favorites ||= {}

  i = 0
  for photoId, favPoints of catalog_favorites
    console.log(photoId)
    blockMark = if i % 2 == 0 then 'a' else 'b'
    $div = $("<div class='ui-block-#{blockMark} catalog-list-item #{photo.category}'></div>")
    $a = $('<a href="#detail_favorited" class="ui-btn"></a>')
    $img = $("<img src='#{photoId}' alt='#{photo.alt}' style='width:100%;' />")

    $a.click ->
      photoSrc = $(this).find('img').attr('src')
      photoAlt = $(this).find('img').attr('alt')
      params = { photoID: photoSrc, photoComment: photoAlt }
      $('#detail_favorited').data('params', params);

    $a.append($img)
    $div.append($a)
    $("#catalog_favorited .catalog-list > .ui-grid-a").append($div)

    i++

clearCatalogFavorited = ->
  $("#catalog_favorited .catalog-list > .ui-grid-a").empty()

$ ->
  renderCatalogFavorited()
  $("#catalog_favorited").on 'pageshow', ->
    clearCatalogFavorited()
    renderCatalogFavorited()
###

$ ->
  console.log('order_new on reqdy')

  $("#order_new").on 'pageshow', ->
    console.log('order_new')
    #order_new.hoge()
    order_new.renderFavImages()
