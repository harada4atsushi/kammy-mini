saveFavorite = ->
  #alert(photoId)
  #favPhotoIds = localStorage.getItem('favPhotoIds')
  #favPhotoIds ||= []
  #favPhotoIds.push(photoId)
  #localStorage.setItem('favPhotoIds')

  #params = $('#detail').data('params')


$ ->
  #$("#favorite-btn").on "tap", ->
  @photoId = null
  $('#detail').on 'pageshow', ->
    params = $('#detail').data('params')
    #alert(params.photoID)
    @photoId = params.photoID
    $('.photo-img').attr('src', params.photoID)
