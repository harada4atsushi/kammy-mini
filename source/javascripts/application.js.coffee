//= require vendor/cordova
//= require vendor/fastclick
//= require vendor/jquery-2.0.2
//= require vendor/jquery.mobile-1.4.5.min
//= require catalog
//= require detail
//= require catalog_favorited

@photos = [
  { id: 'images/hairstyles/1.jpg' },
  { id: 'images/hairstyles/2.jpg' },
  { id: 'images/hairstyles/3.jpg' },
  { id: 'images/hairstyles/4.jpg' },
  { id: 'images/hairstyles/5.jpg' },
  { id: 'images/hairstyles/6.jpg' },
  { id: 'images/hairstyles/7.jpg' },
  { id: 'images/hairstyles/8.jpg' },
];

#window.app =
  # Application Constructor
  #initialize: -> @bindEvents()

  # Bind Event Listeners
  #
  # Bind any events that are required on startup. Common events are:
  # 'load', 'deviceready', 'offline', and 'online'.
  #bindEvents: -> document.addEventListener "deviceready", @onDeviceReady, false

  # deviceready Event Handler
  #
  # The scope of 'this' is the event. In order to call the 'receivedEvent'
  # function, we must explicity call 'app.receivedEvent(...)'
  #onDeviceReady: -> app.receivedEvent "deviceready"

  # Update DOM on a Received Event
  #receivedEvent: (id) ->
  #  $("##{id} .listening").css "display", "none"
  #  $("##{id} .received").css "display", "block"

  #  console.log "Received Event: #{id}"

$ ->
  console.log(photos[0].id);
  #FastClick.attach document.body
  #$( "#photo" ).bind "tap", ->
  #  alert('test')

  # localstorage
  #count = localStorage.getItem('count')
  #count ||= 0
  #count++
  #alert(count)
  #localStorage.setItem('count', count)

  #$('#toucharea').bind 'tap', (event) ->
  #  alert('clicked!');
  #  $(this).hide();
  #});

#  $('#photo').bind 'touchstart', (event) ->
#    alert('test')
#    change = event.changedTouches
#    target = event.targetTouches
#    touch = event.touches
#    type = event.type
#    alert(change)
#    alert(target)
#    alert(touch)
#    alert(type)



  #$("#photo" ).click(function( event ) { alert('test'); } )
