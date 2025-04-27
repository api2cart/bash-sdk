# AttributeApi

All URIs are relative to */v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**attributeAdd**](AttributeApi.md#attributeAdd) | **POST** /attribute.add.json | attribute.add
[**attributeAssignGroup**](AttributeApi.md#attributeAssignGroup) | **POST** /attribute.assign.group.json | attribute.assign.group
[**attributeAssignSet**](AttributeApi.md#attributeAssignSet) | **POST** /attribute.assign.set.json | attribute.assign.set
[**attributeAttributesetList**](AttributeApi.md#attributeAttributesetList) | **GET** /attribute.attributeset.list.json | attribute.attributeset.list
[**attributeCount**](AttributeApi.md#attributeCount) | **GET** /attribute.count.json | attribute.count
[**attributeDelete**](AttributeApi.md#attributeDelete) | **DELETE** /attribute.delete.json | attribute.delete
[**attributeGroupList**](AttributeApi.md#attributeGroupList) | **GET** /attribute.group.list.json | attribute.group.list
[**attributeInfo**](AttributeApi.md#attributeInfo) | **GET** /attribute.info.json | attribute.info
[**attributeList**](AttributeApi.md#attributeList) | **GET** /attribute.list.json | attribute.list
[**attributeTypeList**](AttributeApi.md#attributeTypeList) | **GET** /attribute.type.list.json | attribute.type.list
[**attributeUnassignGroup**](AttributeApi.md#attributeUnassignGroup) | **POST** /attribute.unassign.group.json | attribute.unassign.group
[**attributeUnassignSet**](AttributeApi.md#attributeUnassignSet) | **POST** /attribute.unassign.set.json | attribute.unassign.set
[**attributeUpdate**](AttributeApi.md#attributeUpdate) | **PUT** /attribute.update.json | attribute.update
[**attributeValueAdd**](AttributeApi.md#attributeValueAdd) | **POST** /attribute.value.add.json | attribute.value.add
[**attributeValueDelete**](AttributeApi.md#attributeValueDelete) | **DELETE** /attribute.value.delete.json | attribute.value.delete
[**attributeValueUpdate**](AttributeApi.md#attributeValueUpdate) | **PUT** /attribute.value.update.json | attribute.value.update



## attributeAdd

attribute.add

Add new attribute

### Example

```bash
 attributeAdd  type=value  name=value  code=value  store_id=value  lang_id=value  visible=value  required=value  position=value  attribute_group_id=value  is_global=value  is_searchable=value  is_filterable=value  is_comparable=value  is_html_allowed_on_front=value  is_filterable_in_search=value  is_configurable=value  is_visible_in_advanced_search=value  is_used_for_promo_rules=value  used_in_product_listing=value  used_for_sort_by=value  apply_to=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **string** | Defines attribute's type | [default to null]
 **name** | **string** | Defines attributes's name | [default to null]
 **code** | **string** | Entity code | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **langId** | **string** | Language id | [optional] [default to null]
 **visible** | **boolean** | Set visibility status | [optional] [default to false]
 **required** | **boolean** | Defines if the option is required | [optional] [default to false]
 **position** | **integer** | Attribute's position | [optional] [default to 0]
 **attributeGroupId** | **string** | Filter by attribute_group_id | [optional] [default to null]
 **isGlobal** | **string** | Attribute saving scope | [optional] [default to Store]
 **isSearchable** | **boolean** | Use attribute in Quick Search | [optional] [default to false]
 **isFilterable** | **string** | Use In Layered Navigation | [optional] [default to No]
 **isComparable** | **boolean** | Comparable on Front-end | [optional] [default to false]
 **isHtmlAllowedOnFront** | **boolean** | Allow HTML Tags on Frontend | [optional] [default to false]
 **isFilterableInSearch** | **boolean** | Use In Search Results Layered Navigation | [optional] [default to false]
 **isConfigurable** | **boolean** | Use To Create Configurable Product | [optional] [default to false]
 **isVisibleInAdvancedSearch** | **boolean** | Use in Advanced Search | [optional] [default to false]
 **isUsedForPromoRules** | **boolean** | Use for Promo Rule Conditions | [optional] [default to false]
 **usedInProductListing** | **boolean** | Used in Product Listing | [optional] [default to false]
 **usedForSortBy** | **boolean** | Used for Sorting in Product Listing | [optional] [default to false]
 **applyTo** | **string** | Types of products which can have this attribute | [optional] [default to all_types]

### Return type

[**AttributeAdd200Response**](AttributeAdd200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## attributeAssignGroup

attribute.assign.group

Assign attribute to the group

### Example

```bash
 attributeAssignGroup  id=value  group_id=value  attribute_set_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Entity id | [default to null]
 **groupId** | **string** | Attribute group_id | [default to null]
 **attributeSetId** | **string** | Attribute set id | [optional] [default to null]

### Return type

[**AttributeAssignGroup200Response**](AttributeAssignGroup200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## attributeAssignSet

attribute.assign.set

Assign attribute to the attribute set

### Example

```bash
 attributeAssignSet  id=value  attribute_set_id=value  group_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Entity id | [default to null]
 **attributeSetId** | **string** | Attribute set id | [default to null]
 **groupId** | **string** | Attribute group_id | [optional] [default to null]

### Return type

[**AttributeAssignGroup200Response**](AttributeAssignGroup200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## attributeAttributesetList

attribute.attributeset.list

Get attribute_set list

### Example

```bash
 attributeAttributesetList  start=value  count=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,name]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**ModelResponseAttributeAttributesetList**](ModelResponseAttributeAttributesetList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## attributeCount

attribute.count

Get attributes count

### Example

```bash
 attributeCount  type=value  attribute_set_id=value  store_id=value  lang_id=value  visible=value  required=value  system=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **string** | Defines attribute's type | [optional] [default to null]
 **attributeSetId** | **string** | Filter items by attribute set id | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **langId** | **string** | Language id | [optional] [default to null]
 **visible** | **boolean** | Filter items by visibility status | [optional] [default to null]
 **required** | **boolean** | Defines if the option is required | [optional] [default to null]
 **system** | **boolean** | True if attribute is system | [optional] [default to null]

### Return type

[**AttributeCount200Response**](AttributeCount200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## attributeDelete

attribute.delete

Delete attribute from store

### Example

```bash
 attributeDelete  id=value  store_id=value
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


## attributeGroupList

attribute.group.list

Get attribute group list

### Example

```bash
 attributeGroupList  start=value  count=value  attribute_set_id=value  lang_id=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **attributeSetId** | **string** | Attribute set id | [optional] [default to null]
 **langId** | **string** | Language id | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,name]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**ModelResponseAttributeGroupList**](ModelResponseAttributeGroupList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## attributeInfo

attribute.info

Get information about a specific global attribute by its ID.

### Example

```bash
 attributeInfo  id=value  attribute_set_id=value  store_id=value  lang_id=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Entity id | [default to null]
 **attributeSetId** | **string** | Attribute set id | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **langId** | **string** | Language id | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to force_all]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**AttributeInfo200Response**](AttributeInfo200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## attributeList

attribute.list

Get a list of global attributes.

### Example

```bash
 attributeList  start=value  count=value  attribute_ids=value  attribute_set_id=value  store_id=value  lang_id=value  type=value  visible=value  required=value  system=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **attributeIds** | **string** | Filter attributes by ids | [optional] [default to null]
 **attributeSetId** | **string** | Filter items by attribute set id | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **langId** | **string** | Retrieves attributes on specified language id | [optional] [default to null]
 **type** | **string** | Defines attribute's type | [optional] [default to null]
 **visible** | **boolean** | Filter items by visibility status | [optional] [default to null]
 **required** | **boolean** | Defines if the option is required | [optional] [default to null]
 **system** | **boolean** | True if attribute is system | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,name,code,type]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**ModelResponseAttributeList**](ModelResponseAttributeList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## attributeTypeList

attribute.type.list

Get list of supported attributes types

### Example

```bash
 attributeTypeList
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AttributeTypeList200Response**](AttributeTypeList200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## attributeUnassignGroup

attribute.unassign.group

Unassign attribute from group

### Example

```bash
 attributeUnassignGroup  id=value  group_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Entity id | [default to null]
 **groupId** | **string** | Customer group_id | [default to null]

### Return type

[**AttributeUnassignGroup200Response**](AttributeUnassignGroup200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## attributeUnassignSet

attribute.unassign.set

Unassign attribute from attribute set

### Example

```bash
 attributeUnassignSet  id=value  attribute_set_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Entity id | [default to null]
 **attributeSetId** | **string** | Attribute set id | [default to null]

### Return type

[**AttributeUnassignGroup200Response**](AttributeUnassignGroup200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## attributeUpdate

attribute.update

Update attribute data

### Example

```bash
 attributeUpdate  id=value  name=value  store_id=value  lang_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Entity id | [default to null]
 **name** | **string** | Defines new attributes's name | [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **langId** | **string** | Language id | [optional] [default to null]

### Return type

[**AttributeUpdate200Response**](AttributeUpdate200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## attributeValueAdd

attribute.value.add

Add new value to attribute.

### Example

```bash
 attributeValueAdd  attribute_id=value  name=value  code=value  description=value  store_id=value  lang_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **attributeId** | **string** | Attribute Id | [default to null]
 **name** | **string** | Defines attribute value's name | [default to null]
 **code** | **string** | Entity code | [optional] [default to null]
 **description** | **string** | Defines attribute value's description | [optional] [default to null]
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


## attributeValueDelete

attribute.value.delete

Delete attribute value.

### Example

```bash
 attributeValueDelete  id=value  attribute_id=value  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Entity id | [default to null]
 **attributeId** | **string** | Attribute Id | [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]

### Return type

[**AttributeValueDelete200Response**](AttributeValueDelete200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## attributeValueUpdate

attribute.value.update

Update attribute value.

### Example

```bash
 attributeValueUpdate  id=value  attribute_id=value  name=value  description=value  code=value  store_id=value  lang_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Defines attribute value's id | [default to null]
 **attributeId** | **string** | Attribute Id | [default to null]
 **name** | **string** | Defines attribute value's name | [optional] [default to null]
 **description** | **string** | Defines new attribute value's description | [optional] [default to null]
 **code** | **string** | Entity code | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **langId** | **string** | Language id | [optional] [default to null]

### Return type

[**AttributeUpdate200Response**](AttributeUpdate200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

