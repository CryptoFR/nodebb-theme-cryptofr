$(function switchTheme() {
    $(document).on('click', 'a[component="header/switchtheme/dark"]', function (e) {
        console.log('Switch to dark theme')
        const $body = document.querySelector('body'); 
        $body.classList.add('dark');
        $body.classList.remove('light');
        socket.emit('switchtheme', { theme: 'dark' });
    });
    $(document).on('click', 'a[component="header/switchtheme/light"]', function (e) {
        console.log('Switch to light theme');
        const $body = document.querySelector('body'); 
        $body.classList.add('light');
        $body.classList.remove('dark');
        socket.emit('switchtheme', { theme: 'light' });
    });
});