sudo apt-get update

#install elasticsearch
sudo apt-get install python-software-properties -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install oracle-java8-installer -y
wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.2.deb
sudo dpkg -i elasticsearch-1.7.2.deb
rm elasticsearch-1.7.2.deb
sudo /etc/init.d/elasticsearch start

#install kibana
wget https://download.elastic.co/kibana/kibana/kibana-4.1.2-linux-x64.tar.gz
tar -zxvf kibana-4.1.2-linux-x64.tar.gz
rm kibana-4.1.2-linux-x64.tar.gz
sudo sed -i 's/host: “0.0.0.0″/host: “localhost”/g' kibana-4.1.2-linux-x64/config/kibana.yml 
sudo mkdir /opt/kibana
sudo cp -R kibana-4.1.2-linux-x64/* /opt/kibana
rm -rf kibana-4.1.2-linux-x64/
cd /etc/init.d/
sudo wget https://raw.githubusercontent.com/JC-SoCal/KIES/master/kibana4
sudo chmod +x /etc/init.d/kibana4
sudo update-rc.d kibana4 defaults 96 9
sudo service kibana4 start

#launch the fruits of our labor
sleep 1
nohup firefox -new-tab http://127.0.0.1:9200 -new-tab http://127.0.0.1:5601 &