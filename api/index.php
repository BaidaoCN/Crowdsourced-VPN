<?php
require_once '../config.php';
require_once '../Database.php';

use phpseclib3\Net\SSH2;

session_start();
header('Content-Type: application/json');

define('LOG_FILE', 'C:\\XAMPP\\tmp\\vpn_api.log');

// Allowed countries (must match frontend list)
$ALLOWED_COUNTRIES = [
    "Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan",
    "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Burundi",
    "Cabo Verde", "Cambodia", "Cameroon", "Canada", "Central African Republic", "Chad", "Chile", "China", "Colombia", "Comoros", "Congo", "Costa Rica", "Côte d'Ivoire", "Croatia", "Cuba", "Cyprus", "Czech Republic",
    "Denmark", "Djibouti", "Dominica", "Dominican Republic",
    "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Eswatini", "Ethiopia",
    "Fiji", "Finland", "France",
    "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana",
    "Haiti", "Honduras", "Hong Kong, China", "Hungary",
    "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy",
    "Jamaica", "Japan", "Jordan",
    "Kazakhstan", "Kenya", "Kiribati", "Korea, North", "Korea, South", "Kosovo", "Kuwait", "Kyrgyzstan",
    "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg",
    "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar",
    "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Macedonia", "Norway",
    "Oman",
    "Pakistan", "Palau", "Palestine", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal",
    "Qatar",
    "Romania", "Russia", "Rwanda",
    "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Sweden", "Switzerland", "Syria",
    "Taiwan, China", "Tajikistan", "Tanzania", "Thailand", "Timor-Leste", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu",
    "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "Uruguay", "Uzbekistan",
    "Vanuatu", "Vatican City", "Venezuela", "Vietnam",
    "Yemen",
    "Zambia", "Zimbabwe",
    "Macao, China"
];

function isValidCountry($country) {
    global $ALLOWED_COUNTRIES;
    $country = trim($country);
    if (empty($country)) return false;
    $countryLower = strtolower($country);
    foreach ($ALLOWED_COUNTRIES as $allowed) {
        if (strtolower($allowed) === $countryLower) return true;
    }
    return false;
}

function log_post($action, $data, $success = true, $error = null) {
    $entry = [
        'timestamp' => date('Y-m-d H:i:s'),
        'action' => $action,
        'data' => $data,
        'success' => $success,
        'error' => $error
    ];
    file_put_contents(LOG_FILE, json_encode($entry) . PHP_EOL, FILE_APPEND | LOCK_EX);
}

$action = $_GET['action'] ?? '';

// ==================== PUBLIC ACTIONS (no auth) ====================
if ($action === 'login' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    handleLogin();
    exit;
}
if ($action === 'logout' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    adminLogout();
    exit;
}
if ($action === 'routers' && $_SERVER['REQUEST_METHOD'] === 'GET') {
    getRouters();
    exit;
}
if ($action === 'request_credentials' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    requestCredentials();
    exit;
}
if ($action === 'report_status' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    reportStatus();
    exit;
}
if ($action === 'submit_router' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    submitRouter();
    exit;
}
if ($action === 'send_message' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    sendMessage();
    exit;
}
if ($action === 'download_config' && $_SERVER['REQUEST_METHOD'] === 'GET') {
    downloadConfig();
    exit;
}

if ($action === 'download_agent_script' && $_SERVER['REQUEST_METHOD'] === 'GET') {
    downloadAgentScript();
    exit;
}

// ==================== ADMIN ACTIONS (require auth) ====================
adminAuth();

