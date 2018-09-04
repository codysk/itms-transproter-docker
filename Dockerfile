FROM java:8-jre
MAINTAINER me@iskywind.com

COPY ./ /home/iTMSTransporter_installer_linux/
RUN { \
	apt update; \
	apt install -y sudo expect; \
	cd /home/iTMSTransporter_installer_linux/; \
	chmod +x iTMSTransporter_installer_linux_1.10.0.sh; \
	expect install.expect; \
	ln -s /usr/local/itms/bin/iTMSTransporter /usr/bin/iTMSTransporter; \
}

