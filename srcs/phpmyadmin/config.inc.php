<?php

$cfg['blowfish_secret'] = 'Itsnoteasytocreate32symbolstring';

$i = 1;


$cfg['Servers'][$i]['auth_type'] = 'cookie';

$cfg['Servers'][$i]['port'] = '3306';
$cfg['Servers'][$i]['host'] = 'mysql';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;

 $cfg['Servers'][$i]['user'] = 'root';
 $cfg['Servers'][$i]['password'] = 'root';

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
$cfg['TempDir'] = '';