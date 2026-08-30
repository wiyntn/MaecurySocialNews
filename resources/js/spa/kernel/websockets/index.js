import Echo from 'laravel-echo';
import Pusher from 'pusher-js';

window.ColibriBRConnected = false;
window.Pusher = Pusher;
window.Echo = Echo;

const pusherKey = import.meta.env.VITE_PUSHER_APP_KEY;
const pusherCluster = import.meta.env.VITE_PUSHER_APP_CLUSTER;

console.log('Pusher Key:', pusherKey);
console.log('Pusher Cluster:', pusherCluster);

try {
    if (!pusherKey) {
        throw new Error('VITE_PUSHER_APP_KEY is missing.');
    }

    window.ColibriBRD = new Echo({
        broadcaster: 'pusher',
        key: pusherKey,
        cluster: pusherCluster,
        forceTLS: true,
        enabledTransports: ['ws', 'wss'],
    });

    window.ColibriBRD.connector.pusher.connection.bind(
        'connected',
        () => {
            console.log('📶 Websockets connection is established.');
            window.ColibriBRConnected = true;
        }
    );

    window.ColibriBRD.connector.pusher.connection.bind(
        'error',
        (error) => {
            console.error('❌ Pusher connection error:', error);
        }
    );

} catch (error) {
    console.error('❌ Websocket initialization error:', error);
}