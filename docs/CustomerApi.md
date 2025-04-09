# CustomerApi

All URIs are relative to */v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**customerAdd**](CustomerApi.md#customerAdd) | **POST** /customer.add.json | customer.add
[**customerAddressAdd**](CustomerApi.md#customerAddressAdd) | **POST** /customer.address.add.json | customer.address.add
[**customerAttributeList**](CustomerApi.md#customerAttributeList) | **GET** /customer.attribute.list.json | customer.attribute.list
[**customerCount**](CustomerApi.md#customerCount) | **GET** /customer.count.json | customer.count
[**customerDelete**](CustomerApi.md#customerDelete) | **DELETE** /customer.delete.json | customer.delete
[**customerFind**](CustomerApi.md#customerFind) | **GET** /customer.find.json | customer.find
[**customerGroupAdd**](CustomerApi.md#customerGroupAdd) | **POST** /customer.group.add.json | customer.group.add
[**customerGroupList**](CustomerApi.md#customerGroupList) | **GET** /customer.group.list.json | customer.group.list
[**customerInfo**](CustomerApi.md#customerInfo) | **GET** /customer.info.json | customer.info
[**customerList**](CustomerApi.md#customerList) | **GET** /customer.list.json | customer.list
[**customerUpdate**](CustomerApi.md#customerUpdate) | **PUT** /customer.update.json | customer.update
[**customerWishlistList**](CustomerApi.md#customerWishlistList) | **GET** /customer.wishlist.list.json | customer.wishlist.list



## customerAdd

customer.add

Add customer into store.

### Example

```bash
 customerAdd
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customerAdd** | [**CustomerAdd**](CustomerAdd.md) |  |

### Return type

[**CustomerAdd200Response**](CustomerAdd200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## customerAddressAdd

customer.address.add

Add customer address.

### Example

```bash
 customerAddressAdd
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customerAddressAdd** | [**CustomerAddressAdd**](CustomerAddressAdd.md) |  |

### Return type

[**AttributeAdd200Response**](AttributeAdd200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## customerAttributeList

customer.attribute.list

Get attributes for specific customer

### Example

```bash
 customerAttributeList  customer_id=value  count=value  page_cursor=value  store_id=value  lang_id=value  params=value  exclude=value  response_fields=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customerId** | **string** | Retrieves orders specified by customer id | [default to null]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **langId** | **string** | Language id | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to force_all]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]

### Return type

[**ModelResponseCustomerAttributeList**](ModelResponseCustomerAttributeList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## customerCount

customer.count

Get number of customers from store.

### Example

```bash
 customerCount  group_id=value  created_from=value  created_to=value  modified_from=value  modified_to=value  store_id=value  customer_list_id=value  avail=value  find_value=value  find_where=value  ids=value  since_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **groupId** | **string** | Customer group_id | [optional] [default to null]
 **createdFrom** | **string** | Retrieve entities from their creation date | [optional] [default to null]
 **createdTo** | **string** | Retrieve entities to their creation date | [optional] [default to null]
 **modifiedFrom** | **string** | Retrieve entities from their modification date | [optional] [default to null]
 **modifiedTo** | **string** | Retrieve entities to their modification date | [optional] [default to null]
 **storeId** | **string** | Counts customer specified by store id | [optional] [default to null]
 **customerListId** | **string** | The numeric ID of the customer list in Demandware. | [optional] [default to null]
 **avail** | **boolean** | Defines category's visibility status | [optional] [default to true]
 **findValue** | **string** | Entity search that is specified by some value | [optional] [default to null]
 **findWhere** | **string** | Counts customers that are searched specified by field | [optional] [default to null]
 **ids** | **string** | Counts customers specified by ids | [optional] [default to null]
 **sinceId** | **string** | Retrieve entities starting from the specified id. | [optional] [default to null]

### Return type

[**CustomerCount200Response**](CustomerCount200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## customerDelete

customer.delete

Delete customer from store.

### Example

```bash
 customerDelete  id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Identifies customer specified by the id | [default to null]

### Return type

[**CustomerDelete200Response**](CustomerDelete200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## customerFind

customer.find

Find customers in store.

### Example

```bash
 customerFind  find_value=value  find_where=value  find_params=value  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **findValue** | **string** | Entity search that is specified by some value | [default to null]
 **findWhere** | **string** | Entity search that is specified by the comma-separated unique fields | [optional] [default to email]
 **findParams** | **string** | Entity search that is specified by comma-separated parameters | [optional] [default to whole_words]
 **storeId** | **string** | Store Id | [optional] [default to null]

### Return type

[**CustomerFind200Response**](CustomerFind200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## customerGroupAdd

customer.group.add

Create customer group.

### Example

```bash
 customerGroupAdd  name=value  store_id=value  stores_ids=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Customer group name | [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **storesIds** | **string** | Assign customer group to the stores that is specified by comma-separated stores' id | [optional] [default to null]

### Return type

[**CustomerGroupAdd200Response**](CustomerGroupAdd200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## customerGroupList

customer.group.list

Get list of customers groups.

### Example

```bash
 customerGroupList  disable_cache=value  page_cursor=value  start=value  count=value  store_id=value  lang_id=value  group_ids=value  params=value  exclude=value  response_fields=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **disableCache** | **boolean** | Disable cache for current request | [optional] [default to false]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **langId** | **string** | Language id | [optional] [default to null]
 **groupIds** | **string** | Groups that will be assigned to a customer | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,name,additional_fields]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]

### Return type

[**ModelResponseCustomerGroupList**](ModelResponseCustomerGroupList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## customerInfo

customer.info

Get customers' details from store.

### Example

```bash
 customerInfo  id=value  params=value  response_fields=value  exclude=value  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Retrieves customer's info specified by customer id | [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,email,first_name,last_name]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]
 **storeId** | **string** | Retrieves customer info specified by store id | [optional] [default to null]

### Return type

[**CustomerInfo200Response**](CustomerInfo200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## customerList

customer.list

Get list of customers from store.

### Example

```bash
 customerList  page_cursor=value  start=value  count=value  created_from=value  created_to=value  modified_from=value  modified_to=value  params=value  response_fields=value  exclude=value  group_id=value  store_id=value  customer_list_id=value  avail=value  find_value=value  find_where=value  sort_by=value  sort_direction=value  ids=value  since_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **createdFrom** | **string** | Retrieve entities from their creation date | [optional] [default to null]
 **createdTo** | **string** | Retrieve entities to their creation date | [optional] [default to null]
 **modifiedFrom** | **string** | Retrieve entities from their modification date | [optional] [default to null]
 **modifiedTo** | **string** | Retrieve entities to their modification date | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,email,first_name,last_name]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]
 **groupId** | **string** | Customer group_id | [optional] [default to null]
 **storeId** | **string** | Retrieves customers specified by store id | [optional] [default to null]
 **customerListId** | **string** | The numeric ID of the customer list in Demandware. | [optional] [default to null]
 **avail** | **boolean** | Defines category's visibility status | [optional] [default to true]
 **findValue** | **string** | Entity search that is specified by some value | [optional] [default to null]
 **findWhere** | **string** | Customer search that is specified by field | [optional] [default to null]
 **sortBy** | **string** | Set field to sort by | [optional] [default to created_time]
 **sortDirection** | **string** | Set sorting direction | [optional] [default to asc]
 **ids** | **string** | Retrieves customers specified by ids | [optional] [default to null]
 **sinceId** | **string** | Retrieve entities starting from the specified id. | [optional] [default to null]

### Return type

[**ModelResponseCustomerList**](ModelResponseCustomerList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## customerUpdate

customer.update

Update information of customer in store.

### Example

```bash
 customerUpdate
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customerUpdate** | [**CustomerUpdate**](CustomerUpdate.md) |  |

### Return type

[**AccountConfigUpdate200Response**](AccountConfigUpdate200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## customerWishlistList

customer.wishlist.list

Get a Wish List of customer from the store.

### Example

```bash
 customerWishlistList  customer_id=value  id=value  store_id=value  start=value  count=value  page_cursor=value  response_fields=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customerId** | **string** | Retrieves orders specified by customer id | [default to null]
 **id** | **string** | Entity id | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to {return_code,return_message,pagination,result}]

### Return type

[**ModelResponseCustomerWishlistList**](ModelResponseCustomerWishlistList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

