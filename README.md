# API2Cart OpenAPI Bash client

## Overview

This is a Bash client script for accessing API2Cart OpenAPI service.

The script uses cURL underneath for making all REST calls.

## Usage

```shell
# Make sure the script has executable rights
$ chmod u+x 

# Print the list of operations available on the service
$ ./ -h

# Print the service description
$ ./ --about

# Print detailed information about specific operation
$ ./ <operationId> -h

# Make GET request
./ --host http://<hostname>:<port> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make GET request using arbitrary curl options (must be passed before <operationId>) to an SSL service using username:password
 -k -sS --tlsv1.2 --host https://<hostname> -u <user>:<password> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make POST request
$ echo '<body_content>' |  --host <hostname> --content-type json <operationId> -

# Make POST request with simple JSON content, e.g.:
# {
#   "key1": "value1",
#   "key2": "value2",
#   "key3": 23
# }
$ echo '<body_content>' |  --host <hostname> --content-type json <operationId> key1==value1 key2=value2 key3:=23 -

# Make POST request with form data
$  --host <hostname> <operationId> key1:=value1 key2:=value2 key3:=23

# Preview the cURL command without actually executing it
$  --host http://<hostname>:<port> --dry-run <operationid>

```

## Docker image

You can easily create a Docker image containing a preconfigured environment
for using the REST Bash client including working autocompletion and short
welcome message with basic instructions, using the generated Dockerfile:

```shell
docker build -t my-rest-client .
docker run -it my-rest-client
```

By default you will be logged into a Zsh environment which has much more
advanced auto completion, but you can switch to Bash, where basic autocompletion
is also available.

## Shell completion

### Bash

The generated bash-completion script can be either directly loaded to the current Bash session using:

```shell
source .bash-completion
```

Alternatively, the script can be copied to the `/etc/bash-completion.d` (or on OSX with Homebrew to `/usr/local/etc/bash-completion.d`):

```shell
sudo cp .bash-completion /etc/bash-completion.d/
```

#### OS X

On OSX you might need to install bash-completion using Homebrew:

```shell
brew install bash-completion
```

and add the following to the `~/.bashrc`:

```shell
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
```

### Zsh

In Zsh, the generated `_` Zsh completion file must be copied to one of the folders under `$FPATH` variable.

## Documentation for API Endpoints

