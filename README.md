Festival Text to Speech (TTS) in VitalPBX
=====

This script makes use of Festival translate text to speech service
in order to render text to speech and play it back to the user.
It supports a variety of different languages.

## Installation<br>

Copy install.sh to your home directory and procedure to execute.
<pre>
[root@vitalpbx ~]# cd /
[root@vitalpbx ~]# wget https://raw.githubusercontent.com/VitalPBX/pico2wave/master/install.sh
[root@vitalpbx ~]# chmod +x install.sh
[root@vitalpbx ~]# ./install.sh
</pre>

## Voice Select<br>
If you want to change the voice you must go to the voice configuration files that is in:
<pre>
/usr/share/festiva/lib
</pre>

Edit the voices.scm file and near line 328 will show the list of available voices, order in such a way that the first one will be the one we hear.

After selecting the voice, the festival service must be restarted:
<pre>
systemctl restart festival.service
</pre>
