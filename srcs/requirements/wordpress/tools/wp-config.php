<?php

define( 'DB_NAME', 'db1' );

define( 'DB_USER', 'user' );

define( 'DB_PASSWORD', 'pwd' );

define( 'DB_HOST', 'mariadb:3306' );

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

define ( 'WP_ALLOW_REPAIR', true);

define('AUTH_KEY',         '@N={5hY_d[hkx%}RGK(N.+VX{n;@:_|Yw~-l0_BxES}b!K|fbz!T4VF4-<wl!wnI');
define('SECURE_AUTH_KEY',  '9PL-3Tiv7,v+emSbNER*m=XGcs=i!dO]o4#_^<X)uw|_ys9&(@vPQTnNq|h$|+ev');
define('LOGGED_IN_KEY',    '8Wx4^.saF;W]UI#q_<6cV$(09zeuZv</AoS`R:ZL({rt~ew+WMRZ>uCF@OGrY#4p');
define('NONCE_KEY',        'Qjih{C[0J(yDDS`24%QG0pK0xb*tQhI#sA#dt5=PX(42:#z<-B@@QEE|-, {Uko&');
define('AUTH_SALT',        'icD!qT,g|E&WEW{b-8IrLI:K12Z6t*J&34L:Qr2>pfL<P(1(n|?5.39#S_lo@GUZ');
define('SECURE_AUTH_SALT', '<-6ftBPOFF.Q-Tq|>ve+)76-.o+onwxc8D2jR4DJ9xX?O}#|mV,FoVssxF>M!R3S');
define('LOGGED_IN_SALT',   '6DbE7c!E(u B`eu|aMHg%H`$e++r?*hR56#Vuq.Bk{y-(n49z-:6AjMQ$|tm4YV(');
define('NONCE_SALT',       'eVXLZffe@?Wj.exa@::dkT;nHu,j{.j_0tI#P6x0c1|;,knE;+PVnyg]Te~2.`os');

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>