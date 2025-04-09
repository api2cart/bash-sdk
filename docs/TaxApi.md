# TaxApi

All URIs are relative to */v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**taxClassInfo**](TaxApi.md#taxClassInfo) | **GET** /tax.class.info.json | tax.class.info
[**taxClassList**](TaxApi.md#taxClassList) | **GET** /tax.class.list.json | tax.class.list



## taxClassInfo

tax.class.info

Use this method to get information about a tax class and its rates. It allows you to calculate the tax percentage for a specific customer's address. This information contains relatively static data that rarely changes, so API2Cart may cache certain data to reduce the load on the store and speed up request execution. We also recommend that you cache the response of this method on your side to save requests. If you need to clear the cache for a specific store, use the cart.validate method.

### Example

```bash
 taxClassInfo  tax_class_id=value  store_id=value  lang_id=value  params=value  response_fields=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **taxClassId** | **string** | Retrieves taxes specified by class id | [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **langId** | **string** | Language id | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to tax_class_id,name,avail]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**ModelResponseTaxClassInfo**](ModelResponseTaxClassInfo.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## taxClassList

tax.class.list

Get list of tax classes from your store.

### Example

```bash
 taxClassList  created_to=value  created_from=value  modified_to=value  modified_from=value  find_value=value  find_where=value  store_id=value  count=value  page_cursor=value  response_fields=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createdTo** | **string** | Retrieve entities to their creation date | [optional] [default to null]
 **createdFrom** | **string** | Retrieve entities from their creation date | [optional] [default to null]
 **modifiedTo** | **string** | Retrieve entities to their modification date | [optional] [default to null]
 **modifiedFrom** | **string** | Retrieve entities from their modification date | [optional] [default to null]
 **findValue** | **string** | Entity search that is specified by some value | [optional] [default to null]
 **findWhere** | **string** | Tax class search that is specified by field | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to {return_code,return_message,pagination,result}]

### Return type

[**ModelResponseTaxClassList**](ModelResponseTaxClassList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

