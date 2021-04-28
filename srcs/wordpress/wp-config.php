<?php

define( 'DB_NAME', 'wordpress' );

define( 'DB_USER', 'abhutiev' );

define( 'DB_PASSWORD', 'abhutiev' );

define( 'DB_HOST', 'mysql' );

define( 'DB_CHARSET', 'utf8' );

define('AUTH_KEY',         'B&y|l9X.8//i1k]:?4h1/:wlH@*WNwD*G+zw)V8uRp4gB$>7w;@Y7&q:Oa4-P+cF');
define('SECURE_AUTH_KEY',  'uTgJS7k4fg6k:*lnTLIy5o%i*R2qB_~_*n9s_[!Q.S:fEQ;|3-,Qtn=#reDB4H>P');
define('LOGGED_IN_KEY',    'KjE>S.,Rmj?At+Bo}JB<P+yQB`Yt4wpFfMWi1{;,)EkvxAh|y-f^V0DTW)<l*;b|');
define('NONCE_KEY',        '$SNBI+!wR!@PQSfsnQ*`:6?@exZGS74uh$}>b|-QDV#RVrv8cB:{,pKY[82k^Aam');
define('AUTH_SALT',        '<?A@Ia:nHV+-,n/5s[,pja/z{ER+x^gdY?c.~z_^v)6S>1s1^Zl]P%)X-|X38Fk+');
define('SECURE_AUTH_SALT', '#jsG$ObOYZ|mx}-lP19cK- g8+P_Hp%MI~z!:5)x>*-86%tC9s,!]-5zrig@8RZE');
define('LOGGED_IN_SALT',   'yiz:_k?<R_v+qqJHFZTx[Wa8WwJVIfD|Wen_ES6d!Pg}a/vgu-mYHsuZg5119m;C');
define('NONCE_SALT',       ')L_#f&gCz;v-R8kjjI}l]J$Q7FdFr54sk<3}:-$_wL&_qz]|-yN;1[h!_KnoS9R5');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';