if ($action === 'list_routers_admin' && $_SERVER['REQUEST_METHOD'] === 'GET') {
    listRoutersAdmin();
} elseif ($action === 'add_router' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    addRouter();
} elseif ($action === 'update_router' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    updateRouter();
} elseif ($action === 'delete_router' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    deleteRouter();
} elseif ($action === 'list_pending_routers' && $_SERVER['REQUEST_METHOD'] === 'GET') {
    listPendingRouters();
} elseif ($action === 'list_denied_routers' && $_SERVER['REQUEST_METHOD'] === 'GET') {
    listDeniedRouters();
} elseif ($action === 'list_approved_routers' && $_SERVER['REQUEST_METHOD'] === 'GET') {
    listApprovedRouters();
} elseif ($action === 'approve_router' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    approveRouter();
} elseif ($action === 'deny_router' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    denyRouter();
} elseif ($action === 'approve_denied_router' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    approveDeniedRouter();
} elseif ($action === 'delete_pending_router' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    deletePendingRouter();
} elseif ($action === 'clear_all_submissions' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    clearAllSubmissions();
} elseif ($action === 'count_pending_routers' && $_SERVER['REQUEST_METHOD'] === 'GET') {
    countPendingRouters();
} elseif ($action === 'list_messages' && $_SERVER['REQUEST_METHOD'] === 'GET') {
    listMessages();
} elseif ($action === 'mark_message_read' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    markMessageRead();
} elseif ($action === 'delete_message' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    deleteMessage();
} elseif ($action === 'delete_all_messages' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    deleteAllMessages();
} elseif ($action === 'count_unread_messages' && $_SERVER['REQUEST_METHOD'] === 'GET') {
    countUnreadMessages();
} elseif ($action === 'list_access_logs' && $_SERVER['REQUEST_METHOD'] === 'GET') {
    listAccessLogs();
} elseif ($action === 'delete_all_access_logs' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    deleteAllAccessLogs();
} else {
    http_response_code(404);
    echo json_encode(['error' => 'Invalid action']);
}

// ==================== AUTH FUNCTIONS ====================
function handleLogin() {
    $input = json_decode(file_get_contents('php://input'), true);
    if ($input && isset($input['username'], $input['password']) &&
        $input['username'] === ADMIN_USERNAME && $input['password'] === ADMIN_PASSWORD) {
        $_SESSION['admin_logged_in'] = true;
        $_SESSION['last_activity'] = time();
        echo json_encode(['success' => true]);
    } else {
        http_response_code(401);
        echo json_encode(['error' => 'Invalid credentials']);
    }
}

function adminLogout() {
    session_unset();
    session_destroy();
    echo json_encode(['success' => true]);
}

function adminAuth() {
    if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
        http_response_code(401);
        echo json_encode(['error' => 'Unauthorized']);
        exit;
    }
    if (isset($_SESSION['last_activity']) && (time() - $_SESSION['last_activity'] > SESSION_LIFETIME)) {
        session_unset();
        session_destroy();
        http_response_code(401);
        echo json_encode(['error' => 'Session expired']);
        exit;
    }
    $_SESSION['last_activity'] = time();
}

