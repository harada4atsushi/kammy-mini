saveFavorite = ->
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
    @photoId = params.photoID
    $('#detail .photo-img').attr('src', params.photoID)
