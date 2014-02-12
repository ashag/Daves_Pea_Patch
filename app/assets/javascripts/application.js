// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


//Activate Tabs
$('#tab a').click(function (e) {
    e.preventDefault()
    $(this).tab('show')
})

$('#tab li:eq(0) a').tab('show') // Select first tab
$('#tab li:eq(1) a').tab('show') // Select second tab
$('#tab li:eq(2) a').tab('show') // Select third tab
$('#tab li:eq(3) a').tab('show') // Select fourth tab

$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    e.target // activated tab
    e.relatedTarget // previous tab
})
