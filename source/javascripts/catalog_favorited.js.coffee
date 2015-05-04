renderCatalogFavorited = ->
  for photo, i in photos
    blockMark = if i % 2 == 0 then 'a' else 'b'
    $div = $("<div class='ui-block-#{blockMark}'></div>")
    $a = $('<a href="#detail_favorited" class="ui-btn"></a>')
    $img = $("<img src='#{photo.id}' style='width:100%;' />")

    $a.click ->
      photoSrc = $(this).find('img').attr('src')
      params = { photoID: photoSrc }
      $('#detail_favorited').data('params', params);

    $a.append($img)
    $div.append($a)
    $("#catalog_favorited .catalog-list > .ui-grid-a").append($div)

$ ->
  renderCatalogFavorited()
  $("#catalog_favorited").on 'pageshow', renderCatalogFavorited
