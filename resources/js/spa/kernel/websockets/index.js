import Echo from 'laravel-echo';
import Pusher from 'pusher-js';

window.ColibriBRConnected = false;
window.Pusher = Pusher;
window.Echo = Echo;

Pusher.logToConsole =
    import.meta.env.VITE_PUSHER_DEBUG_CONSOLE === 'true';

try {
    window.ColibriBRD = new Echo({
        broadcaster: 'pusher',

        key: import.meta.env.VITE_PUSHER_APP_KEY,

        cluster: import.meta.env.VITE_PUSHER_APP_CLUSTER,

        forceTLS: true,

        enabledTransports: ['ws', 'wss'],
    });

    window.ColibriBRD.connector.pusher.connection.bind(
        'connected',
        function () {
            console.log('📶 Websockets connection is established.');

            window.ColibriBRConnected = true;
        }
    );

    window.ColibriBRD.connector.pusher.connection.bind(
        'error',
        function (error) {
            console.error('❌ Pusher connection error:', error);
        }
    );

} catch (error) {
    console.error('❌ Websocket initialization error:', error);
}