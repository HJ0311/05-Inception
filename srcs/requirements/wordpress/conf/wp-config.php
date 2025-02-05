<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'db1' );

/** MySQL database username */
define( 'DB_USER', 'user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'pwd' );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define( 'WP_ALLOW_REPAIR', true );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '6!:WT+]J6(Eii>@^ 5Z!J@{&zXSf$sLU{B6iUDdqh)XiPle!2?|w3!a}=1ZucegJ');
define('SECURE_AUTH_KEY',  'k3auFgV$2q_.[-_teg+V}9L,v~!j;6xSYp3-HmEEXo1{t.82z|S4j&5uv70 -$*9');
define('LOGGED_IN_KEY',    '_8(NY#`bd[2yjQt7~i,hf=fp>K#yq ,LZ.g|pd~-wztb[zv[Dx{8;x6M!:m/#G)/');
define('NONCE_KEY',        'SFAws|FBXpnj5l,|k*HIuw.r3y@ZJOV2cScb4N$;X[!ITU#zq<Zbp:~_f+c5#eK#');
define('AUTH_SALT',        'JWdK`v_!B%][hr]J4.l-~a}*ev&M:t`/*<ol!da)|)DmO}f2|7(Ec-Ps?[}5smxs');
define('SECURE_AUTH_SALT', '?o44Yl?Fkv2@+)=;Ig1Hpwp{7r}zkV*j/,m$6<;xKk-=`J9Cu_;/-oq<ABoMAtV^');
define('LOGGED_IN_SALT',   '/)0^A/w8eVb>~j*W`6__ujPO>f.^vb1_CE26jcRtxpDg_8|->bV{|enxSZ.2?4#:');
define('NONCE_SALT',       'KRWK@d++Ej$f[?2B&pp&J5|*rAB1^!. wI]a`(->p]+o4_WEx|NitopI.+t208F$');

define('WP_CACHE', true);

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>
