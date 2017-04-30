# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# has to listen for the turolinks to be loaded not the doc to be ready because turbolinks does not reload the page and the code would only work on refresh otherwise then it makes the nav bar fixed at a certain point on the page.

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
