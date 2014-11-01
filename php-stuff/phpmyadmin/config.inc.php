<?php

    /* Servers configuration */
    $i = 0;

    /* Server: yourserver.net [1] */
    $i++;
    $cfg['Servers'][$i]['verbose'] = 'yourserver.net';
    $cfg['Servers'][$i]['host'] = 'localhost';
    $cfg['Servers'][$i]['port'] = 3306;
    $cfg['Servers'][$i]['socket'] = '/tmp/mysql.sock';
    $cfg['Servers'][$i]['connect_type'] = 'socket';
    $cfg['Servers'][$i]['compress'] = false;
    $cfg['Servers'][$i]['extension'] = 'mysqli';
    $cfg['Servers'][$i]['auth_type'] = 'cookie';
    $cfg['Servers'][$i]['AllowNoPassword'] = false;
#    $cfg['Servers'][$i]['user'] = 'root';
#    $cfg['Servers'][$i]['password'] = '';
    $cfg['Servers'][$i]['pmadb'] = 'phpmyadmin';
    $cfg['Servers'][$i]['controluser'] = 'pma';
    $cfg['Servers'][$i]['controlpass'] = 'asdfghjkl1234567';
    $cfg['Servers'][$i]['bookmarktable'] = 'pma_bookmark';
    $cfg['Servers'][$i]['relation'] = 'pma_relation';
    $cfg['Servers'][$i]['table_info'] = 'pma_table_info';
    $cfg['Servers'][$i]['table_coords'] = 'pma_table_coords';
    $cfg['Servers'][$i]['pdf_pages'] = 'pma_pdf_pages';
    $cfg['Servers'][$i]['column_info'] = 'pma_column_info';
    $cfg['Servers'][$i]['history'] = 'pma_history';
    $cfg['Servers'][$i]['recent'] = 'pma_recent';
    $cfg['Servers'][$i]['table_uiprefs'] = 'pma_table_uiprefs';
    $cfg['Servers'][$i]['designer_coords'] = 'pma_designer_coords';
    $cfg['Servers'][$i]['tracking'] = 'pma_tracking';
    $cfg['Servers'][$i]['userconfig'] = 'pma_userconfig';

    /* End of servers configuration */

    $cfg['blowfish_secret'] = 'qwertyuiop123456';

    $cfg['DefaultLang'] = 'ru-utf-8';
    $cfg['ServerDefault'] = 1;
    $cfg['UploadDir'] = '';
    $cfg['SaveDir'] = '/usr/hosts/phpmyadmin.yourserver.net/tmp';
    $cfg['TempDir'] = '/usr/hosts/phpmyadmin.yourserver.net/tmp';
    $cfg['LoginCookieValidity'] = 1800; // 30 minutes
    $cfg['QueryHistoryDB'] = true;
    $cfg['QueryHistoryMax'] = 100;
    $cfg['MaxDbList'] = 100;
    $cfg['MaxTableList'] = 200;
    $cfg['ExecTimeLimit'] = 600;
    $cfg['MaxRows'] = 50;
    $cfg['MaxExactCount'] = 10000;
    $cfg['MaxExactCountViews'] = 10000;
    $cfg['ShowAll'] = true;
    $cfg['Export'] = array (
        'compression' => 'zip',
        'onserver' => true,
        'file_template_table' => '__TABLE__-(%d-%m-%Y_%H-%M-%S)',
        'file_template_database' => '__DB__-(%d-%m-%Y_%H-%M-%S)',
        'file_template_server' => '__SERVER__-(%d-%m-%Y_%H-%M-%S)',
        //'asfile' => true,
    );
    $cfg['Confirm'] = true;
    $cfg['ShowPhpInfo'] = true;
