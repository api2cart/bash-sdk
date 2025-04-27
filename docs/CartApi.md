# CartApi

All URIs are relative to */v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cartBridge**](CartApi.md#cartBridge) | **GET** /cart.bridge.json | cart.bridge
[**cartCatalogPriceRulesCount**](CartApi.md#cartCatalogPriceRulesCount) | **GET** /cart.catalog_price_rules.count.json | cart.catalog_price_rules.count
[**cartCatalogPriceRulesList**](CartApi.md#cartCatalogPriceRulesList) | **GET** /cart.catalog_price_rules.list.json | cart.catalog_price_rules.list
[**cartClearCache**](CartApi.md#cartClearCache) | **POST** /cart.clear_cache.json | cart.clear_cache
[**cartConfig**](CartApi.md#cartConfig) | **GET** /cart.config.json | cart.config
[**cartConfigUpdate**](CartApi.md#cartConfigUpdate) | **PUT** /cart.config.update.json | cart.config.update
[**cartCouponAdd**](CartApi.md#cartCouponAdd) | **POST** /cart.coupon.add.json | cart.coupon.add
[**cartCouponConditionAdd**](CartApi.md#cartCouponConditionAdd) | **POST** /cart.coupon.condition.add.json | cart.coupon.condition.add
[**cartCouponCount**](CartApi.md#cartCouponCount) | **GET** /cart.coupon.count.json | cart.coupon.count
[**cartCouponDelete**](CartApi.md#cartCouponDelete) | **DELETE** /cart.coupon.delete.json | cart.coupon.delete
[**cartCouponList**](CartApi.md#cartCouponList) | **GET** /cart.coupon.list.json | cart.coupon.list
[**cartCreate**](CartApi.md#cartCreate) | **POST** /cart.create.json | cart.create
[**cartDelete**](CartApi.md#cartDelete) | **DELETE** /cart.delete.json | cart.delete
[**cartDisconnect**](CartApi.md#cartDisconnect) | **GET** /cart.disconnect.json | cart.disconnect
[**cartGiftcardAdd**](CartApi.md#cartGiftcardAdd) | **POST** /cart.giftcard.add.json | cart.giftcard.add
[**cartGiftcardCount**](CartApi.md#cartGiftcardCount) | **GET** /cart.giftcard.count.json | cart.giftcard.count
[**cartGiftcardDelete**](CartApi.md#cartGiftcardDelete) | **DELETE** /cart.giftcard.delete.json | cart.giftcard.delete
[**cartGiftcardList**](CartApi.md#cartGiftcardList) | **GET** /cart.giftcard.list.json | cart.giftcard.list
[**cartInfo**](CartApi.md#cartInfo) | **GET** /cart.info.json | cart.info
[**cartList**](CartApi.md#cartList) | **GET** /cart.list.json | cart.list
[**cartMetaDataList**](CartApi.md#cartMetaDataList) | **GET** /cart.meta_data.list.json | cart.meta_data.list
[**cartMetaDataSet**](CartApi.md#cartMetaDataSet) | **POST** /cart.meta_data.set.json | cart.meta_data.set
[**cartMetaDataUnset**](CartApi.md#cartMetaDataUnset) | **DELETE** /cart.meta_data.unset.json | cart.meta_data.unset
[**cartMethods**](CartApi.md#cartMethods) | **GET** /cart.methods.json | cart.methods
[**cartPluginList**](CartApi.md#cartPluginList) | **GET** /cart.plugin.list.json | cart.plugin.list
[**cartScriptAdd**](CartApi.md#cartScriptAdd) | **POST** /cart.script.add.json | cart.script.add
[**cartScriptDelete**](CartApi.md#cartScriptDelete) | **DELETE** /cart.script.delete.json | cart.script.delete
[**cartScriptList**](CartApi.md#cartScriptList) | **GET** /cart.script.list.json | cart.script.list
[**cartShippingZonesList**](CartApi.md#cartShippingZonesList) | **GET** /cart.shipping_zones.list.json | cart.shipping_zones.list
[**cartValidate**](CartApi.md#cartValidate) | **GET** /cart.validate.json | cart.validate



## cartBridge

cart.bridge

Get bridge key and store key

### Example

```bash
 cartBridge
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**CartBridge200Response**](CartBridge200Response.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartCatalogPriceRulesCount

cart.catalog_price_rules.count

Get count of cart catalog price rules discounts.

### Example

```bash
 cartCatalogPriceRulesCount
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**CartCatalogPriceRulesCount200Response**](CartCatalogPriceRulesCount200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartCatalogPriceRulesList

cart.catalog_price_rules.list

Get cart catalog price rules discounts.

### Example

```bash
 cartCatalogPriceRulesList  start=value  count=value  page_cursor=value  ids=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **ids** | **string** | Retrieves  catalog_price_rules by ids | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,name,description]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**ModelResponseCartCatalogPriceRulesList**](ModelResponseCartCatalogPriceRulesList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartClearCache

cart.clear_cache

Clear cache on store.

### Example

```bash
 cartClearCache  cache_type=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cacheType** | **string** | Defines which cache should be cleared. | [default to null]

### Return type

[**CartClearCache200Response**](CartClearCache200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartConfig

cart.config

Get list of cart configs

### Example

```bash
 cartConfig  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to store_name,store_url,db_prefix]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**CartConfig200Response**](CartConfig200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartConfigUpdate

cart.config.update

Use this API method to update custom data in client database.

### Example

```bash
 cartConfigUpdate
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cartConfigUpdate** | [**CartConfigUpdate**](CartConfigUpdate.md) |  |

### Return type

[**CartConfigUpdate200Response**](CartConfigUpdate200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartCouponAdd

cart.coupon.add

Use this method to create a coupon with specified conditions.

### Example

```bash
 cartCouponAdd
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cartCouponAdd** | [**CartCouponAdd**](CartCouponAdd.md) |  |

### Return type

[**CartCouponAdd200Response**](CartCouponAdd200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartCouponConditionAdd

cart.coupon.condition.add

Use this method to add additional conditions for coupon application.

### Example

```bash
 cartCouponConditionAdd  coupon_id=value  entity=value  key=value  operator=value  value=value  target=value  include_tax=value  include_shipping=value  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **couponId** | **string** | Coupon Id | [default to null]
 **entity** | **string** | Defines condition entity type | [default to null]
 **key** | **string** | Defines condition entity attribute key | [default to null]
 **operator** | **string** | Defines condition operator | [default to null]
 **value** | **string** | Defines condition value, can be comma separated according to the operator. | [default to null]
 **target** | **string** | Defines condition operator | [optional] [default to coupon_prerequisite]
 **includeTax** | **boolean** | Indicates whether to apply a discount for taxes. | [optional] [default to false]
 **includeShipping** | **boolean** | Indicates whether to apply a discount for shipping. | [optional] [default to false]
 **storeId** | **string** | Store Id | [optional] [default to null]

### Return type

[**BasketLiveShippingServiceDelete200Response**](BasketLiveShippingServiceDelete200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartCouponCount

cart.coupon.count

This method allows you to get the number of coupons. On some platforms, you can filter the coupons by the date they were active.

### Example

```bash
 cartCouponCount  store_id=value  avail=value  date_start_from=value  date_start_to=value  date_end_from=value  date_end_to=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storeId** | **string** | Store Id | [optional] [default to null]
 **avail** | **boolean** | Defines category's visibility status | [optional] [default to true]
 **dateStartFrom** | **string** | Filter entity by date_start (greater or equal) | [optional] [default to null]
 **dateStartTo** | **string** | Filter entity by date_start (less or equal) | [optional] [default to null]
 **dateEndFrom** | **string** | Filter entity by date_end (greater or equal) | [optional] [default to null]
 **dateEndTo** | **string** | Filter entity by date_end (less or equal) | [optional] [default to null]

### Return type

[**CartCouponCount200Response**](CartCouponCount200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartCouponDelete

cart.coupon.delete

Delete coupon

### Example

```bash
 cartCouponDelete  id=value  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Entity id | [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]

### Return type

[**AttributeDelete200Response**](AttributeDelete200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartCouponList

cart.coupon.list

Get cart coupon discounts.

### Example

```bash
 cartCouponList  start=value  count=value  page_cursor=value  coupons_ids=value  store_id=value  lang_id=value  avail=value  date_start_from=value  date_start_to=value  date_end_from=value  date_end_to=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **couponsIds** | **string** | Filter coupons by ids | [optional] [default to null]
 **storeId** | **string** | Filter coupons by store id | [optional] [default to null]
 **langId** | **string** | Language id | [optional] [default to null]
 **avail** | **boolean** | Filter coupons by avail status | [optional] [default to null]
 **dateStartFrom** | **string** | Filter entity by date_start (greater or equal) | [optional] [default to null]
 **dateStartTo** | **string** | Filter entity by date_start (less or equal) | [optional] [default to null]
 **dateEndFrom** | **string** | Filter entity by date_end (greater or equal) | [optional] [default to null]
 **dateEndTo** | **string** | Filter entity by date_end (less or equal) | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,code,name,description]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**ModelResponseCartCouponList**](ModelResponseCartCouponList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartCreate

cart.create

Add store to the account

### Example

```bash
 cartCreate
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cartCreate** | [**CartCreate**](CartCreate.md) |  |

### Return type

[**AccountCartAdd200Response**](AccountCartAdd200Response.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartDelete

cart.delete

Remove store from API2Cart

### Example

```bash
 cartDelete  delete_bridge=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deleteBridge** | **boolean** | Identifies if there is a necessity to delete bridge | [optional] [default to true]

### Return type

[**CartDelete200Response**](CartDelete200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartDisconnect

cart.disconnect

Disconnect with the store and clear store session data.

### Example

```bash
 cartDisconnect  delete_bridge=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deleteBridge** | **boolean** | Identifies if there is a necessity to delete bridge | [optional] [default to false]

### Return type

[**CartDisconnect200Response**](CartDisconnect200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartGiftcardAdd

cart.giftcard.add

Use this method to create a gift card for a specified amount.

### Example

```bash
 cartGiftcardAdd  amount=value  code=value  owner_email=value  recipient_email=value  recipient_name=value  owner_name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **amount** | **integer** | Defines the gift card amount value. | [default to null]
 **code** | **string** | Gift card code | [optional] [default to null]
 **ownerEmail** | **string** | Gift card owner email | [optional] [default to null]
 **recipientEmail** | **string** | Gift card recipient email | [optional] [default to null]
 **recipientName** | **string** | Gift card recipient name | [optional] [default to null]
 **ownerName** | **string** | Gift card owner name | [optional] [default to null]

### Return type

[**CartGiftcardAdd200Response**](CartGiftcardAdd200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartGiftcardCount

cart.giftcard.count

Get gift cards count.

### Example

```bash
 cartGiftcardCount  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storeId** | **string** | Store Id | [optional] [default to null]

### Return type

[**CartGiftcardCount200Response**](CartGiftcardCount200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartGiftcardDelete

cart.giftcard.delete

Delete giftcard

### Example

```bash
 cartGiftcardDelete  id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Entity id | [default to null]

### Return type

[**AttributeDelete200Response**](AttributeDelete200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartGiftcardList

cart.giftcard.list

Get gift cards list.

### Example

```bash
 cartGiftcardList  start=value  count=value  page_cursor=value  store_id=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,code,name]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**ModelResponseCartGiftCardList**](ModelResponseCartGiftCardList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartInfo

cart.info

This method allows you to get various information about the store, including a list of stores (in the case of a multistore configuration), a list of supported languages, currencies, carriers, warehouses, and many other information. This information contains data that is relatively stable and rarely changes, so API2Cart can cache certain data to reduce the load on the store and speed up the execution of the request. We also recommend that you cache the response of this method on your side to save requests. If you need to clear the cache for a specific store, then use the cart.validate method.

### Example

```bash
 cartInfo  store_id=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storeId** | **string** | Store Id | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to store_name,store_url,db_prefix]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**CartInfo200Response**](CartInfo200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartList

cart.list

Get list of supported carts

### Example

```bash
 cartList
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**CartList200Response**](CartList200Response.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartMetaDataList

cart.meta_data.list

Using this method, you can get a list of metadata for various entities (products, options, customers, orders). Usually this is data created by third-party plugins.

### Example

```bash
 cartMetaDataList  entity_id=value  count=value  page_cursor=value  entity=value  store_id=value  lang_id=value  key=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entityId** | **string** | Entity Id | [default to null]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **entity** | **string** | Entity | [optional] [default to product]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **langId** | **string** | Language id | [optional] [default to null]
 **key** | **string** | Key | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to key,value]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**ModelResponseCartMetaDataList**](ModelResponseCartMetaDataList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartMetaDataSet

cart.meta_data.set

Set meta data for a specific entity

### Example

```bash
 cartMetaDataSet  entity_id=value  key=value  value=value  namespace=value  entity=value  store_id=value  lang_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entityId** | **string** | Entity Id | [default to null]
 **key** | **string** | Key | [default to null]
 **value** | **string** | Value | [default to null]
 **namespace** | **string** | Metafield namespace | [default to null]
 **entity** | **string** | Entity | [optional] [default to product]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **langId** | **string** | Language id | [optional] [default to null]

### Return type

[**AttributeAdd200Response**](AttributeAdd200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartMetaDataUnset

cart.meta_data.unset

Unset meta data for a specific entity

### Example

```bash
 cartMetaDataUnset  entity_id=value  key=value  id=value  entity=value  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entityId** | **string** | Entity Id | [default to null]
 **key** | **string** | Key | [default to null]
 **id** | **string** | Entity id | [default to null]
 **entity** | **string** | Entity | [optional] [default to product]
 **storeId** | **string** | Store Id | [optional] [default to null]

### Return type

[**BasketLiveShippingServiceDelete200Response**](BasketLiveShippingServiceDelete200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartMethods

cart.methods

Returns a list of supported API methods.

### Example

```bash
 cartMethods
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**CartMethods200Response**](CartMethods200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartPluginList

cart.plugin.list

Get a list of third-party plugins installed on the store.

### Example

```bash
 cartPluginList  start=value  count=value  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **storeId** | **string** | Store Id | [optional] [default to null]

### Return type

[**CartPluginList200Response**](CartPluginList200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartScriptAdd

cart.script.add

Add new script to the storefront

### Example

```bash
 cartScriptAdd  name=value  description=value  html=value  src=value  load_method=value  scope=value  events=value  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | The user-friendly script name | [optional] [default to null]
 **description** | **string** | The user-friendly description | [optional] [default to null]
 **html** | **string** | An html string containing exactly one 'script' tag. | [optional] [default to null]
 **src** | **string** | The URL of the remote script | [optional] [default to null]
 **loadMethod** | **string** | The load method to use for the script | [optional] [default to null]
 **scope** | **string** | The page or pages on the online store where the script should be included | [optional] [default to storefront]
 **events** | **string** | Event for run scripts | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]

### Return type

[**CartScriptAdd200Response**](CartScriptAdd200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartScriptDelete

cart.script.delete

Remove script from the storefront

### Example

```bash
 cartScriptDelete  id=value  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Entity id | [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]

### Return type

[**AttributeDelete200Response**](AttributeDelete200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartScriptList

cart.script.list

Get scripts installed to the storefront

### Example

```bash
 cartScriptList  start=value  count=value  page_cursor=value  script_ids=value  store_id=value  created_from=value  created_to=value  modified_from=value  modified_to=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **scriptIds** | **string** | Retrieves only scripts with specific ids | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **createdFrom** | **string** | Retrieve entities from their creation date | [optional] [default to null]
 **createdTo** | **string** | Retrieve entities to their creation date | [optional] [default to null]
 **modifiedFrom** | **string** | Retrieve entities from their modification date | [optional] [default to null]
 **modifiedTo** | **string** | Retrieve entities to their modification date | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,name,description]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**ModelResponseCartScriptList**](ModelResponseCartScriptList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartShippingZonesList

cart.shipping_zones.list

Get list of shipping zones

### Example

```bash
 cartShippingZonesList  start=value  count=value  store_id=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,name,enabled]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**ModelResponseCartShippingZonesList**](ModelResponseCartShippingZonesList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## cartValidate

cart.validate

This method clears the cache in API2Cart for a particular store and checks whether the connection to the store is available. Use this method if there have been any changes in the settings on the storе, for example, if a new plugin has been installed or removed.

### Example

```bash
 cartValidate  validate_version=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **validateVersion** | **boolean** | Specify if api2cart should validate cart version | [optional] [default to false]

### Return type

[**CartValidate200Response**](CartValidate200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

