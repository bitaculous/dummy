# This is the manifest for `bundle.js`.

#= require polyfills/console

#= require jquery

#= require_self

$ ->
  console.log 'Dummy initialized.'

  return