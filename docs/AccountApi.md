# AccountApi

All URIs are relative to */v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**accountCartAdd**](AccountApi.md#accountCartAdd) | **POST** /account.cart.add.json | account.cart.add
[**accountCartList**](AccountApi.md#accountCartList) | **GET** /account.cart.list.json | account.cart.list
[**accountConfigUpdate**](AccountApi.md#accountConfigUpdate) | **PUT** /account.config.update.json | account.config.update
[**accountFailedWebhooks**](AccountApi.md#accountFailedWebhooks) | **GET** /account.failed_webhooks.json | account.failed_webhooks
[**accountSupportedPlatforms**](AccountApi.md#accountSupportedPlatforms) | **GET** /account.supported_platforms.json | account.supported_platforms



## accountCartAdd

account.cart.add

Use this method to automate the process of connecting stores to API2Cart. The list of parameters will vary depending on the platform. To get a list of parameters that are specific to a particular shopping platform, you need to execute the account.supported_platforms.json method.

### Example

```bash
 accountCartAdd
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accountCartAdd** | [**AccountCartAdd**](AccountCartAdd.md) |  |

### Return type

[**AccountCartAdd200Response**](AccountCartAdd200Response.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## accountCartList

account.cart.list

This method lets you get a list of online stores connected to your API2Cart account. You can get the number of API requests to each store if you specify a period using parameters (request_from_date, request_to_date). The total_calls field is displayed only if there are parameters (request_from_date, request_to_date).

### Example

```bash
 accountCartList  store_url=value  store_key=value  request_from_date=value  request_to_date=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storeUrl** | **string** | A web address of a store | [optional] [default to null]
 **storeKey** | **string** | Find store by store key | [optional] [default to null]
 **requestFromDate** | **string** | Retrieve entities from their creation date | [optional] [default to null]
 **requestToDate** | **string** | Retrieve entities to their creation date | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to force_all]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**AccountCartList200Response**](AccountCartList200Response.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## accountConfigUpdate

account.config.update

Use this method to automate the change of credentials used to connect online stores. The list of supported parameters differs depending on the platform.

### Example

```bash
 accountConfigUpdate  replace_parameters=value  new_store_url=value  new_store_key=value  bridge_url=value  store_root=value  db_tables_prefix=value  user_agent=value  3dcart_private_key=value  3dcart_access_token=value  3dcartapi_api_key=value  amazon_sp_client_id=value  amazon_sp_client_secret=value  amazon_sp_refresh_token=value  amazon_sp_aws_region=value  amazon_sp_api_environment=value  amazon_seller_id=value  aspdotnetstorefront_api_user=value  aspdotnetstorefront_api_pass=value  bigcommerceapi_admin_account=value  bigcommerceapi_api_path=value  bigcommerceapi_api_key=value  bigcommerceapi_client_id=value  bigcommerceapi_access_token=value  bigcommerceapi_context=value  bol_api_key=value  bol_api_secret=value  bol_retailer_id=value  demandware_client_id=value  demandware_api_password=value  demandware_user_name=value  demandware_user_password=value  ebay_client_id=value  ebay_client_secret=value  ebay_runame=value  ebay_access_token=value  ebay_refresh_token=value  ebay_environment=value  ebay_site_id=value  ecwid_acess_token=value  ecwid_store_id=value  lazada_app_id=value  lazada_app_secret=value  lazada_refresh_token=value  lazada_region=value  etsy_keystring=value  etsy_shared_secret=value  etsy_access_token=value  etsy_token_secret=value  etsy_client_id=value  etsy_refresh_token=value  facebook_app_id=value  facebook_app_secret=value  facebook_access_token=value  facebook_business_id=value  neto_api_key=value  neto_api_username=value  shopline_access_token=value  shopline_app_key=value  shopline_app_secret=value  shopline_shared_secret=value  shopify_access_token=value  shopify_api_key=value  shopify_api_password=value  shopify_shared_secret=value  shopee_partner_id=value  shopee_partner_key=value  shopee_shop_id=value  shopee_refresh_token=value  shopee_region=value  shopee_environment=value  shoplazza_access_token=value  shoplazza_shared_secret=value  miva_access_token=value  miva_signature=value  shopware_access_key=value  unas_api_key=value  shopware_api_key=value  shopware_api_secret=value  bigcartel_user_name=value  bigcartel_password=value  bricklink_consumer_key=value  bricklink_consumer_secret=value  bricklink_token=value  bricklink_token_secret=value  volusion_login=value  volusion_password=value  walmart_client_id=value  walmart_client_secret=value  walmart_environment=value  walmart_channel_type=value  walmart_region=value  square_client_id=value  square_client_secret=value  square_refresh_token=value  squarespace_api_key=value  squarespace_client_id=value  squarespace_client_secret=value  squarespace_access_token=value  squarespace_refresh_token=value  hybris_client_id=value  hybris_client_secret=value  hybris_username=value  hybris_password=value  Specify as:  hybris_websites=value1 hybris_websites=value2 hybris_websites=...  lightspeed_api_key=value  lightspeed_api_secret=value  commercehq_api_key=value  commercehq_api_password=value  wc_consumer_key=value  wc_consumer_secret=value  magento_consumer_key=value  magento_consumer_secret=value  magento_access_token=value  magento_token_secret=value  prestashop_webservice_key=value  wix_app_id=value  wix_app_secret_key=value  wix_instance_id=value  wix_refresh_token=value  mercado_libre_app_id=value  mercado_libre_app_secret_key=value  mercado_libre_refresh_token=value  zid_client_id=value  zid_client_secret=value  zid_access_token=value  zid_authorization=value  zid_refresh_token=value  flipkart_client_id=value  flipkart_client_secret=value  allegro_client_id=value  allegro_client_secret=value  allegro_access_token=value  allegro_refresh_token=value  allegro_environment=value  zoho_client_id=value  zoho_client_secret=value  zoho_refresh_token=value  zoho_region=value  tiendanube_user_id=value  tiendanube_access_token=value  tiendanube_client_secret=value  otto_client_id=value  otto_client_secret=value  otto_app_id=value  otto_refresh_token=value  otto_environment=value  otto_access_token=value  tiktokshop_app_key=value  tiktokshop_app_secret=value  tiktokshop_refresh_token=value  tiktokshop_access_token=value  salla_client_id=value  salla_client_secret=value  salla_refresh_token=value  salla_access_token=value  temu_app_key=value  temu_app_secret=value  temu_access_token=value  temu_region=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **replaceParameters** | **boolean** | Identifies if there is a necessity to replace parameters | [optional] [default to null]
 **newStoreUrl** | **string** | The web address of the store you want to update to connect to API2Cart | [optional] [default to null]
 **newStoreKey** | **string** | Update store key | [optional] [default to null]
 **bridgeUrl** | **string** | This parameter allows to set up store with custom bridge url (also you must use store_root parameter if a bridge folder is not in the root folder of the store) | [optional] [default to null]
 **storeRoot** | **string** | Absolute path to the store root directory (used with \"bridge_url\" parameter) | [optional] [default to null]
 **dbTablesPrefix** | **string** | DB tables prefix | [optional] [default to null]
 **userAgent** | **string** | This parameter allows you to set your custom user agent, which will be used in requests to the store. Please use it cautiously, as the store's firewall may block specific values. | [optional] [default to null]
 **3dcartPrivateKey** | **string** | 3DCart Private Key | [optional] [default to null]
 **3dcartAccessToken** | **string** | 3DCart Token | [optional] [default to null]
 **3dcartapiApiKey** | **string** | 3DCart API Key | [optional] [default to null]
 **amazonSpClientId** | **string** | Amazon SP API app client id | [optional] [default to null]
 **amazonSpClientSecret** | **string** | Amazon SP API app client secret | [optional] [default to null]
 **amazonSpRefreshToken** | **string** | Amazon SP API OAuth refresh token | [optional] [default to null]
 **amazonSpAwsRegion** | **string** | Amazon AWS Region | [optional] [default to null]
 **amazonSpApiEnvironment** | **string** | Amazon SP API environment | [optional] [default to production]
 **amazonSellerId** | **string** | Amazon Seller ID (Merchant token) | [optional] [default to null]
 **aspdotnetstorefrontApiUser** | **string** | It's a AspDotNetStorefront account for which API is available | [optional] [default to null]
 **aspdotnetstorefrontApiPass** | **string** | AspDotNetStorefront API Password | [optional] [default to null]
 **bigcommerceapiAdminAccount** | **string** | It's a BigCommerce account for which API is enabled | [optional] [default to null]
 **bigcommerceapiApiPath** | **string** | BigCommerce API URL | [optional] [default to null]
 **bigcommerceapiApiKey** | **string** | Bigcommerce API Key | [optional] [default to null]
 **bigcommerceapiClientId** | **string** | Client ID of the requesting app | [optional] [default to null]
 **bigcommerceapiAccessToken** | **string** | Access token authorizing the app to access resources on behalf of a user | [optional] [default to null]
 **bigcommerceapiContext** | **string** | API Path section unique to the store | [optional] [default to null]
 **bolApiKey** | **string** | Bol API Key | [optional] [default to null]
 **bolApiSecret** | **string** | Bol API Secret | [optional] [default to null]
 **bolRetailerId** | **integer** | Bol Retailer ID | [optional] [default to null]
 **demandwareClientId** | **string** | Demandware client id | [optional] [default to null]
 **demandwareApiPassword** | **string** | Demandware api password | [optional] [default to null]
 **demandwareUserName** | **string** | Demandware user name | [optional] [default to null]
 **demandwareUserPassword** | **string** | Demandware user password | [optional] [default to null]
 **ebayClientId** | **string** | Application ID (AppID). | [optional] [default to null]
 **ebayClientSecret** | **string** | Shared Secret from eBay application | [optional] [default to null]
 **ebayRuname** | **string** | The RuName value that eBay assigns to your application. | [optional] [default to null]
 **ebayAccessToken** | **string** | Used to authenticate API requests. | [optional] [default to null]
 **ebayRefreshToken** | **string** | Used to renew the access token. | [optional] [default to null]
 **ebayEnvironment** | **string** | eBay environment | [optional] [default to null]
 **ebaySiteId** | **integer** | eBay global ID | [optional] [default to 0]
 **ecwidAcessToken** | **string** | Access token authorizing the app to access resources on behalf of a user | [optional] [default to null]
 **ecwidStoreId** | **string** | Store Id | [optional] [default to null]
 **lazadaAppId** | **string** | Lazada App ID | [optional] [default to null]
 **lazadaAppSecret** | **string** | Lazada App Secret | [optional] [default to null]
 **lazadaRefreshToken** | **string** | Lazada Refresh Token | [optional] [default to null]
 **lazadaRegion** | **string** | Lazada API endpoint Region | [optional] [default to null]
 **etsyKeystring** | **string** | Etsy keystring | [optional] [default to null]
 **etsySharedSecret** | **string** | Etsy shared secret | [optional] [default to null]
 **etsyAccessToken** | **string** | Access token authorizing the app to access resources on behalf of a user | [optional] [default to null]
 **etsyTokenSecret** | **string** | Secret token authorizing the app to access resources on behalf of a user | [optional] [default to null]
 **etsyClientId** | **string** | Etsy Client Id | [optional] [default to null]
 **etsyRefreshToken** | **string** | Etsy Refresh token | [optional] [default to null]
 **facebookAppId** | **string** | Facebook App ID | [optional] [default to null]
 **facebookAppSecret** | **string** | Facebook App Secret | [optional] [default to null]
 **facebookAccessToken** | **string** | Facebook Access Token | [optional] [default to null]
 **facebookBusinessId** | **string** | Facebook Business ID | [optional] [default to null]
 **netoApiKey** | **string** | Neto API Key | [optional] [default to null]
 **netoApiUsername** | **string** | Neto User Name | [optional] [default to null]
 **shoplineAccessToken** | **string** | Shopline APP Key | [optional] [default to null]
 **shoplineAppKey** | **string** | Shopline APP Key | [optional] [default to null]
 **shoplineAppSecret** | **string** | Shopline App Secret | [optional] [default to null]
 **shoplineSharedSecret** | **string** | Shopline Shared Secret | [optional] [default to null]
 **shopifyAccessToken** | **string** | Access token authorizing the app to access resources on behalf of a user | [optional] [default to null]
 **shopifyApiKey** | **string** | Shopify API Key | [optional] [default to null]
 **shopifyApiPassword** | **string** | Shopify API Password | [optional] [default to null]
 **shopifySharedSecret** | **string** | Shared secret | [optional] [default to null]
 **shopeePartnerId** | **string** | Shopee Partner ID | [optional] [default to null]
 **shopeePartnerKey** | **string** | Shopee Partner Key | [optional] [default to null]
 **shopeeShopId** | **string** | Shopee SHOP ID | [optional] [default to null]
 **shopeeRefreshToken** | **string** | Shopee Refresh Token | [optional] [default to null]
 **shopeeRegion** | **string** | Shopee API endpoint Region. Use for Chinese Mainland or Brazil. | [optional] [default to null]
 **shopeeEnvironment** | **string** | Shopee Environment | [optional] [default to null]
 **shoplazzaAccessToken** | **string** | Access token authorizing the app to access resources on behalf of a user | [optional] [default to null]
 **shoplazzaSharedSecret** | **string** | Shared secret | [optional] [default to null]
 **mivaAccessToken** | **string** | Miva access token | [optional] [default to null]
 **mivaSignature** | **string** | Miva signature | [optional] [default to null]
 **shopwareAccessKey** | **string** | Shopware access key | [optional] [default to null]
 **unasApiKey** | **string** | UNAS API Key | [optional] [default to null]
 **shopwareApiKey** | **string** | Shopware api key | [optional] [default to null]
 **shopwareApiSecret** | **string** | Shopware client secret access key | [optional] [default to null]
 **bigcartelUserName** | **string** | Subdomain of store | [optional] [default to null]
 **bigcartelPassword** | **string** | BigCartel account password | [optional] [default to null]
 **bricklinkConsumerKey** | **string** | Bricklink Consumer Key | [optional] [default to null]
 **bricklinkConsumerSecret** | **string** | Bricklink Consumer Secret | [optional] [default to null]
 **bricklinkToken** | **string** | Bricklink Access Token | [optional] [default to null]
 **bricklinkTokenSecret** | **string** | Bricklink Access Token Secret | [optional] [default to null]
 **volusionLogin** | **string** | It's a Volusion account for which API is enabled | [optional] [default to null]
 **volusionPassword** | **string** | Volusion API Password | [optional] [default to null]
 **walmartClientId** | **string** | Walmart client ID. For the region 'ca' use Consumer ID | [optional] [default to null]
 **walmartClientSecret** | **string** | Walmart client secret. For the region 'ca' use Private Key | [optional] [default to null]
 **walmartEnvironment** | **string** | Walmart environment | [optional] [default to production]
 **walmartChannelType** | **string** | Walmart WM_CONSUMER.CHANNEL.TYPE header | [optional] [default to null]
 **walmartRegion** | **string** | Walmart region | [optional] [default to us]
 **squareClientId** | **string** | Square (Weebly) Client ID | [optional] [default to null]
 **squareClientSecret** | **string** | Square (Weebly) Client Secret | [optional] [default to null]
 **squareRefreshToken** | **string** | Square (Weebly) Refresh Token | [optional] [default to null]
 **squarespaceApiKey** | **string** | Squarespace API Key | [optional] [default to null]
 **squarespaceClientId** | **string** | Squarespace Connector Client ID | [optional] [default to null]
 **squarespaceClientSecret** | **string** | Squarespace Connector Client Secret | [optional] [default to null]
 **squarespaceAccessToken** | **string** | Squarespace access token | [optional] [default to null]
 **squarespaceRefreshToken** | **string** | Squarespace refresh token | [optional] [default to null]
 **hybrisClientId** | **string** | Omni Commerce Connector Client ID | [optional] [default to null]
 **hybrisClientSecret** | **string** | Omni Commerce Connector Client Secret | [optional] [default to null]
 **hybrisUsername** | **string** | User Name | [optional] [default to null]
 **hybrisPassword** | **string** | User password | [optional] [default to null]
 **hybrisWebsites** | [**array[string]**](string.md) | Websites to stores mapping data | [optional] [default to null]
 **lightspeedApiKey** | **string** | LightSpeed api key | [optional] [default to null]
 **lightspeedApiSecret** | **string** | LightSpeed api secret | [optional] [default to null]
 **commercehqApiKey** | **string** | CommerceHQ api key | [optional] [default to null]
 **commercehqApiPassword** | **string** | CommerceHQ api password | [optional] [default to null]
 **wcConsumerKey** | **string** | Woocommerce consumer key | [optional] [default to null]
 **wcConsumerSecret** | **string** | Woocommerce consumer secret | [optional] [default to null]
 **magentoConsumerKey** | **string** | Magento Consumer Key | [optional] [default to null]
 **magentoConsumerSecret** | **string** | Magento Consumer Secret | [optional] [default to null]
 **magentoAccessToken** | **string** | Magento Access Token | [optional] [default to null]
 **magentoTokenSecret** | **string** | Magento Token Secret | [optional] [default to null]
 **prestashopWebserviceKey** | **string** | Prestashop webservice key | [optional] [default to null]
 **wixAppId** | **string** | Wix App ID | [optional] [default to null]
 **wixAppSecretKey** | **string** | Wix App Secret Key | [optional] [default to null]
 **wixInstanceId** | **string** | Wix Instance ID | [optional] [default to null]
 **wixRefreshToken** | **string** | Wix refresh token | [optional] [default to null]
 **mercadoLibreAppId** | **string** | Mercado Libre App ID | [optional] [default to null]
 **mercadoLibreAppSecretKey** | **string** | Mercado Libre App Secret Key | [optional] [default to null]
 **mercadoLibreRefreshToken** | **string** | Mercado Libre Refresh Token | [optional] [default to null]
 **zidClientId** | **integer** | Zid Client ID | [optional] [default to null]
 **zidClientSecret** | **string** | Zid Client Secret | [optional] [default to null]
 **zidAccessToken** | **string** | Zid Access Token | [optional] [default to null]
 **zidAuthorization** | **string** | Zid Authorization | [optional] [default to null]
 **zidRefreshToken** | **string** | Zid refresh token | [optional] [default to null]
 **flipkartClientId** | **string** | Flipkart Client ID | [optional] [default to null]
 **flipkartClientSecret** | **string** | Flipkart Client Secret | [optional] [default to null]
 **allegroClientId** | **string** | Allegro Client ID | [optional] [default to null]
 **allegroClientSecret** | **string** | Allegro Client Secret | [optional] [default to null]
 **allegroAccessToken** | **string** | Allegro Access Token | [optional] [default to null]
 **allegroRefreshToken** | **string** | Allegro Refresh Token | [optional] [default to null]
 **allegroEnvironment** | **string** | Allegro Environment | [optional] [default to production]
 **zohoClientId** | **string** | Zoho Client ID | [optional] [default to null]
 **zohoClientSecret** | **string** | Zoho Client Secret | [optional] [default to null]
 **zohoRefreshToken** | **string** | Zoho Refresh Token | [optional] [default to null]
 **zohoRegion** | **string** | Zoho API endpoint Region | [optional] [default to null]
 **tiendanubeUserId** | **integer** | Tiendanube User ID | [optional] [default to null]
 **tiendanubeAccessToken** | **string** | Tiendanube Access Token | [optional] [default to null]
 **tiendanubeClientSecret** | **string** | Tiendanube Client Secret | [optional] [default to null]
 **ottoClientId** | **string** | Otto Client ID | [optional] [default to null]
 **ottoClientSecret** | **string** | Otto Client Secret | [optional] [default to null]
 **ottoAppId** | **string** | Otto App ID | [optional] [default to null]
 **ottoRefreshToken** | **string** | Otto Refresh Token | [optional] [default to null]
 **ottoEnvironment** | **string** | Otto Environment | [optional] [default to null]
 **ottoAccessToken** | **string** | Otto Access Token | [optional] [default to null]
 **tiktokshopAppKey** | **string** | TikTok Shop App Key | [optional] [default to null]
 **tiktokshopAppSecret** | **string** | TikTok Shop App Secret | [optional] [default to null]
 **tiktokshopRefreshToken** | **string** | TikTok Shop Refresh Token | [optional] [default to null]
 **tiktokshopAccessToken** | **string** | TikTok Shop Access Token | [optional] [default to null]
 **sallaClientId** | **string** | Salla Client ID | [optional] [default to null]
 **sallaClientSecret** | **string** | Salla Client Secret | [optional] [default to null]
 **sallaRefreshToken** | **string** | Salla Refresh Token | [optional] [default to null]
 **sallaAccessToken** | **string** | Salla Access Token | [optional] [default to null]
 **temuAppKey** | **string** | Temu App Key | [optional] [default to null]
 **temuAppSecret** | **string** | Temu App Secret | [optional] [default to null]
 **temuAccessToken** | **string** | Temu Access Token | [optional] [default to null]
 **temuRegion** | **string** | Temu API endpoint Region. | [optional] [default to null]

### Return type

[**AccountConfigUpdate200Response**](AccountConfigUpdate200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## accountFailedWebhooks

account.failed_webhooks

If the callback of your service for some reason could not accept webhooks from API2Cart, then with the help of this method you can get a list of missed webhooks to perform synchronization again using entity_id. Please note that we keep such records for 24 hours.

### Example

```bash
 accountFailedWebhooks  start=value  count=value  ids=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **ids** | **string** | List of сomma-separated webhook ids | [optional] [default to null]

### Return type

[**AccountFailedWebhooks200Response**](AccountFailedWebhooks200Response.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## accountSupportedPlatforms

account.supported_platforms

Use this method to retrieve a list of supported platforms and the sets of parameters required for connecting to each of them. Note: some platforms may have multiple connection methods so that the response will contain multiple sets of parameters.

### Example

```bash
 accountSupportedPlatforms
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AccountSupportedPlatforms200Response**](AccountSupportedPlatforms200Response.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

