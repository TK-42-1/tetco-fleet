//= require jquery
//= require jquery_ujs

$(function() {
  $("#vehicles th a, #vehicles .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#vehicles_search input").keyup(function() {
    $.get($("#vehicles_search").attr("action"), $("#vehicles_search").serialize(), null, "script");
    return false;
  });
});