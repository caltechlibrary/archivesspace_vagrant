<?php
/**
 * create-repository.php - Create a development repository in Archivespace based
 * on the environment described in setup.conf.
 * This is a command line tool.
 * @author R. S. Doiel, <rsdoiel@calteche.edu>
 * copyright (c) 2015 all rights reserved
 * Caltech Library
 */
error_reporting(E_ALL);
date_default_timezone_set('America/Los_Angeles');

/**
 * console_log() display messages to console
 */
function console_log($msg)
{
    echo date('r') . ': ' . $msg . PHP_EOL;
}

/**
 * getConfig() - Look at the local system environment and generate a associative array of settings
 * @return an associative array of key value pairs for configuration settings.
 */
function getConfig()
{
    $expected_env = [
        'ASPACE_PROTOCOL' => 'http',
        'ASPACE_HOST' => 'localhost',
        'ASPACE_PORT' => 8089,
        'ASPACE_USERNAME' => 'admin',
        'ASPACE_PASSWORD' => 'admin',
        'ASPACE_REPOSITORY_ID' => 2,
        'ASPACE_RESOSITORY_NAME' => 'test',
        'ASPACE_PROTOCOL_PRODUCTION' => 'https',
        'ASPACE_HOST_PRODUCTION' => '',
        'ASPACE_PORT_PRODUCTION' => '',
        'ASPACE_USERNAME_PRODUCTION' => '',
        'ASPACE_PASSWORD_PRODCUTION' => '',
        'ASPACE_REPOSITORY_ID_PRODUCTION' => 0,
        'ASPACE_RESOSITORY_NAME_PRODUCTION' => '',
    ];

    $config = [];

    foreach ($expected_env as $ky => $val) {
        $env = getenv($ky);
        if ($env) {
            $config[$ky] = $env;
        } else {
            $config[$ky] = $val;
        }
    }
    return $config;
}

/**
 * login() Authenticate to gain access to the web API.
 * @param $config - this is the configuration array create with getConfig()
 * @return the authorization token as a string.
 */
function login($config)
{
    // Using CURL module get the auth token based on ASPACE_HOST, ASPACE_PORT,
    // ASPACE_USERNAME, ASPACE_PASSWORD and ASPACE_REPOSITORY_ID
    $ch = curl_init();

    curl_setopt($ch, CURLOPT_HEADER, true);
    curl_setopt(
        $ch,
        CURLOPT_URL,
        $config['ASPACE_PROTOCOL'] . '://' .
        $config['ASPACE_HOST'] . ':' .
        $config['ASPACE_PORT'] . '/users/' .
        $config['ASPACE_USERNAME'] . '/login'
    );
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt(
        $ch,
        CURLOPT_POSTFIELDS,
        http_build_query([
            'password' => $config['ASPACE_PASSWORD']
        ])
    );

    // receive server response ...
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    $info = curl_getinfo($ch);

    curl_close($ch);

    console_log("DEBUG response text: " . $response);
    console_log("DEBUG info: " . print_r($info, true));

    $resp = json_decode($response, true);
    //FIXME: Need to pull the auth token out of the response.
    console_log("DEBUG login response: " . json_encode($resp, JSON_FORCE_OBJECT | JSON_PRETTY_PRINT));
    return $resp['session'];
}

/**
 * createRepository() - send a create repository request to ArchivesSpace
 * @param $config - this is the configuration array create with getConfig()
 * @return an associative array with the response information
 */
function createRepository($config)
{
    // Using CURL module get the auth token based on ASPACE_HOST, ASPACE_PORT,
    // ASPACE_USERNAME, ASPACE_PASSWORD and ASPACE_REPOSITORY_ID
    $ch = curl_init();

    curl_setopt(
        $ch,
        CURLOPT_URL,
        $config['ASPACE_PROTOCOL'] . '://' .
        $config['ASPACE_HOST'] . ':' .
        $config['ASPACE_PORT'] . '/repositories'
    );
    $headers = [
            'X-ArchivesSpace-Session' => $config['ASPACE_AUTH_TOKEN']
    ];
    curl_setopt($ch, CURLOPT_HEADER, 1);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_POST, 1);
    $payload = json_encode([
        'repo_code' => $config['ASPACE_REPOSITORY_ID'],
        'name' => $config['ASPACE_REPOSITORY_ID']
    ], true);
    console_log("DEBUG payload: $payload");

    curl_setopt(
        $ch,
        CURLOPT_POSTFIELDS,
        $payload
    );

    // receive server response ...
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    curl_close($ch);

    $resp = [
        'status' => 500,
        'error_message' => 'createRepository Not implemented yet.'
    ];
    if ($response) {
        $resp = json_decode($response, true);
    }
    console_log("DEBUG resp to create " . json_encode($resp, JSON_FORCE_OBJECT | JSON_PRETTY_PRINT));
    return $resp;
}

/**
 * main - create the repository locally based on the current environment settings.
 */
function main()
{
    $config = getConfig();
    console_log("Config " . print_r($config, true));
    $config['ASPACE_AUTH_TOKEN'] = login($config) || "";
    //FIXME:
    $response = createRepository($config);
    if ($response->status == 200) {
        console_log("Respository create");
    } else {
        console_log("Error creating repository: " . print_r($response, true));
    }
}


/**
 * main processing based on environment.
 */
main();
