#compdef 

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !
# ! Note:
# !
# ! THIS SCRIPT HAS BEEN AUTOMATICALLY GENERATED USING
# ! openapi-generator (https://openapi-generator.tech)
# ! FROM OPENAPI SPECIFICATION IN JSON.
# !
# ! Based on: https://github.com/Valodim/zsh-curl-completion/blob/master/_curl
# !
# ! Generator version: 7.11.0
# !
# !
# ! Installation:
# !
# ! Copy the _ file to any directory under FPATH
# ! environment variable (echo $FPATH)
# !
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


local curcontext="$curcontext" state line ret=1
typeset -A opt_args

typeset -A mime_type_abbreviations
# text/*
mime_type_abbreviations[text]="text/plain"
mime_type_abbreviations[html]="text/html"
mime_type_abbreviations[md]="text/x-markdown"
mime_type_abbreviations[csv]="text/csv"
mime_type_abbreviations[css]="text/css"
mime_type_abbreviations[rtf]="text/rtf"
# application/*
mime_type_abbreviations[json]="application/json"
mime_type_abbreviations[xml]="application/xml"
mime_type_abbreviations[yaml]="application/yaml"
mime_type_abbreviations[js]="application/javascript"
mime_type_abbreviations[bin]="application/octet-stream"
mime_type_abbreviations[rdf]="application/rdf+xml"
# image/*
mime_type_abbreviations[jpg]="image/jpeg"
mime_type_abbreviations[png]="image/png"
mime_type_abbreviations[gif]="image/gif"
mime_type_abbreviations[bmp]="image/bmp"
mime_type_abbreviations[tiff]="image/tiff"

#
# Generate zsh completion string list for abbreviated mime types
#
get_mime_type_completions() {
    typeset -a result
    result=()
    for k in "${(@k)mime_type_abbreviations}"; do
        value=$mime_type_abbreviations[${k}]
        #echo $value
        result+=( "${k}[${value}]" )
        #echo $result
    done
    echo "$result"
}

#
# cURL crypto engines completion function
#
_curl_crypto_engine() {
    local vals
    vals=( ${${(f)"$(curl --engine list)":gs/ /}[2,$]} )
    _describe -t outputs 'engines' vals && return 0
}

#
# cURL post data completion functions=
#
_curl_post_data() {

    # don't do anything further if this is raw content
    compset -P '=' && _message 'raw content' && return 0

    # complete filename or stdin for @ syntax
    compset -P '*@' && {
        local expl
        _description files expl stdin
        compadd "$expl[@]" - "-"
        _files
        return 0
    }

    # got a name already? expecting data.
    compset -P '*=' && _message 'data value' && return 0

    # otherwise, name (or @ or =) should be specified
    _message 'data name' && return 0

}


local arg_http arg_ftp arg_other arg_proxy arg_crypto arg_connection arg_auth arg_input arg_output

# HTTP Arguments
arg_http=(''\
  {-0,--http1.0}'[force use of use http 1.0 instead of 1.1]' \
  {-b,--cookie}'[pass data to http server as cookie]:data or file' \
  {-c,--cookie-jar}'[specify cookie file]:file name:_files' \
  {-d,--data}'[send specified data as HTTP POST data]:data:{_curl_post_data}' \
  '--data-binary[post HTTP POST data without any processing]:data:{_curl_post_data}' \
  '--data-urlencode[post HTTP POST data, with url encoding]:data:{_curl_post_data}' \
  {-f,--fail}'[enable failfast behavior for server errors]' \
  '*'{-F,--form}'[add POST form data]:name=content' \
  {-G,--get}'[use HTTP GET even with data (-d, --data, --data-binary)]' \
  '*'{-H,--header}'[specify an extra header]:header' \
  '--ignore-content-length[ignore Content-Length header]' \
  {-i,--include}'[include HTTP header in the output]' \
  {-j,--junk-session-cookies}'[discard all session cookies]' \
  {-e,--referer}'[send url as referer]:referer url:_urls' \
  {-L,--location}'[follow Location headers on http 3XX response]' \
  '--location-trusted[like --location, but allows sending of auth data to redirected hosts]' \
  '--max-redirs[set maximum number of redirection followings allowed]:number' \
  {-J,--remote-header-name}'[use Content-Disposition for output file name]' \
  {-O,--remote-name}'[write to filename parsed from url instead of stdout]' \
  '--post301[do not convert POST to GET after following 301 Location response (follow RFC 2616/10.3.2)]' \
  '--post302[do not convert POST to GET after following 302 Location response (follow RFC 2616/10.3.2)]' \
  )

# FTP arguments
arg_ftp=(\
  {-a,--append}'[append to target file instead of overwriting (FTP/SFTP)]' \
  '--crlf[convert LF to CRLF in upload]' \
  '--disable-eprt[disable use of EPRT and LPRT for active FTP transfers]' \
  '--disable-epsv[disable use of EPSV for passive FTP transfers]' \
  '--ftp-account[account data (FTP)]:data' \
  '--ftp-alternative-to-user[command to send when USER and PASS commands fail (FTP)]:command' \
  '--ftp-create-dirs[create paths remotely if it does not exist]' \
  '--ftp-method[ftp method to use to reach a file (FTP)]:method:(multicwd ocwd singlecwd)' \
  '--ftp-pasv[use passive mode for the data connection (FTP)]' \
  '--ftp-skip-pasv-ip[do not use the ip the server suggests for PASV]' \
  '--form-string[like --form, but do not parse content]:name=string' \
  '--ftp-pret[send PRET before PASV]' \
  '--ftp-ssl-ccc[use clear command channel (CCC) after authentication (FTP)]' \
  '--ftp-ssl-ccc-mode[sets the CCC mode (FTP)]:mode:(active passive)' \
  '--ftp-ssl-control[require SSL/TLS for FTP login, clear for transfer]' \
  {-l,--list-only}'[list names only when listing directories (FTP)]' \
  {-P,--ftp-port}'[use active mode, tell server to connect to specified address or interface (FTP]:address' \
  '*'{-Q,--quote}'[send arbitrary command to the remote server before transfer (FTP/SFTP)]:command' \
  )

# Other Protocol arguments
arg_other=(\
  '--mail-from[specify From: address]:address' \
  '--mail-rcpt[specify email recipient for SMTP, may be given multiple times]:address' \
  {-t,--telnet-option}'[pass options to telnet protocol]:opt=val' \
  '--tftp-blksize[set tftp BLKSIZE option]:value' \
  )

# Proxy arguments
arg_proxy=(\
  '--noproxy[list of hosts to connect directly to instead of through proxy]:no-proxy-list' \
  {-p,--proxytunnel}'[tunnel non-http protocols through http proxy]' \
  {-U,--proxy-user}'[specify the user name and password to use for proxy authentication]:user:password' \
  '--proxy-anyauth[use any authentication method for proxy, default to most secure]' \
  '--proxy-basic[use HTTP Basic authentication for proxy]' \
  '--proxy-digest[use http digest authentication for proxy]' \
  '--proxy-negotiate[enable GSS-Negotiate authentication for proxy]' \
  '--proxy-ntlm[enable ntlm authentication for proxy]' \
  '--proxy1.0[use http 1.0 proxy]:proxy url' \
  {-x,--proxy}'[use specified proxy]:proxy url' \
  '--socks5-gssapi-service[change service name for socks server]:servicename' \
  '--socks5-gssapi-nec[allow unprotected exchange of protection mode negotiation]' \
  )

# Crypto arguments
arg_crypto=(\
  {-1,--tlsv1}'[Forces curl to use TLS version 1 when negotiating with a remote TLS server.]' \
  {-2,--sslv2}'[Forces curl to use SSL version 2 when negotiating with a remote SSL server.]' \
  {-3,--sslv3}'[Forces curl to use SSL version 3 when negotiating with a remote SSL server.]' \
  '--ciphers[specifies which cipher to use for the ssl connection]:list of ciphers' \
  '--crlfile[specify file with revoked certificates]:file' \
  '--delegation[set delegation policy to use with GSS/kerberos]:delegation policy:(none policy always)' \
  {-E,--cert}'[use specified client certificate]:certificate file:_files' \
  '--engine[use selected OpenSSL crypto engine]:ssl crypto engine:{_curl_crypto_engine}' \
  '--egd-file[set ssl entropy gathering daemon socket]:entropy socket:_files' \
  '--cert-type[specify certificate type (PEM, DER, ENG)]:certificate type:(PEM DER ENG)' \
  '--cacert[specify certificate file to verify the peer with]:CA certificate:_files' \
  '--capath[specify a search path for certificate files]:CA certificate directory:_directories' \
  '--hostpubmd5[check remote hosts public key]:md5 hash' \
  {-k,--insecure}'[allow ssl to perform insecure ssl connections (ie, ignore certificate)]' \
  '--key[ssl/ssh private key file name]:key file:_files' \
  '--key-type[ssl/ssh private key file type]:file type:(PEM DER ENG)' \
  '--pubkey[ssh public key file]:pubkey file:_files' \
  '--random-file[set source of random data for ssl]:random source:_files' \
  '--no-sessionid[disable caching of ssl session ids]' \
  '--pass:phrase[passphrase for ssl/ssh private key]' \
  '--ssl[try to use ssl/tls for connection, if available]' \
  '--ssl-reqd[try to use ssl/tls for connection, fail if unavailable]' \
  '--tlsauthtype[set TLS authentication type (only SRP supported!)]:authtype' \
  '--tlsuser[set username for TLS authentication]:user' \
  '--tlspassword[set password for TLS authentication]:password' \
  )

# Connection arguments
arg_connection=(\
  {-4,--ipv4}'[prefer ipv4]' \
  {-6,--ipv6}'[prefer ipv6, if available]' \
  {-B,--use-ascii}'[use ascii mode]' \
  '--compressed[request a compressed transfer]' \
  '--connect-timeout[timeout for connection phase]:seconds' \
  {-I,--head}'[fetch http HEAD only (HTTP/FTP/FILE]' \
  '--interface[work on a specific interface]:name' \
  '--keepalive-time[set time to wait before sending keepalive probes]:seconds' \
  '--limit-rate[specify maximum transfer rate]:speed' \
  '--local-port[set preferred number or range of local ports to use]:num' \
  {-N,--no-buffer}'[disable buffering of the output stream]' \
  '--no-keepalive[disable use of keepalive messages in TCP connections]' \
  '--raw[disable all http decoding and pass raw data]' \
  '--resolve[provide a custom address for a specific host and port pair]:host\:port\:address' \
  '--retry[specify maximum number of retries for transient errors]:num' \
  '--retry-delay[specify delay between retries]:seconds' \
  '--retry-max-time[maximum time to spend on retries]:seconds' \
  '--tcp-nodelay[turn on TCP_NODELAY option]' \
  {-y,--speed-time}'[specify time to abort after if download is slower than speed-limit]:time' \
  {-Y,--speed-limit}'[specify minimum speed for --speed-time]:speed' \
  )

