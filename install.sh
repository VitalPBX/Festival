#!/bin/bash
set -e
# Authors:      Rodrigo Cuadra
#               with Collaboration of Jose Miguel Rivera
#
# Support:      rcuadra@vitalpbx.com
#
echo -e "\n"
echo -e "************************************************************"
echo -e "*     Welcome to the VitalPBX Festival TTS Integration     *"
echo -e "************************************************************"
yum install festival festival-freebsoft-utils -y
cd /etc/systemd/system/
wget https://github.com/VitalPBX/festival/raw/master/festival.service
chmod 664 /etc/systemd/system/festival.service
systemctl daemon-reload
systemctl start festival.service
systemctl enable festival.service
yum install -y festvox-awb-arctic-hts
yum install -y festvox-bdl-arctic-hts
yum install -y festvox-clb-arctic-hts
yum install -y festvox-kal-diphone
yum install -y festvox-ked-diphone
yum install -y festvox-rms-arctic-hts
yum install -y festvox-slt-arctic-hts
yum install -y hispavoces-pal-diphone
yum install -y hispavoces-sfl-diphone
cd /etc/asterisk/
wget https://github.com/VitalPBX/festival/raw/master/festival.conf
systemctl restart festival.service
asterisk -rx"core reload"