All URIs are relative to */v1.1*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AccountApi* | [**accountCartAdd**](docs/AccountApi.md#accountcartadd) | **POST** /account.cart.add.json | account.cart.add
*AccountApi* | [**accountCartList**](docs/AccountApi.md#accountcartlist) | **GET** /account.cart.list.json | account.cart.list
*AccountApi* | [**accountConfigUpdate**](docs/AccountApi.md#accountconfigupdate) | **PUT** /account.config.update.json | account.config.update
*AccountApi* | [**accountFailedWebhooks**](docs/AccountApi.md#accountfailedwebhooks) | **GET** /account.failed_webhooks.json | account.failed_webhooks
*AccountApi* | [**accountSupportedPlatforms**](docs/AccountApi.md#accountsupportedplatforms) | **GET** /account.supported_platforms.json | account.supported_platforms
*AttributeApi* | [**attributeAdd**](docs/AttributeApi.md#attributeadd) | **POST** /attribute.add.json | attribute.add
*AttributeApi* | [**attributeAssignGroup**](docs/AttributeApi.md#attributeassigngroup) | **POST** /attribute.assign.group.json | attribute.assign.group
*AttributeApi* | [**attributeAssignSet**](docs/AttributeApi.md#attributeassignset) | **POST** /attribute.assign.set.json | attribute.assign.set
*AttributeApi* | [**attributeAttributesetList**](docs/AttributeApi.md#attributeattributesetlist) | **GET** /attribute.attributeset.list.json | attribute.attributeset.list
*AttributeApi* | [**attributeCount**](docs/AttributeApi.md#attributecount) | **GET** /attribute.count.json | attribute.count
*AttributeApi* | [**attributeDelete**](docs/AttributeApi.md#attributedelete) | **DELETE** /attribute.delete.json | attribute.delete
*AttributeApi* | [**attributeGroupList**](docs/AttributeApi.md#attributegrouplist) | **GET** /attribute.group.list.json | attribute.group.list
*AttributeApi* | [**attributeInfo**](docs/AttributeApi.md#attributeinfo) | **GET** /attribute.info.json | attribute.info
*AttributeApi* | [**attributeList**](docs/AttributeApi.md#attributelist) | **GET** /attribute.list.json | attribute.list
*AttributeApi* | [**attributeTypeList**](docs/AttributeApi.md#attributetypelist) | **GET** /attribute.type.list.json | attribute.type.list
*AttributeApi* | [**attributeUnassignGroup**](docs/AttributeApi.md#attributeunassigngroup) | **POST** /attribute.unassign.group.json | attribute.unassign.group
*AttributeApi* | [**attributeUnassignSet**](docs/AttributeApi.md#attributeunassignset) | **POST** /attribute.unassign.set.json | attribute.unassign.set
*AttributeApi* | [**attributeUpdate**](docs/AttributeApi.md#attributeupdate) | **PUT** /attribute.update.json | attribute.update
*AttributeApi* | [**attributeValueAdd**](docs/AttributeApi.md#attributevalueadd) | **POST** /attribute.value.add.json | attribute.value.add
*AttributeApi* | [**attributeValueDelete**](docs/AttributeApi.md#attributevaluedelete) | **DELETE** /attribute.value.delete.json | attribute.value.delete
*AttributeApi* | [**attributeValueUpdate**](docs/AttributeApi.md#attributevalueupdate) | **PUT** /attribute.value.update.json | attribute.value.update
*BasketApi* | [**basketInfo**](docs/BasketApi.md#basketinfo) | **GET** /basket.info.json | basket.info
*BasketApi* | [**basketItemAdd**](docs/BasketApi.md#basketitemadd) | **POST** /basket.item.add.json | basket.item.add
*BasketApi* | [**basketLiveShippingServiceCreate**](docs/BasketApi.md#basketliveshippingservicecreate) | **POST** /basket.live_shipping_service.create.json | basket.live_shipping_service.create
*BasketApi* | [**basketLiveShippingServiceDelete**](docs/BasketApi.md#basketliveshippingservicedelete) | **DELETE** /basket.live_shipping_service.delete.json | basket.live_shipping_service.delete
*BasketApi* | [**basketLiveShippingServiceList**](docs/BasketApi.md#basketliveshippingservicelist) | **GET** /basket.live_shipping_service.list.json | basket.live_shipping_service.list
*BatchApi* | [**batchJobList**](docs/BatchApi.md#batchjoblist) | **GET** /batch.job.list.json | batch.job.list
*BatchApi* | [**batchJobResult**](docs/BatchApi.md#batchjobresult) | **GET** /batch.job.result.json | batch.job.result
*BridgeApi* | [**bridgeDelete**](docs/BridgeApi.md#bridgedelete) | **POST** /bridge.delete.json | bridge.delete
*BridgeApi* | [**bridgeDownload**](docs/BridgeApi.md#bridgedownload) | **GET** /bridge.download.file | bridge.download
*BridgeApi* | [**bridgeUpdate**](docs/BridgeApi.md#bridgeupdate) | **POST** /bridge.update.json | bridge.update
*CartApi* | [**cartCatalogPriceRulesCount**](docs/CartApi.md#cartcatalogpricerulescount) | **GET** /cart.catalog_price_rules.count.json | cart.catalog_price_rules.count
*CartApi* | [**cartCatalogPriceRulesList**](docs/CartApi.md#cartcatalogpriceruleslist) | **GET** /cart.catalog_price_rules.list.json | cart.catalog_price_rules.list
*CartApi* | [**cartCouponAdd**](docs/CartApi.md#cartcouponadd) | **POST** /cart.coupon.add.json | cart.coupon.add
*CartApi* | [**cartCouponConditionAdd**](docs/CartApi.md#cartcouponconditionadd) | **POST** /cart.coupon.condition.add.json | cart.coupon.condition.add
*CartApi* | [**cartCouponCount**](docs/CartApi.md#cartcouponcount) | **GET** /cart.coupon.count.json | cart.coupon.count
*CartApi* | [**cartCouponDelete**](docs/CartApi.md#cartcoupondelete) | **DELETE** /cart.coupon.delete.json | cart.coupon.delete
*CartApi* | [**cartCouponList**](docs/CartApi.md#cartcouponlist) | **GET** /cart.coupon.list.json | cart.coupon.list
*CartApi* | [**cartDelete**](docs/CartApi.md#cartdelete) | **DELETE** /cart.delete.json | cart.delete
*CartApi* | [**cartGiftcardAdd**](docs/CartApi.md#cartgiftcardadd) | **POST** /cart.giftcard.add.json | cart.giftcard.add
*CartApi* | [**cartGiftcardCount**](docs/CartApi.md#cartgiftcardcount) | **GET** /cart.giftcard.count.json | cart.giftcard.count
*CartApi* | [**cartGiftcardDelete**](docs/CartApi.md#cartgiftcarddelete) | **DELETE** /cart.giftcard.delete.json | cart.giftcard.delete
*CartApi* | [**cartGiftcardList**](docs/CartApi.md#cartgiftcardlist) | **GET** /cart.giftcard.list.json | cart.giftcard.list
*CartApi* | [**cartInfo**](docs/CartApi.md#cartinfo) | **GET** /cart.info.json | cart.info
*CartApi* | [**cartMetaDataList**](docs/CartApi.md#cartmetadatalist) | **GET** /cart.meta_data.list.json | cart.meta_data.list
*CartApi* | [**cartMetaDataSet**](docs/CartApi.md#cartmetadataset) | **POST** /cart.meta_data.set.json | cart.meta_data.set
*CartApi* | [**cartMetaDataUnset**](docs/CartApi.md#cartmetadataunset) | **DELETE** /cart.meta_data.unset.json | cart.meta_data.unset
*CartApi* | [**cartMethods**](docs/CartApi.md#cartmethods) | **GET** /cart.methods.json | cart.methods
*CartApi* | [**cartPluginList**](docs/CartApi.md#cartpluginlist) | **GET** /cart.plugin.list.json | cart.plugin.list
*CartApi* | [**cartScriptAdd**](docs/CartApi.md#cartscriptadd) | **POST** /cart.script.add.json | cart.script.add
*CartApi* | [**cartScriptDelete**](docs/CartApi.md#cartscriptdelete) | **DELETE** /cart.script.delete.json | cart.script.delete
*CartApi* | [**cartScriptList**](docs/CartApi.md#cartscriptlist) | **GET** /cart.script.list.json | cart.script.list
*CartApi* | [**cartShippingZonesList**](docs/CartApi.md#cartshippingzoneslist) | **GET** /cart.shipping_zones.list.json | cart.shipping_zones.list
*CartApi* | [**cartValidate**](docs/CartApi.md#cartvalidate) | **GET** /cart.validate.json | cart.validate
*CategoryApi* | [**categoryAdd**](docs/CategoryApi.md#categoryadd) | **POST** /category.add.json | category.add
*CategoryApi* | [**categoryAddBatch**](docs/CategoryApi.md#categoryaddbatch) | **POST** /category.add.batch.json | category.add.batch
*CategoryApi* | [**categoryAssign**](docs/CategoryApi.md#categoryassign) | **POST** /category.assign.json | category.assign
*CategoryApi* | [**categoryCount**](docs/CategoryApi.md#categorycount) | **GET** /category.count.json | category.count
*CategoryApi* | [**categoryDelete**](docs/CategoryApi.md#categorydelete) | **DELETE** /category.delete.json | category.delete
*CategoryApi* | [**categoryDeleteBatch**](docs/CategoryApi.md#categorydeletebatch) | **POST** /category.delete.batch.json | category.delete.batch
*CategoryApi* | [**categoryFind**](docs/CategoryApi.md#categoryfind) | **GET** /category.find.json | category.find
*CategoryApi* | [**categoryImageAdd**](docs/CategoryApi.md#categoryimageadd) | **POST** /category.image.add.json | category.image.add
*CategoryApi* | [**categoryImageDelete**](docs/CategoryApi.md#categoryimagedelete) | **DELETE** /category.image.delete.json | category.image.delete
*CategoryApi* | [**categoryInfo**](docs/CategoryApi.md#categoryinfo) | **GET** /category.info.json | category.info
*CategoryApi* | [**categoryList**](docs/CategoryApi.md#categorylist) | **GET** /category.list.json | category.list
*CategoryApi* | [**categoryUnassign**](docs/CategoryApi.md#categoryunassign) | **POST** /category.unassign.json | category.unassign
*CategoryApi* | [**categoryUpdate**](docs/CategoryApi.md#categoryupdate) | **PUT** /category.update.json | category.update
*CustomerApi* | [**customerAdd**](docs/CustomerApi.md#customeradd) | **POST** /customer.add.json | customer.add
*CustomerApi* | [**customerAddressAdd**](docs/CustomerApi.md#customeraddressadd) | **POST** /customer.address.add.json | customer.address.add
*CustomerApi* | [**customerAttributeList**](docs/CustomerApi.md#customerattributelist) | **GET** /customer.attribute.list.json | customer.attribute.list
*CustomerApi* | [**customerCount**](docs/CustomerApi.md#customercount) | **GET** /customer.count.json | customer.count
*CustomerApi* | [**customerDelete**](docs/CustomerApi.md#customerdelete) | **DELETE** /customer.delete.json | customer.delete
*CustomerApi* | [**customerFind**](docs/CustomerApi.md#customerfind) | **GET** /customer.find.json | customer.find
*CustomerApi* | [**customerGroupAdd**](docs/CustomerApi.md#customergroupadd) | **POST** /customer.group.add.json | customer.group.add
*CustomerApi* | [**customerGroupList**](docs/CustomerApi.md#customergrouplist) | **GET** /customer.group.list.json | customer.group.list
*CustomerApi* | [**customerInfo**](docs/CustomerApi.md#customerinfo) | **GET** /customer.info.json | customer.info
*CustomerApi* | [**customerList**](docs/CustomerApi.md#customerlist) | **GET** /customer.list.json | customer.list
*CustomerApi* | [**customerUpdate**](docs/CustomerApi.md#customerupdate) | **PUT** /customer.update.json | customer.update
*CustomerApi* | [**customerWishlistList**](docs/CustomerApi.md#customerwishlistlist) | **GET** /customer.wishlist.list.json | customer.wishlist.list
*MarketplaceApi* | [**marketplaceProductFind**](docs/MarketplaceApi.md#marketplaceproductfind) | **GET** /marketplace.product.find.json | marketplace.product.find
*OrderApi* | [**orderAbandonedList**](docs/OrderApi.md#orderabandonedlist) | **GET** /order.abandoned.list.json | order.abandoned.list
*OrderApi* | [**orderAdd**](docs/OrderApi.md#orderadd) | **POST** /order.add.json | order.add
*OrderApi* | [**orderCalculate**](docs/OrderApi.md#ordercalculate) | **POST** /order.calculate.json | order.calculate
*OrderApi* | [**orderCount**](docs/OrderApi.md#ordercount) | **GET** /order.count.json | order.count
*OrderApi* | [**orderFinancialStatusList**](docs/OrderApi.md#orderfinancialstatuslist) | **GET** /order.financial_status.list.json | order.financial_status.list
*OrderApi* | [**orderFulfillmentStatusList**](docs/OrderApi.md#orderfulfillmentstatuslist) | **GET** /order.fulfillment_status.list.json | order.fulfillment_status.list
*OrderApi* | [**orderInfo**](docs/OrderApi.md#orderinfo) | **GET** /order.info.json | order.info
*OrderApi* | [**orderList**](docs/OrderApi.md#orderlist) | **GET** /order.list.json | order.list
*OrderApi* | [**orderPreestimateShippingList**](docs/OrderApi.md#orderpreestimateshippinglist) | **POST** /order.preestimate_shipping.list.json | order.preestimate_shipping.list
*OrderApi* | [**orderRefundAdd**](docs/OrderApi.md#orderrefundadd) | **POST** /order.refund.add.json | order.refund.add
*OrderApi* | [**orderReturnAdd**](docs/OrderApi.md#orderreturnadd) | **POST** /order.return.add.json | order.return.add
*OrderApi* | [**orderReturnDelete**](docs/OrderApi.md#orderreturndelete) | **DELETE** /order.return.delete.json | order.return.delete
*OrderApi* | [**orderReturnUpdate**](docs/OrderApi.md#orderreturnupdate) | **PUT** /order.return.update.json | order.return.update
*OrderApi* | [**orderShipmentAdd**](docs/OrderApi.md#ordershipmentadd) | **POST** /order.shipment.add.json | order.shipment.add
*OrderApi* | [**orderShipmentAddBatch**](docs/OrderApi.md#ordershipmentaddbatch) | **POST** /order.shipment.add.batch.json | order.shipment.add.batch
*OrderApi* | [**orderShipmentDelete**](docs/OrderApi.md#ordershipmentdelete) | **DELETE** /order.shipment.delete.json | order.shipment.delete
*OrderApi* | [**orderShipmentInfo**](docs/OrderApi.md#ordershipmentinfo) | **GET** /order.shipment.info.json | order.shipment.info
*OrderApi* | [**orderShipmentList**](docs/OrderApi.md#ordershipmentlist) | **GET** /order.shipment.list.json | order.shipment.list
*OrderApi* | [**orderShipmentTrackingAdd**](docs/OrderApi.md#ordershipmenttrackingadd) | **POST** /order.shipment.tracking.add.json | order.shipment.tracking.add
*OrderApi* | [**orderShipmentUpdate**](docs/OrderApi.md#ordershipmentupdate) | **PUT** /order.shipment.update.json | order.shipment.update
*OrderApi* | [**orderStatusList**](docs/OrderApi.md#orderstatuslist) | **GET** /order.status.list.json | order.status.list
*OrderApi* | [**orderTransactionList**](docs/OrderApi.md#ordertransactionlist) | **GET** /order.transaction.list.json | order.transaction.list
*OrderApi* | [**orderUpdate**](docs/OrderApi.md#orderupdate) | **PUT** /order.update.json | order.update
*ProductApi* | [**productAdd**](docs/ProductApi.md#productadd) | **POST** /product.add.json | product.add
*ProductApi* | [**productAddBatch**](docs/ProductApi.md#productaddbatch) | **POST** /product.add.batch.json | product.add.batch
*ProductApi* | [**productAttributeList**](docs/ProductApi.md#productattributelist) | **GET** /product.attribute.list.json | product.attribute.list
*ProductApi* | [**productAttributeValueSet**](docs/ProductApi.md#productattributevalueset) | **POST** /product.attribute.value.set.json | product.attribute.value.set
*ProductApi* | [**productAttributeValueUnset**](docs/ProductApi.md#productattributevalueunset) | **POST** /product.attribute.value.unset.json | product.attribute.value.unset
*ProductApi* | [**productBrandList**](docs/ProductApi.md#productbrandlist) | **GET** /product.brand.list.json | product.brand.list
*ProductApi* | [**productChildItemFind**](docs/ProductApi.md#productchilditemfind) | **GET** /product.child_item.find.json | product.child_item.find
*ProductApi* | [**productChildItemInfo**](docs/ProductApi.md#productchilditeminfo) | **GET** /product.child_item.info.json | product.child_item.info
*ProductApi* | [**productChildItemList**](docs/ProductApi.md#productchilditemlist) | **GET** /product.child_item.list.json | product.child_item.list
*ProductApi* | [**productCount**](docs/ProductApi.md#productcount) | **GET** /product.count.json | product.count
*ProductApi* | [**productCurrencyAdd**](docs/ProductApi.md#productcurrencyadd) | **POST** /product.currency.add.json | product.currency.add
*ProductApi* | [**productCurrencyList**](docs/ProductApi.md#productcurrencylist) | **GET** /product.currency.list.json | product.currency.list
*ProductApi* | [**productDelete**](docs/ProductApi.md#productdelete) | **DELETE** /product.delete.json | product.delete
*ProductApi* | [**productDeleteBatch**](docs/ProductApi.md#productdeletebatch) | **POST** /product.delete.batch.json | product.delete.batch
*ProductApi* | [**productFind**](docs/ProductApi.md#productfind) | **GET** /product.find.json | product.find
*ProductApi* | [**productImageAdd**](docs/ProductApi.md#productimageadd) | **POST** /product.image.add.json | product.image.add
*ProductApi* | [**productImageDelete**](docs/ProductApi.md#productimagedelete) | **DELETE** /product.image.delete.json | product.image.delete
*ProductApi* | [**productImageUpdate**](docs/ProductApi.md#productimageupdate) | **PUT** /product.image.update.json | product.image.update
*ProductApi* | [**productInfo**](docs/ProductApi.md#productinfo) | **GET** /product.info.json | product.info
*ProductApi* | [**productList**](docs/ProductApi.md#productlist) | **GET** /product.list.json | product.list
*ProductApi* | [**productManufacturerAdd**](docs/ProductApi.md#productmanufactureradd) | **POST** /product.manufacturer.add.json | product.manufacturer.add
*ProductApi* | [**productOptionAdd**](docs/ProductApi.md#productoptionadd) | **POST** /product.option.add.json | product.option.add
*ProductApi* | [**productOptionAssign**](docs/ProductApi.md#productoptionassign) | **POST** /product.option.assign.json | product.option.assign
*ProductApi* | [**productOptionDelete**](docs/ProductApi.md#productoptiondelete) | **DELETE** /product.option.delete.json | product.option.delete
*ProductApi* | [**productOptionList**](docs/ProductApi.md#productoptionlist) | **GET** /product.option.list.json | product.option.list
*ProductApi* | [**productOptionValueAdd**](docs/ProductApi.md#productoptionvalueadd) | **POST** /product.option.value.add.json | product.option.value.add
*ProductApi* | [**productOptionValueAssign**](docs/ProductApi.md#productoptionvalueassign) | **POST** /product.option.value.assign.json | product.option.value.assign
*ProductApi* | [**productOptionValueDelete**](docs/ProductApi.md#productoptionvaluedelete) | **DELETE** /product.option.value.delete.json | product.option.value.delete
*ProductApi* | [**productOptionValueUpdate**](docs/ProductApi.md#productoptionvalueupdate) | **PUT** /product.option.value.update.json | product.option.value.update
*ProductApi* | [**productPriceAdd**](docs/ProductApi.md#productpriceadd) | **POST** /product.price.add.json | product.price.add
*ProductApi* | [**productPriceDelete**](docs/ProductApi.md#productpricedelete) | **DELETE** /product.price.delete.json | product.price.delete
*ProductApi* | [**productPriceUpdate**](docs/ProductApi.md#productpriceupdate) | **PUT** /product.price.update.json | product.price.update
*ProductApi* | [**productReviewList**](docs/ProductApi.md#productreviewlist) | **GET** /product.review.list.json | product.review.list
*ProductApi* | [**productStoreAssign**](docs/ProductApi.md#productstoreassign) | **POST** /product.store.assign.json | product.store.assign
*ProductApi* | [**productTaxAdd**](docs/ProductApi.md#producttaxadd) | **POST** /product.tax.add.json | product.tax.add
*ProductApi* | [**productUpdate**](docs/ProductApi.md#productupdate) | **PUT** /product.update.json | product.update
*ProductApi* | [**productUpdateBatch**](docs/ProductApi.md#productupdatebatch) | **POST** /product.update.batch.json | product.update.batch
*ProductApi* | [**productVariantAdd**](docs/ProductApi.md#productvariantadd) | **POST** /product.variant.add.json | product.variant.add
*ProductApi* | [**productVariantAddBatch**](docs/ProductApi.md#productvariantaddbatch) | **POST** /product.variant.add.batch.json | product.variant.add.batch
*ProductApi* | [**productVariantDelete**](docs/ProductApi.md#productvariantdelete) | **DELETE** /product.variant.delete.json | product.variant.delete
*ProductApi* | [**productVariantDeleteBatch**](docs/ProductApi.md#productvariantdeletebatch) | **POST** /product.variant.delete.batch.json | product.variant.delete.batch
*ProductApi* | [**productVariantImageAdd**](docs/ProductApi.md#productvariantimageadd) | **POST** /product.variant.image.add.json | product.variant.image.add
*ProductApi* | [**productVariantImageDelete**](docs/ProductApi.md#productvariantimagedelete) | **DELETE** /product.variant.image.delete.json | product.variant.image.delete
*ProductApi* | [**productVariantPriceAdd**](docs/ProductApi.md#productvariantpriceadd) | **POST** /product.variant.price.add.json | product.variant.price.add
*ProductApi* | [**productVariantPriceDelete**](docs/ProductApi.md#productvariantpricedelete) | **DELETE** /product.variant.price.delete.json | product.variant.price.delete
*ProductApi* | [**productVariantPriceUpdate**](docs/ProductApi.md#productvariantpriceupdate) | **PUT** /product.variant.price.update.json | product.variant.price.update
*ProductApi* | [**productVariantUpdate**](docs/ProductApi.md#productvariantupdate) | **PUT** /product.variant.update.json | product.variant.update
*ProductApi* | [**productVariantUpdateBatch**](docs/ProductApi.md#productvariantupdatebatch) | **POST** /product.variant.update.batch.json | product.variant.update.batch
*ReturnApi* | [**returnActionList**](docs/ReturnApi.md#returnactionlist) | **GET** /return.action.list.json | return.action.list
*ReturnApi* | [**returnCount**](docs/ReturnApi.md#returncount) | **GET** /return.count.json | return.count
*ReturnApi* | [**returnInfo**](docs/ReturnApi.md#returninfo) | **GET** /return.info.json | return.info
*ReturnApi* | [**returnList**](docs/ReturnApi.md#returnlist) | **GET** /return.list.json | return.list
*ReturnApi* | [**returnReasonList**](docs/ReturnApi.md#returnreasonlist) | **GET** /return.reason.list.json | return.reason.list
*ReturnApi* | [**returnStatusList**](docs/ReturnApi.md#returnstatuslist) | **GET** /return.status.list.json | return.status.list
*SubscriberApi* | [**subscriberList**](docs/SubscriberApi.md#subscriberlist) | **GET** /subscriber.list.json | subscriber.list
*TaxApi* | [**taxClassInfo**](docs/TaxApi.md#taxclassinfo) | **GET** /tax.class.info.json | tax.class.info
*TaxApi* | [**taxClassList**](docs/TaxApi.md#taxclasslist) | **GET** /tax.class.list.json | tax.class.list
*WebhookApi* | [**webhookCount**](docs/WebhookApi.md#webhookcount) | **GET** /webhook.count.json | webhook.count
*WebhookApi* | [**webhookCreate**](docs/WebhookApi.md#webhookcreate) | **POST** /webhook.create.json | webhook.create
*WebhookApi* | [**webhookDelete**](docs/WebhookApi.md#webhookdelete) | **DELETE** /webhook.delete.json | webhook.delete
*WebhookApi* | [**webhookEvents**](docs/WebhookApi.md#webhookevents) | **GET** /webhook.events.json | webhook.events
*WebhookApi* | [**webhookList**](docs/WebhookApi.md#webhooklist) | **GET** /webhook.list.json | webhook.list
*WebhookApi* | [**webhookUpdate**](docs/WebhookApi.md#webhookupdate) | **PUT** /webhook.update.json | webhook.update


## Documentation For Models

 - [A2CDateTime](docs/A2CDateTime.md)
 - [AccountCartAdd](docs/AccountCartAdd.md)
 - [AccountCartAdd200Response](docs/AccountCartAdd200Response.md)
 - [AccountCartAdd200ResponseResult](docs/AccountCartAdd200ResponseResult.md)
 - [AccountCartAddHybrisWebsitesInner](docs/AccountCartAddHybrisWebsitesInner.md)
 - [AccountCartList200Response](docs/AccountCartList200Response.md)
 - [AccountCartList200ResponseResult](docs/AccountCartList200ResponseResult.md)
 - [AccountCartList200ResponseResultCartsInner](docs/AccountCartList200ResponseResultCartsInner.md)
 - [AccountConfigUpdate200Response](docs/AccountConfigUpdate200Response.md)
 - [AccountConfigUpdate200ResponseResult](docs/AccountConfigUpdate200ResponseResult.md)
 - [AccountFailedWebhooks200Response](docs/AccountFailedWebhooks200Response.md)
 - [AccountFailedWebhooks200ResponseResult](docs/AccountFailedWebhooks200ResponseResult.md)
 - [AccountFailedWebhooks200ResponseResultWebhookInner](docs/AccountFailedWebhooks200ResponseResultWebhookInner.md)
 - [AccountSupportedPlatforms200Response](docs/AccountSupportedPlatforms200Response.md)
 - [AccountSupportedPlatforms200ResponseResult](docs/AccountSupportedPlatforms200ResponseResult.md)
 - [AccountSupportedPlatforms200ResponseResultSupportedPlatformsInner](docs/AccountSupportedPlatforms200ResponseResultSupportedPlatformsInner.md)
 - [AccountSupportedPlatforms200ResponseResultSupportedPlatformsInnerParams](docs/AccountSupportedPlatforms200ResponseResultSupportedPlatformsInnerParams.md)
 - [AccountSupportedPlatforms200ResponseResultSupportedPlatformsInnerParamsRequiredInnerInner](docs/AccountSupportedPlatforms200ResponseResultSupportedPlatformsInnerParamsRequiredInnerInner.md)
 - [AttributeAdd200Response](docs/AttributeAdd200Response.md)
 - [AttributeAdd200ResponseResult](docs/AttributeAdd200ResponseResult.md)
 - [AttributeAssignGroup200Response](docs/AttributeAssignGroup200Response.md)
 - [AttributeAssignGroup200ResponseResult](docs/AttributeAssignGroup200ResponseResult.md)
 - [AttributeCount200Response](docs/AttributeCount200Response.md)
 - [AttributeCount200ResponseResult](docs/AttributeCount200ResponseResult.md)
 - [AttributeDelete200Response](docs/AttributeDelete200Response.md)
 - [AttributeDelete200ResponseResult](docs/AttributeDelete200ResponseResult.md)
 - [AttributeInfo200Response](docs/AttributeInfo200Response.md)
 - [AttributeTypeList200Response](docs/AttributeTypeList200Response.md)
 - [AttributeTypeList200ResponseResult](docs/AttributeTypeList200ResponseResult.md)
 - [AttributeUnassignGroup200Response](docs/AttributeUnassignGroup200Response.md)
 - [AttributeUnassignGroup200ResponseResult](docs/AttributeUnassignGroup200ResponseResult.md)
 - [AttributeUpdate200Response](docs/AttributeUpdate200Response.md)
 - [AttributeUpdate200ResponseResult](docs/AttributeUpdate200ResponseResult.md)
 - [AttributeValueDelete200Response](docs/AttributeValueDelete200Response.md)
 - [AttributeValueDelete200ResponseResult](docs/AttributeValueDelete200ResponseResult.md)
 - [BaseCustomer](docs/BaseCustomer.md)
 - [Basket](docs/Basket.md)
 - [BasketInfo200Response](docs/BasketInfo200Response.md)
 - [BasketItem](docs/BasketItem.md)
 - [BasketItemAdd200Response](docs/BasketItemAdd200Response.md)
 - [BasketItemAdd200ResponseResult](docs/BasketItemAdd200ResponseResult.md)
 - [BasketItemOption](docs/BasketItemOption.md)
 - [BasketLiveShippingService](docs/BasketLiveShippingService.md)
 - [BasketLiveShippingServiceCreate200Response](docs/BasketLiveShippingServiceCreate200Response.md)
 - [BasketLiveShippingServiceCreate200ResponseResult](docs/BasketLiveShippingServiceCreate200ResponseResult.md)
 - [BasketLiveShippingServiceDelete200Response](docs/BasketLiveShippingServiceDelete200Response.md)
 - [BasketLiveShippingServiceDelete200ResponseResult](docs/BasketLiveShippingServiceDelete200ResponseResult.md)
 - [BasketLiveShippingServiceList200Response](docs/BasketLiveShippingServiceList200Response.md)
 - [BasketLiveShippingServiceList200ResponseResult](docs/BasketLiveShippingServiceList200ResponseResult.md)
 - [BatchJob](docs/BatchJob.md)
 - [BatchJobResult](docs/BatchJobResult.md)
 - [BatchJobResultItem](docs/BatchJobResultItem.md)
 - [Brand](docs/Brand.md)
 - [Carrier](docs/Carrier.md)
 - [Cart](docs/Cart.md)
 - [CartCatalogPriceRulesCount200Response](docs/CartCatalogPriceRulesCount200Response.md)
 - [CartCatalogPriceRulesCount200ResponseResult](docs/CartCatalogPriceRulesCount200ResponseResult.md)
 - [CartChannel](docs/CartChannel.md)
 - [CartCouponAdd](docs/CartCouponAdd.md)
 - [CartCouponAdd200Response](docs/CartCouponAdd200Response.md)
 - [CartCouponAdd200ResponseResult](docs/CartCouponAdd200ResponseResult.md)
 - [CartCouponCount200Response](docs/CartCouponCount200Response.md)
 - [CartCouponCount200ResponseResult](docs/CartCouponCount200ResponseResult.md)
 - [CartDelete200Response](docs/CartDelete200Response.md)
 - [CartDelete200ResponseResult](docs/CartDelete200ResponseResult.md)
 - [CartGiftcardAdd200Response](docs/CartGiftcardAdd200Response.md)
 - [CartGiftcardAdd200ResponseResult](docs/CartGiftcardAdd200ResponseResult.md)
 - [CartGiftcardCount200Response](docs/CartGiftcardCount200Response.md)
 - [CartGiftcardCount200ResponseResult](docs/CartGiftcardCount200ResponseResult.md)
 - [CartInfo200Response](docs/CartInfo200Response.md)
 - [CartMetaData](docs/CartMetaData.md)
 - [CartMethods200Response](docs/CartMethods200Response.md)
 - [CartMethods200ResponseResult](docs/CartMethods200ResponseResult.md)
 - [CartPluginList200Response](docs/CartPluginList200Response.md)
 - [CartPluginList200ResponseResult](docs/CartPluginList200ResponseResult.md)
 - [CartScriptAdd200Response](docs/CartScriptAdd200Response.md)
 - [CartScriptAdd200ResponseResult](docs/CartScriptAdd200ResponseResult.md)
 - [CartShippingMethod](docs/CartShippingMethod.md)
 - [CartShippingMethodRate](docs/CartShippingMethodRate.md)
 - [CartShippingZone](docs/CartShippingZone.md)
 - [CartShippingZone2](docs/CartShippingZone2.md)
 - [CartStoreInfo](docs/CartStoreInfo.md)
 - [CartValidate200Response](docs/CartValidate200Response.md)
 - [CartValidate200ResponseResult](docs/CartValidate200ResponseResult.md)
 - [CartWarehouse](docs/CartWarehouse.md)
 - [CatalogPriceRule](docs/CatalogPriceRule.md)
 - [CatalogPriceRuleAction](docs/CatalogPriceRuleAction.md)
 - [Category](docs/Category.md)
 - [CategoryAdd200Response](docs/CategoryAdd200Response.md)
 - [CategoryAdd200ResponseResult](docs/CategoryAdd200ResponseResult.md)
 - [CategoryAddBatch](docs/CategoryAddBatch.md)
 - [CategoryAddBatch200Response](docs/CategoryAddBatch200Response.md)
 - [CategoryAddBatch200ResponseResult](docs/CategoryAddBatch200ResponseResult.md)
 - [CategoryAddBatchPayloadInner](docs/CategoryAddBatchPayloadInner.md)
 - [CategoryAddBatchPayloadInnerImagesInner](docs/CategoryAddBatchPayloadInnerImagesInner.md)
 - [CategoryAssign200Response](docs/CategoryAssign200Response.md)
 - [CategoryCount200Response](docs/CategoryCount200Response.md)
 - [CategoryCount200ResponseResult](docs/CategoryCount200ResponseResult.md)
 - [CategoryDelete200Response](docs/CategoryDelete200Response.md)
 - [CategoryDelete200ResponseResult](docs/CategoryDelete200ResponseResult.md)
 - [CategoryDeleteBatch](docs/CategoryDeleteBatch.md)
 - [CategoryDeleteBatchPayloadInner](docs/CategoryDeleteBatchPayloadInner.md)
 - [CategoryFind200Response](docs/CategoryFind200Response.md)
 - [CategoryFind200ResponseResult](docs/CategoryFind200ResponseResult.md)
 - [CategoryFind200ResponseResultCategoryInner](docs/CategoryFind200ResponseResultCategoryInner.md)
 - [CategoryImageAdd200Response](docs/CategoryImageAdd200Response.md)
 - [CategoryImageAdd200ResponseResult](docs/CategoryImageAdd200ResponseResult.md)
 - [CategoryInfo200Response](docs/CategoryInfo200Response.md)
 - [Child](docs/Child.md)
 - [Country](docs/Country.md)
 - [Coupon](docs/Coupon.md)
 - [CouponAction](docs/CouponAction.md)
 - [CouponCode](docs/CouponCode.md)
 - [CouponCondition](docs/CouponCondition.md)
 - [CouponHistory](docs/CouponHistory.md)
 - [Currency](docs/Currency.md)
 - [Customer](docs/Customer.md)
 - [CustomerAdd](docs/CustomerAdd.md)
 - [CustomerAdd200Response](docs/CustomerAdd200Response.md)
 - [CustomerAdd200ResponseResult](docs/CustomerAdd200ResponseResult.md)
 - [CustomerAddAddressInner](docs/CustomerAddAddressInner.md)
 - [CustomerAddConsentsInner](docs/CustomerAddConsentsInner.md)
 - [CustomerAddress](docs/CustomerAddress.md)
 - [CustomerAddressAdd](docs/CustomerAddressAdd.md)
 - [CustomerAttribute](docs/CustomerAttribute.md)
 - [CustomerAttributeValue](docs/CustomerAttributeValue.md)
 - [CustomerConsent](docs/CustomerConsent.md)
 - [CustomerCount200Response](docs/CustomerCount200Response.md)
 - [CustomerCount200ResponseResult](docs/CustomerCount200ResponseResult.md)
 - [CustomerDelete200Response](docs/CustomerDelete200Response.md)
 - [CustomerDelete200ResponseResult](docs/CustomerDelete200ResponseResult.md)
 - [CustomerFind200Response](docs/CustomerFind200Response.md)
 - [CustomerFind200ResponseResult](docs/CustomerFind200ResponseResult.md)
 - [CustomerGroup](docs/CustomerGroup.md)
 - [CustomerGroupAdd200Response](docs/CustomerGroupAdd200Response.md)
 - [CustomerGroupAdd200ResponseResult](docs/CustomerGroupAdd200ResponseResult.md)
 - [CustomerInfo200Response](docs/CustomerInfo200Response.md)
 - [CustomerUpdate](docs/CustomerUpdate.md)
 - [CustomerUpdateAddressInner](docs/CustomerUpdateAddressInner.md)
 - [CustomerWishList](docs/CustomerWishList.md)
 - [CustomerWishListItem](docs/CustomerWishListItem.md)
 - [Discount](docs/Discount.md)
 - [GiftCard](docs/GiftCard.md)
 - [Image](docs/Image.md)
 - [Info](docs/Info.md)
 - [Language](docs/Language.md)
 - [MarketplaceProduct](docs/MarketplaceProduct.md)
 - [Media](docs/Media.md)
 - [ModelResponseAttributeAttributesetList](docs/ModelResponseAttributeAttributesetList.md)
 - [ModelResponseAttributeGroupList](docs/ModelResponseAttributeGroupList.md)
 - [ModelResponseAttributeList](docs/ModelResponseAttributeList.md)
 - [ModelResponseBatchJobList](docs/ModelResponseBatchJobList.md)
 - [ModelResponseCartCatalogPriceRulesList](docs/ModelResponseCartCatalogPriceRulesList.md)
 - [ModelResponseCartCouponList](docs/ModelResponseCartCouponList.md)
 - [ModelResponseCartGiftCardList](docs/ModelResponseCartGiftCardList.md)
 - [ModelResponseCartMetaDataList](docs/ModelResponseCartMetaDataList.md)
 - [ModelResponseCartScriptList](docs/ModelResponseCartScriptList.md)
 - [ModelResponseCartShippingZonesList](docs/ModelResponseCartShippingZonesList.md)
 - [ModelResponseCategoryList](docs/ModelResponseCategoryList.md)
 - [ModelResponseCustomerAttributeList](docs/ModelResponseCustomerAttributeList.md)
 - [ModelResponseCustomerGroupList](docs/ModelResponseCustomerGroupList.md)
 - [ModelResponseCustomerList](docs/ModelResponseCustomerList.md)
 - [ModelResponseCustomerWishlistList](docs/ModelResponseCustomerWishlistList.md)
 - [ModelResponseMarketplaceProductFind](docs/ModelResponseMarketplaceProductFind.md)
 - [ModelResponseOrderAbandonedList](docs/ModelResponseOrderAbandonedList.md)
 - [ModelResponseOrderList](docs/ModelResponseOrderList.md)
 - [ModelResponseOrderPreestimateShippingList](docs/ModelResponseOrderPreestimateShippingList.md)
 - [ModelResponseOrderShipmentList](docs/ModelResponseOrderShipmentList.md)
 - [ModelResponseOrderStatusList](docs/ModelResponseOrderStatusList.md)
 - [ModelResponseOrderTransactionList](docs/ModelResponseOrderTransactionList.md)
 - [ModelResponseProductAttributeList](docs/ModelResponseProductAttributeList.md)
 - [ModelResponseProductBrandList](docs/ModelResponseProductBrandList.md)
 - [ModelResponseProductChildItemList](docs/ModelResponseProductChildItemList.md)
 - [ModelResponseProductCurrencyList](docs/ModelResponseProductCurrencyList.md)
 - [ModelResponseProductList](docs/ModelResponseProductList.md)
 - [ModelResponseProductOptionList](docs/ModelResponseProductOptionList.md)
 - [ModelResponseProductReviewList](docs/ModelResponseProductReviewList.md)
 - [ModelResponseReturnList](docs/ModelResponseReturnList.md)
 - [ModelResponseSubscriberList](docs/ModelResponseSubscriberList.md)
 - [ModelResponseTaxClassInfo](docs/ModelResponseTaxClassInfo.md)
 - [ModelResponseTaxClassList](docs/ModelResponseTaxClassList.md)
 - [Order](docs/Order.md)
 - [OrderAbandoned](docs/OrderAbandoned.md)
 - [OrderAdd](docs/OrderAdd.md)
 - [OrderAdd200Response](docs/OrderAdd200Response.md)
 - [OrderAdd200ResponseResult](docs/OrderAdd200ResponseResult.md)
 - [OrderAddNoteAttributesInner](docs/OrderAddNoteAttributesInner.md)
 - [OrderAddOrderItemInner](docs/OrderAddOrderItemInner.md)
 - [OrderAddOrderItemInnerOrderItemOptionInner](docs/OrderAddOrderItemInnerOrderItemOptionInner.md)
 - [OrderAddOrderItemInnerOrderItemPropertyInner](docs/OrderAddOrderItemInnerOrderItemPropertyInner.md)
 - [OrderCalculate](docs/OrderCalculate.md)
 - [OrderCalculate200Response](docs/OrderCalculate200Response.md)
 - [OrderCalculateBundle](docs/OrderCalculateBundle.md)
 - [OrderCalculateDiscount](docs/OrderCalculateDiscount.md)
 - [OrderCalculateItem](docs/OrderCalculateItem.md)
 - [OrderCalculateOrderItemInner](docs/OrderCalculateOrderItemInner.md)
 - [OrderCalculateOrderItemInnerOrderItemOptionInner](docs/OrderCalculateOrderItemInnerOrderItemOptionInner.md)
 - [OrderCalculateShippingRate](docs/OrderCalculateShippingRate.md)
 - [OrderCalculateSubtotal](docs/OrderCalculateSubtotal.md)
 - [OrderCalculateTax](docs/OrderCalculateTax.md)
 - [OrderCount200Response](docs/OrderCount200Response.md)
 - [OrderCount200ResponseResult](docs/OrderCount200ResponseResult.md)
 - [OrderFinancialStatusList200Response](docs/OrderFinancialStatusList200Response.md)
 - [OrderFinancialStatusList200ResponseResult](docs/OrderFinancialStatusList200ResponseResult.md)
 - [OrderFinancialStatusList200ResponseResultOrderFinancialStatusesInner](docs/OrderFinancialStatusList200ResponseResultOrderFinancialStatusesInner.md)
 - [OrderFulfillmentStatusList200Response](docs/OrderFulfillmentStatusList200Response.md)
 - [OrderFulfillmentStatusList200ResponseResult](docs/OrderFulfillmentStatusList200ResponseResult.md)
 - [OrderInfo200Response](docs/OrderInfo200Response.md)
 - [OrderItem](docs/OrderItem.md)
 - [OrderItemOption](docs/OrderItemOption.md)
 - [OrderPaymentMethod](docs/OrderPaymentMethod.md)
 - [OrderPreestimateShipping](docs/OrderPreestimateShipping.md)
 - [OrderPreestimateShippingList](docs/OrderPreestimateShippingList.md)
 - [OrderPreestimateShippingListOrderItemInner](docs/OrderPreestimateShippingListOrderItemInner.md)
 - [OrderPreestimateShippingListOrderItemInnerOrderItemOptionInner](docs/OrderPreestimateShippingListOrderItemInnerOrderItemOptionInner.md)
 - [OrderRefund](docs/OrderRefund.md)
 - [OrderRefundAdd](docs/OrderRefundAdd.md)
 - [OrderRefundAdd200Response](docs/OrderRefundAdd200Response.md)
 - [OrderRefundAdd200ResponseResult](docs/OrderRefundAdd200ResponseResult.md)
 - [OrderRefundAddItemsInner](docs/OrderRefundAddItemsInner.md)
 - [OrderReturnAdd](docs/OrderReturnAdd.md)
 - [OrderReturnAdd200Response](docs/OrderReturnAdd200Response.md)
 - [OrderReturnAdd200ResponseResult](docs/OrderReturnAdd200ResponseResult.md)
 - [OrderReturnAddOrderProductsInner](docs/OrderReturnAddOrderProductsInner.md)
 - [OrderReturnUpdate](docs/OrderReturnUpdate.md)
 - [OrderReturnUpdateOrderProductsInner](docs/OrderReturnUpdateOrderProductsInner.md)
 - [OrderShipmentAdd](docs/OrderShipmentAdd.md)
 - [OrderShipmentAdd200Response](docs/OrderShipmentAdd200Response.md)
 - [OrderShipmentAdd200ResponseResult](docs/OrderShipmentAdd200ResponseResult.md)
 - [OrderShipmentAddBatch](docs/OrderShipmentAddBatch.md)
 - [OrderShipmentAddBatchPayloadInner](docs/OrderShipmentAddBatchPayloadInner.md)
 - [OrderShipmentAddBatchPayloadInnerItemsInner](docs/OrderShipmentAddBatchPayloadInnerItemsInner.md)
 - [OrderShipmentAddItemsInner](docs/OrderShipmentAddItemsInner.md)
 - [OrderShipmentAddTrackingNumbersInner](docs/OrderShipmentAddTrackingNumbersInner.md)
 - [OrderShipmentDelete200Response](docs/OrderShipmentDelete200Response.md)
 - [OrderShipmentDelete200ResponseResult](docs/OrderShipmentDelete200ResponseResult.md)
 - [OrderShipmentInfo200Response](docs/OrderShipmentInfo200Response.md)
 - [OrderShipmentTrackingAdd](docs/OrderShipmentTrackingAdd.md)
 - [OrderShipmentTrackingAdd200Response](docs/OrderShipmentTrackingAdd200Response.md)
 - [OrderShipmentTrackingAdd200ResponseResult](docs/OrderShipmentTrackingAdd200ResponseResult.md)
 - [OrderShipmentUpdate](docs/OrderShipmentUpdate.md)
 - [OrderShippingMethod](docs/OrderShippingMethod.md)
 - [OrderStatus](docs/OrderStatus.md)
 - [OrderStatusHistoryItem](docs/OrderStatusHistoryItem.md)
 - [OrderStatusRefund](docs/OrderStatusRefund.md)
 - [OrderStatusRefundItem](docs/OrderStatusRefundItem.md)
 - [OrderTotal](docs/OrderTotal.md)
 - [OrderTotals](docs/OrderTotals.md)
 - [OrderTotalsNewDiscount](docs/OrderTotalsNewDiscount.md)
 - [OrderTransaction](docs/OrderTransaction.md)
 - [Pagination](docs/Pagination.md)
 - [Plugin](docs/Plugin.md)
 - [PluginList](docs/PluginList.md)
 - [Product](docs/Product.md)
 - [ProductAdd](docs/ProductAdd.md)
 - [ProductAdd200Response](docs/ProductAdd200Response.md)
 - [ProductAdd200ResponseResult](docs/ProductAdd200ResponseResult.md)
 - [ProductAddBatch](docs/ProductAddBatch.md)
 - [ProductAddBatchPayloadInner](docs/ProductAddBatchPayloadInner.md)
 - [ProductAddBatchPayloadInnerAdvancedPricesInner](docs/ProductAddBatchPayloadInnerAdvancedPricesInner.md)
 - [ProductAddBatchPayloadInnerImagesInner](docs/ProductAddBatchPayloadInnerImagesInner.md)
 - [ProductAddBatchPayloadInnerSalesTax](docs/ProductAddBatchPayloadInnerSalesTax.md)
 - [ProductAddBestOffer](docs/ProductAddBestOffer.md)
 - [ProductAddCertificationsInner](docs/ProductAddCertificationsInner.md)
 - [ProductAddCertificationsInnerFilesInner](docs/ProductAddCertificationsInnerFilesInner.md)
 - [ProductAddCertificationsInnerImagesInner](docs/ProductAddCertificationsInnerImagesInner.md)
 - [ProductAddFilesInner](docs/ProductAddFilesInner.md)
 - [ProductAddGroupPricesInner](docs/ProductAddGroupPricesInner.md)
 - [ProductAddLogisticInfoInner](docs/ProductAddLogisticInfoInner.md)
 - [ProductAddManufacturerInfo](docs/ProductAddManufacturerInfo.md)
 - [ProductAddPackageDetails](docs/ProductAddPackageDetails.md)
 - [ProductAddPersonalizationDetails](docs/ProductAddPersonalizationDetails.md)
 - [ProductAddSalesTax](docs/ProductAddSalesTax.md)
 - [ProductAddSellerProfiles](docs/ProductAddSellerProfiles.md)
 - [ProductAddShippingDetailsInner](docs/ProductAddShippingDetailsInner.md)
 - [ProductAddSizeChart](docs/ProductAddSizeChart.md)
 - [ProductAddSpecificsInner](docs/ProductAddSpecificsInner.md)
 - [ProductAddSpecificsInnerBookingDetails](docs/ProductAddSpecificsInnerBookingDetails.md)
 - [ProductAddSpecificsInnerBookingDetailsAvailabilitiesInner](docs/ProductAddSpecificsInnerBookingDetailsAvailabilitiesInner.md)
 - [ProductAddSpecificsInnerBookingDetailsAvailabilitiesInnerTimesInner](docs/ProductAddSpecificsInnerBookingDetailsAvailabilitiesInnerTimesInner.md)
 - [ProductAddSpecificsInnerBookingDetailsOverridesInner](docs/ProductAddSpecificsInnerBookingDetailsOverridesInner.md)
 - [ProductAddSpecificsInnerFoodDetails](docs/ProductAddSpecificsInnerFoodDetails.md)
 - [ProductAddSpecificsInnerGroupProductsDetailsInner](docs/ProductAddSpecificsInnerGroupProductsDetailsInner.md)
 - [ProductAddTierPricesInner](docs/ProductAddTierPricesInner.md)
 - [ProductAdvancedPrice](docs/ProductAdvancedPrice.md)
 - [ProductAttribute](docs/ProductAttribute.md)
 - [ProductAttributeValueSet200Response](docs/ProductAttributeValueSet200Response.md)
 - [ProductAttributeValueSet200ResponseResult](docs/ProductAttributeValueSet200ResponseResult.md)
 - [ProductAttributeValueUnset200Response](docs/ProductAttributeValueUnset200Response.md)
 - [ProductAttributeValueUnset200ResponseResult](docs/ProductAttributeValueUnset200ResponseResult.md)
 - [ProductChildItemCombination](docs/ProductChildItemCombination.md)
 - [ProductChildItemFind200Response](docs/ProductChildItemFind200Response.md)
 - [ProductChildItemFind200ResponseResult](docs/ProductChildItemFind200ResponseResult.md)
 - [ProductChildItemInfo200Response](docs/ProductChildItemInfo200Response.md)
 - [ProductCount200Response](docs/ProductCount200Response.md)
 - [ProductCount200ResponseResult](docs/ProductCount200ResponseResult.md)
 - [ProductCurrencyAdd200Response](docs/ProductCurrencyAdd200Response.md)
 - [ProductCurrencyAdd200ResponseResult](docs/ProductCurrencyAdd200ResponseResult.md)
 - [ProductDeleteBatch](docs/ProductDeleteBatch.md)
 - [ProductDeleteBatchPayloadInner](docs/ProductDeleteBatchPayloadInner.md)
 - [ProductFind200Response](docs/ProductFind200Response.md)
 - [ProductFind200ResponseResult](docs/ProductFind200ResponseResult.md)
 - [ProductFind200ResponseResultProductInner](docs/ProductFind200ResponseResultProductInner.md)
 - [ProductGroupItem](docs/ProductGroupItem.md)
 - [ProductGroupPrice](docs/ProductGroupPrice.md)
 - [ProductImageAdd](docs/ProductImageAdd.md)
 - [ProductImageAdd200Response](docs/ProductImageAdd200Response.md)
 - [ProductImageAdd200ResponseResult](docs/ProductImageAdd200ResponseResult.md)
 - [ProductImageUpdate200Response](docs/ProductImageUpdate200Response.md)
 - [ProductImageUpdate200ResponseResult](docs/ProductImageUpdate200ResponseResult.md)
 - [ProductInfo200Response](docs/ProductInfo200Response.md)
 - [ProductInventory](docs/ProductInventory.md)
 - [ProductManufacturerAdd200Response](docs/ProductManufacturerAdd200Response.md)
 - [ProductManufacturerAdd200ResponseResult](docs/ProductManufacturerAdd200ResponseResult.md)
 - [ProductOption](docs/ProductOption.md)
 - [ProductOptionAdd](docs/ProductOptionAdd.md)
 - [ProductOptionAdd200Response](docs/ProductOptionAdd200Response.md)
 - [ProductOptionAdd200ResponseResult](docs/ProductOptionAdd200ResponseResult.md)
 - [ProductOptionAddValuesInner](docs/ProductOptionAddValuesInner.md)
 - [ProductOptionAssign200Response](docs/ProductOptionAssign200Response.md)
 - [ProductOptionAssign200ResponseResult](docs/ProductOptionAssign200ResponseResult.md)
 - [ProductOptionItem](docs/ProductOptionItem.md)
 - [ProductOptionValueAdd200Response](docs/ProductOptionValueAdd200Response.md)
 - [ProductOptionValueAdd200ResponseResult](docs/ProductOptionValueAdd200ResponseResult.md)
 - [ProductOptionValueAssign200Response](docs/ProductOptionValueAssign200Response.md)
 - [ProductOptionValueAssign200ResponseResult](docs/ProductOptionValueAssign200ResponseResult.md)
 - [ProductPriceAdd](docs/ProductPriceAdd.md)
 - [ProductPriceUpdate](docs/ProductPriceUpdate.md)
 - [ProductPriceUpdateGroupPricesInner](docs/ProductPriceUpdateGroupPricesInner.md)
 - [ProductReview](docs/ProductReview.md)
 - [ProductReviewRating](docs/ProductReviewRating.md)
 - [ProductTaxAdd](docs/ProductTaxAdd.md)
 - [ProductTaxAdd200Response](docs/ProductTaxAdd200Response.md)
 - [ProductTaxAdd200ResponseResult](docs/ProductTaxAdd200ResponseResult.md)
 - [ProductTaxAddTaxRatesInner](docs/ProductTaxAddTaxRatesInner.md)
 - [ProductTierPrice](docs/ProductTierPrice.md)
 - [ProductUpdate](docs/ProductUpdate.md)
 - [ProductUpdateBatch](docs/ProductUpdateBatch.md)
 - [ProductUpdateBatchPayloadInner](docs/ProductUpdateBatchPayloadInner.md)
 - [ProductUpdateBatchPayloadInnerAdvancedPricesInner](docs/ProductUpdateBatchPayloadInnerAdvancedPricesInner.md)
 - [ProductUpdateBatchPayloadInnerImagesInner](docs/ProductUpdateBatchPayloadInnerImagesInner.md)
 - [ProductVariantAdd](docs/ProductVariantAdd.md)
 - [ProductVariantAdd200Response](docs/ProductVariantAdd200Response.md)
 - [ProductVariantAdd200ResponseResult](docs/ProductVariantAdd200ResponseResult.md)
 - [ProductVariantAddAttributesInner](docs/ProductVariantAddAttributesInner.md)
 - [ProductVariantAddBatch](docs/ProductVariantAddBatch.md)
 - [ProductVariantAddBatchPayloadInner](docs/ProductVariantAddBatchPayloadInner.md)
 - [ProductVariantAddBatchPayloadInnerCombinationInner](docs/ProductVariantAddBatchPayloadInnerCombinationInner.md)
 - [ProductVariantDeleteBatch](docs/ProductVariantDeleteBatch.md)
 - [ProductVariantDeleteBatchPayloadInner](docs/ProductVariantDeleteBatchPayloadInner.md)
 - [ProductVariantImageAdd](docs/ProductVariantImageAdd.md)
 - [ProductVariantImageAdd200Response](docs/ProductVariantImageAdd200Response.md)
 - [ProductVariantImageAdd200ResponseResult](docs/ProductVariantImageAdd200ResponseResult.md)
 - [ProductVariantPriceAdd](docs/ProductVariantPriceAdd.md)
 - [ProductVariantPriceUpdate](docs/ProductVariantPriceUpdate.md)
 - [ProductVariantUpdate](docs/ProductVariantUpdate.md)
 - [ProductVariantUpdateBatch](docs/ProductVariantUpdateBatch.md)
 - [ProductVariantUpdateBatchPayloadInner](docs/ProductVariantUpdateBatchPayloadInner.md)
 - [ProductVariantUpdateOptionsInner](docs/ProductVariantUpdateOptionsInner.md)
 - [ResponseAttributeAttributesetListResult](docs/ResponseAttributeAttributesetListResult.md)
 - [ResponseAttributeGroupListResult](docs/ResponseAttributeGroupListResult.md)
 - [ResponseAttributeListResult](docs/ResponseAttributeListResult.md)
 - [ResponseBatchJobListResult](docs/ResponseBatchJobListResult.md)
 - [ResponseBatchJobResult](docs/ResponseBatchJobResult.md)
 - [ResponseCartCatalogPriceRulesListResult](docs/ResponseCartCatalogPriceRulesListResult.md)
 - [ResponseCartCouponListResult](docs/ResponseCartCouponListResult.md)
 - [ResponseCartGiftcardListResult](docs/ResponseCartGiftcardListResult.md)
 - [ResponseCartMetaDataListResult](docs/ResponseCartMetaDataListResult.md)
 - [ResponseCartScriptListResult](docs/ResponseCartScriptListResult.md)
 - [ResponseCartShippingZonesListResult](docs/ResponseCartShippingZonesListResult.md)
 - [ResponseCategoryListResult](docs/ResponseCategoryListResult.md)
 - [ResponseCustomerAttributeListResult](docs/ResponseCustomerAttributeListResult.md)
 - [ResponseCustomerGroupListResult](docs/ResponseCustomerGroupListResult.md)
 - [ResponseCustomerListResult](docs/ResponseCustomerListResult.md)
 - [ResponseCustomerWishlistListResult](docs/ResponseCustomerWishlistListResult.md)
 - [ResponseMarketplaceProductFindResult](docs/ResponseMarketplaceProductFindResult.md)
 - [ResponseOrderAbandonedListResult](docs/ResponseOrderAbandonedListResult.md)
 - [ResponseOrderListResult](docs/ResponseOrderListResult.md)
 - [ResponseOrderPreestimateShippingListResult](docs/ResponseOrderPreestimateShippingListResult.md)
 - [ResponseOrderShipmentListResult](docs/ResponseOrderShipmentListResult.md)
 - [ResponseOrderStatusListResult](docs/ResponseOrderStatusListResult.md)
 - [ResponseOrderTransactionListResult](docs/ResponseOrderTransactionListResult.md)
 - [ResponseProductAttributeListResult](docs/ResponseProductAttributeListResult.md)
 - [ResponseProductBrandListResult](docs/ResponseProductBrandListResult.md)
 - [ResponseProductChildItemListResult](docs/ResponseProductChildItemListResult.md)
 - [ResponseProductCurrencyListResult](docs/ResponseProductCurrencyListResult.md)
 - [ResponseProductListResult](docs/ResponseProductListResult.md)
 - [ResponseProductOptionListResult](docs/ResponseProductOptionListResult.md)
 - [ResponseProductReviewListResult](docs/ResponseProductReviewListResult.md)
 - [ResponseReturnListResult](docs/ResponseReturnListResult.md)
 - [ResponseSubscriberListResult](docs/ResponseSubscriberListResult.md)
 - [ResponseTaxClassInfoResult](docs/ResponseTaxClassInfoResult.md)
 - [ResponseTaxClassListResult](docs/ResponseTaxClassListResult.md)
 - [Return](docs/Return.md)
 - [ReturnAction](docs/ReturnAction.md)
 - [ReturnActionList200Response](docs/ReturnActionList200Response.md)
 - [ReturnActionList200ResponseResult](docs/ReturnActionList200ResponseResult.md)
 - [ReturnCount200Response](docs/ReturnCount200Response.md)
 - [ReturnCount200ResponseResult](docs/ReturnCount200ResponseResult.md)
 - [ReturnInfo200Response](docs/ReturnInfo200Response.md)
 - [ReturnOrderProduct](docs/ReturnOrderProduct.md)
 - [ReturnReason](docs/ReturnReason.md)
 - [ReturnReasonList200Response](docs/ReturnReasonList200Response.md)
 - [ReturnReasonList200ResponseResult](docs/ReturnReasonList200ResponseResult.md)
 - [ReturnStatus](docs/ReturnStatus.md)
 - [ReturnStatusList200Response](docs/ReturnStatusList200Response.md)
 - [ReturnStatusList200ResponseResult](docs/ReturnStatusList200ResponseResult.md)
 - [Script](docs/Script.md)
 - [Shipment](docs/Shipment.md)
 - [ShipmentItem](docs/ShipmentItem.md)
 - [ShipmentTrackingNumber](docs/ShipmentTrackingNumber.md)
 - [SpecialPrice](docs/SpecialPrice.md)
 - [State](docs/State.md)
 - [Status](docs/Status.md)
 - [StoreAttribute](docs/StoreAttribute.md)
 - [StoreAttributeAttributeSet](docs/StoreAttributeAttributeSet.md)
 - [StoreAttributeGroup](docs/StoreAttributeGroup.md)
 - [Subscriber](docs/Subscriber.md)
 - [TaxClass](docs/TaxClass.md)
 - [TaxClassCountries](docs/TaxClassCountries.md)
 - [TaxClassRate](docs/TaxClassRate.md)
 - [TaxClassStates](docs/TaxClassStates.md)
 - [TaxClassZipCodes](docs/TaxClassZipCodes.md)
 - [TaxClassZipCodesRange](docs/TaxClassZipCodesRange.md)
 - [Webhook](docs/Webhook.md)
 - [WebhookCount200Response](docs/WebhookCount200Response.md)
 - [WebhookCount200ResponseResult](docs/WebhookCount200ResponseResult.md)
 - [WebhookEvents200Response](docs/WebhookEvents200Response.md)
 - [WebhookEvents200ResponseResult](docs/WebhookEvents200ResponseResult.md)
 - [WebhookEvents200ResponseResultEventsInner](docs/WebhookEvents200ResponseResultEventsInner.md)
 - [WebhookList200Response](docs/WebhookList200Response.md)
 - [WebhookList200ResponseResult](docs/WebhookList200ResponseResult.md)


## Documentation For Authorization


## ApiKeyAuth


- **Type**: API key
- **API key parameter name**: x-api-key
- **Location**: HTTP header

## StoreKeyAuth


- **Type**: API key
- **API key parameter name**: x-store-key
- **Location**: HTTP header

