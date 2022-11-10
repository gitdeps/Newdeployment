echo "This works only for Frontend Deployment"

read -p "Enter the server name in your ssh config: " servername
read -p "Enter the username (ubuntu/ec2-user): " user
read -p "Enter the file name: " filename

scp /home/aravind/Downloads/$filename.zip $servername:/opt/tomcat/webapps/

ssh -t $servername <<ENDSSH
sudo sh /opt/tomcat/bin/shutdown.sh 
cd /opt/tomcat/webapps/
unzip -o $filename.zip 
sudo sh /opt/tomcat/bin/startup.sh 
echo " script Completed successfully"
ENDSSH

