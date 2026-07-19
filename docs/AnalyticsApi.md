# AnalyticsApi

All URIs are relative to */v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**analyticsCustomerReport**](AnalyticsApi.md#analyticsCustomerReport) | **GET** /analytics.customer_report.json | analytics.customer_report
[**analyticsProductReport**](AnalyticsApi.md#analyticsProductReport) | **GET** /analytics.product_report.json | analytics.product_report
[**analyticsReport**](AnalyticsApi.md#analyticsReport) | **GET** /analytics.report.json | analytics.report



## analyticsCustomerReport

analytics.customer_report

Get customer-level analytics for a store over a given period.

### Example

```bash
 analyticsCustomerReport  date_from=value  date_to=value  count=value  currency_id=value  store_id=value  customer_type=value  email=value  sort_by=value  sort_direction=value  page_cursor=value  response_fields=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dateFrom** | **string** | Start date for the analytics period (Y-m-d or Y-m-d H:i:s) | [optional] [default to null]
 **dateTo** | **string** | End date for the analytics period (Y-m-d or Y-m-d H:i:s). Defaults to the current date. | [optional] [default to null]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **currencyId** | **string** | Currency Id | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **customerType** | **string** | Filter analytics customers by customer type | [optional] [default to null]
 **email** | **string** | Filter analytics customers by email | [optional] [default to null]
 **sortBy** | **string** | Set field to sort by | [optional] [default to total_spend]
 **sortDirection** | **string** | Set sorting direction | [optional] [default to desc]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]

### Return type

[**ResponseAnalyticsCustomerReportResult**](ResponseAnalyticsCustomerReportResult.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## analyticsProductReport

analytics.product_report

Get product-level analytics for a store over a given period.

### Example

```bash
 analyticsProductReport  date_from=value  date_to=value  count=value  product_ids=value  currency_id=value  store_id=value  categories_ids=value  sort_by=value  sort_direction=value  page_cursor=value  response_fields=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dateFrom** | **string** | Start date for the analytics period (Y-m-d or Y-m-d H:i:s) | [optional] [default to null]
 **dateTo** | **string** | End date for the analytics period (Y-m-d or Y-m-d H:i:s). Defaults to the current date. | [optional] [default to null]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **productIds** | **string** | Filter analytics by product ids | [optional] [default to null]
 **currencyId** | **string** | Currency Id | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **categoriesIds** | **string** | Defines product add that is specified by comma-separated categories id | [optional] [default to null]
 **sortBy** | **string** | Set field to sort by | [optional] [default to items_sold]
 **sortDirection** | **string** | Set sorting direction | [optional] [default to desc]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]

### Return type

[**ResponseAnalyticsProductReportResult**](ResponseAnalyticsProductReportResult.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## analyticsReport

analytics.report

Get analytics report with totals and optional interval breakdown for a store over a given period.

### Example

```bash
 analyticsReport  date_from=value  date_to=value  interval=value  order_status=value  financial_status=value  currency_id=value  store_id=value  sort_by=value  sort_direction=value  response_fields=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dateFrom** | **string** | Start date for the analytics period (Y-m-d or Y-m-d H:i:s) | [default to null]
 **dateTo** | **string** | End date for the analytics period (Y-m-d or Y-m-d H:i:s). Defaults to the current date. | [optional] [default to null]
 **interval** | **string** | Interval for analytics report breakdown | [optional] [default to null]
 **orderStatus** | **string** | Retrieves orders specified by order status | [optional] [default to null]
 **financialStatus** | **string** | Retrieves orders specified by financial status | [optional] [default to null]
 **currencyId** | **string** | Currency Id | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **sortBy** | **string** | Set field to sort by | [optional] [default to date]
 **sortDirection** | **string** | Set sorting direction | [optional] [default to asc]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]

### Return type

[**ResponseAnalyticsReportResult**](ResponseAnalyticsReportResult.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