# Authentication arguments
arg_auth=(\
  '--anyauth[use any authentication method, default to most secure]' \
  '--basic[use HTTP Basic authentication]' \
  '--ntlm[enable ntlm authentication]' \
  '--digest[use http digest authentication]' \
  '--krb[use kerberos authentication]:auth:(clear safe confidential private)' \
  '--negotiate[enable GSS-Negotiate authentication]' \
  {-n,--netrc}'[scan ~/.netrc for login data]' \
  '--netrc-optional[like --netrc, but does not make .netrc usage mandatory]' \
  '--netrc-file[like --netrc, but specify file to use]:netrc file:_files' \
  '--tr-encoding[request compressed transfer-encoding]' \
  {-u,--user}'[specify user name and password for server authentication]:user\:password' \
  )

# Input arguments
arg_input=(\
  {-C,--continue-at}'[resume at offset ]:offset' \
  {-g,--globoff}'[do not glob {}\[\] letters]' \
  '--max-filesize[maximum filesize to download, fail for bigger files]:bytes' \
  '--proto[specify allowed protocols for transfer]:protocols' \
  '--proto-redir[specify allowed protocols for transfer after a redirect]:protocols' \
  {-r,--range}'[set range of bytes to request (HTTP/FTP/SFTP/FILE)]:range' \
  {-R,--remote-time}'[use timestamp of remote file for local file]' \
  {-T,--upload-file}'[transfer file to remote url (using PUT for HTTP)]:file to upload:_files' \
  '--url[specify a URL to fetch (multi)]:url:_urls' \
  {-z,--time-cond}'[request downloaded file to be newer than date or given reference file]:date expression' \
  )

