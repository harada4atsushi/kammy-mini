renderCatalog = ->
  $("#catalog .catalog-list > .ui-grid-a").html('')

  photoExcepted = []
  for photo in photos
    # 対象外リストに存在する画像をフィルタリングする
    if jQuery.inArray(photo.url, excpept) < 0
      photoExcepted.push(photo)

  for photo, i in photoExcepted
    blockMark = if i % 2 == 0 then 'a' else 'b'
    #$div = $("<div class='ui-block-#{blockMark} catalog-list-item #{photo.category}'>#{photo.url}</div>")
    $div = $("<div class='ui-block-#{blockMark} catalog-list-item #{photo.category}'></div>")
    $a = $('<a href="#detail" class="ui-btn"></a>')
    $img = $("<img src='#{photo.id}' alt='#{photo.alt}' style='width:100%;' />")

    $a.click ->
      photoSrc = $(this).find('img').attr('src')
      photoAlt = $(this).find('img').attr('alt')
      params = { photoID: photoSrc, photoComment: photoAlt }
      $('#detail').data('params', params);

    $a.append($img)
    $div.append($a)
    $("#catalog .catalog-list > .ui-grid-a").append($div)

clearCatalogFavorited = ->
  $("#catalog .catalog-list > .ui-grid-a").empty()

$ ->
  renderCatalog()
  $("#catalog").on 'pageshow', ->
    clearCatalogFavorited()
    renderCatalog()

excpept = [
  'http://imgbp.hotp.jp/IMGDB_HD/72/58/B005437258/B005437258_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/37/69/B005773769/B005773769_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/20/80/B004162080/B004162080_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/76/26/B003917626/B003917626_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/49/82/B007524982/B007524982_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/38/96/B004513896/B004513896_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/85/87/B006998587/B006998587_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/71/90/B007287190/B007287190_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/28/32/B006842832/B006842832_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/92/02/B006489202/B006489202_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/52/56/B007225256/B007225256_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/85/70/B004338570/B004338570_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/50/11/B005975011/B005975011_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/55/32/B006565532/B006565532_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/07/90/B006240790/B006240790_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/07/92/B006240792/B006240792_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/75/38/B002347538/B002347538_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/04/21/B004960421/B004960421_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/87/21/B002968721/B002968721_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/90/93/B007279093/B007279093_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/66/75/B007186675/B007186675_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/67/06/B007186706/B007186706_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/81/13/B007538113/B007538113_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/74/74/B007497474/B007497474_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/45/94/B006244594/B006244594_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/26/44/B004052644/B004052644_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/61/17/B005396117/B005396117_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/36/77/B001073677/B001073677_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/42/50/B005994250/B005994250_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/35/81/B006103581/B006103581_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/99/79/B007539979/B007539979_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/99/82/B007539982/B007539982_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/66/87/B005756687/B005756687_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/49/01/B006854901/B006854901_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/71/22/B007207122/B007207122_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/91/80/B004889180/B004889180_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/44/34/B005244434/B005244434_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/51/20/B004405120/B004405120_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/65/19/B006766519/B006766519_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/26/08/B007492608/B007492608_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/46/04/B007134604/B007134604_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/56/16/B004445616/B004445616_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/46/56/B005754656/B005754656_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/48/90/B006844890/B006844890_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/37/96/B007063796/B007063796_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/67/43/B005426743/B005426743_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/81/35/B006858135/B006858135_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/19/93/B007031993/B007031993_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/73/64/B007467364/B007467364_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/13/61/B006931361/B006931361_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/13/59/B006931359/B006931359_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/07/28/B004150728/B004150728_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/33/83/B006263383/B006263383_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/31/17/B006343117/B006343117_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/57/81/B006565781/B006565781_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/61/34/B005896134/B005896134_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/41/16/B004424116/B004424116_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/51/81/B002375181/B002375181_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/61/68/B002536168/B002536168_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/16/32/B006511632/B006511632_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/81/99/B004048199/B004048199_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/13/65/B007201365/B007201365_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/40/50/B005404050/B005404050_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/68/96/B006806896/B006806896_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/68/80/B006806880/B006806880_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/69/73/B006806973/B006806973_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/83/33/B005768333/B005768333_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/41/64/B005734164/B005734164_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/58/99/B005725899/B005725899_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/95/60/B003129560/B003129560_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/29/54/B007082954/B007082954_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/07/28/B004150728/B004150728_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/64/55/B007536455/B007536455_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/64/61/B007536461/B007536461_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/19/62/B007091962/B007091962_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/19/79/B007091979/B007091979_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/11/79/B004041179/B004041179_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/91/20/B006869120/B006869120_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/56/23/B006565623/B006565623_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/73/28/B004157328/B004157328_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/62/92/B004036292/B004036292_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/50/35/B006845035/B006845035_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/50/29/B006845029/B006845029_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/50/31/B006845031/B006845031_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/36/55/B007063655/B007063655_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/60/07/B007106007/B007106007_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/92/05/B003919205/B003919205_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/92/44/B003919244/B003919244_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/15/90/B007541590/B007541590_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/58/52/B006855852/B006855852_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/45/40/B006834540/B006834540_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/28/85/B005342885/B005342885_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/63/39/B005966339/B005966339_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/07/28/B004150728/B004150728_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/26/31/B007012631/B007012631_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/53/20/B002635320/B002635320_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/26/23/B003882623/B003882623_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/10/75/B006511075/B006511075_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/10/76/B006511076/B006511076_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/84/45/B006508445/B006508445_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/11/15/B006511115/B006511115_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/78/90/B007067890/B007067890_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/69/63/B007206963/B007206963_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/52/18/B004005218/B004005218_262-349.jpg',
  'http://imgbp.hotp.jp/IMGDB_HD/48/42/B006274842/B006274842_262-349.jpg',
]
