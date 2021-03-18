$(function() {
    'use strict'

    if ($(".select2").length) {
        $(".select2").select2({
            minimumResultsForSearch: Infinity,
        });
    }
    if ($(".select2w").length) {
        $(".select2w").select2();
    }
});