# Output arguments
arg_output=(\
  '--create-dirs[create local directory hierarchy as needed]' \
  {-D,--dump-header}'[write protocol headers to file]:dump file:_files' \
  {-o,--output}'[write to specified file instead of stdout]:output file:_files' \
  {--progress-bar,-\#}'[display progress as a simple progress bar]' \
  {-\#,--progress-bar}'[Make curl display progress as a simple progress bar instead of the standard, more informational, meter.]' \
  {-R,--remote-time}'[use timestamp of remote file for local file]' \
  '--raw[disable all http decoding and pass raw data]' \
  {-s,--silent}'[silent mode, do not show progress meter or error messages]' \
  {-S,--show-error}'[show errors in silent mode]' \
  '--stderr[redirect stderr to specified file]:output file:_files' \
  '--trace[enable full trace dump of all incoming and outgoing data]:trace file:_files' \
  '--trace-ascii[enable full trace dump of all incoming and outgoing data, without hex data]:trace file:_files' \
  '--trace-time[prepends a time stamp to each trace or verbose line that curl displays]' \
  {-v,--verbose}'[output debug info]' \
  {-w,--write-out}'[specify message to output on successful operation]:format string' \
  '--xattr[store some file metadata in extended file attributes]' \
  {-X,--request}'[specifies request method for HTTP server]:method:(GET POST PUT DELETE HEAD OPTIONS TRACE CONNECT PATCH LINK UNLINK)' \
  )

_arguments -C -s $arg_http $arg_ftp $arg_other $arg_crypto $arg_connection $arg_auth $arg_input $arg_output \
  {-M,--manual}'[Print manual]' \
  '*'{-K,--config}'[Use other config file to read arguments from]:config file:_files' \
  '--libcurl[output libcurl code for the operation to file]:output file:_files' \
  {-m,--max-time}'[Limit total time of operation]:seconds' \
  {-s,--silent}'[Silent mode, do not show progress meter or error messages]' \
  {-S,--show-error}'[Show errors in silent mode]' \
  '--stderr[Redirect stderr to specified file]:output file:_files' \
  '-q[Do not read settings from .curlrc (must be first option)]' \
  {-h,--help}'[Print help and list of operations]' \
  {-V,--version}'[Print service API version]' \
  '--about[Print the information about service]' \
  '--host[Specify the host URL]':URL:_urls \
  '--dry-run[Print out the cURL command without executing it]' \
  {-ac,--accept}'[Set the Accept header in the request]: :{_values "Accept mime type" $(get_mime_type_completions)}' \
  {-ct,--content-type}'[Set the Content-type header in request]: :{_values "Content mime type" $(get_mime_type_completions)}' \
  '1: :->ops' \
  '*:: :->args' \
  && ret=0


case $state in
  ops)
    # Operations
    _values "Operations" \
            "accountCartAdd[account.cart.add]" \
            "accountCartList[account.cart.list]" \
            "accountConfigUpdate[account.config.update]" \
            "accountFailedWebhooks[account.failed_webhooks]" \
            "accountSupportedPlatforms[account.supported_platforms]"             "attributeAdd[attribute.add]" \
            "attributeAssignGroup[attribute.assign.group]" \
            "attributeAssignSet[attribute.assign.set]" \
            "attributeAttributesetList[attribute.attributeset.list]" \
            "attributeCount[attribute.count]" \
            "attributeDelete[attribute.delete]" \
            "attributeGroupList[attribute.group.list]" \
            "attributeInfo[attribute.info]" \
            "attributeList[attribute.list]" \
            "attributeTypeList[attribute.type.list]" \
            "attributeUnassignGroup[attribute.unassign.group]" \
            "attributeUnassignSet[attribute.unassign.set]" \
            "attributeUpdate[attribute.update]" \
            "attributeValueAdd[attribute.value.add]" \
            "attributeValueDelete[attribute.value.delete]" \
            "attributeValueUpdate[attribute.value.update]"             "basketInfo[basket.info]" \
            "basketItemAdd[basket.item.add]" \
            "basketLiveShippingServiceCreate[basket.live_shipping_service.create]" \
            "basketLiveShippingServiceDelete[basket.live_shipping_service.delete]" \
            "basketLiveShippingServiceList[basket.live_shipping_service.list]"             "batchJobList[batch.job.list]" \
            "batchJobResult[batch.job.result]"             "bridgeDelete[bridge.delete]" \
            "bridgeDownload[bridge.download]" \
            "bridgeUpdate[bridge.update]"             "cartCatalogPriceRulesCount[cart.catalog_price_rules.count]" \
            "cartCatalogPriceRulesList[cart.catalog_price_rules.list]" \
            "cartCouponAdd[cart.coupon.add]" \
            "cartCouponConditionAdd[cart.coupon.condition.add]" \
            "cartCouponCount[cart.coupon.count]" \
            "cartCouponDelete[cart.coupon.delete]" \
            "cartCouponList[cart.coupon.list]" \
            "cartDelete[cart.delete]" \
            "cartGiftcardAdd[cart.giftcard.add]" \
            "cartGiftcardCount[cart.giftcard.count]" \
            "cartGiftcardDelete[cart.giftcard.delete]" \
            "cartGiftcardList[cart.giftcard.list]" \
            "cartInfo[cart.info]" \
            "cartMetaDataList[cart.meta_data.list]" \
            "cartMetaDataSet[cart.meta_data.set]" \
            "cartMetaDataUnset[cart.meta_data.unset]" \
            "cartMethods[cart.methods]" \
            "cartPluginList[cart.plugin.list]" \
            "cartScriptAdd[cart.script.add]" \
            "cartScriptDelete[cart.script.delete]" \
            "cartScriptList[cart.script.list]" \
            "cartShippingZonesList[cart.shipping_zones.list]" \
            "cartValidate[cart.validate]"             "categoryAdd[category.add]" \
            "categoryAddBatch[category.add.batch]" \
            "categoryAssign[category.assign]" \
            "categoryCount[category.count]" \
            "categoryDelete[category.delete]" \
            "categoryFind[category.find]" \
            "categoryImageAdd[category.image.add]" \
            "categoryImageDelete[category.image.delete]" \
            "categoryInfo[category.info]" \
            "categoryList[category.list]" \
            "categoryUnassign[category.unassign]" \
            "categoryUpdate[category.update]"             "customerAdd[customer.add]" \
            "customerAddressAdd[customer.address.add]" \
            "customerAttributeList[customer.attribute.list]" \
            "customerCount[customer.count]" \
            "customerDelete[customer.delete]" \
            "customerFind[customer.find]" \
            "customerGroupAdd[customer.group.add]" \
            "customerGroupList[customer.group.list]" \
            "customerInfo[customer.info]" \
            "customerList[customer.list]" \
            "customerUpdate[customer.update]" \
            "customerWishlistList[customer.wishlist.list]"             "marketplaceProductFind[marketplace.product.find]"             "orderAbandonedList[order.abandoned.list]" \
            "orderAdd[order.add]" \
            "orderCalculate[order.calculate]" \
            "orderCount[order.count]" \
            "orderFinancialStatusList[order.financial_status.list]" \
            "orderFulfillmentStatusList[order.fulfillment_status.list]" \
            "orderInfo[order.info]" \
            "orderList[order.list]" \
            "orderPreestimateShippingList[order.preestimate_shipping.list]" \
            "orderRefundAdd[order.refund.add]" \
            "orderReturnAdd[order.return.add]" \
            "orderReturnDelete[order.return.delete]" \
            "orderReturnUpdate[order.return.update]" \
            "orderShipmentAdd[order.shipment.add]" \
            "orderShipmentAddBatch[order.shipment.add.batch]" \
            "orderShipmentDelete[order.shipment.delete]" \
            "orderShipmentInfo[order.shipment.info]" \
            "orderShipmentList[order.shipment.list]" \
            "orderShipmentTrackingAdd[order.shipment.tracking.add]" \
            "orderShipmentUpdate[order.shipment.update]" \
            "orderStatusList[order.status.list]" \
            "orderTransactionList[order.transaction.list]" \
            "orderUpdate[order.update]"             "productAdd[product.add]" \
            "productAddBatch[product.add.batch]" \
            "productAttributeList[product.attribute.list]" \
            "productAttributeValueSet[product.attribute.value.set]" \
            "productAttributeValueUnset[product.attribute.value.unset]" \
            "productBrandList[product.brand.list]" \
            "productChildItemFind[product.child_item.find]" \
            "productChildItemInfo[product.child_item.info]" \
            "productChildItemList[product.child_item.list]" \
            "productCount[product.count]" \
            "productCurrencyAdd[product.currency.add]" \
            "productCurrencyList[product.currency.list]" \
            "productDelete[product.delete]" \
            "productDeleteBatch[product.delete.batch]" \
            "productFind[product.find]" \
            "productImageAdd[product.image.add]" \
            "productImageDelete[product.image.delete]" \
            "productImageUpdate[product.image.update]" \
            "productInfo[product.info]" \
            "productList[product.list]" \
            "productManufacturerAdd[product.manufacturer.add]" \
            "productOptionAdd[product.option.add]" \
            "productOptionAssign[product.option.assign]" \
            "productOptionDelete[product.option.delete]" \
            "productOptionList[product.option.list]" \
            "productOptionValueAdd[product.option.value.add]" \
            "productOptionValueAssign[product.option.value.assign]" \
            "productOptionValueDelete[product.option.value.delete]" \
            "productOptionValueUpdate[product.option.value.update]" \
            "productPriceAdd[product.price.add]" \
            "productPriceDelete[product.price.delete]" \
            "productPriceUpdate[product.price.update]" \
            "productReviewList[product.review.list]" \
            "productStoreAssign[product.store.assign]" \
            "productTaxAdd[product.tax.add]" \
            "productUpdate[product.update]" \
            "productUpdateBatch[product.update.batch]" \
            "productVariantAdd[product.variant.add]" \
            "productVariantAddBatch[product.variant.add.batch]" \
            "productVariantDelete[product.variant.delete]" \
            "productVariantDeleteBatch[product.variant.delete.batch]" \
            "productVariantImageAdd[product.variant.image.add]" \
            "productVariantImageDelete[product.variant.image.delete]" \
            "productVariantPriceAdd[product.variant.price.add]" \
            "productVariantPriceDelete[product.variant.price.delete]" \
            "productVariantPriceUpdate[product.variant.price.update]" \
            "productVariantUpdate[product.variant.update]" \
            "productVariantUpdateBatch[product.variant.update.batch]"             "returnActionList[return.action.list]" \
            "returnCount[return.count]" \
            "returnInfo[return.info]" \
            "returnList[return.list]" \
            "returnReasonList[return.reason.list]" \
            "returnStatusList[return.status.list]"             "subscriberList[subscriber.list]"             "taxClassInfo[tax.class.info]" \
            "taxClassList[tax.class.list]"             "webhookCount[webhook.count]" \
            "webhookCreate[webhook.create]" \
            "webhookDelete[webhook.delete]" \
            "webhookEvents[webhook.events]" \
            "webhookList[webhook.list]" \
            "webhookUpdate[webhook.update]" \

    _arguments "(--help)--help[Print information about operation]"

    ret=0
    ;;
  args)
    case $line[1] in
      accountCartAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      accountCartList)
        local -a _op_arguments
        _op_arguments=(
                    "store_url=:[QUERY] A web address of a store"
"store_key=:[QUERY] Find store by store key"
"request_from_date=:[QUERY] Retrieve entities from their creation date"
"request_to_date=:[QUERY] Retrieve entities to their creation date"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      accountConfigUpdate)
        local -a _op_arguments
        _op_arguments=(
                    "replace_parameters=true:[QUERY] Identifies if there is a necessity to replace parameters"
          "replace_parameters=false:[QUERY] Identifies if there is a necessity to replace parameters"
"new_store_url=:[QUERY] The web address of the store you want to update to connect to API2Cart"
"new_store_key=:[QUERY] Update store key"
"bridge_url=:[QUERY] This parameter allows to set up store with custom bridge url (also you must use store_root parameter if a bridge folder is not in the root folder of the store)"
"store_root=:[QUERY] Absolute path to the store root directory (used with \&quot;bridge_url\&quot; parameter)"
"db_tables_prefix=:[QUERY] DB tables prefix"
"user_agent=:[QUERY] This parameter allows you to set your custom user agent, which will be used in requests to the store. Please use it cautiously, as the store&#39;s firewall may block specific values."
"3dcart_private_key=:[QUERY] 3DCart Private Key"
"3dcart_access_token=:[QUERY] 3DCart Token"
"3dcartapi_api_key=:[QUERY] 3DCart API Key"
"amazon_sp_client_id=:[QUERY] Amazon SP API app client id"
"amazon_sp_client_secret=:[QUERY] Amazon SP API app client secret"
"amazon_sp_refresh_token=:[QUERY] Amazon SP API OAuth refresh token"
"amazon_sp_aws_region=:[QUERY] Amazon AWS Region"
"amazon_sp_api_environment=:[QUERY] Amazon SP API environment"
"amazon_seller_id=:[QUERY] Amazon Seller ID (Merchant token)"
"aspdotnetstorefront_api_user=:[QUERY] It&#39;s a AspDotNetStorefront account for which API is available"
"aspdotnetstorefront_api_pass=:[QUERY] AspDotNetStorefront API Password"
"americommerce_app_id=:[QUERY] Americommerce App ID"
"americommerce_app_secret=:[QUERY] Americommerce App Secret"
"americommerce_access_token=:[QUERY] Americommerce Access Token"
"americommerce_refresh_token=:[QUERY] Americommerce Refresh Token"
"bigcommerceapi_admin_account=:[QUERY] It&#39;s a BigCommerce account for which API is enabled"
"bigcommerceapi_api_path=:[QUERY] BigCommerce API URL"
"bigcommerceapi_api_key=:[QUERY] Bigcommerce API Key"
"bigcommerceapi_client_id=:[QUERY] Client ID of the requesting app"
"bigcommerceapi_access_token=:[QUERY] Access token authorizing the app to access resources on behalf of a user"
"bigcommerceapi_context=:[QUERY] API Path section unique to the store"
"bol_api_key=:[QUERY] Bol API Key"
"bol_api_secret=:[QUERY] Bol API Secret"
"bol_retailer_id=:[QUERY] Bol Retailer ID"
"demandware_client_id=:[QUERY] Demandware client id"
"demandware_api_password=:[QUERY] Demandware api password"
"demandware_user_name=:[QUERY] Demandware user name"
"demandware_user_password=:[QUERY] Demandware user password"
"ebay_client_id=:[QUERY] Application ID (AppID)."
"ebay_client_secret=:[QUERY] Shared Secret from eBay application"
"ebay_runame=:[QUERY] The RuName value that eBay assigns to your application."
"ebay_access_token=:[QUERY] Used to authenticate API requests."
"ebay_refresh_token=:[QUERY] Used to renew the access token."
"ebay_environment=:[QUERY] eBay environment"
"ebay_site_id=:[QUERY] eBay global ID"
"ecwid_acess_token=:[QUERY] Access token authorizing the app to access resources on behalf of a user"
"ecwid_store_id=:[QUERY] Store Id"
"lazada_app_id=:[QUERY] Lazada App ID"
"lazada_app_secret=:[QUERY] Lazada App Secret"
"lazada_refresh_token=:[QUERY] Lazada Refresh Token"
"lazada_region=:[QUERY] Lazada API endpoint Region"
"etsy_keystring=:[QUERY] Etsy keystring"
"etsy_shared_secret=:[QUERY] Etsy shared secret"
"etsy_access_token=:[QUERY] Access token authorizing the app to access resources on behalf of a user"
"etsy_token_secret=:[QUERY] Secret token authorizing the app to access resources on behalf of a user"
"etsy_client_id=:[QUERY] Etsy Client Id"
"etsy_refresh_token=:[QUERY] Etsy Refresh token"
"facebook_app_id=:[QUERY] Facebook App ID"
"facebook_app_secret=:[QUERY] Facebook App Secret"
"facebook_access_token=:[QUERY] Facebook Access Token"
"facebook_business_id=:[QUERY] Facebook Business ID"
"neto_api_key=:[QUERY] Neto API Key"
"neto_api_username=:[QUERY] Neto User Name"
"shopline_access_token=:[QUERY] Shopline APP Key"
"shopline_app_key=:[QUERY] Shopline APP Key"
"shopline_app_secret=:[QUERY] Shopline App Secret"
"shopline_shared_secret=:[QUERY] Shopline Shared Secret"
"shopify_access_token=:[QUERY] Access token authorizing the app to access resources on behalf of a user"
"shopify_api_key=:[QUERY] Shopify API Key"
"shopify_api_password=:[QUERY] Shopify API Password"
"shopify_shared_secret=:[QUERY] Shared secret"
"shopee_partner_id=:[QUERY] Shopee Partner ID"
"shopee_partner_key=:[QUERY] Shopee Partner Key"
"shopee_shop_id=:[QUERY] Shopee SHOP ID"
"shopee_refresh_token=:[QUERY] Shopee Refresh Token"
"shopee_region=:[QUERY] Shopee API endpoint Region. Use for Chinese Mainland or Brazil."
"shopee_environment=:[QUERY] Shopee Environment"
"shoplazza_access_token=:[QUERY] Access token authorizing the app to access resources on behalf of a user"
"shoplazza_shared_secret=:[QUERY] Shared secret"
"miva_access_token=:[QUERY] Miva access token"
"miva_signature=:[QUERY] Miva signature"
"shopware_access_key=:[QUERY] Shopware access key"
"unas_api_key=:[QUERY] UNAS API Key"
"shopware_api_key=:[QUERY] Shopware api key"
"shopware_api_secret=:[QUERY] Shopware client secret access key"
"bigcartel_user_name=:[QUERY] Subdomain of store"
"bigcartel_password=:[QUERY] BigCartel account password"
"bricklink_consumer_key=:[QUERY] Bricklink Consumer Key"
"bricklink_consumer_secret=:[QUERY] Bricklink Consumer Secret"
"bricklink_token=:[QUERY] Bricklink Access Token"
"bricklink_token_secret=:[QUERY] Bricklink Access Token Secret"
"volusion_login=:[QUERY] It&#39;s a Volusion account for which API is enabled"
"volusion_password=:[QUERY] Volusion API Password"
"walmart_client_id=:[QUERY] Walmart client ID. For the region &#39;ca&#39; use Consumer ID"
"walmart_client_secret=:[QUERY] Walmart client secret. For the region &#39;ca&#39; use Private Key"
"walmart_environment=:[QUERY] Walmart environment"
"walmart_channel_type=:[QUERY] Walmart WM_CONSUMER.CHANNEL.TYPE header"
"walmart_region=:[QUERY] Walmart region"
"square_client_id=:[QUERY] Square (Weebly) Client ID"
"square_client_secret=:[QUERY] Square (Weebly) Client Secret"
"square_refresh_token=:[QUERY] Square (Weebly) Refresh Token"
"squarespace_api_key=:[QUERY] Squarespace API Key"
"squarespace_client_id=:[QUERY] Squarespace Connector Client ID"
"squarespace_client_secret=:[QUERY] Squarespace Connector Client Secret"
"squarespace_access_token=:[QUERY] Squarespace access token"
"squarespace_refresh_token=:[QUERY] Squarespace refresh token"
"hybris_client_id=:[QUERY] Omni Commerce Connector Client ID"
"hybris_client_secret=:[QUERY] Omni Commerce Connector Client Secret"
"hybris_username=:[QUERY] User Name"
"hybris_password=:[QUERY] User password"
"hybris_websites=:[QUERY] Websites to stores mapping data"
"lightspeed_api_key=:[QUERY] LightSpeed api key"
"lightspeed_api_secret=:[QUERY] LightSpeed api secret"
"commercehq_api_key=:[QUERY] CommerceHQ api key"
"commercehq_api_password=:[QUERY] CommerceHQ api password"
"wc_consumer_key=:[QUERY] Woocommerce consumer key"
"wc_consumer_secret=:[QUERY] Woocommerce consumer secret"
"magento_consumer_key=:[QUERY] Magento Consumer Key"
"magento_consumer_secret=:[QUERY] Magento Consumer Secret"
"magento_access_token=:[QUERY] Magento Access Token"
"magento_token_secret=:[QUERY] Magento Token Secret"
"prestashop_webservice_key=:[QUERY] Prestashop webservice key"
"wix_app_id=:[QUERY] Wix App ID"
"wix_app_secret_key=:[QUERY] Wix App Secret Key"
"wix_instance_id=:[QUERY] Wix Instance ID"
"wix_refresh_token=:[QUERY] Wix refresh token"
"mercado_libre_app_id=:[QUERY] Mercado Libre App ID"
"mercado_libre_app_secret_key=:[QUERY] Mercado Libre App Secret Key"
"mercado_libre_refresh_token=:[QUERY] Mercado Libre Refresh Token"
"zid_client_id=:[QUERY] Zid Client ID"
"zid_client_secret=:[QUERY] Zid Client Secret"
"zid_access_token=:[QUERY] Zid Access Token"
"zid_authorization=:[QUERY] Zid Authorization"
"zid_refresh_token=:[QUERY] Zid refresh token"
"flipkart_client_id=:[QUERY] Flipkart Client ID"
"flipkart_client_secret=:[QUERY] Flipkart Client Secret"
"allegro_client_id=:[QUERY] Allegro Client ID"
"allegro_client_secret=:[QUERY] Allegro Client Secret"
"allegro_access_token=:[QUERY] Allegro Access Token"
"allegro_refresh_token=:[QUERY] Allegro Refresh Token"
"allegro_environment=:[QUERY] Allegro Environment"
"zoho_client_id=:[QUERY] Zoho Client ID"
"zoho_client_secret=:[QUERY] Zoho Client Secret"
"zoho_refresh_token=:[QUERY] Zoho Refresh Token"
"zoho_region=:[QUERY] Zoho API endpoint Region"
"tiendanube_user_id=:[QUERY] Tiendanube User ID"
"tiendanube_access_token=:[QUERY] Tiendanube Access Token"
"tiendanube_client_secret=:[QUERY] Tiendanube Client Secret"
"otto_client_id=:[QUERY] Otto Client ID"
"otto_client_secret=:[QUERY] Otto Client Secret"
"otto_app_id=:[QUERY] Otto App ID"
"otto_refresh_token=:[QUERY] Otto Refresh Token"
"otto_environment=:[QUERY] Otto Environment"
"otto_access_token=:[QUERY] Otto Access Token"
"tiktokshop_app_key=:[QUERY] TikTok Shop App Key"
"tiktokshop_app_secret=:[QUERY] TikTok Shop App Secret"
"tiktokshop_refresh_token=:[QUERY] TikTok Shop Refresh Token"
"tiktokshop_access_token=:[QUERY] TikTok Shop Access Token"
"salla_client_id=:[QUERY] Salla Client ID"
"salla_client_secret=:[QUERY] Salla Client Secret"
"salla_refresh_token=:[QUERY] Salla Refresh Token"
"salla_access_token=:[QUERY] Salla Access Token"
"temu_app_key=:[QUERY] Temu App Key"
"temu_app_secret=:[QUERY] Temu App Secret"
"temu_access_token=:[QUERY] Temu Access Token"
"temu_region=:[QUERY] Temu API endpoint Region."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      accountFailedWebhooks)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"ids=:[QUERY] List of сomma-separated webhook ids"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      accountSupportedPlatforms)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      attributeAdd)
        local -a _op_arguments
        _op_arguments=(
                    "type=:[QUERY] Defines attribute&#39;s type"
"name=:[QUERY] Defines attributes&#39;s name"
"code=:[QUERY] Entity code"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
"visible=true:[QUERY] Set visibility status"
          "visible=false:[QUERY] Set visibility status"
"required=true:[QUERY] Defines if the option is required"
          "required=false:[QUERY] Defines if the option is required"
"position=:[QUERY] Attribute&#39;s position"
"attribute_group_id=:[QUERY] Filter by attribute_group_id"
"is_global=:[QUERY] Attribute saving scope"
"is_searchable=true:[QUERY] Use attribute in Quick Search"
          "is_searchable=false:[QUERY] Use attribute in Quick Search"
"is_filterable=:[QUERY] Use In Layered Navigation"
"is_comparable=true:[QUERY] Comparable on Front-end"
          "is_comparable=false:[QUERY] Comparable on Front-end"
"is_html_allowed_on_front=true:[QUERY] Allow HTML Tags on Frontend"
          "is_html_allowed_on_front=false:[QUERY] Allow HTML Tags on Frontend"
"is_filterable_in_search=true:[QUERY] Use In Search Results Layered Navigation"
          "is_filterable_in_search=false:[QUERY] Use In Search Results Layered Navigation"
"is_configurable=true:[QUERY] Use To Create Configurable Product"
          "is_configurable=false:[QUERY] Use To Create Configurable Product"
"is_visible_in_advanced_search=true:[QUERY] Use in Advanced Search"
          "is_visible_in_advanced_search=false:[QUERY] Use in Advanced Search"
"is_used_for_promo_rules=true:[QUERY] Use for Promo Rule Conditions"
          "is_used_for_promo_rules=false:[QUERY] Use for Promo Rule Conditions"
"used_in_product_listing=true:[QUERY] Used in Product Listing"
          "used_in_product_listing=false:[QUERY] Used in Product Listing"
"used_for_sort_by=true:[QUERY] Used for Sorting in Product Listing"
          "used_for_sort_by=false:[QUERY] Used for Sorting in Product Listing"
"apply_to=:[QUERY] Types of products which can have this attribute"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      attributeAssignGroup)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Entity id"
"group_id=:[QUERY] Attribute group_id"
"attribute_set_id=:[QUERY] Attribute set id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      attributeAssignSet)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Entity id"
"group_id=:[QUERY] Attribute group_id"
"attribute_set_id=:[QUERY] Attribute set id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      attributeAttributesetList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      attributeCount)
        local -a _op_arguments
        _op_arguments=(
                    "type=:[QUERY] Defines attribute&#39;s type"
"attribute_set_id=:[QUERY] Filter items by attribute set id"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
"visible=true:[QUERY] Filter items by visibility status"
          "visible=false:[QUERY] Filter items by visibility status"
"required=true:[QUERY] Defines if the option is required"
          "required=false:[QUERY] Defines if the option is required"
"system=true:[QUERY] True if attribute is system"
          "system=false:[QUERY] True if attribute is system"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      attributeDelete)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Entity id"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      attributeGroupList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"attribute_set_id=:[QUERY] Attribute set id"
