#!/usr/bin/env bash

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !
# ! Note:
# !
# ! THIS SCRIPT HAS BEEN AUTOMATICALLY GENERATED USING
# ! openapi-generator (https://openapi-generator.tech)
# ! FROM OPENAPI SPECIFICATION IN JSON.
# !
# ! Generator version: 7.11.0
# !
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#
# This is a Bash client for API2Cart OpenAPI.
#
# LICENSE:
# 
#
# CONTACT:
# contact@api2cart.com
#
# MORE INFORMATION:
# http://docs.api2cart.com
#

# For improved pattern matching in case statements
shopt -s extglob

###############################################################################
#
# Make sure Bash is at least in version 4.3
#
###############################################################################
if ! ( (("${BASH_VERSION:0:1}" == "4")) && (("${BASH_VERSION:2:1}" >= "3")) ) \
  && ! (("${BASH_VERSION:0:1}" >= "5")); then
    echo ""
    echo "Sorry - your Bash version is ${BASH_VERSION}"
    echo ""
    echo "You need at least Bash 4.3 to run this script."
    echo ""
    exit 1
fi

###############################################################################
#
# Global variables
#
###############################################################################

##
# The filename of this script for help messages
script_name=$(basename "$0")

##
# Map for headers passed after operation as KEY:VALUE
declare -A header_arguments


##
# Map for operation parameters passed after operation as PARAMETER=VALUE
# These will be mapped to appropriate path or query parameters
# The values in operation_parameters are arrays, so that multiple values
# can be provided for the same parameter if allowed by API specification
declare -A operation_parameters

##
# Declare colors with autodetection if output is terminal
if [ -t 1 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    MAGENTA="$(tput setaf 5)"
    CYAN="$(tput setaf 6)"
    WHITE="$(tput setaf 7)"
    BOLD="$(tput bold)"
    OFF="$(tput sgr0)"
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    MAGENTA=""
    CYAN=""
    WHITE=""
    BOLD=""
    OFF=""
fi

declare -a result_color_table=( "$WHITE" "$WHITE" "$GREEN" "$YELLOW" "$WHITE" "$MAGENTA" "$WHITE" )

##
# This array stores the minimum number of required occurrences for parameter
# 0 - optional
# 1 - required
declare -A operation_parameters_minimum_occurrences
operation_parameters_minimum_occurrences["accountCartAdd:::AccountCartAdd"]=1
operation_parameters_minimum_occurrences["accountCartList:::store_url"]=0
operation_parameters_minimum_occurrences["accountCartList:::store_key"]=0
operation_parameters_minimum_occurrences["accountCartList:::request_from_date"]=0
operation_parameters_minimum_occurrences["accountCartList:::request_to_date"]=0
operation_parameters_minimum_occurrences["accountCartList:::params"]=0
operation_parameters_minimum_occurrences["accountCartList:::exclude"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::replace_parameters"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::new_store_url"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::new_store_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::bridge_url"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::store_root"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::db_tables_prefix"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::user_agent"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::3dcart_private_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::3dcart_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::3dcartapi_api_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::amazon_sp_client_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::amazon_sp_client_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::amazon_sp_refresh_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::amazon_sp_aws_region"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::amazon_sp_api_environment"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::amazon_seller_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::aspdotnetstorefront_api_user"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::aspdotnetstorefront_api_pass"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::bigcommerceapi_admin_account"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::bigcommerceapi_api_path"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::bigcommerceapi_api_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::bigcommerceapi_client_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::bigcommerceapi_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::bigcommerceapi_context"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::bol_api_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::bol_api_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::bol_retailer_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::demandware_client_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::demandware_api_password"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::demandware_user_name"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::demandware_user_password"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::ebay_client_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::ebay_client_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::ebay_runame"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::ebay_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::ebay_refresh_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::ebay_environment"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::ebay_site_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::ecwid_acess_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::ecwid_store_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::lazada_app_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::lazada_app_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::lazada_refresh_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::lazada_region"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::etsy_keystring"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::etsy_shared_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::etsy_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::etsy_token_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::etsy_client_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::etsy_refresh_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::facebook_app_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::facebook_app_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::facebook_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::facebook_business_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::neto_api_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::neto_api_username"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopline_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopline_app_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopline_app_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopline_shared_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopify_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopify_api_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopify_api_password"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopify_shared_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopee_partner_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopee_partner_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopee_shop_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopee_refresh_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopee_region"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopee_environment"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shoplazza_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shoplazza_shared_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::miva_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::miva_signature"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopware_access_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopware_api_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::shopware_api_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::bigcartel_user_name"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::bigcartel_password"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::bricklink_consumer_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::bricklink_consumer_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::bricklink_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::bricklink_token_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::volusion_login"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::volusion_password"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::walmart_client_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::walmart_client_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::walmart_environment"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::walmart_channel_type"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::walmart_region"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::square_client_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::square_client_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::square_refresh_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::squarespace_api_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::squarespace_client_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::squarespace_client_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::squarespace_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::squarespace_refresh_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::hybris_client_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::hybris_client_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::hybris_username"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::hybris_password"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::hybris_websites"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::lightspeed_api_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::lightspeed_api_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::commercehq_api_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::commercehq_api_password"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::wc_consumer_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::wc_consumer_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::magento_consumer_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::magento_consumer_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::magento_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::magento_token_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::prestashop_webservice_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::wix_app_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::wix_app_secret_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::wix_instance_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::wix_refresh_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::mercado_libre_app_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::mercado_libre_app_secret_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::mercado_libre_refresh_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::zid_client_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::zid_client_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::zid_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::zid_authorization"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::zid_refresh_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::flipkart_client_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::flipkart_client_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::allegro_client_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::allegro_client_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::allegro_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::allegro_refresh_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::allegro_environment"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::zoho_client_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::zoho_client_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::zoho_refresh_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::zoho_region"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::tiendanube_user_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::tiendanube_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::tiendanube_client_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::otto_client_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::otto_client_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::otto_app_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::otto_refresh_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::otto_environment"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::otto_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::tiktokshop_app_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::tiktokshop_app_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::tiktokshop_refresh_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::tiktokshop_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::salla_client_id"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::salla_client_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::salla_refresh_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::salla_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::temu_app_key"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::temu_app_secret"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::temu_access_token"]=0
operation_parameters_minimum_occurrences["accountConfigUpdate:::temu_region"]=0
operation_parameters_minimum_occurrences["accountFailedWebhooks:::start"]=0
operation_parameters_minimum_occurrences["accountFailedWebhooks:::count"]=0
operation_parameters_minimum_occurrences["accountFailedWebhooks:::ids"]=0
operation_parameters_minimum_occurrences["attributeAdd:::type"]=1
operation_parameters_minimum_occurrences["attributeAdd:::name"]=1
operation_parameters_minimum_occurrences["attributeAdd:::code"]=0
operation_parameters_minimum_occurrences["attributeAdd:::store_id"]=0
operation_parameters_minimum_occurrences["attributeAdd:::lang_id"]=0
operation_parameters_minimum_occurrences["attributeAdd:::visible"]=0
operation_parameters_minimum_occurrences["attributeAdd:::required"]=0
operation_parameters_minimum_occurrences["attributeAdd:::position"]=0
operation_parameters_minimum_occurrences["attributeAdd:::attribute_group_id"]=0
operation_parameters_minimum_occurrences["attributeAdd:::is_global"]=0
operation_parameters_minimum_occurrences["attributeAdd:::is_searchable"]=0
operation_parameters_minimum_occurrences["attributeAdd:::is_filterable"]=0
operation_parameters_minimum_occurrences["attributeAdd:::is_comparable"]=0
operation_parameters_minimum_occurrences["attributeAdd:::is_html_allowed_on_front"]=0
operation_parameters_minimum_occurrences["attributeAdd:::is_filterable_in_search"]=0
operation_parameters_minimum_occurrences["attributeAdd:::is_configurable"]=0
operation_parameters_minimum_occurrences["attributeAdd:::is_visible_in_advanced_search"]=0
operation_parameters_minimum_occurrences["attributeAdd:::is_used_for_promo_rules"]=0
operation_parameters_minimum_occurrences["attributeAdd:::used_in_product_listing"]=0
operation_parameters_minimum_occurrences["attributeAdd:::used_for_sort_by"]=0
operation_parameters_minimum_occurrences["attributeAdd:::apply_to"]=0
operation_parameters_minimum_occurrences["attributeAssignGroup:::id"]=1
operation_parameters_minimum_occurrences["attributeAssignGroup:::group_id"]=1
operation_parameters_minimum_occurrences["attributeAssignGroup:::attribute_set_id"]=0
operation_parameters_minimum_occurrences["attributeAssignSet:::id"]=1
operation_parameters_minimum_occurrences["attributeAssignSet:::attribute_set_id"]=1
operation_parameters_minimum_occurrences["attributeAssignSet:::group_id"]=0
operation_parameters_minimum_occurrences["attributeAttributesetList:::start"]=0
operation_parameters_minimum_occurrences["attributeAttributesetList:::count"]=0
operation_parameters_minimum_occurrences["attributeAttributesetList:::response_fields"]=0
operation_parameters_minimum_occurrences["attributeAttributesetList:::params"]=0
operation_parameters_minimum_occurrences["attributeAttributesetList:::exclude"]=0
operation_parameters_minimum_occurrences["attributeCount:::type"]=0
operation_parameters_minimum_occurrences["attributeCount:::attribute_set_id"]=0
operation_parameters_minimum_occurrences["attributeCount:::store_id"]=0
operation_parameters_minimum_occurrences["attributeCount:::lang_id"]=0
operation_parameters_minimum_occurrences["attributeCount:::visible"]=0
operation_parameters_minimum_occurrences["attributeCount:::required"]=0
operation_parameters_minimum_occurrences["attributeCount:::system"]=0
operation_parameters_minimum_occurrences["attributeDelete:::id"]=1
operation_parameters_minimum_occurrences["attributeDelete:::store_id"]=0
operation_parameters_minimum_occurrences["attributeGroupList:::start"]=0
operation_parameters_minimum_occurrences["attributeGroupList:::count"]=0
operation_parameters_minimum_occurrences["attributeGroupList:::attribute_set_id"]=0
operation_parameters_minimum_occurrences["attributeGroupList:::lang_id"]=0
operation_parameters_minimum_occurrences["attributeGroupList:::response_fields"]=0
operation_parameters_minimum_occurrences["attributeGroupList:::params"]=0
operation_parameters_minimum_occurrences["attributeGroupList:::exclude"]=0
operation_parameters_minimum_occurrences["attributeInfo:::id"]=1
operation_parameters_minimum_occurrences["attributeInfo:::attribute_set_id"]=0
operation_parameters_minimum_occurrences["attributeInfo:::store_id"]=0
operation_parameters_minimum_occurrences["attributeInfo:::lang_id"]=0
operation_parameters_minimum_occurrences["attributeInfo:::response_fields"]=0
operation_parameters_minimum_occurrences["attributeInfo:::params"]=0
operation_parameters_minimum_occurrences["attributeInfo:::exclude"]=0
operation_parameters_minimum_occurrences["attributeList:::start"]=0
operation_parameters_minimum_occurrences["attributeList:::count"]=0
operation_parameters_minimum_occurrences["attributeList:::attribute_ids"]=0
operation_parameters_minimum_occurrences["attributeList:::attribute_set_id"]=0
operation_parameters_minimum_occurrences["attributeList:::store_id"]=0
operation_parameters_minimum_occurrences["attributeList:::lang_id"]=0
operation_parameters_minimum_occurrences["attributeList:::type"]=0
operation_parameters_minimum_occurrences["attributeList:::visible"]=0
operation_parameters_minimum_occurrences["attributeList:::required"]=0
operation_parameters_minimum_occurrences["attributeList:::system"]=0
operation_parameters_minimum_occurrences["attributeList:::response_fields"]=0
operation_parameters_minimum_occurrences["attributeList:::params"]=0
operation_parameters_minimum_occurrences["attributeList:::exclude"]=0
operation_parameters_minimum_occurrences["attributeUnassignGroup:::id"]=1
operation_parameters_minimum_occurrences["attributeUnassignGroup:::group_id"]=1
operation_parameters_minimum_occurrences["attributeUnassignSet:::id"]=1
operation_parameters_minimum_occurrences["attributeUnassignSet:::attribute_set_id"]=1
operation_parameters_minimum_occurrences["attributeUpdate:::id"]=1
operation_parameters_minimum_occurrences["attributeUpdate:::name"]=1
operation_parameters_minimum_occurrences["attributeUpdate:::store_id"]=0
operation_parameters_minimum_occurrences["attributeUpdate:::lang_id"]=0
operation_parameters_minimum_occurrences["attributeValueAdd:::attribute_id"]=1
operation_parameters_minimum_occurrences["attributeValueAdd:::name"]=1
operation_parameters_minimum_occurrences["attributeValueAdd:::code"]=0
operation_parameters_minimum_occurrences["attributeValueAdd:::description"]=0
operation_parameters_minimum_occurrences["attributeValueAdd:::store_id"]=0
operation_parameters_minimum_occurrences["attributeValueAdd:::lang_id"]=0
operation_parameters_minimum_occurrences["attributeValueDelete:::id"]=1
operation_parameters_minimum_occurrences["attributeValueDelete:::attribute_id"]=1
operation_parameters_minimum_occurrences["attributeValueDelete:::store_id"]=0
operation_parameters_minimum_occurrences["attributeValueUpdate:::id"]=1
operation_parameters_minimum_occurrences["attributeValueUpdate:::attribute_id"]=1
operation_parameters_minimum_occurrences["attributeValueUpdate:::name"]=0
operation_parameters_minimum_occurrences["attributeValueUpdate:::description"]=0
operation_parameters_minimum_occurrences["attributeValueUpdate:::code"]=0
operation_parameters_minimum_occurrences["attributeValueUpdate:::store_id"]=0
operation_parameters_minimum_occurrences["attributeValueUpdate:::lang_id"]=0
operation_parameters_minimum_occurrences["basketInfo:::id"]=1
operation_parameters_minimum_occurrences["basketInfo:::store_id"]=0
operation_parameters_minimum_occurrences["basketInfo:::response_fields"]=0
operation_parameters_minimum_occurrences["basketInfo:::params"]=0
operation_parameters_minimum_occurrences["basketInfo:::exclude"]=0
operation_parameters_minimum_occurrences["basketItemAdd:::customer_id"]=1
operation_parameters_minimum_occurrences["basketItemAdd:::product_id"]=1
operation_parameters_minimum_occurrences["basketItemAdd:::variant_id"]=0
operation_parameters_minimum_occurrences["basketItemAdd:::quantity"]=0
operation_parameters_minimum_occurrences["basketItemAdd:::store_id"]=0
operation_parameters_minimum_occurrences["basketLiveShippingServiceCreate:::name"]=1
operation_parameters_minimum_occurrences["basketLiveShippingServiceCreate:::callback"]=1
operation_parameters_minimum_occurrences["basketLiveShippingServiceCreate:::store_id"]=0
operation_parameters_minimum_occurrences["basketLiveShippingServiceDelete:::id"]=1
operation_parameters_minimum_occurrences["basketLiveShippingServiceList:::start"]=0
operation_parameters_minimum_occurrences["basketLiveShippingServiceList:::count"]=0
operation_parameters_minimum_occurrences["basketLiveShippingServiceList:::store_id"]=0
operation_parameters_minimum_occurrences["batchJobList:::count"]=0
operation_parameters_minimum_occurrences["batchJobList:::page_cursor"]=0
operation_parameters_minimum_occurrences["batchJobList:::ids"]=0
operation_parameters_minimum_occurrences["batchJobList:::created_from"]=0
operation_parameters_minimum_occurrences["batchJobList:::created_to"]=0
operation_parameters_minimum_occurrences["batchJobList:::processed_from"]=0
operation_parameters_minimum_occurrences["batchJobList:::processed_to"]=0
operation_parameters_minimum_occurrences["batchJobList:::response_fields"]=0
operation_parameters_minimum_occurrences["batchJobResult:::id"]=1
operation_parameters_minimum_occurrences["bridgeDownload:::whitelabel"]=0
operation_parameters_minimum_occurrences["cartCatalogPriceRulesList:::start"]=0
operation_parameters_minimum_occurrences["cartCatalogPriceRulesList:::count"]=0
operation_parameters_minimum_occurrences["cartCatalogPriceRulesList:::page_cursor"]=0
operation_parameters_minimum_occurrences["cartCatalogPriceRulesList:::ids"]=0
operation_parameters_minimum_occurrences["cartCatalogPriceRulesList:::response_fields"]=0
operation_parameters_minimum_occurrences["cartCatalogPriceRulesList:::params"]=0
operation_parameters_minimum_occurrences["cartCatalogPriceRulesList:::exclude"]=0
operation_parameters_minimum_occurrences["cartCouponAdd:::CartCouponAdd"]=1
operation_parameters_minimum_occurrences["cartCouponConditionAdd:::coupon_id"]=1
operation_parameters_minimum_occurrences["cartCouponConditionAdd:::entity"]=1
operation_parameters_minimum_occurrences["cartCouponConditionAdd:::key"]=1
operation_parameters_minimum_occurrences["cartCouponConditionAdd:::operator"]=1
operation_parameters_minimum_occurrences["cartCouponConditionAdd:::value"]=1
operation_parameters_minimum_occurrences["cartCouponConditionAdd:::target"]=0
operation_parameters_minimum_occurrences["cartCouponConditionAdd:::include_tax"]=0
operation_parameters_minimum_occurrences["cartCouponConditionAdd:::include_shipping"]=0
operation_parameters_minimum_occurrences["cartCouponConditionAdd:::store_id"]=0
operation_parameters_minimum_occurrences["cartCouponCount:::store_id"]=0
operation_parameters_minimum_occurrences["cartCouponCount:::avail"]=0
operation_parameters_minimum_occurrences["cartCouponCount:::date_start_from"]=0
operation_parameters_minimum_occurrences["cartCouponCount:::date_start_to"]=0
operation_parameters_minimum_occurrences["cartCouponCount:::date_end_from"]=0
operation_parameters_minimum_occurrences["cartCouponCount:::date_end_to"]=0
operation_parameters_minimum_occurrences["cartCouponDelete:::id"]=1
operation_parameters_minimum_occurrences["cartCouponDelete:::store_id"]=0
operation_parameters_minimum_occurrences["cartCouponList:::start"]=0
operation_parameters_minimum_occurrences["cartCouponList:::count"]=0
operation_parameters_minimum_occurrences["cartCouponList:::page_cursor"]=0
operation_parameters_minimum_occurrences["cartCouponList:::coupons_ids"]=0
operation_parameters_minimum_occurrences["cartCouponList:::store_id"]=0
operation_parameters_minimum_occurrences["cartCouponList:::lang_id"]=0
operation_parameters_minimum_occurrences["cartCouponList:::avail"]=0
operation_parameters_minimum_occurrences["cartCouponList:::date_start_from"]=0
operation_parameters_minimum_occurrences["cartCouponList:::date_start_to"]=0
operation_parameters_minimum_occurrences["cartCouponList:::date_end_from"]=0
operation_parameters_minimum_occurrences["cartCouponList:::date_end_to"]=0
operation_parameters_minimum_occurrences["cartCouponList:::response_fields"]=0
operation_parameters_minimum_occurrences["cartCouponList:::params"]=0
operation_parameters_minimum_occurrences["cartCouponList:::exclude"]=0
operation_parameters_minimum_occurrences["cartDelete:::delete_bridge"]=0
operation_parameters_minimum_occurrences["cartGiftcardAdd:::amount"]=1
operation_parameters_minimum_occurrences["cartGiftcardAdd:::code"]=0
operation_parameters_minimum_occurrences["cartGiftcardAdd:::owner_email"]=0
operation_parameters_minimum_occurrences["cartGiftcardAdd:::recipient_email"]=0
operation_parameters_minimum_occurrences["cartGiftcardAdd:::recipient_name"]=0
operation_parameters_minimum_occurrences["cartGiftcardAdd:::owner_name"]=0
operation_parameters_minimum_occurrences["cartGiftcardCount:::store_id"]=0
operation_parameters_minimum_occurrences["cartGiftcardDelete:::id"]=1
operation_parameters_minimum_occurrences["cartGiftcardList:::start"]=0
operation_parameters_minimum_occurrences["cartGiftcardList:::count"]=0
operation_parameters_minimum_occurrences["cartGiftcardList:::page_cursor"]=0
operation_parameters_minimum_occurrences["cartGiftcardList:::store_id"]=0
operation_parameters_minimum_occurrences["cartGiftcardList:::response_fields"]=0
operation_parameters_minimum_occurrences["cartGiftcardList:::params"]=0
operation_parameters_minimum_occurrences["cartGiftcardList:::exclude"]=0
operation_parameters_minimum_occurrences["cartInfo:::store_id"]=0
operation_parameters_minimum_occurrences["cartInfo:::response_fields"]=0
operation_parameters_minimum_occurrences["cartInfo:::params"]=0
operation_parameters_minimum_occurrences["cartInfo:::exclude"]=0
operation_parameters_minimum_occurrences["cartMetaDataList:::entity_id"]=1
operation_parameters_minimum_occurrences["cartMetaDataList:::count"]=0
operation_parameters_minimum_occurrences["cartMetaDataList:::page_cursor"]=0
operation_parameters_minimum_occurrences["cartMetaDataList:::entity"]=0
operation_parameters_minimum_occurrences["cartMetaDataList:::store_id"]=0
operation_parameters_minimum_occurrences["cartMetaDataList:::lang_id"]=0
operation_parameters_minimum_occurrences["cartMetaDataList:::key"]=0
operation_parameters_minimum_occurrences["cartMetaDataList:::response_fields"]=0
operation_parameters_minimum_occurrences["cartMetaDataList:::params"]=0
operation_parameters_minimum_occurrences["cartMetaDataList:::exclude"]=0
operation_parameters_minimum_occurrences["cartMetaDataSet:::entity_id"]=1
operation_parameters_minimum_occurrences["cartMetaDataSet:::key"]=1
operation_parameters_minimum_occurrences["cartMetaDataSet:::value"]=1
operation_parameters_minimum_occurrences["cartMetaDataSet:::namespace"]=1
operation_parameters_minimum_occurrences["cartMetaDataSet:::entity"]=0
operation_parameters_minimum_occurrences["cartMetaDataSet:::store_id"]=0
operation_parameters_minimum_occurrences["cartMetaDataSet:::lang_id"]=0
operation_parameters_minimum_occurrences["cartMetaDataUnset:::entity_id"]=1
operation_parameters_minimum_occurrences["cartMetaDataUnset:::key"]=1
operation_parameters_minimum_occurrences["cartMetaDataUnset:::id"]=1
operation_parameters_minimum_occurrences["cartMetaDataUnset:::entity"]=0
operation_parameters_minimum_occurrences["cartMetaDataUnset:::store_id"]=0
operation_parameters_minimum_occurrences["cartPluginList:::start"]=0
operation_parameters_minimum_occurrences["cartPluginList:::count"]=0
operation_parameters_minimum_occurrences["cartPluginList:::store_id"]=0
operation_parameters_minimum_occurrences["cartScriptAdd:::name"]=0
operation_parameters_minimum_occurrences["cartScriptAdd:::description"]=0
operation_parameters_minimum_occurrences["cartScriptAdd:::html"]=0
operation_parameters_minimum_occurrences["cartScriptAdd:::src"]=0
operation_parameters_minimum_occurrences["cartScriptAdd:::load_method"]=0
operation_parameters_minimum_occurrences["cartScriptAdd:::scope"]=0
operation_parameters_minimum_occurrences["cartScriptAdd:::events"]=0
operation_parameters_minimum_occurrences["cartScriptAdd:::store_id"]=0
operation_parameters_minimum_occurrences["cartScriptDelete:::id"]=1
operation_parameters_minimum_occurrences["cartScriptDelete:::store_id"]=0
operation_parameters_minimum_occurrences["cartScriptList:::start"]=0
operation_parameters_minimum_occurrences["cartScriptList:::count"]=0
operation_parameters_minimum_occurrences["cartScriptList:::page_cursor"]=0
operation_parameters_minimum_occurrences["cartScriptList:::script_ids"]=0
operation_parameters_minimum_occurrences["cartScriptList:::store_id"]=0
operation_parameters_minimum_occurrences["cartScriptList:::created_from"]=0
operation_parameters_minimum_occurrences["cartScriptList:::created_to"]=0
operation_parameters_minimum_occurrences["cartScriptList:::modified_from"]=0
operation_parameters_minimum_occurrences["cartScriptList:::modified_to"]=0
operation_parameters_minimum_occurrences["cartScriptList:::response_fields"]=0
operation_parameters_minimum_occurrences["cartScriptList:::params"]=0
operation_parameters_minimum_occurrences["cartScriptList:::exclude"]=0
operation_parameters_minimum_occurrences["cartShippingZonesList:::start"]=0
operation_parameters_minimum_occurrences["cartShippingZonesList:::count"]=0
operation_parameters_minimum_occurrences["cartShippingZonesList:::store_id"]=0
operation_parameters_minimum_occurrences["cartShippingZonesList:::response_fields"]=0
operation_parameters_minimum_occurrences["cartShippingZonesList:::params"]=0
operation_parameters_minimum_occurrences["cartShippingZonesList:::exclude"]=0
operation_parameters_minimum_occurrences["cartValidate:::validate_version"]=0
operation_parameters_minimum_occurrences["categoryAdd:::name"]=1
operation_parameters_minimum_occurrences["categoryAdd:::description"]=0
operation_parameters_minimum_occurrences["categoryAdd:::short_description"]=0
operation_parameters_minimum_occurrences["categoryAdd:::parent_id"]=0
operation_parameters_minimum_occurrences["categoryAdd:::avail"]=0
operation_parameters_minimum_occurrences["categoryAdd:::created_time"]=0
operation_parameters_minimum_occurrences["categoryAdd:::modified_time"]=0
operation_parameters_minimum_occurrences["categoryAdd:::sort_order"]=0
operation_parameters_minimum_occurrences["categoryAdd:::meta_title"]=0
operation_parameters_minimum_occurrences["categoryAdd:::meta_description"]=0
operation_parameters_minimum_occurrences["categoryAdd:::meta_keywords"]=0
operation_parameters_minimum_occurrences["categoryAdd:::seo_url"]=0
operation_parameters_minimum_occurrences["categoryAdd:::store_id"]=0
operation_parameters_minimum_occurrences["categoryAdd:::stores_ids"]=0
operation_parameters_minimum_occurrences["categoryAdd:::lang_id"]=0
operation_parameters_minimum_occurrences["categoryAddBatch:::CategoryAddBatch"]=1
operation_parameters_minimum_occurrences["categoryAssign:::category_id"]=1
operation_parameters_minimum_occurrences["categoryAssign:::product_id"]=1
operation_parameters_minimum_occurrences["categoryAssign:::store_id"]=0
operation_parameters_minimum_occurrences["categoryCount:::parent_id"]=0
operation_parameters_minimum_occurrences["categoryCount:::store_id"]=0
operation_parameters_minimum_occurrences["categoryCount:::lang_id"]=0
operation_parameters_minimum_occurrences["categoryCount:::avail"]=0
operation_parameters_minimum_occurrences["categoryCount:::created_from"]=0
operation_parameters_minimum_occurrences["categoryCount:::created_to"]=0
operation_parameters_minimum_occurrences["categoryCount:::modified_from"]=0
operation_parameters_minimum_occurrences["categoryCount:::modified_to"]=0
operation_parameters_minimum_occurrences["categoryCount:::product_type"]=0
operation_parameters_minimum_occurrences["categoryCount:::find_value"]=0
operation_parameters_minimum_occurrences["categoryCount:::find_where"]=0
operation_parameters_minimum_occurrences["categoryCount:::report_request_id"]=0
operation_parameters_minimum_occurrences["categoryCount:::disable_report_cache"]=0
operation_parameters_minimum_occurrences["categoryDelete:::id"]=1
operation_parameters_minimum_occurrences["categoryDelete:::store_id"]=0
operation_parameters_minimum_occurrences["categoryFind:::find_value"]=1
operation_parameters_minimum_occurrences["categoryFind:::find_where"]=0
operation_parameters_minimum_occurrences["categoryFind:::find_params"]=0
operation_parameters_minimum_occurrences["categoryFind:::store_id"]=0
operation_parameters_minimum_occurrences["categoryFind:::lang_id"]=0
operation_parameters_minimum_occurrences["categoryImageAdd:::category_id"]=1
operation_parameters_minimum_occurrences["categoryImageAdd:::image_name"]=1
operation_parameters_minimum_occurrences["categoryImageAdd:::url"]=1
operation_parameters_minimum_occurrences["categoryImageAdd:::type"]=1
operation_parameters_minimum_occurrences["categoryImageAdd:::store_id"]=0
operation_parameters_minimum_occurrences["categoryImageAdd:::label"]=0
operation_parameters_minimum_occurrences["categoryImageAdd:::mime"]=0
operation_parameters_minimum_occurrences["categoryImageAdd:::position"]=0
operation_parameters_minimum_occurrences["categoryImageDelete:::category_id"]=1
operation_parameters_minimum_occurrences["categoryImageDelete:::image_id"]=1
operation_parameters_minimum_occurrences["categoryImageDelete:::store_id"]=0
operation_parameters_minimum_occurrences["categoryInfo:::id"]=1
operation_parameters_minimum_occurrences["categoryInfo:::store_id"]=0
operation_parameters_minimum_occurrences["categoryInfo:::lang_id"]=0
operation_parameters_minimum_occurrences["categoryInfo:::schema_type"]=0
operation_parameters_minimum_occurrences["categoryInfo:::response_fields"]=0
operation_parameters_minimum_occurrences["categoryInfo:::params"]=0
operation_parameters_minimum_occurrences["categoryInfo:::exclude"]=0
operation_parameters_minimum_occurrences["categoryInfo:::report_request_id"]=0
operation_parameters_minimum_occurrences["categoryInfo:::disable_report_cache"]=0
operation_parameters_minimum_occurrences["categoryList:::start"]=0
operation_parameters_minimum_occurrences["categoryList:::count"]=0
operation_parameters_minimum_occurrences["categoryList:::page_cursor"]=0
operation_parameters_minimum_occurrences["categoryList:::store_id"]=0
operation_parameters_minimum_occurrences["categoryList:::lang_id"]=0
operation_parameters_minimum_occurrences["categoryList:::parent_id"]=0
operation_parameters_minimum_occurrences["categoryList:::avail"]=0
operation_parameters_minimum_occurrences["categoryList:::product_type"]=0
operation_parameters_minimum_occurrences["categoryList:::created_from"]=0
operation_parameters_minimum_occurrences["categoryList:::created_to"]=0
operation_parameters_minimum_occurrences["categoryList:::modified_from"]=0
operation_parameters_minimum_occurrences["categoryList:::modified_to"]=0
operation_parameters_minimum_occurrences["categoryList:::find_value"]=0
operation_parameters_minimum_occurrences["categoryList:::find_where"]=0
operation_parameters_minimum_occurrences["categoryList:::response_fields"]=0
operation_parameters_minimum_occurrences["categoryList:::params"]=0
operation_parameters_minimum_occurrences["categoryList:::exclude"]=0
operation_parameters_minimum_occurrences["categoryList:::report_request_id"]=0
operation_parameters_minimum_occurrences["categoryList:::disable_report_cache"]=0
operation_parameters_minimum_occurrences["categoryList:::disable_cache"]=0
operation_parameters_minimum_occurrences["categoryUnassign:::category_id"]=1
operation_parameters_minimum_occurrences["categoryUnassign:::product_id"]=1
operation_parameters_minimum_occurrences["categoryUnassign:::store_id"]=0
operation_parameters_minimum_occurrences["categoryUpdate:::id"]=1
operation_parameters_minimum_occurrences["categoryUpdate:::name"]=0
operation_parameters_minimum_occurrences["categoryUpdate:::description"]=0
operation_parameters_minimum_occurrences["categoryUpdate:::short_description"]=0
operation_parameters_minimum_occurrences["categoryUpdate:::parent_id"]=0
operation_parameters_minimum_occurrences["categoryUpdate:::avail"]=0
operation_parameters_minimum_occurrences["categoryUpdate:::sort_order"]=0
operation_parameters_minimum_occurrences["categoryUpdate:::modified_time"]=0
operation_parameters_minimum_occurrences["categoryUpdate:::meta_title"]=0
operation_parameters_minimum_occurrences["categoryUpdate:::meta_description"]=0
operation_parameters_minimum_occurrences["categoryUpdate:::meta_keywords"]=0
operation_parameters_minimum_occurrences["categoryUpdate:::seo_url"]=0
operation_parameters_minimum_occurrences["categoryUpdate:::store_id"]=0
operation_parameters_minimum_occurrences["categoryUpdate:::stores_ids"]=0
operation_parameters_minimum_occurrences["categoryUpdate:::lang_id"]=0
operation_parameters_minimum_occurrences["customerAdd:::CustomerAdd"]=1
operation_parameters_minimum_occurrences["customerAddressAdd:::CustomerAddressAdd"]=1
operation_parameters_minimum_occurrences["customerAttributeList:::customer_id"]=1
operation_parameters_minimum_occurrences["customerAttributeList:::count"]=0
operation_parameters_minimum_occurrences["customerAttributeList:::page_cursor"]=0
operation_parameters_minimum_occurrences["customerAttributeList:::store_id"]=0
operation_parameters_minimum_occurrences["customerAttributeList:::lang_id"]=0
operation_parameters_minimum_occurrences["customerAttributeList:::response_fields"]=0
operation_parameters_minimum_occurrences["customerAttributeList:::params"]=0
operation_parameters_minimum_occurrences["customerAttributeList:::exclude"]=0
operation_parameters_minimum_occurrences["customerCount:::ids"]=0
operation_parameters_minimum_occurrences["customerCount:::since_id"]=0
operation_parameters_minimum_occurrences["customerCount:::customer_list_id"]=0
operation_parameters_minimum_occurrences["customerCount:::group_id"]=0
operation_parameters_minimum_occurrences["customerCount:::store_id"]=0
operation_parameters_minimum_occurrences["customerCount:::avail"]=0
operation_parameters_minimum_occurrences["customerCount:::include_guests"]=0
operation_parameters_minimum_occurrences["customerCount:::find_value"]=0
operation_parameters_minimum_occurrences["customerCount:::find_where"]=0
operation_parameters_minimum_occurrences["customerCount:::created_from"]=0
operation_parameters_minimum_occurrences["customerCount:::created_to"]=0
operation_parameters_minimum_occurrences["customerCount:::modified_from"]=0
operation_parameters_minimum_occurrences["customerCount:::modified_to"]=0
operation_parameters_minimum_occurrences["customerDelete:::id"]=1
operation_parameters_minimum_occurrences["customerFind:::find_value"]=1
operation_parameters_minimum_occurrences["customerFind:::find_where"]=0
operation_parameters_minimum_occurrences["customerFind:::find_params"]=0
operation_parameters_minimum_occurrences["customerFind:::store_id"]=0
operation_parameters_minimum_occurrences["customerFind:::include_guests"]=0
operation_parameters_minimum_occurrences["customerGroupAdd:::name"]=1
operation_parameters_minimum_occurrences["customerGroupAdd:::store_id"]=0
operation_parameters_minimum_occurrences["customerGroupAdd:::stores_ids"]=0
operation_parameters_minimum_occurrences["customerGroupList:::start"]=0
operation_parameters_minimum_occurrences["customerGroupList:::count"]=0
operation_parameters_minimum_occurrences["customerGroupList:::page_cursor"]=0
operation_parameters_minimum_occurrences["customerGroupList:::group_ids"]=0
operation_parameters_minimum_occurrences["customerGroupList:::store_id"]=0
operation_parameters_minimum_occurrences["customerGroupList:::lang_id"]=0
operation_parameters_minimum_occurrences["customerGroupList:::response_fields"]=0
operation_parameters_minimum_occurrences["customerGroupList:::params"]=0
operation_parameters_minimum_occurrences["customerGroupList:::exclude"]=0
operation_parameters_minimum_occurrences["customerGroupList:::disable_cache"]=0
operation_parameters_minimum_occurrences["customerInfo:::id"]=1
operation_parameters_minimum_occurrences["customerInfo:::store_id"]=0
operation_parameters_minimum_occurrences["customerInfo:::response_fields"]=0
operation_parameters_minimum_occurrences["customerInfo:::params"]=0
operation_parameters_minimum_occurrences["customerInfo:::exclude"]=0
operation_parameters_minimum_occurrences["customerList:::start"]=0
operation_parameters_minimum_occurrences["customerList:::count"]=0
operation_parameters_minimum_occurrences["customerList:::page_cursor"]=0
operation_parameters_minimum_occurrences["customerList:::ids"]=0
operation_parameters_minimum_occurrences["customerList:::since_id"]=0
operation_parameters_minimum_occurrences["customerList:::customer_list_id"]=0
operation_parameters_minimum_occurrences["customerList:::group_id"]=0
operation_parameters_minimum_occurrences["customerList:::store_id"]=0
operation_parameters_minimum_occurrences["customerList:::avail"]=0
operation_parameters_minimum_occurrences["customerList:::include_guests"]=0
operation_parameters_minimum_occurrences["customerList:::find_value"]=0
operation_parameters_minimum_occurrences["customerList:::find_where"]=0
operation_parameters_minimum_occurrences["customerList:::created_from"]=0
operation_parameters_minimum_occurrences["customerList:::created_to"]=0
operation_parameters_minimum_occurrences["customerList:::modified_from"]=0
operation_parameters_minimum_occurrences["customerList:::modified_to"]=0
operation_parameters_minimum_occurrences["customerList:::sort_by"]=0
operation_parameters_minimum_occurrences["customerList:::sort_direction"]=0
operation_parameters_minimum_occurrences["customerList:::response_fields"]=0
operation_parameters_minimum_occurrences["customerList:::params"]=0
operation_parameters_minimum_occurrences["customerList:::exclude"]=0
operation_parameters_minimum_occurrences["customerUpdate:::CustomerUpdate"]=1
operation_parameters_minimum_occurrences["customerWishlistList:::customer_id"]=1
operation_parameters_minimum_occurrences["customerWishlistList:::start"]=0
operation_parameters_minimum_occurrences["customerWishlistList:::count"]=0
operation_parameters_minimum_occurrences["customerWishlistList:::page_cursor"]=0
operation_parameters_minimum_occurrences["customerWishlistList:::id"]=0
operation_parameters_minimum_occurrences["customerWishlistList:::store_id"]=0
operation_parameters_minimum_occurrences["customerWishlistList:::response_fields"]=0
operation_parameters_minimum_occurrences["marketplaceProductFind:::count"]=0
operation_parameters_minimum_occurrences["marketplaceProductFind:::page_cursor"]=0
operation_parameters_minimum_occurrences["marketplaceProductFind:::keyword"]=0
operation_parameters_minimum_occurrences["marketplaceProductFind:::categories_ids"]=0
operation_parameters_minimum_occurrences["marketplaceProductFind:::store_id"]=0
operation_parameters_minimum_occurrences["marketplaceProductFind:::asin"]=0
operation_parameters_minimum_occurrences["marketplaceProductFind:::ean"]=0
operation_parameters_minimum_occurrences["marketplaceProductFind:::gtin"]=0
operation_parameters_minimum_occurrences["marketplaceProductFind:::upc"]=0
operation_parameters_minimum_occurrences["marketplaceProductFind:::mpn"]=0
operation_parameters_minimum_occurrences["marketplaceProductFind:::isbn"]=0
operation_parameters_minimum_occurrences["marketplaceProductFind:::response_fields"]=0
operation_parameters_minimum_occurrences["marketplaceProductFind:::params"]=0
operation_parameters_minimum_occurrences["marketplaceProductFind:::exclude"]=0
operation_parameters_minimum_occurrences["orderAbandonedList:::start"]=0
operation_parameters_minimum_occurrences["orderAbandonedList:::count"]=0
operation_parameters_minimum_occurrences["orderAbandonedList:::page_cursor"]=0
operation_parameters_minimum_occurrences["orderAbandonedList:::customer_id"]=0
operation_parameters_minimum_occurrences["orderAbandonedList:::customer_email"]=0
operation_parameters_minimum_occurrences["orderAbandonedList:::store_id"]=0
operation_parameters_minimum_occurrences["orderAbandonedList:::created_from"]=0
operation_parameters_minimum_occurrences["orderAbandonedList:::created_to"]=0
operation_parameters_minimum_occurrences["orderAbandonedList:::modified_from"]=0
operation_parameters_minimum_occurrences["orderAbandonedList:::modified_to"]=0
operation_parameters_minimum_occurrences["orderAbandonedList:::skip_empty_email"]=0
operation_parameters_minimum_occurrences["orderAbandonedList:::response_fields"]=0
operation_parameters_minimum_occurrences["orderAbandonedList:::params"]=0
operation_parameters_minimum_occurrences["orderAbandonedList:::exclude"]=0
operation_parameters_minimum_occurrences["orderAdd:::OrderAdd"]=1
operation_parameters_minimum_occurrences["orderCount:::order_ids"]=0
operation_parameters_minimum_occurrences["orderCount:::ids"]=0
operation_parameters_minimum_occurrences["orderCount:::customer_id"]=0
operation_parameters_minimum_occurrences["orderCount:::store_id"]=0
operation_parameters_minimum_occurrences["orderCount:::customer_email"]=0
operation_parameters_minimum_occurrences["orderCount:::order_status"]=0
operation_parameters_minimum_occurrences["orderCount:::order_status_ids"]=0
operation_parameters_minimum_occurrences["orderCount:::ebay_order_status"]=0
operation_parameters_minimum_occurrences["orderCount:::financial_status"]=0
operation_parameters_minimum_occurrences["orderCount:::financial_status_ids"]=0
operation_parameters_minimum_occurrences["orderCount:::fulfillment_channel"]=0
operation_parameters_minimum_occurrences["orderCount:::fulfillment_status"]=0
operation_parameters_minimum_occurrences["orderCount:::shipping_method"]=0
operation_parameters_minimum_occurrences["orderCount:::delivery_method"]=0
operation_parameters_minimum_occurrences["orderCount:::tags"]=0
operation_parameters_minimum_occurrences["orderCount:::ship_node_type"]=0
operation_parameters_minimum_occurrences["orderCount:::created_from"]=0
operation_parameters_minimum_occurrences["orderCount:::created_to"]=0
operation_parameters_minimum_occurrences["orderCount:::modified_from"]=0
operation_parameters_minimum_occurrences["orderCount:::modified_to"]=0
operation_parameters_minimum_occurrences["orderFulfillmentStatusList:::action"]=0
operation_parameters_minimum_occurrences["orderInfo:::id"]=0
operation_parameters_minimum_occurrences["orderInfo:::order_id"]=0
operation_parameters_minimum_occurrences["orderInfo:::store_id"]=0
operation_parameters_minimum_occurrences["orderInfo:::params"]=0
operation_parameters_minimum_occurrences["orderInfo:::response_fields"]=0
operation_parameters_minimum_occurrences["orderInfo:::exclude"]=0
operation_parameters_minimum_occurrences["orderInfo:::enable_cache"]=0
operation_parameters_minimum_occurrences["orderInfo:::use_latest_api_version"]=0
operation_parameters_minimum_occurrences["orderList:::start"]=0
operation_parameters_minimum_occurrences["orderList:::count"]=0
operation_parameters_minimum_occurrences["orderList:::page_cursor"]=0
operation_parameters_minimum_occurrences["orderList:::ids"]=0
operation_parameters_minimum_occurrences["orderList:::order_ids"]=0
operation_parameters_minimum_occurrences["orderList:::since_id"]=0
operation_parameters_minimum_occurrences["orderList:::store_id"]=0
operation_parameters_minimum_occurrences["orderList:::customer_id"]=0
operation_parameters_minimum_occurrences["orderList:::customer_email"]=0
operation_parameters_minimum_occurrences["orderList:::basket_id"]=0
operation_parameters_minimum_occurrences["orderList:::currency_id"]=0
operation_parameters_minimum_occurrences["orderList:::phone"]=0
operation_parameters_minimum_occurrences["orderList:::order_status"]=0
operation_parameters_minimum_occurrences["orderList:::order_status_ids"]=0
operation_parameters_minimum_occurrences["orderList:::ebay_order_status"]=0
operation_parameters_minimum_occurrences["orderList:::financial_status"]=0
operation_parameters_minimum_occurrences["orderList:::financial_status_ids"]=0
operation_parameters_minimum_occurrences["orderList:::fulfillment_status"]=0
operation_parameters_minimum_occurrences["orderList:::return_status"]=0
operation_parameters_minimum_occurrences["orderList:::fulfillment_channel"]=0
operation_parameters_minimum_occurrences["orderList:::shipping_method"]=0
operation_parameters_minimum_occurrences["orderList:::skip_order_ids"]=0
operation_parameters_minimum_occurrences["orderList:::is_deleted"]=0
operation_parameters_minimum_occurrences["orderList:::shipping_country_iso3"]=0
operation_parameters_minimum_occurrences["orderList:::delivery_method"]=0
operation_parameters_minimum_occurrences["orderList:::ship_node_type"]=0
operation_parameters_minimum_occurrences["orderList:::created_to"]=0
operation_parameters_minimum_occurrences["orderList:::created_from"]=0
operation_parameters_minimum_occurrences["orderList:::modified_to"]=0
operation_parameters_minimum_occurrences["orderList:::modified_from"]=0
operation_parameters_minimum_occurrences["orderList:::tags"]=0
operation_parameters_minimum_occurrences["orderList:::sort_by"]=0
operation_parameters_minimum_occurrences["orderList:::sort_direction"]=0
operation_parameters_minimum_occurrences["orderList:::params"]=0
operation_parameters_minimum_occurrences["orderList:::response_fields"]=0
operation_parameters_minimum_occurrences["orderList:::exclude"]=0
operation_parameters_minimum_occurrences["orderList:::enable_cache"]=0
operation_parameters_minimum_occurrences["orderList:::use_latest_api_version"]=0
operation_parameters_minimum_occurrences["orderPreestimateShippingList:::OrderPreestimateShippingList"]=1
operation_parameters_minimum_occurrences["orderRefundAdd:::OrderRefundAdd"]=1
operation_parameters_minimum_occurrences["orderReturnAdd:::OrderReturnAdd"]=1
operation_parameters_minimum_occurrences["orderReturnDelete:::return_id"]=1
operation_parameters_minimum_occurrences["orderReturnDelete:::order_id"]=1
operation_parameters_minimum_occurrences["orderReturnDelete:::store_id"]=0
operation_parameters_minimum_occurrences["orderReturnUpdate:::OrderReturnUpdate"]=1
operation_parameters_minimum_occurrences["orderShipmentAdd:::OrderShipmentAdd"]=1
operation_parameters_minimum_occurrences["orderShipmentAddBatch:::OrderShipmentAddBatch"]=1
operation_parameters_minimum_occurrences["orderShipmentDelete:::shipment_id"]=1
operation_parameters_minimum_occurrences["orderShipmentDelete:::order_id"]=1
operation_parameters_minimum_occurrences["orderShipmentDelete:::store_id"]=0
operation_parameters_minimum_occurrences["orderShipmentInfo:::id"]=1
operation_parameters_minimum_occurrences["orderShipmentInfo:::order_id"]=1
operation_parameters_minimum_occurrences["orderShipmentInfo:::start"]=0
operation_parameters_minimum_occurrences["orderShipmentInfo:::store_id"]=0
operation_parameters_minimum_occurrences["orderShipmentInfo:::response_fields"]=0
operation_parameters_minimum_occurrences["orderShipmentInfo:::params"]=0
operation_parameters_minimum_occurrences["orderShipmentInfo:::exclude"]=0
operation_parameters_minimum_occurrences["orderShipmentList:::order_id"]=1
operation_parameters_minimum_occurrences["orderShipmentList:::start"]=0
operation_parameters_minimum_occurrences["orderShipmentList:::count"]=0
operation_parameters_minimum_occurrences["orderShipmentList:::page_cursor"]=0
operation_parameters_minimum_occurrences["orderShipmentList:::store_id"]=0
operation_parameters_minimum_occurrences["orderShipmentList:::created_from"]=0
operation_parameters_minimum_occurrences["orderShipmentList:::created_to"]=0
operation_parameters_minimum_occurrences["orderShipmentList:::modified_from"]=0
operation_parameters_minimum_occurrences["orderShipmentList:::modified_to"]=0
operation_parameters_minimum_occurrences["orderShipmentList:::response_fields"]=0
operation_parameters_minimum_occurrences["orderShipmentList:::params"]=0
operation_parameters_minimum_occurrences["orderShipmentList:::exclude"]=0
operation_parameters_minimum_occurrences["orderShipmentTrackingAdd:::OrderShipmentTrackingAdd"]=1
operation_parameters_minimum_occurrences["orderShipmentUpdate:::OrderShipmentUpdate"]=1
operation_parameters_minimum_occurrences["orderStatusList:::store_id"]=0
operation_parameters_minimum_occurrences["orderStatusList:::action"]=0
operation_parameters_minimum_occurrences["orderStatusList:::response_fields"]=0
operation_parameters_minimum_occurrences["orderTransactionList:::order_ids"]=1
operation_parameters_minimum_occurrences["orderTransactionList:::count"]=0
operation_parameters_minimum_occurrences["orderTransactionList:::page_cursor"]=0
operation_parameters_minimum_occurrences["orderTransactionList:::store_id"]=0
operation_parameters_minimum_occurrences["orderTransactionList:::params"]=0
operation_parameters_minimum_occurrences["orderTransactionList:::response_fields"]=0
operation_parameters_minimum_occurrences["orderTransactionList:::exclude"]=0
operation_parameters_minimum_occurrences["orderUpdate:::order_id"]=1
operation_parameters_minimum_occurrences["orderUpdate:::store_id"]=0
operation_parameters_minimum_occurrences["orderUpdate:::order_status"]=0
operation_parameters_minimum_occurrences["orderUpdate:::financial_status"]=0
operation_parameters_minimum_occurrences["orderUpdate:::fulfillment_status"]=0
operation_parameters_minimum_occurrences["orderUpdate:::cancellation_reason"]=0
operation_parameters_minimum_occurrences["orderUpdate:::order_payment_method"]=0
operation_parameters_minimum_occurrences["orderUpdate:::comment"]=0
operation_parameters_minimum_occurrences["orderUpdate:::admin_comment"]=0
operation_parameters_minimum_occurrences["orderUpdate:::admin_private_comment"]=0
operation_parameters_minimum_occurrences["orderUpdate:::invoice_admin_comment"]=0
operation_parameters_minimum_occurrences["orderUpdate:::date_modified"]=0
operation_parameters_minimum_occurrences["orderUpdate:::date_finished"]=0
operation_parameters_minimum_occurrences["orderUpdate:::send_notifications"]=0
operation_parameters_minimum_occurrences["orderUpdate:::create_invoice"]=0
operation_parameters_minimum_occurrences["orderUpdate:::origin"]=0
operation_parameters_minimum_occurrences["orderUpdate:::tags"]=0
operation_parameters_minimum_occurrences["productAdd:::ProductAdd"]=1
operation_parameters_minimum_occurrences["productAddBatch:::ProductAddBatch"]=1
operation_parameters_minimum_occurrences["productAttributeList:::product_id"]=1
operation_parameters_minimum_occurrences["productAttributeList:::start"]=0
operation_parameters_minimum_occurrences["productAttributeList:::count"]=0
operation_parameters_minimum_occurrences["productAttributeList:::page_cursor"]=0
operation_parameters_minimum_occurrences["productAttributeList:::attribute_id"]=0
operation_parameters_minimum_occurrences["productAttributeList:::variant_id"]=0
operation_parameters_minimum_occurrences["productAttributeList:::attribute_group_id"]=0
operation_parameters_minimum_occurrences["productAttributeList:::lang_id"]=0
operation_parameters_minimum_occurrences["productAttributeList:::store_id"]=0
operation_parameters_minimum_occurrences["productAttributeList:::set_name"]=0
operation_parameters_minimum_occurrences["productAttributeList:::sort_by"]=0
operation_parameters_minimum_occurrences["productAttributeList:::sort_direction"]=0
operation_parameters_minimum_occurrences["productAttributeList:::response_fields"]=0
operation_parameters_minimum_occurrences["productAttributeList:::params"]=0
operation_parameters_minimum_occurrences["productAttributeList:::exclude"]=0
operation_parameters_minimum_occurrences["productAttributeValueSet:::product_id"]=1
operation_parameters_minimum_occurrences["productAttributeValueSet:::attribute_id"]=0
operation_parameters_minimum_occurrences["productAttributeValueSet:::attribute_group_id"]=0
operation_parameters_minimum_occurrences["productAttributeValueSet:::attribute_name"]=0
operation_parameters_minimum_occurrences["productAttributeValueSet:::value"]=0
operation_parameters_minimum_occurrences["productAttributeValueSet:::value_id"]=0
operation_parameters_minimum_occurrences["productAttributeValueSet:::lang_id"]=0
operation_parameters_minimum_occurrences["productAttributeValueSet:::store_id"]=0
operation_parameters_minimum_occurrences["productAttributeValueUnset:::product_id"]=1
operation_parameters_minimum_occurrences["productAttributeValueUnset:::attribute_id"]=1
operation_parameters_minimum_occurrences["productAttributeValueUnset:::store_id"]=0
operation_parameters_minimum_occurrences["productAttributeValueUnset:::include_default"]=0
operation_parameters_minimum_occurrences["productAttributeValueUnset:::reindex"]=0
operation_parameters_minimum_occurrences["productAttributeValueUnset:::clear_cache"]=0
operation_parameters_minimum_occurrences["productBrandList:::start"]=0
operation_parameters_minimum_occurrences["productBrandList:::count"]=0
operation_parameters_minimum_occurrences["productBrandList:::page_cursor"]=0
operation_parameters_minimum_occurrences["productBrandList:::brand_ids"]=0
operation_parameters_minimum_occurrences["productBrandList:::category_id"]=0
operation_parameters_minimum_occurrences["productBrandList:::parent_id"]=0
operation_parameters_minimum_occurrences["productBrandList:::store_id"]=0
operation_parameters_minimum_occurrences["productBrandList:::lang_id"]=0
operation_parameters_minimum_occurrences["productBrandList:::find_where"]=0
operation_parameters_minimum_occurrences["productBrandList:::find_value"]=0
operation_parameters_minimum_occurrences["productBrandList:::created_from"]=0
operation_parameters_minimum_occurrences["productBrandList:::created_to"]=0
operation_parameters_minimum_occurrences["productBrandList:::modified_from"]=0
operation_parameters_minimum_occurrences["productBrandList:::modified_to"]=0
operation_parameters_minimum_occurrences["productBrandList:::response_fields"]=0
operation_parameters_minimum_occurrences["productBrandList:::params"]=0
operation_parameters_minimum_occurrences["productBrandList:::exclude"]=0
operation_parameters_minimum_occurrences["productChildItemFind:::find_value"]=0
operation_parameters_minimum_occurrences["productChildItemFind:::find_where"]=0
operation_parameters_minimum_occurrences["productChildItemFind:::find_params"]=0
operation_parameters_minimum_occurrences["productChildItemFind:::store_id"]=0
operation_parameters_minimum_occurrences["productChildItemInfo:::product_id"]=1
operation_parameters_minimum_occurrences["productChildItemInfo:::id"]=1
operation_parameters_minimum_occurrences["productChildItemInfo:::store_id"]=0
operation_parameters_minimum_occurrences["productChildItemInfo:::lang_id"]=0
operation_parameters_minimum_occurrences["productChildItemInfo:::currency_id"]=0
operation_parameters_minimum_occurrences["productChildItemInfo:::response_fields"]=0
operation_parameters_minimum_occurrences["productChildItemInfo:::params"]=0
operation_parameters_minimum_occurrences["productChildItemInfo:::exclude"]=0
operation_parameters_minimum_occurrences["productChildItemInfo:::use_latest_api_version"]=0
operation_parameters_minimum_occurrences["productChildItemList:::start"]=0
operation_parameters_minimum_occurrences["productChildItemList:::count"]=0
operation_parameters_minimum_occurrences["productChildItemList:::page_cursor"]=0
operation_parameters_minimum_occurrences["productChildItemList:::product_id"]=0
operation_parameters_minimum_occurrences["productChildItemList:::product_ids"]=0
operation_parameters_minimum_occurrences["productChildItemList:::sku"]=0
operation_parameters_minimum_occurrences["productChildItemList:::store_id"]=0
operation_parameters_minimum_occurrences["productChildItemList:::lang_id"]=0
operation_parameters_minimum_occurrences["productChildItemList:::currency_id"]=0
operation_parameters_minimum_occurrences["productChildItemList:::avail_sale"]=0
operation_parameters_minimum_occurrences["productChildItemList:::find_value"]=0
operation_parameters_minimum_occurrences["productChildItemList:::find_where"]=0
operation_parameters_minimum_occurrences["productChildItemList:::created_from"]=0
operation_parameters_minimum_occurrences["productChildItemList:::created_to"]=0
operation_parameters_minimum_occurrences["productChildItemList:::modified_from"]=0
operation_parameters_minimum_occurrences["productChildItemList:::modified_to"]=0
operation_parameters_minimum_occurrences["productChildItemList:::return_global"]=0
operation_parameters_minimum_occurrences["productChildItemList:::response_fields"]=0
operation_parameters_minimum_occurrences["productChildItemList:::params"]=0
operation_parameters_minimum_occurrences["productChildItemList:::exclude"]=0
operation_parameters_minimum_occurrences["productChildItemList:::report_request_id"]=0
operation_parameters_minimum_occurrences["productChildItemList:::disable_report_cache"]=0
operation_parameters_minimum_occurrences["productChildItemList:::use_latest_api_version"]=0
operation_parameters_minimum_occurrences["productCount:::product_ids"]=0
operation_parameters_minimum_occurrences["productCount:::since_id"]=0
operation_parameters_minimum_occurrences["productCount:::categories_ids"]=0
operation_parameters_minimum_occurrences["productCount:::category_id"]=0
operation_parameters_minimum_occurrences["productCount:::store_id"]=0
operation_parameters_minimum_occurrences["productCount:::lang_id"]=0
operation_parameters_minimum_occurrences["productCount:::avail_view"]=0
operation_parameters_minimum_occurrences["productCount:::avail_sale"]=0
operation_parameters_minimum_occurrences["productCount:::created_from"]=0
operation_parameters_minimum_occurrences["productCount:::created_to"]=0
operation_parameters_minimum_occurrences["productCount:::modified_from"]=0
operation_parameters_minimum_occurrences["productCount:::modified_to"]=0
operation_parameters_minimum_occurrences["productCount:::brand_name"]=0
operation_parameters_minimum_occurrences["productCount:::product_attributes"]=0
operation_parameters_minimum_occurrences["productCount:::status"]=0
operation_parameters_minimum_occurrences["productCount:::type"]=0
operation_parameters_minimum_occurrences["productCount:::visible"]=0
operation_parameters_minimum_occurrences["productCount:::find_value"]=0
operation_parameters_minimum_occurrences["productCount:::find_where"]=0
operation_parameters_minimum_occurrences["productCount:::report_request_id"]=0
operation_parameters_minimum_occurrences["productCount:::return_global"]=0
operation_parameters_minimum_occurrences["productCount:::disable_report_cache"]=0
operation_parameters_minimum_occurrences["productCount:::use_latest_api_version"]=0
operation_parameters_minimum_occurrences["productCurrencyAdd:::iso3"]=1
operation_parameters_minimum_occurrences["productCurrencyAdd:::rate"]=1
operation_parameters_minimum_occurrences["productCurrencyAdd:::name"]=0
operation_parameters_minimum_occurrences["productCurrencyAdd:::avail"]=0
operation_parameters_minimum_occurrences["productCurrencyAdd:::symbol_left"]=0
operation_parameters_minimum_occurrences["productCurrencyAdd:::symbol_right"]=0
operation_parameters_minimum_occurrences["productCurrencyAdd:::default"]=0
operation_parameters_minimum_occurrences["productCurrencyList:::start"]=0
operation_parameters_minimum_occurrences["productCurrencyList:::count"]=0
operation_parameters_minimum_occurrences["productCurrencyList:::page_cursor"]=0
operation_parameters_minimum_occurrences["productCurrencyList:::default"]=0
operation_parameters_minimum_occurrences["productCurrencyList:::avail"]=0
operation_parameters_minimum_occurrences["productCurrencyList:::response_fields"]=0
operation_parameters_minimum_occurrences["productCurrencyList:::params"]=0
operation_parameters_minimum_occurrences["productCurrencyList:::exclude"]=0
operation_parameters_minimum_occurrences["productDelete:::id"]=1
operation_parameters_minimum_occurrences["productDelete:::store_id"]=0
operation_parameters_minimum_occurrences["productDeleteBatch:::ProductDeleteBatch"]=1
operation_parameters_minimum_occurrences["productFind:::find_value"]=1
operation_parameters_minimum_occurrences["productFind:::find_where"]=0
operation_parameters_minimum_occurrences["productFind:::find_params"]=0
operation_parameters_minimum_occurrences["productFind:::find_what"]=0
operation_parameters_minimum_occurrences["productFind:::lang_id"]=0
operation_parameters_minimum_occurrences["productFind:::store_id"]=0
operation_parameters_minimum_occurrences["productImageAdd:::ProductImageAdd"]=1
operation_parameters_minimum_occurrences["productImageDelete:::product_id"]=1
operation_parameters_minimum_occurrences["productImageDelete:::id"]=1
operation_parameters_minimum_occurrences["productImageDelete:::store_id"]=0
operation_parameters_minimum_occurrences["productImageUpdate:::product_id"]=1
operation_parameters_minimum_occurrences["productImageUpdate:::id"]=1
operation_parameters_minimum_occurrences["productImageUpdate:::variant_ids"]=0
operation_parameters_minimum_occurrences["productImageUpdate:::store_id"]=0
operation_parameters_minimum_occurrences["productImageUpdate:::lang_id"]=0
operation_parameters_minimum_occurrences["productImageUpdate:::image_name"]=0
operation_parameters_minimum_occurrences["productImageUpdate:::type"]=0
operation_parameters_minimum_occurrences["productImageUpdate:::label"]=0
operation_parameters_minimum_occurrences["productImageUpdate:::position"]=0
operation_parameters_minimum_occurrences["productImageUpdate:::hidden"]=0
operation_parameters_minimum_occurrences["productInfo:::id"]=1
operation_parameters_minimum_occurrences["productInfo:::store_id"]=0
operation_parameters_minimum_occurrences["productInfo:::lang_id"]=0
operation_parameters_minimum_occurrences["productInfo:::currency_id"]=0
operation_parameters_minimum_occurrences["productInfo:::response_fields"]=0
operation_parameters_minimum_occurrences["productInfo:::params"]=0
operation_parameters_minimum_occurrences["productInfo:::exclude"]=0
operation_parameters_minimum_occurrences["productInfo:::report_request_id"]=0
operation_parameters_minimum_occurrences["productInfo:::disable_report_cache"]=0
operation_parameters_minimum_occurrences["productInfo:::use_latest_api_version"]=0
operation_parameters_minimum_occurrences["productList:::start"]=0
operation_parameters_minimum_occurrences["productList:::count"]=0
operation_parameters_minimum_occurrences["productList:::page_cursor"]=0
operation_parameters_minimum_occurrences["productList:::product_ids"]=0
operation_parameters_minimum_occurrences["productList:::since_id"]=0
operation_parameters_minimum_occurrences["productList:::categories_ids"]=0
operation_parameters_minimum_occurrences["productList:::category_id"]=0
operation_parameters_minimum_occurrences["productList:::store_id"]=0
operation_parameters_minimum_occurrences["productList:::lang_id"]=0
operation_parameters_minimum_occurrences["productList:::currency_id"]=0
operation_parameters_minimum_occurrences["productList:::avail_view"]=0
operation_parameters_minimum_occurrences["productList:::avail_sale"]=0
operation_parameters_minimum_occurrences["productList:::created_from"]=0
operation_parameters_minimum_occurrences["productList:::created_to"]=0
operation_parameters_minimum_occurrences["productList:::modified_from"]=0
operation_parameters_minimum_occurrences["productList:::modified_to"]=0
operation_parameters_minimum_occurrences["productList:::sku"]=0
operation_parameters_minimum_occurrences["productList:::brand_name"]=0
operation_parameters_minimum_occurrences["productList:::product_attributes"]=0
operation_parameters_minimum_occurrences["productList:::status"]=0
operation_parameters_minimum_occurrences["productList:::type"]=0
operation_parameters_minimum_occurrences["productList:::visible"]=0
operation_parameters_minimum_occurrences["productList:::find_value"]=0
operation_parameters_minimum_occurrences["productList:::find_where"]=0
operation_parameters_minimum_occurrences["productList:::return_global"]=0
operation_parameters_minimum_occurrences["productList:::params"]=0
operation_parameters_minimum_occurrences["productList:::response_fields"]=0
operation_parameters_minimum_occurrences["productList:::exclude"]=0
operation_parameters_minimum_occurrences["productList:::sort_by"]=0
operation_parameters_minimum_occurrences["productList:::sort_direction"]=0
operation_parameters_minimum_occurrences["productList:::report_request_id"]=0
operation_parameters_minimum_occurrences["productList:::disable_cache"]=0
operation_parameters_minimum_occurrences["productList:::disable_report_cache"]=0
operation_parameters_minimum_occurrences["productList:::use_latest_api_version"]=0
operation_parameters_minimum_occurrences["productManufacturerAdd:::product_id"]=1
operation_parameters_minimum_occurrences["productManufacturerAdd:::manufacturer"]=1
operation_parameters_minimum_occurrences["productManufacturerAdd:::store_id"]=0
operation_parameters_minimum_occurrences["productOptionAdd:::ProductOptionAdd"]=1
operation_parameters_minimum_occurrences["productOptionAssign:::product_id"]=1
operation_parameters_minimum_occurrences["productOptionAssign:::option_id"]=1
operation_parameters_minimum_occurrences["productOptionAssign:::required"]=0
operation_parameters_minimum_occurrences["productOptionAssign:::sort_order"]=0
operation_parameters_minimum_occurrences["productOptionAssign:::option_values"]=0
operation_parameters_minimum_occurrences["productOptionAssign:::clear_cache"]=0
operation_parameters_minimum_occurrences["productOptionDelete:::option_id"]=1
operation_parameters_minimum_occurrences["productOptionDelete:::product_id"]=1
operation_parameters_minimum_occurrences["productOptionDelete:::store_id"]=0
operation_parameters_minimum_occurrences["productOptionList:::start"]=0
operation_parameters_minimum_occurrences["productOptionList:::count"]=0
operation_parameters_minimum_occurrences["productOptionList:::product_id"]=0
operation_parameters_minimum_occurrences["productOptionList:::lang_id"]=0
operation_parameters_minimum_occurrences["productOptionList:::store_id"]=0
operation_parameters_minimum_occurrences["productOptionList:::response_fields"]=0
operation_parameters_minimum_occurrences["productOptionList:::params"]=0
operation_parameters_minimum_occurrences["productOptionList:::exclude"]=0
operation_parameters_minimum_occurrences["productOptionValueAdd:::product_id"]=1
operation_parameters_minimum_occurrences["productOptionValueAdd:::option_id"]=1
operation_parameters_minimum_occurrences["productOptionValueAdd:::option_value"]=0
operation_parameters_minimum_occurrences["productOptionValueAdd:::sort_order"]=0
operation_parameters_minimum_occurrences["productOptionValueAdd:::display_value"]=0
operation_parameters_minimum_occurrences["productOptionValueAdd:::is_default"]=0
operation_parameters_minimum_occurrences["productOptionValueAdd:::clear_cache"]=0
operation_parameters_minimum_occurrences["productOptionValueAssign:::product_option_id"]=1
operation_parameters_minimum_occurrences["productOptionValueAssign:::option_value_id"]=1
operation_parameters_minimum_occurrences["productOptionValueAssign:::clear_cache"]=0
operation_parameters_minimum_occurrences["productOptionValueDelete:::option_id"]=1
operation_parameters_minimum_occurrences["productOptionValueDelete:::option_value_id"]=1
operation_parameters_minimum_occurrences["productOptionValueDelete:::product_id"]=1
operation_parameters_minimum_occurrences["productOptionValueDelete:::store_id"]=0
operation_parameters_minimum_occurrences["productOptionValueUpdate:::product_id"]=1
operation_parameters_minimum_occurrences["productOptionValueUpdate:::option_id"]=1
operation_parameters_minimum_occurrences["productOptionValueUpdate:::option_value_id"]=1
operation_parameters_minimum_occurrences["productOptionValueUpdate:::option_value"]=0
operation_parameters_minimum_occurrences["productOptionValueUpdate:::price"]=0
operation_parameters_minimum_occurrences["productOptionValueUpdate:::quantity"]=0
operation_parameters_minimum_occurrences["productOptionValueUpdate:::display_value"]=0
operation_parameters_minimum_occurrences["productOptionValueUpdate:::clear_cache"]=0
operation_parameters_minimum_occurrences["productPriceAdd:::ProductPriceAdd"]=1
operation_parameters_minimum_occurrences["productPriceDelete:::product_id"]=1
operation_parameters_minimum_occurrences["productPriceDelete:::group_prices"]=0
operation_parameters_minimum_occurrences["productPriceDelete:::store_id"]=0
operation_parameters_minimum_occurrences["productPriceUpdate:::ProductPriceUpdate"]=1
operation_parameters_minimum_occurrences["productReviewList:::product_id"]=1
operation_parameters_minimum_occurrences["productReviewList:::start"]=0
operation_parameters_minimum_occurrences["productReviewList:::count"]=0
operation_parameters_minimum_occurrences["productReviewList:::page_cursor"]=0
operation_parameters_minimum_occurrences["productReviewList:::ids"]=0
operation_parameters_minimum_occurrences["productReviewList:::store_id"]=0
operation_parameters_minimum_occurrences["productReviewList:::status"]=0
operation_parameters_minimum_occurrences["productReviewList:::response_fields"]=0
operation_parameters_minimum_occurrences["productReviewList:::params"]=0
operation_parameters_minimum_occurrences["productReviewList:::exclude"]=0
operation_parameters_minimum_occurrences["productStoreAssign:::product_id"]=1
operation_parameters_minimum_occurrences["productStoreAssign:::store_id"]=1
operation_parameters_minimum_occurrences["productTaxAdd:::ProductTaxAdd"]=1
operation_parameters_minimum_occurrences["productUpdate:::ProductUpdate"]=1
operation_parameters_minimum_occurrences["productUpdateBatch:::ProductUpdateBatch"]=1
operation_parameters_minimum_occurrences["productVariantAdd:::ProductVariantAdd"]=1
operation_parameters_minimum_occurrences["productVariantAddBatch:::ProductVariantAddBatch"]=1
operation_parameters_minimum_occurrences["productVariantDelete:::id"]=1
operation_parameters_minimum_occurrences["productVariantDelete:::product_id"]=1
operation_parameters_minimum_occurrences["productVariantDelete:::store_id"]=0
operation_parameters_minimum_occurrences["productVariantDeleteBatch:::ProductVariantDeleteBatch"]=1
operation_parameters_minimum_occurrences["productVariantImageAdd:::ProductVariantImageAdd"]=1
operation_parameters_minimum_occurrences["productVariantImageDelete:::product_id"]=1
operation_parameters_minimum_occurrences["productVariantImageDelete:::product_variant_id"]=1
operation_parameters_minimum_occurrences["productVariantImageDelete:::id"]=1
operation_parameters_minimum_occurrences["productVariantImageDelete:::store_id"]=0
operation_parameters_minimum_occurrences["productVariantPriceAdd:::ProductVariantPriceAdd"]=1
operation_parameters_minimum_occurrences["productVariantPriceDelete:::id"]=1
operation_parameters_minimum_occurrences["productVariantPriceDelete:::product_id"]=1
operation_parameters_minimum_occurrences["productVariantPriceDelete:::group_prices"]=1
operation_parameters_minimum_occurrences["productVariantPriceDelete:::store_id"]=0
operation_parameters_minimum_occurrences["productVariantPriceUpdate:::ProductVariantPriceUpdate"]=1
operation_parameters_minimum_occurrences["productVariantUpdate:::ProductVariantUpdate"]=1
operation_parameters_minimum_occurrences["productVariantUpdateBatch:::ProductVariantUpdateBatch"]=1
operation_parameters_minimum_occurrences["returnCount:::order_ids"]=0
operation_parameters_minimum_occurrences["returnCount:::customer_id"]=0
operation_parameters_minimum_occurrences["returnCount:::store_id"]=0
operation_parameters_minimum_occurrences["returnCount:::status"]=0
operation_parameters_minimum_occurrences["returnCount:::return_type"]=0
operation_parameters_minimum_occurrences["returnCount:::created_from"]=0
operation_parameters_minimum_occurrences["returnCount:::created_to"]=0
operation_parameters_minimum_occurrences["returnCount:::modified_from"]=0
operation_parameters_minimum_occurrences["returnCount:::modified_to"]=0
operation_parameters_minimum_occurrences["returnCount:::report_request_id"]=0
operation_parameters_minimum_occurrences["returnCount:::disable_report_cache"]=0
operation_parameters_minimum_occurrences["returnInfo:::id"]=1
operation_parameters_minimum_occurrences["returnInfo:::order_id"]=0
operation_parameters_minimum_occurrences["returnInfo:::store_id"]=0
operation_parameters_minimum_occurrences["returnInfo:::response_fields"]=0
operation_parameters_minimum_occurrences["returnInfo:::params"]=0
operation_parameters_minimum_occurrences["returnInfo:::exclude"]=0
operation_parameters_minimum_occurrences["returnList:::start"]=0
operation_parameters_minimum_occurrences["returnList:::count"]=0
operation_parameters_minimum_occurrences["returnList:::page_cursor"]=0
operation_parameters_minimum_occurrences["returnList:::order_id"]=0
operation_parameters_minimum_occurrences["returnList:::order_ids"]=0
operation_parameters_minimum_occurrences["returnList:::customer_id"]=0
operation_parameters_minimum_occurrences["returnList:::store_id"]=0
operation_parameters_minimum_occurrences["returnList:::status"]=0
operation_parameters_minimum_occurrences["returnList:::return_type"]=0
operation_parameters_minimum_occurrences["returnList:::created_from"]=0
operation_parameters_minimum_occurrences["returnList:::created_to"]=0
operation_parameters_minimum_occurrences["returnList:::modified_from"]=0
operation_parameters_minimum_occurrences["returnList:::modified_to"]=0
operation_parameters_minimum_occurrences["returnList:::response_fields"]=0
operation_parameters_minimum_occurrences["returnList:::params"]=0
operation_parameters_minimum_occurrences["returnList:::exclude"]=0
operation_parameters_minimum_occurrences["returnList:::report_request_id"]=0
operation_parameters_minimum_occurrences["returnList:::disable_report_cache"]=0
operation_parameters_minimum_occurrences["returnReasonList:::store_id"]=0
operation_parameters_minimum_occurrences["subscriberList:::ids"]=0
operation_parameters_minimum_occurrences["subscriberList:::start"]=0
operation_parameters_minimum_occurrences["subscriberList:::count"]=0
operation_parameters_minimum_occurrences["subscriberList:::page_cursor"]=0
operation_parameters_minimum_occurrences["subscriberList:::subscribed"]=0
operation_parameters_minimum_occurrences["subscriberList:::store_id"]=0
operation_parameters_minimum_occurrences["subscriberList:::email"]=0
operation_parameters_minimum_occurrences["subscriberList:::created_from"]=0
operation_parameters_minimum_occurrences["subscriberList:::created_to"]=0
operation_parameters_minimum_occurrences["subscriberList:::modified_from"]=0
operation_parameters_minimum_occurrences["subscriberList:::modified_to"]=0
operation_parameters_minimum_occurrences["subscriberList:::response_fields"]=0
operation_parameters_minimum_occurrences["subscriberList:::params"]=0
operation_parameters_minimum_occurrences["subscriberList:::exclude"]=0
operation_parameters_minimum_occurrences["taxClassInfo:::tax_class_id"]=1
operation_parameters_minimum_occurrences["taxClassInfo:::store_id"]=0
operation_parameters_minimum_occurrences["taxClassInfo:::lang_id"]=0
operation_parameters_minimum_occurrences["taxClassInfo:::response_fields"]=0
operation_parameters_minimum_occurrences["taxClassInfo:::params"]=0
operation_parameters_minimum_occurrences["taxClassInfo:::exclude"]=0
operation_parameters_minimum_occurrences["taxClassList:::count"]=0
operation_parameters_minimum_occurrences["taxClassList:::page_cursor"]=0
operation_parameters_minimum_occurrences["taxClassList:::store_id"]=0
operation_parameters_minimum_occurrences["taxClassList:::find_value"]=0
operation_parameters_minimum_occurrences["taxClassList:::find_where"]=0
operation_parameters_minimum_occurrences["taxClassList:::created_to"]=0
operation_parameters_minimum_occurrences["taxClassList:::created_from"]=0
operation_parameters_minimum_occurrences["taxClassList:::modified_to"]=0
operation_parameters_minimum_occurrences["taxClassList:::modified_from"]=0
operation_parameters_minimum_occurrences["taxClassList:::response_fields"]=0
operation_parameters_minimum_occurrences["webhookCount:::entity"]=0
operation_parameters_minimum_occurrences["webhookCount:::action"]=0
operation_parameters_minimum_occurrences["webhookCount:::active"]=0
operation_parameters_minimum_occurrences["webhookCreate:::entity"]=1
operation_parameters_minimum_occurrences["webhookCreate:::action"]=1
operation_parameters_minimum_occurrences["webhookCreate:::callback"]=0
operation_parameters_minimum_occurrences["webhookCreate:::label"]=0
operation_parameters_minimum_occurrences["webhookCreate:::fields"]=0
operation_parameters_minimum_occurrences["webhookCreate:::response_fields"]=0
operation_parameters_minimum_occurrences["webhookCreate:::active"]=0
operation_parameters_minimum_occurrences["webhookCreate:::lang_id"]=0
operation_parameters_minimum_occurrences["webhookCreate:::store_id"]=0
operation_parameters_minimum_occurrences["webhookDelete:::id"]=1
operation_parameters_minimum_occurrences["webhookList:::start"]=0
operation_parameters_minimum_occurrences["webhookList:::count"]=0
operation_parameters_minimum_occurrences["webhookList:::entity"]=0
operation_parameters_minimum_occurrences["webhookList:::action"]=0
operation_parameters_minimum_occurrences["webhookList:::active"]=0
operation_parameters_minimum_occurrences["webhookList:::ids"]=0
operation_parameters_minimum_occurrences["webhookList:::params"]=0
operation_parameters_minimum_occurrences["webhookUpdate:::id"]=1
operation_parameters_minimum_occurrences["webhookUpdate:::callback"]=0
operation_parameters_minimum_occurrences["webhookUpdate:::label"]=0
operation_parameters_minimum_occurrences["webhookUpdate:::fields"]=0
operation_parameters_minimum_occurrences["webhookUpdate:::response_fields"]=0
operation_parameters_minimum_occurrences["webhookUpdate:::active"]=0
operation_parameters_minimum_occurrences["webhookUpdate:::lang_id"]=0

##
# This array stores the maximum number of allowed occurrences for parameter
# 1 - single value
# 2 - 2 values
# N - N values
# 0 - unlimited
declare -A operation_parameters_maximum_occurrences
operation_parameters_maximum_occurrences["accountCartAdd:::AccountCartAdd"]=0
operation_parameters_maximum_occurrences["accountCartList:::store_url"]=0
operation_parameters_maximum_occurrences["accountCartList:::store_key"]=0
operation_parameters_maximum_occurrences["accountCartList:::request_from_date"]=0
operation_parameters_maximum_occurrences["accountCartList:::request_to_date"]=0
operation_parameters_maximum_occurrences["accountCartList:::params"]=0
operation_parameters_maximum_occurrences["accountCartList:::exclude"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::replace_parameters"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::new_store_url"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::new_store_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::bridge_url"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::store_root"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::db_tables_prefix"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::user_agent"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::3dcart_private_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::3dcart_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::3dcartapi_api_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::amazon_sp_client_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::amazon_sp_client_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::amazon_sp_refresh_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::amazon_sp_aws_region"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::amazon_sp_api_environment"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::amazon_seller_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::aspdotnetstorefront_api_user"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::aspdotnetstorefront_api_pass"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::bigcommerceapi_admin_account"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::bigcommerceapi_api_path"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::bigcommerceapi_api_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::bigcommerceapi_client_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::bigcommerceapi_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::bigcommerceapi_context"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::bol_api_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::bol_api_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::bol_retailer_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::demandware_client_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::demandware_api_password"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::demandware_user_name"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::demandware_user_password"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::ebay_client_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::ebay_client_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::ebay_runame"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::ebay_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::ebay_refresh_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::ebay_environment"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::ebay_site_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::ecwid_acess_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::ecwid_store_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::lazada_app_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::lazada_app_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::lazada_refresh_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::lazada_region"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::etsy_keystring"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::etsy_shared_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::etsy_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::etsy_token_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::etsy_client_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::etsy_refresh_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::facebook_app_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::facebook_app_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::facebook_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::facebook_business_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::neto_api_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::neto_api_username"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopline_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopline_app_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopline_app_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopline_shared_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopify_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopify_api_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopify_api_password"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopify_shared_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopee_partner_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopee_partner_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopee_shop_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopee_refresh_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopee_region"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopee_environment"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shoplazza_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shoplazza_shared_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::miva_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::miva_signature"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopware_access_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopware_api_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::shopware_api_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::bigcartel_user_name"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::bigcartel_password"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::bricklink_consumer_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::bricklink_consumer_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::bricklink_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::bricklink_token_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::volusion_login"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::volusion_password"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::walmart_client_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::walmart_client_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::walmart_environment"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::walmart_channel_type"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::walmart_region"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::square_client_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::square_client_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::square_refresh_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::squarespace_api_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::squarespace_client_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::squarespace_client_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::squarespace_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::squarespace_refresh_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::hybris_client_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::hybris_client_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::hybris_username"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::hybris_password"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::hybris_websites"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::lightspeed_api_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::lightspeed_api_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::commercehq_api_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::commercehq_api_password"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::wc_consumer_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::wc_consumer_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::magento_consumer_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::magento_consumer_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::magento_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::magento_token_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::prestashop_webservice_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::wix_app_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::wix_app_secret_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::wix_instance_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::wix_refresh_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::mercado_libre_app_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::mercado_libre_app_secret_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::mercado_libre_refresh_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::zid_client_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::zid_client_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::zid_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::zid_authorization"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::zid_refresh_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::flipkart_client_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::flipkart_client_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::allegro_client_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::allegro_client_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::allegro_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::allegro_refresh_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::allegro_environment"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::zoho_client_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::zoho_client_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::zoho_refresh_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::zoho_region"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::tiendanube_user_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::tiendanube_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::tiendanube_client_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::otto_client_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::otto_client_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::otto_app_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::otto_refresh_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::otto_environment"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::otto_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::tiktokshop_app_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::tiktokshop_app_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::tiktokshop_refresh_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::tiktokshop_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::salla_client_id"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::salla_client_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::salla_refresh_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::salla_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::temu_app_key"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::temu_app_secret"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::temu_access_token"]=0
operation_parameters_maximum_occurrences["accountConfigUpdate:::temu_region"]=0
operation_parameters_maximum_occurrences["accountFailedWebhooks:::start"]=0
operation_parameters_maximum_occurrences["accountFailedWebhooks:::count"]=0
operation_parameters_maximum_occurrences["accountFailedWebhooks:::ids"]=0
operation_parameters_maximum_occurrences["attributeAdd:::type"]=0
operation_parameters_maximum_occurrences["attributeAdd:::name"]=0
operation_parameters_maximum_occurrences["attributeAdd:::code"]=0
operation_parameters_maximum_occurrences["attributeAdd:::store_id"]=0
operation_parameters_maximum_occurrences["attributeAdd:::lang_id"]=0
operation_parameters_maximum_occurrences["attributeAdd:::visible"]=0
operation_parameters_maximum_occurrences["attributeAdd:::required"]=0
operation_parameters_maximum_occurrences["attributeAdd:::position"]=0
operation_parameters_maximum_occurrences["attributeAdd:::attribute_group_id"]=0
operation_parameters_maximum_occurrences["attributeAdd:::is_global"]=0
operation_parameters_maximum_occurrences["attributeAdd:::is_searchable"]=0
operation_parameters_maximum_occurrences["attributeAdd:::is_filterable"]=0
operation_parameters_maximum_occurrences["attributeAdd:::is_comparable"]=0
operation_parameters_maximum_occurrences["attributeAdd:::is_html_allowed_on_front"]=0
operation_parameters_maximum_occurrences["attributeAdd:::is_filterable_in_search"]=0
operation_parameters_maximum_occurrences["attributeAdd:::is_configurable"]=0
operation_parameters_maximum_occurrences["attributeAdd:::is_visible_in_advanced_search"]=0
operation_parameters_maximum_occurrences["attributeAdd:::is_used_for_promo_rules"]=0
operation_parameters_maximum_occurrences["attributeAdd:::used_in_product_listing"]=0
operation_parameters_maximum_occurrences["attributeAdd:::used_for_sort_by"]=0
operation_parameters_maximum_occurrences["attributeAdd:::apply_to"]=0
operation_parameters_maximum_occurrences["attributeAssignGroup:::id"]=0
operation_parameters_maximum_occurrences["attributeAssignGroup:::group_id"]=0
operation_parameters_maximum_occurrences["attributeAssignGroup:::attribute_set_id"]=0
operation_parameters_maximum_occurrences["attributeAssignSet:::id"]=0
operation_parameters_maximum_occurrences["attributeAssignSet:::attribute_set_id"]=0
operation_parameters_maximum_occurrences["attributeAssignSet:::group_id"]=0
operation_parameters_maximum_occurrences["attributeAttributesetList:::start"]=0
operation_parameters_maximum_occurrences["attributeAttributesetList:::count"]=0
operation_parameters_maximum_occurrences["attributeAttributesetList:::response_fields"]=0
operation_parameters_maximum_occurrences["attributeAttributesetList:::params"]=0
operation_parameters_maximum_occurrences["attributeAttributesetList:::exclude"]=0
operation_parameters_maximum_occurrences["attributeCount:::type"]=0
operation_parameters_maximum_occurrences["attributeCount:::attribute_set_id"]=0
operation_parameters_maximum_occurrences["attributeCount:::store_id"]=0
operation_parameters_maximum_occurrences["attributeCount:::lang_id"]=0
operation_parameters_maximum_occurrences["attributeCount:::visible"]=0
operation_parameters_maximum_occurrences["attributeCount:::required"]=0
operation_parameters_maximum_occurrences["attributeCount:::system"]=0
operation_parameters_maximum_occurrences["attributeDelete:::id"]=0
operation_parameters_maximum_occurrences["attributeDelete:::store_id"]=0
operation_parameters_maximum_occurrences["attributeGroupList:::start"]=0
operation_parameters_maximum_occurrences["attributeGroupList:::count"]=0
operation_parameters_maximum_occurrences["attributeGroupList:::attribute_set_id"]=0
operation_parameters_maximum_occurrences["attributeGroupList:::lang_id"]=0
operation_parameters_maximum_occurrences["attributeGroupList:::response_fields"]=0
operation_parameters_maximum_occurrences["attributeGroupList:::params"]=0
operation_parameters_maximum_occurrences["attributeGroupList:::exclude"]=0
operation_parameters_maximum_occurrences["attributeInfo:::id"]=0
operation_parameters_maximum_occurrences["attributeInfo:::attribute_set_id"]=0
operation_parameters_maximum_occurrences["attributeInfo:::store_id"]=0
operation_parameters_maximum_occurrences["attributeInfo:::lang_id"]=0
operation_parameters_maximum_occurrences["attributeInfo:::response_fields"]=0
operation_parameters_maximum_occurrences["attributeInfo:::params"]=0
operation_parameters_maximum_occurrences["attributeInfo:::exclude"]=0
operation_parameters_maximum_occurrences["attributeList:::start"]=0
operation_parameters_maximum_occurrences["attributeList:::count"]=0
operation_parameters_maximum_occurrences["attributeList:::attribute_ids"]=0
operation_parameters_maximum_occurrences["attributeList:::attribute_set_id"]=0
operation_parameters_maximum_occurrences["attributeList:::store_id"]=0
operation_parameters_maximum_occurrences["attributeList:::lang_id"]=0
operation_parameters_maximum_occurrences["attributeList:::type"]=0
operation_parameters_maximum_occurrences["attributeList:::visible"]=0
operation_parameters_maximum_occurrences["attributeList:::required"]=0
operation_parameters_maximum_occurrences["attributeList:::system"]=0
operation_parameters_maximum_occurrences["attributeList:::response_fields"]=0
operation_parameters_maximum_occurrences["attributeList:::params"]=0
operation_parameters_maximum_occurrences["attributeList:::exclude"]=0
operation_parameters_maximum_occurrences["attributeUnassignGroup:::id"]=0
operation_parameters_maximum_occurrences["attributeUnassignGroup:::group_id"]=0
operation_parameters_maximum_occurrences["attributeUnassignSet:::id"]=0
operation_parameters_maximum_occurrences["attributeUnassignSet:::attribute_set_id"]=0
operation_parameters_maximum_occurrences["attributeUpdate:::id"]=0
operation_parameters_maximum_occurrences["attributeUpdate:::name"]=0
operation_parameters_maximum_occurrences["attributeUpdate:::store_id"]=0
operation_parameters_maximum_occurrences["attributeUpdate:::lang_id"]=0
operation_parameters_maximum_occurrences["attributeValueAdd:::attribute_id"]=0
operation_parameters_maximum_occurrences["attributeValueAdd:::name"]=0
operation_parameters_maximum_occurrences["attributeValueAdd:::code"]=0
operation_parameters_maximum_occurrences["attributeValueAdd:::description"]=0
operation_parameters_maximum_occurrences["attributeValueAdd:::store_id"]=0
operation_parameters_maximum_occurrences["attributeValueAdd:::lang_id"]=0
operation_parameters_maximum_occurrences["attributeValueDelete:::id"]=0
operation_parameters_maximum_occurrences["attributeValueDelete:::attribute_id"]=0
operation_parameters_maximum_occurrences["attributeValueDelete:::store_id"]=0
operation_parameters_maximum_occurrences["attributeValueUpdate:::id"]=0
operation_parameters_maximum_occurrences["attributeValueUpdate:::attribute_id"]=0
operation_parameters_maximum_occurrences["attributeValueUpdate:::name"]=0
operation_parameters_maximum_occurrences["attributeValueUpdate:::description"]=0
operation_parameters_maximum_occurrences["attributeValueUpdate:::code"]=0
operation_parameters_maximum_occurrences["attributeValueUpdate:::store_id"]=0
operation_parameters_maximum_occurrences["attributeValueUpdate:::lang_id"]=0
operation_parameters_maximum_occurrences["basketInfo:::id"]=0
operation_parameters_maximum_occurrences["basketInfo:::store_id"]=0
operation_parameters_maximum_occurrences["basketInfo:::response_fields"]=0
operation_parameters_maximum_occurrences["basketInfo:::params"]=0
operation_parameters_maximum_occurrences["basketInfo:::exclude"]=0
operation_parameters_maximum_occurrences["basketItemAdd:::customer_id"]=0
operation_parameters_maximum_occurrences["basketItemAdd:::product_id"]=0
operation_parameters_maximum_occurrences["basketItemAdd:::variant_id"]=0
operation_parameters_maximum_occurrences["basketItemAdd:::quantity"]=0
operation_parameters_maximum_occurrences["basketItemAdd:::store_id"]=0
operation_parameters_maximum_occurrences["basketLiveShippingServiceCreate:::name"]=0
operation_parameters_maximum_occurrences["basketLiveShippingServiceCreate:::callback"]=0
operation_parameters_maximum_occurrences["basketLiveShippingServiceCreate:::store_id"]=0
operation_parameters_maximum_occurrences["basketLiveShippingServiceDelete:::id"]=0
operation_parameters_maximum_occurrences["basketLiveShippingServiceList:::start"]=0
operation_parameters_maximum_occurrences["basketLiveShippingServiceList:::count"]=0
operation_parameters_maximum_occurrences["basketLiveShippingServiceList:::store_id"]=0
operation_parameters_maximum_occurrences["batchJobList:::count"]=0
operation_parameters_maximum_occurrences["batchJobList:::page_cursor"]=0
operation_parameters_maximum_occurrences["batchJobList:::ids"]=0
operation_parameters_maximum_occurrences["batchJobList:::created_from"]=0
operation_parameters_maximum_occurrences["batchJobList:::created_to"]=0
operation_parameters_maximum_occurrences["batchJobList:::processed_from"]=0
operation_parameters_maximum_occurrences["batchJobList:::processed_to"]=0
operation_parameters_maximum_occurrences["batchJobList:::response_fields"]=0
operation_parameters_maximum_occurrences["batchJobResult:::id"]=0
operation_parameters_maximum_occurrences["bridgeDownload:::whitelabel"]=0
operation_parameters_maximum_occurrences["cartCatalogPriceRulesList:::start"]=0
operation_parameters_maximum_occurrences["cartCatalogPriceRulesList:::count"]=0
operation_parameters_maximum_occurrences["cartCatalogPriceRulesList:::page_cursor"]=0
operation_parameters_maximum_occurrences["cartCatalogPriceRulesList:::ids"]=0
operation_parameters_maximum_occurrences["cartCatalogPriceRulesList:::response_fields"]=0
operation_parameters_maximum_occurrences["cartCatalogPriceRulesList:::params"]=0
operation_parameters_maximum_occurrences["cartCatalogPriceRulesList:::exclude"]=0
operation_parameters_maximum_occurrences["cartCouponAdd:::CartCouponAdd"]=0
operation_parameters_maximum_occurrences["cartCouponConditionAdd:::coupon_id"]=0
operation_parameters_maximum_occurrences["cartCouponConditionAdd:::entity"]=0
operation_parameters_maximum_occurrences["cartCouponConditionAdd:::key"]=0
operation_parameters_maximum_occurrences["cartCouponConditionAdd:::operator"]=0
operation_parameters_maximum_occurrences["cartCouponConditionAdd:::value"]=0
operation_parameters_maximum_occurrences["cartCouponConditionAdd:::target"]=0
operation_parameters_maximum_occurrences["cartCouponConditionAdd:::include_tax"]=0
operation_parameters_maximum_occurrences["cartCouponConditionAdd:::include_shipping"]=0
operation_parameters_maximum_occurrences["cartCouponConditionAdd:::store_id"]=0
operation_parameters_maximum_occurrences["cartCouponCount:::store_id"]=0
operation_parameters_maximum_occurrences["cartCouponCount:::avail"]=0
operation_parameters_maximum_occurrences["cartCouponCount:::date_start_from"]=0
operation_parameters_maximum_occurrences["cartCouponCount:::date_start_to"]=0
operation_parameters_maximum_occurrences["cartCouponCount:::date_end_from"]=0
operation_parameters_maximum_occurrences["cartCouponCount:::date_end_to"]=0
operation_parameters_maximum_occurrences["cartCouponDelete:::id"]=0
operation_parameters_maximum_occurrences["cartCouponDelete:::store_id"]=0
operation_parameters_maximum_occurrences["cartCouponList:::start"]=0
operation_parameters_maximum_occurrences["cartCouponList:::count"]=0
operation_parameters_maximum_occurrences["cartCouponList:::page_cursor"]=0
operation_parameters_maximum_occurrences["cartCouponList:::coupons_ids"]=0
operation_parameters_maximum_occurrences["cartCouponList:::store_id"]=0
operation_parameters_maximum_occurrences["cartCouponList:::lang_id"]=0
operation_parameters_maximum_occurrences["cartCouponList:::avail"]=0
operation_parameters_maximum_occurrences["cartCouponList:::date_start_from"]=0
operation_parameters_maximum_occurrences["cartCouponList:::date_start_to"]=0
operation_parameters_maximum_occurrences["cartCouponList:::date_end_from"]=0
operation_parameters_maximum_occurrences["cartCouponList:::date_end_to"]=0
operation_parameters_maximum_occurrences["cartCouponList:::response_fields"]=0
operation_parameters_maximum_occurrences["cartCouponList:::params"]=0
operation_parameters_maximum_occurrences["cartCouponList:::exclude"]=0
operation_parameters_maximum_occurrences["cartDelete:::delete_bridge"]=0
operation_parameters_maximum_occurrences["cartGiftcardAdd:::amount"]=0
operation_parameters_maximum_occurrences["cartGiftcardAdd:::code"]=0
operation_parameters_maximum_occurrences["cartGiftcardAdd:::owner_email"]=0
operation_parameters_maximum_occurrences["cartGiftcardAdd:::recipient_email"]=0
operation_parameters_maximum_occurrences["cartGiftcardAdd:::recipient_name"]=0
operation_parameters_maximum_occurrences["cartGiftcardAdd:::owner_name"]=0
operation_parameters_maximum_occurrences["cartGiftcardCount:::store_id"]=0
operation_parameters_maximum_occurrences["cartGiftcardDelete:::id"]=0
operation_parameters_maximum_occurrences["cartGiftcardList:::start"]=0
operation_parameters_maximum_occurrences["cartGiftcardList:::count"]=0
operation_parameters_maximum_occurrences["cartGiftcardList:::page_cursor"]=0
operation_parameters_maximum_occurrences["cartGiftcardList:::store_id"]=0
operation_parameters_maximum_occurrences["cartGiftcardList:::response_fields"]=0
operation_parameters_maximum_occurrences["cartGiftcardList:::params"]=0
operation_parameters_maximum_occurrences["cartGiftcardList:::exclude"]=0
operation_parameters_maximum_occurrences["cartInfo:::store_id"]=0
operation_parameters_maximum_occurrences["cartInfo:::response_fields"]=0
operation_parameters_maximum_occurrences["cartInfo:::params"]=0
operation_parameters_maximum_occurrences["cartInfo:::exclude"]=0
operation_parameters_maximum_occurrences["cartMetaDataList:::entity_id"]=0
operation_parameters_maximum_occurrences["cartMetaDataList:::count"]=0
operation_parameters_maximum_occurrences["cartMetaDataList:::page_cursor"]=0
operation_parameters_maximum_occurrences["cartMetaDataList:::entity"]=0
operation_parameters_maximum_occurrences["cartMetaDataList:::store_id"]=0
operation_parameters_maximum_occurrences["cartMetaDataList:::lang_id"]=0
operation_parameters_maximum_occurrences["cartMetaDataList:::key"]=0
operation_parameters_maximum_occurrences["cartMetaDataList:::response_fields"]=0
operation_parameters_maximum_occurrences["cartMetaDataList:::params"]=0
operation_parameters_maximum_occurrences["cartMetaDataList:::exclude"]=0
operation_parameters_maximum_occurrences["cartMetaDataSet:::entity_id"]=0
operation_parameters_maximum_occurrences["cartMetaDataSet:::key"]=0
operation_parameters_maximum_occurrences["cartMetaDataSet:::value"]=0
operation_parameters_maximum_occurrences["cartMetaDataSet:::namespace"]=0
operation_parameters_maximum_occurrences["cartMetaDataSet:::entity"]=0
operation_parameters_maximum_occurrences["cartMetaDataSet:::store_id"]=0
operation_parameters_maximum_occurrences["cartMetaDataSet:::lang_id"]=0
operation_parameters_maximum_occurrences["cartMetaDataUnset:::entity_id"]=0
operation_parameters_maximum_occurrences["cartMetaDataUnset:::key"]=0
operation_parameters_maximum_occurrences["cartMetaDataUnset:::id"]=0
operation_parameters_maximum_occurrences["cartMetaDataUnset:::entity"]=0
operation_parameters_maximum_occurrences["cartMetaDataUnset:::store_id"]=0
operation_parameters_maximum_occurrences["cartPluginList:::start"]=0
operation_parameters_maximum_occurrences["cartPluginList:::count"]=0
operation_parameters_maximum_occurrences["cartPluginList:::store_id"]=0
operation_parameters_maximum_occurrences["cartScriptAdd:::name"]=0
operation_parameters_maximum_occurrences["cartScriptAdd:::description"]=0
operation_parameters_maximum_occurrences["cartScriptAdd:::html"]=0
operation_parameters_maximum_occurrences["cartScriptAdd:::src"]=0
operation_parameters_maximum_occurrences["cartScriptAdd:::load_method"]=0
operation_parameters_maximum_occurrences["cartScriptAdd:::scope"]=0
operation_parameters_maximum_occurrences["cartScriptAdd:::events"]=0
operation_parameters_maximum_occurrences["cartScriptAdd:::store_id"]=0
operation_parameters_maximum_occurrences["cartScriptDelete:::id"]=0
operation_parameters_maximum_occurrences["cartScriptDelete:::store_id"]=0
operation_parameters_maximum_occurrences["cartScriptList:::start"]=0
operation_parameters_maximum_occurrences["cartScriptList:::count"]=0
operation_parameters_maximum_occurrences["cartScriptList:::page_cursor"]=0
operation_parameters_maximum_occurrences["cartScriptList:::script_ids"]=0
operation_parameters_maximum_occurrences["cartScriptList:::store_id"]=0
operation_parameters_maximum_occurrences["cartScriptList:::created_from"]=0
operation_parameters_maximum_occurrences["cartScriptList:::created_to"]=0
operation_parameters_maximum_occurrences["cartScriptList:::modified_from"]=0
operation_parameters_maximum_occurrences["cartScriptList:::modified_to"]=0
operation_parameters_maximum_occurrences["cartScriptList:::response_fields"]=0
operation_parameters_maximum_occurrences["cartScriptList:::params"]=0
operation_parameters_maximum_occurrences["cartScriptList:::exclude"]=0
operation_parameters_maximum_occurrences["cartShippingZonesList:::start"]=0
operation_parameters_maximum_occurrences["cartShippingZonesList:::count"]=0
operation_parameters_maximum_occurrences["cartShippingZonesList:::store_id"]=0
operation_parameters_maximum_occurrences["cartShippingZonesList:::response_fields"]=0
operation_parameters_maximum_occurrences["cartShippingZonesList:::params"]=0
operation_parameters_maximum_occurrences["cartShippingZonesList:::exclude"]=0
operation_parameters_maximum_occurrences["cartValidate:::validate_version"]=0
operation_parameters_maximum_occurrences["categoryAdd:::name"]=0
operation_parameters_maximum_occurrences["categoryAdd:::description"]=0
operation_parameters_maximum_occurrences["categoryAdd:::short_description"]=0
operation_parameters_maximum_occurrences["categoryAdd:::parent_id"]=0
operation_parameters_maximum_occurrences["categoryAdd:::avail"]=0
operation_parameters_maximum_occurrences["categoryAdd:::created_time"]=0
operation_parameters_maximum_occurrences["categoryAdd:::modified_time"]=0
operation_parameters_maximum_occurrences["categoryAdd:::sort_order"]=0
operation_parameters_maximum_occurrences["categoryAdd:::meta_title"]=0
operation_parameters_maximum_occurrences["categoryAdd:::meta_description"]=0
operation_parameters_maximum_occurrences["categoryAdd:::meta_keywords"]=0
operation_parameters_maximum_occurrences["categoryAdd:::seo_url"]=0
operation_parameters_maximum_occurrences["categoryAdd:::store_id"]=0
operation_parameters_maximum_occurrences["categoryAdd:::stores_ids"]=0
operation_parameters_maximum_occurrences["categoryAdd:::lang_id"]=0
operation_parameters_maximum_occurrences["categoryAddBatch:::CategoryAddBatch"]=0
operation_parameters_maximum_occurrences["categoryAssign:::category_id"]=0
operation_parameters_maximum_occurrences["categoryAssign:::product_id"]=0
operation_parameters_maximum_occurrences["categoryAssign:::store_id"]=0
operation_parameters_maximum_occurrences["categoryCount:::parent_id"]=0
operation_parameters_maximum_occurrences["categoryCount:::store_id"]=0
operation_parameters_maximum_occurrences["categoryCount:::lang_id"]=0
operation_parameters_maximum_occurrences["categoryCount:::avail"]=0
operation_parameters_maximum_occurrences["categoryCount:::created_from"]=0
operation_parameters_maximum_occurrences["categoryCount:::created_to"]=0
operation_parameters_maximum_occurrences["categoryCount:::modified_from"]=0
operation_parameters_maximum_occurrences["categoryCount:::modified_to"]=0
operation_parameters_maximum_occurrences["categoryCount:::product_type"]=0
operation_parameters_maximum_occurrences["categoryCount:::find_value"]=0
operation_parameters_maximum_occurrences["categoryCount:::find_where"]=0
operation_parameters_maximum_occurrences["categoryCount:::report_request_id"]=0
operation_parameters_maximum_occurrences["categoryCount:::disable_report_cache"]=0
operation_parameters_maximum_occurrences["categoryDelete:::id"]=0
operation_parameters_maximum_occurrences["categoryDelete:::store_id"]=0
operation_parameters_maximum_occurrences["categoryFind:::find_value"]=0
operation_parameters_maximum_occurrences["categoryFind:::find_where"]=0
operation_parameters_maximum_occurrences["categoryFind:::find_params"]=0
operation_parameters_maximum_occurrences["categoryFind:::store_id"]=0
operation_parameters_maximum_occurrences["categoryFind:::lang_id"]=0
operation_parameters_maximum_occurrences["categoryImageAdd:::category_id"]=0
operation_parameters_maximum_occurrences["categoryImageAdd:::image_name"]=0
operation_parameters_maximum_occurrences["categoryImageAdd:::url"]=0
operation_parameters_maximum_occurrences["categoryImageAdd:::type"]=0
operation_parameters_maximum_occurrences["categoryImageAdd:::store_id"]=0
operation_parameters_maximum_occurrences["categoryImageAdd:::label"]=0
operation_parameters_maximum_occurrences["categoryImageAdd:::mime"]=0
operation_parameters_maximum_occurrences["categoryImageAdd:::position"]=0
operation_parameters_maximum_occurrences["categoryImageDelete:::category_id"]=0
operation_parameters_maximum_occurrences["categoryImageDelete:::image_id"]=0
operation_parameters_maximum_occurrences["categoryImageDelete:::store_id"]=0
operation_parameters_maximum_occurrences["categoryInfo:::id"]=0
operation_parameters_maximum_occurrences["categoryInfo:::store_id"]=0
operation_parameters_maximum_occurrences["categoryInfo:::lang_id"]=0
operation_parameters_maximum_occurrences["categoryInfo:::schema_type"]=0
operation_parameters_maximum_occurrences["categoryInfo:::response_fields"]=0
operation_parameters_maximum_occurrences["categoryInfo:::params"]=0
operation_parameters_maximum_occurrences["categoryInfo:::exclude"]=0
operation_parameters_maximum_occurrences["categoryInfo:::report_request_id"]=0
operation_parameters_maximum_occurrences["categoryInfo:::disable_report_cache"]=0
operation_parameters_maximum_occurrences["categoryList:::start"]=0
operation_parameters_maximum_occurrences["categoryList:::count"]=0
operation_parameters_maximum_occurrences["categoryList:::page_cursor"]=0
operation_parameters_maximum_occurrences["categoryList:::store_id"]=0
operation_parameters_maximum_occurrences["categoryList:::lang_id"]=0
operation_parameters_maximum_occurrences["categoryList:::parent_id"]=0
operation_parameters_maximum_occurrences["categoryList:::avail"]=0
operation_parameters_maximum_occurrences["categoryList:::product_type"]=0
operation_parameters_maximum_occurrences["categoryList:::created_from"]=0
operation_parameters_maximum_occurrences["categoryList:::created_to"]=0
operation_parameters_maximum_occurrences["categoryList:::modified_from"]=0
operation_parameters_maximum_occurrences["categoryList:::modified_to"]=0
operation_parameters_maximum_occurrences["categoryList:::find_value"]=0
operation_parameters_maximum_occurrences["categoryList:::find_where"]=0
operation_parameters_maximum_occurrences["categoryList:::response_fields"]=0
operation_parameters_maximum_occurrences["categoryList:::params"]=0
operation_parameters_maximum_occurrences["categoryList:::exclude"]=0
operation_parameters_maximum_occurrences["categoryList:::report_request_id"]=0
operation_parameters_maximum_occurrences["categoryList:::disable_report_cache"]=0
operation_parameters_maximum_occurrences["categoryList:::disable_cache"]=0
operation_parameters_maximum_occurrences["categoryUnassign:::category_id"]=0
operation_parameters_maximum_occurrences["categoryUnassign:::product_id"]=0
operation_parameters_maximum_occurrences["categoryUnassign:::store_id"]=0
operation_parameters_maximum_occurrences["categoryUpdate:::id"]=0
operation_parameters_maximum_occurrences["categoryUpdate:::name"]=0
operation_parameters_maximum_occurrences["categoryUpdate:::description"]=0
operation_parameters_maximum_occurrences["categoryUpdate:::short_description"]=0
operation_parameters_maximum_occurrences["categoryUpdate:::parent_id"]=0
operation_parameters_maximum_occurrences["categoryUpdate:::avail"]=0
operation_parameters_maximum_occurrences["categoryUpdate:::sort_order"]=0
operation_parameters_maximum_occurrences["categoryUpdate:::modified_time"]=0
operation_parameters_maximum_occurrences["categoryUpdate:::meta_title"]=0
operation_parameters_maximum_occurrences["categoryUpdate:::meta_description"]=0
operation_parameters_maximum_occurrences["categoryUpdate:::meta_keywords"]=0
operation_parameters_maximum_occurrences["categoryUpdate:::seo_url"]=0
operation_parameters_maximum_occurrences["categoryUpdate:::store_id"]=0
operation_parameters_maximum_occurrences["categoryUpdate:::stores_ids"]=0
operation_parameters_maximum_occurrences["categoryUpdate:::lang_id"]=0
operation_parameters_maximum_occurrences["customerAdd:::CustomerAdd"]=0
operation_parameters_maximum_occurrences["customerAddressAdd:::CustomerAddressAdd"]=0
operation_parameters_maximum_occurrences["customerAttributeList:::customer_id"]=0
operation_parameters_maximum_occurrences["customerAttributeList:::count"]=0
operation_parameters_maximum_occurrences["customerAttributeList:::page_cursor"]=0
operation_parameters_maximum_occurrences["customerAttributeList:::store_id"]=0
operation_parameters_maximum_occurrences["customerAttributeList:::lang_id"]=0
operation_parameters_maximum_occurrences["customerAttributeList:::response_fields"]=0
operation_parameters_maximum_occurrences["customerAttributeList:::params"]=0
operation_parameters_maximum_occurrences["customerAttributeList:::exclude"]=0
operation_parameters_maximum_occurrences["customerCount:::ids"]=0
operation_parameters_maximum_occurrences["customerCount:::since_id"]=0
operation_parameters_maximum_occurrences["customerCount:::customer_list_id"]=0
operation_parameters_maximum_occurrences["customerCount:::group_id"]=0
operation_parameters_maximum_occurrences["customerCount:::store_id"]=0
operation_parameters_maximum_occurrences["customerCount:::avail"]=0
operation_parameters_maximum_occurrences["customerCount:::include_guests"]=0
operation_parameters_maximum_occurrences["customerCount:::find_value"]=0
operation_parameters_maximum_occurrences["customerCount:::find_where"]=0
operation_parameters_maximum_occurrences["customerCount:::created_from"]=0
operation_parameters_maximum_occurrences["customerCount:::created_to"]=0
operation_parameters_maximum_occurrences["customerCount:::modified_from"]=0
operation_parameters_maximum_occurrences["customerCount:::modified_to"]=0
operation_parameters_maximum_occurrences["customerDelete:::id"]=0
operation_parameters_maximum_occurrences["customerFind:::find_value"]=0
operation_parameters_maximum_occurrences["customerFind:::find_where"]=0
operation_parameters_maximum_occurrences["customerFind:::find_params"]=0
operation_parameters_maximum_occurrences["customerFind:::store_id"]=0
operation_parameters_maximum_occurrences["customerFind:::include_guests"]=0
operation_parameters_maximum_occurrences["customerGroupAdd:::name"]=0
operation_parameters_maximum_occurrences["customerGroupAdd:::store_id"]=0
operation_parameters_maximum_occurrences["customerGroupAdd:::stores_ids"]=0
operation_parameters_maximum_occurrences["customerGroupList:::start"]=0
operation_parameters_maximum_occurrences["customerGroupList:::count"]=0
operation_parameters_maximum_occurrences["customerGroupList:::page_cursor"]=0
operation_parameters_maximum_occurrences["customerGroupList:::group_ids"]=0
operation_parameters_maximum_occurrences["customerGroupList:::store_id"]=0
operation_parameters_maximum_occurrences["customerGroupList:::lang_id"]=0
operation_parameters_maximum_occurrences["customerGroupList:::response_fields"]=0
operation_parameters_maximum_occurrences["customerGroupList:::params"]=0
operation_parameters_maximum_occurrences["customerGroupList:::exclude"]=0
operation_parameters_maximum_occurrences["customerGroupList:::disable_cache"]=0
operation_parameters_maximum_occurrences["customerInfo:::id"]=0
operation_parameters_maximum_occurrences["customerInfo:::store_id"]=0
operation_parameters_maximum_occurrences["customerInfo:::response_fields"]=0
operation_parameters_maximum_occurrences["customerInfo:::params"]=0
operation_parameters_maximum_occurrences["customerInfo:::exclude"]=0
operation_parameters_maximum_occurrences["customerList:::start"]=0
operation_parameters_maximum_occurrences["customerList:::count"]=0
operation_parameters_maximum_occurrences["customerList:::page_cursor"]=0
operation_parameters_maximum_occurrences["customerList:::ids"]=0
operation_parameters_maximum_occurrences["customerList:::since_id"]=0
operation_parameters_maximum_occurrences["customerList:::customer_list_id"]=0
operation_parameters_maximum_occurrences["customerList:::group_id"]=0
operation_parameters_maximum_occurrences["customerList:::store_id"]=0
operation_parameters_maximum_occurrences["customerList:::avail"]=0
operation_parameters_maximum_occurrences["customerList:::include_guests"]=0
operation_parameters_maximum_occurrences["customerList:::find_value"]=0
operation_parameters_maximum_occurrences["customerList:::find_where"]=0
operation_parameters_maximum_occurrences["customerList:::created_from"]=0
operation_parameters_maximum_occurrences["customerList:::created_to"]=0
operation_parameters_maximum_occurrences["customerList:::modified_from"]=0
operation_parameters_maximum_occurrences["customerList:::modified_to"]=0
operation_parameters_maximum_occurrences["customerList:::sort_by"]=0
operation_parameters_maximum_occurrences["customerList:::sort_direction"]=0
operation_parameters_maximum_occurrences["customerList:::response_fields"]=0
operation_parameters_maximum_occurrences["customerList:::params"]=0
operation_parameters_maximum_occurrences["customerList:::exclude"]=0
operation_parameters_maximum_occurrences["customerUpdate:::CustomerUpdate"]=0
operation_parameters_maximum_occurrences["customerWishlistList:::customer_id"]=0
operation_parameters_maximum_occurrences["customerWishlistList:::start"]=0
operation_parameters_maximum_occurrences["customerWishlistList:::count"]=0
operation_parameters_maximum_occurrences["customerWishlistList:::page_cursor"]=0
operation_parameters_maximum_occurrences["customerWishlistList:::id"]=0
operation_parameters_maximum_occurrences["customerWishlistList:::store_id"]=0
operation_parameters_maximum_occurrences["customerWishlistList:::response_fields"]=0
operation_parameters_maximum_occurrences["marketplaceProductFind:::count"]=0
operation_parameters_maximum_occurrences["marketplaceProductFind:::page_cursor"]=0
operation_parameters_maximum_occurrences["marketplaceProductFind:::keyword"]=0
operation_parameters_maximum_occurrences["marketplaceProductFind:::categories_ids"]=0
operation_parameters_maximum_occurrences["marketplaceProductFind:::store_id"]=0
operation_parameters_maximum_occurrences["marketplaceProductFind:::asin"]=0
operation_parameters_maximum_occurrences["marketplaceProductFind:::ean"]=0
operation_parameters_maximum_occurrences["marketplaceProductFind:::gtin"]=0
operation_parameters_maximum_occurrences["marketplaceProductFind:::upc"]=0
operation_parameters_maximum_occurrences["marketplaceProductFind:::mpn"]=0
operation_parameters_maximum_occurrences["marketplaceProductFind:::isbn"]=0
operation_parameters_maximum_occurrences["marketplaceProductFind:::response_fields"]=0
operation_parameters_maximum_occurrences["marketplaceProductFind:::params"]=0
operation_parameters_maximum_occurrences["marketplaceProductFind:::exclude"]=0
operation_parameters_maximum_occurrences["orderAbandonedList:::start"]=0
operation_parameters_maximum_occurrences["orderAbandonedList:::count"]=0
operation_parameters_maximum_occurrences["orderAbandonedList:::page_cursor"]=0
operation_parameters_maximum_occurrences["orderAbandonedList:::customer_id"]=0
operation_parameters_maximum_occurrences["orderAbandonedList:::customer_email"]=0
operation_parameters_maximum_occurrences["orderAbandonedList:::store_id"]=0
operation_parameters_maximum_occurrences["orderAbandonedList:::created_from"]=0
operation_parameters_maximum_occurrences["orderAbandonedList:::created_to"]=0
operation_parameters_maximum_occurrences["orderAbandonedList:::modified_from"]=0
operation_parameters_maximum_occurrences["orderAbandonedList:::modified_to"]=0
operation_parameters_maximum_occurrences["orderAbandonedList:::skip_empty_email"]=0
operation_parameters_maximum_occurrences["orderAbandonedList:::response_fields"]=0
operation_parameters_maximum_occurrences["orderAbandonedList:::params"]=0
operation_parameters_maximum_occurrences["orderAbandonedList:::exclude"]=0
operation_parameters_maximum_occurrences["orderAdd:::OrderAdd"]=0
operation_parameters_maximum_occurrences["orderCount:::order_ids"]=0
operation_parameters_maximum_occurrences["orderCount:::ids"]=0
operation_parameters_maximum_occurrences["orderCount:::customer_id"]=0
operation_parameters_maximum_occurrences["orderCount:::store_id"]=0
operation_parameters_maximum_occurrences["orderCount:::customer_email"]=0
operation_parameters_maximum_occurrences["orderCount:::order_status"]=0
operation_parameters_maximum_occurrences["orderCount:::order_status_ids"]=0
operation_parameters_maximum_occurrences["orderCount:::ebay_order_status"]=0
operation_parameters_maximum_occurrences["orderCount:::financial_status"]=0
operation_parameters_maximum_occurrences["orderCount:::financial_status_ids"]=0
operation_parameters_maximum_occurrences["orderCount:::fulfillment_channel"]=0
operation_parameters_maximum_occurrences["orderCount:::fulfillment_status"]=0
operation_parameters_maximum_occurrences["orderCount:::shipping_method"]=0
operation_parameters_maximum_occurrences["orderCount:::delivery_method"]=0
operation_parameters_maximum_occurrences["orderCount:::tags"]=0
operation_parameters_maximum_occurrences["orderCount:::ship_node_type"]=0
operation_parameters_maximum_occurrences["orderCount:::created_from"]=0
operation_parameters_maximum_occurrences["orderCount:::created_to"]=0
operation_parameters_maximum_occurrences["orderCount:::modified_from"]=0
operation_parameters_maximum_occurrences["orderCount:::modified_to"]=0
operation_parameters_maximum_occurrences["orderFulfillmentStatusList:::action"]=0
operation_parameters_maximum_occurrences["orderInfo:::id"]=0
operation_parameters_maximum_occurrences["orderInfo:::order_id"]=0
operation_parameters_maximum_occurrences["orderInfo:::store_id"]=0
operation_parameters_maximum_occurrences["orderInfo:::params"]=0
operation_parameters_maximum_occurrences["orderInfo:::response_fields"]=0
operation_parameters_maximum_occurrences["orderInfo:::exclude"]=0
operation_parameters_maximum_occurrences["orderInfo:::enable_cache"]=0
operation_parameters_maximum_occurrences["orderInfo:::use_latest_api_version"]=0
operation_parameters_maximum_occurrences["orderList:::start"]=0
operation_parameters_maximum_occurrences["orderList:::count"]=0
operation_parameters_maximum_occurrences["orderList:::page_cursor"]=0
operation_parameters_maximum_occurrences["orderList:::ids"]=0
operation_parameters_maximum_occurrences["orderList:::order_ids"]=0
operation_parameters_maximum_occurrences["orderList:::since_id"]=0
operation_parameters_maximum_occurrences["orderList:::store_id"]=0
operation_parameters_maximum_occurrences["orderList:::customer_id"]=0
operation_parameters_maximum_occurrences["orderList:::customer_email"]=0
operation_parameters_maximum_occurrences["orderList:::basket_id"]=0
operation_parameters_maximum_occurrences["orderList:::currency_id"]=0
operation_parameters_maximum_occurrences["orderList:::phone"]=0
operation_parameters_maximum_occurrences["orderList:::order_status"]=0
operation_parameters_maximum_occurrences["orderList:::order_status_ids"]=0
operation_parameters_maximum_occurrences["orderList:::ebay_order_status"]=0
operation_parameters_maximum_occurrences["orderList:::financial_status"]=0
operation_parameters_maximum_occurrences["orderList:::financial_status_ids"]=0
operation_parameters_maximum_occurrences["orderList:::fulfillment_status"]=0
operation_parameters_maximum_occurrences["orderList:::return_status"]=0
operation_parameters_maximum_occurrences["orderList:::fulfillment_channel"]=0
operation_parameters_maximum_occurrences["orderList:::shipping_method"]=0
operation_parameters_maximum_occurrences["orderList:::skip_order_ids"]=0
operation_parameters_maximum_occurrences["orderList:::is_deleted"]=0
operation_parameters_maximum_occurrences["orderList:::shipping_country_iso3"]=0
operation_parameters_maximum_occurrences["orderList:::delivery_method"]=0
operation_parameters_maximum_occurrences["orderList:::ship_node_type"]=0
operation_parameters_maximum_occurrences["orderList:::created_to"]=0
operation_parameters_maximum_occurrences["orderList:::created_from"]=0
operation_parameters_maximum_occurrences["orderList:::modified_to"]=0
operation_parameters_maximum_occurrences["orderList:::modified_from"]=0
operation_parameters_maximum_occurrences["orderList:::tags"]=0
operation_parameters_maximum_occurrences["orderList:::sort_by"]=0
operation_parameters_maximum_occurrences["orderList:::sort_direction"]=0
operation_parameters_maximum_occurrences["orderList:::params"]=0
operation_parameters_maximum_occurrences["orderList:::response_fields"]=0
operation_parameters_maximum_occurrences["orderList:::exclude"]=0
operation_parameters_maximum_occurrences["orderList:::enable_cache"]=0
operation_parameters_maximum_occurrences["orderList:::use_latest_api_version"]=0
operation_parameters_maximum_occurrences["orderPreestimateShippingList:::OrderPreestimateShippingList"]=0
operation_parameters_maximum_occurrences["orderRefundAdd:::OrderRefundAdd"]=0
operation_parameters_maximum_occurrences["orderReturnAdd:::OrderReturnAdd"]=0
operation_parameters_maximum_occurrences["orderReturnDelete:::return_id"]=0
operation_parameters_maximum_occurrences["orderReturnDelete:::order_id"]=0
operation_parameters_maximum_occurrences["orderReturnDelete:::store_id"]=0
operation_parameters_maximum_occurrences["orderReturnUpdate:::OrderReturnUpdate"]=0
operation_parameters_maximum_occurrences["orderShipmentAdd:::OrderShipmentAdd"]=0
operation_parameters_maximum_occurrences["orderShipmentAddBatch:::OrderShipmentAddBatch"]=0
operation_parameters_maximum_occurrences["orderShipmentDelete:::shipment_id"]=0
operation_parameters_maximum_occurrences["orderShipmentDelete:::order_id"]=0
operation_parameters_maximum_occurrences["orderShipmentDelete:::store_id"]=0
operation_parameters_maximum_occurrences["orderShipmentInfo:::id"]=0
operation_parameters_maximum_occurrences["orderShipmentInfo:::order_id"]=0
operation_parameters_maximum_occurrences["orderShipmentInfo:::start"]=0
operation_parameters_maximum_occurrences["orderShipmentInfo:::store_id"]=0
operation_parameters_maximum_occurrences["orderShipmentInfo:::response_fields"]=0
operation_parameters_maximum_occurrences["orderShipmentInfo:::params"]=0
operation_parameters_maximum_occurrences["orderShipmentInfo:::exclude"]=0
operation_parameters_maximum_occurrences["orderShipmentList:::order_id"]=0
operation_parameters_maximum_occurrences["orderShipmentList:::start"]=0
operation_parameters_maximum_occurrences["orderShipmentList:::count"]=0
operation_parameters_maximum_occurrences["orderShipmentList:::page_cursor"]=0
operation_parameters_maximum_occurrences["orderShipmentList:::store_id"]=0
operation_parameters_maximum_occurrences["orderShipmentList:::created_from"]=0
operation_parameters_maximum_occurrences["orderShipmentList:::created_to"]=0
operation_parameters_maximum_occurrences["orderShipmentList:::modified_from"]=0
operation_parameters_maximum_occurrences["orderShipmentList:::modified_to"]=0
operation_parameters_maximum_occurrences["orderShipmentList:::response_fields"]=0
operation_parameters_maximum_occurrences["orderShipmentList:::params"]=0
operation_parameters_maximum_occurrences["orderShipmentList:::exclude"]=0
operation_parameters_maximum_occurrences["orderShipmentTrackingAdd:::OrderShipmentTrackingAdd"]=0
operation_parameters_maximum_occurrences["orderShipmentUpdate:::OrderShipmentUpdate"]=0
operation_parameters_maximum_occurrences["orderStatusList:::store_id"]=0
operation_parameters_maximum_occurrences["orderStatusList:::action"]=0
operation_parameters_maximum_occurrences["orderStatusList:::response_fields"]=0
operation_parameters_maximum_occurrences["orderTransactionList:::order_ids"]=0
operation_parameters_maximum_occurrences["orderTransactionList:::count"]=0
operation_parameters_maximum_occurrences["orderTransactionList:::page_cursor"]=0
operation_parameters_maximum_occurrences["orderTransactionList:::store_id"]=0
operation_parameters_maximum_occurrences["orderTransactionList:::params"]=0
operation_parameters_maximum_occurrences["orderTransactionList:::response_fields"]=0
operation_parameters_maximum_occurrences["orderTransactionList:::exclude"]=0
operation_parameters_maximum_occurrences["orderUpdate:::order_id"]=0
operation_parameters_maximum_occurrences["orderUpdate:::store_id"]=0
operation_parameters_maximum_occurrences["orderUpdate:::order_status"]=0
operation_parameters_maximum_occurrences["orderUpdate:::financial_status"]=0
operation_parameters_maximum_occurrences["orderUpdate:::fulfillment_status"]=0
operation_parameters_maximum_occurrences["orderUpdate:::cancellation_reason"]=0
operation_parameters_maximum_occurrences["orderUpdate:::order_payment_method"]=0
operation_parameters_maximum_occurrences["orderUpdate:::comment"]=0
operation_parameters_maximum_occurrences["orderUpdate:::admin_comment"]=0
operation_parameters_maximum_occurrences["orderUpdate:::admin_private_comment"]=0
operation_parameters_maximum_occurrences["orderUpdate:::invoice_admin_comment"]=0
operation_parameters_maximum_occurrences["orderUpdate:::date_modified"]=0
operation_parameters_maximum_occurrences["orderUpdate:::date_finished"]=0
operation_parameters_maximum_occurrences["orderUpdate:::send_notifications"]=0
operation_parameters_maximum_occurrences["orderUpdate:::create_invoice"]=0
operation_parameters_maximum_occurrences["orderUpdate:::origin"]=0
operation_parameters_maximum_occurrences["orderUpdate:::tags"]=0
operation_parameters_maximum_occurrences["productAdd:::ProductAdd"]=0
operation_parameters_maximum_occurrences["productAddBatch:::ProductAddBatch"]=0
operation_parameters_maximum_occurrences["productAttributeList:::product_id"]=0
operation_parameters_maximum_occurrences["productAttributeList:::start"]=0
operation_parameters_maximum_occurrences["productAttributeList:::count"]=0
operation_parameters_maximum_occurrences["productAttributeList:::page_cursor"]=0
operation_parameters_maximum_occurrences["productAttributeList:::attribute_id"]=0
operation_parameters_maximum_occurrences["productAttributeList:::variant_id"]=0
operation_parameters_maximum_occurrences["productAttributeList:::attribute_group_id"]=0
operation_parameters_maximum_occurrences["productAttributeList:::lang_id"]=0
operation_parameters_maximum_occurrences["productAttributeList:::store_id"]=0
operation_parameters_maximum_occurrences["productAttributeList:::set_name"]=0
operation_parameters_maximum_occurrences["productAttributeList:::sort_by"]=0
operation_parameters_maximum_occurrences["productAttributeList:::sort_direction"]=0
operation_parameters_maximum_occurrences["productAttributeList:::response_fields"]=0
operation_parameters_maximum_occurrences["productAttributeList:::params"]=0
operation_parameters_maximum_occurrences["productAttributeList:::exclude"]=0
operation_parameters_maximum_occurrences["productAttributeValueSet:::product_id"]=0
operation_parameters_maximum_occurrences["productAttributeValueSet:::attribute_id"]=0
operation_parameters_maximum_occurrences["productAttributeValueSet:::attribute_group_id"]=0
operation_parameters_maximum_occurrences["productAttributeValueSet:::attribute_name"]=0
operation_parameters_maximum_occurrences["productAttributeValueSet:::value"]=0
operation_parameters_maximum_occurrences["productAttributeValueSet:::value_id"]=0
operation_parameters_maximum_occurrences["productAttributeValueSet:::lang_id"]=0
operation_parameters_maximum_occurrences["productAttributeValueSet:::store_id"]=0
operation_parameters_maximum_occurrences["productAttributeValueUnset:::product_id"]=0
operation_parameters_maximum_occurrences["productAttributeValueUnset:::attribute_id"]=0
operation_parameters_maximum_occurrences["productAttributeValueUnset:::store_id"]=0
operation_parameters_maximum_occurrences["productAttributeValueUnset:::include_default"]=0
operation_parameters_maximum_occurrences["productAttributeValueUnset:::reindex"]=0
operation_parameters_maximum_occurrences["productAttributeValueUnset:::clear_cache"]=0
operation_parameters_maximum_occurrences["productBrandList:::start"]=0
operation_parameters_maximum_occurrences["productBrandList:::count"]=0
operation_parameters_maximum_occurrences["productBrandList:::page_cursor"]=0
operation_parameters_maximum_occurrences["productBrandList:::brand_ids"]=0
operation_parameters_maximum_occurrences["productBrandList:::category_id"]=0
operation_parameters_maximum_occurrences["productBrandList:::parent_id"]=0
operation_parameters_maximum_occurrences["productBrandList:::store_id"]=0
operation_parameters_maximum_occurrences["productBrandList:::lang_id"]=0
operation_parameters_maximum_occurrences["productBrandList:::find_where"]=0
operation_parameters_maximum_occurrences["productBrandList:::find_value"]=0
operation_parameters_maximum_occurrences["productBrandList:::created_from"]=0
operation_parameters_maximum_occurrences["productBrandList:::created_to"]=0
operation_parameters_maximum_occurrences["productBrandList:::modified_from"]=0
operation_parameters_maximum_occurrences["productBrandList:::modified_to"]=0
operation_parameters_maximum_occurrences["productBrandList:::response_fields"]=0
operation_parameters_maximum_occurrences["productBrandList:::params"]=0
operation_parameters_maximum_occurrences["productBrandList:::exclude"]=0
operation_parameters_maximum_occurrences["productChildItemFind:::find_value"]=0
operation_parameters_maximum_occurrences["productChildItemFind:::find_where"]=0
operation_parameters_maximum_occurrences["productChildItemFind:::find_params"]=0
operation_parameters_maximum_occurrences["productChildItemFind:::store_id"]=0
operation_parameters_maximum_occurrences["productChildItemInfo:::product_id"]=0
operation_parameters_maximum_occurrences["productChildItemInfo:::id"]=0
operation_parameters_maximum_occurrences["productChildItemInfo:::store_id"]=0
operation_parameters_maximum_occurrences["productChildItemInfo:::lang_id"]=0
operation_parameters_maximum_occurrences["productChildItemInfo:::currency_id"]=0
operation_parameters_maximum_occurrences["productChildItemInfo:::response_fields"]=0
operation_parameters_maximum_occurrences["productChildItemInfo:::params"]=0
operation_parameters_maximum_occurrences["productChildItemInfo:::exclude"]=0
operation_parameters_maximum_occurrences["productChildItemInfo:::use_latest_api_version"]=0
operation_parameters_maximum_occurrences["productChildItemList:::start"]=0
operation_parameters_maximum_occurrences["productChildItemList:::count"]=0
operation_parameters_maximum_occurrences["productChildItemList:::page_cursor"]=0
operation_parameters_maximum_occurrences["productChildItemList:::product_id"]=0
operation_parameters_maximum_occurrences["productChildItemList:::product_ids"]=0
operation_parameters_maximum_occurrences["productChildItemList:::sku"]=0
operation_parameters_maximum_occurrences["productChildItemList:::store_id"]=0
operation_parameters_maximum_occurrences["productChildItemList:::lang_id"]=0
operation_parameters_maximum_occurrences["productChildItemList:::currency_id"]=0
operation_parameters_maximum_occurrences["productChildItemList:::avail_sale"]=0
operation_parameters_maximum_occurrences["productChildItemList:::find_value"]=0
operation_parameters_maximum_occurrences["productChildItemList:::find_where"]=0
operation_parameters_maximum_occurrences["productChildItemList:::created_from"]=0
operation_parameters_maximum_occurrences["productChildItemList:::created_to"]=0
operation_parameters_maximum_occurrences["productChildItemList:::modified_from"]=0
operation_parameters_maximum_occurrences["productChildItemList:::modified_to"]=0
operation_parameters_maximum_occurrences["productChildItemList:::return_global"]=0
operation_parameters_maximum_occurrences["productChildItemList:::response_fields"]=0
operation_parameters_maximum_occurrences["productChildItemList:::params"]=0
operation_parameters_maximum_occurrences["productChildItemList:::exclude"]=0
operation_parameters_maximum_occurrences["productChildItemList:::report_request_id"]=0
operation_parameters_maximum_occurrences["productChildItemList:::disable_report_cache"]=0
operation_parameters_maximum_occurrences["productChildItemList:::use_latest_api_version"]=0
operation_parameters_maximum_occurrences["productCount:::product_ids"]=0
operation_parameters_maximum_occurrences["productCount:::since_id"]=0
operation_parameters_maximum_occurrences["productCount:::categories_ids"]=0
operation_parameters_maximum_occurrences["productCount:::category_id"]=0
operation_parameters_maximum_occurrences["productCount:::store_id"]=0
operation_parameters_maximum_occurrences["productCount:::lang_id"]=0
operation_parameters_maximum_occurrences["productCount:::avail_view"]=0
operation_parameters_maximum_occurrences["productCount:::avail_sale"]=0
operation_parameters_maximum_occurrences["productCount:::created_from"]=0
operation_parameters_maximum_occurrences["productCount:::created_to"]=0
operation_parameters_maximum_occurrences["productCount:::modified_from"]=0
operation_parameters_maximum_occurrences["productCount:::modified_to"]=0
operation_parameters_maximum_occurrences["productCount:::brand_name"]=0
operation_parameters_maximum_occurrences["productCount:::product_attributes"]=0
operation_parameters_maximum_occurrences["productCount:::status"]=0
operation_parameters_maximum_occurrences["productCount:::type"]=0
operation_parameters_maximum_occurrences["productCount:::visible"]=0
operation_parameters_maximum_occurrences["productCount:::find_value"]=0
operation_parameters_maximum_occurrences["productCount:::find_where"]=0
operation_parameters_maximum_occurrences["productCount:::report_request_id"]=0
operation_parameters_maximum_occurrences["productCount:::return_global"]=0
operation_parameters_maximum_occurrences["productCount:::disable_report_cache"]=0
operation_parameters_maximum_occurrences["productCount:::use_latest_api_version"]=0
operation_parameters_maximum_occurrences["productCurrencyAdd:::iso3"]=0
operation_parameters_maximum_occurrences["productCurrencyAdd:::rate"]=0
operation_parameters_maximum_occurrences["productCurrencyAdd:::name"]=0
operation_parameters_maximum_occurrences["productCurrencyAdd:::avail"]=0
operation_parameters_maximum_occurrences["productCurrencyAdd:::symbol_left"]=0
operation_parameters_maximum_occurrences["productCurrencyAdd:::symbol_right"]=0
operation_parameters_maximum_occurrences["productCurrencyAdd:::default"]=0
operation_parameters_maximum_occurrences["productCurrencyList:::start"]=0
operation_parameters_maximum_occurrences["productCurrencyList:::count"]=0
operation_parameters_maximum_occurrences["productCurrencyList:::page_cursor"]=0
operation_parameters_maximum_occurrences["productCurrencyList:::default"]=0
operation_parameters_maximum_occurrences["productCurrencyList:::avail"]=0
operation_parameters_maximum_occurrences["productCurrencyList:::response_fields"]=0
operation_parameters_maximum_occurrences["productCurrencyList:::params"]=0
operation_parameters_maximum_occurrences["productCurrencyList:::exclude"]=0
operation_parameters_maximum_occurrences["productDelete:::id"]=0
operation_parameters_maximum_occurrences["productDelete:::store_id"]=0
operation_parameters_maximum_occurrences["productDeleteBatch:::ProductDeleteBatch"]=0
operation_parameters_maximum_occurrences["productFind:::find_value"]=0
operation_parameters_maximum_occurrences["productFind:::find_where"]=0
operation_parameters_maximum_occurrences["productFind:::find_params"]=0
operation_parameters_maximum_occurrences["productFind:::find_what"]=0
operation_parameters_maximum_occurrences["productFind:::lang_id"]=0
operation_parameters_maximum_occurrences["productFind:::store_id"]=0
operation_parameters_maximum_occurrences["productImageAdd:::ProductImageAdd"]=0
operation_parameters_maximum_occurrences["productImageDelete:::product_id"]=0
operation_parameters_maximum_occurrences["productImageDelete:::id"]=0
operation_parameters_maximum_occurrences["productImageDelete:::store_id"]=0
operation_parameters_maximum_occurrences["productImageUpdate:::product_id"]=0
operation_parameters_maximum_occurrences["productImageUpdate:::id"]=0
operation_parameters_maximum_occurrences["productImageUpdate:::variant_ids"]=0
operation_parameters_maximum_occurrences["productImageUpdate:::store_id"]=0
operation_parameters_maximum_occurrences["productImageUpdate:::lang_id"]=0
operation_parameters_maximum_occurrences["productImageUpdate:::image_name"]=0
operation_parameters_maximum_occurrences["productImageUpdate:::type"]=0
operation_parameters_maximum_occurrences["productImageUpdate:::label"]=0
operation_parameters_maximum_occurrences["productImageUpdate:::position"]=0
operation_parameters_maximum_occurrences["productImageUpdate:::hidden"]=0
operation_parameters_maximum_occurrences["productInfo:::id"]=0
operation_parameters_maximum_occurrences["productInfo:::store_id"]=0
operation_parameters_maximum_occurrences["productInfo:::lang_id"]=0
operation_parameters_maximum_occurrences["productInfo:::currency_id"]=0
operation_parameters_maximum_occurrences["productInfo:::response_fields"]=0
operation_parameters_maximum_occurrences["productInfo:::params"]=0
operation_parameters_maximum_occurrences["productInfo:::exclude"]=0
operation_parameters_maximum_occurrences["productInfo:::report_request_id"]=0
operation_parameters_maximum_occurrences["productInfo:::disable_report_cache"]=0
operation_parameters_maximum_occurrences["productInfo:::use_latest_api_version"]=0
operation_parameters_maximum_occurrences["productList:::start"]=0
operation_parameters_maximum_occurrences["productList:::count"]=0
operation_parameters_maximum_occurrences["productList:::page_cursor"]=0
operation_parameters_maximum_occurrences["productList:::product_ids"]=0
operation_parameters_maximum_occurrences["productList:::since_id"]=0
operation_parameters_maximum_occurrences["productList:::categories_ids"]=0
operation_parameters_maximum_occurrences["productList:::category_id"]=0
operation_parameters_maximum_occurrences["productList:::store_id"]=0
operation_parameters_maximum_occurrences["productList:::lang_id"]=0
operation_parameters_maximum_occurrences["productList:::currency_id"]=0
operation_parameters_maximum_occurrences["productList:::avail_view"]=0
operation_parameters_maximum_occurrences["productList:::avail_sale"]=0
operation_parameters_maximum_occurrences["productList:::created_from"]=0
operation_parameters_maximum_occurrences["productList:::created_to"]=0
operation_parameters_maximum_occurrences["productList:::modified_from"]=0
operation_parameters_maximum_occurrences["productList:::modified_to"]=0
operation_parameters_maximum_occurrences["productList:::sku"]=0
operation_parameters_maximum_occurrences["productList:::brand_name"]=0
operation_parameters_maximum_occurrences["productList:::product_attributes"]=0
operation_parameters_maximum_occurrences["productList:::status"]=0
operation_parameters_maximum_occurrences["productList:::type"]=0
operation_parameters_maximum_occurrences["productList:::visible"]=0
operation_parameters_maximum_occurrences["productList:::find_value"]=0
operation_parameters_maximum_occurrences["productList:::find_where"]=0
operation_parameters_maximum_occurrences["productList:::return_global"]=0
operation_parameters_maximum_occurrences["productList:::params"]=0
operation_parameters_maximum_occurrences["productList:::response_fields"]=0
operation_parameters_maximum_occurrences["productList:::exclude"]=0
operation_parameters_maximum_occurrences["productList:::sort_by"]=0
operation_parameters_maximum_occurrences["productList:::sort_direction"]=0
operation_parameters_maximum_occurrences["productList:::report_request_id"]=0
operation_parameters_maximum_occurrences["productList:::disable_cache"]=0
operation_parameters_maximum_occurrences["productList:::disable_report_cache"]=0
operation_parameters_maximum_occurrences["productList:::use_latest_api_version"]=0
operation_parameters_maximum_occurrences["productManufacturerAdd:::product_id"]=0
operation_parameters_maximum_occurrences["productManufacturerAdd:::manufacturer"]=0
operation_parameters_maximum_occurrences["productManufacturerAdd:::store_id"]=0
operation_parameters_maximum_occurrences["productOptionAdd:::ProductOptionAdd"]=0
operation_parameters_maximum_occurrences["productOptionAssign:::product_id"]=0
operation_parameters_maximum_occurrences["productOptionAssign:::option_id"]=0
operation_parameters_maximum_occurrences["productOptionAssign:::required"]=0
operation_parameters_maximum_occurrences["productOptionAssign:::sort_order"]=0
operation_parameters_maximum_occurrences["productOptionAssign:::option_values"]=0
operation_parameters_maximum_occurrences["productOptionAssign:::clear_cache"]=0
operation_parameters_maximum_occurrences["productOptionDelete:::option_id"]=0
operation_parameters_maximum_occurrences["productOptionDelete:::product_id"]=0
operation_parameters_maximum_occurrences["productOptionDelete:::store_id"]=0
operation_parameters_maximum_occurrences["productOptionList:::start"]=0
operation_parameters_maximum_occurrences["productOptionList:::count"]=0
operation_parameters_maximum_occurrences["productOptionList:::product_id"]=0
operation_parameters_maximum_occurrences["productOptionList:::lang_id"]=0
operation_parameters_maximum_occurrences["productOptionList:::store_id"]=0
operation_parameters_maximum_occurrences["productOptionList:::response_fields"]=0
operation_parameters_maximum_occurrences["productOptionList:::params"]=0
operation_parameters_maximum_occurrences["productOptionList:::exclude"]=0
operation_parameters_maximum_occurrences["productOptionValueAdd:::product_id"]=0
operation_parameters_maximum_occurrences["productOptionValueAdd:::option_id"]=0
operation_parameters_maximum_occurrences["productOptionValueAdd:::option_value"]=0
operation_parameters_maximum_occurrences["productOptionValueAdd:::sort_order"]=0
operation_parameters_maximum_occurrences["productOptionValueAdd:::display_value"]=0
operation_parameters_maximum_occurrences["productOptionValueAdd:::is_default"]=0
operation_parameters_maximum_occurrences["productOptionValueAdd:::clear_cache"]=0
operation_parameters_maximum_occurrences["productOptionValueAssign:::product_option_id"]=0
operation_parameters_maximum_occurrences["productOptionValueAssign:::option_value_id"]=0
operation_parameters_maximum_occurrences["productOptionValueAssign:::clear_cache"]=0
operation_parameters_maximum_occurrences["productOptionValueDelete:::option_id"]=0
operation_parameters_maximum_occurrences["productOptionValueDelete:::option_value_id"]=0
operation_parameters_maximum_occurrences["productOptionValueDelete:::product_id"]=0
operation_parameters_maximum_occurrences["productOptionValueDelete:::store_id"]=0
operation_parameters_maximum_occurrences["productOptionValueUpdate:::product_id"]=0
operation_parameters_maximum_occurrences["productOptionValueUpdate:::option_id"]=0
operation_parameters_maximum_occurrences["productOptionValueUpdate:::option_value_id"]=0
operation_parameters_maximum_occurrences["productOptionValueUpdate:::option_value"]=0
operation_parameters_maximum_occurrences["productOptionValueUpdate:::price"]=0
operation_parameters_maximum_occurrences["productOptionValueUpdate:::quantity"]=0
operation_parameters_maximum_occurrences["productOptionValueUpdate:::display_value"]=0
operation_parameters_maximum_occurrences["productOptionValueUpdate:::clear_cache"]=0
operation_parameters_maximum_occurrences["productPriceAdd:::ProductPriceAdd"]=0
operation_parameters_maximum_occurrences["productPriceDelete:::product_id"]=0
operation_parameters_maximum_occurrences["productPriceDelete:::group_prices"]=0
operation_parameters_maximum_occurrences["productPriceDelete:::store_id"]=0
operation_parameters_maximum_occurrences["productPriceUpdate:::ProductPriceUpdate"]=0
operation_parameters_maximum_occurrences["productReviewList:::product_id"]=0
operation_parameters_maximum_occurrences["productReviewList:::start"]=0
operation_parameters_maximum_occurrences["productReviewList:::count"]=0
operation_parameters_maximum_occurrences["productReviewList:::page_cursor"]=0
operation_parameters_maximum_occurrences["productReviewList:::ids"]=0
operation_parameters_maximum_occurrences["productReviewList:::store_id"]=0
operation_parameters_maximum_occurrences["productReviewList:::status"]=0
operation_parameters_maximum_occurrences["productReviewList:::response_fields"]=0
operation_parameters_maximum_occurrences["productReviewList:::params"]=0
operation_parameters_maximum_occurrences["productReviewList:::exclude"]=0
operation_parameters_maximum_occurrences["productStoreAssign:::product_id"]=0
operation_parameters_maximum_occurrences["productStoreAssign:::store_id"]=0
operation_parameters_maximum_occurrences["productTaxAdd:::ProductTaxAdd"]=0
operation_parameters_maximum_occurrences["productUpdate:::ProductUpdate"]=0
operation_parameters_maximum_occurrences["productUpdateBatch:::ProductUpdateBatch"]=0
operation_parameters_maximum_occurrences["productVariantAdd:::ProductVariantAdd"]=0
operation_parameters_maximum_occurrences["productVariantAddBatch:::ProductVariantAddBatch"]=0
operation_parameters_maximum_occurrences["productVariantDelete:::id"]=0
operation_parameters_maximum_occurrences["productVariantDelete:::product_id"]=0
operation_parameters_maximum_occurrences["productVariantDelete:::store_id"]=0
operation_parameters_maximum_occurrences["productVariantDeleteBatch:::ProductVariantDeleteBatch"]=0
operation_parameters_maximum_occurrences["productVariantImageAdd:::ProductVariantImageAdd"]=0
operation_parameters_maximum_occurrences["productVariantImageDelete:::product_id"]=0
operation_parameters_maximum_occurrences["productVariantImageDelete:::product_variant_id"]=0
operation_parameters_maximum_occurrences["productVariantImageDelete:::id"]=0
operation_parameters_maximum_occurrences["productVariantImageDelete:::store_id"]=0
operation_parameters_maximum_occurrences["productVariantPriceAdd:::ProductVariantPriceAdd"]=0
operation_parameters_maximum_occurrences["productVariantPriceDelete:::id"]=0
operation_parameters_maximum_occurrences["productVariantPriceDelete:::product_id"]=0
operation_parameters_maximum_occurrences["productVariantPriceDelete:::group_prices"]=0
operation_parameters_maximum_occurrences["productVariantPriceDelete:::store_id"]=0
operation_parameters_maximum_occurrences["productVariantPriceUpdate:::ProductVariantPriceUpdate"]=0
operation_parameters_maximum_occurrences["productVariantUpdate:::ProductVariantUpdate"]=0
operation_parameters_maximum_occurrences["productVariantUpdateBatch:::ProductVariantUpdateBatch"]=0
operation_parameters_maximum_occurrences["returnCount:::order_ids"]=0
operation_parameters_maximum_occurrences["returnCount:::customer_id"]=0
operation_parameters_maximum_occurrences["returnCount:::store_id"]=0
operation_parameters_maximum_occurrences["returnCount:::status"]=0
operation_parameters_maximum_occurrences["returnCount:::return_type"]=0
operation_parameters_maximum_occurrences["returnCount:::created_from"]=0
operation_parameters_maximum_occurrences["returnCount:::created_to"]=0
operation_parameters_maximum_occurrences["returnCount:::modified_from"]=0
operation_parameters_maximum_occurrences["returnCount:::modified_to"]=0
operation_parameters_maximum_occurrences["returnCount:::report_request_id"]=0
operation_parameters_maximum_occurrences["returnCount:::disable_report_cache"]=0
operation_parameters_maximum_occurrences["returnInfo:::id"]=0
operation_parameters_maximum_occurrences["returnInfo:::order_id"]=0
operation_parameters_maximum_occurrences["returnInfo:::store_id"]=0
operation_parameters_maximum_occurrences["returnInfo:::response_fields"]=0
operation_parameters_maximum_occurrences["returnInfo:::params"]=0
operation_parameters_maximum_occurrences["returnInfo:::exclude"]=0
operation_parameters_maximum_occurrences["returnList:::start"]=0
operation_parameters_maximum_occurrences["returnList:::count"]=0
operation_parameters_maximum_occurrences["returnList:::page_cursor"]=0
operation_parameters_maximum_occurrences["returnList:::order_id"]=0
operation_parameters_maximum_occurrences["returnList:::order_ids"]=0
operation_parameters_maximum_occurrences["returnList:::customer_id"]=0
operation_parameters_maximum_occurrences["returnList:::store_id"]=0
operation_parameters_maximum_occurrences["returnList:::status"]=0
operation_parameters_maximum_occurrences["returnList:::return_type"]=0
operation_parameters_maximum_occurrences["returnList:::created_from"]=0
operation_parameters_maximum_occurrences["returnList:::created_to"]=0
operation_parameters_maximum_occurrences["returnList:::modified_from"]=0
operation_parameters_maximum_occurrences["returnList:::modified_to"]=0
operation_parameters_maximum_occurrences["returnList:::response_fields"]=0
operation_parameters_maximum_occurrences["returnList:::params"]=0
operation_parameters_maximum_occurrences["returnList:::exclude"]=0
operation_parameters_maximum_occurrences["returnList:::report_request_id"]=0
operation_parameters_maximum_occurrences["returnList:::disable_report_cache"]=0
operation_parameters_maximum_occurrences["returnReasonList:::store_id"]=0
operation_parameters_maximum_occurrences["subscriberList:::ids"]=0
operation_parameters_maximum_occurrences["subscriberList:::start"]=0
operation_parameters_maximum_occurrences["subscriberList:::count"]=0
operation_parameters_maximum_occurrences["subscriberList:::page_cursor"]=0
operation_parameters_maximum_occurrences["subscriberList:::subscribed"]=0
operation_parameters_maximum_occurrences["subscriberList:::store_id"]=0
operation_parameters_maximum_occurrences["subscriberList:::email"]=0
operation_parameters_maximum_occurrences["subscriberList:::created_from"]=0
operation_parameters_maximum_occurrences["subscriberList:::created_to"]=0
operation_parameters_maximum_occurrences["subscriberList:::modified_from"]=0
operation_parameters_maximum_occurrences["subscriberList:::modified_to"]=0
operation_parameters_maximum_occurrences["subscriberList:::response_fields"]=0
operation_parameters_maximum_occurrences["subscriberList:::params"]=0
operation_parameters_maximum_occurrences["subscriberList:::exclude"]=0
operation_parameters_maximum_occurrences["taxClassInfo:::tax_class_id"]=0
operation_parameters_maximum_occurrences["taxClassInfo:::store_id"]=0
operation_parameters_maximum_occurrences["taxClassInfo:::lang_id"]=0
operation_parameters_maximum_occurrences["taxClassInfo:::response_fields"]=0
operation_parameters_maximum_occurrences["taxClassInfo:::params"]=0
operation_parameters_maximum_occurrences["taxClassInfo:::exclude"]=0
operation_parameters_maximum_occurrences["taxClassList:::count"]=0
operation_parameters_maximum_occurrences["taxClassList:::page_cursor"]=0
operation_parameters_maximum_occurrences["taxClassList:::store_id"]=0
operation_parameters_maximum_occurrences["taxClassList:::find_value"]=0
operation_parameters_maximum_occurrences["taxClassList:::find_where"]=0
operation_parameters_maximum_occurrences["taxClassList:::created_to"]=0
operation_parameters_maximum_occurrences["taxClassList:::created_from"]=0
operation_parameters_maximum_occurrences["taxClassList:::modified_to"]=0
operation_parameters_maximum_occurrences["taxClassList:::modified_from"]=0
operation_parameters_maximum_occurrences["taxClassList:::response_fields"]=0
operation_parameters_maximum_occurrences["webhookCount:::entity"]=0
operation_parameters_maximum_occurrences["webhookCount:::action"]=0
operation_parameters_maximum_occurrences["webhookCount:::active"]=0
operation_parameters_maximum_occurrences["webhookCreate:::entity"]=0
operation_parameters_maximum_occurrences["webhookCreate:::action"]=0
operation_parameters_maximum_occurrences["webhookCreate:::callback"]=0
operation_parameters_maximum_occurrences["webhookCreate:::label"]=0
operation_parameters_maximum_occurrences["webhookCreate:::fields"]=0
operation_parameters_maximum_occurrences["webhookCreate:::response_fields"]=0
operation_parameters_maximum_occurrences["webhookCreate:::active"]=0
operation_parameters_maximum_occurrences["webhookCreate:::lang_id"]=0
operation_parameters_maximum_occurrences["webhookCreate:::store_id"]=0
operation_parameters_maximum_occurrences["webhookDelete:::id"]=0
operation_parameters_maximum_occurrences["webhookList:::start"]=0
operation_parameters_maximum_occurrences["webhookList:::count"]=0
operation_parameters_maximum_occurrences["webhookList:::entity"]=0
operation_parameters_maximum_occurrences["webhookList:::action"]=0
operation_parameters_maximum_occurrences["webhookList:::active"]=0
operation_parameters_maximum_occurrences["webhookList:::ids"]=0
operation_parameters_maximum_occurrences["webhookList:::params"]=0
operation_parameters_maximum_occurrences["webhookUpdate:::id"]=0
operation_parameters_maximum_occurrences["webhookUpdate:::callback"]=0
operation_parameters_maximum_occurrences["webhookUpdate:::label"]=0
operation_parameters_maximum_occurrences["webhookUpdate:::fields"]=0
operation_parameters_maximum_occurrences["webhookUpdate:::response_fields"]=0
operation_parameters_maximum_occurrences["webhookUpdate:::active"]=0
operation_parameters_maximum_occurrences["webhookUpdate:::lang_id"]=0

##
# The type of collection for specifying multiple values for parameter:
# - multi, csv, ssv, tsv
declare -A operation_parameters_collection_type
operation_parameters_collection_type["accountCartAdd:::AccountCartAdd"]=""
operation_parameters_collection_type["accountCartList:::store_url"]=""
operation_parameters_collection_type["accountCartList:::store_key"]=""
operation_parameters_collection_type["accountCartList:::request_from_date"]=""
operation_parameters_collection_type["accountCartList:::request_to_date"]=""
operation_parameters_collection_type["accountCartList:::params"]=""
operation_parameters_collection_type["accountCartList:::exclude"]=""
operation_parameters_collection_type["accountConfigUpdate:::replace_parameters"]=""
operation_parameters_collection_type["accountConfigUpdate:::new_store_url"]=""
operation_parameters_collection_type["accountConfigUpdate:::new_store_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::bridge_url"]=""
operation_parameters_collection_type["accountConfigUpdate:::store_root"]=""
operation_parameters_collection_type["accountConfigUpdate:::db_tables_prefix"]=""
operation_parameters_collection_type["accountConfigUpdate:::user_agent"]=""
operation_parameters_collection_type["accountConfigUpdate:::3dcart_private_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::3dcart_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::3dcartapi_api_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::amazon_sp_client_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::amazon_sp_client_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::amazon_sp_refresh_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::amazon_sp_aws_region"]=""
operation_parameters_collection_type["accountConfigUpdate:::amazon_sp_api_environment"]=""
operation_parameters_collection_type["accountConfigUpdate:::amazon_seller_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::aspdotnetstorefront_api_user"]=""
operation_parameters_collection_type["accountConfigUpdate:::aspdotnetstorefront_api_pass"]=""
operation_parameters_collection_type["accountConfigUpdate:::bigcommerceapi_admin_account"]=""
operation_parameters_collection_type["accountConfigUpdate:::bigcommerceapi_api_path"]=""
operation_parameters_collection_type["accountConfigUpdate:::bigcommerceapi_api_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::bigcommerceapi_client_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::bigcommerceapi_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::bigcommerceapi_context"]=""
operation_parameters_collection_type["accountConfigUpdate:::bol_api_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::bol_api_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::bol_retailer_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::demandware_client_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::demandware_api_password"]=""
operation_parameters_collection_type["accountConfigUpdate:::demandware_user_name"]=""
operation_parameters_collection_type["accountConfigUpdate:::demandware_user_password"]=""
operation_parameters_collection_type["accountConfigUpdate:::ebay_client_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::ebay_client_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::ebay_runame"]=""
operation_parameters_collection_type["accountConfigUpdate:::ebay_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::ebay_refresh_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::ebay_environment"]=""
operation_parameters_collection_type["accountConfigUpdate:::ebay_site_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::ecwid_acess_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::ecwid_store_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::lazada_app_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::lazada_app_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::lazada_refresh_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::lazada_region"]=""
operation_parameters_collection_type["accountConfigUpdate:::etsy_keystring"]=""
operation_parameters_collection_type["accountConfigUpdate:::etsy_shared_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::etsy_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::etsy_token_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::etsy_client_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::etsy_refresh_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::facebook_app_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::facebook_app_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::facebook_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::facebook_business_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::neto_api_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::neto_api_username"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopline_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopline_app_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopline_app_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopline_shared_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopify_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopify_api_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopify_api_password"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopify_shared_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopee_partner_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopee_partner_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopee_shop_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopee_refresh_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopee_region"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopee_environment"]=""
operation_parameters_collection_type["accountConfigUpdate:::shoplazza_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::shoplazza_shared_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::miva_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::miva_signature"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopware_access_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopware_api_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::shopware_api_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::bigcartel_user_name"]=""
operation_parameters_collection_type["accountConfigUpdate:::bigcartel_password"]=""
operation_parameters_collection_type["accountConfigUpdate:::bricklink_consumer_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::bricklink_consumer_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::bricklink_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::bricklink_token_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::volusion_login"]=""
operation_parameters_collection_type["accountConfigUpdate:::volusion_password"]=""
operation_parameters_collection_type["accountConfigUpdate:::walmart_client_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::walmart_client_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::walmart_environment"]=""
operation_parameters_collection_type["accountConfigUpdate:::walmart_channel_type"]=""
operation_parameters_collection_type["accountConfigUpdate:::walmart_region"]=""
operation_parameters_collection_type["accountConfigUpdate:::square_client_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::square_client_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::square_refresh_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::squarespace_api_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::squarespace_client_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::squarespace_client_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::squarespace_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::squarespace_refresh_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::hybris_client_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::hybris_client_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::hybris_username"]=""
operation_parameters_collection_type["accountConfigUpdate:::hybris_password"]=""
operation_parameters_collection_type["accountConfigUpdate:::hybris_websites"]="multi"
operation_parameters_collection_type["accountConfigUpdate:::lightspeed_api_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::lightspeed_api_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::commercehq_api_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::commercehq_api_password"]=""
operation_parameters_collection_type["accountConfigUpdate:::wc_consumer_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::wc_consumer_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::magento_consumer_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::magento_consumer_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::magento_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::magento_token_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::prestashop_webservice_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::wix_app_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::wix_app_secret_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::wix_instance_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::wix_refresh_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::mercado_libre_app_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::mercado_libre_app_secret_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::mercado_libre_refresh_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::zid_client_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::zid_client_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::zid_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::zid_authorization"]=""
operation_parameters_collection_type["accountConfigUpdate:::zid_refresh_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::flipkart_client_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::flipkart_client_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::allegro_client_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::allegro_client_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::allegro_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::allegro_refresh_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::allegro_environment"]=""
operation_parameters_collection_type["accountConfigUpdate:::zoho_client_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::zoho_client_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::zoho_refresh_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::zoho_region"]=""
operation_parameters_collection_type["accountConfigUpdate:::tiendanube_user_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::tiendanube_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::tiendanube_client_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::otto_client_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::otto_client_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::otto_app_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::otto_refresh_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::otto_environment"]=""
operation_parameters_collection_type["accountConfigUpdate:::otto_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::tiktokshop_app_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::tiktokshop_app_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::tiktokshop_refresh_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::tiktokshop_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::salla_client_id"]=""
operation_parameters_collection_type["accountConfigUpdate:::salla_client_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::salla_refresh_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::salla_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::temu_app_key"]=""
operation_parameters_collection_type["accountConfigUpdate:::temu_app_secret"]=""
operation_parameters_collection_type["accountConfigUpdate:::temu_access_token"]=""
operation_parameters_collection_type["accountConfigUpdate:::temu_region"]=""
operation_parameters_collection_type["accountFailedWebhooks:::start"]=""
operation_parameters_collection_type["accountFailedWebhooks:::count"]=""
operation_parameters_collection_type["accountFailedWebhooks:::ids"]=""
operation_parameters_collection_type["attributeAdd:::type"]=""
operation_parameters_collection_type["attributeAdd:::name"]=""
operation_parameters_collection_type["attributeAdd:::code"]=""
operation_parameters_collection_type["attributeAdd:::store_id"]=""
operation_parameters_collection_type["attributeAdd:::lang_id"]=""
operation_parameters_collection_type["attributeAdd:::visible"]=""
operation_parameters_collection_type["attributeAdd:::required"]=""
operation_parameters_collection_type["attributeAdd:::position"]=""
operation_parameters_collection_type["attributeAdd:::attribute_group_id"]=""
operation_parameters_collection_type["attributeAdd:::is_global"]=""
operation_parameters_collection_type["attributeAdd:::is_searchable"]=""
operation_parameters_collection_type["attributeAdd:::is_filterable"]=""
operation_parameters_collection_type["attributeAdd:::is_comparable"]=""
operation_parameters_collection_type["attributeAdd:::is_html_allowed_on_front"]=""
operation_parameters_collection_type["attributeAdd:::is_filterable_in_search"]=""
operation_parameters_collection_type["attributeAdd:::is_configurable"]=""
operation_parameters_collection_type["attributeAdd:::is_visible_in_advanced_search"]=""
operation_parameters_collection_type["attributeAdd:::is_used_for_promo_rules"]=""
operation_parameters_collection_type["attributeAdd:::used_in_product_listing"]=""
operation_parameters_collection_type["attributeAdd:::used_for_sort_by"]=""
operation_parameters_collection_type["attributeAdd:::apply_to"]=""
operation_parameters_collection_type["attributeAssignGroup:::id"]=""
operation_parameters_collection_type["attributeAssignGroup:::group_id"]=""
operation_parameters_collection_type["attributeAssignGroup:::attribute_set_id"]=""
operation_parameters_collection_type["attributeAssignSet:::id"]=""
operation_parameters_collection_type["attributeAssignSet:::attribute_set_id"]=""
operation_parameters_collection_type["attributeAssignSet:::group_id"]=""
operation_parameters_collection_type["attributeAttributesetList:::start"]=""
operation_parameters_collection_type["attributeAttributesetList:::count"]=""
operation_parameters_collection_type["attributeAttributesetList:::response_fields"]=""
operation_parameters_collection_type["attributeAttributesetList:::params"]=""
operation_parameters_collection_type["attributeAttributesetList:::exclude"]=""
operation_parameters_collection_type["attributeCount:::type"]=""
operation_parameters_collection_type["attributeCount:::attribute_set_id"]=""
operation_parameters_collection_type["attributeCount:::store_id"]=""
operation_parameters_collection_type["attributeCount:::lang_id"]=""
operation_parameters_collection_type["attributeCount:::visible"]=""
operation_parameters_collection_type["attributeCount:::required"]=""
operation_parameters_collection_type["attributeCount:::system"]=""
operation_parameters_collection_type["attributeDelete:::id"]=""
operation_parameters_collection_type["attributeDelete:::store_id"]=""
operation_parameters_collection_type["attributeGroupList:::start"]=""
operation_parameters_collection_type["attributeGroupList:::count"]=""
operation_parameters_collection_type["attributeGroupList:::attribute_set_id"]=""
operation_parameters_collection_type["attributeGroupList:::lang_id"]=""
operation_parameters_collection_type["attributeGroupList:::response_fields"]=""
operation_parameters_collection_type["attributeGroupList:::params"]=""
operation_parameters_collection_type["attributeGroupList:::exclude"]=""
operation_parameters_collection_type["attributeInfo:::id"]=""
operation_parameters_collection_type["attributeInfo:::attribute_set_id"]=""
operation_parameters_collection_type["attributeInfo:::store_id"]=""
operation_parameters_collection_type["attributeInfo:::lang_id"]=""
operation_parameters_collection_type["attributeInfo:::response_fields"]=""
operation_parameters_collection_type["attributeInfo:::params"]=""
operation_parameters_collection_type["attributeInfo:::exclude"]=""
operation_parameters_collection_type["attributeList:::start"]=""
operation_parameters_collection_type["attributeList:::count"]=""
operation_parameters_collection_type["attributeList:::attribute_ids"]=""
operation_parameters_collection_type["attributeList:::attribute_set_id"]=""
operation_parameters_collection_type["attributeList:::store_id"]=""
operation_parameters_collection_type["attributeList:::lang_id"]=""
operation_parameters_collection_type["attributeList:::type"]=""
operation_parameters_collection_type["attributeList:::visible"]=""
operation_parameters_collection_type["attributeList:::required"]=""
operation_parameters_collection_type["attributeList:::system"]=""
operation_parameters_collection_type["attributeList:::response_fields"]=""
operation_parameters_collection_type["attributeList:::params"]=""
operation_parameters_collection_type["attributeList:::exclude"]=""
operation_parameters_collection_type["attributeUnassignGroup:::id"]=""
operation_parameters_collection_type["attributeUnassignGroup:::group_id"]=""
operation_parameters_collection_type["attributeUnassignSet:::id"]=""
operation_parameters_collection_type["attributeUnassignSet:::attribute_set_id"]=""
operation_parameters_collection_type["attributeUpdate:::id"]=""
operation_parameters_collection_type["attributeUpdate:::name"]=""
operation_parameters_collection_type["attributeUpdate:::store_id"]=""
operation_parameters_collection_type["attributeUpdate:::lang_id"]=""
operation_parameters_collection_type["attributeValueAdd:::attribute_id"]=""
operation_parameters_collection_type["attributeValueAdd:::name"]=""
operation_parameters_collection_type["attributeValueAdd:::code"]=""
operation_parameters_collection_type["attributeValueAdd:::description"]=""
operation_parameters_collection_type["attributeValueAdd:::store_id"]=""
operation_parameters_collection_type["attributeValueAdd:::lang_id"]=""
operation_parameters_collection_type["attributeValueDelete:::id"]=""
operation_parameters_collection_type["attributeValueDelete:::attribute_id"]=""
operation_parameters_collection_type["attributeValueDelete:::store_id"]=""
operation_parameters_collection_type["attributeValueUpdate:::id"]=""
operation_parameters_collection_type["attributeValueUpdate:::attribute_id"]=""
operation_parameters_collection_type["attributeValueUpdate:::name"]=""
operation_parameters_collection_type["attributeValueUpdate:::description"]=""
operation_parameters_collection_type["attributeValueUpdate:::code"]=""
operation_parameters_collection_type["attributeValueUpdate:::store_id"]=""
operation_parameters_collection_type["attributeValueUpdate:::lang_id"]=""
operation_parameters_collection_type["basketInfo:::id"]=""
operation_parameters_collection_type["basketInfo:::store_id"]=""
operation_parameters_collection_type["basketInfo:::response_fields"]=""
operation_parameters_collection_type["basketInfo:::params"]=""
operation_parameters_collection_type["basketInfo:::exclude"]=""
operation_parameters_collection_type["basketItemAdd:::customer_id"]=""
operation_parameters_collection_type["basketItemAdd:::product_id"]=""
operation_parameters_collection_type["basketItemAdd:::variant_id"]=""
operation_parameters_collection_type["basketItemAdd:::quantity"]=""
operation_parameters_collection_type["basketItemAdd:::store_id"]=""
operation_parameters_collection_type["basketLiveShippingServiceCreate:::name"]=""
operation_parameters_collection_type["basketLiveShippingServiceCreate:::callback"]=""
operation_parameters_collection_type["basketLiveShippingServiceCreate:::store_id"]=""
operation_parameters_collection_type["basketLiveShippingServiceDelete:::id"]=""
operation_parameters_collection_type["basketLiveShippingServiceList:::start"]=""
operation_parameters_collection_type["basketLiveShippingServiceList:::count"]=""
operation_parameters_collection_type["basketLiveShippingServiceList:::store_id"]=""
operation_parameters_collection_type["batchJobList:::count"]=""
operation_parameters_collection_type["batchJobList:::page_cursor"]=""
operation_parameters_collection_type["batchJobList:::ids"]=""
operation_parameters_collection_type["batchJobList:::created_from"]=""
operation_parameters_collection_type["batchJobList:::created_to"]=""
operation_parameters_collection_type["batchJobList:::processed_from"]=""
operation_parameters_collection_type["batchJobList:::processed_to"]=""
operation_parameters_collection_type["batchJobList:::response_fields"]=""
operation_parameters_collection_type["batchJobResult:::id"]=""
operation_parameters_collection_type["bridgeDownload:::whitelabel"]=""
operation_parameters_collection_type["cartCatalogPriceRulesList:::start"]=""
operation_parameters_collection_type["cartCatalogPriceRulesList:::count"]=""
operation_parameters_collection_type["cartCatalogPriceRulesList:::page_cursor"]=""
operation_parameters_collection_type["cartCatalogPriceRulesList:::ids"]=""
operation_parameters_collection_type["cartCatalogPriceRulesList:::response_fields"]=""
operation_parameters_collection_type["cartCatalogPriceRulesList:::params"]=""
operation_parameters_collection_type["cartCatalogPriceRulesList:::exclude"]=""
operation_parameters_collection_type["cartCouponAdd:::CartCouponAdd"]=""
operation_parameters_collection_type["cartCouponConditionAdd:::coupon_id"]=""
operation_parameters_collection_type["cartCouponConditionAdd:::entity"]=""
operation_parameters_collection_type["cartCouponConditionAdd:::key"]=""
operation_parameters_collection_type["cartCouponConditionAdd:::operator"]=""
operation_parameters_collection_type["cartCouponConditionAdd:::value"]=""
operation_parameters_collection_type["cartCouponConditionAdd:::target"]=""
operation_parameters_collection_type["cartCouponConditionAdd:::include_tax"]=""
operation_parameters_collection_type["cartCouponConditionAdd:::include_shipping"]=""
operation_parameters_collection_type["cartCouponConditionAdd:::store_id"]=""
operation_parameters_collection_type["cartCouponCount:::store_id"]=""
operation_parameters_collection_type["cartCouponCount:::avail"]=""
operation_parameters_collection_type["cartCouponCount:::date_start_from"]=""
operation_parameters_collection_type["cartCouponCount:::date_start_to"]=""
operation_parameters_collection_type["cartCouponCount:::date_end_from"]=""
operation_parameters_collection_type["cartCouponCount:::date_end_to"]=""
operation_parameters_collection_type["cartCouponDelete:::id"]=""
operation_parameters_collection_type["cartCouponDelete:::store_id"]=""
operation_parameters_collection_type["cartCouponList:::start"]=""
operation_parameters_collection_type["cartCouponList:::count"]=""
operation_parameters_collection_type["cartCouponList:::page_cursor"]=""
operation_parameters_collection_type["cartCouponList:::coupons_ids"]=""
operation_parameters_collection_type["cartCouponList:::store_id"]=""
operation_parameters_collection_type["cartCouponList:::lang_id"]=""
operation_parameters_collection_type["cartCouponList:::avail"]=""
operation_parameters_collection_type["cartCouponList:::date_start_from"]=""
operation_parameters_collection_type["cartCouponList:::date_start_to"]=""
operation_parameters_collection_type["cartCouponList:::date_end_from"]=""
operation_parameters_collection_type["cartCouponList:::date_end_to"]=""
operation_parameters_collection_type["cartCouponList:::response_fields"]=""
operation_parameters_collection_type["cartCouponList:::params"]=""
operation_parameters_collection_type["cartCouponList:::exclude"]=""
operation_parameters_collection_type["cartDelete:::delete_bridge"]=""
operation_parameters_collection_type["cartGiftcardAdd:::amount"]=""
operation_parameters_collection_type["cartGiftcardAdd:::code"]=""
operation_parameters_collection_type["cartGiftcardAdd:::owner_email"]=""
operation_parameters_collection_type["cartGiftcardAdd:::recipient_email"]=""
operation_parameters_collection_type["cartGiftcardAdd:::recipient_name"]=""
operation_parameters_collection_type["cartGiftcardAdd:::owner_name"]=""
operation_parameters_collection_type["cartGiftcardCount:::store_id"]=""
operation_parameters_collection_type["cartGiftcardDelete:::id"]=""
operation_parameters_collection_type["cartGiftcardList:::start"]=""
operation_parameters_collection_type["cartGiftcardList:::count"]=""
operation_parameters_collection_type["cartGiftcardList:::page_cursor"]=""
operation_parameters_collection_type["cartGiftcardList:::store_id"]=""
operation_parameters_collection_type["cartGiftcardList:::response_fields"]=""
operation_parameters_collection_type["cartGiftcardList:::params"]=""
operation_parameters_collection_type["cartGiftcardList:::exclude"]=""
operation_parameters_collection_type["cartInfo:::store_id"]=""
operation_parameters_collection_type["cartInfo:::response_fields"]=""
operation_parameters_collection_type["cartInfo:::params"]=""
operation_parameters_collection_type["cartInfo:::exclude"]=""
operation_parameters_collection_type["cartMetaDataList:::entity_id"]=""
operation_parameters_collection_type["cartMetaDataList:::count"]=""
operation_parameters_collection_type["cartMetaDataList:::page_cursor"]=""
operation_parameters_collection_type["cartMetaDataList:::entity"]=""
operation_parameters_collection_type["cartMetaDataList:::store_id"]=""
operation_parameters_collection_type["cartMetaDataList:::lang_id"]=""
operation_parameters_collection_type["cartMetaDataList:::key"]=""
operation_parameters_collection_type["cartMetaDataList:::response_fields"]=""
operation_parameters_collection_type["cartMetaDataList:::params"]=""
operation_parameters_collection_type["cartMetaDataList:::exclude"]=""
operation_parameters_collection_type["cartMetaDataSet:::entity_id"]=""
operation_parameters_collection_type["cartMetaDataSet:::key"]=""
operation_parameters_collection_type["cartMetaDataSet:::value"]=""
operation_parameters_collection_type["cartMetaDataSet:::namespace"]=""
operation_parameters_collection_type["cartMetaDataSet:::entity"]=""
operation_parameters_collection_type["cartMetaDataSet:::store_id"]=""
operation_parameters_collection_type["cartMetaDataSet:::lang_id"]=""
operation_parameters_collection_type["cartMetaDataUnset:::entity_id"]=""
operation_parameters_collection_type["cartMetaDataUnset:::key"]=""
operation_parameters_collection_type["cartMetaDataUnset:::id"]=""
operation_parameters_collection_type["cartMetaDataUnset:::entity"]=""
operation_parameters_collection_type["cartMetaDataUnset:::store_id"]=""
operation_parameters_collection_type["cartPluginList:::start"]=""
operation_parameters_collection_type["cartPluginList:::count"]=""
operation_parameters_collection_type["cartPluginList:::store_id"]=""
operation_parameters_collection_type["cartScriptAdd:::name"]=""
operation_parameters_collection_type["cartScriptAdd:::description"]=""
operation_parameters_collection_type["cartScriptAdd:::html"]=""
operation_parameters_collection_type["cartScriptAdd:::src"]=""
operation_parameters_collection_type["cartScriptAdd:::load_method"]=""
operation_parameters_collection_type["cartScriptAdd:::scope"]=""
operation_parameters_collection_type["cartScriptAdd:::events"]=""
operation_parameters_collection_type["cartScriptAdd:::store_id"]=""
operation_parameters_collection_type["cartScriptDelete:::id"]=""
operation_parameters_collection_type["cartScriptDelete:::store_id"]=""
operation_parameters_collection_type["cartScriptList:::start"]=""
operation_parameters_collection_type["cartScriptList:::count"]=""
operation_parameters_collection_type["cartScriptList:::page_cursor"]=""
operation_parameters_collection_type["cartScriptList:::script_ids"]=""
operation_parameters_collection_type["cartScriptList:::store_id"]=""
operation_parameters_collection_type["cartScriptList:::created_from"]=""
operation_parameters_collection_type["cartScriptList:::created_to"]=""
operation_parameters_collection_type["cartScriptList:::modified_from"]=""
operation_parameters_collection_type["cartScriptList:::modified_to"]=""
operation_parameters_collection_type["cartScriptList:::response_fields"]=""
operation_parameters_collection_type["cartScriptList:::params"]=""
operation_parameters_collection_type["cartScriptList:::exclude"]=""
operation_parameters_collection_type["cartShippingZonesList:::start"]=""
operation_parameters_collection_type["cartShippingZonesList:::count"]=""
operation_parameters_collection_type["cartShippingZonesList:::store_id"]=""
operation_parameters_collection_type["cartShippingZonesList:::response_fields"]=""
operation_parameters_collection_type["cartShippingZonesList:::params"]=""
operation_parameters_collection_type["cartShippingZonesList:::exclude"]=""
operation_parameters_collection_type["cartValidate:::validate_version"]=""
operation_parameters_collection_type["categoryAdd:::name"]=""
operation_parameters_collection_type["categoryAdd:::description"]=""
operation_parameters_collection_type["categoryAdd:::short_description"]=""
operation_parameters_collection_type["categoryAdd:::parent_id"]=""
operation_parameters_collection_type["categoryAdd:::avail"]=""
operation_parameters_collection_type["categoryAdd:::created_time"]=""
operation_parameters_collection_type["categoryAdd:::modified_time"]=""
operation_parameters_collection_type["categoryAdd:::sort_order"]=""
operation_parameters_collection_type["categoryAdd:::meta_title"]=""
operation_parameters_collection_type["categoryAdd:::meta_description"]=""
operation_parameters_collection_type["categoryAdd:::meta_keywords"]=""
operation_parameters_collection_type["categoryAdd:::seo_url"]=""
operation_parameters_collection_type["categoryAdd:::store_id"]=""
operation_parameters_collection_type["categoryAdd:::stores_ids"]=""
operation_parameters_collection_type["categoryAdd:::lang_id"]=""
operation_parameters_collection_type["categoryAddBatch:::CategoryAddBatch"]=""
operation_parameters_collection_type["categoryAssign:::category_id"]=""
operation_parameters_collection_type["categoryAssign:::product_id"]=""
operation_parameters_collection_type["categoryAssign:::store_id"]=""
operation_parameters_collection_type["categoryCount:::parent_id"]=""
operation_parameters_collection_type["categoryCount:::store_id"]=""
operation_parameters_collection_type["categoryCount:::lang_id"]=""
operation_parameters_collection_type["categoryCount:::avail"]=""
operation_parameters_collection_type["categoryCount:::created_from"]=""
operation_parameters_collection_type["categoryCount:::created_to"]=""
operation_parameters_collection_type["categoryCount:::modified_from"]=""
operation_parameters_collection_type["categoryCount:::modified_to"]=""
operation_parameters_collection_type["categoryCount:::product_type"]=""
operation_parameters_collection_type["categoryCount:::find_value"]=""
operation_parameters_collection_type["categoryCount:::find_where"]=""
operation_parameters_collection_type["categoryCount:::report_request_id"]=""
operation_parameters_collection_type["categoryCount:::disable_report_cache"]=""
operation_parameters_collection_type["categoryDelete:::id"]=""
operation_parameters_collection_type["categoryDelete:::store_id"]=""
operation_parameters_collection_type["categoryFind:::find_value"]=""
operation_parameters_collection_type["categoryFind:::find_where"]=""
operation_parameters_collection_type["categoryFind:::find_params"]=""
operation_parameters_collection_type["categoryFind:::store_id"]=""
operation_parameters_collection_type["categoryFind:::lang_id"]=""
operation_parameters_collection_type["categoryImageAdd:::category_id"]=""
operation_parameters_collection_type["categoryImageAdd:::image_name"]=""
operation_parameters_collection_type["categoryImageAdd:::url"]=""
operation_parameters_collection_type["categoryImageAdd:::type"]=""
operation_parameters_collection_type["categoryImageAdd:::store_id"]=""
operation_parameters_collection_type["categoryImageAdd:::label"]=""
operation_parameters_collection_type["categoryImageAdd:::mime"]=""
operation_parameters_collection_type["categoryImageAdd:::position"]=""
operation_parameters_collection_type["categoryImageDelete:::category_id"]=""
operation_parameters_collection_type["categoryImageDelete:::image_id"]=""
operation_parameters_collection_type["categoryImageDelete:::store_id"]=""
operation_parameters_collection_type["categoryInfo:::id"]=""
operation_parameters_collection_type["categoryInfo:::store_id"]=""
operation_parameters_collection_type["categoryInfo:::lang_id"]=""
operation_parameters_collection_type["categoryInfo:::schema_type"]=""
operation_parameters_collection_type["categoryInfo:::response_fields"]=""
operation_parameters_collection_type["categoryInfo:::params"]=""
operation_parameters_collection_type["categoryInfo:::exclude"]=""
operation_parameters_collection_type["categoryInfo:::report_request_id"]=""
operation_parameters_collection_type["categoryInfo:::disable_report_cache"]=""
operation_parameters_collection_type["categoryList:::start"]=""
operation_parameters_collection_type["categoryList:::count"]=""
operation_parameters_collection_type["categoryList:::page_cursor"]=""
operation_parameters_collection_type["categoryList:::store_id"]=""
operation_parameters_collection_type["categoryList:::lang_id"]=""
operation_parameters_collection_type["categoryList:::parent_id"]=""
operation_parameters_collection_type["categoryList:::avail"]=""
operation_parameters_collection_type["categoryList:::product_type"]=""
operation_parameters_collection_type["categoryList:::created_from"]=""
operation_parameters_collection_type["categoryList:::created_to"]=""
operation_parameters_collection_type["categoryList:::modified_from"]=""
operation_parameters_collection_type["categoryList:::modified_to"]=""
operation_parameters_collection_type["categoryList:::find_value"]=""
operation_parameters_collection_type["categoryList:::find_where"]=""
operation_parameters_collection_type["categoryList:::response_fields"]=""
operation_parameters_collection_type["categoryList:::params"]=""
operation_parameters_collection_type["categoryList:::exclude"]=""
operation_parameters_collection_type["categoryList:::report_request_id"]=""
operation_parameters_collection_type["categoryList:::disable_report_cache"]=""
operation_parameters_collection_type["categoryList:::disable_cache"]=""
operation_parameters_collection_type["categoryUnassign:::category_id"]=""
operation_parameters_collection_type["categoryUnassign:::product_id"]=""
operation_parameters_collection_type["categoryUnassign:::store_id"]=""
operation_parameters_collection_type["categoryUpdate:::id"]=""
operation_parameters_collection_type["categoryUpdate:::name"]=""
operation_parameters_collection_type["categoryUpdate:::description"]=""
operation_parameters_collection_type["categoryUpdate:::short_description"]=""
operation_parameters_collection_type["categoryUpdate:::parent_id"]=""
operation_parameters_collection_type["categoryUpdate:::avail"]=""
operation_parameters_collection_type["categoryUpdate:::sort_order"]=""
operation_parameters_collection_type["categoryUpdate:::modified_time"]=""
operation_parameters_collection_type["categoryUpdate:::meta_title"]=""
operation_parameters_collection_type["categoryUpdate:::meta_description"]=""
operation_parameters_collection_type["categoryUpdate:::meta_keywords"]=""
operation_parameters_collection_type["categoryUpdate:::seo_url"]=""
operation_parameters_collection_type["categoryUpdate:::store_id"]=""
operation_parameters_collection_type["categoryUpdate:::stores_ids"]=""
operation_parameters_collection_type["categoryUpdate:::lang_id"]=""
operation_parameters_collection_type["customerAdd:::CustomerAdd"]=""
operation_parameters_collection_type["customerAddressAdd:::CustomerAddressAdd"]=""
operation_parameters_collection_type["customerAttributeList:::customer_id"]=""
operation_parameters_collection_type["customerAttributeList:::count"]=""
operation_parameters_collection_type["customerAttributeList:::page_cursor"]=""
operation_parameters_collection_type["customerAttributeList:::store_id"]=""
operation_parameters_collection_type["customerAttributeList:::lang_id"]=""
operation_parameters_collection_type["customerAttributeList:::response_fields"]=""
operation_parameters_collection_type["customerAttributeList:::params"]=""
operation_parameters_collection_type["customerAttributeList:::exclude"]=""
operation_parameters_collection_type["customerCount:::ids"]=""
operation_parameters_collection_type["customerCount:::since_id"]=""
operation_parameters_collection_type["customerCount:::customer_list_id"]=""
operation_parameters_collection_type["customerCount:::group_id"]=""
operation_parameters_collection_type["customerCount:::store_id"]=""
operation_parameters_collection_type["customerCount:::avail"]=""
operation_parameters_collection_type["customerCount:::include_guests"]=""
operation_parameters_collection_type["customerCount:::find_value"]=""
operation_parameters_collection_type["customerCount:::find_where"]=""
operation_parameters_collection_type["customerCount:::created_from"]=""
operation_parameters_collection_type["customerCount:::created_to"]=""
operation_parameters_collection_type["customerCount:::modified_from"]=""
operation_parameters_collection_type["customerCount:::modified_to"]=""
operation_parameters_collection_type["customerDelete:::id"]=""
operation_parameters_collection_type["customerFind:::find_value"]=""
operation_parameters_collection_type["customerFind:::find_where"]=""
operation_parameters_collection_type["customerFind:::find_params"]=""
operation_parameters_collection_type["customerFind:::store_id"]=""
operation_parameters_collection_type["customerFind:::include_guests"]=""
operation_parameters_collection_type["customerGroupAdd:::name"]=""
operation_parameters_collection_type["customerGroupAdd:::store_id"]=""
operation_parameters_collection_type["customerGroupAdd:::stores_ids"]=""
operation_parameters_collection_type["customerGroupList:::start"]=""
operation_parameters_collection_type["customerGroupList:::count"]=""
operation_parameters_collection_type["customerGroupList:::page_cursor"]=""
operation_parameters_collection_type["customerGroupList:::group_ids"]=""
operation_parameters_collection_type["customerGroupList:::store_id"]=""
operation_parameters_collection_type["customerGroupList:::lang_id"]=""
operation_parameters_collection_type["customerGroupList:::response_fields"]=""
operation_parameters_collection_type["customerGroupList:::params"]=""
operation_parameters_collection_type["customerGroupList:::exclude"]=""
operation_parameters_collection_type["customerGroupList:::disable_cache"]=""
operation_parameters_collection_type["customerInfo:::id"]=""
operation_parameters_collection_type["customerInfo:::store_id"]=""
operation_parameters_collection_type["customerInfo:::response_fields"]=""
operation_parameters_collection_type["customerInfo:::params"]=""
operation_parameters_collection_type["customerInfo:::exclude"]=""
operation_parameters_collection_type["customerList:::start"]=""
operation_parameters_collection_type["customerList:::count"]=""
operation_parameters_collection_type["customerList:::page_cursor"]=""
operation_parameters_collection_type["customerList:::ids"]=""
operation_parameters_collection_type["customerList:::since_id"]=""
operation_parameters_collection_type["customerList:::customer_list_id"]=""
operation_parameters_collection_type["customerList:::group_id"]=""
operation_parameters_collection_type["customerList:::store_id"]=""
operation_parameters_collection_type["customerList:::avail"]=""
operation_parameters_collection_type["customerList:::include_guests"]=""
operation_parameters_collection_type["customerList:::find_value"]=""
operation_parameters_collection_type["customerList:::find_where"]=""
operation_parameters_collection_type["customerList:::created_from"]=""
operation_parameters_collection_type["customerList:::created_to"]=""
operation_parameters_collection_type["customerList:::modified_from"]=""
operation_parameters_collection_type["customerList:::modified_to"]=""
operation_parameters_collection_type["customerList:::sort_by"]=""
operation_parameters_collection_type["customerList:::sort_direction"]=""
operation_parameters_collection_type["customerList:::response_fields"]=""
operation_parameters_collection_type["customerList:::params"]=""
operation_parameters_collection_type["customerList:::exclude"]=""
operation_parameters_collection_type["customerUpdate:::CustomerUpdate"]=""
operation_parameters_collection_type["customerWishlistList:::customer_id"]=""
operation_parameters_collection_type["customerWishlistList:::start"]=""
operation_parameters_collection_type["customerWishlistList:::count"]=""
operation_parameters_collection_type["customerWishlistList:::page_cursor"]=""
operation_parameters_collection_type["customerWishlistList:::id"]=""
operation_parameters_collection_type["customerWishlistList:::store_id"]=""
operation_parameters_collection_type["customerWishlistList:::response_fields"]=""
operation_parameters_collection_type["marketplaceProductFind:::count"]=""
operation_parameters_collection_type["marketplaceProductFind:::page_cursor"]=""
operation_parameters_collection_type["marketplaceProductFind:::keyword"]=""
operation_parameters_collection_type["marketplaceProductFind:::categories_ids"]=""
operation_parameters_collection_type["marketplaceProductFind:::store_id"]=""
operation_parameters_collection_type["marketplaceProductFind:::asin"]=""
operation_parameters_collection_type["marketplaceProductFind:::ean"]=""
operation_parameters_collection_type["marketplaceProductFind:::gtin"]=""
operation_parameters_collection_type["marketplaceProductFind:::upc"]=""
operation_parameters_collection_type["marketplaceProductFind:::mpn"]=""
operation_parameters_collection_type["marketplaceProductFind:::isbn"]=""
operation_parameters_collection_type["marketplaceProductFind:::response_fields"]=""
operation_parameters_collection_type["marketplaceProductFind:::params"]=""
operation_parameters_collection_type["marketplaceProductFind:::exclude"]=""
operation_parameters_collection_type["orderAbandonedList:::start"]=""
operation_parameters_collection_type["orderAbandonedList:::count"]=""
operation_parameters_collection_type["orderAbandonedList:::page_cursor"]=""
operation_parameters_collection_type["orderAbandonedList:::customer_id"]=""
operation_parameters_collection_type["orderAbandonedList:::customer_email"]=""
operation_parameters_collection_type["orderAbandonedList:::store_id"]=""
operation_parameters_collection_type["orderAbandonedList:::created_from"]=""
operation_parameters_collection_type["orderAbandonedList:::created_to"]=""
operation_parameters_collection_type["orderAbandonedList:::modified_from"]=""
operation_parameters_collection_type["orderAbandonedList:::modified_to"]=""
operation_parameters_collection_type["orderAbandonedList:::skip_empty_email"]=""
operation_parameters_collection_type["orderAbandonedList:::response_fields"]=""
operation_parameters_collection_type["orderAbandonedList:::params"]=""
operation_parameters_collection_type["orderAbandonedList:::exclude"]=""
operation_parameters_collection_type["orderAdd:::OrderAdd"]=""
operation_parameters_collection_type["orderCount:::order_ids"]=""
operation_parameters_collection_type["orderCount:::ids"]=""
operation_parameters_collection_type["orderCount:::customer_id"]=""
operation_parameters_collection_type["orderCount:::store_id"]=""
operation_parameters_collection_type["orderCount:::customer_email"]=""
operation_parameters_collection_type["orderCount:::order_status"]=""
operation_parameters_collection_type["orderCount:::order_status_ids"]="multi"
operation_parameters_collection_type["orderCount:::ebay_order_status"]=""
operation_parameters_collection_type["orderCount:::financial_status"]=""
operation_parameters_collection_type["orderCount:::financial_status_ids"]="multi"
operation_parameters_collection_type["orderCount:::fulfillment_channel"]=""
operation_parameters_collection_type["orderCount:::fulfillment_status"]=""
operation_parameters_collection_type["orderCount:::shipping_method"]=""
operation_parameters_collection_type["orderCount:::delivery_method"]=""
operation_parameters_collection_type["orderCount:::tags"]=""
operation_parameters_collection_type["orderCount:::ship_node_type"]=""
operation_parameters_collection_type["orderCount:::created_from"]=""
operation_parameters_collection_type["orderCount:::created_to"]=""
operation_parameters_collection_type["orderCount:::modified_from"]=""
operation_parameters_collection_type["orderCount:::modified_to"]=""
operation_parameters_collection_type["orderFulfillmentStatusList:::action"]=""
operation_parameters_collection_type["orderInfo:::id"]=""
operation_parameters_collection_type["orderInfo:::order_id"]=""
operation_parameters_collection_type["orderInfo:::store_id"]=""
operation_parameters_collection_type["orderInfo:::params"]=""
operation_parameters_collection_type["orderInfo:::response_fields"]=""
operation_parameters_collection_type["orderInfo:::exclude"]=""
operation_parameters_collection_type["orderInfo:::enable_cache"]=""
operation_parameters_collection_type["orderInfo:::use_latest_api_version"]=""
operation_parameters_collection_type["orderList:::start"]=""
operation_parameters_collection_type["orderList:::count"]=""
operation_parameters_collection_type["orderList:::page_cursor"]=""
operation_parameters_collection_type["orderList:::ids"]=""
operation_parameters_collection_type["orderList:::order_ids"]=""
operation_parameters_collection_type["orderList:::since_id"]=""
operation_parameters_collection_type["orderList:::store_id"]=""
operation_parameters_collection_type["orderList:::customer_id"]=""
operation_parameters_collection_type["orderList:::customer_email"]=""
operation_parameters_collection_type["orderList:::basket_id"]=""
operation_parameters_collection_type["orderList:::currency_id"]=""
operation_parameters_collection_type["orderList:::phone"]=""
operation_parameters_collection_type["orderList:::order_status"]=""
operation_parameters_collection_type["orderList:::order_status_ids"]="multi"
operation_parameters_collection_type["orderList:::ebay_order_status"]=""
operation_parameters_collection_type["orderList:::financial_status"]=""
operation_parameters_collection_type["orderList:::financial_status_ids"]="multi"
operation_parameters_collection_type["orderList:::fulfillment_status"]=""
operation_parameters_collection_type["orderList:::return_status"]=""
operation_parameters_collection_type["orderList:::fulfillment_channel"]=""
operation_parameters_collection_type["orderList:::shipping_method"]=""
operation_parameters_collection_type["orderList:::skip_order_ids"]=""
operation_parameters_collection_type["orderList:::is_deleted"]=""
operation_parameters_collection_type["orderList:::shipping_country_iso3"]=""
operation_parameters_collection_type["orderList:::delivery_method"]=""
operation_parameters_collection_type["orderList:::ship_node_type"]=""
operation_parameters_collection_type["orderList:::created_to"]=""
operation_parameters_collection_type["orderList:::created_from"]=""
operation_parameters_collection_type["orderList:::modified_to"]=""
operation_parameters_collection_type["orderList:::modified_from"]=""
operation_parameters_collection_type["orderList:::tags"]=""
operation_parameters_collection_type["orderList:::sort_by"]=""
operation_parameters_collection_type["orderList:::sort_direction"]=""
operation_parameters_collection_type["orderList:::params"]=""
operation_parameters_collection_type["orderList:::response_fields"]=""
operation_parameters_collection_type["orderList:::exclude"]=""
operation_parameters_collection_type["orderList:::enable_cache"]=""
operation_parameters_collection_type["orderList:::use_latest_api_version"]=""
operation_parameters_collection_type["orderPreestimateShippingList:::OrderPreestimateShippingList"]=""
operation_parameters_collection_type["orderRefundAdd:::OrderRefundAdd"]=""
operation_parameters_collection_type["orderReturnAdd:::OrderReturnAdd"]=""
operation_parameters_collection_type["orderReturnDelete:::return_id"]=""
operation_parameters_collection_type["orderReturnDelete:::order_id"]=""
operation_parameters_collection_type["orderReturnDelete:::store_id"]=""
operation_parameters_collection_type["orderReturnUpdate:::OrderReturnUpdate"]=""
operation_parameters_collection_type["orderShipmentAdd:::OrderShipmentAdd"]=""
operation_parameters_collection_type["orderShipmentAddBatch:::OrderShipmentAddBatch"]=""
operation_parameters_collection_type["orderShipmentDelete:::shipment_id"]=""
operation_parameters_collection_type["orderShipmentDelete:::order_id"]=""
operation_parameters_collection_type["orderShipmentDelete:::store_id"]=""
operation_parameters_collection_type["orderShipmentInfo:::id"]=""
operation_parameters_collection_type["orderShipmentInfo:::order_id"]=""
operation_parameters_collection_type["orderShipmentInfo:::start"]=""
operation_parameters_collection_type["orderShipmentInfo:::store_id"]=""
operation_parameters_collection_type["orderShipmentInfo:::response_fields"]=""
operation_parameters_collection_type["orderShipmentInfo:::params"]=""
operation_parameters_collection_type["orderShipmentInfo:::exclude"]=""
operation_parameters_collection_type["orderShipmentList:::order_id"]=""
operation_parameters_collection_type["orderShipmentList:::start"]=""
operation_parameters_collection_type["orderShipmentList:::count"]=""
operation_parameters_collection_type["orderShipmentList:::page_cursor"]=""
operation_parameters_collection_type["orderShipmentList:::store_id"]=""
operation_parameters_collection_type["orderShipmentList:::created_from"]=""
operation_parameters_collection_type["orderShipmentList:::created_to"]=""
operation_parameters_collection_type["orderShipmentList:::modified_from"]=""
operation_parameters_collection_type["orderShipmentList:::modified_to"]=""
operation_parameters_collection_type["orderShipmentList:::response_fields"]=""
operation_parameters_collection_type["orderShipmentList:::params"]=""
operation_parameters_collection_type["orderShipmentList:::exclude"]=""
operation_parameters_collection_type["orderShipmentTrackingAdd:::OrderShipmentTrackingAdd"]=""
operation_parameters_collection_type["orderShipmentUpdate:::OrderShipmentUpdate"]=""
operation_parameters_collection_type["orderStatusList:::store_id"]=""
operation_parameters_collection_type["orderStatusList:::action"]=""
operation_parameters_collection_type["orderStatusList:::response_fields"]=""
operation_parameters_collection_type["orderTransactionList:::order_ids"]=""
operation_parameters_collection_type["orderTransactionList:::count"]=""
operation_parameters_collection_type["orderTransactionList:::page_cursor"]=""
operation_parameters_collection_type["orderTransactionList:::store_id"]=""
operation_parameters_collection_type["orderTransactionList:::params"]=""
operation_parameters_collection_type["orderTransactionList:::response_fields"]=""
operation_parameters_collection_type["orderTransactionList:::exclude"]=""
operation_parameters_collection_type["orderUpdate:::order_id"]=""
operation_parameters_collection_type["orderUpdate:::store_id"]=""
operation_parameters_collection_type["orderUpdate:::order_status"]=""
operation_parameters_collection_type["orderUpdate:::financial_status"]=""
operation_parameters_collection_type["orderUpdate:::fulfillment_status"]=""
operation_parameters_collection_type["orderUpdate:::cancellation_reason"]=""
operation_parameters_collection_type["orderUpdate:::order_payment_method"]=""
operation_parameters_collection_type["orderUpdate:::comment"]=""
operation_parameters_collection_type["orderUpdate:::admin_comment"]=""
operation_parameters_collection_type["orderUpdate:::admin_private_comment"]=""
operation_parameters_collection_type["orderUpdate:::invoice_admin_comment"]=""
operation_parameters_collection_type["orderUpdate:::date_modified"]=""
operation_parameters_collection_type["orderUpdate:::date_finished"]=""
operation_parameters_collection_type["orderUpdate:::send_notifications"]=""
operation_parameters_collection_type["orderUpdate:::create_invoice"]=""
operation_parameters_collection_type["orderUpdate:::origin"]=""
operation_parameters_collection_type["orderUpdate:::tags"]=""
operation_parameters_collection_type["productAdd:::ProductAdd"]=""
operation_parameters_collection_type["productAddBatch:::ProductAddBatch"]=""
operation_parameters_collection_type["productAttributeList:::product_id"]=""
operation_parameters_collection_type["productAttributeList:::start"]=""
operation_parameters_collection_type["productAttributeList:::count"]=""
operation_parameters_collection_type["productAttributeList:::page_cursor"]=""
operation_parameters_collection_type["productAttributeList:::attribute_id"]=""
operation_parameters_collection_type["productAttributeList:::variant_id"]=""
operation_parameters_collection_type["productAttributeList:::attribute_group_id"]=""
operation_parameters_collection_type["productAttributeList:::lang_id"]=""
operation_parameters_collection_type["productAttributeList:::store_id"]=""
operation_parameters_collection_type["productAttributeList:::set_name"]=""
operation_parameters_collection_type["productAttributeList:::sort_by"]=""
operation_parameters_collection_type["productAttributeList:::sort_direction"]=""
operation_parameters_collection_type["productAttributeList:::response_fields"]=""
operation_parameters_collection_type["productAttributeList:::params"]=""
operation_parameters_collection_type["productAttributeList:::exclude"]=""
operation_parameters_collection_type["productAttributeValueSet:::product_id"]=""
operation_parameters_collection_type["productAttributeValueSet:::attribute_id"]=""
operation_parameters_collection_type["productAttributeValueSet:::attribute_group_id"]=""
operation_parameters_collection_type["productAttributeValueSet:::attribute_name"]=""
operation_parameters_collection_type["productAttributeValueSet:::value"]=""
operation_parameters_collection_type["productAttributeValueSet:::value_id"]=""
operation_parameters_collection_type["productAttributeValueSet:::lang_id"]=""
operation_parameters_collection_type["productAttributeValueSet:::store_id"]=""
operation_parameters_collection_type["productAttributeValueUnset:::product_id"]=""
operation_parameters_collection_type["productAttributeValueUnset:::attribute_id"]=""
operation_parameters_collection_type["productAttributeValueUnset:::store_id"]=""
operation_parameters_collection_type["productAttributeValueUnset:::include_default"]=""
operation_parameters_collection_type["productAttributeValueUnset:::reindex"]=""
operation_parameters_collection_type["productAttributeValueUnset:::clear_cache"]=""
operation_parameters_collection_type["productBrandList:::start"]=""
operation_parameters_collection_type["productBrandList:::count"]=""
operation_parameters_collection_type["productBrandList:::page_cursor"]=""
operation_parameters_collection_type["productBrandList:::brand_ids"]=""
operation_parameters_collection_type["productBrandList:::category_id"]=""
operation_parameters_collection_type["productBrandList:::parent_id"]=""
operation_parameters_collection_type["productBrandList:::store_id"]=""
operation_parameters_collection_type["productBrandList:::lang_id"]=""
operation_parameters_collection_type["productBrandList:::find_where"]=""
operation_parameters_collection_type["productBrandList:::find_value"]=""
operation_parameters_collection_type["productBrandList:::created_from"]=""
operation_parameters_collection_type["productBrandList:::created_to"]=""
operation_parameters_collection_type["productBrandList:::modified_from"]=""
operation_parameters_collection_type["productBrandList:::modified_to"]=""
operation_parameters_collection_type["productBrandList:::response_fields"]=""
operation_parameters_collection_type["productBrandList:::params"]=""
operation_parameters_collection_type["productBrandList:::exclude"]=""
operation_parameters_collection_type["productChildItemFind:::find_value"]=""
operation_parameters_collection_type["productChildItemFind:::find_where"]=""
operation_parameters_collection_type["productChildItemFind:::find_params"]=""
operation_parameters_collection_type["productChildItemFind:::store_id"]=""
operation_parameters_collection_type["productChildItemInfo:::product_id"]=""
operation_parameters_collection_type["productChildItemInfo:::id"]=""
operation_parameters_collection_type["productChildItemInfo:::store_id"]=""
operation_parameters_collection_type["productChildItemInfo:::lang_id"]=""
operation_parameters_collection_type["productChildItemInfo:::currency_id"]=""
operation_parameters_collection_type["productChildItemInfo:::response_fields"]=""
operation_parameters_collection_type["productChildItemInfo:::params"]=""
operation_parameters_collection_type["productChildItemInfo:::exclude"]=""
operation_parameters_collection_type["productChildItemInfo:::use_latest_api_version"]=""
operation_parameters_collection_type["productChildItemList:::start"]=""
operation_parameters_collection_type["productChildItemList:::count"]=""
operation_parameters_collection_type["productChildItemList:::page_cursor"]=""
operation_parameters_collection_type["productChildItemList:::product_id"]=""
operation_parameters_collection_type["productChildItemList:::product_ids"]=""
operation_parameters_collection_type["productChildItemList:::sku"]=""
operation_parameters_collection_type["productChildItemList:::store_id"]=""
operation_parameters_collection_type["productChildItemList:::lang_id"]=""
operation_parameters_collection_type["productChildItemList:::currency_id"]=""
operation_parameters_collection_type["productChildItemList:::avail_sale"]=""
operation_parameters_collection_type["productChildItemList:::find_value"]=""
operation_parameters_collection_type["productChildItemList:::find_where"]=""
operation_parameters_collection_type["productChildItemList:::created_from"]=""
operation_parameters_collection_type["productChildItemList:::created_to"]=""
operation_parameters_collection_type["productChildItemList:::modified_from"]=""
operation_parameters_collection_type["productChildItemList:::modified_to"]=""
operation_parameters_collection_type["productChildItemList:::return_global"]=""
operation_parameters_collection_type["productChildItemList:::response_fields"]=""
operation_parameters_collection_type["productChildItemList:::params"]=""
operation_parameters_collection_type["productChildItemList:::exclude"]=""
operation_parameters_collection_type["productChildItemList:::report_request_id"]=""
operation_parameters_collection_type["productChildItemList:::disable_report_cache"]=""
operation_parameters_collection_type["productChildItemList:::use_latest_api_version"]=""
operation_parameters_collection_type["productCount:::product_ids"]=""
operation_parameters_collection_type["productCount:::since_id"]=""
operation_parameters_collection_type["productCount:::categories_ids"]=""
operation_parameters_collection_type["productCount:::category_id"]=""
operation_parameters_collection_type["productCount:::store_id"]=""
operation_parameters_collection_type["productCount:::lang_id"]=""
operation_parameters_collection_type["productCount:::avail_view"]=""
operation_parameters_collection_type["productCount:::avail_sale"]=""
operation_parameters_collection_type["productCount:::created_from"]=""
operation_parameters_collection_type["productCount:::created_to"]=""
operation_parameters_collection_type["productCount:::modified_from"]=""
operation_parameters_collection_type["productCount:::modified_to"]=""
operation_parameters_collection_type["productCount:::brand_name"]=""
operation_parameters_collection_type["productCount:::product_attributes"]="multi"
operation_parameters_collection_type["productCount:::status"]=""
operation_parameters_collection_type["productCount:::type"]=""
operation_parameters_collection_type["productCount:::visible"]=""
operation_parameters_collection_type["productCount:::find_value"]=""
operation_parameters_collection_type["productCount:::find_where"]=""
operation_parameters_collection_type["productCount:::report_request_id"]=""
operation_parameters_collection_type["productCount:::return_global"]=""
operation_parameters_collection_type["productCount:::disable_report_cache"]=""
operation_parameters_collection_type["productCount:::use_latest_api_version"]=""
operation_parameters_collection_type["productCurrencyAdd:::iso3"]=""
operation_parameters_collection_type["productCurrencyAdd:::rate"]=""
operation_parameters_collection_type["productCurrencyAdd:::name"]=""
operation_parameters_collection_type["productCurrencyAdd:::avail"]=""
operation_parameters_collection_type["productCurrencyAdd:::symbol_left"]=""
operation_parameters_collection_type["productCurrencyAdd:::symbol_right"]=""
operation_parameters_collection_type["productCurrencyAdd:::default"]=""
operation_parameters_collection_type["productCurrencyList:::start"]=""
operation_parameters_collection_type["productCurrencyList:::count"]=""
operation_parameters_collection_type["productCurrencyList:::page_cursor"]=""
operation_parameters_collection_type["productCurrencyList:::default"]=""
operation_parameters_collection_type["productCurrencyList:::avail"]=""
operation_parameters_collection_type["productCurrencyList:::response_fields"]=""
operation_parameters_collection_type["productCurrencyList:::params"]=""
operation_parameters_collection_type["productCurrencyList:::exclude"]=""
operation_parameters_collection_type["productDelete:::id"]=""
operation_parameters_collection_type["productDelete:::store_id"]=""
operation_parameters_collection_type["productDeleteBatch:::ProductDeleteBatch"]=""
operation_parameters_collection_type["productFind:::find_value"]=""
operation_parameters_collection_type["productFind:::find_where"]=""
operation_parameters_collection_type["productFind:::find_params"]=""
operation_parameters_collection_type["productFind:::find_what"]=""
operation_parameters_collection_type["productFind:::lang_id"]=""
operation_parameters_collection_type["productFind:::store_id"]=""
operation_parameters_collection_type["productImageAdd:::ProductImageAdd"]=""
operation_parameters_collection_type["productImageDelete:::product_id"]=""
operation_parameters_collection_type["productImageDelete:::id"]=""
operation_parameters_collection_type["productImageDelete:::store_id"]=""
operation_parameters_collection_type["productImageUpdate:::product_id"]=""
operation_parameters_collection_type["productImageUpdate:::id"]=""
operation_parameters_collection_type["productImageUpdate:::variant_ids"]=""
operation_parameters_collection_type["productImageUpdate:::store_id"]=""
operation_parameters_collection_type["productImageUpdate:::lang_id"]=""
operation_parameters_collection_type["productImageUpdate:::image_name"]=""
operation_parameters_collection_type["productImageUpdate:::type"]=""
operation_parameters_collection_type["productImageUpdate:::label"]=""
operation_parameters_collection_type["productImageUpdate:::position"]=""
operation_parameters_collection_type["productImageUpdate:::hidden"]=""
operation_parameters_collection_type["productInfo:::id"]=""
operation_parameters_collection_type["productInfo:::store_id"]=""
operation_parameters_collection_type["productInfo:::lang_id"]=""
operation_parameters_collection_type["productInfo:::currency_id"]=""
operation_parameters_collection_type["productInfo:::response_fields"]=""
operation_parameters_collection_type["productInfo:::params"]=""
operation_parameters_collection_type["productInfo:::exclude"]=""
operation_parameters_collection_type["productInfo:::report_request_id"]=""
operation_parameters_collection_type["productInfo:::disable_report_cache"]=""
operation_parameters_collection_type["productInfo:::use_latest_api_version"]=""
operation_parameters_collection_type["productList:::start"]=""
operation_parameters_collection_type["productList:::count"]=""
operation_parameters_collection_type["productList:::page_cursor"]=""
operation_parameters_collection_type["productList:::product_ids"]=""
operation_parameters_collection_type["productList:::since_id"]=""
operation_parameters_collection_type["productList:::categories_ids"]=""
operation_parameters_collection_type["productList:::category_id"]=""
operation_parameters_collection_type["productList:::store_id"]=""
operation_parameters_collection_type["productList:::lang_id"]=""
operation_parameters_collection_type["productList:::currency_id"]=""
operation_parameters_collection_type["productList:::avail_view"]=""
operation_parameters_collection_type["productList:::avail_sale"]=""
operation_parameters_collection_type["productList:::created_from"]=""
operation_parameters_collection_type["productList:::created_to"]=""
operation_parameters_collection_type["productList:::modified_from"]=""
operation_parameters_collection_type["productList:::modified_to"]=""
operation_parameters_collection_type["productList:::sku"]=""
operation_parameters_collection_type["productList:::brand_name"]=""
operation_parameters_collection_type["productList:::product_attributes"]="multi"
operation_parameters_collection_type["productList:::status"]=""
operation_parameters_collection_type["productList:::type"]=""
operation_parameters_collection_type["productList:::visible"]=""
operation_parameters_collection_type["productList:::find_value"]=""
operation_parameters_collection_type["productList:::find_where"]=""
operation_parameters_collection_type["productList:::return_global"]=""
operation_parameters_collection_type["productList:::params"]=""
operation_parameters_collection_type["productList:::response_fields"]=""
operation_parameters_collection_type["productList:::exclude"]=""
operation_parameters_collection_type["productList:::sort_by"]=""
operation_parameters_collection_type["productList:::sort_direction"]=""
operation_parameters_collection_type["productList:::report_request_id"]=""
operation_parameters_collection_type["productList:::disable_cache"]=""
operation_parameters_collection_type["productList:::disable_report_cache"]=""
operation_parameters_collection_type["productList:::use_latest_api_version"]=""
operation_parameters_collection_type["productManufacturerAdd:::product_id"]=""
operation_parameters_collection_type["productManufacturerAdd:::manufacturer"]=""
operation_parameters_collection_type["productManufacturerAdd:::store_id"]=""
operation_parameters_collection_type["productOptionAdd:::ProductOptionAdd"]=""
operation_parameters_collection_type["productOptionAssign:::product_id"]=""
operation_parameters_collection_type["productOptionAssign:::option_id"]=""
operation_parameters_collection_type["productOptionAssign:::required"]=""
operation_parameters_collection_type["productOptionAssign:::sort_order"]=""
operation_parameters_collection_type["productOptionAssign:::option_values"]=""
operation_parameters_collection_type["productOptionAssign:::clear_cache"]=""
operation_parameters_collection_type["productOptionDelete:::option_id"]=""
operation_parameters_collection_type["productOptionDelete:::product_id"]=""
operation_parameters_collection_type["productOptionDelete:::store_id"]=""
operation_parameters_collection_type["productOptionList:::start"]=""
operation_parameters_collection_type["productOptionList:::count"]=""
operation_parameters_collection_type["productOptionList:::product_id"]=""
operation_parameters_collection_type["productOptionList:::lang_id"]=""
operation_parameters_collection_type["productOptionList:::store_id"]=""
operation_parameters_collection_type["productOptionList:::response_fields"]=""
operation_parameters_collection_type["productOptionList:::params"]=""
operation_parameters_collection_type["productOptionList:::exclude"]=""
operation_parameters_collection_type["productOptionValueAdd:::product_id"]=""
operation_parameters_collection_type["productOptionValueAdd:::option_id"]=""
operation_parameters_collection_type["productOptionValueAdd:::option_value"]=""
operation_parameters_collection_type["productOptionValueAdd:::sort_order"]=""
operation_parameters_collection_type["productOptionValueAdd:::display_value"]=""
operation_parameters_collection_type["productOptionValueAdd:::is_default"]=""
operation_parameters_collection_type["productOptionValueAdd:::clear_cache"]=""
operation_parameters_collection_type["productOptionValueAssign:::product_option_id"]=""
operation_parameters_collection_type["productOptionValueAssign:::option_value_id"]=""
operation_parameters_collection_type["productOptionValueAssign:::clear_cache"]=""
operation_parameters_collection_type["productOptionValueDelete:::option_id"]=""
operation_parameters_collection_type["productOptionValueDelete:::option_value_id"]=""
operation_parameters_collection_type["productOptionValueDelete:::product_id"]=""
operation_parameters_collection_type["productOptionValueDelete:::store_id"]=""
operation_parameters_collection_type["productOptionValueUpdate:::product_id"]=""
operation_parameters_collection_type["productOptionValueUpdate:::option_id"]=""
operation_parameters_collection_type["productOptionValueUpdate:::option_value_id"]=""
operation_parameters_collection_type["productOptionValueUpdate:::option_value"]=""
operation_parameters_collection_type["productOptionValueUpdate:::price"]=""
operation_parameters_collection_type["productOptionValueUpdate:::quantity"]=""
operation_parameters_collection_type["productOptionValueUpdate:::display_value"]=""
operation_parameters_collection_type["productOptionValueUpdate:::clear_cache"]=""
operation_parameters_collection_type["productPriceAdd:::ProductPriceAdd"]=""
operation_parameters_collection_type["productPriceDelete:::product_id"]=""
operation_parameters_collection_type["productPriceDelete:::group_prices"]=""
operation_parameters_collection_type["productPriceDelete:::store_id"]=""
operation_parameters_collection_type["productPriceUpdate:::ProductPriceUpdate"]=""
operation_parameters_collection_type["productReviewList:::product_id"]=""
operation_parameters_collection_type["productReviewList:::start"]=""
operation_parameters_collection_type["productReviewList:::count"]=""
operation_parameters_collection_type["productReviewList:::page_cursor"]=""
operation_parameters_collection_type["productReviewList:::ids"]=""
operation_parameters_collection_type["productReviewList:::store_id"]=""
operation_parameters_collection_type["productReviewList:::status"]=""
operation_parameters_collection_type["productReviewList:::response_fields"]=""
operation_parameters_collection_type["productReviewList:::params"]=""
operation_parameters_collection_type["productReviewList:::exclude"]=""
operation_parameters_collection_type["productStoreAssign:::product_id"]=""
operation_parameters_collection_type["productStoreAssign:::store_id"]=""
operation_parameters_collection_type["productTaxAdd:::ProductTaxAdd"]=""
operation_parameters_collection_type["productUpdate:::ProductUpdate"]=""
operation_parameters_collection_type["productUpdateBatch:::ProductUpdateBatch"]=""
operation_parameters_collection_type["productVariantAdd:::ProductVariantAdd"]=""
operation_parameters_collection_type["productVariantAddBatch:::ProductVariantAddBatch"]=""
operation_parameters_collection_type["productVariantDelete:::id"]=""
operation_parameters_collection_type["productVariantDelete:::product_id"]=""
operation_parameters_collection_type["productVariantDelete:::store_id"]=""
operation_parameters_collection_type["productVariantDeleteBatch:::ProductVariantDeleteBatch"]=""
operation_parameters_collection_type["productVariantImageAdd:::ProductVariantImageAdd"]=""
operation_parameters_collection_type["productVariantImageDelete:::product_id"]=""
operation_parameters_collection_type["productVariantImageDelete:::product_variant_id"]=""
operation_parameters_collection_type["productVariantImageDelete:::id"]=""
operation_parameters_collection_type["productVariantImageDelete:::store_id"]=""
operation_parameters_collection_type["productVariantPriceAdd:::ProductVariantPriceAdd"]=""
operation_parameters_collection_type["productVariantPriceDelete:::id"]=""
operation_parameters_collection_type["productVariantPriceDelete:::product_id"]=""
operation_parameters_collection_type["productVariantPriceDelete:::group_prices"]=""
operation_parameters_collection_type["productVariantPriceDelete:::store_id"]=""
operation_parameters_collection_type["productVariantPriceUpdate:::ProductVariantPriceUpdate"]=""
operation_parameters_collection_type["productVariantUpdate:::ProductVariantUpdate"]=""
operation_parameters_collection_type["productVariantUpdateBatch:::ProductVariantUpdateBatch"]=""
operation_parameters_collection_type["returnCount:::order_ids"]=""
operation_parameters_collection_type["returnCount:::customer_id"]=""
operation_parameters_collection_type["returnCount:::store_id"]=""
operation_parameters_collection_type["returnCount:::status"]=""
operation_parameters_collection_type["returnCount:::return_type"]=""
operation_parameters_collection_type["returnCount:::created_from"]=""
operation_parameters_collection_type["returnCount:::created_to"]=""
operation_parameters_collection_type["returnCount:::modified_from"]=""
operation_parameters_collection_type["returnCount:::modified_to"]=""
operation_parameters_collection_type["returnCount:::report_request_id"]=""
operation_parameters_collection_type["returnCount:::disable_report_cache"]=""
operation_parameters_collection_type["returnInfo:::id"]=""
operation_parameters_collection_type["returnInfo:::order_id"]=""
operation_parameters_collection_type["returnInfo:::store_id"]=""
operation_parameters_collection_type["returnInfo:::response_fields"]=""
operation_parameters_collection_type["returnInfo:::params"]=""
operation_parameters_collection_type["returnInfo:::exclude"]=""
operation_parameters_collection_type["returnList:::start"]=""
operation_parameters_collection_type["returnList:::count"]=""
operation_parameters_collection_type["returnList:::page_cursor"]=""
operation_parameters_collection_type["returnList:::order_id"]=""
operation_parameters_collection_type["returnList:::order_ids"]=""
operation_parameters_collection_type["returnList:::customer_id"]=""
operation_parameters_collection_type["returnList:::store_id"]=""
operation_parameters_collection_type["returnList:::status"]=""
operation_parameters_collection_type["returnList:::return_type"]=""
operation_parameters_collection_type["returnList:::created_from"]=""
operation_parameters_collection_type["returnList:::created_to"]=""
operation_parameters_collection_type["returnList:::modified_from"]=""
operation_parameters_collection_type["returnList:::modified_to"]=""
operation_parameters_collection_type["returnList:::response_fields"]=""
operation_parameters_collection_type["returnList:::params"]=""
operation_parameters_collection_type["returnList:::exclude"]=""
operation_parameters_collection_type["returnList:::report_request_id"]=""
operation_parameters_collection_type["returnList:::disable_report_cache"]=""
operation_parameters_collection_type["returnReasonList:::store_id"]=""
operation_parameters_collection_type["subscriberList:::ids"]=""
operation_parameters_collection_type["subscriberList:::start"]=""
operation_parameters_collection_type["subscriberList:::count"]=""
operation_parameters_collection_type["subscriberList:::page_cursor"]=""
operation_parameters_collection_type["subscriberList:::subscribed"]=""
operation_parameters_collection_type["subscriberList:::store_id"]=""
operation_parameters_collection_type["subscriberList:::email"]=""
operation_parameters_collection_type["subscriberList:::created_from"]=""
operation_parameters_collection_type["subscriberList:::created_to"]=""
operation_parameters_collection_type["subscriberList:::modified_from"]=""
operation_parameters_collection_type["subscriberList:::modified_to"]=""
operation_parameters_collection_type["subscriberList:::response_fields"]=""
operation_parameters_collection_type["subscriberList:::params"]=""
operation_parameters_collection_type["subscriberList:::exclude"]=""
operation_parameters_collection_type["taxClassInfo:::tax_class_id"]=""
operation_parameters_collection_type["taxClassInfo:::store_id"]=""
operation_parameters_collection_type["taxClassInfo:::lang_id"]=""
operation_parameters_collection_type["taxClassInfo:::response_fields"]=""
operation_parameters_collection_type["taxClassInfo:::params"]=""
operation_parameters_collection_type["taxClassInfo:::exclude"]=""
operation_parameters_collection_type["taxClassList:::count"]=""
operation_parameters_collection_type["taxClassList:::page_cursor"]=""
operation_parameters_collection_type["taxClassList:::store_id"]=""
operation_parameters_collection_type["taxClassList:::find_value"]=""
operation_parameters_collection_type["taxClassList:::find_where"]=""
operation_parameters_collection_type["taxClassList:::created_to"]=""
operation_parameters_collection_type["taxClassList:::created_from"]=""
operation_parameters_collection_type["taxClassList:::modified_to"]=""
operation_parameters_collection_type["taxClassList:::modified_from"]=""
operation_parameters_collection_type["taxClassList:::response_fields"]=""
operation_parameters_collection_type["webhookCount:::entity"]=""
operation_parameters_collection_type["webhookCount:::action"]=""
operation_parameters_collection_type["webhookCount:::active"]=""
operation_parameters_collection_type["webhookCreate:::entity"]=""
operation_parameters_collection_type["webhookCreate:::action"]=""
operation_parameters_collection_type["webhookCreate:::callback"]=""
operation_parameters_collection_type["webhookCreate:::label"]=""
operation_parameters_collection_type["webhookCreate:::fields"]=""
operation_parameters_collection_type["webhookCreate:::response_fields"]=""
operation_parameters_collection_type["webhookCreate:::active"]=""
operation_parameters_collection_type["webhookCreate:::lang_id"]=""
operation_parameters_collection_type["webhookCreate:::store_id"]=""
operation_parameters_collection_type["webhookDelete:::id"]=""
operation_parameters_collection_type["webhookList:::start"]=""
operation_parameters_collection_type["webhookList:::count"]=""
operation_parameters_collection_type["webhookList:::entity"]=""
operation_parameters_collection_type["webhookList:::action"]=""
operation_parameters_collection_type["webhookList:::active"]=""
operation_parameters_collection_type["webhookList:::ids"]=""
operation_parameters_collection_type["webhookList:::params"]=""
operation_parameters_collection_type["webhookUpdate:::id"]=""
operation_parameters_collection_type["webhookUpdate:::callback"]=""
operation_parameters_collection_type["webhookUpdate:::label"]=""
operation_parameters_collection_type["webhookUpdate:::fields"]=""
operation_parameters_collection_type["webhookUpdate:::response_fields"]=""
operation_parameters_collection_type["webhookUpdate:::active"]=""
operation_parameters_collection_type["webhookUpdate:::lang_id"]=""


##
# Map for body parameters passed after operation as
# PARAMETER==STRING_VALUE or PARAMETER:=NUMERIC_VALUE
# These will be mapped to top level json keys ( { "PARAMETER": "VALUE" })
declare -A body_parameters

##
# These arguments will be directly passed to cURL
curl_arguments=""

##
# The host for making the request
host=""

##
# The user credentials for basic authentication
basic_auth_credential=""

##
# The user API key
apikey_auth_credential=""
##
# The user API key
apikey_auth_credential=""

##
# If true, the script will only output the actual cURL command that would be
# used
print_curl=false

##
# The operation ID passed on the command line
operation=""

##
# The provided Accept header value
header_accept=""

##
# The provided Content-type header value
header_content_type=""

##
# If there is any body content on the stdin pass it to the body of the request
body_content_temp_file=""

##
# If this variable is set to true, the request will be performed even
# if parameters for required query, header or body values are not provided
# (path parameters are still required).
force=false

##
# Declare some mime types abbreviations for easier content-type and accepts
# headers specification
declare -A mime_type_abbreviations
# text/*
mime_type_abbreviations["text"]="text/plain"
mime_type_abbreviations["html"]="text/html"
mime_type_abbreviations["md"]="text/x-markdown"
mime_type_abbreviations["csv"]="text/csv"
mime_type_abbreviations["css"]="text/css"
mime_type_abbreviations["rtf"]="text/rtf"
# application/*
mime_type_abbreviations["json"]="application/json"
mime_type_abbreviations["xml"]="application/xml"
mime_type_abbreviations["yaml"]="application/yaml"
mime_type_abbreviations["js"]="application/javascript"
mime_type_abbreviations["bin"]="application/octet-stream"
mime_type_abbreviations["rdf"]="application/rdf+xml"
# image/*
mime_type_abbreviations["jpg"]="image/jpeg"
mime_type_abbreviations["png"]="image/png"
mime_type_abbreviations["gif"]="image/gif"
mime_type_abbreviations["bmp"]="image/bmp"
mime_type_abbreviations["tiff"]="image/tiff"


##############################################################################
#
# Escape special URL characters
# Based on table at http://www.w3schools.com/tags/ref_urlencode.asp
#
##############################################################################
url_escape() {
    local raw_url="$1"

    value=$(sed -e 's/ /%20/g' \
       -e 's/!/%21/g' \
       -e 's/"/%22/g' \
       -e 's/#/%23/g' \
       -e 's/\&/%26/g' \
       -e 's/'\''/%28/g' \
       -e 's/(/%28/g' \
       -e 's/)/%29/g' \
       -e 's/:/%3A/g' \
       -e 's/\\t/%09/g' \
       -e 's/?/%3F/g' <<<"$raw_url");

    echo "$value"
}

##############################################################################
#
# Lookup the mime type abbreviation in the mime_type_abbreviations array.
# If not present assume the user provided a valid mime type
#
##############################################################################
lookup_mime_type() {
    local mime_type="$1"

    if [[ ${mime_type_abbreviations[$mime_type]} ]]; then
        echo "${mime_type_abbreviations[$mime_type]}"
    else
        echo "$mime_type"
    fi
}

##############################################################################
#
# Converts an associative array into a list of cURL header
# arguments (-H "KEY: VALUE")
#
##############################################################################
header_arguments_to_curl() {
    local headers_curl=""
    local api_key_header=""
    local api_key_header_in_cli=""
    api_key_header="x-api-key"
    local api_key_header=""
    local api_key_header_in_cli=""
    api_key_header="x-store-key"

    for key in "${!header_arguments[@]}"; do
        headers_curl+="-H \"${key}: ${header_arguments[${key}]}\" "
        if [[ "${key}XX" == "${api_key_header}XX" ]]; then
            api_key_header_in_cli="YES"
        fi
        if [[ "${key}XX" == "${api_key_header}XX" ]]; then
            api_key_header_in_cli="YES"
        fi
    done
    #
    # If the api_key was not provided in the header, try one from the
    # environment variable
    #
    if [[ -z $api_key_header_in_cli && -n $apikey_auth_credential ]]; then
        headers_curl+="-H \"${api_key_header}: ${apikey_auth_credential}\""
    fi
    #
    # If the api_key was not provided in the header, try one from the
    # environment variable
    #
    if [[ -z $api_key_header_in_cli && -n $apikey_auth_credential ]]; then
        headers_curl+="-H \"${api_key_header}: ${apikey_auth_credential}\""
    fi
    headers_curl+=" "

    echo "${headers_curl}"
}

##############################################################################
#
# Converts an associative array into a simple JSON with keys as top
# level object attributes
#
# \todo Add conversion of more complex attributes using paths
#
##############################################################################
body_parameters_to_json() {
    if [[ $RAW_BODY == "1" ]]; then
        echo "-d '${body_parameters["RAW_BODY"]}'"
    else
        local body_json="-d '{"
        local count=0
        for key in "${!body_parameters[@]}"; do
            if [[ $((count++)) -gt 0 ]]; then
                body_json+=", "
            fi
            body_json+="\"${key}\": ${body_parameters[${key}]}"
        done
        body_json+="}'"

        if [[ "${#body_parameters[@]}" -eq 0 ]]; then
            echo ""
        else
            echo "${body_json}"
        fi
    fi
}

##############################################################################
#
# Converts an associative array into form urlencoded string
#
##############################################################################
body_parameters_to_form_urlencoded() {
    local body_form_urlencoded="-d '"
    local count=0
    for key in "${!body_parameters[@]}"; do
        if [[ $((count++)) -gt 0 ]]; then
            body_form_urlencoded+="&"
        fi
        body_form_urlencoded+="${key}=${body_parameters[${key}]}"
    done
    body_form_urlencoded+="'"

    if [[ "${#body_parameters[@]}" -eq 0 ]]; then
        echo ""
    else
        echo "${body_form_urlencoded}"
    fi
}

##############################################################################
#
# Helper method for showing error because for example echo in
# build_request_path() is evaluated as part of command line not printed on
# output. Anyway better idea for resource clean up ;-).
#
##############################################################################
ERROR_MSG=""
function finish {
    if [[ -n "$ERROR_MSG" ]]; then
        echo >&2 "${OFF}${RED}$ERROR_MSG"
        echo >&2 "${OFF}Check usage: '${script_name} --help'"
    fi
}
trap finish EXIT


##############################################################################
#
# Validate and build request path including query parameters
#
##############################################################################
build_request_path() {
    local path_template=$1
    local -n path_params=$2
    local -n query_params=$3


    #
    # Check input parameters count against minimum and maximum required
    #
    if [[ "$force" = false ]]; then
        local was_error=""
        for qparam in "${query_params[@]}" "${path_params[@]}"; do
            local parameter_values
            mapfile -t parameter_values < <(sed -e 's/'":::"'/\n/g' <<<"${operation_parameters[$qparam]}")

            #
            # Check if the number of provided values is not less than minimum required
            #
            if [[ ${#parameter_values[@]} -lt ${operation_parameters_minimum_occurrences["${operation}:::${qparam}"]} ]]; then
                echo "ERROR: Too few values provided for '${qparam}' parameter."
                was_error=true
            fi

            #
            # Check if the number of provided values is not more than maximum
            #
            if [[ ${operation_parameters_maximum_occurrences["${operation}:::${qparam}"]} -gt 0 \
                  && ${#parameter_values[@]} -gt ${operation_parameters_maximum_occurrences["${operation}:::${qparam}"]} ]]; then
                echo "ERROR: Too many values provided for '${qparam}' parameter"
                was_error=true
            fi
        done
        if [[ -n "$was_error" ]]; then
            exit 1
        fi
    fi

    # First replace all path parameters in the path
    for pparam in "${path_params[@]}"; do
        local path_regex="(.*)(\\{$pparam\\})(.*)"
        if [[ $path_template =~ $path_regex ]]; then
            path_template=${BASH_REMATCH[1]}${operation_parameters[$pparam]}${BASH_REMATCH[3]}
        fi
    done

    local query_request_part=""

    for qparam in "${query_params[@]}"; do
        if [[ "${operation_parameters[$qparam]}" == "" ]]; then
            continue
        fi

        # Get the array of parameter values
        local parameter_value=""
        local parameter_values
        mapfile -t parameter_values < <(sed -e 's/'":::"'/\n/g' <<<"${operation_parameters[$qparam]}")



        #
        # Append parameters without specific cardinality
        #
        local collection_type="${operation_parameters_collection_type["${operation}:::${qparam}"]}"
        if [[ "${collection_type}" == "" ]]; then
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="&"
                fi
                parameter_value+="${qparam}=${qvalue}"
            done
        #
        # Append parameters specified as 'multi' collections i.e. param=value1&param=value2&...
        #
        elif [[ "${collection_type}" == "multi" ]]; then
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="&"
                fi
                parameter_value+="${qparam}=${qvalue}"
            done
        #
        # Append parameters specified as 'csv' collections i.e. param=value1,value2,...
        #
        elif [[ "${collection_type}" == "csv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+=","
                fi
                parameter_value+="${qvalue}"
            done
        #
        # Append parameters specified as 'ssv' collections i.e. param="value1 value2 ..."
        #
        elif [[ "${collection_type}" == "ssv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+=" "
                fi
                parameter_value+="${qvalue}"
            done
        #
        # Append parameters specified as 'tsv' collections i.e. param="value1\tvalue2\t..."
        #
        elif [[ "${collection_type}" == "tsv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="\\t"
                fi
                parameter_value+="${qvalue}"
            done
        else
            echo "Unsupported collection format \"${collection_type}\""
            exit 1
        fi

        if [[ -n "${parameter_value}" ]]; then
            if [[ -n "${query_request_part}" ]]; then
                query_request_part+="&"
            fi
            query_request_part+="${parameter_value}"
        fi

    done


    # Now append query parameters - if any
    if [[ -n "${query_request_part}" ]]; then
        path_template+="?${query_request_part}"
    fi

    echo "$path_template"
}



###############################################################################
#
# Print main help message
#
###############################################################################
print_help() {
cat <<EOF

${BOLD}${WHITE}API2Cart OpenAPI command line client (API version 1.1)${OFF}

${BOLD}${WHITE}Usage${OFF}

  ${GREEN}${script_name}${OFF} [-h|--help] [-V|--version] [--about] [${RED}<curl-options>${OFF}]
           [-ac|--accept ${GREEN}<mime-type>${OFF}] [-ct,--content-type ${GREEN}<mime-type>${OFF}]
           [--host ${CYAN}<url>${OFF}] [--dry-run] [-nc|--no-colors] ${YELLOW}<operation>${OFF} [-h|--help]
           [${BLUE}<headers>${OFF}] [${MAGENTA}<parameters>${OFF}] [${MAGENTA}<body-parameters>${OFF}]

  - ${CYAN}<url>${OFF} - endpoint of the REST service without basepath

  - ${RED}<curl-options>${OFF} - any valid cURL options can be passed before ${YELLOW}<operation>${OFF}
  - ${GREEN}<mime-type>${OFF} - either full mime-type or one of supported abbreviations:
                   (text, html, md, csv, css, rtf, json, xml, yaml, js, bin,
                    rdf, jpg, png, gif, bmp, tiff)
  - ${BLUE}<headers>${OFF} - HTTP headers can be passed in the form ${YELLOW}HEADER${OFF}:${BLUE}VALUE${OFF}
  - ${MAGENTA}<parameters>${OFF} - REST operation parameters can be passed in the following
                   forms:
                   * ${YELLOW}KEY${OFF}=${BLUE}VALUE${OFF} - path or query parameters
  - ${MAGENTA}<body-parameters>${OFF} - simple JSON body content (first level only) can be build
                        using the following arguments:
                        * ${YELLOW}KEY${OFF}==${BLUE}VALUE${OFF} - body parameters which will be added to body
                                      JSON as '{ ..., "${YELLOW}KEY${OFF}": "${BLUE}VALUE${OFF}", ... }'
                        * ${YELLOW}KEY${OFF}:=${BLUE}VALUE${OFF} - body parameters which will be added to body
                                      JSON as '{ ..., "${YELLOW}KEY${OFF}": ${BLUE}VALUE${OFF}, ... }'

EOF
    echo -e "${BOLD}${WHITE}Authentication methods${OFF}"
    echo -e ""
    echo -e "  - ${BLUE}Api-key${OFF} - add '${RED}x-api-key:<api-key>${OFF}' after ${YELLOW}<operation>${OFF}"
    
    echo -e "  - ${BLUE}Api-key${OFF} - add '${RED}x-store-key:<api-key>${OFF}' after ${YELLOW}<operation>${OFF}"
    
    echo ""
    echo -e "${BOLD}${WHITE}Operations (grouped by tags)${OFF}"
    echo ""
    echo -e "${BOLD}${WHITE}[account]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}accountCartAdd${OFF};account.cart.add (AUTH)
  ${CYAN}accountCartList${OFF};account.cart.list (AUTH)
  ${CYAN}accountConfigUpdate${OFF};account.config.update (AUTH) (AUTH)
  ${CYAN}accountFailedWebhooks${OFF};account.failed_webhooks (AUTH)
  ${CYAN}accountSupportedPlatforms${OFF};account.supported_platforms (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[attribute]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}attributeAdd${OFF};attribute.add (AUTH) (AUTH)
  ${CYAN}attributeAssignGroup${OFF};attribute.assign.group (AUTH) (AUTH)
  ${CYAN}attributeAssignSet${OFF};attribute.assign.set (AUTH) (AUTH)
  ${CYAN}attributeAttributesetList${OFF};attribute.attributeset.list (AUTH) (AUTH)
  ${CYAN}attributeCount${OFF};attribute.count (AUTH) (AUTH)
  ${CYAN}attributeDelete${OFF};attribute.delete (AUTH) (AUTH)
  ${CYAN}attributeGroupList${OFF};attribute.group.list (AUTH) (AUTH)
  ${CYAN}attributeInfo${OFF};attribute.info (AUTH) (AUTH)
  ${CYAN}attributeList${OFF};attribute.list (AUTH) (AUTH)
  ${CYAN}attributeTypeList${OFF};attribute.type.list (AUTH) (AUTH)
  ${CYAN}attributeUnassignGroup${OFF};attribute.unassign.group (AUTH) (AUTH)
  ${CYAN}attributeUnassignSet${OFF};attribute.unassign.set (AUTH) (AUTH)
  ${CYAN}attributeUpdate${OFF};attribute.update (AUTH) (AUTH)
  ${CYAN}attributeValueAdd${OFF};attribute.value.add (AUTH) (AUTH)
  ${CYAN}attributeValueDelete${OFF};attribute.value.delete (AUTH) (AUTH)
  ${CYAN}attributeValueUpdate${OFF};attribute.value.update (AUTH) (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[basket]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}basketInfo${OFF};basket.info (AUTH) (AUTH)
  ${CYAN}basketItemAdd${OFF};basket.item.add (AUTH) (AUTH)
  ${CYAN}basketLiveShippingServiceCreate${OFF};basket.live_shipping_service.create (AUTH) (AUTH)
  ${CYAN}basketLiveShippingServiceDelete${OFF};basket.live_shipping_service.delete (AUTH) (AUTH)
  ${CYAN}basketLiveShippingServiceList${OFF};basket.live_shipping_service.list (AUTH) (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[batch]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}batchJobList${OFF};batch.job.list (AUTH) (AUTH)
  ${CYAN}batchJobResult${OFF};batch.job.result (AUTH) (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[bridge]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}bridgeDelete${OFF};bridge.delete (AUTH) (AUTH)
  ${CYAN}bridgeDownload${OFF};bridge.download (AUTH) (AUTH)
  ${CYAN}bridgeUpdate${OFF};bridge.update (AUTH) (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[cart]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}cartCatalogPriceRulesCount${OFF};cart.catalog_price_rules.count (AUTH) (AUTH)
  ${CYAN}cartCatalogPriceRulesList${OFF};cart.catalog_price_rules.list (AUTH) (AUTH)
  ${CYAN}cartCouponAdd${OFF};cart.coupon.add (AUTH) (AUTH)
  ${CYAN}cartCouponConditionAdd${OFF};cart.coupon.condition.add (AUTH) (AUTH)
  ${CYAN}cartCouponCount${OFF};cart.coupon.count (AUTH) (AUTH)
  ${CYAN}cartCouponDelete${OFF};cart.coupon.delete (AUTH) (AUTH)
  ${CYAN}cartCouponList${OFF};cart.coupon.list (AUTH) (AUTH)
  ${CYAN}cartDelete${OFF};cart.delete (AUTH) (AUTH)
  ${CYAN}cartGiftcardAdd${OFF};cart.giftcard.add (AUTH) (AUTH)
  ${CYAN}cartGiftcardCount${OFF};cart.giftcard.count (AUTH) (AUTH)
  ${CYAN}cartGiftcardDelete${OFF};cart.giftcard.delete (AUTH) (AUTH)
  ${CYAN}cartGiftcardList${OFF};cart.giftcard.list (AUTH) (AUTH)
  ${CYAN}cartInfo${OFF};cart.info (AUTH) (AUTH)
  ${CYAN}cartMetaDataList${OFF};cart.meta_data.list (AUTH) (AUTH)
  ${CYAN}cartMetaDataSet${OFF};cart.meta_data.set (AUTH) (AUTH)
  ${CYAN}cartMetaDataUnset${OFF};cart.meta_data.unset (AUTH) (AUTH)
  ${CYAN}cartMethods${OFF};cart.methods (AUTH) (AUTH)
  ${CYAN}cartPluginList${OFF};cart.plugin.list (AUTH) (AUTH)
  ${CYAN}cartScriptAdd${OFF};cart.script.add (AUTH) (AUTH)
  ${CYAN}cartScriptDelete${OFF};cart.script.delete (AUTH) (AUTH)
  ${CYAN}cartScriptList${OFF};cart.script.list (AUTH) (AUTH)
  ${CYAN}cartShippingZonesList${OFF};cart.shipping_zones.list (AUTH) (AUTH)
  ${CYAN}cartValidate${OFF};cart.validate (AUTH) (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[category]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}categoryAdd${OFF};category.add (AUTH) (AUTH)
  ${CYAN}categoryAddBatch${OFF};category.add.batch (AUTH) (AUTH)
  ${CYAN}categoryAssign${OFF};category.assign (AUTH) (AUTH)
  ${CYAN}categoryCount${OFF};category.count (AUTH) (AUTH)
  ${CYAN}categoryDelete${OFF};category.delete (AUTH) (AUTH)
  ${CYAN}categoryFind${OFF};category.find (AUTH) (AUTH)
  ${CYAN}categoryImageAdd${OFF};category.image.add (AUTH) (AUTH)
  ${CYAN}categoryImageDelete${OFF};category.image.delete (AUTH) (AUTH)
  ${CYAN}categoryInfo${OFF};category.info (AUTH) (AUTH)
  ${CYAN}categoryList${OFF};category.list (AUTH) (AUTH)
  ${CYAN}categoryUnassign${OFF};category.unassign (AUTH) (AUTH)
  ${CYAN}categoryUpdate${OFF};category.update (AUTH) (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[customer]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}customerAdd${OFF};customer.add (AUTH) (AUTH)
  ${CYAN}customerAddressAdd${OFF};customer.address.add (AUTH) (AUTH)
  ${CYAN}customerAttributeList${OFF};customer.attribute.list (AUTH) (AUTH)
  ${CYAN}customerCount${OFF};customer.count (AUTH) (AUTH)
  ${CYAN}customerDelete${OFF};customer.delete (AUTH) (AUTH)
  ${CYAN}customerFind${OFF};customer.find (AUTH) (AUTH)
  ${CYAN}customerGroupAdd${OFF};customer.group.add (AUTH) (AUTH)
  ${CYAN}customerGroupList${OFF};customer.group.list (AUTH) (AUTH)
  ${CYAN}customerInfo${OFF};customer.info (AUTH) (AUTH)
  ${CYAN}customerList${OFF};customer.list (AUTH) (AUTH)
  ${CYAN}customerUpdate${OFF};customer.update (AUTH) (AUTH)
  ${CYAN}customerWishlistList${OFF};customer.wishlist.list (AUTH) (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[marketplace]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}marketplaceProductFind${OFF};marketplace.product.find (AUTH) (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[order]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}orderAbandonedList${OFF};order.abandoned.list (AUTH) (AUTH)
  ${CYAN}orderAdd${OFF};order.add (AUTH) (AUTH)
  ${CYAN}orderCount${OFF};order.count (AUTH) (AUTH)
  ${CYAN}orderFinancialStatusList${OFF};order.financial_status.list (AUTH) (AUTH)
  ${CYAN}orderFulfillmentStatusList${OFF};order.fulfillment_status.list (AUTH) (AUTH)
  ${CYAN}orderInfo${OFF};order.info (AUTH) (AUTH)
  ${CYAN}orderList${OFF};order.list (AUTH) (AUTH)
  ${CYAN}orderPreestimateShippingList${OFF};order.preestimate_shipping.list (AUTH) (AUTH)
  ${CYAN}orderRefundAdd${OFF};order.refund.add (AUTH) (AUTH)
  ${CYAN}orderReturnAdd${OFF};order.return.add (AUTH) (AUTH)
  ${CYAN}orderReturnDelete${OFF};order.return.delete (AUTH) (AUTH)
  ${CYAN}orderReturnUpdate${OFF};order.return.update (AUTH) (AUTH)
  ${CYAN}orderShipmentAdd${OFF};order.shipment.add (AUTH) (AUTH)
  ${CYAN}orderShipmentAddBatch${OFF};order.shipment.add.batch (AUTH) (AUTH)
  ${CYAN}orderShipmentDelete${OFF};order.shipment.delete (AUTH) (AUTH)
  ${CYAN}orderShipmentInfo${OFF};order.shipment.info (AUTH) (AUTH)
  ${CYAN}orderShipmentList${OFF};order.shipment.list (AUTH) (AUTH)
  ${CYAN}orderShipmentTrackingAdd${OFF};order.shipment.tracking.add (AUTH) (AUTH)
  ${CYAN}orderShipmentUpdate${OFF};order.shipment.update (AUTH) (AUTH)
  ${CYAN}orderStatusList${OFF};order.status.list (AUTH) (AUTH)
  ${CYAN}orderTransactionList${OFF};order.transaction.list (AUTH) (AUTH)
  ${CYAN}orderUpdate${OFF};order.update (AUTH) (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[product]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}productAdd${OFF};product.add (AUTH) (AUTH)
  ${CYAN}productAddBatch${OFF};product.add.batch (AUTH) (AUTH)
  ${CYAN}productAttributeList${OFF};product.attribute.list (AUTH) (AUTH)
  ${CYAN}productAttributeValueSet${OFF};product.attribute.value.set (AUTH) (AUTH)
  ${CYAN}productAttributeValueUnset${OFF};product.attribute.value.unset (AUTH) (AUTH)
  ${CYAN}productBrandList${OFF};product.brand.list (AUTH) (AUTH)
  ${CYAN}productChildItemFind${OFF};product.child_item.find (AUTH) (AUTH)
  ${CYAN}productChildItemInfo${OFF};product.child_item.info (AUTH) (AUTH)
  ${CYAN}productChildItemList${OFF};product.child_item.list (AUTH) (AUTH)
  ${CYAN}productCount${OFF};product.count (AUTH) (AUTH)
  ${CYAN}productCurrencyAdd${OFF};product.currency.add (AUTH) (AUTH)
  ${CYAN}productCurrencyList${OFF};product.currency.list (AUTH) (AUTH)
  ${CYAN}productDelete${OFF};product.delete (AUTH) (AUTH)
  ${CYAN}productDeleteBatch${OFF};product.delete.batch (AUTH) (AUTH)
  ${CYAN}productFind${OFF};product.find (AUTH) (AUTH)
  ${CYAN}productImageAdd${OFF};product.image.add (AUTH) (AUTH)
  ${CYAN}productImageDelete${OFF};product.image.delete (AUTH) (AUTH)
  ${CYAN}productImageUpdate${OFF};product.image.update (AUTH) (AUTH)
  ${CYAN}productInfo${OFF};product.info (AUTH) (AUTH)
  ${CYAN}productList${OFF};product.list (AUTH) (AUTH)
  ${CYAN}productManufacturerAdd${OFF};product.manufacturer.add (AUTH) (AUTH)
  ${CYAN}productOptionAdd${OFF};product.option.add (AUTH) (AUTH)
  ${CYAN}productOptionAssign${OFF};product.option.assign (AUTH) (AUTH)
  ${CYAN}productOptionDelete${OFF};product.option.delete (AUTH) (AUTH)
  ${CYAN}productOptionList${OFF};product.option.list (AUTH) (AUTH)
  ${CYAN}productOptionValueAdd${OFF};product.option.value.add (AUTH) (AUTH)
  ${CYAN}productOptionValueAssign${OFF};product.option.value.assign (AUTH) (AUTH)
  ${CYAN}productOptionValueDelete${OFF};product.option.value.delete (AUTH) (AUTH)
  ${CYAN}productOptionValueUpdate${OFF};product.option.value.update (AUTH) (AUTH)
  ${CYAN}productPriceAdd${OFF};product.price.add (AUTH) (AUTH)
  ${CYAN}productPriceDelete${OFF};product.price.delete (AUTH) (AUTH)
  ${CYAN}productPriceUpdate${OFF};product.price.update (AUTH) (AUTH)
  ${CYAN}productReviewList${OFF};product.review.list (AUTH) (AUTH)
  ${CYAN}productStoreAssign${OFF};product.store.assign (AUTH) (AUTH)
  ${CYAN}productTaxAdd${OFF};product.tax.add (AUTH) (AUTH)
  ${CYAN}productUpdate${OFF};product.update (AUTH) (AUTH)
  ${CYAN}productUpdateBatch${OFF};product.update.batch (AUTH) (AUTH)
  ${CYAN}productVariantAdd${OFF};product.variant.add (AUTH) (AUTH)
  ${CYAN}productVariantAddBatch${OFF};product.variant.add.batch (AUTH) (AUTH)
  ${CYAN}productVariantDelete${OFF};product.variant.delete (AUTH) (AUTH)
  ${CYAN}productVariantDeleteBatch${OFF};product.variant.delete.batch (AUTH) (AUTH)
  ${CYAN}productVariantImageAdd${OFF};product.variant.image.add (AUTH) (AUTH)
  ${CYAN}productVariantImageDelete${OFF};product.variant.image.delete (AUTH) (AUTH)
  ${CYAN}productVariantPriceAdd${OFF};product.variant.price.add (AUTH) (AUTH)
  ${CYAN}productVariantPriceDelete${OFF};product.variant.price.delete (AUTH) (AUTH)
  ${CYAN}productVariantPriceUpdate${OFF};product.variant.price.update (AUTH) (AUTH)
  ${CYAN}productVariantUpdate${OFF};product.variant.update (AUTH) (AUTH)
  ${CYAN}productVariantUpdateBatch${OFF};product.variant.update.batch (AUTH) (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[return]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}returnActionList${OFF};return.action.list (AUTH) (AUTH)
  ${CYAN}returnCount${OFF};return.count (AUTH) (AUTH)
  ${CYAN}returnInfo${OFF};return.info (AUTH) (AUTH)
  ${CYAN}returnList${OFF};return.list (AUTH) (AUTH)
  ${CYAN}returnReasonList${OFF};return.reason.list (AUTH) (AUTH)
  ${CYAN}returnStatusList${OFF};return.status.list (AUTH) (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[subscriber]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}subscriberList${OFF};subscriber.list (AUTH) (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[tax]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}taxClassInfo${OFF};tax.class.info (AUTH) (AUTH)
  ${CYAN}taxClassList${OFF};tax.class.list (AUTH) (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[webhook]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}webhookCount${OFF};webhook.count (AUTH) (AUTH)
  ${CYAN}webhookCreate${OFF};webhook.create (AUTH) (AUTH)
  ${CYAN}webhookDelete${OFF};webhook.delete (AUTH) (AUTH)
  ${CYAN}webhookEvents${OFF};webhook.events (AUTH) (AUTH)
  ${CYAN}webhookList${OFF};webhook.list (AUTH) (AUTH)
  ${CYAN}webhookUpdate${OFF};webhook.update (AUTH) (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}Options${OFF}"
    echo -e "  -h,--help\\t\\t\\t\\tPrint this help"
    echo -e "  -V,--version\\t\\t\\t\\tPrint API version"
    echo -e "  --about\\t\\t\\t\\tPrint the information about service"
    echo -e "  --host ${CYAN}<url>${OFF}\\t\\t\\t\\tSpecify the host URL "
echo -e "              \\t\\t\\t\\t(e.g. 'https://api.api2cart.local.com')"

    echo -e "  --force\\t\\t\\t\\tForce command invocation in spite of missing"
    echo -e "         \\t\\t\\t\\trequired parameters or wrong content type"
    echo -e "  --dry-run\\t\\t\\t\\tPrint out the cURL command without"
    echo -e "           \\t\\t\\t\\texecuting it"
    echo -e "  -nc,--no-colors\\t\\t\\tEnforce print without colors, otherwise autodetected"
    echo -e "  -ac,--accept ${YELLOW}<mime-type>${OFF}\\t\\tSet the 'Accept' header in the request"
    echo -e "  -ct,--content-type ${YELLOW}<mime-type>${OFF}\\tSet the 'Content-type' header in "
    echo -e "                                \\tthe request"
    echo ""
}


##############################################################################
#
# Print REST service description
#
##############################################################################
print_about() {
    echo ""
    echo -e "${BOLD}${WHITE}API2Cart OpenAPI command line client (API version 1.1)${OFF}"
    echo ""
    echo -e "License: "
    echo -e "Contact: contact@api2cart.com"
    echo ""
read -r -d '' appdescription <<EOF

API2Cart
EOF
echo "$appdescription" | paste -sd' ' | fold -sw 80
}


##############################################################################
#
# Print REST api version
#
##############################################################################
print_version() {
    echo ""
    echo -e "${BOLD}API2Cart OpenAPI command line client (API version 1.1)${OFF}"
    echo ""
}

##############################################################################
#
# Print help for accountCartAdd operation
#
##############################################################################
print_accountCartAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}accountCartAdd - account.cart.add${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Use this method to automate the process of connecting stores to API2Cart. The list of parameters will vary depending on the platform. To get a list of parameters that are specific to a particular shopping platform, you need to execute the account.supported_platforms.json method." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for accountCartList operation
#
##############################################################################
print_accountCartList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}accountCartList - account.cart.list${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This method lets you get a list of online stores connected to your API2Cart account. You can get the number of API requests to each store if you specify a period using parameters (request_from_date, request_to_date). The total_calls field is displayed only if there are parameters (request_from_date, request_to_date)." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}store_url${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A web address of a store${YELLOW} Specify as: store_url=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Find store by store key${YELLOW} Specify as: store_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}request_from_date${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: request_from_date=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}request_to_date${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: request_to_date=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: force_all)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for accountConfigUpdate operation
#
##############################################################################
print_accountConfigUpdate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}accountConfigUpdate - account.config.update${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Use this method to automate the change of credentials used to connect online stores. The list of supported parameters differs depending on the platform." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}replace_parameters${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Identifies if there is a necessity to replace parameters${YELLOW} Specify as: replace_parameters=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}new_store_url${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The web address of the store you want to update to connect to API2Cart${YELLOW} Specify as: new_store_url=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}new_store_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Update store key${YELLOW} Specify as: new_store_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}bridge_url${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - This parameter allows to set up store with custom bridge url (also you must use store_root parameter if a bridge folder is not in the root folder of the store)${YELLOW} Specify as: bridge_url=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_root${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Absolute path to the store root directory (used with \"bridge_url\" parameter)${YELLOW} Specify as: store_root=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}db_tables_prefix${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - DB tables prefix${YELLOW} Specify as: db_tables_prefix=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}user_agent${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - This parameter allows you to set your custom user agent, which will be used in requests to the store. Please use it cautiously, as the store's firewall may block specific values.${YELLOW} Specify as: user_agent=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}3dcart_private_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - 3DCart Private Key${YELLOW} Specify as: 3dcart_private_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}3dcart_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - 3DCart Token${YELLOW} Specify as: 3dcart_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}3dcartapi_api_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - 3DCart API Key${YELLOW} Specify as: 3dcartapi_api_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}amazon_sp_client_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Amazon SP API app client id${YELLOW} Specify as: amazon_sp_client_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}amazon_sp_client_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Amazon SP API app client secret${YELLOW} Specify as: amazon_sp_client_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}amazon_sp_refresh_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Amazon SP API OAuth refresh token${YELLOW} Specify as: amazon_sp_refresh_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}amazon_sp_aws_region${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Amazon AWS Region${YELLOW} Specify as: amazon_sp_aws_region=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}amazon_sp_api_environment${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: production)${OFF} - Amazon SP API environment${YELLOW} Specify as: amazon_sp_api_environment=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}amazon_seller_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Amazon Seller ID (Merchant token)${YELLOW} Specify as: amazon_seller_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}aspdotnetstorefront_api_user${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - It's a AspDotNetStorefront account for which API is available${YELLOW} Specify as: aspdotnetstorefront_api_user=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}aspdotnetstorefront_api_pass${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - AspDotNetStorefront API Password${YELLOW} Specify as: aspdotnetstorefront_api_pass=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}bigcommerceapi_admin_account${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - It's a BigCommerce account for which API is enabled${YELLOW} Specify as: bigcommerceapi_admin_account=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}bigcommerceapi_api_path${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - BigCommerce API URL${YELLOW} Specify as: bigcommerceapi_api_path=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}bigcommerceapi_api_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Bigcommerce API Key${YELLOW} Specify as: bigcommerceapi_api_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}bigcommerceapi_client_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Client ID of the requesting app${YELLOW} Specify as: bigcommerceapi_client_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}bigcommerceapi_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Access token authorizing the app to access resources on behalf of a user${YELLOW} Specify as: bigcommerceapi_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}bigcommerceapi_context${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - API Path section unique to the store${YELLOW} Specify as: bigcommerceapi_context=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}bol_api_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Bol API Key${YELLOW} Specify as: bol_api_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}bol_api_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Bol API Secret${YELLOW} Specify as: bol_api_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}bol_retailer_id${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - Bol Retailer ID${YELLOW} Specify as: bol_retailer_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}demandware_client_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Demandware client id${YELLOW} Specify as: demandware_client_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}demandware_api_password${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Demandware api password${YELLOW} Specify as: demandware_api_password=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}demandware_user_name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Demandware user name${YELLOW} Specify as: demandware_user_name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}demandware_user_password${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Demandware user password${YELLOW} Specify as: demandware_user_password=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ebay_client_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Application ID (AppID).${YELLOW} Specify as: ebay_client_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ebay_client_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shared Secret from eBay application${YELLOW} Specify as: ebay_client_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ebay_runame${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The RuName value that eBay assigns to your application.${YELLOW} Specify as: ebay_runame=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ebay_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to authenticate API requests.${YELLOW} Specify as: ebay_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ebay_refresh_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to renew the access token.${YELLOW} Specify as: ebay_refresh_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ebay_environment${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - eBay environment${YELLOW} Specify as: ebay_environment=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ebay_site_id${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - eBay global ID${YELLOW} Specify as: ebay_site_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ecwid_acess_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Access token authorizing the app to access resources on behalf of a user${YELLOW} Specify as: ecwid_acess_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ecwid_store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: ecwid_store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lazada_app_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Lazada App ID${YELLOW} Specify as: lazada_app_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lazada_app_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Lazada App Secret${YELLOW} Specify as: lazada_app_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lazada_refresh_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Lazada Refresh Token${YELLOW} Specify as: lazada_refresh_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lazada_region${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Lazada API endpoint Region${YELLOW} Specify as: lazada_region=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}etsy_keystring${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Etsy keystring${YELLOW} Specify as: etsy_keystring=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}etsy_shared_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Etsy shared secret${YELLOW} Specify as: etsy_shared_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}etsy_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Access token authorizing the app to access resources on behalf of a user${YELLOW} Specify as: etsy_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}etsy_token_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Secret token authorizing the app to access resources on behalf of a user${YELLOW} Specify as: etsy_token_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}etsy_client_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Etsy Client Id${YELLOW} Specify as: etsy_client_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}etsy_refresh_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Etsy Refresh token${YELLOW} Specify as: etsy_refresh_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}facebook_app_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Facebook App ID${YELLOW} Specify as: facebook_app_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}facebook_app_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Facebook App Secret${YELLOW} Specify as: facebook_app_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}facebook_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Facebook Access Token${YELLOW} Specify as: facebook_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}facebook_business_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Facebook Business ID${YELLOW} Specify as: facebook_business_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}neto_api_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Neto API Key${YELLOW} Specify as: neto_api_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}neto_api_username${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Neto User Name${YELLOW} Specify as: neto_api_username=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopline_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shopline APP Key${YELLOW} Specify as: shopline_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopline_app_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shopline APP Key${YELLOW} Specify as: shopline_app_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopline_app_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shopline App Secret${YELLOW} Specify as: shopline_app_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopline_shared_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shopline Shared Secret${YELLOW} Specify as: shopline_shared_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopify_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Access token authorizing the app to access resources on behalf of a user${YELLOW} Specify as: shopify_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopify_api_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shopify API Key${YELLOW} Specify as: shopify_api_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopify_api_password${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shopify API Password${YELLOW} Specify as: shopify_api_password=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopify_shared_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shared secret${YELLOW} Specify as: shopify_shared_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopee_partner_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shopee Partner ID${YELLOW} Specify as: shopee_partner_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopee_partner_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shopee Partner Key${YELLOW} Specify as: shopee_partner_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopee_shop_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shopee SHOP ID${YELLOW} Specify as: shopee_shop_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopee_refresh_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shopee Refresh Token${YELLOW} Specify as: shopee_refresh_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopee_region${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shopee API endpoint Region. Use for Chinese Mainland or Brazil.${YELLOW} Specify as: shopee_region=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopee_environment${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shopee Environment${YELLOW} Specify as: shopee_environment=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shoplazza_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Access token authorizing the app to access resources on behalf of a user${YELLOW} Specify as: shoplazza_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shoplazza_shared_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shared secret${YELLOW} Specify as: shoplazza_shared_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}miva_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Miva access token${YELLOW} Specify as: miva_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}miva_signature${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Miva signature${YELLOW} Specify as: miva_signature=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopware_access_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shopware access key${YELLOW} Specify as: shopware_access_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopware_api_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shopware api key${YELLOW} Specify as: shopware_api_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shopware_api_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Shopware client secret access key${YELLOW} Specify as: shopware_api_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}bigcartel_user_name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Subdomain of store${YELLOW} Specify as: bigcartel_user_name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}bigcartel_password${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - BigCartel account password${YELLOW} Specify as: bigcartel_password=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}bricklink_consumer_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Bricklink Consumer Key${YELLOW} Specify as: bricklink_consumer_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}bricklink_consumer_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Bricklink Consumer Secret${YELLOW} Specify as: bricklink_consumer_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}bricklink_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Bricklink Access Token${YELLOW} Specify as: bricklink_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}bricklink_token_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Bricklink Access Token Secret${YELLOW} Specify as: bricklink_token_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}volusion_login${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - It's a Volusion account for which API is enabled${YELLOW} Specify as: volusion_login=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}volusion_password${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Volusion API Password${YELLOW} Specify as: volusion_password=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}walmart_client_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Walmart client ID. For the region 'ca' use Consumer ID${YELLOW} Specify as: walmart_client_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}walmart_client_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Walmart client secret. For the region 'ca' use Private Key${YELLOW} Specify as: walmart_client_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}walmart_environment${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: production)${OFF} - Walmart environment${YELLOW} Specify as: walmart_environment=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}walmart_channel_type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Walmart WM_CONSUMER.CHANNEL.TYPE header${YELLOW} Specify as: walmart_channel_type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}walmart_region${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: us)${OFF} - Walmart region${YELLOW} Specify as: walmart_region=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}square_client_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Square (Weebly) Client ID${YELLOW} Specify as: square_client_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}square_client_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Square (Weebly) Client Secret${YELLOW} Specify as: square_client_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}square_refresh_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Square (Weebly) Refresh Token${YELLOW} Specify as: square_refresh_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}squarespace_api_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Squarespace API Key${YELLOW} Specify as: squarespace_api_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}squarespace_client_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Squarespace Connector Client ID${YELLOW} Specify as: squarespace_client_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}squarespace_client_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Squarespace Connector Client Secret${YELLOW} Specify as: squarespace_client_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}squarespace_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Squarespace access token${YELLOW} Specify as: squarespace_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}squarespace_refresh_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Squarespace refresh token${YELLOW} Specify as: squarespace_refresh_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}hybris_client_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Omni Commerce Connector Client ID${YELLOW} Specify as: hybris_client_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}hybris_client_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Omni Commerce Connector Client Secret${YELLOW} Specify as: hybris_client_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}hybris_username${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - User Name${YELLOW} Specify as: hybris_username=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}hybris_password${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - User password${YELLOW} Specify as: hybris_password=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}hybris_websites${OFF} ${BLUE}[array[string]]${OFF} ${CYAN}(default: null)${OFF} - Websites to stores mapping data${YELLOW} Specify as: hybris_websites=value1 hybris_websites=value2 hybris_websites=...${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lightspeed_api_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - LightSpeed api key${YELLOW} Specify as: lightspeed_api_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lightspeed_api_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - LightSpeed api secret${YELLOW} Specify as: lightspeed_api_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}commercehq_api_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - CommerceHQ api key${YELLOW} Specify as: commercehq_api_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}commercehq_api_password${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - CommerceHQ api password${YELLOW} Specify as: commercehq_api_password=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}wc_consumer_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Woocommerce consumer key${YELLOW} Specify as: wc_consumer_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}wc_consumer_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Woocommerce consumer secret${YELLOW} Specify as: wc_consumer_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}magento_consumer_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Magento Consumer Key${YELLOW} Specify as: magento_consumer_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}magento_consumer_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Magento Consumer Secret${YELLOW} Specify as: magento_consumer_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}magento_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Magento Access Token${YELLOW} Specify as: magento_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}magento_token_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Magento Token Secret${YELLOW} Specify as: magento_token_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}prestashop_webservice_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Prestashop webservice key${YELLOW} Specify as: prestashop_webservice_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}wix_app_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Wix App ID${YELLOW} Specify as: wix_app_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}wix_app_secret_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Wix App Secret Key${YELLOW} Specify as: wix_app_secret_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}wix_instance_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Wix Instance ID${YELLOW} Specify as: wix_instance_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}wix_refresh_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Wix refresh token${YELLOW} Specify as: wix_refresh_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}mercado_libre_app_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Mercado Libre App ID${YELLOW} Specify as: mercado_libre_app_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}mercado_libre_app_secret_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Mercado Libre App Secret Key${YELLOW} Specify as: mercado_libre_app_secret_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}mercado_libre_refresh_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Mercado Libre Refresh Token${YELLOW} Specify as: mercado_libre_refresh_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}zid_client_id${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - Zid Client ID${YELLOW} Specify as: zid_client_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}zid_client_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Zid Client Secret${YELLOW} Specify as: zid_client_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}zid_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Zid Access Token${YELLOW} Specify as: zid_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}zid_authorization${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Zid Authorization${YELLOW} Specify as: zid_authorization=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}zid_refresh_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Zid refresh token${YELLOW} Specify as: zid_refresh_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}flipkart_client_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Flipkart Client ID${YELLOW} Specify as: flipkart_client_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}flipkart_client_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Flipkart Client Secret${YELLOW} Specify as: flipkart_client_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}allegro_client_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Allegro Client ID${YELLOW} Specify as: allegro_client_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}allegro_client_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Allegro Client Secret${YELLOW} Specify as: allegro_client_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}allegro_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Allegro Access Token${YELLOW} Specify as: allegro_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}allegro_refresh_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Allegro Refresh Token${YELLOW} Specify as: allegro_refresh_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}allegro_environment${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: production)${OFF} - Allegro Environment${YELLOW} Specify as: allegro_environment=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}zoho_client_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Zoho Client ID${YELLOW} Specify as: zoho_client_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}zoho_client_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Zoho Client Secret${YELLOW} Specify as: zoho_client_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}zoho_refresh_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Zoho Refresh Token${YELLOW} Specify as: zoho_refresh_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}zoho_region${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Zoho API endpoint Region${YELLOW} Specify as: zoho_region=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tiendanube_user_id${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - Tiendanube User ID${YELLOW} Specify as: tiendanube_user_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tiendanube_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Tiendanube Access Token${YELLOW} Specify as: tiendanube_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tiendanube_client_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Tiendanube Client Secret${YELLOW} Specify as: tiendanube_client_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}otto_client_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Otto Client ID${YELLOW} Specify as: otto_client_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}otto_client_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Otto Client Secret${YELLOW} Specify as: otto_client_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}otto_app_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Otto App ID${YELLOW} Specify as: otto_app_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}otto_refresh_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Otto Refresh Token${YELLOW} Specify as: otto_refresh_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}otto_environment${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Otto Environment${YELLOW} Specify as: otto_environment=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}otto_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Otto Access Token${YELLOW} Specify as: otto_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tiktokshop_app_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - TikTok Shop App Key${YELLOW} Specify as: tiktokshop_app_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tiktokshop_app_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - TikTok Shop App Secret${YELLOW} Specify as: tiktokshop_app_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tiktokshop_refresh_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - TikTok Shop Refresh Token${YELLOW} Specify as: tiktokshop_refresh_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tiktokshop_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - TikTok Shop Access Token${YELLOW} Specify as: tiktokshop_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}salla_client_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Salla Client ID${YELLOW} Specify as: salla_client_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}salla_client_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Salla Client Secret${YELLOW} Specify as: salla_client_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}salla_refresh_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Salla Refresh Token${YELLOW} Specify as: salla_refresh_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}salla_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Salla Access Token${YELLOW} Specify as: salla_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}temu_app_key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Temu App Key${YELLOW} Specify as: temu_app_key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}temu_app_secret${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Temu App Secret${YELLOW} Specify as: temu_app_secret=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}temu_access_token${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Temu Access Token${YELLOW} Specify as: temu_access_token=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}temu_region${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Temu API endpoint Region.${YELLOW} Specify as: temu_region=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for accountFailedWebhooks operation
#
##############################################################################
print_accountFailedWebhooks_help() {
    echo ""
    echo -e "${BOLD}${WHITE}accountFailedWebhooks - account.failed_webhooks${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "If the callback of your service for some reason could not accept webhooks from API2Cart, then with the help of this method you can get a list of missed webhooks to perform synchronization again using entity_id. Please note that we keep such records for 24 hours." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - List of сomma-separated webhook ids${YELLOW} Specify as: ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for accountSupportedPlatforms operation
#
##############################################################################
print_accountSupportedPlatforms_help() {
    echo ""
    echo -e "${BOLD}${WHITE}accountSupportedPlatforms - account.supported_platforms${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Use this method to retrieve a list of supported platforms and the sets of parameters required for connecting to each of them. Note: some platforms may have multiple connection methods so that the response will contain multiple sets of parameters." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for attributeAdd operation
#
##############################################################################
print_attributeAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}attributeAdd - attribute.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add new attribute" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}type${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines attribute's type${YELLOW} Specify as: type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines attributes's name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}code${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity code${YELLOW} Specify as: code=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}visible${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Set visibility status${YELLOW} Specify as: visible=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}required${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Defines if the option is required${YELLOW} Specify as: required=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}position${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Attribute's position${YELLOW} Specify as: position=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_group_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter by attribute_group_id${YELLOW} Specify as: attribute_group_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}is_global${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: Store)${OFF} - Attribute saving scope${YELLOW} Specify as: is_global=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}is_searchable${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Use attribute in Quick Search${YELLOW} Specify as: is_searchable=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}is_filterable${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: No)${OFF} - Use In Layered Navigation${YELLOW} Specify as: is_filterable=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}is_comparable${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Comparable on Front-end${YELLOW} Specify as: is_comparable=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}is_html_allowed_on_front${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Allow HTML Tags on Frontend${YELLOW} Specify as: is_html_allowed_on_front=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}is_filterable_in_search${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Use In Search Results Layered Navigation${YELLOW} Specify as: is_filterable_in_search=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}is_configurable${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Use To Create Configurable Product${YELLOW} Specify as: is_configurable=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}is_visible_in_advanced_search${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Use in Advanced Search${YELLOW} Specify as: is_visible_in_advanced_search=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}is_used_for_promo_rules${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Use for Promo Rule Conditions${YELLOW} Specify as: is_used_for_promo_rules=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}used_in_product_listing${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Used in Product Listing${YELLOW} Specify as: used_in_product_listing=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}used_for_sort_by${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Used for Sorting in Product Listing${YELLOW} Specify as: used_for_sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}apply_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: all_types)${OFF} - Types of products which can have this attribute${YELLOW} Specify as: apply_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for attributeAssignGroup operation
#
##############################################################################
print_attributeAssignGroup_help() {
    echo ""
    echo -e "${BOLD}${WHITE}attributeAssignGroup - attribute.assign.group${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Assign attribute to the group" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Attribute group_id${YELLOW} Specify as: group_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_set_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Attribute set id${YELLOW} Specify as: attribute_set_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for attributeAssignSet operation
#
##############################################################################
print_attributeAssignSet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}attributeAssignSet - attribute.assign.set${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Assign attribute to the attribute set" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_set_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Attribute set id${YELLOW} Specify as: attribute_set_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Attribute group_id${YELLOW} Specify as: group_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for attributeAttributesetList operation
#
##############################################################################
print_attributeAttributesetList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}attributeAttributesetList - attribute.attributeset.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get attribute_set list" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,name)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for attributeCount operation
#
##############################################################################
print_attributeCount_help() {
    echo ""
    echo -e "${BOLD}${WHITE}attributeCount - attribute.count${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get attributes count" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines attribute's type${YELLOW} Specify as: type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_set_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter items by attribute set id${YELLOW} Specify as: attribute_set_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}visible${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Filter items by visibility status${YELLOW} Specify as: visible=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}required${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Defines if the option is required${YELLOW} Specify as: required=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}system${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - True if attribute is system${YELLOW} Specify as: system=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for attributeDelete operation
#
##############################################################################
print_attributeDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}attributeDelete - attribute.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete attribute from store" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for attributeGroupList operation
#
##############################################################################
print_attributeGroupList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}attributeGroupList - attribute.group.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get attribute group list" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_set_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Attribute set id${YELLOW} Specify as: attribute_set_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,name)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for attributeInfo operation
#
##############################################################################
print_attributeInfo_help() {
    echo ""
    echo -e "${BOLD}${WHITE}attributeInfo - attribute.info${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get information about a specific global attribute by its ID." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_set_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Attribute set id${YELLOW} Specify as: attribute_set_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: force_all)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for attributeList operation
#
##############################################################################
print_attributeList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}attributeList - attribute.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get a list of global attributes." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter attributes by ids${YELLOW} Specify as: attribute_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_set_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter items by attribute set id${YELLOW} Specify as: attribute_set_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves attributes on specified language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines attribute's type${YELLOW} Specify as: type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}visible${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Filter items by visibility status${YELLOW} Specify as: visible=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}required${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Defines if the option is required${YELLOW} Specify as: required=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}system${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - True if attribute is system${YELLOW} Specify as: system=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,name,code,type)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for attributeTypeList operation
#
##############################################################################
print_attributeTypeList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}attributeTypeList - attribute.type.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get list of supported attributes types" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for attributeUnassignGroup operation
#
##############################################################################
print_attributeUnassignGroup_help() {
    echo ""
    echo -e "${BOLD}${WHITE}attributeUnassignGroup - attribute.unassign.group${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Unassign attribute from group" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Customer group_id${YELLOW} Specify as: group_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for attributeUnassignSet operation
#
##############################################################################
print_attributeUnassignSet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}attributeUnassignSet - attribute.unassign.set${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Unassign attribute from attribute set" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_set_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Attribute set id${YELLOW} Specify as: attribute_set_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for attributeUpdate operation
#
##############################################################################
print_attributeUpdate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}attributeUpdate - attribute.update${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Update attribute data" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines new attributes's name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for attributeValueAdd operation
#
##############################################################################
print_attributeValueAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}attributeValueAdd - attribute.value.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add new value to attribute." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}attribute_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Attribute Id${YELLOW} Specify as: attribute_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines attribute value's name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}code${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity code${YELLOW} Specify as: code=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}description${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines attribute value's description${YELLOW} Specify as: description=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for attributeValueDelete operation
#
##############################################################################
print_attributeValueDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}attributeValueDelete - attribute.value.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete attribute value." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Attribute Id${YELLOW} Specify as: attribute_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for attributeValueUpdate operation
#
##############################################################################
print_attributeValueUpdate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}attributeValueUpdate - attribute.value.update${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Update attribute value." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines attribute value's id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Attribute Id${YELLOW} Specify as: attribute_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines attribute value's name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}description${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines new attribute value's description${YELLOW} Specify as: description=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}code${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity code${YELLOW} Specify as: code=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for basketInfo operation
#
##############################################################################
print_basketInfo_help() {
    echo ""
    echo -e "${BOLD}${WHITE}basketInfo - basket.info${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Retrieve basket information." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: force_all)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for basketItemAdd operation
#
##############################################################################
print_basketItemAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}basketItemAdd - basket.item.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add item to basket" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}customer_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders specified by customer id${YELLOW} Specify as: customer_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines id of the product which should be added to the basket${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}variant_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines product's variants specified by variant id${YELLOW} Specify as: variant_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}quantity${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Defines new items quantity${YELLOW} Specify as: quantity=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for basketLiveShippingServiceCreate operation
#
##############################################################################
print_basketLiveShippingServiceCreate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}basketLiveShippingServiceCreate - basket.live_shipping_service.create${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Create live shipping rate service." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Shipping Service Name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}callback${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Callback url that returns shipping rates. It should be able to accept POST requests with json data.${YELLOW} Specify as: callback=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for basketLiveShippingServiceDelete operation
#
##############################################################################
print_basketLiveShippingServiceDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}basketLiveShippingServiceDelete - basket.live_shipping_service.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete live shipping rate service." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for basketLiveShippingServiceList operation
#
##############################################################################
print_basketLiveShippingServiceList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}basketLiveShippingServiceList - basket.live_shipping_service.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Retrieve a list of live shipping rate services." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for batchJobList operation
#
##############################################################################
print_batchJobList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}batchJobList - batch.job.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get list of recent jobs" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter batch jobs by ids${YELLOW} Specify as: ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}processed_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities according to their processing datetime${YELLOW} Specify as: processed_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}processed_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities according to their processing datetime${YELLOW} Specify as: processed_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: {return_code,return_message,pagination,result})${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for batchJobResult operation
#
##############################################################################
print_batchJobResult_help() {
    echo ""
    echo -e "${BOLD}${WHITE}batchJobResult - batch.job.result${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get job result data" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for bridgeDelete operation
#
##############################################################################
print_bridgeDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}bridgeDelete - bridge.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete bridge from the store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for bridgeDownload operation
#
##############################################################################
print_bridgeDownload_help() {
    echo ""
    echo -e "${BOLD}${WHITE}bridgeDownload - bridge.download${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Download bridge for store.</br>Please note that the method would not work if you call it from Swagger UI." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}whitelabel${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Identifies if there is a necessity to download whitelabel bridge.${YELLOW} Specify as: whitelabel=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for bridgeUpdate operation
#
##############################################################################
print_bridgeUpdate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}bridgeUpdate - bridge.update${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Update bridge in the store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartCatalogPriceRulesCount operation
#
##############################################################################
print_cartCatalogPriceRulesCount_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartCatalogPriceRulesCount - cart.catalog_price_rules.count${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get count of cart catalog price rules discounts." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartCatalogPriceRulesList operation
#
##############################################################################
print_cartCatalogPriceRulesList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartCatalogPriceRulesList - cart.catalog_price_rules.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get cart catalog price rules discounts." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves  catalog_price_rules by ids${YELLOW} Specify as: ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,name,description)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartCouponAdd operation
#
##############################################################################
print_cartCouponAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartCouponAdd - cart.coupon.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Use this method to create a coupon with specified conditions." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartCouponConditionAdd operation
#
##############################################################################
print_cartCouponConditionAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartCouponConditionAdd - cart.coupon.condition.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Use this method to add additional conditions for coupon application." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}coupon_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Coupon Id${YELLOW} Specify as: coupon_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}entity${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines condition entity type${YELLOW} Specify as: entity=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}key${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines condition entity attribute key${YELLOW} Specify as: key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}operator${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines condition operator${YELLOW} Specify as: operator=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}value${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines condition value, can be comma separated according to the operator.${YELLOW} Specify as: value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}target${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: coupon_prerequisite)${OFF} - Defines condition operator${YELLOW} Specify as: target=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}include_tax${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Indicates whether to apply a discount for taxes.${YELLOW} Specify as: include_tax=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}include_shipping${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Indicates whether to apply a discount for shipping.${YELLOW} Specify as: include_shipping=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartCouponCount operation
#
##############################################################################
print_cartCouponCount_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartCouponCount - cart.coupon.count${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This method allows you to get the number of coupons. On some platforms, you can filter the coupons by the date they were active." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}avail${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: true)${OFF} - Defines category's visibility status${YELLOW} Specify as: avail=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}date_start_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter entity by date_start (greater or equal)${YELLOW} Specify as: date_start_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}date_start_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter entity by date_start (less or equal)${YELLOW} Specify as: date_start_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}date_end_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter entity by date_end (greater or equal)${YELLOW} Specify as: date_end_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}date_end_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter entity by date_end (less or equal)${YELLOW} Specify as: date_end_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartCouponDelete operation
#
##############################################################################
print_cartCouponDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartCouponDelete - cart.coupon.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete coupon" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartCouponList operation
#
##############################################################################
print_cartCouponList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartCouponList - cart.coupon.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get cart coupon discounts." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}coupons_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter coupons by ids${YELLOW} Specify as: coupons_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter coupons by store id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}avail${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Filter coupons by avail status${YELLOW} Specify as: avail=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}date_start_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter entity by date_start (greater or equal)${YELLOW} Specify as: date_start_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}date_start_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter entity by date_start (less or equal)${YELLOW} Specify as: date_start_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}date_end_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter entity by date_end (greater or equal)${YELLOW} Specify as: date_end_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}date_end_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter entity by date_end (less or equal)${YELLOW} Specify as: date_end_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,code,name,description)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartDelete operation
#
##############################################################################
print_cartDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartDelete - cart.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Remove store from API2Cart" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}delete_bridge${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: true)${OFF} - Identifies if there is a necessity to delete bridge${YELLOW} Specify as: delete_bridge=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartGiftcardAdd operation
#
##############################################################################
print_cartGiftcardAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartGiftcardAdd - cart.giftcard.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Use this method to create a gift card for a specified amount." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}amount${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines the gift card amount value.${YELLOW} Specify as: amount=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}code${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Gift card code${YELLOW} Specify as: code=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}owner_email${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Gift card owner email${YELLOW} Specify as: owner_email=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}recipient_email${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Gift card recipient email${YELLOW} Specify as: recipient_email=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}recipient_name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Gift card recipient name${YELLOW} Specify as: recipient_name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}owner_name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Gift card owner name${YELLOW} Specify as: owner_name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartGiftcardCount operation
#
##############################################################################
print_cartGiftcardCount_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartGiftcardCount - cart.giftcard.count${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get gift cards count." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartGiftcardDelete operation
#
##############################################################################
print_cartGiftcardDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartGiftcardDelete - cart.giftcard.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete giftcard" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartGiftcardList operation
#
##############################################################################
print_cartGiftcardList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartGiftcardList - cart.giftcard.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get gift cards list." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,code,name)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartInfo operation
#
##############################################################################
print_cartInfo_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartInfo - cart.info${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This method allows you to get various information about the store, including a list of stores (in the case of a multistore configuration), a list of supported languages, currencies, carriers, warehouses, and many other information. This information contains data that is relatively stable and rarely changes, so API2Cart can cache certain data to reduce the load on the store and speed up the execution of the request. We also recommend that you cache the response of this method on your side to save requests. If you need to clear the cache for a specific store, then use the cart.validate method." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: store_name,store_url,db_prefix)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartMetaDataList operation
#
##############################################################################
print_cartMetaDataList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartMetaDataList - cart.meta_data.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Using this method, you can get a list of metadata for various entities (products, options, customers, orders). Usually this is data created by third-party plugins." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}entity_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity Id${YELLOW} Specify as: entity_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}entity${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: product)${OFF} - Entity${YELLOW} Specify as: entity=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}key${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Key${YELLOW} Specify as: key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: key,value)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartMetaDataSet operation
#
##############################################################################
print_cartMetaDataSet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartMetaDataSet - cart.meta_data.set${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Set meta data for a specific entity" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}entity_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity Id${YELLOW} Specify as: entity_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}key${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Key${YELLOW} Specify as: key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}value${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Value${YELLOW} Specify as: value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}namespace${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Metafield namespace${YELLOW} Specify as: namespace=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}entity${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: product)${OFF} - Entity${YELLOW} Specify as: entity=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartMetaDataUnset operation
#
##############################################################################
print_cartMetaDataUnset_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartMetaDataUnset - cart.meta_data.unset${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Unset meta data for a specific entity" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}entity_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity Id${YELLOW} Specify as: entity_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}key${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Key${YELLOW} Specify as: key=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}entity${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: product)${OFF} - Entity${YELLOW} Specify as: entity=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartMethods operation
#
##############################################################################
print_cartMethods_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartMethods - cart.methods${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Returns a list of supported API methods." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartPluginList operation
#
##############################################################################
print_cartPluginList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartPluginList - cart.plugin.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get a list of third-party plugins installed on the store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartScriptAdd operation
#
##############################################################################
print_cartScriptAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartScriptAdd - cart.script.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add new script to the storefront" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The user-friendly script name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}description${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The user-friendly description${YELLOW} Specify as: description=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}html${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - An html string containing exactly one 'script' tag.${YELLOW} Specify as: html=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}src${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The URL of the remote script${YELLOW} Specify as: src=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}load_method${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The load method to use for the script${YELLOW} Specify as: load_method=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}scope${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: storefront)${OFF} - The page or pages on the online store where the script should be included${YELLOW} Specify as: scope=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}events${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Event for run scripts${YELLOW} Specify as: events=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartScriptDelete operation
#
##############################################################################
print_cartScriptDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartScriptDelete - cart.script.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Remove script from the storefront" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartScriptList operation
#
##############################################################################
print_cartScriptList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartScriptList - cart.script.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get scripts installed to the storefront" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}script_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves only scripts with specific ids${YELLOW} Specify as: script_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,name,description)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartShippingZonesList operation
#
##############################################################################
print_cartShippingZonesList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartShippingZonesList - cart.shipping_zones.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get list of shipping zones" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,name,enabled)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for cartValidate operation
#
##############################################################################
print_cartValidate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cartValidate - cart.validate${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This method clears the cache in API2Cart for a particular store and checks whether the connection to the store is available. Use this method if there have been any changes in the settings on the storе, for example, if a new plugin has been installed or removed." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}validate_version${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Specify if api2cart should validate cart version${YELLOW} Specify as: validate_version=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for categoryAdd operation
#
##############################################################################
print_categoryAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}categoryAdd - category.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add new category in store" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines category's name that has to be added${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}description${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines category's description${YELLOW} Specify as: description=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}short_description${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines short description${YELLOW} Specify as: short_description=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}parent_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Adds categories specified by parent id${YELLOW} Specify as: parent_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}avail${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: true)${OFF} - Defines category's visibility status${YELLOW} Specify as: avail=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_time${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity's date creation${YELLOW} Specify as: created_time=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_time${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity's date modification${YELLOW} Specify as: modified_time=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_order${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Sort number in the list${YELLOW} Specify as: sort_order=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}meta_title${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines unique meta title for each entity${YELLOW} Specify as: meta_title=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}meta_description${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines unique meta description of a entity${YELLOW} Specify as: meta_description=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}meta_keywords${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines unique meta keywords for each entity${YELLOW} Specify as: meta_keywords=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}seo_url${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines unique category's URL for SEO${YELLOW} Specify as: seo_url=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}stores_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Create category in the stores that is specified by comma-separated stores' id${YELLOW} Specify as: stores_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for categoryAddBatch operation
#
##############################################################################
print_categoryAddBatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}categoryAddBatch - category.add.batch${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add new categories to the store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for categoryAssign operation
#
##############################################################################
print_categoryAssign_help() {
    echo ""
    echo -e "${BOLD}${WHITE}categoryAssign - category.assign${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Assign category to product" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}category_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines category assign, specified by category id${YELLOW} Specify as: category_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines category assign to the product, specified by product id${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for categoryCount operation
#
##############################################################################
print_categoryCount_help() {
    echo ""
    echo -e "${BOLD}${WHITE}categoryCount - category.count${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Count categories in store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}parent_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts categories specified by parent id${YELLOW} Specify as: parent_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts category specified by store id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts category specified by language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}avail${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: true)${OFF} - Defines category's visibility status${YELLOW} Specify as: avail=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}product_type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A categorization for the product${YELLOW} Specify as: product_type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_value${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity search that is specified by some value${YELLOW} Specify as: find_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_where${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts categories that are searched specified by field${YELLOW} Specify as: find_where=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}report_request_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Report request id${YELLOW} Specify as: report_request_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}disable_report_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Disable report cache for current request${YELLOW} Specify as: disable_report_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for categoryDelete operation
#
##############################################################################
print_categoryDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}categoryDelete - category.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete category in store" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines category removal, specified by category id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for categoryFind operation
#
##############################################################################
print_categoryFind_help() {
    echo ""
    echo -e "${BOLD}${WHITE}categoryFind - category.find${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Search category in store. \"Laptop\" is specified here by default." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}find_value${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity search that is specified by some value${YELLOW} Specify as: find_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_where${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: name)${OFF} - Entity search that is specified by the comma-separated unique fields${YELLOW} Specify as: find_where=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: whole_words)${OFF} - Entity search that is specified by comma-separated parameters${YELLOW} Specify as: find_params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for categoryImageAdd operation
#
##############################################################################
print_categoryImageAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}categoryImageAdd - category.image.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add image to category" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}category_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines category id where the image should be added${YELLOW} Specify as: category_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}image_name${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines image's name${YELLOW} Specify as: image_name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}url${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines URL of the image that has to be added${YELLOW} Specify as: url=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}type${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines image's types that are specified by comma-separated list${YELLOW} Specify as: type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}label${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines alternative text that has to be attached to the picture${YELLOW} Specify as: label=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}mime${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Mime type of image http://en.wikipedia.org/wiki/Internet_media_type.${YELLOW} Specify as: mime=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}position${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Defines image’s position in the list${YELLOW} Specify as: position=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for categoryImageDelete operation
#
##############################################################################
print_categoryImageDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}categoryImageDelete - category.image.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete image" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}category_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines category id where the image should be deleted${YELLOW} Specify as: category_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}image_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Define image id${YELLOW} Specify as: image_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for categoryInfo operation
#
##############################################################################
print_categoryInfo_help() {
    echo ""
    echo -e "${BOLD}${WHITE}categoryInfo - category.info${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get category info about category ID*** or specify other category ID." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Retrieves category's info specified by category id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves category info  specified by store id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves category info  specified by language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}schema_type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The name of the requirements set for the provided schema.${YELLOW} Specify as: schema_type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,parent_id,name,description)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}report_request_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Report request id${YELLOW} Specify as: report_request_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}disable_report_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Disable report cache for current request${YELLOW} Specify as: disable_report_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for categoryList operation
#
##############################################################################
print_categoryList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}categoryList - category.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get list of categories from store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves categories specified by store id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves categorys specified by language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}parent_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves categories specified by parent id${YELLOW} Specify as: parent_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}avail${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: true)${OFF} - Defines category's visibility status${YELLOW} Specify as: avail=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}product_type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A categorization for the product${YELLOW} Specify as: product_type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_value${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity search that is specified by some value${YELLOW} Specify as: find_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_where${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Category search that is specified by field${YELLOW} Specify as: find_where=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,parent_id,name,description)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}report_request_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Report request id${YELLOW} Specify as: report_request_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}disable_report_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Disable report cache for current request${YELLOW} Specify as: disable_report_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}disable_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Disable cache for current request${YELLOW} Specify as: disable_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for categoryUnassign operation
#
##############################################################################
print_categoryUnassign_help() {
    echo ""
    echo -e "${BOLD}${WHITE}categoryUnassign - category.unassign${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Unassign category to product" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}category_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines category unassign, specified by category id${YELLOW} Specify as: category_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines category unassign to the product, specified by product id${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for categoryUpdate operation
#
##############################################################################
print_categoryUpdate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}categoryUpdate - category.update${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Update category in store" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines category update specified by category id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines new category’s name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}description${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines new category's description${YELLOW} Specify as: description=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}short_description${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines short description${YELLOW} Specify as: short_description=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}parent_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines new parent category id${YELLOW} Specify as: parent_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}avail${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Defines category's visibility status${YELLOW} Specify as: avail=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_order${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - Sort number in the list${YELLOW} Specify as: sort_order=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_time${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity's date modification${YELLOW} Specify as: modified_time=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}meta_title${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines unique meta title for each entity${YELLOW} Specify as: meta_title=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}meta_description${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines unique meta description of a entity${YELLOW} Specify as: meta_description=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}meta_keywords${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines unique meta keywords for each entity${YELLOW} Specify as: meta_keywords=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}seo_url${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines unique category's URL for SEO${YELLOW} Specify as: seo_url=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}stores_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Update category in the stores that is specified by comma-separated stores' id${YELLOW} Specify as: stores_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for customerAdd operation
#
##############################################################################
print_customerAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}customerAdd - customer.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add customer into store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for customerAddressAdd operation
#
##############################################################################
print_customerAddressAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}customerAddressAdd - customer.address.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add customer address." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for customerAttributeList operation
#
##############################################################################
print_customerAttributeList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}customerAttributeList - customer.attribute.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get attributes for specific customer" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}customer_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders specified by customer id${YELLOW} Specify as: customer_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: force_all)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for customerCount operation
#
##############################################################################
print_customerCount_help() {
    echo ""
    echo -e "${BOLD}${WHITE}customerCount - customer.count${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get number of customers from store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts customers specified by ids${YELLOW} Specify as: ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}since_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities starting from the specified id.${YELLOW} Specify as: since_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}customer_list_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The numeric ID of the customer list in Demandware.${YELLOW} Specify as: customer_list_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Customer group_id${YELLOW} Specify as: group_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts customer specified by store id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}avail${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: true)${OFF} - Defines category's visibility status${YELLOW} Specify as: avail=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}include_guests${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Indicates whether to include guest customers in the total count.${YELLOW} Specify as: include_guests=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_value${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity search that is specified by some value${YELLOW} Specify as: find_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_where${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts customers that are searched specified by field${YELLOW} Specify as: find_where=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for customerDelete operation
#
##############################################################################
print_customerDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}customerDelete - customer.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete customer from store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Identifies customer specified by the id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for customerFind operation
#
##############################################################################
print_customerFind_help() {
    echo ""
    echo -e "${BOLD}${WHITE}customerFind - customer.find${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Find customers in store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}find_value${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity search that is specified by some value${YELLOW} Specify as: find_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_where${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: email)${OFF} - Entity search that is specified by the comma-separated unique fields${YELLOW} Specify as: find_where=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: whole_words)${OFF} - Entity search that is specified by comma-separated parameters${YELLOW} Specify as: find_params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}include_guests${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Indicates whether to search among guest customers when looking up a customer.${YELLOW} Specify as: include_guests=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for customerGroupAdd operation
#
##############################################################################
print_customerGroupAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}customerGroupAdd - customer.group.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Create customer group." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Customer group name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}stores_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Assign customer group to the stores that is specified by comma-separated stores' id${YELLOW} Specify as: stores_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for customerGroupList operation
#
##############################################################################
print_customerGroupList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}customerGroupList - customer.group.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get list of customers groups." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Groups that will be assigned to a customer${YELLOW} Specify as: group_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,name,additional_fields)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}disable_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Disable cache for current request${YELLOW} Specify as: disable_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for customerInfo operation
#
##############################################################################
print_customerInfo_help() {
    echo ""
    echo -e "${BOLD}${WHITE}customerInfo - customer.info${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get customers' details from store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Retrieves customer's info specified by customer id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves customer info specified by store id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,email,first_name,last_name)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for customerList operation
#
##############################################################################
print_customerList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}customerList - customer.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get list of customers from store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves customers specified by ids${YELLOW} Specify as: ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}since_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities starting from the specified id.${YELLOW} Specify as: since_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}customer_list_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The numeric ID of the customer list in Demandware.${YELLOW} Specify as: customer_list_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Customer group_id${YELLOW} Specify as: group_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves customers specified by store id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}avail${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: true)${OFF} - Defines category's visibility status${YELLOW} Specify as: avail=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}include_guests${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Indicates whether to include guest customers in the list results.${YELLOW} Specify as: include_guests=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_value${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity search that is specified by some value${YELLOW} Specify as: find_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_where${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Customer search that is specified by field${YELLOW} Specify as: find_where=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: created_time)${OFF} - Set field to sort by${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_direction${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: asc)${OFF} - Set sorting direction${YELLOW} Specify as: sort_direction=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,email,first_name,last_name)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for customerUpdate operation
#
##############################################################################
print_customerUpdate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}customerUpdate - customer.update${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Update information of customer in store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for customerWishlistList operation
#
##############################################################################
print_customerWishlistList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}customerWishlistList - customer.wishlist.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get a Wish List of customer from the store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}customer_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders specified by customer id${YELLOW} Specify as: customer_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: {return_code,return_message,pagination,result})${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for marketplaceProductFind operation
#
##############################################################################
print_marketplaceProductFind_help() {
    echo ""
    echo -e "${BOLD}${WHITE}marketplaceProductFind - marketplace.product.find${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Search product in global catalog." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}keyword${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines search keyword${YELLOW} Specify as: keyword=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}categories_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines product add that is specified by comma-separated categories id${YELLOW} Specify as: categories_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}asin${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Amazon Standard Identification Number.${YELLOW} Specify as: asin=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ean${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - European Article Number. An EAN is a unique 8 or 13-digit identifier that many industries (such as book publishers) use to identify products.${YELLOW} Specify as: ean=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}gtin${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Global Trade Item Number. An GTIN is an identifier for trade items.${YELLOW} Specify as: gtin=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}upc${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Universal Product Code. A UPC (UPC-A) is a commonly used identifer for many different products.${YELLOW} Specify as: upc=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}mpn${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Manufacturer Part Number. A MPN is an identifier of a particular part design or material used.${YELLOW} Specify as: mpn=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}isbn${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - International Standard Book Number. An ISBN is a unique identifier for books.${YELLOW} Specify as: isbn=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: force_all)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderAbandonedList operation
#
##############################################################################
print_orderAbandonedList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderAbandonedList - order.abandoned.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get list of orders that were left by customers before completing the order." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}customer_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders specified by customer id${YELLOW} Specify as: customer_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}customer_email${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders specified by customer email${YELLOW} Specify as: customer_email=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}skip_empty_email${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Filter empty emails${YELLOW} Specify as: skip_empty_email=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: customer,totals,items)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderAdd operation
#
##############################################################################
print_orderAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderAdd - order.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add a new order to the cart." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderCount operation
#
##############################################################################
print_orderCount_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderCount - order.count${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Count orders in store" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}order_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts orders specified by order ids${YELLOW} Specify as: order_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts orders specified by ids${YELLOW} Specify as: ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}customer_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts orders quantity specified by customer id${YELLOW} Specify as: customer_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts orders quantity specified by store id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}customer_email${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts orders quantity specified by customer email${YELLOW} Specify as: customer_email=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts orders quantity specified by order status${YELLOW} Specify as: order_status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_status_ids${OFF} ${BLUE}[array[string]]${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders specified by order statuses${YELLOW} Specify as: order_status_ids=value1 order_status_ids=value2 order_status_ids=...${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ebay_order_status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts orders quantity specified by order status${YELLOW} Specify as: ebay_order_status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}financial_status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts orders quantity specified by financial status${YELLOW} Specify as: financial_status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}financial_status_ids${OFF} ${BLUE}[array[string]]${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders count specified by financial status ids${YELLOW} Specify as: financial_status_ids=value1 financial_status_ids=value2 financial_status_ids=...${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}fulfillment_channel${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves order with a fulfillment channel${YELLOW} Specify as: fulfillment_channel=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}fulfillment_status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Create order with fulfillment status${YELLOW} Specify as: fulfillment_status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shipping_method${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities according to shipping method${YELLOW} Specify as: shipping_method=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}delivery_method${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves order with delivery method${YELLOW} Specify as: delivery_method=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tags${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Order tags${YELLOW} Specify as: tags=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ship_node_type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves order with ship node type${YELLOW} Specify as: ship_node_type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderFinancialStatusList operation
#
##############################################################################
print_orderFinancialStatusList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderFinancialStatusList - order.financial_status.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Retrieve list of financial statuses" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderFulfillmentStatusList operation
#
##############################################################################
print_orderFulfillmentStatusList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderFulfillmentStatusList - order.fulfillment_status.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Retrieve list of fulfillment statuses" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}action${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Available statuses for the specified action.${YELLOW} Specify as: action=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderInfo operation
#
##############################################################################
print_orderInfo_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderInfo - order.info${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Info about a specific order by ID" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves order info specified by id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves order’s info specified by order id${YELLOW} Specify as: order_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines store id where the order should be found${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: order_id,customer,totals,address,items,bundles,status)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}enable_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - If the value is 'true' and order exist in our cache, we will return order.info response from cache${YELLOW} Specify as: enable_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}use_latest_api_version${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Use the latest platform API version${YELLOW} Specify as: use_latest_api_version=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderList operation
#
##############################################################################
print_orderList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderList - order.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get list of orders from store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve orders via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders specified by ids${YELLOW} Specify as: ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders specified by order ids${YELLOW} Specify as: order_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}since_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities starting from the specified id.${YELLOW} Specify as: since_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}customer_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders specified by customer id${YELLOW} Specify as: customer_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}customer_email${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders specified by customer email${YELLOW} Specify as: customer_email=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}basket_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves order’s info specified by basket id.${YELLOW} Specify as: basket_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}currency_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Currency Id${YELLOW} Specify as: currency_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}phone${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter orders by customer's phone number${YELLOW} Specify as: phone=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders specified by order status${YELLOW} Specify as: order_status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_status_ids${OFF} ${BLUE}[array[string]]${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders specified by order statuses${YELLOW} Specify as: order_status_ids=value1 order_status_ids=value2 order_status_ids=...${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ebay_order_status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders specified by order status${YELLOW} Specify as: ebay_order_status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}financial_status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders specified by financial status${YELLOW} Specify as: financial_status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}financial_status_ids${OFF} ${BLUE}[array[string]]${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders specified by financial status ids${YELLOW} Specify as: financial_status_ids=value1 financial_status_ids=value2 financial_status_ids=...${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}fulfillment_status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Create order with fulfillment status${YELLOW} Specify as: fulfillment_status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}return_status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves orders specified by return status${YELLOW} Specify as: return_status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}fulfillment_channel${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves order with a fulfillment channel${YELLOW} Specify as: fulfillment_channel=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shipping_method${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities according to shipping method${YELLOW} Specify as: shipping_method=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}skip_order_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Skipped orders by ids${YELLOW} Specify as: skip_order_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}is_deleted${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Filter deleted orders${YELLOW} Specify as: is_deleted=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}shipping_country_iso3${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities according to shipping country${YELLOW} Specify as: shipping_country_iso3=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}delivery_method${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves order with delivery method${YELLOW} Specify as: delivery_method=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ship_node_type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves order with ship node type${YELLOW} Specify as: ship_node_type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tags${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Order tags${YELLOW} Specify as: tags=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: order_id)${OFF} - Set field to sort by${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_direction${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: asc)${OFF} - Set sorting direction${YELLOW} Specify as: sort_direction=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: order_id,customer,totals,address,items,bundles,status)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}enable_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - If the value is 'true', we will cache orders for a 15 minutes in order to increase speed and reduce requests throttling for some methods and shoping platforms (for example order.shipment.add)${YELLOW} Specify as: enable_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}use_latest_api_version${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Use the latest platform API version${YELLOW} Specify as: use_latest_api_version=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderPreestimateShippingList operation
#
##############################################################################
print_orderPreestimateShippingList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderPreestimateShippingList - order.preestimate_shipping.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Retrieve list of order preestimated shipping methods" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderRefundAdd operation
#
##############################################################################
print_orderRefundAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderRefundAdd - order.refund.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add a refund to the order." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderReturnAdd operation
#
##############################################################################
print_orderReturnAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderReturnAdd - order.return.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Create new return request." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderReturnDelete operation
#
##############################################################################
print_orderReturnDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderReturnDelete - order.return.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete return." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}return_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Return ID${YELLOW} Specify as: return_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines the order id${YELLOW} Specify as: order_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderReturnUpdate operation
#
##############################################################################
print_orderReturnUpdate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderReturnUpdate - order.return.update${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Update order's shipment information." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderShipmentAdd operation
#
##############################################################################
print_orderShipmentAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderShipmentAdd - order.shipment.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add a shipment to the order." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderShipmentAddBatch operation
#
##############################################################################
print_orderShipmentAddBatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderShipmentAddBatch - order.shipment.add.batch${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add a shipments to the orders." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderShipmentDelete operation
#
##############################################################################
print_orderShipmentDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderShipmentDelete - order.shipment.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete order's shipment." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}shipment_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Shipment id indicates the number of delivery${YELLOW} Specify as: shipment_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines the order for which the shipment will be deleted${YELLOW} Specify as: order_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderShipmentInfo operation
#
##############################################################################
print_orderShipmentInfo_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderShipmentInfo - order.shipment.info${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get information of shipment." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines the order id${YELLOW} Specify as: order_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,order_id,items,tracking_numbers)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderShipmentList operation
#
##############################################################################
print_orderShipmentList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderShipmentList - order.shipment.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get list of shipments per order." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}order_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Retrieves shipments specified by order id${YELLOW} Specify as: order_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,order_id,items,tracking_numbers)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderShipmentTrackingAdd operation
#
##############################################################################
print_orderShipmentTrackingAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderShipmentTrackingAdd - order.shipment.tracking.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add order shipment's tracking info." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderShipmentUpdate operation
#
##############################################################################
print_orderShipmentUpdate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderShipmentUpdate - order.shipment.update${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Update order's shipment information." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderStatusList operation
#
##############################################################################
print_orderStatusList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderStatusList - order.status.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Retrieve list of statuses" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}action${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Available statuses for the specified action.${YELLOW} Specify as: action=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderTransactionList operation
#
##############################################################################
print_orderTransactionList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderTransactionList - order.transaction.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Retrieve list of order transaction" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}order_ids${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Retrieves order transactions specified by order ids${YELLOW} Specify as: order_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,order_id,amount,description)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for orderUpdate operation
#
##############################################################################
print_orderUpdate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}orderUpdate - order.update${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Update existing order." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}order_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines the orders specified by order id${YELLOW} Specify as: order_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines store id where the order should be found${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines new order's status${YELLOW} Specify as: order_status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}financial_status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Update order financial status to specified${YELLOW} Specify as: financial_status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}fulfillment_status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Create order with fulfillment status${YELLOW} Specify as: fulfillment_status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}cancellation_reason${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines the cancellation reason when the order will be canceled${YELLOW} Specify as: cancellation_reason=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_payment_method${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines order payment method.<br/>Setting order_payment_method on Shopify will also change financial_status field value to 'paid'${YELLOW} Specify as: order_payment_method=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}comment${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specifies order comment${YELLOW} Specify as: comment=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}admin_comment${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specifies admin's order comment${YELLOW} Specify as: admin_comment=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}admin_private_comment${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specifies private admin's order comment${YELLOW} Specify as: admin_private_comment=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}invoice_admin_comment${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specifies admin's order invoice comment${YELLOW} Specify as: invoice_admin_comment=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}date_modified${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specifies order's  modification date${YELLOW} Specify as: date_modified=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}date_finished${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specifies order's  finished date${YELLOW} Specify as: date_finished=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}send_notifications${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Send notifications to customer after order was created${YELLOW} Specify as: send_notifications=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}create_invoice${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Determines whether an invoice should be created if it has not already been created${YELLOW} Specify as: create_invoice=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}origin${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The source of the order${YELLOW} Specify as: origin=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tags${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Order tags${YELLOW} Specify as: tags=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productAdd operation
#
##############################################################################
print_productAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productAdd - product.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add new product to store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productAddBatch operation
#
##############################################################################
print_productAddBatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productAddBatch - product.add.batch${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add new products to the store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productAttributeList operation
#
##############################################################################
print_productAttributeList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productAttributeList - product.attribute.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get list of attributes and values." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Retrieves attributes specified by product id${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves info for specified attribute_id${YELLOW} Specify as: attribute_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}variant_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines product's variants specified by variant id${YELLOW} Specify as: variant_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_group_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter by attribute_group_id${YELLOW} Specify as: attribute_group_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves attributes specified by language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves attributes specified by store id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}set_name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves attributes specified by set_name in Magento${YELLOW} Specify as: set_name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: attribute_id)${OFF} - Set field to sort by${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_direction${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: asc)${OFF} - Set sorting direction${YELLOW} Specify as: sort_direction=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: attribute_id,name)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productAttributeValueSet operation
#
##############################################################################
print_productAttributeValueSet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productAttributeValueSet - product.attribute.value.set${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Set attribute value to product." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines product id where the attribute should be added${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter by attribute_id${YELLOW} Specify as: attribute_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_group_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter by attribute_group_id${YELLOW} Specify as: attribute_group_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Define attribute name${YELLOW} Specify as: attribute_name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}value${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Define attribute value${YELLOW} Specify as: value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}value_id${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - Define attribute value id${YELLOW} Specify as: value_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productAttributeValueUnset operation
#
##############################################################################
print_productAttributeValueUnset_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productAttributeValueUnset - product.attribute.value.unset${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Removes attribute value for a product." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Product id${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}attribute_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Attribute Id${YELLOW} Specify as: attribute_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}include_default${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Boolean, whether or not to unset default value of the attribute, if applicable${YELLOW} Specify as: include_default=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}reindex${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: true)${OFF} - Is reindex required${YELLOW} Specify as: reindex=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}clear_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: true)${OFF} - Is cache clear required${YELLOW} Specify as: clear_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productBrandList operation
#
##############################################################################
print_productBrandList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productBrandList - product.brand.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get list of brands from your store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}brand_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves brands specified by brand ids${YELLOW} Specify as: brand_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}category_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves product brands specified by category id${YELLOW} Specify as: category_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}parent_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves brands specified by parent id${YELLOW} Specify as: parent_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_where${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity search that is specified by the comma-separated unique fields${YELLOW} Specify as: find_where=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_value${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity search that is specified by some value${YELLOW} Specify as: find_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,name,short_description,active,url)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productChildItemFind operation
#
##############################################################################
print_productChildItemFind_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productChildItemFind - product.child_item.find${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Search product child item (bundled item or configurable product variant) in store catalog." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}find_value${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity search that is specified by some value${YELLOW} Specify as: find_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_where${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity search that is specified by the comma-separated unique fields${YELLOW} Specify as: find_where=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: whole_words)${OFF} - Entity search that is specified by comma-separated parameters${YELLOW} Specify as: find_params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productChildItemInfo operation
#
##############################################################################
print_productChildItemInfo_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productChildItemInfo - product.child_item.info${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get child for specific product." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Filter by parent product id${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}currency_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Currency Id${YELLOW} Specify as: currency_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: force_all)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}use_latest_api_version${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Use the latest platform API version${YELLOW} Specify as: use_latest_api_version=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productChildItemList operation
#
##############################################################################
print_productChildItemList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productChildItemList - product.child_item.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get a list of a product's child items, such as variants or bundle components. The total_count field in the response indicates the total number of items in the context of the current filter." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve products child items via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter by parent product id${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}product_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter by parent product ids${YELLOW} Specify as: product_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sku${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter by products variant's sku${YELLOW} Specify as: sku=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}currency_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Currency Id${YELLOW} Specify as: currency_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}avail_sale${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Specifies the set of available/not available products for sale${YELLOW} Specify as: avail_sale=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_value${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity search that is specified by some value${YELLOW} Specify as: find_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_where${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Child products search that is specified by field${YELLOW} Specify as: find_where=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}return_global${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Determines the type of products to be returned. If set to 'true', only global products will be returned; if set to 'false', only local products will be returned.${YELLOW} Specify as: return_global=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: force_all)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}report_request_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Report request id${YELLOW} Specify as: report_request_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}disable_report_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Disable report cache for current request${YELLOW} Specify as: disable_report_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}use_latest_api_version${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Use the latest platform API version${YELLOW} Specify as: use_latest_api_version=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productCount operation
#
##############################################################################
print_productCount_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productCount - product.count${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Count products in store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}product_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts products specified by product ids${YELLOW} Specify as: product_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}since_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities starting from the specified id.${YELLOW} Specify as: since_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}categories_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines product add that is specified by comma-separated categories id${YELLOW} Specify as: categories_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}category_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts products specified by category id${YELLOW} Specify as: category_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts products specified by store id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts products specified by language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}avail_view${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Specifies the set of visible/invisible products${YELLOW} Specify as: avail_view=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}avail_sale${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Specifies the set of available/not available products for sale${YELLOW} Specify as: avail_sale=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}brand_name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves brands specified by brand name${YELLOW} Specify as: brand_name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}product_attributes${OFF} ${BLUE}[array[string]]${OFF} ${CYAN}(default: null)${OFF} - Defines product attributes${YELLOW} Specify as: product_attributes=value1 product_attributes=value2 product_attributes=...${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines product's status${YELLOW} Specify as: status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines products's type${YELLOW} Specify as: type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}visible${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: everywhere)${OFF} - Filter items by visibility status${YELLOW} Specify as: visible=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_value${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity search that is specified by some value${YELLOW} Specify as: find_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_where${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts products that are searched specified by field${YELLOW} Specify as: find_where=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}report_request_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Report request id${YELLOW} Specify as: report_request_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}return_global${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Determines the type of products to be returned. If set to 'true', only global products will be returned; if set to 'false', only local products will be returned.${YELLOW} Specify as: return_global=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}disable_report_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Disable report cache for current request${YELLOW} Specify as: disable_report_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}use_latest_api_version${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Use the latest platform API version${YELLOW} Specify as: use_latest_api_version=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productCurrencyAdd operation
#
##############################################################################
print_productCurrencyAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productCurrencyAdd - product.currency.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add currency and/or set default in store" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}iso3${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Specifies standardized currency code${YELLOW} Specify as: iso3=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}rate${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines the numerical identifier against to the major currency${YELLOW} Specify as: rate=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines currency's name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}avail${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: true)${OFF} - Specifies whether the currency is available${YELLOW} Specify as: avail=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}symbol_left${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines the symbol that is located before the currency${YELLOW} Specify as: symbol_left=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}symbol_right${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines the symbol that is located after the currency${YELLOW} Specify as: symbol_right=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}default${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Specifies currency's default meaning${YELLOW} Specify as: default=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productCurrencyList operation
#
##############################################################################
print_productCurrencyList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productCurrencyList - product.currency.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get list of currencies" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}default${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Specifies the set of default/not default currencies${YELLOW} Specify as: default=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}avail${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Specifies the set of available/not available currencies${YELLOW} Specify as: avail=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: name,iso3,default,avail)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productDelete operation
#
##############################################################################
print_productDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productDelete - product.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Product delete" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Product id that will be removed${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productDeleteBatch operation
#
##############################################################################
print_productDeleteBatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productDeleteBatch - product.delete.batch${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Remove product from the store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productFind operation
#
##############################################################################
print_productFind_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productFind - product.find${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Search product in store catalog. \"Apple\" is specified here by default." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}find_value${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity search that is specified by some value${YELLOW} Specify as: find_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_where${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: name)${OFF} - Entity search that is specified by the comma-separated unique fields${YELLOW} Specify as: find_where=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: whole_words)${OFF} - Entity search that is specified by comma-separated parameters${YELLOW} Specify as: find_params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_what${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: product)${OFF} - Parameter's value specifies the entity that has to be found${YELLOW} Specify as: find_what=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Search products specified by language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productImageAdd operation
#
##############################################################################
print_productImageAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productImageAdd - product.image.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add image to product" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productImageDelete operation
#
##############################################################################
print_productImageDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productImageDelete - product.image.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete image" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines product id where the image should be deleted${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productImageUpdate operation
#
##############################################################################
print_productImageUpdate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productImageUpdate - product.image.update${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Update details of image" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines product id where the image should be updated${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines image update specified by image id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}variant_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines product's variants ids${YELLOW} Specify as: variant_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}image_name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines image's name${YELLOW} Specify as: image_name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: additional)${OFF} - Defines image's types that are specified by comma-separated list${YELLOW} Specify as: type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}label${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines alternative text that has to be attached to the picture${YELLOW} Specify as: label=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}position${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - Defines image’s position in the list${YELLOW} Specify as: position=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}hidden${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Define is hide image${YELLOW} Specify as: hidden=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productInfo operation
#
##############################################################################
print_productInfo_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productInfo - product.info${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get information about a specific product by its ID. In the case of a multistore configuration, use the store_id filter to get a response in the context of a specific store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Retrieves product's info specified by product id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves product info specified by store id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves product info specified by language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}currency_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Currency Id${YELLOW} Specify as: currency_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,name,description,price,categories_ids)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}report_request_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Report request id${YELLOW} Specify as: report_request_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}disable_report_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Disable report cache for current request${YELLOW} Specify as: disable_report_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}use_latest_api_version${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Use the latest platform API version${YELLOW} Specify as: use_latest_api_version=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productList operation
#
##############################################################################
print_productList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productList - product.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get list of products from your store. Returns 10 products by default." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve products via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}product_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves products specified by product ids${YELLOW} Specify as: product_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}since_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities starting from the specified id.${YELLOW} Specify as: since_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}categories_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves products specified by categories ids${YELLOW} Specify as: categories_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}category_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves products specified by category id${YELLOW} Specify as: category_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves products specified by store id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves products specified by language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}currency_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Currency Id${YELLOW} Specify as: currency_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}avail_view${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Specifies the set of visible/invisible products${YELLOW} Specify as: avail_view=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}avail_sale${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Specifies the set of available/not available products for sale${YELLOW} Specify as: avail_sale=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sku${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter by product's sku${YELLOW} Specify as: sku=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}brand_name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves brands specified by brand name${YELLOW} Specify as: brand_name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}product_attributes${OFF} ${BLUE}[array[string]]${OFF} ${CYAN}(default: null)${OFF} - Defines product attributes${YELLOW} Specify as: product_attributes=value1 product_attributes=value2 product_attributes=...${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines product's status${YELLOW} Specify as: status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines products's type${YELLOW} Specify as: type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}visible${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: everywhere)${OFF} - Filter items by visibility status${YELLOW} Specify as: visible=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_value${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity search that is specified by some value${YELLOW} Specify as: find_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_where${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Product search that is specified by field${YELLOW} Specify as: find_where=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}return_global${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Determines the type of products to be returned. If set to 'true', only global products will be returned; if set to 'false', only local products will be returned.${YELLOW} Specify as: return_global=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,name,description,price,categories_ids)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id)${OFF} - Set field to sort by${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_direction${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: asc)${OFF} - Set sorting direction${YELLOW} Specify as: sort_direction=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}report_request_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Report request id${YELLOW} Specify as: report_request_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}disable_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Disable cache for current request${YELLOW} Specify as: disable_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}disable_report_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Disable report cache for current request${YELLOW} Specify as: disable_report_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}use_latest_api_version${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Use the latest platform API version${YELLOW} Specify as: use_latest_api_version=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productManufacturerAdd operation
#
##############################################################################
print_productManufacturerAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productManufacturerAdd - product.manufacturer.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add manufacturer to store and assign to product" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines products specified by product id${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}manufacturer${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines product’s manufacturer's name${YELLOW} Specify as: manufacturer=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productOptionAdd operation
#
##############################################################################
print_productOptionAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productOptionAdd - product.option.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add product option from store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productOptionAssign operation
#
##############################################################################
print_productOptionAssign_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productOptionAssign - product.option.assign${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Assign option from product." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines product id where the option should be assigned${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}option_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines option id which has to be assigned${YELLOW} Specify as: option_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}required${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Defines if the option is required${YELLOW} Specify as: required=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_order${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Sort number in the list${YELLOW} Specify as: sort_order=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}option_values${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines option values that has to be assigned${YELLOW} Specify as: option_values=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}clear_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: true)${OFF} - Is cache clear required${YELLOW} Specify as: clear_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productOptionDelete operation
#
##############################################################################
print_productOptionDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productOptionDelete - product.option.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Product option delete." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}option_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines option id that should be deleted${YELLOW} Specify as: option_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines product id where the option should be deleted${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productOptionList operation
#
##############################################################################
print_productOptionList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productOptionList - product.option.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get list of options." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves products' options specified by product id${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,name,description)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productOptionValueAdd operation
#
##############################################################################
print_productOptionValueAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productOptionValueAdd - product.option.value.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add product option item from option." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines product id where the option value should be added${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}option_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines option id where the value has to be added${YELLOW} Specify as: option_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}option_value${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines option value that has to be added${YELLOW} Specify as: option_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_order${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Sort number in the list${YELLOW} Specify as: sort_order=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}display_value${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines the value that will be displayed for the option value${YELLOW} Specify as: display_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}is_default${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Defines as a default${YELLOW} Specify as: is_default=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}clear_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: true)${OFF} - Is cache clear required${YELLOW} Specify as: clear_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productOptionValueAssign operation
#
##############################################################################
print_productOptionValueAssign_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productOptionValueAssign - product.option.value.assign${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Assign product option item from product." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}product_option_id${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines product's option id where the value has to be assigned${YELLOW} Specify as: product_option_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}option_value_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines value id that has to be assigned${YELLOW} Specify as: option_value_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}clear_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: true)${OFF} - Is cache clear required${YELLOW} Specify as: clear_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productOptionValueDelete operation
#
##############################################################################
print_productOptionValueDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productOptionValueDelete - product.option.value.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Product option value delete." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}option_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines option id where the value should be deleted${YELLOW} Specify as: option_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}option_value_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines option value id that should be deleted${YELLOW} Specify as: option_value_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines product id where the option value should be deleted${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productOptionValueUpdate operation
#
##############################################################################
print_productOptionValueUpdate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productOptionValueUpdate - product.option.value.update${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Update product option item from option." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines product id where the option value should be updated${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}option_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines option id where the value has to be updated${YELLOW} Specify as: option_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}option_value_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines value id that has to be assigned${YELLOW} Specify as: option_value_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}option_value${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines option value that has to be added${YELLOW} Specify as: option_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}price${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - Defines new product option price${YELLOW} Specify as: price=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}quantity${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - Defines new products' options quantity${YELLOW} Specify as: quantity=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}display_value${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines the value that will be displayed for the option value${YELLOW} Specify as: display_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}clear_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: true)${OFF} - Is cache clear required${YELLOW} Specify as: clear_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productPriceAdd operation
#
##############################################################################
print_productPriceAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productPriceAdd - product.price.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add some prices to the product." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productPriceDelete operation
#
##############################################################################
print_productPriceDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productPriceDelete - product.price.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete some prices of the product" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines the product where the price has to be deleted${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_prices${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines product's group prices${YELLOW} Specify as: group_prices=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productPriceUpdate operation
#
##############################################################################
print_productPriceUpdate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productPriceUpdate - product.price.update${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Update some prices of the product." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productReviewList operation
#
##############################################################################
print_productReviewList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productReviewList - product.review.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get reviews of a specific product." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Product id${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves reviews specified by ids${YELLOW} Specify as: ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines status${YELLOW} Specify as: status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,customer_id,email,message,status,product_id,nick_name,summary,rating,ratings,status,created_time)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productStoreAssign operation
#
##############################################################################
print_productStoreAssign_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productStoreAssign - product.store.assign${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Assign product to store" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines id of the product which should be assigned to a store${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines id of the store product should be assigned to${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productTaxAdd operation
#
##############################################################################
print_productTaxAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productTaxAdd - product.tax.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add tax class and tax rate to store and assign to product." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productUpdate operation
#
##############################################################################
print_productUpdate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productUpdate - product.update${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This method can be used to update certain product data. The list of supported parameters depends on the specific platform. Please transmit only those parameters that are supported by the particular platform. Please note that to update the product quantity, it is recommended to use relative parameters (increase_quantity or reduce_quantity) to avoid unexpected overwrites on heavily loaded stores." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productUpdateBatch operation
#
##############################################################################
print_productUpdateBatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productUpdateBatch - product.update.batch${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Update products on the store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productVariantAdd operation
#
##############################################################################
print_productVariantAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productVariantAdd - product.variant.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add variant to product." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productVariantAddBatch operation
#
##############################################################################
print_productVariantAddBatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productVariantAddBatch - product.variant.add.batch${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add new product variants to the store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productVariantDelete operation
#
##############################################################################
print_productVariantDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productVariantDelete - product.variant.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete variant." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines variant removal, specified by variant id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines product's id where the variant has to be deleted${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productVariantDeleteBatch operation
#
##############################################################################
print_productVariantDeleteBatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productVariantDeleteBatch - product.variant.delete.batch${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Remove product variants from the store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productVariantImageAdd operation
#
##############################################################################
print_productVariantImageAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productVariantImageAdd - product.variant.image.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add image to product" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productVariantImageDelete operation
#
##############################################################################
print_productVariantImageDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productVariantImageDelete - product.variant.image.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete  image to product" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines product id where the variant image should be deleted${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}product_variant_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines product's variants specified by variant id${YELLOW} Specify as: product_variant_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productVariantPriceAdd operation
#
##############################################################################
print_productVariantPriceAdd_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productVariantPriceAdd - product.variant.price.add${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Add some prices to the product variant." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productVariantPriceDelete operation
#
##############################################################################
print_productVariantPriceDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productVariantPriceDelete - product.variant.price.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete some prices of the product variant." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines the variant where the price has to be deleted${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}product_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Product id${YELLOW} Specify as: product_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_prices${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Defines variants's group prices${YELLOW} Specify as: group_prices=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productVariantPriceUpdate operation
#
##############################################################################
print_productVariantPriceUpdate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productVariantPriceUpdate - product.variant.price.update${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Update some prices of the product variant." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productVariantUpdate operation
#
##############################################################################
print_productVariantUpdate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productVariantUpdate - product.variant.update${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Update variant." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for productVariantUpdateBatch operation
#
##############################################################################
print_productVariantUpdateBatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}productVariantUpdateBatch - product.variant.update.batch${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Update products variants on the store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for returnActionList operation
#
##############################################################################
print_returnActionList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}returnActionList - return.action.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Retrieve list of return actions" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for returnCount operation
#
##############################################################################
print_returnCount_help() {
    echo ""
    echo -e "${BOLD}${WHITE}returnCount - return.count${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Count returns in store" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}order_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts return requests specified by order ids${YELLOW} Specify as: order_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}customer_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Counts return requests quantity specified by customer id${YELLOW} Specify as: customer_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines status${YELLOW} Specify as: status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}return_type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves returns specified by return type${YELLOW} Specify as: return_type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}report_request_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Report request id${YELLOW} Specify as: report_request_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}disable_report_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Disable report cache for current request${YELLOW} Specify as: disable_report_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for returnInfo operation
#
##############################################################################
print_returnInfo_help() {
    echo ""
    echo -e "${BOLD}${WHITE}returnInfo - return.info${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Retrieve return information." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Entity id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines the order id${YELLOW} Specify as: order_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,order_products)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for returnList operation
#
##############################################################################
print_returnList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}returnList - return.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get list of return requests from store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines the order id${YELLOW} Specify as: order_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves return requests specified by order ids${YELLOW} Specify as: order_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}customer_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves return requests specified by customer id${YELLOW} Specify as: customer_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines status${YELLOW} Specify as: status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}return_type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves returns specified by return type${YELLOW} Specify as: return_type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,order_products)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}report_request_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Report request id${YELLOW} Specify as: report_request_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}disable_report_cache${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: false)${OFF} - Disable report cache for current request${YELLOW} Specify as: disable_report_cache=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for returnReasonList operation
#
##############################################################################
print_returnReasonList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}returnReasonList - return.reason.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Retrieve list of return reasons" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for returnStatusList operation
#
##############################################################################
print_returnStatusList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}returnStatusList - return.status.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Retrieve list of statuses" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for subscriberList operation
#
##############################################################################
print_subscriberList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}subscriberList - subscriber.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get subscribers list" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieves subscribers specified by ids${YELLOW} Specify as: ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}subscribed${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Filter by subscription status${YELLOW} Specify as: subscribed=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}email${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter subscribers by email${YELLOW} Specify as: email=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: force_all)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for taxClassInfo operation
#
##############################################################################
print_taxClassInfo_help() {
    echo ""
    echo -e "${BOLD}${WHITE}taxClassInfo - tax.class.info${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Use this method to get information about a tax class and its rates. It allows you to calculate the tax percentage for a specific customer's address. This information contains relatively static data that rarely changes, so API2Cart may cache certain data to reduce the load on the store and speed up request execution. We also recommend that you cache the response of this method on your side to save requests. If you need to clear the cache for a specific store, use the cart.validate method." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}tax_class_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Retrieves taxes specified by class id${YELLOW} Specify as: tax_class_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: tax_class_id,name,avail)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}exclude${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter 'params' equal force_all${YELLOW} Specify as: exclude=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for taxClassList operation
#
##############################################################################
print_taxClassList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}taxClassList - tax.class.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get list of tax classes from your store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page_cursor${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Used to retrieve entities via cursor-based pagination (it can't be used with any other filtering parameter)${YELLOW} Specify as: page_cursor=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Store Id${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_value${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Entity search that is specified by some value${YELLOW} Specify as: find_value=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}find_where${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Tax class search that is specified by field${YELLOW} Specify as: find_where=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their creation date${YELLOW} Specify as: created_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}created_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their creation date${YELLOW} Specify as: created_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_to${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities to their modification date${YELLOW} Specify as: modified_to=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}modified_from${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Retrieve entities from their modification date${YELLOW} Specify as: modified_from=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: {return_code,return_message,pagination,result})${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for webhookCount operation
#
##############################################################################
print_webhookCount_help() {
    echo ""
    echo -e "${BOLD}${WHITE}webhookCount - webhook.count${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Count registered webhooks on the store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}entity${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The entity you want to filter webhooks by (e.g. order or product)${YELLOW} Specify as: entity=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}action${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The action you want to filter webhooks by (e.g. order or product)${YELLOW} Specify as: action=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}active${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - The webhook status you want to filter webhooks by${YELLOW} Specify as: active=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for webhookCreate operation
#
##############################################################################
print_webhookCreate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}webhookCreate - webhook.create${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Create webhook on the store and subscribe to it." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}entity${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Specify the entity that you want to enable webhooks for (e.g product, order, customer, category)${YELLOW} Specify as: entity=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}action${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Specify what action (event) will trigger the webhook (e.g add, delete, or update)${YELLOW} Specify as: action=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}callback${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Callback url that returns shipping rates. It should be able to accept POST requests with json data.${YELLOW} Specify as: callback=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}label${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The name you give to the webhook${YELLOW} Specify as: label=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: force_all)${OFF} - Fields the webhook should send${YELLOW} Specify as: fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}active${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: true)${OFF} - Webhook status${YELLOW} Specify as: active=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}store_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Defines store id where the webhook should be assigned${YELLOW} Specify as: store_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for webhookDelete operation
#
##############################################################################
print_webhookDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}webhookDelete - webhook.delete${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Delete registered webhook on the store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Webhook id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for webhookEvents operation
#
##############################################################################
print_webhookEvents_help() {
    echo ""
    echo -e "${BOLD}${WHITE}webhookEvents - webhook.events${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "List all Webhooks that are available on this store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for webhookList operation
#
##############################################################################
print_webhookList_help() {
    echo ""
    echo -e "${BOLD}${WHITE}webhookList - webhook.list${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "List registered webhook on the store." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}start${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - This parameter sets the number from which you want to get entities${YELLOW} Specify as: start=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}count${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - This parameter sets the entity amount that has to be retrieved. Max allowed count=250${YELLOW} Specify as: count=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}entity${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The entity you want to filter webhooks by (e.g. order or product)${YELLOW} Specify as: entity=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}action${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The action you want to filter webhooks by (e.g. add, update, or delete)${YELLOW} Specify as: action=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}active${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - The webhook status you want to filter webhooks by${YELLOW} Specify as: active=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - List of сomma-separated webhook ids${YELLOW} Specify as: ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}params${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: id,entity,action,callback)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: params=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for webhookUpdate operation
#
##############################################################################
print_webhookUpdate_help() {
    echo ""
    echo -e "${BOLD}${WHITE}webhookUpdate - webhook.update${OFF}${BLUE}(AUTH - HEADER)${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Update Webhooks parameters." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Webhook id${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}callback${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Callback url that returns shipping rates. It should be able to accept POST requests with json data.${YELLOW} Specify as: callback=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}label${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The name you give to the webhook${YELLOW} Specify as: label=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Fields the webhook should send${YELLOW} Specify as: fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}response_fields${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Set this parameter in order to choose which entity fields you want to retrieve${YELLOW} Specify as: response_fields=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}active${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Webhook status${YELLOW} Specify as: active=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}lang_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Language id${YELLOW} Specify as: lang_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;successful operation${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}


##############################################################################
#
# Call accountCartAdd operation
#
##############################################################################
call_accountCartAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/v1.1/account.cart.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call accountCartList operation
#
##############################################################################
call_accountCartList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(store_url store_key request_from_date request_to_date params exclude  )
    local path

    if ! path=$(build_request_path "/v1.1/account.cart.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call accountConfigUpdate operation
#
##############################################################################
call_accountConfigUpdate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(replace_parameters new_store_url new_store_key bridge_url store_root db_tables_prefix user_agent 3dcart_private_key 3dcart_access_token 3dcartapi_api_key amazon_sp_client_id amazon_sp_client_secret amazon_sp_refresh_token amazon_sp_aws_region amazon_sp_api_environment amazon_seller_id aspdotnetstorefront_api_user aspdotnetstorefront_api_pass bigcommerceapi_admin_account bigcommerceapi_api_path bigcommerceapi_api_key bigcommerceapi_client_id bigcommerceapi_access_token bigcommerceapi_context bol_api_key bol_api_secret bol_retailer_id demandware_client_id demandware_api_password demandware_user_name demandware_user_password ebay_client_id ebay_client_secret ebay_runame ebay_access_token ebay_refresh_token ebay_environment ebay_site_id ecwid_acess_token ecwid_store_id lazada_app_id lazada_app_secret lazada_refresh_token lazada_region etsy_keystring etsy_shared_secret etsy_access_token etsy_token_secret etsy_client_id etsy_refresh_token facebook_app_id facebook_app_secret facebook_access_token facebook_business_id neto_api_key neto_api_username shopline_access_token shopline_app_key shopline_app_secret shopline_shared_secret shopify_access_token shopify_api_key shopify_api_password shopify_shared_secret shopee_partner_id shopee_partner_key shopee_shop_id shopee_refresh_token shopee_region shopee_environment shoplazza_access_token shoplazza_shared_secret miva_access_token miva_signature shopware_access_key shopware_api_key shopware_api_secret bigcartel_user_name bigcartel_password bricklink_consumer_key bricklink_consumer_secret bricklink_token bricklink_token_secret volusion_login volusion_password walmart_client_id walmart_client_secret walmart_environment walmart_channel_type walmart_region square_client_id square_client_secret square_refresh_token squarespace_api_key squarespace_client_id squarespace_client_secret squarespace_access_token squarespace_refresh_token hybris_client_id hybris_client_secret hybris_username hybris_password hybris_websites lightspeed_api_key lightspeed_api_secret commercehq_api_key commercehq_api_password wc_consumer_key wc_consumer_secret magento_consumer_key magento_consumer_secret magento_access_token magento_token_secret prestashop_webservice_key wix_app_id wix_app_secret_key wix_instance_id wix_refresh_token mercado_libre_app_id mercado_libre_app_secret_key mercado_libre_refresh_token zid_client_id zid_client_secret zid_access_token zid_authorization zid_refresh_token flipkart_client_id flipkart_client_secret allegro_client_id allegro_client_secret allegro_access_token allegro_refresh_token allegro_environment zoho_client_id zoho_client_secret zoho_refresh_token zoho_region tiendanube_user_id tiendanube_access_token tiendanube_client_secret otto_client_id otto_client_secret otto_app_id otto_refresh_token otto_environment otto_access_token tiktokshop_app_key tiktokshop_app_secret tiktokshop_refresh_token tiktokshop_access_token salla_client_id salla_client_secret salla_refresh_token salla_access_token temu_app_key temu_app_secret temu_access_token temu_region    )
    local path

    if ! path=$(build_request_path "/v1.1/account.config.update.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call accountFailedWebhooks operation
#
##############################################################################
call_accountFailedWebhooks() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count ids  )
    local path

    if ! path=$(build_request_path "/v1.1/account.failed_webhooks.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call accountSupportedPlatforms operation
#
##############################################################################
call_accountSupportedPlatforms() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/v1.1/account.supported_platforms.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call attributeAdd operation
#
##############################################################################
call_attributeAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(type name code store_id lang_id visible required position attribute_group_id is_global is_searchable is_filterable is_comparable is_html_allowed_on_front is_filterable_in_search is_configurable is_visible_in_advanced_search is_used_for_promo_rules used_in_product_listing used_for_sort_by apply_to    )
    local path

    if ! path=$(build_request_path "/v1.1/attribute.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call attributeAssignGroup operation
#
##############################################################################
call_attributeAssignGroup() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id group_id attribute_set_id    )
    local path

    if ! path=$(build_request_path "/v1.1/attribute.assign.group.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call attributeAssignSet operation
#
##############################################################################
call_attributeAssignSet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id group_id attribute_set_id    )
    local path

    if ! path=$(build_request_path "/v1.1/attribute.assign.set.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call attributeAttributesetList operation
#
##############################################################################
call_attributeAttributesetList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/attribute.attributeset.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call attributeCount operation
#
##############################################################################
call_attributeCount() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(type attribute_set_id store_id lang_id visible required system    )
    local path

    if ! path=$(build_request_path "/v1.1/attribute.count.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call attributeDelete operation
#
##############################################################################
call_attributeDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/attribute.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call attributeGroupList operation
#
##############################################################################
call_attributeGroupList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count attribute_set_id lang_id response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/attribute.group.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call attributeInfo operation
#
##############################################################################
call_attributeInfo() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id attribute_set_id store_id lang_id response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/attribute.info.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call attributeList operation
#
##############################################################################
call_attributeList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count attribute_ids attribute_set_id store_id lang_id type visible required system response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/attribute.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call attributeTypeList operation
#
##############################################################################
call_attributeTypeList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/attribute.type.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call attributeUnassignGroup operation
#
##############################################################################
call_attributeUnassignGroup() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id group_id    )
    local path

    if ! path=$(build_request_path "/v1.1/attribute.unassign.group.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call attributeUnassignSet operation
#
##############################################################################
call_attributeUnassignSet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id attribute_set_id    )
    local path

    if ! path=$(build_request_path "/v1.1/attribute.unassign.set.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call attributeUpdate operation
#
##############################################################################
call_attributeUpdate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id name store_id lang_id    )
    local path

    if ! path=$(build_request_path "/v1.1/attribute.update.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call attributeValueAdd operation
#
##############################################################################
call_attributeValueAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(attribute_id name code description store_id lang_id    )
    local path

    if ! path=$(build_request_path "/v1.1/attribute.value.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call attributeValueDelete operation
#
##############################################################################
call_attributeValueDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id attribute_id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/attribute.value.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call attributeValueUpdate operation
#
##############################################################################
call_attributeValueUpdate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id attribute_id name description code store_id lang_id    )
    local path

    if ! path=$(build_request_path "/v1.1/attribute.value.update.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call basketInfo operation
#
##############################################################################
call_basketInfo() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id store_id response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/basket.info.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call basketItemAdd operation
#
##############################################################################
call_basketItemAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(customer_id product_id variant_id quantity store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/basket.item.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call basketLiveShippingServiceCreate operation
#
##############################################################################
call_basketLiveShippingServiceCreate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(name callback store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/basket.live_shipping_service.create.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call basketLiveShippingServiceDelete operation
#
##############################################################################
call_basketLiveShippingServiceDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id    )
    local path

    if ! path=$(build_request_path "/v1.1/basket.live_shipping_service.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call basketLiveShippingServiceList operation
#
##############################################################################
call_basketLiveShippingServiceList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/basket.live_shipping_service.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call batchJobList operation
#
##############################################################################
call_batchJobList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(count page_cursor ids created_from created_to processed_from processed_to response_fields    )
    local path

    if ! path=$(build_request_path "/v1.1/batch.job.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call batchJobResult operation
#
##############################################################################
call_batchJobResult() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id    )
    local path

    if ! path=$(build_request_path "/v1.1/batch.job.result.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call bridgeDelete operation
#
##############################################################################
call_bridgeDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/bridge.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call bridgeDownload operation
#
##############################################################################
call_bridgeDownload() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(whitelabel    )
    local path

    if ! path=$(build_request_path "/v1.1/bridge.download.file" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call bridgeUpdate operation
#
##############################################################################
call_bridgeUpdate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/bridge.update.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartCatalogPriceRulesCount operation
#
##############################################################################
call_cartCatalogPriceRulesCount() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.catalog_price_rules.count.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartCatalogPriceRulesList operation
#
##############################################################################
call_cartCatalogPriceRulesList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor ids response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.catalog_price_rules.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartCouponAdd operation
#
##############################################################################
call_cartCouponAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.coupon.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call cartCouponConditionAdd operation
#
##############################################################################
call_cartCouponConditionAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(coupon_id entity key operator value target include_tax include_shipping store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.coupon.condition.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartCouponCount operation
#
##############################################################################
call_cartCouponCount() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(store_id avail date_start_from date_start_to date_end_from date_end_to    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.coupon.count.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartCouponDelete operation
#
##############################################################################
call_cartCouponDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.coupon.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartCouponList operation
#
##############################################################################
call_cartCouponList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor coupons_ids store_id lang_id avail date_start_from date_start_to date_end_from date_end_to response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.coupon.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartDelete operation
#
##############################################################################
call_cartDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(delete_bridge    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartGiftcardAdd operation
#
##############################################################################
call_cartGiftcardAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(amount code owner_email recipient_email recipient_name owner_name    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.giftcard.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartGiftcardCount operation
#
##############################################################################
call_cartGiftcardCount() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.giftcard.count.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartGiftcardDelete operation
#
##############################################################################
call_cartGiftcardDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.giftcard.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartGiftcardList operation
#
##############################################################################
call_cartGiftcardList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor store_id response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.giftcard.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartInfo operation
#
##############################################################################
call_cartInfo() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(store_id response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.info.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartMetaDataList operation
#
##############################################################################
call_cartMetaDataList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(count page_cursor entity_id entity store_id lang_id key response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.meta_data.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartMetaDataSet operation
#
##############################################################################
call_cartMetaDataSet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(entity_id key value namespace entity store_id lang_id    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.meta_data.set.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartMetaDataUnset operation
#
##############################################################################
call_cartMetaDataUnset() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(entity_id key id entity store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.meta_data.unset.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartMethods operation
#
##############################################################################
call_cartMethods() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.methods.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartPluginList operation
#
##############################################################################
call_cartPluginList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.plugin.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartScriptAdd operation
#
##############################################################################
call_cartScriptAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(name description html src load_method scope events store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.script.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartScriptDelete operation
#
##############################################################################
call_cartScriptDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.script.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartScriptList operation
#
##############################################################################
call_cartScriptList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor script_ids store_id created_from created_to modified_from modified_to response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.script.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartShippingZonesList operation
#
##############################################################################
call_cartShippingZonesList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count store_id response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.shipping_zones.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call cartValidate operation
#
##############################################################################
call_cartValidate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(validate_version    )
    local path

    if ! path=$(build_request_path "/v1.1/cart.validate.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call categoryAdd operation
#
##############################################################################
call_categoryAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(name description short_description parent_id avail created_time modified_time sort_order meta_title meta_description meta_keywords seo_url store_id stores_ids lang_id    )
    local path

    if ! path=$(build_request_path "/v1.1/category.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call categoryAddBatch operation
#
##############################################################################
call_categoryAddBatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/category.add.batch.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call categoryAssign operation
#
##############################################################################
call_categoryAssign() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(category_id product_id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/category.assign.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call categoryCount operation
#
##############################################################################
call_categoryCount() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(parent_id store_id lang_id avail created_from created_to modified_from modified_to product_type find_value find_where report_request_id disable_report_cache    )
    local path

    if ! path=$(build_request_path "/v1.1/category.count.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call categoryDelete operation
#
##############################################################################
call_categoryDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/category.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call categoryFind operation
#
##############################################################################
call_categoryFind() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(find_value find_where find_params store_id lang_id    )
    local path

    if ! path=$(build_request_path "/v1.1/category.find.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call categoryImageAdd operation
#
##############################################################################
call_categoryImageAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(category_id image_name url type store_id label mime position    )
    local path

    if ! path=$(build_request_path "/v1.1/category.image.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call categoryImageDelete operation
#
##############################################################################
call_categoryImageDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(category_id image_id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/category.image.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call categoryInfo operation
#
##############################################################################
call_categoryInfo() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id store_id lang_id schema_type response_fields params exclude report_request_id disable_report_cache    )
    local path

    if ! path=$(build_request_path "/v1.1/category.info.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call categoryList operation
#
##############################################################################
call_categoryList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor store_id lang_id parent_id avail product_type created_from created_to modified_from modified_to find_value find_where response_fields params exclude report_request_id disable_report_cache disable_cache    )
    local path

    if ! path=$(build_request_path "/v1.1/category.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call categoryUnassign operation
#
##############################################################################
call_categoryUnassign() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(category_id product_id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/category.unassign.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call categoryUpdate operation
#
##############################################################################
call_categoryUpdate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id name description short_description parent_id avail sort_order modified_time meta_title meta_description meta_keywords seo_url store_id stores_ids lang_id    )
    local path

    if ! path=$(build_request_path "/v1.1/category.update.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call customerAdd operation
#
##############################################################################
call_customerAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/customer.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call customerAddressAdd operation
#
##############################################################################
call_customerAddressAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/customer.address.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call customerAttributeList operation
#
##############################################################################
call_customerAttributeList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(count page_cursor customer_id store_id lang_id response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/customer.attribute.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call customerCount operation
#
##############################################################################
call_customerCount() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(ids since_id customer_list_id group_id store_id avail include_guests find_value find_where created_from created_to modified_from modified_to    )
    local path

    if ! path=$(build_request_path "/v1.1/customer.count.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call customerDelete operation
#
##############################################################################
call_customerDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id    )
    local path

    if ! path=$(build_request_path "/v1.1/customer.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call customerFind operation
#
##############################################################################
call_customerFind() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(find_value find_where find_params store_id include_guests    )
    local path

    if ! path=$(build_request_path "/v1.1/customer.find.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call customerGroupAdd operation
#
##############################################################################
call_customerGroupAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(name store_id stores_ids    )
    local path

    if ! path=$(build_request_path "/v1.1/customer.group.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call customerGroupList operation
#
##############################################################################
call_customerGroupList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor group_ids store_id lang_id response_fields params exclude disable_cache    )
    local path

    if ! path=$(build_request_path "/v1.1/customer.group.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call customerInfo operation
#
##############################################################################
call_customerInfo() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id store_id response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/customer.info.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call customerList operation
#
##############################################################################
call_customerList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor ids since_id customer_list_id group_id store_id avail include_guests find_value find_where created_from created_to modified_from modified_to sort_by sort_direction response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/customer.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call customerUpdate operation
#
##############################################################################
call_customerUpdate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/customer.update.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call customerWishlistList operation
#
##############################################################################
call_customerWishlistList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor customer_id id store_id response_fields    )
    local path

    if ! path=$(build_request_path "/v1.1/customer.wishlist.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call marketplaceProductFind operation
#
##############################################################################
call_marketplaceProductFind() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(count page_cursor keyword categories_ids store_id asin ean gtin upc mpn isbn response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/marketplace.product.find.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call orderAbandonedList operation
#
##############################################################################
call_orderAbandonedList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor customer_id customer_email store_id created_from created_to modified_from modified_to skip_empty_email response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/order.abandoned.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call orderAdd operation
#
##############################################################################
call_orderAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/order.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call orderCount operation
#
##############################################################################
call_orderCount() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(order_ids ids customer_id store_id customer_email order_status order_status_ids ebay_order_status financial_status financial_status_ids fulfillment_channel fulfillment_status shipping_method delivery_method tags ship_node_type created_from created_to modified_from modified_to    )
    local path

    if ! path=$(build_request_path "/v1.1/order.count.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call orderFinancialStatusList operation
#
##############################################################################
call_orderFinancialStatusList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/order.financial_status.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call orderFulfillmentStatusList operation
#
##############################################################################
call_orderFulfillmentStatusList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(action    )
    local path

    if ! path=$(build_request_path "/v1.1/order.fulfillment_status.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call orderInfo operation
#
##############################################################################
call_orderInfo() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id order_id store_id params response_fields exclude enable_cache use_latest_api_version    )
    local path

    if ! path=$(build_request_path "/v1.1/order.info.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call orderList operation
#
##############################################################################
call_orderList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor ids order_ids since_id store_id customer_id customer_email basket_id currency_id phone order_status order_status_ids ebay_order_status financial_status financial_status_ids fulfillment_status return_status fulfillment_channel shipping_method skip_order_ids is_deleted shipping_country_iso3 delivery_method ship_node_type created_to created_from modified_to modified_from tags sort_by sort_direction params response_fields exclude enable_cache use_latest_api_version    )
    local path

    if ! path=$(build_request_path "/v1.1/order.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call orderPreestimateShippingList operation
#
##############################################################################
call_orderPreestimateShippingList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/order.preestimate_shipping.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call orderRefundAdd operation
#
##############################################################################
call_orderRefundAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/order.refund.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call orderReturnAdd operation
#
##############################################################################
call_orderReturnAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/order.return.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call orderReturnDelete operation
#
##############################################################################
call_orderReturnDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(return_id order_id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/order.return.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call orderReturnUpdate operation
#
##############################################################################
call_orderReturnUpdate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/order.return.update.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call orderShipmentAdd operation
#
##############################################################################
call_orderShipmentAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/order.shipment.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call orderShipmentAddBatch operation
#
##############################################################################
call_orderShipmentAddBatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/order.shipment.add.batch.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call orderShipmentDelete operation
#
##############################################################################
call_orderShipmentDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(shipment_id order_id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/order.shipment.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call orderShipmentInfo operation
#
##############################################################################
call_orderShipmentInfo() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start id order_id store_id response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/order.shipment.info.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call orderShipmentList operation
#
##############################################################################
call_orderShipmentList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor order_id store_id created_from created_to modified_from modified_to response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/order.shipment.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call orderShipmentTrackingAdd operation
#
##############################################################################
call_orderShipmentTrackingAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/order.shipment.tracking.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call orderShipmentUpdate operation
#
##############################################################################
call_orderShipmentUpdate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/order.shipment.update.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call orderStatusList operation
#
##############################################################################
call_orderStatusList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(store_id action response_fields    )
    local path

    if ! path=$(build_request_path "/v1.1/order.status.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call orderTransactionList operation
#
##############################################################################
call_orderTransactionList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(count page_cursor order_ids store_id params response_fields exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/order.transaction.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call orderUpdate operation
#
##############################################################################
call_orderUpdate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(order_id store_id order_status financial_status fulfillment_status cancellation_reason order_payment_method comment admin_comment admin_private_comment invoice_admin_comment date_modified date_finished send_notifications create_invoice origin tags    )
    local path

    if ! path=$(build_request_path "/v1.1/order.update.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productAdd operation
#
##############################################################################
call_productAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productAddBatch operation
#
##############################################################################
call_productAddBatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.add.batch.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productAttributeList operation
#
##############################################################################
call_productAttributeList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor product_id attribute_id variant_id attribute_group_id lang_id store_id set_name sort_by sort_direction response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/product.attribute.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productAttributeValueSet operation
#
##############################################################################
call_productAttributeValueSet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(product_id attribute_id attribute_group_id attribute_name value value_id lang_id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/product.attribute.value.set.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productAttributeValueUnset operation
#
##############################################################################
call_productAttributeValueUnset() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(product_id attribute_id store_id include_default reindex clear_cache    )
    local path

    if ! path=$(build_request_path "/v1.1/product.attribute.value.unset.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productBrandList operation
#
##############################################################################
call_productBrandList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor brand_ids category_id parent_id store_id lang_id find_where find_value created_from created_to modified_from modified_to response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/product.brand.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productChildItemFind operation
#
##############################################################################
call_productChildItemFind() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(find_value find_where find_params store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/product.child_item.find.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productChildItemInfo operation
#
##############################################################################
call_productChildItemInfo() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(product_id id store_id lang_id currency_id response_fields params exclude use_latest_api_version    )
    local path

    if ! path=$(build_request_path "/v1.1/product.child_item.info.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productChildItemList operation
#
##############################################################################
call_productChildItemList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor product_id product_ids sku store_id lang_id currency_id avail_sale find_value find_where created_from created_to modified_from modified_to return_global response_fields params exclude report_request_id disable_report_cache use_latest_api_version    )
    local path

    if ! path=$(build_request_path "/v1.1/product.child_item.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productCount operation
#
##############################################################################
call_productCount() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(product_ids since_id categories_ids category_id store_id lang_id avail_view avail_sale created_from created_to modified_from modified_to brand_name product_attributes status type visible find_value find_where report_request_id return_global disable_report_cache use_latest_api_version    )
    local path

    if ! path=$(build_request_path "/v1.1/product.count.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productCurrencyAdd operation
#
##############################################################################
call_productCurrencyAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(iso3 rate name avail symbol_left symbol_right default    )
    local path

    if ! path=$(build_request_path "/v1.1/product.currency.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productCurrencyList operation
#
##############################################################################
call_productCurrencyList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor default avail response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/product.currency.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productDelete operation
#
##############################################################################
call_productDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/product.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productDeleteBatch operation
#
##############################################################################
call_productDeleteBatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.delete.batch.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productFind operation
#
##############################################################################
call_productFind() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(find_value find_where find_params find_what lang_id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/product.find.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productImageAdd operation
#
##############################################################################
call_productImageAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.image.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productImageDelete operation
#
##############################################################################
call_productImageDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(product_id id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/product.image.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productImageUpdate operation
#
##############################################################################
call_productImageUpdate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(product_id id variant_ids store_id lang_id image_name type label position hidden    )
    local path

    if ! path=$(build_request_path "/v1.1/product.image.update.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productInfo operation
#
##############################################################################
call_productInfo() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id store_id lang_id currency_id response_fields params exclude report_request_id disable_report_cache use_latest_api_version    )
    local path

    if ! path=$(build_request_path "/v1.1/product.info.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productList operation
#
##############################################################################
call_productList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor product_ids since_id categories_ids category_id store_id lang_id currency_id avail_view avail_sale created_from created_to modified_from modified_to sku brand_name product_attributes status type visible find_value find_where return_global params response_fields exclude sort_by sort_direction report_request_id disable_cache disable_report_cache use_latest_api_version    )
    local path

    if ! path=$(build_request_path "/v1.1/product.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productManufacturerAdd operation
#
##############################################################################
call_productManufacturerAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(product_id manufacturer store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/product.manufacturer.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productOptionAdd operation
#
##############################################################################
call_productOptionAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.option.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productOptionAssign operation
#
##############################################################################
call_productOptionAssign() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(product_id option_id required sort_order option_values clear_cache    )
    local path

    if ! path=$(build_request_path "/v1.1/product.option.assign.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productOptionDelete operation
#
##############################################################################
call_productOptionDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(option_id product_id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/product.option.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productOptionList operation
#
##############################################################################
call_productOptionList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count product_id lang_id store_id response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/product.option.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productOptionValueAdd operation
#
##############################################################################
call_productOptionValueAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(product_id option_id option_value sort_order display_value is_default clear_cache    )
    local path

    if ! path=$(build_request_path "/v1.1/product.option.value.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productOptionValueAssign operation
#
##############################################################################
call_productOptionValueAssign() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(product_option_id option_value_id clear_cache    )
    local path

    if ! path=$(build_request_path "/v1.1/product.option.value.assign.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productOptionValueDelete operation
#
##############################################################################
call_productOptionValueDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(option_id option_value_id product_id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/product.option.value.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productOptionValueUpdate operation
#
##############################################################################
call_productOptionValueUpdate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(product_id option_id option_value_id option_value price quantity display_value clear_cache    )
    local path

    if ! path=$(build_request_path "/v1.1/product.option.value.update.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productPriceAdd operation
#
##############################################################################
call_productPriceAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.price.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productPriceDelete operation
#
##############################################################################
call_productPriceDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(product_id group_prices store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/product.price.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productPriceUpdate operation
#
##############################################################################
call_productPriceUpdate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.price.update.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productReviewList operation
#
##############################################################################
call_productReviewList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor product_id ids store_id status response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/product.review.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productStoreAssign operation
#
##############################################################################
call_productStoreAssign() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(product_id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/product.store.assign.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productTaxAdd operation
#
##############################################################################
call_productTaxAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.tax.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productUpdate operation
#
##############################################################################
call_productUpdate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.update.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productUpdateBatch operation
#
##############################################################################
call_productUpdateBatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.update.batch.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productVariantAdd operation
#
##############################################################################
call_productVariantAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.variant.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productVariantAddBatch operation
#
##############################################################################
call_productVariantAddBatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.variant.add.batch.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productVariantDelete operation
#
##############################################################################
call_productVariantDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id product_id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/product.variant.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productVariantDeleteBatch operation
#
##############################################################################
call_productVariantDeleteBatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.variant.delete.batch.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productVariantImageAdd operation
#
##############################################################################
call_productVariantImageAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.variant.image.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productVariantImageDelete operation
#
##############################################################################
call_productVariantImageDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(product_id product_variant_id id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/product.variant.image.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productVariantPriceAdd operation
#
##############################################################################
call_productVariantPriceAdd() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.variant.price.add.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productVariantPriceDelete operation
#
##############################################################################
call_productVariantPriceDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id product_id group_prices store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/product.variant.price.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call productVariantPriceUpdate operation
#
##############################################################################
call_productVariantPriceUpdate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.variant.price.update.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productVariantUpdate operation
#
##############################################################################
call_productVariantUpdate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.variant.update.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call productVariantUpdateBatch operation
#
##############################################################################
call_productVariantUpdateBatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/product.variant.update.batch.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call returnActionList operation
#
##############################################################################
call_returnActionList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/return.action.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call returnCount operation
#
##############################################################################
call_returnCount() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(order_ids customer_id store_id status return_type created_from created_to modified_from modified_to report_request_id disable_report_cache    )
    local path

    if ! path=$(build_request_path "/v1.1/return.count.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call returnInfo operation
#
##############################################################################
call_returnInfo() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id order_id store_id response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/return.info.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call returnList operation
#
##############################################################################
call_returnList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count page_cursor order_id order_ids customer_id store_id status return_type created_from created_to modified_from modified_to response_fields params exclude report_request_id disable_report_cache    )
    local path

    if ! path=$(build_request_path "/v1.1/return.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call returnReasonList operation
#
##############################################################################
call_returnReasonList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/return.reason.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call returnStatusList operation
#
##############################################################################
call_returnStatusList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/return.status.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call subscriberList operation
#
##############################################################################
call_subscriberList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(ids start count page_cursor subscribed store_id email created_from created_to modified_from modified_to response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/subscriber.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call taxClassInfo operation
#
##############################################################################
call_taxClassInfo() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(tax_class_id store_id lang_id response_fields params exclude    )
    local path

    if ! path=$(build_request_path "/v1.1/tax.class.info.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call taxClassList operation
#
##############################################################################
call_taxClassList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(count page_cursor store_id find_value find_where created_to created_from modified_to modified_from response_fields    )
    local path

    if ! path=$(build_request_path "/v1.1/tax.class.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call webhookCount operation
#
##############################################################################
call_webhookCount() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(entity action active    )
    local path

    if ! path=$(build_request_path "/v1.1/webhook.count.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call webhookCreate operation
#
##############################################################################
call_webhookCreate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(entity action callback label fields response_fields active lang_id store_id    )
    local path

    if ! path=$(build_request_path "/v1.1/webhook.create.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call webhookDelete operation
#
##############################################################################
call_webhookDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id    )
    local path

    if ! path=$(build_request_path "/v1.1/webhook.delete.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call webhookEvents operation
#
##############################################################################
call_webhookEvents() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(    )
    local path

    if ! path=$(build_request_path "/v1.1/webhook.events.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call webhookList operation
#
##############################################################################
call_webhookList() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(start count entity action active ids params    )
    local path

    if ! path=$(build_request_path "/v1.1/webhook.list.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call webhookUpdate operation
#
##############################################################################
call_webhookUpdate() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id callback label fields response_fields active lang_id    )
    local path

    if ! path=$(build_request_path "/v1.1/webhook.update.json" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}



##############################################################################
#
# Main
#
##############################################################################


# Check dependencies
type curl >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'cURL' installed."; exit 1; }
type sed >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'sed' installed."; exit 1; }
type column >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'bsdmainutils' installed."; exit 1; }

#
# Process command line
#
# Pass all arguments before 'operation' to cURL except the ones we override
#
take_user=false
take_host=false
take_accept_header=false
take_contenttype_header=false

for key in "$@"; do
# Take the value of -u|--user argument
if [[ "$take_user" = true ]]; then
    basic_auth_credential="$key"
    take_user=false
    continue
fi
# Take the value of --host argument
if [[ "$take_host" = true ]]; then
    host="$key"
    take_host=false
    continue
fi
# Take the value of --accept argument
if [[ "$take_accept_header" = true ]]; then
    header_accept=$(lookup_mime_type "$key")
    take_accept_header=false
    continue
fi
# Take the value of --content-type argument
if [[ "$take_contenttype_header" = true ]]; then
    header_content_type=$(lookup_mime_type "$key")
    take_contenttype_header=false
    continue
fi
case $key in
    -h|--help)
    if [[ "x$operation" == "x" ]]; then
        print_help
        exit 0
    else
        eval "print_${operation}_help"
        exit 0
    fi
    ;;
    -V|--version)
    print_version
    exit 0
    ;;
    --about)
    print_about
    exit 0
    ;;
    -u|--user)
    take_user=true
    ;;
    --host)
    take_host=true
    ;;
    --force)
    force=true
    ;;
    -ac|--accept)
    take_accept_header=true
    ;;
    -ct|--content-type)
    take_contenttype_header=true
    ;;
    --dry-run)
    print_curl=true
    ;;
    -nc|--no-colors)
        RED=""
        GREEN=""
        YELLOW=""
        BLUE=""
        MAGENTA=""
        CYAN=""
        WHITE=""
        BOLD=""
        OFF=""
        result_color_table=( "" "" "" "" "" "" "" )
    ;;
    accountCartAdd)
    operation="accountCartAdd"
    ;;
    accountCartList)
    operation="accountCartList"
    ;;
    accountConfigUpdate)
    operation="accountConfigUpdate"
    ;;
    accountFailedWebhooks)
    operation="accountFailedWebhooks"
    ;;
    accountSupportedPlatforms)
    operation="accountSupportedPlatforms"
    ;;
    attributeAdd)
    operation="attributeAdd"
    ;;
    attributeAssignGroup)
    operation="attributeAssignGroup"
    ;;
    attributeAssignSet)
    operation="attributeAssignSet"
    ;;
    attributeAttributesetList)
    operation="attributeAttributesetList"
    ;;
    attributeCount)
    operation="attributeCount"
    ;;
    attributeDelete)
    operation="attributeDelete"
    ;;
    attributeGroupList)
    operation="attributeGroupList"
    ;;
    attributeInfo)
    operation="attributeInfo"
    ;;
    attributeList)
    operation="attributeList"
    ;;
    attributeTypeList)
    operation="attributeTypeList"
    ;;
    attributeUnassignGroup)
    operation="attributeUnassignGroup"
    ;;
    attributeUnassignSet)
    operation="attributeUnassignSet"
    ;;
    attributeUpdate)
    operation="attributeUpdate"
    ;;
    attributeValueAdd)
    operation="attributeValueAdd"
    ;;
    attributeValueDelete)
    operation="attributeValueDelete"
    ;;
    attributeValueUpdate)
    operation="attributeValueUpdate"
    ;;
    basketInfo)
    operation="basketInfo"
    ;;
    basketItemAdd)
    operation="basketItemAdd"
    ;;
    basketLiveShippingServiceCreate)
    operation="basketLiveShippingServiceCreate"
    ;;
    basketLiveShippingServiceDelete)
    operation="basketLiveShippingServiceDelete"
    ;;
    basketLiveShippingServiceList)
    operation="basketLiveShippingServiceList"
    ;;
    batchJobList)
    operation="batchJobList"
    ;;
    batchJobResult)
    operation="batchJobResult"
    ;;
    bridgeDelete)
    operation="bridgeDelete"
    ;;
    bridgeDownload)
    operation="bridgeDownload"
    ;;
    bridgeUpdate)
    operation="bridgeUpdate"
    ;;
    cartCatalogPriceRulesCount)
    operation="cartCatalogPriceRulesCount"
    ;;
    cartCatalogPriceRulesList)
    operation="cartCatalogPriceRulesList"
    ;;
    cartCouponAdd)
    operation="cartCouponAdd"
    ;;
    cartCouponConditionAdd)
    operation="cartCouponConditionAdd"
    ;;
    cartCouponCount)
    operation="cartCouponCount"
    ;;
    cartCouponDelete)
    operation="cartCouponDelete"
    ;;
    cartCouponList)
    operation="cartCouponList"
    ;;
    cartDelete)
    operation="cartDelete"
    ;;
    cartGiftcardAdd)
    operation="cartGiftcardAdd"
    ;;
    cartGiftcardCount)
    operation="cartGiftcardCount"
    ;;
    cartGiftcardDelete)
    operation="cartGiftcardDelete"
    ;;
    cartGiftcardList)
    operation="cartGiftcardList"
    ;;
    cartInfo)
    operation="cartInfo"
    ;;
    cartMetaDataList)
    operation="cartMetaDataList"
    ;;
    cartMetaDataSet)
    operation="cartMetaDataSet"
    ;;
    cartMetaDataUnset)
    operation="cartMetaDataUnset"
    ;;
    cartMethods)
    operation="cartMethods"
    ;;
    cartPluginList)
    operation="cartPluginList"
    ;;
    cartScriptAdd)
    operation="cartScriptAdd"
    ;;
    cartScriptDelete)
    operation="cartScriptDelete"
    ;;
    cartScriptList)
    operation="cartScriptList"
    ;;
    cartShippingZonesList)
    operation="cartShippingZonesList"
    ;;
    cartValidate)
    operation="cartValidate"
    ;;
    categoryAdd)
    operation="categoryAdd"
    ;;
    categoryAddBatch)
    operation="categoryAddBatch"
    ;;
    categoryAssign)
    operation="categoryAssign"
    ;;
    categoryCount)
    operation="categoryCount"
    ;;
    categoryDelete)
    operation="categoryDelete"
    ;;
    categoryFind)
    operation="categoryFind"
    ;;
    categoryImageAdd)
    operation="categoryImageAdd"
    ;;
    categoryImageDelete)
    operation="categoryImageDelete"
    ;;
    categoryInfo)
    operation="categoryInfo"
    ;;
    categoryList)
    operation="categoryList"
    ;;
    categoryUnassign)
    operation="categoryUnassign"
    ;;
    categoryUpdate)
    operation="categoryUpdate"
    ;;
    customerAdd)
    operation="customerAdd"
    ;;
    customerAddressAdd)
    operation="customerAddressAdd"
    ;;
    customerAttributeList)
    operation="customerAttributeList"
    ;;
    customerCount)
    operation="customerCount"
    ;;
    customerDelete)
    operation="customerDelete"
    ;;
    customerFind)
    operation="customerFind"
    ;;
    customerGroupAdd)
    operation="customerGroupAdd"
    ;;
    customerGroupList)
    operation="customerGroupList"
    ;;
    customerInfo)
    operation="customerInfo"
    ;;
    customerList)
    operation="customerList"
    ;;
    customerUpdate)
    operation="customerUpdate"
    ;;
    customerWishlistList)
    operation="customerWishlistList"
    ;;
    marketplaceProductFind)
    operation="marketplaceProductFind"
    ;;
    orderAbandonedList)
    operation="orderAbandonedList"
    ;;
    orderAdd)
    operation="orderAdd"
    ;;
    orderCount)
    operation="orderCount"
    ;;
    orderFinancialStatusList)
    operation="orderFinancialStatusList"
    ;;
    orderFulfillmentStatusList)
    operation="orderFulfillmentStatusList"
    ;;
    orderInfo)
    operation="orderInfo"
    ;;
    orderList)
    operation="orderList"
    ;;
    orderPreestimateShippingList)
    operation="orderPreestimateShippingList"
    ;;
    orderRefundAdd)
    operation="orderRefundAdd"
    ;;
    orderReturnAdd)
    operation="orderReturnAdd"
    ;;
    orderReturnDelete)
    operation="orderReturnDelete"
    ;;
    orderReturnUpdate)
    operation="orderReturnUpdate"
    ;;
    orderShipmentAdd)
    operation="orderShipmentAdd"
    ;;
    orderShipmentAddBatch)
    operation="orderShipmentAddBatch"
    ;;
    orderShipmentDelete)
    operation="orderShipmentDelete"
    ;;
    orderShipmentInfo)
    operation="orderShipmentInfo"
    ;;
    orderShipmentList)
    operation="orderShipmentList"
    ;;
    orderShipmentTrackingAdd)
    operation="orderShipmentTrackingAdd"
    ;;
    orderShipmentUpdate)
    operation="orderShipmentUpdate"
    ;;
    orderStatusList)
    operation="orderStatusList"
    ;;
    orderTransactionList)
    operation="orderTransactionList"
    ;;
    orderUpdate)
    operation="orderUpdate"
    ;;
    productAdd)
    operation="productAdd"
    ;;
    productAddBatch)
    operation="productAddBatch"
    ;;
    productAttributeList)
    operation="productAttributeList"
    ;;
    productAttributeValueSet)
    operation="productAttributeValueSet"
    ;;
    productAttributeValueUnset)
    operation="productAttributeValueUnset"
    ;;
    productBrandList)
    operation="productBrandList"
    ;;
    productChildItemFind)
    operation="productChildItemFind"
    ;;
    productChildItemInfo)
    operation="productChildItemInfo"
    ;;
    productChildItemList)
    operation="productChildItemList"
    ;;
    productCount)
    operation="productCount"
    ;;
    productCurrencyAdd)
    operation="productCurrencyAdd"
    ;;
    productCurrencyList)
    operation="productCurrencyList"
    ;;
    productDelete)
    operation="productDelete"
    ;;
    productDeleteBatch)
    operation="productDeleteBatch"
    ;;
    productFind)
    operation="productFind"
    ;;
    productImageAdd)
    operation="productImageAdd"
    ;;
    productImageDelete)
    operation="productImageDelete"
    ;;
    productImageUpdate)
    operation="productImageUpdate"
    ;;
    productInfo)
    operation="productInfo"
    ;;
    productList)
    operation="productList"
    ;;
    productManufacturerAdd)
    operation="productManufacturerAdd"
    ;;
    productOptionAdd)
    operation="productOptionAdd"
    ;;
    productOptionAssign)
    operation="productOptionAssign"
    ;;
    productOptionDelete)
    operation="productOptionDelete"
    ;;
    productOptionList)
    operation="productOptionList"
    ;;
    productOptionValueAdd)
    operation="productOptionValueAdd"
    ;;
    productOptionValueAssign)
    operation="productOptionValueAssign"
    ;;
    productOptionValueDelete)
    operation="productOptionValueDelete"
    ;;
    productOptionValueUpdate)
    operation="productOptionValueUpdate"
    ;;
    productPriceAdd)
    operation="productPriceAdd"
    ;;
    productPriceDelete)
    operation="productPriceDelete"
    ;;
    productPriceUpdate)
    operation="productPriceUpdate"
    ;;
    productReviewList)
    operation="productReviewList"
    ;;
    productStoreAssign)
    operation="productStoreAssign"
    ;;
    productTaxAdd)
    operation="productTaxAdd"
    ;;
    productUpdate)
    operation="productUpdate"
    ;;
    productUpdateBatch)
    operation="productUpdateBatch"
    ;;
    productVariantAdd)
    operation="productVariantAdd"
    ;;
    productVariantAddBatch)
    operation="productVariantAddBatch"
    ;;
    productVariantDelete)
    operation="productVariantDelete"
    ;;
    productVariantDeleteBatch)
    operation="productVariantDeleteBatch"
    ;;
    productVariantImageAdd)
    operation="productVariantImageAdd"
    ;;
    productVariantImageDelete)
    operation="productVariantImageDelete"
    ;;
    productVariantPriceAdd)
    operation="productVariantPriceAdd"
    ;;
    productVariantPriceDelete)
    operation="productVariantPriceDelete"
    ;;
    productVariantPriceUpdate)
    operation="productVariantPriceUpdate"
    ;;
    productVariantUpdate)
    operation="productVariantUpdate"
    ;;
    productVariantUpdateBatch)
    operation="productVariantUpdateBatch"
    ;;
    returnActionList)
    operation="returnActionList"
    ;;
    returnCount)
    operation="returnCount"
    ;;
    returnInfo)
    operation="returnInfo"
    ;;
    returnList)
    operation="returnList"
    ;;
    returnReasonList)
    operation="returnReasonList"
    ;;
    returnStatusList)
    operation="returnStatusList"
    ;;
    subscriberList)
    operation="subscriberList"
    ;;
    taxClassInfo)
    operation="taxClassInfo"
    ;;
    taxClassList)
    operation="taxClassList"
    ;;
    webhookCount)
    operation="webhookCount"
    ;;
    webhookCreate)
    operation="webhookCreate"
    ;;
    webhookDelete)
    operation="webhookDelete"
    ;;
    webhookEvents)
    operation="webhookEvents"
    ;;
    webhookList)
    operation="webhookList"
    ;;
    webhookUpdate)
    operation="webhookUpdate"
    ;;
    *==*)
    # Parse body arguments and convert them into top level
    # JSON properties passed in the body content as strings
    if [[ "$operation" ]]; then
        IFS='==' read -r body_key sep body_value <<< "$key"
        body_parameters[${body_key}]="\"${body_value}\""
    fi
    ;;
    --body=*)
    # Parse value of body as argument and convert it into only
    # the raw body content
    if [[ "$operation" ]]; then
        IFS='--body=' read -r body_value <<< "$key"
        body_value=${body_value##--body=}
        body_parameters["RAW_BODY"]="${body_value}"
        RAW_BODY=1
    fi
    ;;
    *:=*)
    # Parse body arguments and convert them into top level
    # JSON properties passed in the body content without quotes
    if [[ "$operation" ]]; then
        # ignore error about 'sep' being unused
        # shellcheck disable=SC2034
        IFS=':=' read -r body_key sep body_value <<< "$key"
        body_parameters[${body_key}]=${body_value}
    fi
    ;;
    +([^=]):*)
    # Parse header arguments and convert them into curl
    # only after the operation argument
    if [[ "$operation" ]]; then
        IFS=':' read -r header_name header_value <<< "$key"
        #
        # If the header key is the same as the api_key expected by API in the
        # header, override the ${apikey_auth_credential} variable
        #
        if [[ $header_name == "x-api-key" ]]; then
            apikey_auth_credential=$header_value
        fi
        #
        # If the header key is the same as the api_key expected by API in the
        # header, override the ${apikey_auth_credential} variable
        #
        if [[ $header_name == "x-store-key" ]]; then
            apikey_auth_credential=$header_value
        fi
        header_arguments[$header_name]=$header_value
    else
        curl_arguments+=" $key"
    fi
    ;;
    -)
    body_content_temp_file=$(mktemp)
    cat - > "$body_content_temp_file"
    ;;
    *=*)
    # Parse operation arguments and convert them into curl
    # only after the operation argument
    if [[ "$operation" ]]; then
        IFS='=' read -r parameter_name parameter_value <<< "$key"
        if [[ -z "${operation_parameters[$parameter_name]+foo}" ]]; then
            operation_parameters[$parameter_name]=$(url_escape "${parameter_value}")
        else
            operation_parameters[$parameter_name]+=":::"$(url_escape "${parameter_value}")
        fi
    else
        curl_arguments+=" $key"
    fi
    ;;
    *)
    # If we are before the operation, treat the arguments as cURL arguments
    if [[ "x$operation" == "x" ]]; then
        # Maintain quotes around cURL arguments if necessary
        space_regexp="[[:space:]]"
        if [[ $key =~ $space_regexp ]]; then
            curl_arguments+=" \"$key\""
        else
            curl_arguments+=" $key"
        fi
    fi
    ;;
esac
done


# Check if user provided host name
if [[ -z "$host" ]]; then
    ERROR_MSG="ERROR: No hostname provided!!! You have to  provide on command line option '--host ...'"
    exit 1
fi

# Check if user specified operation ID
if [[ -z "$operation" ]]; then
    ERROR_MSG="ERROR: No operation specified!!!"
    exit 1
fi


# Run cURL command based on the operation ID
case $operation in
    accountCartAdd)
    call_accountCartAdd
    ;;
    accountCartList)
    call_accountCartList
    ;;
    accountConfigUpdate)
    call_accountConfigUpdate
    ;;
    accountFailedWebhooks)
    call_accountFailedWebhooks
    ;;
    accountSupportedPlatforms)
    call_accountSupportedPlatforms
    ;;
    attributeAdd)
    call_attributeAdd
    ;;
    attributeAssignGroup)
    call_attributeAssignGroup
    ;;
    attributeAssignSet)
    call_attributeAssignSet
    ;;
    attributeAttributesetList)
    call_attributeAttributesetList
    ;;
    attributeCount)
    call_attributeCount
    ;;
    attributeDelete)
    call_attributeDelete
    ;;
    attributeGroupList)
    call_attributeGroupList
    ;;
    attributeInfo)
    call_attributeInfo
    ;;
    attributeList)
    call_attributeList
    ;;
    attributeTypeList)
    call_attributeTypeList
    ;;
    attributeUnassignGroup)
    call_attributeUnassignGroup
    ;;
    attributeUnassignSet)
    call_attributeUnassignSet
    ;;
    attributeUpdate)
    call_attributeUpdate
    ;;
    attributeValueAdd)
    call_attributeValueAdd
    ;;
    attributeValueDelete)
    call_attributeValueDelete
    ;;
    attributeValueUpdate)
    call_attributeValueUpdate
    ;;
    basketInfo)
    call_basketInfo
    ;;
    basketItemAdd)
    call_basketItemAdd
    ;;
    basketLiveShippingServiceCreate)
    call_basketLiveShippingServiceCreate
    ;;
    basketLiveShippingServiceDelete)
    call_basketLiveShippingServiceDelete
    ;;
    basketLiveShippingServiceList)
    call_basketLiveShippingServiceList
    ;;
    batchJobList)
    call_batchJobList
    ;;
    batchJobResult)
    call_batchJobResult
    ;;
    bridgeDelete)
    call_bridgeDelete
    ;;
    bridgeDownload)
    call_bridgeDownload
    ;;
    bridgeUpdate)
    call_bridgeUpdate
    ;;
    cartCatalogPriceRulesCount)
    call_cartCatalogPriceRulesCount
    ;;
    cartCatalogPriceRulesList)
    call_cartCatalogPriceRulesList
    ;;
    cartCouponAdd)
    call_cartCouponAdd
    ;;
    cartCouponConditionAdd)
    call_cartCouponConditionAdd
    ;;
    cartCouponCount)
    call_cartCouponCount
    ;;
    cartCouponDelete)
    call_cartCouponDelete
    ;;
    cartCouponList)
    call_cartCouponList
    ;;
    cartDelete)
    call_cartDelete
    ;;
    cartGiftcardAdd)
    call_cartGiftcardAdd
    ;;
    cartGiftcardCount)
    call_cartGiftcardCount
    ;;
    cartGiftcardDelete)
    call_cartGiftcardDelete
    ;;
    cartGiftcardList)
    call_cartGiftcardList
    ;;
    cartInfo)
    call_cartInfo
    ;;
    cartMetaDataList)
    call_cartMetaDataList
    ;;
    cartMetaDataSet)
    call_cartMetaDataSet
    ;;
    cartMetaDataUnset)
    call_cartMetaDataUnset
    ;;
    cartMethods)
    call_cartMethods
    ;;
    cartPluginList)
    call_cartPluginList
    ;;
    cartScriptAdd)
    call_cartScriptAdd
    ;;
    cartScriptDelete)
    call_cartScriptDelete
    ;;
    cartScriptList)
    call_cartScriptList
    ;;
    cartShippingZonesList)
    call_cartShippingZonesList
    ;;
    cartValidate)
    call_cartValidate
    ;;
    categoryAdd)
    call_categoryAdd
    ;;
    categoryAddBatch)
    call_categoryAddBatch
    ;;
    categoryAssign)
    call_categoryAssign
    ;;
    categoryCount)
    call_categoryCount
    ;;
    categoryDelete)
    call_categoryDelete
    ;;
    categoryFind)
    call_categoryFind
    ;;
    categoryImageAdd)
    call_categoryImageAdd
    ;;
    categoryImageDelete)
    call_categoryImageDelete
    ;;
    categoryInfo)
    call_categoryInfo
    ;;
    categoryList)
    call_categoryList
    ;;
    categoryUnassign)
    call_categoryUnassign
    ;;
    categoryUpdate)
    call_categoryUpdate
    ;;
    customerAdd)
    call_customerAdd
    ;;
    customerAddressAdd)
    call_customerAddressAdd
    ;;
    customerAttributeList)
    call_customerAttributeList
    ;;
    customerCount)
    call_customerCount
    ;;
    customerDelete)
    call_customerDelete
    ;;
    customerFind)
    call_customerFind
    ;;
    customerGroupAdd)
    call_customerGroupAdd
    ;;
    customerGroupList)
    call_customerGroupList
    ;;
    customerInfo)
    call_customerInfo
    ;;
    customerList)
    call_customerList
    ;;
    customerUpdate)
    call_customerUpdate
    ;;
    customerWishlistList)
    call_customerWishlistList
    ;;
    marketplaceProductFind)
    call_marketplaceProductFind
    ;;
    orderAbandonedList)
    call_orderAbandonedList
    ;;
    orderAdd)
    call_orderAdd
    ;;
    orderCount)
    call_orderCount
    ;;
    orderFinancialStatusList)
    call_orderFinancialStatusList
    ;;
    orderFulfillmentStatusList)
    call_orderFulfillmentStatusList
    ;;
    orderInfo)
    call_orderInfo
    ;;
    orderList)
    call_orderList
    ;;
    orderPreestimateShippingList)
    call_orderPreestimateShippingList
    ;;
    orderRefundAdd)
    call_orderRefundAdd
    ;;
    orderReturnAdd)
    call_orderReturnAdd
    ;;
    orderReturnDelete)
    call_orderReturnDelete
    ;;
    orderReturnUpdate)
    call_orderReturnUpdate
    ;;
    orderShipmentAdd)
    call_orderShipmentAdd
    ;;
    orderShipmentAddBatch)
    call_orderShipmentAddBatch
    ;;
    orderShipmentDelete)
    call_orderShipmentDelete
    ;;
    orderShipmentInfo)
    call_orderShipmentInfo
    ;;
    orderShipmentList)
    call_orderShipmentList
    ;;
    orderShipmentTrackingAdd)
    call_orderShipmentTrackingAdd
    ;;
    orderShipmentUpdate)
    call_orderShipmentUpdate
    ;;
    orderStatusList)
    call_orderStatusList
    ;;
    orderTransactionList)
    call_orderTransactionList
    ;;
    orderUpdate)
    call_orderUpdate
    ;;
    productAdd)
    call_productAdd
    ;;
    productAddBatch)
    call_productAddBatch
    ;;
    productAttributeList)
    call_productAttributeList
    ;;
    productAttributeValueSet)
    call_productAttributeValueSet
    ;;
    productAttributeValueUnset)
    call_productAttributeValueUnset
    ;;
    productBrandList)
    call_productBrandList
    ;;
    productChildItemFind)
    call_productChildItemFind
    ;;
    productChildItemInfo)
    call_productChildItemInfo
    ;;
    productChildItemList)
    call_productChildItemList
    ;;
    productCount)
    call_productCount
    ;;
    productCurrencyAdd)
    call_productCurrencyAdd
    ;;
    productCurrencyList)
    call_productCurrencyList
    ;;
    productDelete)
    call_productDelete
    ;;
    productDeleteBatch)
    call_productDeleteBatch
    ;;
    productFind)
    call_productFind
    ;;
    productImageAdd)
    call_productImageAdd
    ;;
    productImageDelete)
    call_productImageDelete
    ;;
    productImageUpdate)
    call_productImageUpdate
    ;;
    productInfo)
    call_productInfo
    ;;
    productList)
    call_productList
    ;;
    productManufacturerAdd)
    call_productManufacturerAdd
    ;;
    productOptionAdd)
    call_productOptionAdd
    ;;
    productOptionAssign)
    call_productOptionAssign
    ;;
    productOptionDelete)
    call_productOptionDelete
    ;;
    productOptionList)
    call_productOptionList
    ;;
    productOptionValueAdd)
    call_productOptionValueAdd
    ;;
    productOptionValueAssign)
    call_productOptionValueAssign
    ;;
    productOptionValueDelete)
    call_productOptionValueDelete
    ;;
    productOptionValueUpdate)
    call_productOptionValueUpdate
    ;;
    productPriceAdd)
    call_productPriceAdd
    ;;
    productPriceDelete)
    call_productPriceDelete
    ;;
    productPriceUpdate)
    call_productPriceUpdate
    ;;
    productReviewList)
    call_productReviewList
    ;;
    productStoreAssign)
    call_productStoreAssign
    ;;
    productTaxAdd)
    call_productTaxAdd
    ;;
    productUpdate)
    call_productUpdate
    ;;
    productUpdateBatch)
    call_productUpdateBatch
    ;;
    productVariantAdd)
    call_productVariantAdd
    ;;
    productVariantAddBatch)
    call_productVariantAddBatch
    ;;
    productVariantDelete)
    call_productVariantDelete
    ;;
    productVariantDeleteBatch)
    call_productVariantDeleteBatch
    ;;
    productVariantImageAdd)
    call_productVariantImageAdd
    ;;
    productVariantImageDelete)
    call_productVariantImageDelete
    ;;
    productVariantPriceAdd)
    call_productVariantPriceAdd
    ;;
    productVariantPriceDelete)
    call_productVariantPriceDelete
    ;;
    productVariantPriceUpdate)
    call_productVariantPriceUpdate
    ;;
    productVariantUpdate)
    call_productVariantUpdate
    ;;
    productVariantUpdateBatch)
    call_productVariantUpdateBatch
    ;;
    returnActionList)
    call_returnActionList
    ;;
    returnCount)
    call_returnCount
    ;;
    returnInfo)
    call_returnInfo
    ;;
    returnList)
    call_returnList
    ;;
    returnReasonList)
    call_returnReasonList
    ;;
    returnStatusList)
    call_returnStatusList
    ;;
    subscriberList)
    call_subscriberList
    ;;
    taxClassInfo)
    call_taxClassInfo
    ;;
    taxClassList)
    call_taxClassList
    ;;
    webhookCount)
    call_webhookCount
    ;;
    webhookCreate)
    call_webhookCreate
    ;;
    webhookDelete)
    call_webhookDelete
    ;;
    webhookEvents)
    call_webhookEvents
    ;;
    webhookList)
    call_webhookList
    ;;
    webhookUpdate)
    call_webhookUpdate
    ;;
    *)
    ERROR_MSG="ERROR: Unknown operation: $operation"
    exit 1
esac
