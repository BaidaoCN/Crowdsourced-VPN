<?php
// Database Connection
define('DB_HOST', 'localhost');
define('DB_NAME', 'vpn_platform');
define('DB_USER', 'crowdsourcedvpn_user');
define('DB_PASS', '1234%^&*ab');

// For SSH Command Support
require_once __DIR__ . '/vendor/autoload.php';

define('SSH_KEY_PATH', '/var/www/.ssh/id_rsa'); // private key for SSH, not used currently
define('SSH_KEY_PASS', ''); // if key has passphrase, not used currenty

// Router Credential Template (they will be overwritten per request)
define('ROUTER_CRED_FILE', '/etc/openvpn/credentials.txt');
define('OPENVPN_RESTART_CMD', '/etc/init.d/openvpn restart');

// Bbase URL
define('SERVER_BASE_URL', 'http://192.168.1.122');
define('API_BASE_URL', 'http://192.168.1.122/api');

// Admin Portal Credential
define('ADMIN_USERNAME', 'admin');
define('ADMIN_PASSWORD', '1234%^&*ab');

// Session Timeout
define('SESSION_LIFETIME', 1800); // 30 minutes
?>