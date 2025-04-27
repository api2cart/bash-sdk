# BatchApi

All URIs are relative to */v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**batchJobList**](BatchApi.md#batchJobList) | **GET** /batch.job.list.json | batch.job.list
[**batchJobResult**](BatchApi.md#batchJobResult) | **GET** /batch.job.result.json | batch.job.result



## batchJobList

batch.job.list

Get list of recent jobs

### Example

```bash
 batchJobList  count=value  page_cursor=value  ids=value  created_from=value  created_to=value  processed_from=value  processed_to=value  response_fields=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **ids** | **string** | Filter batch jobs by ids | [optional] [default to null]
 **createdFrom** | **string** | Retrieve entities from their creation date | [optional] [default to null]
 **createdTo** | **string** | Retrieve entities to their creation date | [optional] [default to null]
 **processedFrom** | **string** | Retrieve entities according to their processing datetime | [optional] [default to null]
 **processedTo** | **string** | Retrieve entities according to their processing datetime | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to {return_code,return_message,pagination,result}]

### Return type

[**ModelResponseBatchJobList**](ModelResponseBatchJobList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## batchJobResult

batch.job.result

Get job result data

### Example

```bash
 batchJobResult  id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Entity id | [default to null]

### Return type

[**ResponseBatchJobResult**](ResponseBatchJobResult.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

