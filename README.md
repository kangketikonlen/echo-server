# Laravel Echo Server
A custom Laravel Echo Server for real-time event broadcasting using Socket.IO.

## Features
- Real-time event broadcasting with Socket.IO
- Authentication support for private and presence channels
- Redis support for broadcasting
- Secure WebSocket connections (SSL/TLS support)
- Scalable architecture

## Requirements
- Node.js (>= 14.x)
- Redis (for broadcasting)
- Laravel (>= 8.x)
- Laravel Echo

## Installation

Clone the repository:
```bash
git clone https://github.com/your-username/your-echo-server.git
cd your-echo-server
```

Install dependencies:
```bash
npm install
```

Copy and update the configuration file:
```bash
cp .env.example .env
```

## Configuration
### Environment Variables
Edit the .env file to match your setup:
```.env
PORT=6001
REDIS_HOST=127.0.0.1
REDIS_PORT=6379
APP_KEY=your-app-key
ALLOW_ORIGIN=http://your-domain.com
```

### Laravel Broadcasting Configuration
Update config/broadcasting.php in your Laravel project:
```php
'connections' => [
    'redis' => [
        'driver' => 'redis',
        'connection' => 'default',
        'retry_after' => 90,
    ],
],
```

### Running the Server
Start the Laravel Echo Server:
```bash
npm run start
```

Run it in the background using PM2:
```bash
pm install -g pm2
pm2 start server.js --name="laravel-echo-server"
```

### Client-Side Setup
Install Laravel Echo and Socket.IO client:
```bash
npm install laravel-echo socket.io-client
```

Example JavaScript configuration:
```js
import Echo from 'laravel-echo';
window.io = require('socket.io-client');

window.Echo = new Echo({
    broadcaster: 'socket.io',
    host: 'http://your-echo-server.com:6001'
});
```

### Security Considerations
- Use SSL/TLS for secure WebSocket connections.
- Restrict access with CORS (ALLOW_ORIGIN in .env).
- Use Redis authentication for enhanced security.