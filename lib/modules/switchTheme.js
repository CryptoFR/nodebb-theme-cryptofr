$(function switchTheme() {
    $(document).on('click', 'a[component="header/switchtheme/dark"]', function (e) {
        console.log("test switch dark");
        const $body = document.querySelector('body'); 
        $body.classList.add('dark');
        $body.classList.remove('light');
        document.querySelector('.switch-dark').add('hidden');
        document.querySelector('.switch-light').remove('hidden');
        socket.emit('plugins.cryptofrv2.saveTheme', { theme: 'dark', isdark: 'true' });
    });
    $(document).on('click', 'a[component="header/switchtheme/light"]', function (e) {
        console.log("test switch light");
        const $body = document.querySelector('body'); 
        $body.classList.add('light');
        $body.classList.remove('dark');
        document.querySelector('.switch-dark').remove('hidden');
        document.querySelector('.switch-light').add('hidden');
        socket.emit('plugins.cryptofrv2.saveTheme', { theme: 'light', isdark: 'false' });
    });
});