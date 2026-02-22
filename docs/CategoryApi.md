# CategoryApi

All URIs are relative to */v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**categoryAdd**](CategoryApi.md#categoryAdd) | **POST** /category.add.json | category.add
[**categoryAddBatch**](CategoryApi.md#categoryAddBatch) | **POST** /category.add.batch.json | category.add.batch
[**categoryAssign**](CategoryApi.md#categoryAssign) | **POST** /category.assign.json | category.assign
[**categoryCount**](CategoryApi.md#categoryCount) | **GET** /category.count.json | category.count
[**categoryDelete**](CategoryApi.md#categoryDelete) | **DELETE** /category.delete.json | category.delete
[**categoryDeleteBatch**](CategoryApi.md#categoryDeleteBatch) | **POST** /category.delete.batch.json | category.delete.batch
[**categoryFind**](CategoryApi.md#categoryFind) | **GET** /category.find.json | category.find
[**categoryImageAdd**](CategoryApi.md#categoryImageAdd) | **POST** /category.image.add.json | category.image.add
[**categoryImageDelete**](CategoryApi.md#categoryImageDelete) | **DELETE** /category.image.delete.json | category.image.delete
[**categoryInfo**](CategoryApi.md#categoryInfo) | **GET** /category.info.json | category.info
[**categoryList**](CategoryApi.md#categoryList) | **GET** /category.list.json | category.list
[**categoryUnassign**](CategoryApi.md#categoryUnassign) | **POST** /category.unassign.json | category.unassign
[**categoryUpdate**](CategoryApi.md#categoryUpdate) | **PUT** /category.update.json | category.update



## categoryAdd

category.add

Add new category in store

### Example

```bash
 categoryAdd  name=value  description=value  short_description=value  parent_id=value  avail=value  created_time=value  modified_time=value  sort_order=value  meta_title=value  meta_description=value  meta_keywords=value  seo_url=value  store_id=value  stores_ids=value  lang_id=value  idempotency_key=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Defines category's name that has to be added | [default to null]
 **description** | **string** | Defines category's description | [optional] [default to null]
 **shortDescription** | **string** | Defines short description | [optional] [default to null]
 **parentId** | **string** | Adds categories specified by parent id | [optional] [default to null]
 **avail** | **boolean** | Defines category's visibility status | [optional] [default to true]
 **createdTime** | **string** | Entity's date creation | [optional] [default to null]
 **modifiedTime** | **string** | Entity's date modification | [optional] [default to null]
 **sortOrder** | **integer** | Sort number in the list | [optional] [default to 0]
 **metaTitle** | **string** | Defines unique meta title for each entity | [optional] [default to null]
 **metaDescription** | **string** | Defines unique meta description of a entity | [optional] [default to null]
 **metaKeywords** | **string** | Defines unique meta keywords for each entity | [optional] [default to null]
 **seoUrl** | **string** | Defines unique category's URL for SEO | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **storesIds** | **string** | Create category in the stores that is specified by comma-separated stores' id | [optional] [default to null]
 **langId** | **string** | Language id | [optional] [default to null]
 **idempotencyKey** | **string** | A unique identifier associated with a specific request. Repeated requests with the same <strong>idempotency_key</strong> return a cached response without re-executing the business logic. <strong>Please note that the cache lifetime is 15 minutes.</strong> | [optional] [default to null]

### Return type

[**CategoryAdd200Response**](CategoryAdd200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## categoryAddBatch

category.add.batch

Add new categories to the store.

### Example

```bash
 categoryAddBatch
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categoryAddBatch** | [**CategoryAddBatch**](CategoryAddBatch.md) |  |

### Return type

[**CategoryAddBatch200Response**](CategoryAddBatch200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## categoryAssign

category.assign

Assign category to product

### Example

```bash
 categoryAssign  category_id=value  product_id=value  store_id=value  idempotency_key=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categoryId** | **string** | Defines category assign, specified by category id | [default to null]
 **productId** | **string** | Defines category assign to the product, specified by product id | [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **idempotencyKey** | **string** | A unique identifier associated with a specific request. Repeated requests with the same <strong>idempotency_key</strong> return a cached response without re-executing the business logic. <strong>Please note that the cache lifetime is 15 minutes.</strong> | [optional] [default to null]

### Return type

[**CategoryAssign200Response**](CategoryAssign200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## categoryCount

category.count

Count categories in store.

### Example

```bash
 categoryCount  parent_id=value  store_id=value  lang_id=value  avail=value  created_from=value  created_to=value  modified_from=value  modified_to=value  product_type=value  find_value=value  find_where=value  report_request_id=value  disable_report_cache=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **parentId** | **string** | Counts categories specified by parent id | [optional] [default to null]
 **storeId** | **string** | Counts category specified by store id | [optional] [default to null]
 **langId** | **string** | Counts category specified by language id | [optional] [default to null]
 **avail** | **boolean** | Defines category's visibility status | [optional] [default to true]
 **createdFrom** | **string** | Retrieve entities from their creation date | [optional] [default to null]
 **createdTo** | **string** | Retrieve entities to their creation date | [optional] [default to null]
 **modifiedFrom** | **string** | Retrieve entities from their modification date | [optional] [default to null]
 **modifiedTo** | **string** | Retrieve entities to their modification date | [optional] [default to null]
 **productType** | **string** | A categorization for the product | [optional] [default to null]
 **findValue** | **string** | Entity search that is specified by some value | [optional] [default to null]
 **findWhere** | **string** | Counts categories that are searched specified by field | [optional] [default to null]
 **reportRequestId** | **string** | Report request id | [optional] [default to null]
 **disableReportCache** | **boolean** | Disable report cache for current request | [optional] [default to false]

### Return type

[**CategoryCount200Response**](CategoryCount200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## categoryDelete

category.delete

Delete category in store

### Example

```bash
 categoryDelete  id=value  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Defines category removal, specified by category id | [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]

### Return type

[**CategoryDelete200Response**](CategoryDelete200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## categoryDeleteBatch

category.delete.batch

Delete categories from the store.

### Example

```bash
 categoryDeleteBatch
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categoryDeleteBatch** | [**CategoryDeleteBatch**](CategoryDeleteBatch.md) |  |

### Return type

[**CategoryAddBatch200Response**](CategoryAddBatch200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## categoryFind

category.find

Search category in store. \"Laptop\" is specified here by default.

### Example

```bash
 categoryFind  find_value=value  find_where=value  find_params=value  store_id=value  lang_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **findValue** | **string** | Entity search that is specified by some value | [default to null]
 **findWhere** | **string** | Entity search that is specified by the comma-separated unique fields | [optional] [default to name]
 **findParams** | **string** | Entity search that is specified by comma-separated parameters | [optional] [default to whole_words]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **langId** | **string** | Language id | [optional] [default to null]

### Return type

[**CategoryFind200Response**](CategoryFind200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## categoryImageAdd

category.image.add

Add image to category

### Example

```bash
 categoryImageAdd  category_id=value  image_name=value  url=value  type=value  store_id=value  label=value  mime=value  position=value  apply_to_translations=value  idempotency_key=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categoryId** | **string** | Defines category id where the image should be added | [default to null]
 **imageName** | **string** | Defines image's name | [default to null]
 **url** | **string** | Defines URL of the image that has to be added | [default to null]
 **type** | **string** | Defines image's types that are specified by comma-separated list | [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **label** | **string** | Defines alternative text that has to be attached to the picture | [optional] [default to null]
 **mime** | **string** | Mime type of image http://en.wikipedia.org/wiki/Internet_media_type. | [optional] [default to null]
 **position** | **integer** | Defines image’s position in the list | [optional] [default to 0]
 **applyToTranslations** | **boolean** | Defines whether to add image to all category translations | [optional] [default to true]
 **idempotencyKey** | **string** | A unique identifier associated with a specific request. Repeated requests with the same <strong>idempotency_key</strong> return a cached response without re-executing the business logic. <strong>Please note that the cache lifetime is 15 minutes.</strong> | [optional] [default to null]

### Return type

[**CategoryImageAdd200Response**](CategoryImageAdd200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## categoryImageDelete

category.image.delete

Delete image

### Example

```bash
 categoryImageDelete  category_id=value  image_id=value  store_id=value  apply_to_translations=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categoryId** | **string** | Defines category id where the image should be deleted | [default to null]
 **imageId** | **string** | Define image id | [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **applyToTranslations** | **boolean** | Defines whether to delete image from all category translations | [optional] [default to true]

### Return type

[**AttributeDelete200Response**](AttributeDelete200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## categoryInfo

category.info

Get category info about category ID*** or specify other category ID.

### Example

```bash
 categoryInfo  id=value  store_id=value  lang_id=value  schema_type=value  response_fields=value  params=value  exclude=value  report_request_id=value  disable_report_cache=value  use_latest_api_version=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Retrieves category's info specified by category id | [default to null]
 **storeId** | **string** | Retrieves category info  specified by store id | [optional] [default to null]
 **langId** | **string** | Retrieves category info  specified by language id | [optional] [default to null]
 **schemaType** | **string** | The name of the requirements set for the provided schema. | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,parent_id,name,description]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]
 **reportRequestId** | **string** | Report request id | [optional] [default to null]
 **disableReportCache** | **boolean** | Disable report cache for current request | [optional] [default to false]
 **useLatestApiVersion** | **boolean** | Use the latest platform API version | [optional] [default to false]

### Return type

[**CategoryInfo200Response**](CategoryInfo200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## categoryList

category.list

Get list of categories from store.

### Example

```bash
 categoryList  start=value  count=value  page_cursor=value  store_id=value  lang_id=value  parent_id=value  avail=value  product_type=value  created_from=value  created_to=value  modified_from=value  modified_to=value  find_value=value  find_where=value  response_fields=value  params=value  exclude=value  report_request_id=value  disable_report_cache=value  disable_cache=value  use_latest_api_version=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **storeId** | **string** | Retrieves categories specified by store id | [optional] [default to null]
 **langId** | **string** | Retrieves categorys specified by language id | [optional] [default to null]
 **parentId** | **string** | Retrieves categories specified by parent id | [optional] [default to null]
 **avail** | **boolean** | Defines category's visibility status | [optional] [default to true]
 **productType** | **string** | A categorization for the product | [optional] [default to null]
 **createdFrom** | **string** | Retrieve entities from their creation date | [optional] [default to null]
 **createdTo** | **string** | Retrieve entities to their creation date | [optional] [default to null]
 **modifiedFrom** | **string** | Retrieve entities from their modification date | [optional] [default to null]
 **modifiedTo** | **string** | Retrieve entities to their modification date | [optional] [default to null]
 **findValue** | **string** | Entity search that is specified by some value | [optional] [default to null]
 **findWhere** | **string** | Category search that is specified by field | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,parent_id,name,description]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]
 **reportRequestId** | **string** | Report request id | [optional] [default to null]
 **disableReportCache** | **boolean** | Disable report cache for current request | [optional] [default to false]
 **disableCache** | **boolean** | Disable cache for current request | [optional] [default to false]
 **useLatestApiVersion** | **boolean** | Use the latest platform API version | [optional] [default to false]

### Return type

[**ModelResponseCategoryList**](ModelResponseCategoryList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## categoryUnassign

category.unassign

Unassign category to product

### Example

```bash
 categoryUnassign  category_id=value  product_id=value  store_id=value  idempotency_key=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categoryId** | **string** | Defines category unassign, specified by category id | [default to null]
 **productId** | **string** | Defines category unassign to the product, specified by product id | [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **idempotencyKey** | **string** | A unique identifier associated with a specific request. Repeated requests with the same <strong>idempotency_key</strong> return a cached response without re-executing the business logic. <strong>Please note that the cache lifetime is 15 minutes.</strong> | [optional] [default to null]

### Return type

[**CategoryAssign200Response**](CategoryAssign200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## categoryUpdate

category.update

Update category in store

### Example

```bash
 categoryUpdate  id=value  name=value  description=value  short_description=value  parent_id=value  avail=value  sort_order=value  modified_time=value  meta_title=value  meta_description=value  meta_keywords=value  seo_url=value  store_id=value  stores_ids=value  lang_id=value  idempotency_key=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Defines category update specified by category id | [default to null]
 **name** | **string** | Defines new category’s name | [optional] [default to null]
 **description** | **string** | Defines new category's description | [optional] [default to null]
 **shortDescription** | **string** | Defines short description | [optional] [default to null]
 **parentId** | **string** | Defines new parent category id | [optional] [default to null]
 **avail** | **boolean** | Defines category's visibility status | [optional] [default to null]
 **sortOrder** | **integer** | Sort number in the list | [optional] [default to null]
 **modifiedTime** | **string** | Entity's date modification | [optional] [default to null]
 **metaTitle** | **string** | Defines unique meta title for each entity | [optional] [default to null]
 **metaDescription** | **string** | Defines unique meta description of a entity | [optional] [default to null]
 **metaKeywords** | **string** | Defines unique meta keywords for each entity | [optional] [default to null]
 **seoUrl** | **string** | Defines unique category's URL for SEO | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **storesIds** | **string** | Update category in the stores that is specified by comma-separated stores' id | [optional] [default to null]
 **langId** | **string** | Language id | [optional] [default to null]
 **idempotencyKey** | **string** | A unique identifier associated with a specific request. Repeated requests with the same <strong>idempotency_key</strong> return a cached response without re-executing the business logic. <strong>Please note that the cache lifetime is 15 minutes.</strong> | [optional] [default to null]

### Return type

[**AccountConfigUpdate200Response**](AccountConfigUpdate200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

