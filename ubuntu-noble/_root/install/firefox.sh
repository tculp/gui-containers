add-apt-repository -y ppa:mozillateam/ppa

echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001

Package: firefox
Pin: version 1:1snap*
Pin-Priority: -1
' > /etc/apt/preferences.d/mozilla-firefox

apt install -y firefox
