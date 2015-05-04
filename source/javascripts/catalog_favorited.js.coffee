renderCatalogFavorited = ->
  catalog_favorites = JSON.parse(localStorage.getItem('favorites'))
  #console.log(catalog_favorites)
  #catalog_favorites = JSON.parse(localStorage.getItem('favorites'))
  #console.log(catalog_favorites.length)
  catalog_favorites ||= {}

  i = 0
  for photoId, favPoints of catalog_favorites
    console.log(photoId)
    blockMark = if i % 2 == 0 then 'a' else 'b'
    $div = $("<div class='ui-block-#{blockMark}'></div>")
    $a = $('<a href="#detail_favorited" class="ui-btn"></a>')
    $img = $("<img src='#{photoId}' style='width:100%;' />")

    $a.click ->
      photoSrc = $(this).find('img').attr('src')
      params = { photoID: photoSrc }
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
