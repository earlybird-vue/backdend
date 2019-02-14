<?php
// +----------------------------------------------------------------------
// | Description: oauth验证模块
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------
namespace app\api\controller;


class OAuth extends \think\Controller
{

    public function authorize()
    {
        global $server;
        $dsn      = 'mysql:dbname=base_oauth2;host=127.0.0.1';
        $username = 'root';
        $password = '';
        \OAuth2\Autoloader::register();

        // $dsn is the Data Source Name for your database, for exmaple "mysql:dbname=my_oauth2_db;host=localhost"
        $storage = new \OAuth2\Storage\Pdo(array('dsn' => $dsn, 'username' => $username, 'password' => $password));

        // Pass a storage object or array of storage objects to the OAuth2 server class
        $server = new \OAuth2\Server($storage);

        // Add the "Client Credentials" grant type (it is the simplest of the grant types)
        $server->addGrantType(new \OAuth2\GrantType\ClientCredentials($storage));

        // Add the "Authorization Code" grant type (this is where the oauth magic happens)
        $server->addGrantType(new \OAuth2\GrantType\AuthorizationCode($storage));


        $request = \OAuth2\Request::createFromGlobals();
        $response = new \OAuth2\Response();

        //print_r($request);
        //print_r($response);
        // validate the authorize request
        if (!$server->validateAuthorizeRequest($request, $response)) {
            die('b');
        }

        // print the authorization code if the user has authorized your client
        $is_authorized = ($_POST['authorized'] === 'yes');
        $server->handleAuthorizeRequest($request, $response, $is_authorized);
        if ($is_authorized) {
            // this is only here so that you get to see your code in the cURL request. Otherwise, we'd redirect back to the client
            $code = substr($response->getHttpHeader('Location'), strpos($response->getHttpHeader('Location'), 'code=')+5, 40);
            exit(json_encode(array("code"=>$code)));
        }
        $response->send();
    }

    public function token(){
        global $server;
        $dsn      = 'mysql:dbname=base_oauth2;host=127.0.0.1';
        $username = 'root';
        $password = '';
        \OAuth2\Autoloader::register();

        // $dsn is the Data Source Name for your database, for exmaple "mysql:dbname=my_oauth2_db;host=localhost"
        $storage = new \OAuth2\Storage\Pdo(array('dsn' => $dsn, 'username' => $username, 'password' => $password));

        // Pass a storage object or array of storage objects to the OAuth2 server class
        $server = new \OAuth2\Server($storage);

        // Add the "Client Credentials" grant type (it is the simplest of the grant types)
        $server->addGrantType(new \OAuth2\GrantType\ClientCredentials($storage));

        // Add the "Authorization Code" grant type (this is where the oauth magic happens)
        $server->addGrantType(new \OAuth2\GrantType\AuthorizationCode($storage));


        // Handle a request for an OAuth2.0 Access Token and send the response to the client
        $server->handleTokenRequest(\OAuth2\Request::createFromGlobals())->send();
    }


    public function resource()
    {
        // include our OAuth2 Server object
        global $server;
        $dsn      = 'mysql:dbname=base_oauth2;host=127.0.0.1';
        $username = 'root';
        $password = '';

        \OAuth2\Autoloader::register();

        // $dsn is the Data Source Name for your database, for exmaple "mysql:dbname=my_oauth2_db;host=localhost"
        $storage = new \OAuth2\Storage\Pdo(array('dsn' => $dsn, 'username' => $username, 'password' => $password));

        // Pass a storage object or array of storage objects to the OAuth2 server class
        $server = new \OAuth2\Server($storage);

        // Add the "Client Credentials" grant type (it is the simplest of the grant types)
        $server->addGrantType(new \OAuth2\GrantType\ClientCredentials($storage));

        // Add the "Authorization Code" grant type (this is where the oauth magic happens)
        $server->addGrantType(new \OAuth2\GrantType\AuthorizationCode($storage));


        // Handle a request to a resource and authenticate the access token
        if (!$server->verifyResourceRequest(\OAuth2\Request::createFromGlobals())) {
            $server->getResponse()->send();
            die;
        }
        echo json_encode(array('success' => true, 'message' => '您已经成功功过验证,抵达api!'));
    }


}
