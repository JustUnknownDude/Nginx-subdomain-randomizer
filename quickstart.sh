#!/bin/bash
apt update && apt install -y nginx
echo syb1000 > /sub
cat <<EOF > /random.sh
#!/bin/bash
oldsub=$(cat /sub)
sub=$(echo sub$((RANDOM)))
echo $sub > /sub
sed -i -r "s/$oldsub/$sub/g" /etc/nginx/conf.d/all.conf;
sleep 1s; 
service nginx restart
EOF
chmod +x /random.sh
rm /etc/nginx/conf.d/default.conf >> /dev/null
rm /etc/nginx/sites-available/default.conf >> /dev/null
cat <<EOF > /etc/nginx/conf.d/all.conf
server {
set_real_ip_from 173.245.48.0/20;
set_real_ip_from 103.21.244.0/22;
set_real_ip_from 103.22.200.0/22;
set_real_ip_from 103.31.4.0/22;
set_real_ip_from 141.101.64.0/18;
set_real_ip_from 108.162.192.0/18;
set_real_ip_from 190.93.240.0/20;
set_real_ip_from 188.114.96.0/20;
set_real_ip_from 197.234.240.0/22;
set_real_ip_from 198.41.128.0/17;
set_real_ip_from 162.158.0.0/15;
set_real_ip_from 104.16.0.0/13;
set_real_ip_from 104.24.0.0/14;
set_real_ip_from 172.64.0.0/13;
set_real_ip_from 131.0.72.0/22;
real_ip_header X-Forwarded-For;
real_ip_recursive on;
    listen 80 default_server;
    include /etc/nginx/bots.conf;
    set $subdomain sub1000;
    server_name  _;
    listen [::]:80;
    location /fref/ {
      rewrite ^/fref/(.*)$ /$1;
	    return 301 http://$subdomain.$host$uri;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
      proxy_set_header Host $http_host;
      proxy_set_header X-Forwarded-Host $server_name;
      proxy_set_header Connection "";
      real_ip_header X-Forwarded-For;
      real_ip_recursive on;
    }
    location / {
    root /var/www/html;
    }
    }
