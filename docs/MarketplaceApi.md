# MarketplaceApi

All URIs are relative to */v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**marketplaceProductFind**](MarketplaceApi.md#marketplaceProductFind) | **GET** /marketplace.product.find.json | marketplace.product.find



## marketplaceProductFind

marketplace.product.find

Search product in global catalog.

### Example

```bash
 marketplaceProductFind  count=value  page_cursor=value  keyword=value  categories_ids=value  store_id=value  asin=value  ean=value  gtin=value  upc=value  mpn=value  isbn=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **keyword** | **string** | Defines search keyword | [optional] [default to null]
 **categoriesIds** | **string** | Defines product add that is specified by comma-separated categories id | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **asin** | **string** | Amazon Standard Identification Number. | [optional] [default to null]
 **ean** | **string** | European Article Number. An EAN is a unique 8 or 13-digit identifier that many industries (such as book publishers) use to identify products. | [optional] [default to null]
 **gtin** | **string** | Global Trade Item Number. An GTIN is an identifier for trade items. | [optional] [default to null]
 **upc** | **string** | Universal Product Code. A UPC (UPC-A) is a commonly used identifer for many different products. | [optional] [default to null]
 **mpn** | **string** | Manufacturer Part Number. A MPN is an identifier of a particular part design or material used. | [optional] [default to null]
 **isbn** | **string** | International Standard Book Number. An ISBN is a unique identifier for books. | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to force_all]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**ModelResponseMarketplaceProductFind**](ModelResponseMarketplaceProductFind.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