// ==================== PUBLIC ENDPOINTS ====================
function getRouters() {
    $db = Database::getInstance()->getConnection();
    $stmt = $db->query("
        SELECT r.id, r.name, r.country, 
               CASE WHEN r.last_seen > NOW() - INTERVAL 60 SECOND THEN r.current_speed_mbps ELSE 0 END as current_speed_mbps,
               CASE WHEN r.last_seen > NOW() - INTERVAL 60 SECOND AND r.is_online = 1 THEN 1 ELSE 0 END as is_online,
               r.openvpn_port,
               r.last_seen,
               (SELECT MAX(assigned_at) FROM access_logs WHERE router_id = r.id) as last_requested_at
        FROM routers r
    ");
    $routers = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($routers);
}

function requestCredentials() {
    $input = json_decode(file_get_contents('php://input'), true);
    $router_id = $input['router_id'] ?? 0;
    log_post('request_credentials', ['router_id' => $router_id]);
    if (!$router_id) {
        http_response_code(400);
        echo json_encode(['error' => 'router_id required']);
        return;
    }
    $db = Database::getInstance()->getConnection();
    $stmt = $db->prepare("SELECT id, ip_address, ssh_port, ssh_password FROM routers WHERE id = ?");
    $stmt->execute([$router_id]);
    $router = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$router) {
        http_response_code(404);
        echo json_encode(['error' => 'Router not found']);
        return;
    }
    $username = 'vpn_' . bin2hex(random_bytes(6));
    $password = bin2hex(random_bytes(12));
    $cred_line = "$username $password\n";
    try {
        $ssh = new SSH2($router['ip_address'], $router['ssh_port']);
        if (!$ssh->login('root', $router['ssh_password'])) {
            throw new Exception('SSH login failed');
        }
        $ssh->exec("echo " . escapeshellarg($cred_line) . " > " . ROUTER_CRED_FILE);
        $ssh->exec(OPENVPN_RESTART_CMD);
        $ssh->disconnect();
    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode(['error' => 'SSH connection failed', 'details' => $e->getMessage()]);
        log_post('request_credentials', ['router_id' => $router_id], false, $e->getMessage());
        return;
    }
    $log_stmt = $db->prepare("INSERT INTO access_logs (router_id, username) VALUES (?, ?)");
    $log_stmt->execute([$router_id, $username]);
    echo json_encode([
        'success' => true,
        'username' => $username,
        'password' => $password,
        'server_ip' => $router['ip_address'],
        'port' => 1194
    ]);
    log_post('request_credentials', ['router_id' => $router_id, 'username' => $username], true);
}

function reportStatus() {
    $input = json_decode(file_get_contents('php://input'), true);
    $router_id = $input['router_id'] ?? null;
    $speed = $input['speed_mbps'] ?? null;
    $online = $input['online'] ?? null;
    log_post('report_status', ['router_id' => $router_id, 'speed_mbps' => $speed, 'online' => $online]);
    if (!isset($router_id, $speed, $online)) {
        http_response_code(400);
        echo json_encode(['error' => 'Missing fields']);
        return;
    }
    $db = Database::getInstance()->getConnection();
    $stmt = $db->prepare("UPDATE routers SET current_speed_mbps = ?, is_online = ?, last_seen = NOW() WHERE id = ?");
    $stmt->execute([$speed, intval($online), intval($router_id)]);
    echo json_encode(['success' => true]);
}

function submitRouter() {
    if ($_SERVER['CONTENT_TYPE'] === 'application/json') {
        $input = json_decode(file_get_contents('php://input'), true);
        $name = $input['name'] ?? '';
        $country = $input['country'] ?? '';
        $ip_address = $input['ip_address'] ?? '';
        $ssh_port = $input['ssh_port'] ?? 22;
        $openvpn_port = $input['openvpn_port'] ?? 1194;
        $ssh_password = $input['ssh_password'] ?? '';
        $client_config = $input['client_config'] ?? null;
        if ($client_config) $client_config = base64_decode($client_config);
    } else {
        $name = $_POST['name'] ?? '';
        $country = $_POST['country'] ?? '';
        $ip_address = $_POST['ip_address'] ?? '';
        $ssh_port = $_POST['ssh_port'] ?? 22;
        $openvpn_port = $_POST['openvpn_port'] ?? 1194;
        $ssh_password = $_POST['ssh_password'] ?? '';
        $client_config = null;
        if (isset($_FILES['client_config']) && $_FILES['client_config']['error'] === UPLOAD_ERR_OK) {
            $client_config = file_get_contents($_FILES['client_config']['tmp_name']);
        }
    }
    if (empty($name) || empty($country) || empty($ip_address) || empty($ssh_password)) {
        http_response_code(400);
        echo json_encode(['error' => 'Missing required fields']);
        return;
    }
    if (!isValidCountry($country)) {
        http_response_code(400);
        echo json_encode(['error' => 'Invalid country/region. Please select from the allowed list.']);
        return;
    }
    $db = Database::getInstance()->getConnection();
    $stmt = $db->prepare("INSERT INTO pending_routers (name, country, ip_address, ssh_port, openvpn_port, ssh_password, client_config) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute([$name, $country, $ip_address, $ssh_port, $openvpn_port, $ssh_password, $client_config]);
    echo json_encode(['success' => true, 'message' => 'Router submitted for approval']);
}

function sendMessage() {
    $input = json_decode(file_get_contents('php://input'), true);
    $name = trim($input['name'] ?? '');
    $email = trim($input['email'] ?? '');
    $message = trim($input['message'] ?? '');
    if (empty($name) || empty($message)) {
        http_response_code(400);
        echo json_encode(['error' => 'Name and message are required']);
        return;
    }
    $db = Database::getInstance()->getConnection();
    $stmt = $db->prepare("INSERT INTO messages (name, email, message) VALUES (?, ?, ?)");
    $stmt->execute([$name, $email, $message]);
    echo json_encode(['success' => true, 'message' => 'Message sent. Thank you!']);
}

function downloadConfig() {
    $router_id = $_GET['router_id'] ?? 0;
    if (!$router_id) {
        http_response_code(400);
        echo "Router ID required";
        exit;
    }
    $db = Database::getInstance()->getConnection();
    $stmt = $db->prepare("SELECT client_config, name FROM routers WHERE id = ?");
    $stmt->execute([$router_id]);
    $router = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$router || empty($router['client_config'])) {
        http_response_code(404);
        echo "Configuration not found";
        exit;
    }
    $filename = "vpn_{$router['name']}.ovpn";
    header('Content-Type: application/x-openvpn-profile');
    header('Content-Disposition: attachment; filename="' . $filename . '"');
    echo $router['client_config'];
}

