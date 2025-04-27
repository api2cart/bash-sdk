# ReturnApi

All URIs are relative to */v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**returnActionList**](ReturnApi.md#returnActionList) | **GET** /return.action.list.json | return.action.list
[**returnCount**](ReturnApi.md#returnCount) | **GET** /return.count.json | return.count
[**returnInfo**](ReturnApi.md#returnInfo) | **GET** /return.info.json | return.info
[**returnList**](ReturnApi.md#returnList) | **GET** /return.list.json | return.list
[**returnReasonList**](ReturnApi.md#returnReasonList) | **GET** /return.reason.list.json | return.reason.list
[**returnStatusList**](ReturnApi.md#returnStatusList) | **GET** /return.status.list.json | return.status.list



## returnActionList

return.action.list

Retrieve list of return actions

### Example

```bash
 returnActionList
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ReturnActionList200Response**](ReturnActionList200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## returnCount

return.count

Count returns in store

### Example

```bash
 returnCount  order_ids=value  customer_id=value  store_id=value  status=value  return_type=value  created_from=value  created_to=value  modified_from=value  modified_to=value  report_request_id=value  disable_report_cache=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderIds** | **string** | Counts return requests specified by order ids | [optional] [default to null]
 **customerId** | **string** | Counts return requests quantity specified by customer id | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **status** | **string** | Defines status | [optional] [default to null]
 **returnType** | **string** | Retrieves returns specified by return type | [optional] [default to null]
 **createdFrom** | **string** | Retrieve entities from their creation date | [optional] [default to null]
 **createdTo** | **string** | Retrieve entities to their creation date | [optional] [default to null]
 **modifiedFrom** | **string** | Retrieve entities from their modification date | [optional] [default to null]
 **modifiedTo** | **string** | Retrieve entities to their modification date | [optional] [default to null]
 **reportRequestId** | **string** | Report request id | [optional] [default to null]
 **disableReportCache** | **boolean** | Disable report cache for current request | [optional] [default to false]

### Return type

[**ReturnCount200Response**](ReturnCount200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## returnInfo

return.info

Retrieve return information.

### Example

```bash
 returnInfo  id=value  order_id=value  store_id=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Entity id | [default to null]
 **orderId** | **string** | Defines the order id | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,order_products]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**ReturnInfo200Response**](ReturnInfo200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## returnList

return.list

Get list of return requests from store.

### Example

```bash
 returnList  start=value  count=value  page_cursor=value  order_id=value  order_ids=value  customer_id=value  store_id=value  status=value  return_type=value  created_from=value  created_to=value  modified_from=value  modified_to=value  response_fields=value  params=value  exclude=value  report_request_id=value  disable_report_cache=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **orderId** | **string** | Defines the order id | [optional] [default to null]
 **orderIds** | **string** | Retrieves return requests specified by order ids | [optional] [default to null]
 **customerId** | **string** | Retrieves return requests specified by customer id | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **status** | **string** | Defines status | [optional] [default to null]
 **returnType** | **string** | Retrieves returns specified by return type | [optional] [default to null]
 **createdFrom** | **string** | Retrieve entities from their creation date | [optional] [default to null]
 **createdTo** | **string** | Retrieve entities to their creation date | [optional] [default to null]
 **modifiedFrom** | **string** | Retrieve entities from their modification date | [optional] [default to null]
 **modifiedTo** | **string** | Retrieve entities to their modification date | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,order_products]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]
 **reportRequestId** | **string** | Report request id | [optional] [default to null]
 **disableReportCache** | **boolean** | Disable report cache for current request | [optional] [default to false]

### Return type

[**ModelResponseReturnList**](ModelResponseReturnList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## returnReasonList

return.reason.list

Retrieve list of return reasons

### Example

```bash
 returnReasonList  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storeId** | **string** | Store Id | [optional] [default to null]

### Return type

[**ReturnReasonList200Response**](ReturnReasonList200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## returnStatusList

return.status.list

Retrieve list of statuses

### Example

```bash
 returnStatusList
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ReturnStatusList200Response**](ReturnStatusList200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

