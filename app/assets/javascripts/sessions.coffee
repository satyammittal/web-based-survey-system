# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.button-checkbox').each ->
    $widget = $(this)
    $button = $widget.find('button')
    $checkbox = $widget.find('input:checkbox')
    color = $button.data('color')
    settings = 
      on: icon: 'glyphicon glyphicon-check'
      off: icon: 'glyphicon glyphicon-unchecked'

    updateDisplay = ->
      isChecked = $checkbox.is(':checked')
      # Set the button's state
      $button.data 'state', if isChecked then 'on' else 'off'
      # Set the button's icon
      $button.find('.state-icon').removeClass().addClass 'state-icon ' + settings[$button.data('state')].icon
      # Update the button's color
      if isChecked
        $button.removeClass('btn-default').addClass 'btn-' + color + ' active'
      else
        $button.removeClass('btn-' + color + ' active').addClass 'btn-default'
      return

    init = ->
      updateDisplay()
      # Inject the icon if applicable
      if $button.find('.state-icon').length == 0
        $button.prepend '<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> '
      return

    $button.on 'click', ->
      $checkbox.prop 'checked', !$checkbox.is(':checked')
      $checkbox.triggerHandler 'change'
      updateDisplay()
      return
    $checkbox.on 'change', ->
      updateDisplay()
      return
    init()
    return
  return
