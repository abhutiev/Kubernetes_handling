<?php

declare(strict_types=1);

$cfg['blowfish_secret'] = 'Itsnoteasytocreate32symbolstring';

$i = 0;

$i++;

$cfg['Servers'][$i]['auth_type'] = 'cookie';

$cfg['Servers'][$i]['host'] = 'mysql-service:3306';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;
$cfg['Servers'][$i]['user'] = 'root';
$sfg['Servers'][$i]['password'] = 'root';


$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';