# WebhookApi

All URIs are relative to */v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**webhookCount**](WebhookApi.md#webhookCount) | **GET** /webhook.count.json | webhook.count
[**webhookCreate**](WebhookApi.md#webhookCreate) | **POST** /webhook.create.json | webhook.create
[**webhookDelete**](WebhookApi.md#webhookDelete) | **DELETE** /webhook.delete.json | webhook.delete
[**webhookEvents**](WebhookApi.md#webhookEvents) | **GET** /webhook.events.json | webhook.events
[**webhookList**](WebhookApi.md#webhookList) | **GET** /webhook.list.json | webhook.list
[**webhookUpdate**](WebhookApi.md#webhookUpdate) | **PUT** /webhook.update.json | webhook.update



## webhookCount

webhook.count

Count registered webhooks on the store.

### Example

```bash
 webhookCount  entity=value  action=value  active=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entity** | **string** | The entity you want to filter webhooks by (e.g. order or product) | [optional] [default to null]
 **action** | **string** | The action you want to filter webhooks by (e.g. order or product) | [optional] [default to null]
 **active** | **boolean** | The webhook status you want to filter webhooks by | [optional] [default to null]

### Return type

[**WebhookCount200Response**](WebhookCount200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## webhookCreate

webhook.create

Create webhook on the store and subscribe to it.

### Example

```bash
 webhookCreate  entity=value  action=value  callback=value  label=value  fields=value  active=value  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entity** | **string** | Specify the entity that you want to enable webhooks for (e.g product, order, customer, category) | [default to null]
 **action** | **string** | Specify what action (event) will trigger the webhook (e.g add, delete, or update) | [default to null]
 **callback** | **string** | Callback url that returns shipping rates. It should be able to accept POST requests with json data. | [optional] [default to null]
 **label** | **string** | The name you give to the webhook | [optional] [default to null]
 **fields** | **string** | Fields the webhook should send | [optional] [default to force_all]
 **active** | **boolean** | Webhook status | [optional] [default to true]
 **storeId** | **string** | Defines store id where the webhook should be assigned | [optional] [default to null]

### Return type

[**BasketLiveShippingServiceCreate200Response**](BasketLiveShippingServiceCreate200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## webhookDelete

webhook.delete

Delete registered webhook on the store.

### Example

```bash
 webhookDelete  id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Webhook id | [default to null]

### Return type

[**AttributeDelete200Response**](AttributeDelete200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## webhookEvents

webhook.events

List all Webhooks that are available on this store.

### Example

```bash
 webhookEvents
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**WebhookEvents200Response**](WebhookEvents200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## webhookList

webhook.list

List registered webhook on the store.

### Example

```bash
 webhookList  params=value  start=value  count=value  entity=value  action=value  active=value  ids=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,entity,action,callback]
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **entity** | **string** | The entity you want to filter webhooks by (e.g. order or product) | [optional] [default to null]
 **action** | **string** | The action you want to filter webhooks by (e.g. add, update, or delete) | [optional] [default to null]
 **active** | **boolean** | The webhook status you want to filter webhooks by | [optional] [default to null]
 **ids** | **string** | List of сomma-separated webhook ids | [optional] [default to null]

### Return type

[**WebhookList200Response**](WebhookList200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## webhookUpdate

webhook.update

Update Webhooks parameters.

### Example

```bash
 webhookUpdate  id=value  callback=value  label=value  fields=value  active=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Webhook id | [default to null]
 **callback** | **string** | Callback url that returns shipping rates. It should be able to accept POST requests with json data. | [optional] [default to null]
 **label** | **string** | The name you give to the webhook | [optional] [default to null]
 **fields** | **string** | Fields the webhook should send | [optional] [default to null]
 **active** | **boolean** | Webhook status | [optional] [default to null]

### Return type

[**ProductImageUpdate200Response**](ProductImageUpdate200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

