<?php
// Load server configuration
require_once 'config.php';
$serverBaseUrl = rtrim(SERVER_BASE_URL, '/');
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>🤝 Become a Contributor – Crowdsourced VPN</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background: #f5f5f5; }
        .container { max-width: 1000px; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .back-link { display: inline-block; margin-bottom: 20px; color: #007bff; text-decoration: none; }
        .guide-section, .form-section { margin: 30px 0; }
        pre { background: #f4f4f4; padding: 10px; border-radius: 5px; overflow-x: auto; font-size: 13px; }
        code { background: #f4f4f4; padding: 2px 5px; border-radius: 3px; }
        input, textarea, select { display: block; width: 100%; max-width: 500px; margin: 5px 0 15px; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
        button { background: #28a745; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        .message { margin-top: 10px; font-weight: bold; }
        hr { margin: 20px 0; }
        .contact-form { background: #e9f7ef; padding: 15px; border-radius: 8px; margin-top: 20px; }
        h2, h3 { color: #333; }
        .note { background: #fff3cd; padding: 10px; border-left: 4px solid #ffc107; margin: 15px 0; }
    </style>
</head>
<body>
<div class="container">
    <a href="index.html" class="back-link">← Back to Main Page</a>
    <h1>🤝 Become a Contributor</h1>
    <p>Help grow the decentralized VPN network by sharing your spare bandwidth. Follow the detailed guide below to set up your router as a VPN node, then submit your router details for approval.</p>

    <div class="guide-section">
        <h2>📘 Complete Setup Guide for OpenWRT Router</h2>
        
        <div class="note">
            <strong>Before you start:</strong> You need a router that is <strong>compatible with OpenWRT</strong>, basic command line knowledge, and a public IP address (or port forwarding) for OpenVPN (UDP 1194) and SSH (TCP 22) so the central server can reach your router. <strong>Set a strong root password</strong> for SSH – you will need to submit this password to us.
        </div>

        <h3>1. Install OpenWRT and basic OpenVPN server</h3>
        <p>Follow the official OpenWRT documentation step by step:</p>
        <ol>
            <li><strong>Check if your device is supported</strong> – <a href="https://openwrt.org/supported_devices" target="_blank">OpenWRT Table of Hardware</a> (look for your router model).</li>
            <li><strong>Install OpenWRT</strong> – follow the <a href="https://openwrt.org/docs/guide-quick-start/start" target="_blank">Quick Start Guide</a> for your device.</li>
            <li><strong>Set up an OpenVPN server</strong> – follow the official <a href="https://openwrt.org/docs/guide-user/services/vpn/openvpn/server" target="_blank">OpenWRT OpenVPN server documentation</a> to get a basic server running.</li>
        </ol>
        <p>After you have a working OpenVPN server (with certificates, etc.), continue with the <strong>tailor‑made adjustments</strong> below to enable username/password authentication and single‑client mode.</p>

        <h3>2. Establish SSH connection to your router</h3>
        <p>Use an SSH client like <a href="https://www.putty.org/" target="_blank">PuTTY</a> (Windows) or the terminal (Linux/macOS). Connect as root using the password you set:</p>
        <pre><code>ssh root@your-router-ip</code></pre>

        <h3>3. Backup current configuration</h3>
        <pre><code>cp /etc/config/openvpn /etc/config/openvpn.bak
cp /etc/openvpn/server.conf /etc/openvpn/server.conf.bak</code></pre>

        <h3>4. Edit server.conf to add authentication and max-clients</h3>
        <p>Open the file with <code>vi</code> (or <code>nano</code> if installed):</p>
        <pre><code>vi /etc/openvpn/server.conf</code></pre>
        <p>Add these lines <strong>after <code>port 1194</code></strong> (or anywhere before <code>&lt;dh&gt;</code>):</p>
        <pre><code>max-clients 1
script-security 3
auth-user-pass-verify /etc/openvpn/verify.sh via-env
client-cert-not-required</code></pre>
        <p>Save and exit (<code>Esc</code> then <code>:wq</code> in vi).</p>
        <p>Verify the lines are present:</p>
        <pre><code>grep -E "max-clients|script-security|auth-user-pass-verify|client-cert-not-required" /etc/openvpn/server.conf</code></pre>

        <h3>5. Create the authentication verification script</h3>
        <pre><code>cat > /etc/openvpn/verify.sh << 'EOF'
#!/bin/sh
CRED_FILE="/etc/openvpn/credentials.txt"

[ -f "$CRED_FILE" ] || exit 1

read USER PASS < "$CRED_FILE"

if [ "$username" = "$USER" ] && [ "$password" = "$PASS" ]; then
    exit 0
else
    exit 1
fi
EOF</code></pre>
        <p>Make it executable and set proper ownership:</p>
        <pre><code>chmod 755 /etc/openvpn/verify.sh
chown nobody:nogroup /etc/openvpn/verify.sh
chmod 750 /etc/openvpn/verify.sh</code></pre>

        <h3>6. Create initial credentials file</h3>
        <pre><code>echo "tempuser temppass" > /etc/openvpn/credentials.txt
chown nobody:nogroup /etc/openvpn/credentials.txt
chmod 640 /etc/openvpn/credentials.txt</code></pre>

        <h3>7. Override script-security if necessary</h3>
        <p>Some OpenWRT init scripts force <code>--script-security 2</code>. To ensure it uses level 3:</p>
        <pre><code>uci set openvpn.@openvpn[0].script_security=3   # replace [0] with your instance name
uci commit openvpn</code></pre>
        <p>Check if the init script overrides:</p>
        <pre><code>cat /etc/init.d/openvpn | grep -i "script-security"
grep -r "script-security" /etc/default/openvpn /etc/openvpn/</code></pre>
        <p>If you see a hardcoded <code>--script-security 2</code>, edit <code>/etc/init.d/openvpn</code> and change the <code>2</code> to <code>3</code>.</p>

        <h3>8. Prepare the client configuration file (for users)</h3>
        <p>You need to upload a <code>.ovpn</code> file for your router. The easiest way is to use the client configuration generated by OpenWRT’s OpenVPN setup. Here’s how:</p>
        <ul>
            <li>After completing the official OpenVPN server setup (step 1), OpenWRT usually creates a client configuration file. You can find it at <code>/etc/openvpn/client.ovpn</code> (or similar).</li>
            <li><strong>Backup this file</strong> and then edit it. Add the following lines (if not already present):</li>
        </ul>
        <pre><code>auth-user-pass
auth-nocache</code></pre>
        <p>Also, <strong>change the <code>remote</code> line</strong> to point to your own public domain name or fixed IP address:</p>
        <pre><code>remote your-domain-or-ip 1194</code></pre>
        <p>Example of a complete minimal config:</p>
        <pre><code>client
dev tun
proto udp
remote myvpn.example.com 1194
resolv-retry infinite
nobind
auth-user-pass
auth-nocache
remote-cert-tls server</code></pre>
        <p><strong>Important:</strong> After editing, <strong>test the configuration file</strong> on a client machine using the initial credentials <code>tempuser</code> / <code>temppass</code> <em>before you submit the router</em>. This ensures the file works correctly and the server is reachable.</p>

		<h3>9. Install the router agent script (reports status to central server)</h3>
		<p>The agent script tells our server whether your router is online and its current speed.</p>
		<p><strong>Option A (recommended – download directly on the router):</strong> Run the following command (the server URL is automatically inserted):</p>
		<pre><code>wget -O /root/vpn_report.sh "<?php echo $serverBaseUrl; ?>/api/index.php?action=download_agent_script"</code></pre>
		<p><strong>Option B (manual creation):</strong> If you cannot use <code>wget</code>, create the script manually using <code>cat</code>. Run:</p>
		<pre><code>cat > /root/vpn_report.sh << 'EOF'
#!/bin/sh
API_URL="<?php echo $serverBaseUrl; ?>/api/index.php?action=report_status"
ROUTER_ID=1   # CHANGE THIS to match the ID in the database after approval
INTERFACE="tun0"

get_speed() {
    if [ -d "/sys/class/net/$INTERFACE" ]; then
        RX1=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
        TX1=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
        sleep 1
        RX2=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
        TX2=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
        RX_RATE=$(( (RX2 - RX1) * 8 / 1 / 1000000 ))
        TX_RATE=$(( (TX2 - TX1) * 8 / 1 / 1000000 ))
        echo $((RX_RATE + TX_RATE))
    else
        echo 0
    fi
}

if pgrep openvpn > /dev/null; then
    ONLINE=1
    SPEED=$(get_speed)
else
    ONLINE=0
    SPEED=0
fi

curl -s -m 2 -X POST "$API_URL" -H "Content-Type: application/json" -d "{\"router_id\":$ROUTER_ID,\"speed_mbps\":$SPEED,\"online\":$ONLINE}" > /dev/null 2>&1
exit 0
EOF</code></pre>
		<p>After obtaining the script (using either method), you must change the <code>ROUTER_ID</code> inside it. Open the file:</p>
		<pre><code>vi /root/vpn_report.sh</code></pre>
		<p>Find the line <code>ROUTER_ID=1</code> and change it to the ID that will be assigned after your router is approved. For testing, you can leave it as <code>1</code>.</p>
		<p>Make the script executable:</p>
		<pre><code>chmod +x /root/vpn_report.sh</code></pre>
		<p>Install <code>curl</code> if missing:</p>
		<pre><code>opkg update && opkg install curl</code></pre>
		<p>Set up cron to run every 5 seconds (add 12 lines to crontab):</p>
		<pre><code>crontab -e</code></pre>
		<p>Add the following 12 lines:</p>
		<pre><code>* * * * * /root/vpn_report.sh
* * * * * sleep 5; /root/vpn_report.sh
* * * * * sleep 10; /root/vpn_report.sh
* * * * * sleep 15; /root/vpn_report.sh
* * * * * sleep 20; /root/vpn_report.sh
* * * * * sleep 25; /root/vpn_report.sh
* * * * * sleep 30; /root/vpn_report.sh
* * * * * sleep 35; /root/vpn_report.sh
* * * * * sleep 40; /root/vpn_report.sh
* * * * * sleep 45; /root/vpn_report.sh
* * * * * sleep 50; /root/vpn_report.sh
* * * * * sleep 55; /root/vpn_report.sh</code></pre>
<p>Enable and start cron:</p>
<pre><code>/etc/init.d/cron enable
/etc/init.d/cron start</code></pre>

        <h3>10. Restart OpenVPN and verify</h3>
        <pre><code>/etc/init.d/openvpn restart
sleep 2
/etc/init.d/openvpn status
logread -e openvpn | tail -20</code></pre>
        <p>You should see <code>Initialization Sequence Completed</code>.</p>

        <h3>11. Final steps</h3>
        <p>Ensure your router's firewall allows incoming UDP 1194 (OpenVPN) and TCP 22 (SSH). Then <strong>submit your router details using the form below</strong>. After admin approval, your node will appear in the public list.</p>
        <div class="note">
            <strong>⚠️ If your router stays “offline” after submission:</strong> Double‑check every step – especially that OpenVPN is running (<code>pgrep openvpn</code> should show a PID), that the agent script is running (check <code>/tmp/vpn_report.log</code> if you added logging), and that the server can reach your router (test with <code>curl</code>). If you still cannot resolve it, leave a message using the contact form below – the administrator will help you.
        </div>
    </div>

    <hr>

    <div class="form-section">
        <h2>📝 Submit Your Router for Approval</h2>
        <form id="submitForm" enctype="multipart/form-data">
            <input type="text" name="name" placeholder="Router Name (e.g., 'Home Node')" required>
            <input type="text" name="country" list="countries" placeholder="Country or Region" required>
            <datalist id="countries"></datalist>
            <input type="text" name="ip_address" placeholder="Domain Name or IP Address (e.g., vpn.example.com or 1.2.3.4)" required>
            <input type="number" name="ssh_port" placeholder="SSH Port (default 22)" value="22">
            <input type="number" name="openvpn_port" placeholder="OpenVPN Port (default 1194)" value="1194">
            <input type="password" name="ssh_password" placeholder="SSH Password (root)" required>
            <input type="file" name="client_config" accept=".ovpn,.conf" title="Upload OpenVPN client config (optional)">
            <button type="submit">🚀 Submit for Approval</button>
        </form>
        <div id="submitMessage" class="message"></div>
    </div>

    <div class="contact-form">
        <h3>💬 Need help? Contact the administrator</h3>
        <p>If you encounter difficulties setting up your router, please send a message below. The admin will respond via email (if provided).</p>
        <form id="contactForm">
            <input type="text" id="contactName" placeholder="Your name" required>
            <input type="email" id="contactEmail" placeholder="Your email (optional)">
            <textarea id="contactMessage" rows="4" placeholder="Describe your issue or question..." required></textarea>
            <button type="submit">Send Message</button>
        </form>
        <div id="contactMessageResult" class="message"></div>
    </div>
</div>

<script>
    // Predefined allowed countries (including Hong Kong, China; Macao, China; Taiwan, China)
    const allowedCountries = [
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

    // Populate country datalist
    const datalist = document.getElementById('countries');
    allowedCountries.forEach(country => {
        const option = document.createElement('option');
        option.value = country;
        datalist.appendChild(option);
    });

    // Router submission form
    document.getElementById('submitForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const countryInput = document.querySelector('input[name="country"]');
        const country = countryInput.value.trim();
        const isValid = allowedCountries.some(c => c.toLowerCase() === country.toLowerCase());
        if (!isValid) {
            document.getElementById('submitMessage').innerHTML = '<span style="color:red;">❌ Error: Please select a valid country/region from the list.</span>';
            return;
        }
        const formData = new FormData(this);
        fetch('/api/index.php?action=submit_router', {
            method: 'POST',
            body: formData
        })
        .then(res => res.json())
        .then(data => {
            const msgDiv = document.getElementById('submitMessage');
            if (data.success) {
                msgDiv.innerHTML = '<span style="color:green;">✅ ' + data.message + '</span>';
                this.reset();
            } else {
                msgDiv.innerHTML = '<span style="color:red;">❌ Error: ' + (data.error || 'Unknown') + '</span>';
            }
        })
        .catch(err => {
            document.getElementById('submitMessage').innerHTML = '<span style="color:red;">❌ Submission failed: ' + err + '</span>';
        });
    });

    // Contact form
    document.getElementById('contactForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const name = document.getElementById('contactName').value.trim();
        const email = document.getElementById('contactEmail').value.trim();
        const message = document.getElementById('contactMessage').value.trim();
        if (!name || !message) {
            document.getElementById('contactMessageResult').innerHTML = '<span style="color:red;">Please fill in your name and message.</span>';
            return;
        }
        fetch('/api/index.php?action=send_message', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ name, email, message })
        })
        .then(res => res.json())
        .then(data => {
            const msgDiv = document.getElementById('contactMessageResult');
            if (data.success) {
                msgDiv.innerHTML = '<span style="color:green;">✅ ' + data.message + '</span>';
                document.getElementById('contactName').value = '';
                document.getElementById('contactEmail').value = '';
                document.getElementById('contactMessage').value = '';
            } else {
                msgDiv.innerHTML = '<span style="color:red;">❌ Error: ' + (data.error || 'Unknown') + '</span>';
            }
        })
        .catch(err => {
            document.getElementById('contactMessageResult').innerHTML = '<span style="color:red;">❌ Failed to send message.</span>';
        });
    });
</script>
</body>
</html>