"lang_id=:[QUERY] Language id"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      attributeInfo)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Entity id"
"attribute_set_id=:[QUERY] Attribute set id"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      attributeList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"attribute_ids=:[QUERY] Filter attributes by ids"
"attribute_set_id=:[QUERY] Filter items by attribute set id"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Retrieves attributes on specified language id"
"type=:[QUERY] Defines attribute&#39;s type"
"visible=true:[QUERY] Filter items by visibility status"
          "visible=false:[QUERY] Filter items by visibility status"
"required=true:[QUERY] Defines if the option is required"
          "required=false:[QUERY] Defines if the option is required"
"system=true:[QUERY] True if attribute is system"
          "system=false:[QUERY] True if attribute is system"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      attributeTypeList)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      attributeUnassignGroup)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Entity id"
"group_id=:[QUERY] Customer group_id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      attributeUnassignSet)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Entity id"
"attribute_set_id=:[QUERY] Attribute set id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      attributeUpdate)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Entity id"
"name=:[QUERY] Defines new attributes&#39;s name"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      attributeValueAdd)
        local -a _op_arguments
        _op_arguments=(
                    "attribute_id=:[QUERY] Attribute Id"
"name=:[QUERY] Defines attribute value&#39;s name"
"code=:[QUERY] Entity code"
"description=:[QUERY] Defines attribute value&#39;s description"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      attributeValueDelete)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Entity id"
"attribute_id=:[QUERY] Attribute Id"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      attributeValueUpdate)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Defines attribute value&#39;s id"
"attribute_id=:[QUERY] Attribute Id"
"name=:[QUERY] Defines attribute value&#39;s name"
"description=:[QUERY] Defines new attribute value&#39;s description"
"code=:[QUERY] Entity code"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      basketInfo)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Entity id"
"store_id=:[QUERY] Store Id"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      basketItemAdd)
        local -a _op_arguments
        _op_arguments=(
                    "customer_id=:[QUERY] Retrieves orders specified by customer id"
"product_id=:[QUERY] Defines id of the product which should be added to the basket"
"variant_id=:[QUERY] Defines product&#39;s variants specified by variant id"
"quantity=:[QUERY] Defines new items quantity"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      basketLiveShippingServiceCreate)
        local -a _op_arguments
        _op_arguments=(
                    "name=:[QUERY] Shipping Service Name"
"callback=:[QUERY] Callback url that returns shipping rates. It should be able to accept POST requests with json data."
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      basketLiveShippingServiceDelete)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Entity id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      basketLiveShippingServiceList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      batchJobList)
        local -a _op_arguments
        _op_arguments=(
                    "count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"ids=:[QUERY] Filter batch jobs by ids"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"processed_from=:[QUERY] Retrieve entities according to their processing datetime"
"processed_to=:[QUERY] Retrieve entities according to their processing datetime"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      batchJobResult)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Entity id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      bridgeDelete)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      bridgeDownload)
        local -a _op_arguments
        _op_arguments=(
                    "whitelabel=true:[QUERY] Identifies if there is a necessity to download whitelabel bridge."
          "whitelabel=false:[QUERY] Identifies if there is a necessity to download whitelabel bridge."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      bridgeUpdate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartCatalogPriceRulesCount)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartCatalogPriceRulesList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"ids=:[QUERY] Retrieves  catalog_price_rules by ids"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartCouponAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartCouponConditionAdd)
        local -a _op_arguments
        _op_arguments=(
                    "coupon_id=:[QUERY] Coupon Id"
"entity=:[QUERY] Defines condition entity type"
"key=:[QUERY] Defines condition entity attribute key"
"operator=:[QUERY] Defines condition operator"
"value=:[QUERY] Defines condition value, can be comma separated according to the operator."
"target=:[QUERY] Defines condition operator"
"include_tax=true:[QUERY] Indicates whether to apply a discount for taxes."
          "include_tax=false:[QUERY] Indicates whether to apply a discount for taxes."
"include_shipping=true:[QUERY] Indicates whether to apply a discount for shipping."
          "include_shipping=false:[QUERY] Indicates whether to apply a discount for shipping."
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartCouponCount)
        local -a _op_arguments
        _op_arguments=(
                    "store_id=:[QUERY] Store Id"
"avail=true:[QUERY] Defines category&#39;s visibility status"
          "avail=false:[QUERY] Defines category&#39;s visibility status"
"date_start_from=:[QUERY] Filter entity by date_start (greater or equal)"
"date_start_to=:[QUERY] Filter entity by date_start (less or equal)"
"date_end_from=:[QUERY] Filter entity by date_end (greater or equal)"
"date_end_to=:[QUERY] Filter entity by date_end (less or equal)"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartCouponDelete)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Entity id"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartCouponList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"coupons_ids=:[QUERY] Filter coupons by ids"
"store_id=:[QUERY] Filter coupons by store id"
"lang_id=:[QUERY] Language id"
"avail=true:[QUERY] Filter coupons by avail status"
          "avail=false:[QUERY] Filter coupons by avail status"
