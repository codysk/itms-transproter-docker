FROM java:8-jre
MAINTAINER me@iskywind.com

COPY ./ /home/iTMSTransporter_installer_linux/
RUN { \
	apt update; \
	apt install -y sudo expect nginx; \
	cd /home/iTMSTransporter_installer_linux/; \
	chmod +x iTMSTransporter_installer_linux_1.10.0.sh; \
	expect install.expect; \
	cp cert.crt /etc/nginx; \
	cp privkey.key /etc/nginx; \
	cp fake.conf /etc/nginx/conf.d; \
	expect cert.expect; \
	mv /usr/local/itms/bin/iTMSTransporter /usr/local/itms/bin/iTMSTransporter_orig; \
	echo "#!/bin/sh\necho \"127.0.0.1 contentdelivery.itunes.apple.com\" >> /etc/hosts\nnginx\n/usr/local/itms/bin/iTMSTransporter_orig \$@\n" >> /usr/local/itms/bin/iTMSTransporter; \
	chmod +x /usr/local/itms/bin/iTMSTransporter; \
}

