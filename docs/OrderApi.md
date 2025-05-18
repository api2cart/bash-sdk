# OrderApi

All URIs are relative to */v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**orderAbandonedList**](OrderApi.md#orderAbandonedList) | **GET** /order.abandoned.list.json | order.abandoned.list
[**orderAdd**](OrderApi.md#orderAdd) | **POST** /order.add.json | order.add
[**orderCount**](OrderApi.md#orderCount) | **GET** /order.count.json | order.count
[**orderFinancialStatusList**](OrderApi.md#orderFinancialStatusList) | **GET** /order.financial_status.list.json | order.financial_status.list
[**orderFind**](OrderApi.md#orderFind) | **GET** /order.find.json | order.find
[**orderFulfillmentStatusList**](OrderApi.md#orderFulfillmentStatusList) | **GET** /order.fulfillment_status.list.json | order.fulfillment_status.list
[**orderInfo**](OrderApi.md#orderInfo) | **GET** /order.info.json | order.info
[**orderList**](OrderApi.md#orderList) | **GET** /order.list.json | order.list
[**orderPreestimateShippingList**](OrderApi.md#orderPreestimateShippingList) | **POST** /order.preestimate_shipping.list.json | order.preestimate_shipping.list
[**orderRefundAdd**](OrderApi.md#orderRefundAdd) | **POST** /order.refund.add.json | order.refund.add
[**orderReturnAdd**](OrderApi.md#orderReturnAdd) | **POST** /order.return.add.json | order.return.add
[**orderReturnDelete**](OrderApi.md#orderReturnDelete) | **DELETE** /order.return.delete.json | order.return.delete
[**orderReturnUpdate**](OrderApi.md#orderReturnUpdate) | **PUT** /order.return.update.json | order.return.update
[**orderShipmentAdd**](OrderApi.md#orderShipmentAdd) | **POST** /order.shipment.add.json | order.shipment.add
[**orderShipmentAddBatch**](OrderApi.md#orderShipmentAddBatch) | **POST** /order.shipment.add.batch.json | order.shipment.add.batch
[**orderShipmentDelete**](OrderApi.md#orderShipmentDelete) | **DELETE** /order.shipment.delete.json | order.shipment.delete
[**orderShipmentInfo**](OrderApi.md#orderShipmentInfo) | **GET** /order.shipment.info.json | order.shipment.info
[**orderShipmentList**](OrderApi.md#orderShipmentList) | **GET** /order.shipment.list.json | order.shipment.list
[**orderShipmentTrackingAdd**](OrderApi.md#orderShipmentTrackingAdd) | **POST** /order.shipment.tracking.add.json | order.shipment.tracking.add
[**orderShipmentUpdate**](OrderApi.md#orderShipmentUpdate) | **PUT** /order.shipment.update.json | order.shipment.update
[**orderStatusList**](OrderApi.md#orderStatusList) | **GET** /order.status.list.json | order.status.list
[**orderTransactionList**](OrderApi.md#orderTransactionList) | **GET** /order.transaction.list.json | order.transaction.list
[**orderUpdate**](OrderApi.md#orderUpdate) | **PUT** /order.update.json | order.update



## orderAbandonedList

order.abandoned.list

Get list of orders that were left by customers before completing the order.

### Example

```bash
 orderAbandonedList  start=value  count=value  page_cursor=value  customer_id=value  customer_email=value  store_id=value  created_from=value  created_to=value  modified_from=value  modified_to=value  skip_empty_email=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **customerId** | **string** | Retrieves orders specified by customer id | [optional] [default to null]
 **customerEmail** | **string** | Retrieves orders specified by customer email | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **createdFrom** | **string** | Retrieve entities from their creation date | [optional] [default to null]
 **createdTo** | **string** | Retrieve entities to their creation date | [optional] [default to null]
 **modifiedFrom** | **string** | Retrieve entities from their modification date | [optional] [default to null]
 **modifiedTo** | **string** | Retrieve entities to their modification date | [optional] [default to null]
 **skipEmptyEmail** | **boolean** | Filter empty emails | [optional] [default to false]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to customer,totals,items]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**ModelResponseOrderAbandonedList**](ModelResponseOrderAbandonedList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderAdd

order.add

Add a new order to the cart.

### Example

```bash
 orderAdd
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderAdd** | [**OrderAdd**](OrderAdd.md) |  |

### Return type

[**OrderAdd200Response**](OrderAdd200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderCount

order.count

Count orders in store

### Example

```bash
 orderCount  order_ids=value  ids=value  customer_id=value  store_id=value  customer_email=value  order_status=value  Specify as:  order_status_ids=value1 order_status_ids=value2 order_status_ids=...  ebay_order_status=value  financial_status=value  Specify as:  financial_status_ids=value1 financial_status_ids=value2 financial_status_ids=...  fulfillment_channel=value  fulfillment_status=value  shipping_method=value  delivery_method=value  tags=value  ship_node_type=value  created_from=value  created_to=value  modified_from=value  modified_to=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderIds** | **string** | Counts orders specified by order ids | [optional] [default to null]
 **ids** | **string** | Counts orders specified by ids | [optional] [default to null]
 **customerId** | **string** | Counts orders quantity specified by customer id | [optional] [default to null]
 **storeId** | **string** | Counts orders quantity specified by store id | [optional] [default to null]
 **customerEmail** | **string** | Counts orders quantity specified by customer email | [optional] [default to null]
 **orderStatus** | **string** | Counts orders quantity specified by order status | [optional] [default to null]
 **orderStatusIds** | [**array[string]**](string.md) | Retrieves orders specified by order statuses | [optional] [default to null]
 **ebayOrderStatus** | **string** | Counts orders quantity specified by order status | [optional] [default to null]
 **financialStatus** | **string** | Counts orders quantity specified by financial status | [optional] [default to null]
 **financialStatusIds** | [**array[string]**](string.md) | Retrieves orders count specified by financial status ids | [optional] [default to null]
 **fulfillmentChannel** | **string** | Retrieves order with a fulfillment channel | [optional] [default to null]
 **fulfillmentStatus** | **string** | Create order with fulfillment status | [optional] [default to null]
 **shippingMethod** | **string** | Retrieve entities according to shipping method | [optional] [default to null]
 **deliveryMethod** | **string** | Retrieves order with delivery method | [optional] [default to null]
 **tags** | **string** | Order tags | [optional] [default to null]
 **shipNodeType** | **string** | Retrieves order with ship node type | [optional] [default to null]
 **createdFrom** | **string** | Retrieve entities from their creation date | [optional] [default to null]
 **createdTo** | **string** | Retrieve entities to their creation date | [optional] [default to null]
 **modifiedFrom** | **string** | Retrieve entities from their modification date | [optional] [default to null]
 **modifiedTo** | **string** | Retrieve entities to their modification date | [optional] [default to null]

### Return type

[**OrderCount200Response**](OrderCount200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderFinancialStatusList

order.financial_status.list

Retrieve list of financial statuses

### Example

```bash
 orderFinancialStatusList
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**OrderFinancialStatusList200Response**](OrderFinancialStatusList200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderFind

order.find

This method is deprecated and won't be supported in the future. Please use \"order.list\" instead.

### Example

```bash
 orderFind  start=value  count=value  customer_id=value  customer_email=value  order_status=value  financial_status=value  created_to=value  created_from=value  modified_to=value  modified_from=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **customerId** | **string** | Retrieves orders specified by customer id | [optional] [default to null]
 **customerEmail** | **string** | Retrieves orders specified by customer email | [optional] [default to null]
 **orderStatus** | **string** | Retrieves orders specified by order status | [optional] [default to null]
 **financialStatus** | **string** | Retrieves orders specified by financial status | [optional] [default to null]
 **createdTo** | **string** | Retrieve entities to their creation date | [optional] [default to null]
 **createdFrom** | **string** | Retrieve entities from their creation date | [optional] [default to null]
 **modifiedTo** | **string** | Retrieve entities to their modification date | [optional] [default to null]
 **modifiedFrom** | **string** | Retrieve entities from their modification date | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to order_id,customer,totals,address,items,bundles,status]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**OrderFind200Response**](OrderFind200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderFulfillmentStatusList

order.fulfillment_status.list

Retrieve list of fulfillment statuses

### Example

```bash
 orderFulfillmentStatusList  action=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **action** | **string** | Available statuses for the specified action. | [optional] [default to null]

### Return type

[**OrderFulfillmentStatusList200Response**](OrderFulfillmentStatusList200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderInfo

order.info

Info about a specific order by ID

### Example

```bash
 orderInfo  id=value  order_id=value  store_id=value  params=value  response_fields=value  exclude=value  enable_cache=value  use_latest_api_version=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Retrieves order info specified by id | [optional] [default to null]
 **orderId** | **string** | Retrieves order’s info specified by order id | [optional] [default to null]
 **storeId** | **string** | Defines store id where the order should be found | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to order_id,customer,totals,address,items,bundles,status]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]
 **enableCache** | **boolean** | If the value is 'true' and order exist in our cache, we will return order.info response from cache | [optional] [default to false]
 **useLatestApiVersion** | **boolean** | Use the latest platform API version | [optional] [default to false]

### Return type

[**OrderInfo200Response**](OrderInfo200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderList

order.list

Get list of orders from store.

### Example

```bash
 orderList  start=value  count=value  page_cursor=value  ids=value  order_ids=value  since_id=value  store_id=value  customer_id=value  customer_email=value  basket_id=value  currency_id=value  phone=value  order_status=value  Specify as:  order_status_ids=value1 order_status_ids=value2 order_status_ids=...  ebay_order_status=value  financial_status=value  Specify as:  financial_status_ids=value1 financial_status_ids=value2 financial_status_ids=...  fulfillment_status=value  return_status=value  fulfillment_channel=value  shipping_method=value  skip_order_ids=value  is_deleted=value  shipping_country_iso3=value  delivery_method=value  ship_node_type=value  created_to=value  created_from=value  modified_to=value  modified_from=value  tags=value  sort_by=value  sort_direction=value  params=value  response_fields=value  exclude=value  enable_cache=value  use_latest_api_version=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **pageCursor** | **string** | Used to retrieve orders via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **ids** | **string** | Retrieves orders specified by ids | [optional] [default to null]
 **orderIds** | **string** | Retrieves orders specified by order ids | [optional] [default to null]
 **sinceId** | **string** | Retrieve entities starting from the specified id. | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **customerId** | **string** | Retrieves orders specified by customer id | [optional] [default to null]
 **customerEmail** | **string** | Retrieves orders specified by customer email | [optional] [default to null]
 **basketId** | **string** | Retrieves order’s info specified by basket id. | [optional] [default to null]
 **currencyId** | **string** | Currency Id | [optional] [default to null]
 **phone** | **string** | Filter orders by customer's phone number | [optional] [default to null]
 **orderStatus** | **string** | Retrieves orders specified by order status | [optional] [default to null]
 **orderStatusIds** | [**array[string]**](string.md) | Retrieves orders specified by order statuses | [optional] [default to null]
 **ebayOrderStatus** | **string** | Retrieves orders specified by order status | [optional] [default to null]
 **financialStatus** | **string** | Retrieves orders specified by financial status | [optional] [default to null]
 **financialStatusIds** | [**array[string]**](string.md) | Retrieves orders specified by financial status ids | [optional] [default to null]
 **fulfillmentStatus** | **string** | Create order with fulfillment status | [optional] [default to null]
 **returnStatus** | **string** | Retrieves orders specified by return status | [optional] [default to null]
 **fulfillmentChannel** | **string** | Retrieves order with a fulfillment channel | [optional] [default to null]
 **shippingMethod** | **string** | Retrieve entities according to shipping method | [optional] [default to null]
 **skipOrderIds** | **string** | Skipped orders by ids | [optional] [default to null]
 **isDeleted** | **boolean** | Filter deleted orders | [optional] [default to null]
 **shippingCountryIso3** | **string** | Retrieve entities according to shipping country | [optional] [default to null]
 **deliveryMethod** | **string** | Retrieves order with delivery method | [optional] [default to null]
 **shipNodeType** | **string** | Retrieves order with ship node type | [optional] [default to null]
 **createdTo** | **string** | Retrieve entities to their creation date | [optional] [default to null]
 **createdFrom** | **string** | Retrieve entities from their creation date | [optional] [default to null]
 **modifiedTo** | **string** | Retrieve entities to their modification date | [optional] [default to null]
 **modifiedFrom** | **string** | Retrieve entities from their modification date | [optional] [default to null]
 **tags** | **string** | Order tags | [optional] [default to null]
 **sortBy** | **string** | Set field to sort by | [optional] [default to order_id]
 **sortDirection** | **string** | Set sorting direction | [optional] [default to asc]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to order_id,customer,totals,address,items,bundles,status]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]
 **enableCache** | **boolean** | If the value is 'true', we will cache orders for a 15 minutes in order to increase speed and reduce requests throttling for some methods and shoping platforms (for example order.shipment.add) | [optional] [default to false]
 **useLatestApiVersion** | **boolean** | Use the latest platform API version | [optional] [default to false]

### Return type

[**ModelResponseOrderList**](ModelResponseOrderList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderPreestimateShippingList

order.preestimate_shipping.list

Retrieve list of order preestimated shipping methods

### Example

```bash
 orderPreestimateShippingList
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderPreestimateShippingList** | [**OrderPreestimateShippingList**](OrderPreestimateShippingList.md) |  |

### Return type

[**ModelResponseOrderPreestimateShippingList**](ModelResponseOrderPreestimateShippingList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderRefundAdd

order.refund.add

Add a refund to the order.

### Example

```bash
 orderRefundAdd
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderRefundAdd** | [**OrderRefundAdd**](OrderRefundAdd.md) |  |

### Return type

[**OrderRefundAdd200Response**](OrderRefundAdd200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderReturnAdd

order.return.add

Create new return request.

### Example

```bash
 orderReturnAdd
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderReturnAdd** | [**OrderReturnAdd**](OrderReturnAdd.md) |  |

### Return type

[**OrderReturnAdd200Response**](OrderReturnAdd200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderReturnDelete

order.return.delete

Delete return.

### Example

```bash
 orderReturnDelete  return_id=value  order_id=value  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **returnId** | **string** | Return ID | [default to null]
 **orderId** | **string** | Defines the order id | [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]

### Return type

[**AttributeValueDelete200Response**](AttributeValueDelete200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderReturnUpdate

order.return.update

Update order's shipment information.

### Example

```bash
 orderReturnUpdate
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderReturnUpdate** | [**OrderReturnUpdate**](OrderReturnUpdate.md) |  |

### Return type

[**AccountConfigUpdate200Response**](AccountConfigUpdate200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderShipmentAdd

order.shipment.add

Add a shipment to the order.

### Example

```bash
 orderShipmentAdd
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderShipmentAdd** | [**OrderShipmentAdd**](OrderShipmentAdd.md) |  |

### Return type

[**OrderShipmentAdd200Response**](OrderShipmentAdd200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderShipmentAddBatch

order.shipment.add.batch

Add a shipments to the orders.

### Example

```bash
 orderShipmentAddBatch
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderShipmentAddBatch** | [**OrderShipmentAddBatch**](OrderShipmentAddBatch.md) |  |

### Return type

[**CategoryAddBatch200Response**](CategoryAddBatch200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderShipmentDelete

order.shipment.delete

Delete order's shipment.

### Example

```bash
 orderShipmentDelete  shipment_id=value  order_id=value  store_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **shipmentId** | **string** | Shipment id indicates the number of delivery | [default to null]
 **orderId** | **string** | Defines the order for which the shipment will be deleted | [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]

### Return type

[**OrderShipmentDelete200Response**](OrderShipmentDelete200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderShipmentInfo

order.shipment.info

Get information of shipment.

### Example

```bash
 orderShipmentInfo  id=value  order_id=value  start=value  store_id=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Entity id | [default to null]
 **orderId** | **string** | Defines the order id | [default to null]
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,order_id,items,tracking_numbers]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**OrderShipmentInfo200Response**](OrderShipmentInfo200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderShipmentList

order.shipment.list

Get list of shipments by orders.

### Example

```bash
 orderShipmentList  order_id=value  start=value  count=value  page_cursor=value  store_id=value  created_from=value  created_to=value  modified_from=value  modified_to=value  response_fields=value  params=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderId** | **string** | Retrieves shipments specified by order id | [default to null]
 **start** | **integer** | This parameter sets the number from which you want to get entities | [optional] [default to 0]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **createdFrom** | **string** | Retrieve entities from their creation date | [optional] [default to null]
 **createdTo** | **string** | Retrieve entities to their creation date | [optional] [default to null]
 **modifiedFrom** | **string** | Retrieve entities from their modification date | [optional] [default to null]
 **modifiedTo** | **string** | Retrieve entities to their modification date | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,order_id,items,tracking_numbers]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**ModelResponseOrderShipmentList**](ModelResponseOrderShipmentList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderShipmentTrackingAdd

order.shipment.tracking.add

Add order shipment's tracking info.

### Example

```bash
 orderShipmentTrackingAdd
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderShipmentTrackingAdd** | [**OrderShipmentTrackingAdd**](OrderShipmentTrackingAdd.md) |  |

### Return type

[**OrderShipmentTrackingAdd200Response**](OrderShipmentTrackingAdd200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderShipmentUpdate

order.shipment.update

Update order's shipment information.

### Example

```bash
 orderShipmentUpdate
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderShipmentUpdate** | [**OrderShipmentUpdate**](OrderShipmentUpdate.md) |  |

### Return type

[**AccountConfigUpdate200Response**](AccountConfigUpdate200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderStatusList

order.status.list

Retrieve list of statuses

### Example

```bash
 orderStatusList  store_id=value  action=value  response_fields=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storeId** | **string** | Store Id | [optional] [default to null]
 **action** | **string** | Available statuses for the specified action. | [optional] [default to null]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]

### Return type

[**ModelResponseOrderStatusList**](ModelResponseOrderStatusList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderTransactionList

order.transaction.list

Retrieve list of order transaction

### Example

```bash
 orderTransactionList  order_ids=value  count=value  page_cursor=value  store_id=value  params=value  response_fields=value  exclude=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderIds** | **string** | Retrieves order transactions specified by order ids | [default to null]
 **count** | **integer** | This parameter sets the entity amount that has to be retrieved. Max allowed count=250 | [optional] [default to 10]
 **pageCursor** | **string** | Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter) | [optional] [default to null]
 **storeId** | **string** | Store Id | [optional] [default to null]
 **params** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to id,order_id,amount,description]
 **responseFields** | **string** | Set this parameter in order to choose which entity fields you want to retrieve | [optional] [default to null]
 **exclude** | **string** | Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all | [optional] [default to null]

### Return type

[**ModelResponseOrderTransactionList**](ModelResponseOrderTransactionList.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## orderUpdate

order.update

Update existing order.

### Example

```bash
 orderUpdate  order_id=value  store_id=value  order_status=value  financial_status=value  fulfillment_status=value  cancellation_reason=value  order_payment_method=value  comment=value  admin_comment=value  admin_private_comment=value  invoice_admin_comment=value  date_modified=value  date_finished=value  send_notifications=value  create_invoice=value  origin=value  tags=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderId** | **string** | Defines the orders specified by order id | [default to null]
 **storeId** | **string** | Defines store id where the order should be found | [optional] [default to null]
 **orderStatus** | **string** | Defines new order's status | [optional] [default to null]
 **financialStatus** | **string** | Update order financial status to specified | [optional] [default to null]
 **fulfillmentStatus** | **string** | Create order with fulfillment status | [optional] [default to null]
 **cancellationReason** | **string** | Defines the cancellation reason when the order will be canceled | [optional] [default to null]
 **orderPaymentMethod** | **string** | Defines order payment method.<br/>Setting order_payment_method on Shopify will also change financial_status field value to 'paid' | [optional] [default to null]
 **comment** | **string** | Specifies order comment | [optional] [default to null]
 **adminComment** | **string** | Specifies admin's order comment | [optional] [default to null]
 **adminPrivateComment** | **string** | Specifies private admin's order comment | [optional] [default to null]
 **invoiceAdminComment** | **string** | Specifies admin's order invoice comment | [optional] [default to null]
 **dateModified** | **string** | Specifies order's  modification date | [optional] [default to null]
 **dateFinished** | **string** | Specifies order's  finished date | [optional] [default to null]
 **sendNotifications** | **boolean** | Send notifications to customer after order was created | [optional] [default to false]
 **createInvoice** | **boolean** | Determines whether an invoice should be created if it has not already been created | [optional] [default to null]
 **origin** | **string** | The source of the order | [optional] [default to null]
 **tags** | **string** | Order tags | [optional] [default to null]

### Return type

[**AccountConfigUpdate200Response**](AccountConfigUpdate200Response.md)

### Authorization

[StoreKeyAuth](../README.md#StoreKeyAuth), [ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