"status=:[QUERY] Defines coupon&#39;s status"
"date_start_from=:[QUERY] Filter entity by date_start (greater or equal)"
"date_start_to=:[QUERY] Filter entity by date_start (less or equal)"
"date_end_from=:[QUERY] Filter entity by date_end (greater or equal)"
"date_end_to=:[QUERY] Filter entity by date_end (less or equal)"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartDelete)
        local -a _op_arguments
        _op_arguments=(
                    "delete_bridge=true:[QUERY] Identifies if there is a necessity to delete bridge"
          "delete_bridge=false:[QUERY] Identifies if there is a necessity to delete bridge"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartGiftcardAdd)
        local -a _op_arguments
        _op_arguments=(
                    "amount=:[QUERY] Defines the gift card amount value."
"code=:[QUERY] Gift card code"
"owner_email=:[QUERY] Gift card owner email"
"recipient_email=:[QUERY] Gift card recipient email"
"recipient_name=:[QUERY] Gift card recipient name"
"owner_name=:[QUERY] Gift card owner name"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartGiftcardCount)
        local -a _op_arguments
        _op_arguments=(
                    "store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartGiftcardDelete)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Entity id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartGiftcardList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"store_id=:[QUERY] Store Id"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartInfo)
        local -a _op_arguments
        _op_arguments=(
                    "store_id=:[QUERY] Store Id"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartMetaDataList)
        local -a _op_arguments
        _op_arguments=(
                    "count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"entity_id=:[QUERY] Entity Id"
"entity=:[QUERY] Entity"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
"key=:[QUERY] Key"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartMetaDataSet)
        local -a _op_arguments
        _op_arguments=(
                    "entity_id=:[QUERY] Entity Id"
"key=:[QUERY] Key"
"value=:[QUERY] Value"
"namespace=:[QUERY] Metafield namespace"
"entity=:[QUERY] Entity"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartMetaDataUnset)
        local -a _op_arguments
        _op_arguments=(
                    "entity_id=:[QUERY] Entity Id"
"key=:[QUERY] Key"
"id=:[QUERY] Entity id"
"entity=:[QUERY] Entity"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartMethods)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartPluginList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartScriptAdd)
        local -a _op_arguments
        _op_arguments=(
                    "name=:[QUERY] The user-friendly script name"
"description=:[QUERY] The user-friendly description"
"html=:[QUERY] An html string containing exactly one &#39;script&#39; tag."
"src=:[QUERY] The URL of the remote script"
"load_method=:[QUERY] The load method to use for the script"
"scope=:[QUERY] The page or pages on the online store where the script should be included"
"events=:[QUERY] Event for run scripts"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartScriptDelete)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Entity id"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartScriptList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"script_ids=:[QUERY] Retrieves only scripts with specific ids"
"store_id=:[QUERY] Store Id"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartShippingZonesList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"store_id=:[QUERY] Store Id"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      cartValidate)
        local -a _op_arguments
        _op_arguments=(
                    "validate_version=true:[QUERY] Specify if api2cart should validate cart version"
          "validate_version=false:[QUERY] Specify if api2cart should validate cart version"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      categoryAdd)
        local -a _op_arguments
        _op_arguments=(
                    "name=:[QUERY] Defines category&#39;s name that has to be added"
"description=:[QUERY] Defines category&#39;s description"
"short_description=:[QUERY] Defines short description"
"parent_id=:[QUERY] Adds categories specified by parent id"
"avail=true:[QUERY] Defines category&#39;s visibility status"
          "avail=false:[QUERY] Defines category&#39;s visibility status"
"created_time=:[QUERY] Entity&#39;s date creation"
"modified_time=:[QUERY] Entity&#39;s date modification"
"sort_order=:[QUERY] Sort number in the list"
"meta_title=:[QUERY] Defines unique meta title for each entity"
"meta_description=:[QUERY] Defines unique meta description of a entity"
"meta_keywords=:[QUERY] Defines unique meta keywords for each entity"
"seo_url=:[QUERY] Defines unique category&#39;s URL for SEO"
"store_id=:[QUERY] Store Id"
"stores_ids=:[QUERY] Create category in the stores that is specified by comma-separated stores&#39; id"
"lang_id=:[QUERY] Language id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      categoryAddBatch)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      categoryAssign)
        local -a _op_arguments
        _op_arguments=(
                    "category_id=:[QUERY] Defines category assign, specified by category id"
"product_id=:[QUERY] Defines category assign to the product, specified by product id"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      categoryCount)
        local -a _op_arguments
        _op_arguments=(
                    "parent_id=:[QUERY] Counts categories specified by parent id"
"store_id=:[QUERY] Counts category specified by store id"
"lang_id=:[QUERY] Counts category specified by language id"
"avail=true:[QUERY] Defines category&#39;s visibility status"
          "avail=false:[QUERY] Defines category&#39;s visibility status"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
"product_type=:[QUERY] A categorization for the product"
"find_value=:[QUERY] Entity search that is specified by some value"
"find_where=:[QUERY] Counts categories that are searched specified by field"
"report_request_id=:[QUERY] Report request id"
"disable_report_cache=true:[QUERY] Disable report cache for current request"
          "disable_report_cache=false:[QUERY] Disable report cache for current request"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      categoryDelete)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Defines category removal, specified by category id"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      categoryFind)
        local -a _op_arguments
        _op_arguments=(
                    "find_value=:[QUERY] Entity search that is specified by some value"
"find_where=:[QUERY] Entity search that is specified by the comma-separated unique fields"
"find_params=:[QUERY] Entity search that is specified by comma-separated parameters"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      categoryImageAdd)
        local -a _op_arguments
        _op_arguments=(
                    "category_id=:[QUERY] Defines category id where the image should be added"
"image_name=:[QUERY] Defines image&#39;s name"
"url=:[QUERY] Defines URL of the image that has to be added"
"type=:[QUERY] Defines image&#39;s types that are specified by comma-separated list"
"store_id=:[QUERY] Store Id"
"label=:[QUERY] Defines alternative text that has to be attached to the picture"
"mime=:[QUERY] Mime type of image http://en.wikipedia.org/wiki/Internet_media_type."
"position=:[QUERY] Defines image’s position in the list"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      categoryImageDelete)
        local -a _op_arguments
        _op_arguments=(
                    "category_id=:[QUERY] Defines category id where the image should be deleted"
"image_id=:[QUERY] Define image id"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      categoryInfo)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Retrieves category&#39;s info specified by category id"
"store_id=:[QUERY] Retrieves category info  specified by store id"
"lang_id=:[QUERY] Retrieves category info  specified by language id"
"schema_type=:[QUERY] The name of the requirements set for the provided schema."
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
"report_request_id=:[QUERY] Report request id"
"disable_report_cache=true:[QUERY] Disable report cache for current request"
          "disable_report_cache=false:[QUERY] Disable report cache for current request"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      categoryList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"store_id=:[QUERY] Retrieves categories specified by store id"
"lang_id=:[QUERY] Retrieves categorys specified by language id"
"parent_id=:[QUERY] Retrieves categories specified by parent id"
"avail=true:[QUERY] Defines category&#39;s visibility status"
          "avail=false:[QUERY] Defines category&#39;s visibility status"
"product_type=:[QUERY] A categorization for the product"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
"find_value=:[QUERY] Entity search that is specified by some value"
"find_where=:[QUERY] Category search that is specified by field"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
"report_request_id=:[QUERY] Report request id"
"disable_report_cache=true:[QUERY] Disable report cache for current request"
          "disable_report_cache=false:[QUERY] Disable report cache for current request"
"disable_cache=true:[QUERY] Disable cache for current request"
          "disable_cache=false:[QUERY] Disable cache for current request"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      categoryUnassign)
        local -a _op_arguments
        _op_arguments=(
                    "category_id=:[QUERY] Defines category unassign, specified by category id"
"product_id=:[QUERY] Defines category unassign to the product, specified by product id"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      categoryUpdate)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Defines category update specified by category id"
"name=:[QUERY] Defines new category’s name"
"description=:[QUERY] Defines new category&#39;s description"
"short_description=:[QUERY] Defines short description"
"parent_id=:[QUERY] Defines new parent category id"
"avail=true:[QUERY] Defines category&#39;s visibility status"
          "avail=false:[QUERY] Defines category&#39;s visibility status"
"sort_order=:[QUERY] Sort number in the list"
"modified_time=:[QUERY] Entity&#39;s date modification"
"meta_title=:[QUERY] Defines unique meta title for each entity"
"meta_description=:[QUERY] Defines unique meta description of a entity"
"meta_keywords=:[QUERY] Defines unique meta keywords for each entity"
"seo_url=:[QUERY] Defines unique category&#39;s URL for SEO"
"store_id=:[QUERY] Store Id"
"stores_ids=:[QUERY] Update category in the stores that is specified by comma-separated stores&#39; id"
"lang_id=:[QUERY] Language id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      customerAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      customerAddressAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      customerAttributeList)
        local -a _op_arguments
        _op_arguments=(
                    "count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"customer_id=:[QUERY] Retrieves orders specified by customer id"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      customerCount)
        local -a _op_arguments
        _op_arguments=(
                    "ids=:[QUERY] Counts customers specified by ids"
"since_id=:[QUERY] Retrieve entities starting from the specified id."
"customer_list_id=:[QUERY] The numeric ID of the customer list in Demandware."
"group_id=:[QUERY] Customer group_id"
"store_id=:[QUERY] Counts customer specified by store id"
"avail=true:[QUERY] Defines category&#39;s visibility status"
          "avail=false:[QUERY] Defines category&#39;s visibility status"
"include_guests=true:[QUERY] Indicates whether to include guest customers in the total count."
          "include_guests=false:[QUERY] Indicates whether to include guest customers in the total count."
"find_value=:[QUERY] Entity search that is specified by some value"
"find_where=:[QUERY] Counts customers that are searched specified by field"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      customerDelete)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Identifies customer specified by the id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      customerFind)
        local -a _op_arguments
        _op_arguments=(
                    "find_value=:[QUERY] Entity search that is specified by some value"
"find_where=:[QUERY] Entity search that is specified by the comma-separated unique fields"
"find_params=:[QUERY] Entity search that is specified by comma-separated parameters"
"store_id=:[QUERY] Store Id"
"include_guests=true:[QUERY] Indicates whether to search among guest customers when looking up a customer."
          "include_guests=false:[QUERY] Indicates whether to search among guest customers when looking up a customer."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      customerGroupAdd)
        local -a _op_arguments
        _op_arguments=(
                    "name=:[QUERY] Customer group name"
"store_id=:[QUERY] Store Id"
"stores_ids=:[QUERY] Assign customer group to the stores that is specified by comma-separated stores&#39; id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      customerGroupList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"group_ids=:[QUERY] Groups that will be assigned to a customer"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
"disable_cache=true:[QUERY] Disable cache for current request"
          "disable_cache=false:[QUERY] Disable cache for current request"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      customerInfo)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Retrieves customer&#39;s info specified by customer id"
