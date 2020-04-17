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
asterisk -rx"module load app_festival.so"
systemctl restart festival.service
cd /etc/asterisk/ombutel
wget https://github.com/VitalPBX/pico2wave/raw/master/extensions__90-festival.conf
asterisk -rx"dialplan reload"
echo -e "\n"
echo -e "************************************************************"
echo -e "*                 For test dial *8866                      *"
echo -e "************************************************************"
