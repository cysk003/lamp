# Copyright (C) 2013 - 2025 Teddysun <i@teddysun.com>
#
# This file is part of the LAMP script.
#
# LAMP is a powerful bash script for the installation of
# Apache + PHP + MySQL/MariaDB and so on.
# You can install Apache + PHP + MySQL/MariaDB in an very easy way.
# Just need to input numbers to choose what you want to install before installation.
# And all things will be done in a few minutes.
#
# Website:  https://lamp.sh
# Github:   https://github.com/teddysun/lamp

load_config() {

    #Install location
    apache_location=/usr/local/apache
    mysql_location=/usr/local/mysql
    mariadb_location=/usr/local/mariadb
    php_location=/usr/local/php
    openssl_location=/usr/local/openssl

    #Install depends location
    depends_prefix=/usr/local

    #Web root location
    web_root_dir=/data/www/default

    #Download root URL (for backup)
    download_root_url="https://dl.lamp.sh/files"

    #parallel compile option,1:enable,0:disable
    parallel_compile=1

    ##Software version
    #openssl
    openssl_filename="openssl-1.1.1w"
    openssl_filename_url="https://github.com/openssl/openssl/releases/download/OpenSSL_1_1_1w/openssl-1.1.1w.tar.gz"
    #apache2.4
    apache2_4_filename="httpd-2.4.63"
    apache2_4_filename_url="https://dlcdn.apache.org/httpd/httpd-2.4.63.tar.gz"
    #mysql5.7
    mysql5_7_filename="mysql-5.7.44"
    #mysql8.0
    mysql8_0_filename="mysql-8.0.41"
    #mariadb10.5
    mariadb10_5_filename="mariadb-10.5.28"
    #mariadb10.6
    mariadb10_6_filename="mariadb-10.6.21"
    #mariadb10.11
    mariadb10_11_filename="mariadb-10.11.11"
    #php7.4
    php7_4_filename="php-7.4.33"
    php7_4_filename_url="https://www.php.net/distributions/php-7.4.33.tar.gz"
    #php8.0
    php8_0_filename="php-8.0.30"
    php8_0_filename_url="https://www.php.net/distributions/php-8.0.30.tar.gz"
    #php8.1
    php8_1_filename="php-8.1.32"
    php8_1_filename_url="https://www.php.net/distributions/php-8.1.32.tar.gz"
    #php8.2
    php8_2_filename="php-8.2.28"
    php8_2_filename_url="https://www.php.net/distributions/php-8.2.28.tar.gz"
    #phpMyAdmin
    phpmyadmin_filename="phpMyAdmin-5.2.2-all-languages"
    phpmyadmin_filename_url="https://files.phpmyadmin.net/phpMyAdmin/5.2.2/phpMyAdmin-5.2.2-all-languages.tar.gz"
    #Adminer
    adminer_filename="adminer-5.2.0"
    adminer_filename_url="https://github.com/vrana/adminer/releases/download/v5.2.0/adminer-5.2.0.php"
    #X-Prober
    x_prober_url="https://github.com/kmvan/x-prober/releases/latest/download/prober.php"
    #kodexplorer
    kod_version="4.52"
    kodexplorer_filename="kodfile-${kod_version}"
    kodexplorer_filename_url="${download_root_url}/kodfile-${kod_version}.tar.gz"
    set_hint ${kodexplorer_filename} "kodexplorer-${kod_version}"

    #apr
    apr_filename="apr-1.7.5"
    apr_filename_url="http://ftp.jaist.ac.jp/pub/apache/apr/apr-1.7.5.tar.gz"
    #apr-util
    apr_util_filename="apr-util-1.6.3"
    apr_util_filename_url="http://ftp.jaist.ac.jp/pub/apache/apr/apr-util-1.6.3.tar.gz"
    #mod_wsgi
    mod_wsgi_filename="mod_wsgi-4.9.4"
    mod_wsgi_filename_url="https://github.com/GrahamDumpleton/mod_wsgi/archive/refs/tags/4.9.4.tar.gz"
    #mod_jk
    mod_jk_filename="tomcat-connectors-1.2.50-src"
    mod_jk_filename_url="http://ftp.jaist.ac.jp/pub/apache/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.50-src.tar.gz"
    set_hint ${mod_jk_filename} "mod_jk-1.2.50"
    #mod_security
    mod_security_filename="modsecurity-2.9.7"
    mod_security_filename_url="https://github.com/owasp-modsecurity/ModSecurity/releases/download/v2.9.7/modsecurity-2.9.7.tar.gz"
    set_hint ${mod_security_filename} "mod_security-2.9.7"
    #mhash
    mhash_filename="mhash-0.9.9.9"
    mhash_filename_url="https://sourceforge.net/projects/mhash/files/mhash/0.9.9.9/mhash-0.9.9.9.tar.gz/download"
    #libmcrypt
    libmcrypt_filename="libmcrypt-2.5.8"
    libmcrypt_filename_url="https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.gz/download"
    #mcrypt
    mcrypt_filename="mcrypt-2.6.8"
    mcrypt_filename_url="https://sourceforge.net/projects/mcrypt/files/MCrypt/2.6.8/mcrypt-2.6.8.tar.gz/download"
    #pcre
    pcre_filename="pcre-8.45"
    pcre_filename_url="https://sourceforge.net/projects/pcre/files/pcre/8.45/pcre-8.45.tar.gz/download"
    #re2c
    re2c_filename="re2c-3.0"
    re2c_filename_url="https://github.com/skvadrik/re2c/releases/download/3.0/re2c-3.0.tar.xz"
    #cmake
    cmake_filename="cmake-3.18.0"
    cmake_filename_url="https://github.com/Kitware/CMake/releases/download/v3.18.0/cmake-3.18.0.tar.gz"
    cmake_filename2="cmake-3.18.0-Linux-x86_64"
    cmake_filename_url2="https://github.com/Kitware/CMake/releases/download/v3.18.0/cmake-3.18.0-Linux-x86_64.tar.gz"
    #libzip
    libzip_filename="libzip-1.11.2"
    libzip_filename_url="https://libzip.org/download/libzip-1.11.2.tar.gz"
    #libiconv
    libiconv_filename="libiconv-1.18"
    libiconv_filename_url="https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.18.tar.gz"
    #libevent
    libevent_filename="libevent-2.1.12-stable"
    libevent_filename_url="https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz"
    #argon2
    argon2_filename="argon2-20171227"
    argon2_filename_url="${download_root_url}/argon2-20171227.tar.gz"
    #ionCube
    ionCube_filename="ioncube_loaders"
    ionCube32_filename="ioncube_loaders_lin_x86"
    ionCube32_filename_url="https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.gz"
    ionCube64_filename="ioncube_loaders_lin_x86-64"
    ionCube64_filename_url="https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz"
    #pdflib
    pdflib_filename="pdflib-10.0.0p1"
    pdflib32_filename="PDFlib-10.0.0p1-Linux-x86-php.tar.gz"
    pdflib32_filename_url="https://www.pdflib.com/binaries/PDFlib/1000/PDFlib-10.0.0p1-Linux-x86-php.tar.gz"
    pdflib64_filename="PDFlib-10.0.0p1-Linux-x64-php"
    pdflib64_filename_url="https://www.pdflib.com/binaries/PDFlib/1000/PDFlib-10.0.0p1-Linux-x64-php.tar.gz"
    #PECL packages
    #php extension swoole
    swoole_filename="swoole-4.8.12"
    swoole_filename_url="https://pecl.php.net/get/swoole-4.8.12.tgz"
    #php extension xdebug
    xdebug_filename="xdebug-3.1.6"
    xdebug_filename_url="https://pecl.php.net/get/xdebug-3.1.6.tgz"
    #ImageMagick
    ImageMagick_filename="ImageMagick-7.1.1-38"
    ImageMagick_filename_url="https://imagemagick.org/archive/releases/ImageMagick-7.1.1-38.tar.xz"
    #php extension imagick
    php_imagemagick_filename="imagick-3.7.0"
    php_imagemagick_filename_url="https://pecl.php.net/get/imagick-3.7.0.tgz"
    #memcached
    memcached_filename="memcached-1.6.6"
    memcached_filename_url="http://www.memcached.org/files/memcached-1.6.6.tar.gz"
    #libmemcached
    libmemcached_filename="libmemcached-1.0.18"
    libmemcached_filename_url="https://launchpadlibrarian.net/165454254/libmemcached-1.0.18.tar.gz"
    #php extension memcached
    php_memcached_filename="memcached-3.1.5"
    php_memcached_filename_url="https://pecl.php.net/get/memcached-3.1.5.tgz"
    #redis
    redis_filename="redis-5.0.14"
    redis_filename_url="http://download.redis.io/releases/redis-5.0.14.tar.gz"
    #php extension redis
    php_redis_filename="redis-5.3.7"
    php_redis_filename_url="https://pecl.php.net/get/redis-5.3.7.tgz"
    #php extension mongodb
    php_mongo_filename="mongodb-1.16.2"
    php_mongo_filename_url="https://pecl.php.net/get/mongodb-1.16.2.tgz"
    #libsodium
    libsodium_filename="libsodium-1.0.19"
    libsodium_filename_url="https://download.libsodium.org/libsodium/releases/libsodium-1.0.19.tar.gz"
    #php extension libsodium
    php_libsodium_filename="libsodium-2.0.23"
    php_libsodium_filename_url="https://pecl.php.net/get/libsodium-2.0.23.tgz"
    #php extension yaf
    yaf_filename="yaf-3.3.5"
    yaf_filename_url="https://pecl.php.net/get/yaf-3.3.5.tgz"
    #php extension psr
    psr_filename="psr-1.2.0"
    psr_filename_url="https://pecl.php.net/get/psr-1.2.0.tgz"
    #php extension phalcon
    phalcon_filename="phalcon-5.3.1"
    phalcon_filename_url="https://pecl.php.net/get/phalcon-5.3.1.tgz"
    #php extension apcu
    apcu_filename="apcu-5.1.21"
    apcu_filename_url="https://pecl.php.net/get/apcu-5.1.21.tgz"
    #php extension grpc
    grpc_filename="grpc-1.58.0"
    grpc_filename_url="https://pecl.php.net/get/grpc-1.58.0.tgz"
    #php extension msgpack
    msgpack_filename="msgpack-2.1.2"
    msgpack_filename_url="https://pecl.php.net/get/msgpack-2.1.2.tgz"
    #php extension yar
    yar_filename="yar-2.3.2"
    yar_filename_url="https://pecl.php.net/get/yar-2.3.2.tgz"

    #software array setting
    apache_arr=(
        ${apache2_4_filename}
        do_not_install
    )

    apache_modules_arr=(
        ${mod_wsgi_filename}
        ${mod_security_filename}
        ${mod_jk_filename}
        do_not_install
    )

    mysql_arr=(
        ${mysql5_7_filename}
        ${mysql8_0_filename}
        ${mariadb10_5_filename}
        ${mariadb10_6_filename}
        ${mariadb10_11_filename}
        do_not_install
    )

    php_arr=(
        ${php7_4_filename}
        ${php8_0_filename}
        ${php8_1_filename}
        ${php8_2_filename}
        do_not_install
    )

    phpmyadmin_arr=(
        ${phpmyadmin_filename}
        ${adminer_filename}
        do_not_install
    )

    kodexplorer_arr=(
        ${kodexplorer_filename}
        do_not_install
    )

    php_modules_arr=(
        ${ionCube_filename}
        ${pdflib_filename}
        ${apcu_filename}
        ${php_imagemagick_filename}
        ${php_memcached_filename}
        ${php_redis_filename}
        ${php_mongo_filename}
        ${php_libsodium_filename}
        ${swoole_filename}
        ${yaf_filename}
        ${yar_filename}
        ${grpc_filename}
        ${phalcon_filename}
        ${xdebug_filename}
        do_not_install
    )

}
