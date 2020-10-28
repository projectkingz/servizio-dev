/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require_tree
//= require cocoon
//= require bulma-extensions
//= require dropzone

require("raty-js")
window.Noty = require("noty");
window.Dropzone =  require("dropzone");

$(document).on('turbolinks:load', () => {
    $('.toggle').on('click', (e) => {
    e.stopPropagation();
    e.preventDefault();
    $('#' + e.target.getAttribute('aria-controls')).toggleClass('is-hidden');
  })
})

require("trix")
// require("@rails/actiontext")
require("rails/actiontext")
require("jquery-countdown")
require("uk_postcode")

//window.BulmaCarousel = require("bulma-extensions/bulma-carousel/dist/js/bulma-carousel")
//
// $(document).on('turbolinks:load', function(event) {
//
//   $('form').on('click', '.remove_record', function(event){
//     $(this).prev('input[type=hidden]').val('1');
//     $(this).closest('tr').hide();
//     return event.preventDefault();
//   })
//
//   $('form').on('click', '.add_fields', function(event) {
//     var regexp, time;
//     time = new Date().getTime();
//     regexp = new RegExp($(this).data('id'), 'g');
//     $('fields').append($(this).data('fields').replace(regexp, time));
//     return event.preventDefault();
//   })
// })
//
//
// $(document).('turbolinks:load', () => {
//     $('.toggle').on('click', (e) => {
//     e.stopPropagation();
//     e.preventDefault();
//     $('#' + e.target.getAttribute('aria-controls')).toggleClass('is-hidden');
//   })
// })
//
//
// $(document).ready(() => {
//   $('.toggle').on('click', (e) => {
//     e.stopPropagation();
//     e.preventDefault();
//     $('#' + e.target.getAttribute('aria-controls')).toggleClass('is-hidden');
//   })
// })
