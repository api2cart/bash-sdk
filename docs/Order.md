# Order

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **string** |  | [optional] [default to null]
**orderUnderscoreid** | **string** |  | [optional] [default to null]
**basketUnderscoreid** | **string** |  | [optional] [default to null]
**channelUnderscoreid** | **string** |  | [optional] [default to null]
**customer** | [**BaseCustomer**](BaseCustomer.md) |  | [optional] [default to null]
**createUnderscoreat** | [**A2CDateTime**](A2CDateTime.md) |  | [optional] [default to null]
**currency** | [**Currency**](Currency.md) |  | [optional] [default to null]
**shippingUnderscoreaddress** | [**CustomerAddress**](CustomerAddress.md) |  | [optional] [default to null]
**billingUnderscoreaddress** | [**CustomerAddress**](CustomerAddress.md) |  | [optional] [default to null]
**paymentUnderscoremethod** | [**OrderPaymentMethod**](OrderPaymentMethod.md) |  | [optional] [default to null]
**shippingUnderscoremethod** | [**OrderShippingMethod**](OrderShippingMethod.md) |  | [optional] [default to null]
**shippingUnderscoremethods** | [**array[OrderShippingMethod]**](OrderShippingMethod.md) |  | [optional] [default to null]
**status** | [**OrderStatus**](OrderStatus.md) |  | [optional] [default to null]
**totals** | [**OrderTotals**](OrderTotals.md) |  | [optional] [default to null]
**total** | [**OrderTotal**](OrderTotal.md) |  | [optional] [default to null]
**discounts** | [**array[OrderTotalsNewDiscount]**](OrderTotalsNewDiscount.md) |  | [optional] [default to null]
**orderUnderscoreproducts** | [**array[OrderItem]**](OrderItem.md) |  | [optional] [default to null]
**bundles** | [**array[OrderItem]**](OrderItem.md) |  | [optional] [default to null]
**modifiedUnderscoreat** | [**A2CDateTime**](A2CDateTime.md) |  | [optional] [default to null]
**finishedUnderscoretime** | [**A2CDateTime**](A2CDateTime.md) |  | [optional] [default to null]
**comment** | **string** |  | [optional] [default to null]
**storeUnderscoreid** | **string** |  | [optional] [default to null]
**warehousesUnderscoreids** | **array[string]** |  | [optional] [default to null]
**refunds** | [**array[OrderRefund]**](OrderRefund.md) |  | [optional] [default to null]
**giftUnderscoremessage** | **string** |  | [optional] [default to null]
**orderUnderscoredetailsUnderscoreurl** | **string** |  | [optional] [default to null]
**additionalUnderscorefields** | **map** |  | [optional] [default to null]
**customUnderscorefields** | **map** |  | [optional] [default to null]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


