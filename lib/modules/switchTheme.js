$(function switchTheme() {
    $(document).on('click', 'a[component="header/switchtheme/dark"]', function (e) {
        console.log("test switch dark");
        const $body = document.querySelector('body'); 
        $body.classList.add('dark');
        $body.classList.remove('light');
        document.querySelector('.is-light').classList.add('is-dark');
        document.querySelector('.is-light').classList.remove('is-light');
        socket.emit('plugins.cryptofrv2.saveTheme', { theme: 'dark' });
    });
    $(document).on('click', 'a[component="header/switchtheme/light"]', function (e) {
        console.log("test switch light");
        const $body = document.querySelector('body'); 
        $body.classList.add('light');
        $body.classList.remove('dark');
        document.querySelector('.is-dark').classList.add('is-light');
        document.querySelector('.is-dark').classList.add('is-dark');
        socket.emit('plugins.cryptofrv2.saveTheme', { theme: 'light' });
    });
});