"store_id=:[QUERY] Retrieves customer info specified by store id"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      customerList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"ids=:[QUERY] Retrieves customers specified by ids"
"since_id=:[QUERY] Retrieve entities starting from the specified id."
"customer_list_id=:[QUERY] The numeric ID of the customer list in Demandware."
"group_id=:[QUERY] Customer group_id"
"store_id=:[QUERY] Retrieves customers specified by store id"
"avail=true:[QUERY] Defines category&#39;s visibility status"
          "avail=false:[QUERY] Defines category&#39;s visibility status"
"include_guests=true:[QUERY] Indicates whether to include guest customers in the list results."
          "include_guests=false:[QUERY] Indicates whether to include guest customers in the list results."
"find_value=:[QUERY] Entity search that is specified by some value"
"find_where=:[QUERY] Customer search that is specified by field"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
"sort_by=:[QUERY] Set field to sort by"
"sort_direction=:[QUERY] Set sorting direction"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      customerUpdate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      customerWishlistList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"customer_id=:[QUERY] Retrieves orders specified by customer id"
"id=:[QUERY] Entity id"
"store_id=:[QUERY] Store Id"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      marketplaceProductFind)
        local -a _op_arguments
        _op_arguments=(
                    "count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"keyword=:[QUERY] Defines search keyword"
"categories_ids=:[QUERY] Defines product add that is specified by comma-separated categories id"
"store_id=:[QUERY] Store Id"
"asin=:[QUERY] Amazon Standard Identification Number."
"ean=:[QUERY] European Article Number. An EAN is a unique 8 or 13-digit identifier that many industries (such as book publishers) use to identify products."
"gtin=:[QUERY] Global Trade Item Number. An GTIN is an identifier for trade items."
"upc=:[QUERY] Universal Product Code. A UPC (UPC-A) is a commonly used identifer for many different products."
"mpn=:[QUERY] Manufacturer Part Number. A MPN is an identifier of a particular part design or material used."
"isbn=:[QUERY] International Standard Book Number. An ISBN is a unique identifier for books."
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderAbandonedList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"customer_id=:[QUERY] Retrieves orders specified by customer id"
"customer_email=:[QUERY] Retrieves orders specified by customer email"
"store_id=:[QUERY] Store Id"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
"skip_empty_email=true:[QUERY] Filter empty emails"
          "skip_empty_email=false:[QUERY] Filter empty emails"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderCalculate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderCount)
        local -a _op_arguments
        _op_arguments=(
                    "order_ids=:[QUERY] Counts orders specified by order ids"
"ids=:[QUERY] Counts orders specified by ids"
"customer_id=:[QUERY] Counts orders quantity specified by customer id"
"store_id=:[QUERY] Counts orders quantity specified by store id"
"customer_email=:[QUERY] Counts orders quantity specified by customer email"
"order_status=:[QUERY] Counts orders quantity specified by order status"
"order_status_ids=:[QUERY] Retrieves orders specified by order statuses"
"ebay_order_status=:[QUERY] Counts orders quantity specified by order status"
"financial_status=:[QUERY] Counts orders quantity specified by financial status"
"financial_status_ids=:[QUERY] Retrieves orders count specified by financial status ids"
"fulfillment_channel=:[QUERY] Retrieves order with a fulfillment channel"
"fulfillment_status=:[QUERY] Create order with fulfillment status"
"shipping_method=:[QUERY] Retrieve entities according to shipping method"
"delivery_method=:[QUERY] Retrieves order with delivery method"
"tags=:[QUERY] Order tags"
"ship_node_type=:[QUERY] Retrieves order with ship node type"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderFinancialStatusList)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderFulfillmentStatusList)
        local -a _op_arguments
        _op_arguments=(
                    "action=:[QUERY] Available statuses for the specified action."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderInfo)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Retrieves order info specified by id"
"order_id=:[QUERY] Retrieves order’s info specified by order id"
"store_id=:[QUERY] Defines store id where the order should be found"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
"enable_cache=true:[QUERY] If the value is &#39;true&#39; and order exist in our cache, we will return order.info response from cache"
          "enable_cache=false:[QUERY] If the value is &#39;true&#39; and order exist in our cache, we will return order.info response from cache"
"use_latest_api_version=true:[QUERY] Use the latest platform API version"
          "use_latest_api_version=false:[QUERY] Use the latest platform API version"
"rounding_precision=:[QUERY] &lt;p&gt;Specifies the rounding precision for fractional numeric values (such as prices, taxes, and weights).&lt;/p&gt; &lt;p&gt;Supported values range from &lt;b&gt;1&lt;/b&gt; to &lt;b&gt;6&lt;/b&gt;.&lt;/p&gt; &lt;p&gt;The default rounding precision may vary depending on the platform. You can retrieve the default value using the &lt;strong&gt;cart.info&lt;/strong&gt; method in the &lt;code&gt;default_rounding_precision&lt;/code&gt; field. &lt;/p&gt;&lt;p&gt;Values are rounded to the nearest number at the specified precision. Fractions of .5 or higher are rounded up, while fractions lower than .5 are rounded down.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve orders via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"ids=:[QUERY] Retrieves orders specified by ids"
"order_ids=:[QUERY] Retrieves orders specified by order ids"
"since_id=:[QUERY] Retrieve entities starting from the specified id."
"store_id=:[QUERY] Store Id"
"customer_id=:[QUERY] Retrieves orders specified by customer id"
"customer_email=:[QUERY] Retrieves orders specified by customer email"
"basket_id=:[QUERY] Retrieves order’s info specified by basket id."
"currency_id=:[QUERY] Currency Id"
"phone=:[QUERY] Filter orders by customer&#39;s phone number"
"order_status=:[QUERY] Retrieves orders specified by order status"
"order_status_ids=:[QUERY] Retrieves orders specified by order statuses"
"ebay_order_status=:[QUERY] Retrieves orders specified by order status"
"financial_status=:[QUERY] Retrieves orders specified by financial status"
"financial_status_ids=:[QUERY] Retrieves orders specified by financial status ids"
"fulfillment_status=:[QUERY] Create order with fulfillment status"
"return_status=:[QUERY] Retrieves orders specified by return status"
"fulfillment_channel=:[QUERY] Retrieves order with a fulfillment channel"
"shipping_method=:[QUERY] Retrieve entities according to shipping method"
"skip_order_ids=:[QUERY] Skipped orders by ids"
"is_deleted=true:[QUERY] Filter deleted orders"
          "is_deleted=false:[QUERY] Filter deleted orders"
"shipping_country_iso3=:[QUERY] Retrieve entities according to shipping country"
"delivery_method=:[QUERY] Retrieves order with delivery method"
"ship_node_type=:[QUERY] Retrieves order with ship node type"
"created_to=:[QUERY] Retrieve entities to their creation date"
"created_from=:[QUERY] Retrieve entities from their creation date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"tags=:[QUERY] Order tags"
"sort_by=:[QUERY] Set field to sort by"
"sort_direction=:[QUERY] Set sorting direction"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
"enable_cache=true:[QUERY] If the value is &#39;true&#39;, we will cache orders for a 15 minutes in order to increase speed and reduce requests throttling for some methods and shoping platforms (for example order.shipment.add)"
          "enable_cache=false:[QUERY] If the value is &#39;true&#39;, we will cache orders for a 15 minutes in order to increase speed and reduce requests throttling for some methods and shoping platforms (for example order.shipment.add)"
"use_latest_api_version=true:[QUERY] Use the latest platform API version"
          "use_latest_api_version=false:[QUERY] Use the latest platform API version"
