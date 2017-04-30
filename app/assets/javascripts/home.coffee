# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


document.addEventListener 'turbolinks:load', ->

  navBar = document.querySelector('#nav')
  window.addEventListener 'scroll', (e) ->
    if window.pageYOffset > 300
      navBar.classList.remove 'startnav'
      navBar.classList.add 'fixnav'
    else
      navBar.classList.remove 'fixnav'
      navBar.classList.add 'startnav'
    return
  return
