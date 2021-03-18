$(function() {
    'use strict';

    if($('#deadline').length) {
        var date = new Date();
        var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
        $('#deadline').datepicker({
            language: 'zh-CN',
            todayHighlight: true,
            format: "yyyy/mm/dd",
            autoclose: true,
            immediateUpdates: true,
            orientation: 'bottom',
            todayBtn: 'linked',
            clearBtn: true,
        });
        $('#deadline').datepicker('setDate', today);
    }

    if($('#finish').length) {
        var date = new Date();
        var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
        $('#finish').datepicker({
            language: 'zh-CN',
            todayHighlight: true,
            format: "yyyy/mm/dd",
            autoclose: true,
            immediateUpdates: true,
            orientation: 'bottom',
            todayBtn: 'linked',
            clearBtn: true,
        });
        $('#finish').datepicker('setDate', today);
    }

});