function downloadAgentScript() {
    $baseUrl = rtrim(SERVER_BASE_URL, '/');
    $script = <<<EOF
#!/bin/sh
API_URL="{$baseUrl}/api/index.php?action=report_status"
ROUTER_ID=1   # CHANGE THIS to match the ID in the database after approval
INTERFACE="tun0"

get_speed() {
    if [ -d "/sys/class/net/\$INTERFACE" ]; then
        RX1=\$(cat /sys/class/net/\$INTERFACE/statistics/rx_bytes)
        TX1=\$(cat /sys/class/net/\$INTERFACE/statistics/tx_bytes)
        sleep 1
        RX2=\$(cat /sys/class/net/\$INTERFACE/statistics/rx_bytes)
        TX2=\$(cat /sys/class/net/\$INTERFACE/statistics/tx_bytes)
        RX_RATE=\$(( (\$RX2 - \$RX1) * 8 / 1 / 1000000 ))
        TX_RATE=\$(( (\$TX2 - \$TX1) * 8 / 1 / 1000000 ))
        echo \$((\$RX_RATE + \$TX_RATE))
    else
        echo 0
    fi
}

if pgrep openvpn > /dev/null; then
    ONLINE=1
    SPEED=\$(get_speed)
else
    ONLINE=0
    SPEED=0
fi

curl -s -m 2 -X POST "\$API_URL" -H "Content-Type: application/json" -d "{\"router_id\":\$ROUTER_ID,\"speed_mbps\":\$SPEED,\"online\":\$ONLINE}" > /dev/null 2>&1
exit 0
EOF;
    header('Content-Type: text/plain');
    header('Content-Disposition: attachment; filename="vpn_report.sh"');
    echo $script;
}

