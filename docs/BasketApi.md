# BasketApi

All URIs are relative to */v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**basketInfo**](BasketApi.md#basketInfo) | **GET** /basket.info.json | basket.info
[**basketItemAdd**](BasketApi.md#basketItemAdd) | **POST** /basket.item.add.json | basket.item.add
[**basketLiveShippingServiceCreate**](BasketApi.md#basketLiveShippingServiceCreate) | **POST** /basket.live_shipping_service.create.json | basket.live_shipping_service.create
[**basketLiveShippingServiceDelete**](BasketApi.md#basketLiveShippingServiceDelete) | **DELETE** /basket.live_shipping_service.delete.json | basket.live_shipping_service.delete
[**basketLiveShippingServiceList**](BasketApi.md#basketLiveShippingServiceList) | **GET** /basket.live_shipping_service.list.json | basket.live_shipping_service.list



## basketInfo

basket.info

Retrieve basket information.

### Example

```bash
 basketInfo  id=value  store_id=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Entity id | [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to force_all]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**BasketInfo200Response**](BasketInfo200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## basketItemAdd

basket.item.add

Add item to basket

### Example

```bash
 basketItemAdd  customer_id=value  product_id=value  variant_id=value  quantity=value  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customerId** | **string** | Retrieves orders specified by customer id | [default to null]
 **productId** | **string** | Defines id of the product which should be added to the basket | [default to null]
 **variantId** | **string** | Defines product's variants specified by variant id | [optional] [default to null]
 **quantity** | **integer** | Defines new items quantity | [optional] [default to 0]
 **storeId** | **string** | Store Id | [optional] [default to null]

### Return type

[**BasketItemAdd200Response**](BasketItemAdd200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## basketLiveShippingServiceCreate

basket.live_shipping_service.create

Create live shipping rate service.

### Example

```bash
 basketLiveShippingServiceCreate  name=value  callback=value  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Shipping Service Name | [default to null]
 **callback** | **string** | Callback url that returns shipping rates. It should be able to accept POST requests with json data. | [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]

### Return type

[**BasketLiveShippingServiceCreate200Response**](BasketLiveShippingServiceCreate200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## basketLiveShippingServiceDelete

basket.live_shipping_service.delete

Delete live shipping rate service.

### Example

```bash
 basketLiveShippingServiceDelete  id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **integer** | Entity id | [default to null]

### Return type

[**BasketLiveShippingServiceDelete200Response**](BasketLiveShippingServiceDelete200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## basketLiveShippingServiceList

basket.live_shipping_service.list

Retrieve a list of live shipping rate services.

### Example

```bash
 basketLiveShippingServiceList  start=value  count=value  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **storeId** | **string** | Store Id | [optional] [default to null]

### Return type

[**BasketLiveShippingServiceList200Response**](BasketLiveShippingServiceList200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

