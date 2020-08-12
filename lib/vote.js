"use strict";

console.log('vote')

$(function() {
    function postFetch(url, data) {
        return fetch(window.location.protocol + '//' + window.location.host + '/' + url, {
            credentials: 'include',
            headers: { 'Content-Type': 'application/json'},
            body: JSON.stringify(data),
            method: 'POST'
        }).then(res => res.json());
    }
    $(document).on('click', 'a.upvote', async function(e) {
        const mainPid = this.getAttribute('data-main-pid');
        const isUpvote = !this.classList.contains('upvoted');
        const res = await postFetch('cryptofrv2/vote', {
            toPid: mainPid,
            isUpvote
        });
        $(this).toggleClass('upvoted');
    });

    $(document).on('click', 'a.downvote', async function(e) {
        const mainPid = this.getAttribute('data-main-pid');
        const isDownvote = !this.classList.contains('downvoted');
        const res = await postFetch('cryptofrv2/downvote', {
            toPid: mainPid,
            isDownvote
        });
        $(this).toggleClass('downvoted');
    });
});