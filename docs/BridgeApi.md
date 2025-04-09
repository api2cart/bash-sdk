# BridgeApi

All URIs are relative to */v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**bridgeDelete**](BridgeApi.md#bridgeDelete) | **POST** /bridge.delete.json | bridge.delete
[**bridgeDownload**](BridgeApi.md#bridgeDownload) | **GET** /bridge.download.file | bridge.download
[**bridgeUpdate**](BridgeApi.md#bridgeUpdate) | **POST** /bridge.update.json | bridge.update



## bridgeDelete

bridge.delete

Delete bridge from the store.

### Example

```bash
 bridgeDelete
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AttributeValueDelete200Response**](AttributeValueDelete200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## bridgeDownload

bridge.download

Download bridge for store.</br>Please note that the method would not work if you call it from Swagger UI.

### Example

```bash
 bridgeDownload  whitelabel=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **whitelabel** | **boolean** | Identifies if there is a necessity to download whitelabel bridge. | [optional] [default to false]

### Return type

**binary**

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/zip

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## bridgeUpdate

bridge.update

Update bridge in the store.

### Example

```bash
 bridgeUpdate
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AttributeUpdate200Response**](AttributeUpdate200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