// ==================== ADMIN ENDPOINTS ====================
function listRoutersAdmin() {
    $db = Database::getInstance()->getConnection();
    $stmt = $db->query("
        SELECT id, name, country, ip_address, ssh_port, openvpn_port, ssh_password, 
               is_online, 
               current_speed_mbps, 
               last_seen, 
               created_at, 
               (client_config IS NOT NULL) as has_config,
               CASE WHEN last_seen > NOW() - INTERVAL 60 SECOND THEN 1 ELSE 0 END as effective_online
        FROM routers
    ");
    $routers = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($routers);
}

function addRouter() {
    if ($_SERVER['CONTENT_TYPE'] === 'application/json') {
        $input = json_decode(file_get_contents('php://input'), true);
        $name = $input['name'] ?? '';
        $country = $input['country'] ?? '';
        $ip_address = $input['ip_address'] ?? '';
        $ssh_port = $input['ssh_port'] ?? 22;
        $openvpn_port = $input['openvpn_port'] ?? 1194;
        $ssh_password = $input['ssh_password'] ?? '';
        $client_config = $input['client_config'] ?? null;
        if ($client_config) $client_config = base64_decode($client_config);
    } else {
        $name = $_POST['name'] ?? '';
        $country = $_POST['country'] ?? '';
        $ip_address = $_POST['ip_address'] ?? '';
        $ssh_port = $_POST['ssh_port'] ?? 22;
        $openvpn_port = $_POST['openvpn_port'] ?? 1194;
        $ssh_password = $_POST['ssh_password'] ?? '';
        $client_config = null;
        if (isset($_FILES['client_config']) && $_FILES['client_config']['error'] === UPLOAD_ERR_OK) {
            $client_config = file_get_contents($_FILES['client_config']['tmp_name']);
        }
    }
    if (empty($name) || empty($country) || empty($ip_address) || empty($ssh_password)) {
        http_response_code(400);
        echo json_encode(['error' => 'Missing required fields']);
        return;
    }
    if (!isValidCountry($country)) {
        http_response_code(400);
        echo json_encode(['error' => 'Invalid country/region. Please select from the allowed list.']);
        return;
    }
    $db = Database::getInstance()->getConnection();
    $stmt = $db->prepare("INSERT INTO routers (name, country, ip_address, ssh_port, openvpn_port, ssh_password, client_config) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute([$name, $country, $ip_address, $ssh_port, $openvpn_port, $ssh_password, $client_config]);
    echo json_encode(['success' => true, 'id' => $db->lastInsertId()]);
}

function updateRouter() {
    if ($_SERVER['CONTENT_TYPE'] === 'application/json') {
        $input = json_decode(file_get_contents('php://input'), true);
        $id = $input['id'] ?? 0;
        $updates = [];
        $params = [];
        foreach (['name', 'country', 'ip_address', 'ssh_port', 'openvpn_port', 'ssh_password'] as $field) {
            if (isset($input[$field])) {
                $updates[] = "$field = ?";
                $params[] = $input[$field];
            }
        }
        if (isset($input['client_config'])) {
            $updates[] = "client_config = ?";
            $params[] = base64_decode($input['client_config']);
        }
        if (empty($updates)) {
            http_response_code(400);
            echo json_encode(['error' => 'No fields to update']);
            return;
        }
        $params[] = $id;
        $sql = "UPDATE routers SET " . implode(', ', $updates) . " WHERE id = ?";
        $db = Database::getInstance()->getConnection();
        $stmt = $db->prepare($sql);
        $stmt->execute($params);
        echo json_encode(['success' => true]);
    } else {
        $id = $_POST['id'] ?? 0;
        if (!$id) {
            http_response_code(400);
            echo json_encode(['error' => 'Router id required']);
            return;
        }
        $db = Database::getInstance()->getConnection();
        $fields = [];
        $params = [];
        foreach (['name', 'country', 'ip_address', 'ssh_port', 'openvpn_port', 'ssh_password'] as $field) {
            if (isset($_POST[$field])) {
                $fields[] = "$field = ?";
                $params[] = $_POST[$field];
            }
        }
        if (isset($_FILES['client_config']) && $_FILES['client_config']['error'] === UPLOAD_ERR_OK) {
            $fields[] = "client_config = ?";
            $params[] = file_get_contents($_FILES['client_config']['tmp_name']);
        }
        if (empty($fields)) {
            http_response_code(400);
            echo json_encode(['error' => 'No fields to update']);
            return;
        }
        $params[] = $id;
        $sql = "UPDATE routers SET " . implode(', ', $fields) . " WHERE id = ?";
        $stmt = $db->prepare($sql);
        $stmt->execute($params);
        echo json_encode(['success' => true]);
    }
}

function deleteRouter() {
    $input = json_decode(file_get_contents('php://input'), true);
    $id = $input['id'] ?? 0;
    if (!$id) {
        http_response_code(400);
        echo json_encode(['error' => 'ID required']);
        return;
    }
    $db = Database::getInstance()->getConnection();
    $stmt = $db->prepare("DELETE FROM routers WHERE id = ?");
    $stmt->execute([$id]);
    echo json_encode(['success' => true]);
}

// ==================== PENDING ROUTERS ADMIN ====================
function listPendingRouters() {
    $db = Database::getInstance()->getConnection();
    $stmt = $db->query("SELECT id, name, country, ip_address, ssh_port, openvpn_port, submitted_at FROM pending_routers WHERE status = 'pending'");
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
}

function listDeniedRouters() {
    $db = Database::getInstance()->getConnection();
    $stmt = $db->query("SELECT id, name, country, ip_address, ssh_port, openvpn_port, submitted_at, denied_at FROM pending_routers WHERE status = 'denied'");
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
}

function listApprovedRouters() {
    $db = Database::getInstance()->getConnection();
    $stmt = $db->query("SELECT id, name, country, ip_address, ssh_port, openvpn_port, submitted_at, approved_at FROM pending_routers WHERE status = 'approved' ORDER BY approved_at DESC");
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
}

function approveRouter() {
    $input = json_decode(file_get_contents('php://input'), true);
    $pending_id = $input['id'] ?? 0;
    if (!$pending_id) {
        http_response_code(400);
        echo json_encode(['error' => 'ID required']);
        return;
    }
    $db = Database::getInstance()->getConnection();
    $stmt = $db->prepare("SELECT * FROM pending_routers WHERE id = ? AND status = 'pending'");
    $stmt->execute([$pending_id]);
    $pending = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$pending) {
        http_response_code(404);
        echo json_encode(['error' => 'Pending router not found']);
        return;
    }
    $insert = $db->prepare("INSERT INTO routers (name, country, ip_address, ssh_port, openvpn_port, ssh_password, client_config) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $insert->execute([$pending['name'], $pending['country'], $pending['ip_address'], $pending['ssh_port'], $pending['openvpn_port'], $pending['ssh_password'], $pending['client_config']]);
    $update = $db->prepare("UPDATE pending_routers SET status = 'approved', approved_at = NOW() WHERE id = ?");
    $update->execute([$pending_id]);
    echo json_encode(['success' => true]);
}

function denyRouter() {
    $input = json_decode(file_get_contents('php://input'), true);
    $pending_id = $input['id'] ?? 0;
    if (!$pending_id) {
        http_response_code(400);
        echo json_encode(['error' => 'ID required']);
        return;
    }
    $db = Database::getInstance()->getConnection();
    $update = $db->prepare("UPDATE pending_routers SET status = 'denied', denied_at = NOW() WHERE id = ?");
    $update->execute([$pending_id]);
    echo json_encode(['success' => true]);
}

function approveDeniedRouter() {
    $input = json_decode(file_get_contents('php://input'), true);
    $pending_id = $input['id'] ?? 0;
    if (!$pending_id) {
        http_response_code(400);
        echo json_encode(['error' => 'ID required']);
        return;
    }
    $db = Database::getInstance()->getConnection();
    $stmt = $db->prepare("SELECT * FROM pending_routers WHERE id = ? AND status = 'denied'");
    $stmt->execute([$pending_id]);
    $pending = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$pending) {
        http_response_code(404);
        echo json_encode(['error' => 'Denied router not found']);
        return;
    }
    $insert = $db->prepare("INSERT INTO routers (name, country, ip_address, ssh_port, openvpn_port, ssh_password, client_config) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $insert->execute([$pending['name'], $pending['country'], $pending['ip_address'], $pending['ssh_port'], $pending['openvpn_port'], $pending['ssh_password'], $pending['client_config']]);
    $update = $db->prepare("UPDATE pending_routers SET status = 'approved', approved_at = NOW() WHERE id = ?");
    $update->execute([$pending_id]);
    echo json_encode(['success' => true]);
}

function deletePendingRouter() {
    $input = json_decode(file_get_contents('php://input'), true);
    $id = $input['id'] ?? 0;
    if (!$id) {
        http_response_code(400);
        echo json_encode(['error' => 'ID required']);
        return;
    }
    $db = Database::getInstance()->getConnection();
    $stmt = $db->prepare("DELETE FROM pending_routers WHERE id = ?");
    $stmt->execute([$id]);
    echo json_encode(['success' => true]);
}

function clearAllSubmissions() {
    $db = Database::getInstance()->getConnection();
    $stmt = $db->prepare("DELETE FROM pending_routers");
    $stmt->execute();
    echo json_encode(['success' => true, 'deleted' => $stmt->rowCount()]);
}

function countPendingRouters() {
    $db = Database::getInstance()->getConnection();
    $stmt = $db->query("SELECT COUNT(*) as count FROM pending_routers WHERE status = 'pending'");
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    echo json_encode(['count' => (int)$row['count']]);
}

// ==================== MESSAGES ADMIN ====================
function listMessages() {
    $db = Database::getInstance()->getConnection();
    $stmt = $db->query("SELECT * FROM messages ORDER BY created_at DESC");
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
}

function markMessageRead() {
    $input = json_decode(file_get_contents('php://input'), true);
    $id = $input['id'] ?? 0;
    if (!$id) {
        http_response_code(400);
        echo json_encode(['error' => 'ID required']);
        return;
    }
    $db = Database::getInstance()->getConnection();
    $stmt = $db->prepare("UPDATE messages SET is_read = 1 WHERE id = ?");
    $stmt->execute([$id]);
    echo json_encode(['success' => true]);
}

function deleteMessage() {
    $input = json_decode(file_get_contents('php://input'), true);
    $id = $input['id'] ?? 0;
    if (!$id) {
        http_response_code(400);
        echo json_encode(['error' => 'ID required']);
        return;
    }
    $db = Database::getInstance()->getConnection();
    $stmt = $db->prepare("DELETE FROM messages WHERE id = ?");
    $stmt->execute([$id]);
    echo json_encode(['success' => true]);
}

function deleteAllMessages() {
    $db = Database::getInstance()->getConnection();
    $stmt = $db->prepare("DELETE FROM messages");
    $stmt->execute();
    echo json_encode(['success' => true, 'deleted' => $stmt->rowCount()]);
}

function countUnreadMessages() {
    $db = Database::getInstance()->getConnection();
    $stmt = $db->query("SELECT COUNT(*) as count FROM messages WHERE is_read = 0");
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    echo json_encode(['count' => (int)$row['count']]);
}

// ==================== ACCESS LOGS ADMIN ====================
function listAccessLogs() {
    $router_id = isset($_GET['router_id']) ? intval($_GET['router_id']) : 0;
    $db = Database::getInstance()->getConnection();
    if ($router_id > 0) {
        $stmt = $db->prepare("SELECT a.*, r.name as router_name FROM access_logs a JOIN routers r ON a.router_id = r.id WHERE a.router_id = ? ORDER BY a.assigned_at DESC");
        $stmt->execute([$router_id]);
    } else {
        $stmt = $db->query("SELECT a.*, r.name as router_name FROM access_logs a JOIN routers r ON a.router_id = r.id ORDER BY a.assigned_at DESC");
    }
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
}

function deleteAllAccessLogs() {
    $db = Database::getInstance()->getConnection();
    $stmt = $db->prepare("DELETE FROM access_logs");
    $stmt->execute();
    echo json_encode(['success' => true, 'deleted' => $stmt->rowCount()]);
}
?>