"use strict";

console.log('vote')

$(function() {
    $(document).on('click', 'a.upvote', function(e) {
        alert('Clicked')
    });
});