"rounding_precision=:[QUERY] &lt;p&gt;Specifies the rounding precision for fractional numeric values (such as prices, taxes, and weights).&lt;/p&gt; &lt;p&gt;Supported values range from &lt;b&gt;1&lt;/b&gt; to &lt;b&gt;6&lt;/b&gt;.&lt;/p&gt; &lt;p&gt;The default rounding precision may vary depending on the platform. You can retrieve the default value using the &lt;strong&gt;cart.info&lt;/strong&gt; method in the &lt;code&gt;default_rounding_precision&lt;/code&gt; field. &lt;/p&gt;&lt;p&gt;Values are rounded to the nearest number at the specified precision. Fractions of .5 or higher are rounded up, while fractions lower than .5 are rounded down.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderPreestimateShippingList)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderRefundAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderReturnAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderReturnDelete)
        local -a _op_arguments
        _op_arguments=(
                    "return_id=:[QUERY] Return ID"
"order_id=:[QUERY] Defines the order id"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderReturnUpdate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderShipmentAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderShipmentAddBatch)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderShipmentDelete)
        local -a _op_arguments
        _op_arguments=(
                    "shipment_id=:[QUERY] Shipment id indicates the number of delivery"
"order_id=:[QUERY] Defines the order for which the shipment will be deleted"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderShipmentInfo)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"id=:[QUERY] Entity id"
"order_id=:[QUERY] Defines the order id"
"store_id=:[QUERY] Store Id"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderShipmentList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"order_id=:[QUERY] Retrieves shipments specified by order id"
"store_id=:[QUERY] Store Id"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderShipmentTrackingAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderShipmentUpdate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderStatusList)
        local -a _op_arguments
        _op_arguments=(
                    "store_id=:[QUERY] Store Id"
"action=:[QUERY] Available statuses for the specified action."
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderTransactionList)
        local -a _op_arguments
        _op_arguments=(
                    "count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"order_ids=:[QUERY] Retrieves order transactions specified by order ids"
"store_id=:[QUERY] Store Id"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      orderUpdate)
        local -a _op_arguments
        _op_arguments=(
                    "order_id=:[QUERY] Defines the orders specified by order id"
"store_id=:[QUERY] Defines store id where the order should be found"
"order_status=:[QUERY] Defines new order&#39;s status"
"financial_status=:[QUERY] Update order financial status to specified"
"fulfillment_status=:[QUERY] Create order with fulfillment status"
"cancellation_reason=:[QUERY] Defines the cancellation reason when the order will be canceled"
"order_payment_method=:[QUERY] Defines order payment method.&lt;br/&gt;Setting order_payment_method on Shopify will also change financial_status field value to &#39;paid&#39;"
"comment=:[QUERY] Specifies order comment"
"admin_comment=:[QUERY] Specifies admin&#39;s order comment"
"admin_private_comment=:[QUERY] Specifies private admin&#39;s order comment"
"invoice_admin_comment=:[QUERY] Specifies admin&#39;s order invoice comment"
"date_modified=:[QUERY] Specifies order&#39;s  modification date"
"date_finished=:[QUERY] Specifies order&#39;s  finished date"
"send_notifications=true:[QUERY] Send notifications to customer after order was created"
          "send_notifications=false:[QUERY] Send notifications to customer after order was created"
"create_invoice=true:[QUERY] Determines whether an invoice should be created if it has not already been created"
          "create_invoice=false:[QUERY] Determines whether an invoice should be created if it has not already been created"
"origin=:[QUERY] The source of the order"
"tags=:[QUERY] Order tags"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productAddBatch)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productAttributeList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"product_id=:[QUERY] Retrieves attributes specified by product id"
"attribute_id=:[QUERY] Retrieves info for specified attribute_id"
"variant_id=:[QUERY] Defines product&#39;s variants specified by variant id"
"attribute_group_id=:[QUERY] Filter by attribute_group_id"
"lang_id=:[QUERY] Retrieves attributes specified by language id"
"store_id=:[QUERY] Retrieves attributes specified by store id"
"set_name=:[QUERY] Retrieves attributes specified by set_name in Magento"
"sort_by=:[QUERY] Set field to sort by"
"sort_direction=:[QUERY] Set sorting direction"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productAttributeValueSet)
        local -a _op_arguments
        _op_arguments=(
                    "product_id=:[QUERY] Defines product id where the attribute should be added"
"attribute_id=:[QUERY] Filter by attribute_id"
"attribute_group_id=:[QUERY] Filter by attribute_group_id"
"attribute_name=:[QUERY] Define attribute name"
"value=:[QUERY] Define attribute value"
"value_id=:[QUERY] Define attribute value id"
"lang_id=:[QUERY] Language id"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productAttributeValueUnset)
        local -a _op_arguments
        _op_arguments=(
                    "product_id=:[QUERY] Product id"
"attribute_id=:[QUERY] Attribute Id"
"store_id=:[QUERY] Store Id"
"include_default=true:[QUERY] Boolean, whether or not to unset default value of the attribute, if applicable"
          "include_default=false:[QUERY] Boolean, whether or not to unset default value of the attribute, if applicable"
"reindex=true:[QUERY] Is reindex required"
          "reindex=false:[QUERY] Is reindex required"
"clear_cache=true:[QUERY] Is cache clear required"
          "clear_cache=false:[QUERY] Is cache clear required"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productBrandList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"brand_ids=:[QUERY] Retrieves brands specified by brand ids"
"category_id=:[QUERY] Retrieves product brands specified by category id"
"parent_id=:[QUERY] Retrieves brands specified by parent id"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
"find_where=:[QUERY] Entity search that is specified by the comma-separated unique fields"
"find_value=:[QUERY] Entity search that is specified by some value"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productChildItemFind)
        local -a _op_arguments
        _op_arguments=(
                    "find_value=:[QUERY] Entity search that is specified by some value"
"find_where=:[QUERY] Entity search that is specified by the comma-separated unique fields"
"find_params=:[QUERY] Entity search that is specified by comma-separated parameters"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productChildItemInfo)
        local -a _op_arguments
        _op_arguments=(
                    "product_id=:[QUERY] Filter by parent product id"
"id=:[QUERY] Entity id"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
"currency_id=:[QUERY] Currency Id"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
"use_latest_api_version=true:[QUERY] Use the latest platform API version"
          "use_latest_api_version=false:[QUERY] Use the latest platform API version"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productChildItemList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve products child items via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"product_id=:[QUERY] Filter by parent product id"
"product_ids=:[QUERY] Filter by parent product ids"
"sku=:[QUERY] Filter by products variant&#39;s sku"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
"currency_id=:[QUERY] Currency Id"
"avail_sale=true:[QUERY] Specifies the set of available/not available products for sale"
          "avail_sale=false:[QUERY] Specifies the set of available/not available products for sale"
"find_value=:[QUERY] Entity search that is specified by some value"
"find_where=:[QUERY] Child products search that is specified by field"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
"return_global=true:[QUERY] Determines the type of products to be returned. If set to &#39;true&#39;, only global products will be returned; if set to &#39;false&#39;, only local products will be returned."
          "return_global=false:[QUERY] Determines the type of products to be returned. If set to &#39;true&#39;, only global products will be returned; if set to &#39;false&#39;, only local products will be returned."
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
"report_request_id=:[QUERY] Report request id"
"disable_report_cache=true:[QUERY] Disable report cache for current request"
          "disable_report_cache=false:[QUERY] Disable report cache for current request"
"use_latest_api_version=true:[QUERY] Use the latest platform API version"
          "use_latest_api_version=false:[QUERY] Use the latest platform API version"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productCount)
        local -a _op_arguments
        _op_arguments=(
                    "sku=:[QUERY] Filter by product&#39;s sku"
"product_ids=:[QUERY] Counts products specified by product ids"
"since_id=:[QUERY] Retrieve entities starting from the specified id."
"categories_ids=:[QUERY] Defines product add that is specified by comma-separated categories id"
"category_id=:[QUERY] Counts products specified by category id"
"store_id=:[QUERY] Counts products specified by store id"
"lang_id=:[QUERY] Counts products specified by language id"
"avail_view=true:[QUERY] Specifies the set of visible/invisible products"
          "avail_view=false:[QUERY] Specifies the set of visible/invisible products"
"avail_sale=true:[QUERY] Specifies the set of available/not available products for sale"
          "avail_sale=false:[QUERY] Specifies the set of available/not available products for sale"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
"brand_name=:[QUERY] Retrieves brands specified by brand name"
"manufacturer_id=:[QUERY] Defines product&#39;s manufacturer by manufacturer_id"
"product_attributes=:[QUERY] Defines product attributes"
"status=:[QUERY] Defines product&#39;s status"
"type=:[QUERY] Defines products&#39;s type"
"visible=:[QUERY] Filter items by visibility status"
"find_value=:[QUERY] Entity search that is specified by some value"
"find_where=:[QUERY] Counts products that are searched specified by field"
"report_request_id=:[QUERY] Report request id"
"return_global=true:[QUERY] Determines the type of products to be returned. If set to &#39;true&#39;, only global products will be returned; if set to &#39;false&#39;, only local products will be returned."
          "return_global=false:[QUERY] Determines the type of products to be returned. If set to &#39;true&#39;, only global products will be returned; if set to &#39;false&#39;, only local products will be returned."
"disable_report_cache=true:[QUERY] Disable report cache for current request"
          "disable_report_cache=false:[QUERY] Disable report cache for current request"
"use_latest_api_version=true:[QUERY] Use the latest platform API version"
          "use_latest_api_version=false:[QUERY] Use the latest platform API version"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productCurrencyAdd)
        local -a _op_arguments
        _op_arguments=(
                    "iso3=:[QUERY] Specifies standardized currency code"
"rate=:[QUERY] Defines the numerical identifier against to the major currency"
"name=:[QUERY] Defines currency&#39;s name"
"avail=true:[QUERY] Specifies whether the currency is available"
          "avail=false:[QUERY] Specifies whether the currency is available"
"symbol_left=:[QUERY] Defines the symbol that is located before the currency"
"symbol_right=:[QUERY] Defines the symbol that is located after the currency"
"default=true:[QUERY] Specifies currency&#39;s default meaning"
          "default=false:[QUERY] Specifies currency&#39;s default meaning"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productCurrencyList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"default=true:[QUERY] Specifies the set of default/not default currencies"
          "default=false:[QUERY] Specifies the set of default/not default currencies"
"avail=true:[QUERY] Specifies the set of available/not available currencies"
          "avail=false:[QUERY] Specifies the set of available/not available currencies"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productDelete)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Product id that will be removed"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productDeleteBatch)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productFind)
        local -a _op_arguments
        _op_arguments=(
                    "find_value=:[QUERY] Entity search that is specified by some value"
"find_where=:[QUERY] Entity search that is specified by the comma-separated unique fields"
"find_params=:[QUERY] Entity search that is specified by comma-separated parameters"
"find_what=:[QUERY] Parameter&#39;s value specifies the entity that has to be found"
"lang_id=:[QUERY] Search products specified by language id"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productImageAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productImageDelete)
        local -a _op_arguments
        _op_arguments=(
                    "product_id=:[QUERY] Defines product id where the image should be deleted"
"id=:[QUERY] Entity id"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productImageUpdate)
        local -a _op_arguments
        _op_arguments=(
                    "product_id=:[QUERY] Defines product id where the image should be updated"
"id=:[QUERY] Defines image update specified by image id"
"variant_ids=:[QUERY] Defines product&#39;s variants ids"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
"image_name=:[QUERY] Defines image&#39;s name"
"type=:[QUERY] Defines image&#39;s types that are specified by comma-separated list"
"label=:[QUERY] Defines alternative text that has to be attached to the picture"
"position=:[QUERY] Defines image’s position in the list"
"hidden=true:[QUERY] Define is hide image"
          "hidden=false:[QUERY] Define is hide image"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productInfo)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Retrieves product&#39;s info specified by product id"
"store_id=:[QUERY] Retrieves product info specified by store id"
"lang_id=:[QUERY] Retrieves product info specified by language id"
"currency_id=:[QUERY] Currency Id"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
"report_request_id=:[QUERY] Report request id"
"disable_report_cache=true:[QUERY] Disable report cache for current request"
          "disable_report_cache=false:[QUERY] Disable report cache for current request"
"use_latest_api_version=true:[QUERY] Use the latest platform API version"
          "use_latest_api_version=false:[QUERY] Use the latest platform API version"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve products via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"product_ids=:[QUERY] Retrieves products specified by product ids"
"since_id=:[QUERY] Retrieve entities starting from the specified id."
"categories_ids=:[QUERY] Retrieves products specified by categories ids"
"category_id=:[QUERY] Retrieves products specified by category id"
"store_id=:[QUERY] Retrieves products specified by store id"
"lang_id=:[QUERY] Retrieves products specified by language id"
"currency_id=:[QUERY] Currency Id"
"avail_view=true:[QUERY] Specifies the set of visible/invisible products"
          "avail_view=false:[QUERY] Specifies the set of visible/invisible products"
"avail_sale=true:[QUERY] Specifies the set of available/not available products for sale"
          "avail_sale=false:[QUERY] Specifies the set of available/not available products for sale"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
"sku=:[QUERY] Filter by product&#39;s sku"
"brand_name=:[QUERY] Retrieves brands specified by brand name"
"product_attributes=:[QUERY] Defines product attributes"
"manufacturer_id=:[QUERY] Defines product&#39;s manufacturer by manufacturer_id"
"status=:[QUERY] Defines product&#39;s status"
"type=:[QUERY] Defines products&#39;s type"
"visible=:[QUERY] Filter items by visibility status"
"find_value=:[QUERY] Entity search that is specified by some value"
"find_where=:[QUERY] Product search that is specified by field"
"return_global=true:[QUERY] Determines the type of products to be returned. If set to &#39;true&#39;, only global products will be returned; if set to &#39;false&#39;, only local products will be returned."
          "return_global=false:[QUERY] Determines the type of products to be returned. If set to &#39;true&#39;, only global products will be returned; if set to &#39;false&#39;, only local products will be returned."
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
"sort_by=:[QUERY] Set field to sort by"
"sort_direction=:[QUERY] Set sorting direction"
"report_request_id=:[QUERY] Report request id"
"disable_cache=true:[QUERY] Disable cache for current request"
          "disable_cache=false:[QUERY] Disable cache for current request"