server {
set_real_ip_from 173.245.48.0/20;
set_real_ip_from 103.21.244.0/22;
set_real_ip_from 103.22.200.0/22;
set_real_ip_from 103.31.4.0/22;
set_real_ip_from 141.101.64.0/18;
set_real_ip_from 108.162.192.0/18;
set_real_ip_from 190.93.240.0/20;
set_real_ip_from 188.114.96.0/20;
set_real_ip_from 197.234.240.0/22;
set_real_ip_from 198.41.128.0/17;
set_real_ip_from 162.158.0.0/15;
set_real_ip_from 104.16.0.0/13;
set_real_ip_from 104.24.0.0/14;
set_real_ip_from 172.64.0.0/13;
set_real_ip_from 131.0.72.0/22;
real_ip_header X-Forwarded-For;
real_ip_recursive on;
listen 80;
server_name ~^(sub1000)\.*.*$;
location / {
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto $scheme;
proxy_set_header Host $http_host;
proxy_set_header X-Forwarded-Host $server_name;
proxy_set_header Connection "";
proxy_redirect     off;
proxy_connect_timeout  300;
proxy_http_version 1.1;
proxy_buffers 16 16k;
proxy_buffer_size 16k;
proxy_cache_background_update on;
proxy_pass http://targetip/;
}
}
EOF
echo "Enter the target server ip. Example: 1.1.1.1"
read target
sed -i -r "s/targetip/$target/g" /etc/nginx/conf.d/all.conf;
cat <<EOF > /etc/nginx/bots.conf
if ($http_user_agent ~* "Aboundex"){ return 403; }
if ($http_user_agent ~* "80legs"){ return 403; }
if ($http_user_agent ~* "360Spider"){ return 403; }
if ($http_user_agent ~* "Cogentbot"){ return 403; }
if ($http_user_agent ~* "Alexibot"){ return 403; }
if ($http_user_agent ~* "asterias"){ return 403; }
if ($http_user_agent ~* "attach"){ return 403; }
if ($http_user_agent ~* "BackDoorBot"){ return 403; }
if ($http_user_agent ~* "BackWeb"){ return 403; }
if ($http_user_agent ~* "Bandit"){ return 403; }
if ($http_user_agent ~* "BatchFTP"){ return 403; }
if ($http_user_agent ~* "Bigfoot"){ return 403; }
if ($http_user_agent ~* "Black.Hole"){ return 403; }
if ($http_user_agent ~* "BlackWidow"){ return 403; }
if ($http_user_agent ~* "BlowFish"){ return 403; }
if ($http_user_agent ~* "BotALot"){ return 403; }
if ($http_user_agent ~* "Buddy"){ return 403; }
if ($http_user_agent ~* "BuiltBotTough"){ return 403; }
if ($http_user_agent ~* "Bullseye"){ return 403; }
if ($http_user_agent ~* "BunnySlippers"){ return 403; }
if ($http_user_agent ~* "Cegbfeieh"){ return 403; }
if ($http_user_agent ~* "CheeseBot"){ return 403; }
if ($http_user_agent ~* "CherryPicker"){ return 403; }
if ($http_user_agent ~* "ChinaClaw"){ return 403; }
if ($http_user_agent ~* "Collector"){ return 403; }
if ($http_user_agent ~* "Copier"){ return 403; }
if ($http_user_agent ~* "CopyRightCheck"){ return 403; }
if ($http_user_agent ~* "cosmos"){ return 403; }
if ($http_user_agent ~* "Crescent"){ return 403; }
if ($http_user_agent ~* "Custo"){ return 403; }
if ($http_user_agent ~* "AIBOT"){ return 403; }
if ($http_user_agent ~* "DISCo"){ return 403; }
if ($http_user_agent ~* "DIIbot"){ return 403; }
if ($http_user_agent ~* "DittoSpyder"){ return 403; }
if ($http_user_agent ~* "Download Demon"){ return 403; }
if ($http_user_agent ~* "Download Devil"){ return 403; }
if ($http_user_agent ~* "Download Wonder"){ return 403; }
if ($http_user_agent ~* "dragonfly"){ return 403; }
if ($http_user_agent ~* "Drip"){ return 403; }
if ($http_user_agent ~* "eCatch"){ return 403; }
if ($http_user_agent ~* "EasyDL"){ return 403; }
if ($http_user_agent ~* "ebingbong"){ return 403; }
if ($http_user_agent ~* "EirGrabber"){ return 403; }
if ($http_user_agent ~* "EmailCollector"){ return 403; }
if ($http_user_agent ~* "EmailSiphon"){ return 403; }
if ($http_user_agent ~* "EmailWolf"){ return 403; }
if ($http_user_agent ~* "EroCrawler"){ return 403; }
if ($http_user_agent ~* "Exabot"){ return 403; }
if ($http_user_agent ~* "Express WebPictures"){ return 403; }
if ($http_user_agent ~* "Extractor"){ return 403; }
if ($http_user_agent ~* "EyeNetIE"){ return 403; }
if ($http_user_agent ~* "Foobot"){ return 403; }
if ($http_user_agent ~* "flunky"){ return 403; }
if ($http_user_agent ~* "FrontPage"){ return 403; }
if ($http_user_agent ~* "Go-Ahead-Got-It"){ return 403; }
if ($http_user_agent ~* "gotit"){ return 403; }
if ($http_user_agent ~* "GrabNet"){ return 403; }
if ($http_user_agent ~* "Grafula"){ return 403; }
if ($http_user_agent ~* "Harvest"){ return 403; }
if ($http_user_agent ~* "hloader"){ return 403; }
if ($http_user_agent ~* "HMView"){ return 403; }
if ($http_user_agent ~* "HTTrack"){ return 403; }
if ($http_user_agent ~* "humanlinks"){ return 403; }
if ($http_user_agent ~* "IlseBot"){ return 403; }
if ($http_user_agent ~* "Image Stripper"){ return 403; }
if ($http_user_agent ~* "Image Sucker"){ return 403; }
if ($http_user_agent ~* "Indy Library"){ return 403; }
if ($http_user_agent ~* "InfoNavibot"){ return 403; }
if ($http_user_agent ~* "InfoTekies"){ return 403; }
if ($http_user_agent ~* "Intelliseek"){ return 403; }
if ($http_user_agent ~* "InterGET"){ return 403; }
if ($http_user_agent ~* "Internet Ninja"){ return 403; }
if ($http_user_agent ~* "Iria"){ return 403; }
if ($http_user_agent ~* "Jakarta"){ return 403; }
if ($http_user_agent ~* "JennyBot"){ return 403; }
if ($http_user_agent ~* "JetCar"){ return 403; }
if ($http_user_agent ~* "JOC"){ return 403; }
if ($http_user_agent ~* "JustView"){ return 403; }
if ($http_user_agent ~* "Jyxobot"){ return 403; }
if ($http_user_agent ~* "Kenjin.Spider"){ return 403; }
if ($http_user_agent ~* "Keyword.Density"){ return 403; }
if ($http_user_agent ~* "larbin"){ return 403; }
if ($http_user_agent ~* "LexiBot"){ return 403; }
if ($http_user_agent ~* "libWeb/clsHTTP"){ return 403; }
if ($http_user_agent ~* "likse"){ return 403; }
if ($http_user_agent ~* "LinkextractorPro"){ return 403; }
if ($http_user_agent ~* "LinkScan/8.1a.Unix"){ return 403; }
if ($http_user_agent ~* "LNSpiderguy"){ return 403; }
if ($http_user_agent ~* "LinkWalker"){ return 403; }
if ($http_user_agent ~* "lwp-trivial"){ return 403; }
if ($http_user_agent ~* "LWP::Simple"){ return 403; }
if ($http_user_agent ~* "Magnet"){ return 403; }
if ($http_user_agent ~* "Mag-Net"){ return 403; }
if ($http_user_agent ~* "MarkWatch"){ return 403; }
if ($http_user_agent ~* "Mass Downloader"){ return 403; }
if ($http_user_agent ~* "Mata.Hari"){ return 403; }
if ($http_user_agent ~* "Microsoft.URL"){ return 403; }
if ($http_user_agent ~* "Microsoft URL Control"){ return 403; }
if ($http_user_agent ~* "MIDown tool"){ return 403; }
if ($http_user_agent ~* "MIIxpc"){ return 403; }
if ($http_user_agent ~* "Mirror"){ return 403; }
if ($http_user_agent ~* "Missigua Locator"){ return 403; }
if ($http_user_agent ~* "Mister PiX"){ return 403; }
if ($http_user_agent ~* "moget"){ return 403; }
if ($http_user_agent ~* "Mozilla/3.Mozilla/2.01"){ return 403; }
if ($http_user_agent ~* "Mozilla.*NEWT"){ return 403; }
if ($http_user_agent ~* "NAMEPROTECT"){ return 403; }
if ($http_user_agent ~* "Navroad"){ return 403; }
if ($http_user_agent ~* "NearSite"){ return 403; }
if ($http_user_agent ~* "NetAnts"){ return 403; }
if ($http_user_agent ~* "Netcraft"){ return 403; }
if ($http_user_agent ~* "NetMechanic"){ return 403; }
if ($http_user_agent ~* "NetSpider"){ return 403; }
if ($http_user_agent ~* "Net Vampire"){ return 403; }
if ($http_user_agent ~* "NetZIP"){ return 403; }
if ($http_user_agent ~* "NextGenSearchBot"){ return 403; }
if ($http_user_agent ~* "NICErsPRO"){ return 403; }
if ($http_user_agent ~* "niki-bot"){ return 403; }
if ($http_user_agent ~* "NimbleCrawler"){ return 403; }
if ($http_user_agent ~* "Ninja"){ return 403; }
if ($http_user_agent ~* "NPbot"){ return 403; }
if ($http_user_agent ~* "Octopus"){ return 403; }
if ($http_user_agent ~* "Offline Explorer"){ return 403; }
if ($http_user_agent ~* "Offline Navigator"){ return 403; }
if ($http_user_agent ~* "Openfind"){ return 403; }
if ($http_user_agent ~* "OutfoxBot"){ return 403; }
if ($http_user_agent ~* "PageGrabber"){ return 403; }
if ($http_user_agent ~* "Papa Foto"){ return 403; }
if ($http_user_agent ~* "pavuk"){ return 403; }
if ($http_user_agent ~* "pcBrowser"){ return 403; }
if ($http_user_agent ~* "PHP version tracker"){ return 403; }
if ($http_user_agent ~* "Pockey"){ return 403; }
if ($http_user_agent ~* "ProPowerBot/2.14"){ return 403; }
if ($http_user_agent ~* "ProWebWalker"){ return 403; }
if ($http_user_agent ~* "psbot"){ return 403; }
if ($http_user_agent ~* "Pump"){ return 403; }
if ($http_user_agent ~* "QueryN.Metasearch"){ return 403; }
if ($http_user_agent ~* "RealDownload"){ return 403; }
if ($http_user_agent ~* "Reaper"){ return 403; }
if ($http_user_agent ~* "Recorder"){ return 403; }
if ($http_user_agent ~* "ReGet"){ return 403; }
if ($http_user_agent ~* "RepoMonkey"){ return 403; }
if ($http_user_agent ~* "Siphon"){ return 403; }
if ($http_user_agent ~* "SiteSnagger"){ return 403; }
if ($http_user_agent ~* "SlySearch"){ return 403; }
if ($http_user_agent ~* "SmartDownload"){ return 403; }
if ($http_user_agent ~* "Snake"){ return 403; }
if ($http_user_agent ~* "Snapbot"){ return 403; }
if ($http_user_agent ~* "Snoopy"){ return 403; }
if ($http_user_agent ~* "sogou"){ return 403; }
if ($http_user_agent ~* "SpaceBison"){ return 403; }
if ($http_user_agent ~* "SpankBot"){ return 403; }
if ($http_user_agent ~* "spanner"){ return 403; }
if ($http_user_agent ~* "Sqworm"){ return 403; }
if ($http_user_agent ~* "Stripper"){ return 403; }
if ($http_user_agent ~* "Sucker"){ return 403; }
if ($http_user_agent ~* "SuperBot"){ return 403; }
if ($http_user_agent ~* "SuperHTTP"){ return 403; }
if ($http_user_agent ~* "Surfbot"){ return 403; }
if ($http_user_agent ~* "suzuran"){ return 403; }
if ($http_user_agent ~* "Szukacz/1.4"){ return 403; }
if ($http_user_agent ~* "tAkeOut"){ return 403; }
if ($http_user_agent ~* "Teleport"){ return 403; }
if ($http_user_agent ~* "Telesoft"){ return 403; }
if ($http_user_agent ~* "TurnitinBot/1.5"){ return 403; }
if ($http_user_agent ~* "The.Intraformant"){ return 403; }
if ($http_user_agent ~* "TheNomad"){ return 403; }
if ($http_user_agent ~* "TightTwatBot"){ return 403; }
if ($http_user_agent ~* "Titan"){ return 403; }
if ($http_user_agent ~* "True_bot"){ return 403; }
if ($http_user_agent ~* "turingos"){ return 403; }
if ($http_user_agent ~* "TurnitinBot"){ return 403; }
if ($http_user_agent ~* "URLy.Warning"){ return 403; }
if ($http_user_agent ~* "Vacuum"){ return 403; }
if ($http_user_agent ~* "VoidEYE"){ return 403; }
if ($http_user_agent ~* "Web Image Collector"){ return 403; }
if ($http_user_agent ~* "Web Sucker"){ return 403; }
if ($http_user_agent ~* "WebAuto"){ return 403; }
if ($http_user_agent ~* "WebBandit"){ return 403; }
if ($http_user_agent ~* "Webclipping.com"){ return 403; }
if ($http_user_agent ~* "WebCopier"){ return 403; }
if ($http_user_agent ~* "WebEnhancer"){ return 403; }
if ($http_user_agent ~* "WebFetch"){ return 403; }
if ($http_user_agent ~* "WebGo IS"){ return 403; }
if ($http_user_agent ~* "Web.Image.Collector"){ return 403; }
if ($http_user_agent ~* "WebLeacher"){ return 403; }
if ($http_user_agent ~* "WebmasterWorldForumBot"){ return 403; }
if ($http_user_agent ~* "WebReaper"){ return 403; }
if ($http_user_agent ~* "WebSauger"){ return 403; }
if ($http_user_agent ~* "Website eXtractor"){ return 403; }
if ($http_user_agent ~* "Website Quester"){ return 403; }
if ($http_user_agent ~* "Webster"){ return 403; }
if ($http_user_agent ~* "WebStripper"){ return 403; }
if ($http_user_agent ~* "WebWhacker"){ return 403; }
if ($http_user_agent ~* "WebZIP"){ return 403; }
if ($http_user_agent ~* "Whacker"){ return 403; }
if ($http_user_agent ~* "Widow"){ return 403; }
if ($http_user_agent ~* "WISENutbot"){ return 403; }
if ($http_user_agent ~* "WWWOFFLE"){ return 403; }
if ($http_user_agent ~* "WWW-Collector-E"){ return 403; }
if ($http_user_agent ~* "Xaldon"){ return 403; }
if ($http_user_agent ~* "Zeus"){ return 403; }
if ($http_user_agent ~* "ZmEu"){ return 403; }
if ($http_user_agent ~* "Zyborg"){ return 403; }
if ($http_user_agent ~* "AhrefsBot"){ return 403; }
if ($http_user_agent ~* "archive.org_bot"){ return 403; }
if ($http_user_agent ~* "bingbot"){ return 403; }
if ($http_user_agent ~* "Wget"){ return 403; }
if ($http_user_agent ~* "Acunetix"){ return 403; }
if ($http_user_agent ~* "FHscan"){ return 403; }
if ($http_user_agent ~* "BLEXBot"){ return 403; }
if ($http_user_agent ~* "MJ12bot"){ return 403; }
if ($http_user_agent ~* "SemrushBot"){ return 403; }
if ($http_user_agent ~* "Baiduspider"){ return 403; }
if ($http_user_agent ~* "Slurp"){ return 403; }
if ($http_user_agent ~* "DotBot"){ return 403; }
if ($http_user_agent ~* "facebook"){ return 403; }
if ($http_user_agent ~* "facebot"){ return 403; }
if ($http_user_agent ~* "Metropolitan branch of OJSC MegaFon"){ return 403; }
if ($http_user_agent ~* "Mobile subscribers pool"){ return 403; }
if ($http_user_agent ~* "Tele2 Russia IP Network(MSK)"){ return 403; }
if ($http_user_agent ~* "MegaFon"){ return 403; }
if ($http_user_agent ~* "OJSC MegaFon"){ return 403; }
if ($http_user_agent ~* "Yota"){ return 403; }
if ($http_user_agent ~* "APIs-Google"){ return 403; }
if ($http_user_agent ~* "Mediapartners-Google"){ return 403; }
if ($http_user_agent ~* "Mozilla/5.0 (Linux; Android 5.0; SM-G920A) AppleWebKit (KHTML, like Gecko) Chrome Mobile Safari (compatible; AdsBot-Google-Mobile; +http://www.google.com/mobile/adsbot.html)"){ return 403; }
if ($http_user_agent ~* "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1 (compatible; AdsBot-Google-Mobile; +http://www.google.com/mobile/adsbot.html)"){ return 403; }
if ($http_user_agent ~* "AdsBot-Google"){ return 403; }
if ($http_user_agent ~* "Googlebot-Image/1.0"){ return 403; }
if ($http_user_agent ~* "Googlebot-News"){ return 403; }
if ($http_user_agent ~* "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"){ return 403; }
if ($http_user_agent ~* "Googlebot/2.1"){ return 403; }
if ($http_user_agent ~* "Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"){ return 403; }
if ($http_user_agent ~* "Mediapartners-Google/2.1; +http://www.google.com/bot.html"){ return 403; }
if ($http_user_agent ~* "AdsBot-Google-Mobile-Apps"){ return 403; }
if ($http_user_agent ~* "facebookexternalhit/1.0"){ return 403; }
if ($http_user_agent ~* "facebookexternalhit/1.1"){ return 403; }
if ($http_user_agent ~* "facebookexternalhit/1.1 (http://www.facebook.com/externalhit_uatext.php)"){ return 403; }
EOF
systemctl start nginx && systemctl start nginx
