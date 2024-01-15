#!/bin/bash

# Establecer permisos de ejecución para el script
if [ ! -x "$0" ]; then
    echo "Dando permisos de ejecución al script..."
    chmod +x "$0"
    echo "Permisos de ejecución concedidos."
fi

# Actualizamos la máquina
sudo apt-get update
sudo apt-get upgrade -y


# Step 1: Install Tomcat
sudo useradd -m -d /opt/tomcat -U -s /bin/false tomcat
sudo apt-get install openjdk-17-jdk -y
sudo apt-get install gradle -y
sudo apt install default-jdk -y


# tomcat file download to /tmp
sudo wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.18/bin/apache-tomcat-10.1.18.tar.gz -P /tmp

# tomcat file extraction
sudo tar xzvf /tmp/apache-tomcat-10*tar.gz -C /opt/tomcat --strip-components=1

# set ownership to the tomcat user
sudo chown -R tomcat:tomcat /opt/tomcat/

# give execute permissions to the tomcat binaries
sudo chmod -R u+x /opt/tomcat/bin

# Step 2: Configure Admin Users

sudo tee /opt/tomcat/conf/tomcat-users.xml <<EOF
<role rolename="manager-gui" />
<user username="manager" password="manager_password" roles="manager-gui" />

<role rolename="admin-gui" />
<user username="admin" password="admin_password" roles="manager-gui,admin-gui" />
EOF


sudo sed -i 's|<Valve|#<Valve|' /opt/tomcat/webapps/manager/META-INF/context.xml

# Step 3: Create systemd service

sudo tee /etc/systemd/system/tomcat.service <<EOF
[Unit]
Description=Tomcat
After=network.target

[Service]
Type=forking
User=tomcat
Group=tomcat

Environment="JAVA_HOME=${JAVA_HOME_PATH}"
Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom"
Environment="CATALINA_BASE=/opt/tomcat"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# reiniciamos daemon

sudo systemctl daemon-reload

# iniciamos tomcat
sudo systemctl start tomcat

# Habilitamos tomcat
sudo systemctl enable tomcat

# Step 4: Allow traffic to port 8080
sudo ufw allow 8080

echo "Tomcat installation and configuration completed!"
echo "You can access Tomcat at: http://your_server_ip:8080"