"disable_report_cache=true:[QUERY] Disable report cache for current request"
          "disable_report_cache=false:[QUERY] Disable report cache for current request"
"use_latest_api_version=true:[QUERY] Use the latest platform API version"
          "use_latest_api_version=false:[QUERY] Use the latest platform API version"
"product_type=:[QUERY] A categorization for the product"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productManufacturerAdd)
        local -a _op_arguments
        _op_arguments=(
                    "product_id=:[QUERY] Defines products specified by product id"
"manufacturer=:[QUERY] Defines product’s manufacturer&#39;s name"
"store_id=:[QUERY] Store Id"
"meta_title=:[QUERY] Defines unique meta title for each entity"
"meta_keywords=:[QUERY] Defines unique meta keywords for each entity"
"meta_description=:[QUERY] Defines unique meta description of a entity"
"search_keywords=:[QUERY] Defines unique search keywords"
"image_url=:[QUERY] Image Url"
"seo_url=:[QUERY] Defines unique URL for SEO"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productOptionAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productOptionAssign)
        local -a _op_arguments
        _op_arguments=(
                    "product_id=:[QUERY] Defines product id where the option should be assigned"
"option_id=:[QUERY] Defines option id which has to be assigned"
"required=true:[QUERY] Defines if the option is required"
          "required=false:[QUERY] Defines if the option is required"
"sort_order=:[QUERY] Sort number in the list"
"option_values=:[QUERY] Defines option values that has to be assigned"
"clear_cache=true:[QUERY] Is cache clear required"
          "clear_cache=false:[QUERY] Is cache clear required"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productOptionDelete)
        local -a _op_arguments
        _op_arguments=(
                    "option_id=:[QUERY] Defines option id that should be deleted"
"product_id=:[QUERY] Defines product id where the option should be deleted"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productOptionList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"product_id=:[QUERY] Retrieves products&#39; options specified by product id"
"lang_id=:[QUERY] Language id"
"store_id=:[QUERY] Store Id"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productOptionValueAdd)
        local -a _op_arguments
        _op_arguments=(
                    "product_id=:[QUERY] Defines product id where the option value should be added"
"option_id=:[QUERY] Defines option id where the value has to be added"
"option_value=:[QUERY] Defines option value that has to be added"
"sort_order=:[QUERY] Sort number in the list"
"display_value=:[QUERY] Defines the value that will be displayed for the option value"
"is_default=true:[QUERY] Defines as a default"
          "is_default=false:[QUERY] Defines as a default"
"clear_cache=true:[QUERY] Is cache clear required"
          "clear_cache=false:[QUERY] Is cache clear required"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productOptionValueAssign)
        local -a _op_arguments
        _op_arguments=(
                    "product_option_id=:[QUERY] Defines product&#39;s option id where the value has to be assigned"
"option_value_id=:[QUERY] Defines value id that has to be assigned"
"clear_cache=true:[QUERY] Is cache clear required"
          "clear_cache=false:[QUERY] Is cache clear required"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productOptionValueDelete)
        local -a _op_arguments
        _op_arguments=(
                    "option_id=:[QUERY] Defines option id where the value should be deleted"
"option_value_id=:[QUERY] Defines option value id that should be deleted"
"product_id=:[QUERY] Defines product id where the option value should be deleted"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productOptionValueUpdate)
        local -a _op_arguments
        _op_arguments=(
                    "product_id=:[QUERY] Defines product id where the option value should be updated"
"option_id=:[QUERY] Defines option id where the value has to be updated"
"option_value_id=:[QUERY] Defines value id that has to be assigned"
"option_value=:[QUERY] Defines option value that has to be added"
"price=:[QUERY] Defines new product option price"
"quantity=:[QUERY] Defines new products&#39; options quantity"
"display_value=:[QUERY] Defines the value that will be displayed for the option value"
"clear_cache=true:[QUERY] Is cache clear required"
          "clear_cache=false:[QUERY] Is cache clear required"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productPriceAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productPriceDelete)
        local -a _op_arguments
        _op_arguments=(
                    "product_id=:[QUERY] Defines the product where the price has to be deleted"
"group_prices=:[QUERY] Defines product&#39;s group prices"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productPriceUpdate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productReviewList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"product_id=:[QUERY] Product id"
"ids=:[QUERY] Retrieves reviews specified by ids"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
"status=:[QUERY] Defines status"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"customer_id=:[QUERY] Retrieves orders specified by customer id"
"sort_by=:[QUERY] Set field to sort by"
"sort_direction=:[QUERY] Set sorting direction"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productStoreAssign)
        local -a _op_arguments
        _op_arguments=(
                    "product_id=:[QUERY] Defines id of the product which should be assigned to a store"
"store_id=:[QUERY] Defines id of the store product should be assigned to"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productTaxAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productUpdate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productUpdateBatch)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productVariantAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productVariantAddBatch)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productVariantDelete)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Defines variant removal, specified by variant id"
"product_id=:[QUERY] Defines product&#39;s id where the variant has to be deleted"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productVariantDeleteBatch)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productVariantImageAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productVariantImageDelete)
        local -a _op_arguments
        _op_arguments=(
                    "product_id=:[QUERY] Defines product id where the variant image should be deleted"
"product_variant_id=:[QUERY] Defines product&#39;s variants specified by variant id"
"id=:[QUERY] Entity id"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productVariantPriceAdd)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productVariantPriceDelete)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Defines the variant where the price has to be deleted"
"product_id=:[QUERY] Product id"
"group_prices=:[QUERY] Defines variants&#39;s group prices"
"store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productVariantPriceUpdate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productVariantUpdate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      productVariantUpdateBatch)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      returnActionList)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      returnCount)
        local -a _op_arguments
        _op_arguments=(
                    "order_ids=:[QUERY] Counts return requests specified by order ids"
"customer_id=:[QUERY] Counts return requests quantity specified by customer id"
"store_id=:[QUERY] Store Id"
"status=:[QUERY] Defines status"
"return_type=:[QUERY] Retrieves returns specified by return type"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
"report_request_id=:[QUERY] Report request id"
"disable_report_cache=true:[QUERY] Disable report cache for current request"
          "disable_report_cache=false:[QUERY] Disable report cache for current request"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      returnInfo)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Entity id"
"order_id=:[QUERY] Defines the order id"
"store_id=:[QUERY] Store Id"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      returnList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"order_id=:[QUERY] Defines the order id"
"order_ids=:[QUERY] Retrieves return requests specified by order ids"
"customer_id=:[QUERY] Retrieves return requests specified by customer id"
"store_id=:[QUERY] Store Id"
"status=:[QUERY] Defines status"
"return_type=:[QUERY] Retrieves returns specified by return type"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
"report_request_id=:[QUERY] Report request id"
"disable_report_cache=true:[QUERY] Disable report cache for current request"
          "disable_report_cache=false:[QUERY] Disable report cache for current request"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      returnReasonList)
        local -a _op_arguments
        _op_arguments=(
                    "store_id=:[QUERY] Store Id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      returnStatusList)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      subscriberList)
        local -a _op_arguments
        _op_arguments=(
                    "ids=:[QUERY] Retrieves subscribers specified by ids"
"start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"subscribed=true:[QUERY] Filter by subscription status"
          "subscribed=false:[QUERY] Filter by subscription status"
"store_id=:[QUERY] Store Id"
"email=:[QUERY] Filter subscribers by email"
"created_from=:[QUERY] Retrieve entities from their creation date"
"created_to=:[QUERY] Retrieve entities to their creation date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      taxClassInfo)
        local -a _op_arguments
        _op_arguments=(
                    "tax_class_id=:[QUERY] Retrieves taxes specified by class id"
"store_id=:[QUERY] Store Id"
"lang_id=:[QUERY] Language id"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"exclude=:[QUERY] Set this parameter in order to choose which entity fields you want to ignore. Works only if parameter &#39;params&#39; equal force_all"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      taxClassList)
        local -a _op_arguments
        _op_arguments=(
                    "count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"page_cursor=:[QUERY] Used to retrieve entities via cursor-based pagination (it can&#39;t be used with any other filtering parameter)"
"store_id=:[QUERY] Store Id"
"find_value=:[QUERY] Entity search that is specified by some value"
"find_where=:[QUERY] Tax class search that is specified by field"
"created_to=:[QUERY] Retrieve entities to their creation date"
"created_from=:[QUERY] Retrieve entities from their creation date"
"modified_to=:[QUERY] Retrieve entities to their modification date"
"modified_from=:[QUERY] Retrieve entities from their modification date"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      webhookCount)
        local -a _op_arguments
        _op_arguments=(
                    "entity=:[QUERY] The entity you want to filter webhooks by (e.g. order or product)"
"action=:[QUERY] The action you want to filter webhooks by (e.g. order or product)"
"active=true:[QUERY] The webhook status you want to filter webhooks by"
          "active=false:[QUERY] The webhook status you want to filter webhooks by"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      webhookCreate)
        local -a _op_arguments
        _op_arguments=(
                    "entity=:[QUERY] Specify the entity that you want to enable webhooks for (e.g product, order, customer, category)"
"action=:[QUERY] Specify what action (event) will trigger the webhook (e.g add, delete, or update)"
"callback=:[QUERY] Callback url that returns shipping rates. It should be able to accept POST requests with json data."
"label=:[QUERY] The name you give to the webhook"
"fields=:[QUERY] Fields the webhook should send"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"active=true:[QUERY] Webhook status"
          "active=false:[QUERY] Webhook status"
"lang_id=:[QUERY] Language id"
"store_id=:[QUERY] Defines store id where the webhook should be assigned"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      webhookDelete)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Webhook id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      webhookEvents)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      webhookList)
        local -a _op_arguments
        _op_arguments=(
                    "start=:[QUERY] This parameter sets the number from which you want to get entities"
"count=:[QUERY] This parameter sets the entity amount that has to be retrieved. Max allowed count&#x3D;250"
"entity=:[QUERY] The entity you want to filter webhooks by (e.g. order or product)"
"action=:[QUERY] The action you want to filter webhooks by (e.g. add, update, or delete)"
"active=true:[QUERY] The webhook status you want to filter webhooks by"
          "active=false:[QUERY] The webhook status you want to filter webhooks by"
"ids=:[QUERY] List of сomma-separated webhook ids"
"params=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      webhookUpdate)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] Webhook id"
"callback=:[QUERY] Callback url that returns shipping rates. It should be able to accept POST requests with json data."
"label=:[QUERY] The name you give to the webhook"
"fields=:[QUERY] Fields the webhook should send"
"response_fields=:[QUERY] Set this parameter in order to choose which entity fields you want to retrieve"
"active=true:[QUERY] Webhook status"
          "active=false:[QUERY] Webhook status"
"lang_id=:[QUERY] Language id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
    esac
    ;;

esac

return ret
