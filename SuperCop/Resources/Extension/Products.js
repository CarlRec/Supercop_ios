


<div id="product-zoom-wrapper" style="display:none;">
<div id="zoom-close">×</div>
<div id="product-zoom-scroller">

</div>
</div>

<div id="container">
<header><div id="cart-link"><a href="#cart" id="goto-cart-link">1 item in cart</a><a href="#checkout" id="checkout-now"><span>checkout</span></a></div>
<h1><a href="#categories" id="categories-link"><img src="/images/mobile/title-logo-2.gif" width="75" height="23"></a></h1>

<div id="main" role="main" style="opacity: 1;"><div>
<div id="product" data-product-id="168683">
<h2 id="name">2-Tone Fleece Pullover</h2>
<p id="style-name">Black</p>
<div id="style-image"><div id="style-image-container" class="swipe" style="opacity: 1; visibility: visible;"><div class="swipe-wrap" style="width: 840px;"><div class="swiper-image-container" data-index="0" style="width: 280px; left: 0px; transition: 1ms; -webkit-transition: 1ms; -webkit-transform: translate(-280px, 0px) translateZ(0px); visibility: visible;"><img width="250" height="250" src="//d17ol771963kd3.cloudfront.net/93421/sm/kKotFiYR8RA.jpg" style="visibility: visible;"></div><div class="swiper-image-container" data-index="1" style="width: 280px; left: -280px; transition: 1ms; -webkit-transition: 1ms; -webkit-transform: translate(0px, 0px) translateZ(0px); visibility: visible;"><img width="250" height="250" src="//d17ol771963kd3.cloudfront.net/93419/sm/ukKzOWmo7uw.jpg" style="visibility: visible;"></div><div class="swiper-image-container" data-index="2" style="width: 280px; left: -560px; transition: 0ms; -webkit-transition: 0ms; -webkit-transform: translate(280px, 0px) translateZ(0px); visibility: visible;"><img width="250" height="250" src="//d17ol771963kd3.cloudfront.net/93420/sm/JpQ6x0goUgk.jpg" style="visibility: visible;"></div></div></div><div class="clearfix"></div></div>
</div>
<div id="product-widgets" class="clearfix  "><div id="widgets-container">

<span class="price">


$128


</span>

<p id="in-cart" style="display: none;">in cart</p>


<select id="size-options" name="size-options" class="select-widget">






<option value="23129">Medium</option>




<option value="23130">Large</option>




<option value="23131">XLarge</option>


</select>


<span id="cart-update"><span class="cart-button" onClick="alert('clicked')">add to cart</span></span>
</div></div>
<div class="clearfix"></div>
<div id="product-details">
<div id="styles">
<ul id="style-selector" style="width: 118px;"><li id="style-9917">
<div class="style-images">
<img class="style-thumb" src="//d17ol771963kd3.cloudfront.net/93421/ca/kKotFiYR8RA.jpg" width="30" height="30">

</div>

</li><li id="style-9918">
<div class="style-images">
<img class="style-thumb selected" src="//d17ol771963kd3.cloudfront.net/93419/ca/ukKzOWmo7uw.jpg" width="30" height="30">

</div>

</li><li id="style-9919">
<div class="style-images">
<img class="style-thumb" src="//d17ol771963kd3.cloudfront.net/93420/ca/JpQ6x0goUgk.jpg" width="30" height="30">

</div>

</li></ul>
<div class="clearfix"></div>
</div>
<p id="description">
Polar fleece with half zip construction. Logo zipper tape at neck and drawcord adjuster at waist.
</p>
</div>
<div id="product-nav">
<p id="next-container">
<a href="#products/168689" id="next">next <span></span>&nbsp;&gt;</a>
</p>
<a href="#" id="keep-shopping">keep shopping</a>
</div>

</div></div>



<div class="push"></div>
</header></div> <!--! end of #container -->
<footer style="opacity: 1; position: relative; bottom: auto; left: auto; right: auto;">

<ul>
<li><span id="lookbook-footer-link"><em>fall/winter 2014 lookbook</em></span></li>

<li><span class="pad" id="sizing">sizing</span></li>
<li><span class="pad" id="terms">terms</span></li>
<li><span class="pad" id="faq">f.a.q</span></li>

</ul>
<p style="margin-top: 15px;margin-bottom: 15px;">
</p>

<p style="padding-bottom:20px;">
<span>
<a href="http://www.supremenewyork.com/index" id="full-site-link">full site</a>
</span>
</p>


</footer>



<script type="text/template" id="lookbookViewTemplate">
<div id="lookbook">
<div id="lookbook-items" class="swipe">
<div class="swipe-wrap"></div>
</div>
<div class="text-container">
<p class="text">
<span id="lookbook-pos"></span>
<strong id="lookbook-title"></strong>
<span id="lookbook-item-caption"></span>
</p>
</div>
</div>
</script>


<script type="text/template" id="lookbookItemViewTemplate">
<div class="lookbook-item">

<p class="lookbook-photo"><img src="{{ medium }}"/></p>
</div>
</script>


<script type="text/template" id="staticViewTemplate">
<div id="static-view">
<p class="close"><span>close</span></p>
<div id="static-content">
</div>
<p class="close"><span>close</span></p>
</div>
</script>

<script type="text/template" id="styleSelectorOptionTemplate">
<div class="style-images">
<img class="style-thumb" src="{{ swatch_url }}" width="30" height="30" />
{[ if(additional_images.length > 0) { ]}
{[ _.each(additional_images, function(i, idx){ ]}
          <img class="alternate" altidx="{{idx+1}}" class="style-thumb" src="{{ i.swatch_url }}" width="30" height="30" />
          {[ }); ]}
          {[ } ]}
          </div>
          
          </script>
          
          
          <script type="text/template" id="styleSelectorTemplate">
          <ul id="style-selector"></ul>
          <div class="clearfix"></div>
          </script>
          
          <script type="text/template" id="productWidgetsTemplate">
          
          <span class="price">
          {[ if(this.model.isOnSale()){ ]}
          <span class="sale">
          {[ } ]}
          
          {{ formatCurrency(this.model.actualPrice()) }}
          
          {[ if(this.model.isOnSale()){ ]}
          </span>
          
          {[ } ]}
          </span>
          
          <p id="in-cart">in cart</p>
          
          
          <select id="size-options" name="size-options" class="select-widget">
          {[ _.each(this.model.get('selectedStyle').get('sizes').models, function(size){ ]}
                    
                    {[ if(size.get('stock_level') > 0 || (sizeForStyleInCart && sizeForStyleInCart.get('id') == size.get('id'))){ ]}
                    <option value="{{ size.get('id') }}"
                    {[ if(sizeForStyleInCart && sizeForStyleInCart.get('id') == size.get('id')){ ]}
                    selected="selected"
                    {[ } ]}
                    {[ if(sizeForStyleInCart && sizeForStyleInCart.get('id') == size.get('id') && size.get('stock_level') == 0){ ]}
                    disabled="disabled"
                    {[ } ]}
                    
                    >{{ size.get('name') }}</option>
                    {[ } ]}
                    {[ }); ]}
                    </select>
                    
                    
                    <span id="cart-update">add to cart</span>
                    </script>
                    
                    
                    <script type="text/template" id="lookbookViewTemplate">
                    <div id="lookbook">
                    <div id="lookbook-items" class="swipe">
                    <div class="swipe-wrap"></div>
                    </div>
                    <div class="text-container">
                    <p class="text">
                    <span id="lookbook-pos"></span>
                    <strong id="lookbook-title"></strong>
                    <span id="lookbook-item-caption"></span>
                    </p>
                    </div>
                    </div>
                    </script>
                    
                    
                    <script type="text/template" id="lookbookItemViewTemplate">
                    <div class="lookbook-item">
                    <p class="lookbook-photo"><img src="{{ medium }}"/></p>
                    </div>
                    </script>
                    
                    
                    <script type="text/template" id="productDetailTemplate">
                    <div id="product" data-product-id="{{id}}">
                    <h2 id="name">{{ name }}</h2>
                    <p id="style-name">{{ selectedStyle.get('name') }}</p>
                    <div id="style-image"></div>
                    </div>
                    <div id="product-widgets" class="clearfix  "></div>
                    <div class="clearfix"></div>
                    <div id="product-details">
                    <div id="styles">
                    <ul id="style-selector"></ul>
                    </div>
                    <p id="description">
                    {{ description }}
                    </p>
                    </div>
                    <div id="product-nav">
                    <p id="next-container">
                    <a href="#" id="next">next <span></span>&nbsp;&gt;</a>
                    </p>
                    <a href="#" id="keep-shopping">keep shopping</a>
                    </div>
                    
                    </script>
                    
                    
                    <script type="text/template" id="cartViewTemplate">
                    <h3 style="font-weight:normal;font-size:12px;"> {{sizes.length}}
                    {[ if(sizes.length == 1){ ]}
                    item
                    
                    {[ } else { ]}
                    items
                    {[ } ]}
                    in your cart
                    </h3>
                    <div id="cart-view">
                    <div id="cart-contents">
                    <table id="cart-items">
                    <tbody>
                    
                    </tbody>
                    </table>
                    
                    <p id="cart-total">subtotal:
                    <span class="cart-subtotal"></span>
                    </p>
                    </div>
                    
                    
                    
                    <div id="cart-buttons">
                    <p>
                    <a href="#categories" class="intlink">keep shopping</a>
                    <a href="#checkout" class="checkout">checkout now</a>
                    </p>
                    <div class="clearfix"></div>
                    </div>
                    
                    
                    </div>
                    </script>
                    
                    <script type="text/template" id="cartItemViewTemplate">
                    <td class="cart-image">
                    <img src="{{ style.get('swatch_url') }}" width="40" height="40" />
                    </td>
                    <td class="desc {[ if(out_of_stock){ ]} out-of-stock {[ } ]}">
                    <strong>{{ style.get('product').get('name') }}</strong>
                    <br />
                    {[ if(isNamePrintable(style.get('name'))){ ]}
                    Style: {{ style.get('name') }}
                    <br />
                    {[ } ]}
                    {[ if(isNamePrintable(name)){ ]}
                    Size: {{ name }}
                    {[ } ]}
                    </td>
                    <td class="delete"><span class="cart-button delete">&times;</span></td>
                    <td class="price">
                    {[ if(style.get('product').isOnSale()){ ]}
                    <span class="sale">
                    {[ } ]}
                    {{ formatCurrency(style.get('product').actualPrice()) }}
                    {[ if(style.get('product').isOnSale()){ ]}
                    </span>
                    {[ } ]}
                    </td>
                    </script>
                    
                    <script type="text/template" id="confirmationItemViewTemplate">
                    <td class="cart-image">
                    <img src="{{ image }}" width="40" height="40" />
                    </td>
                    <td class="desc">
                    <strong>{{ product_name }}</strong>
                    <br />
                    {[ if(isNamePrintable(style_name)){ ]}
                    Style: {{ style_name }}
                    <br />
                    {[ } ]}
                    {[ if(isNamePrintable(size_name)){ ]}
                    Size: {{ size_name }}
                    {[ } ]}
                    </td>
                    <td class="delete"><span class="cart-button delete">&times;</span></td>
                    <td class="price">{{ formatCurrency(price) }}</td>
                    </script>
                    
                    
                    
                    <script type="text/template" id="orderConfirmationTemplate">
                    <div id="checkout-form">
                    <div class="shadow-container">
                    <h2 style="margin-bottom:1em;">confirmation</h2>
                    <div id="checkout-confirmation">
                    <p>Thank you <strong id="name">{{ billing_name }}</strong><br />Order:<strong id="order-id">#{{id}}</strong></p>
                    
                    
                    <p style="padding-top:1em;">
                    Your order has been successfully processed on <span id="ny-time">{{ created_at }}</span> and will be shipped
                    within 3-5 days from New York via <span id="shipping-type">{{ service }}</span>. You will receive a shipping confirmation with the tracking number
                    once the order has been processed. A receipt has been emailed to you.
                    </p>
                    
                    
                    <form id="order_mailinglist_form">
                    <input id="join_mailinglist" name="join_mailinglist" type="checkbox" value="0">
                    <label for="join_mailinglist">Notify me when the shop is updated.</label>
                    <input type="hidden" name="join_mailinglist_email" id="join_mailinglist_email" value="{{ email }}" />
                    <input type="hidden" name="join_mailinglist_name" id="join_mailinglist_name" value="{{ billing_name }}" />
                    </form>
                    
                    
                    
                    
                    
                    
                    <table id="cart-items">
                    <tbody>
                    
                    </tbody>
                    </table>
                    
                    
                    <div id="totals">
                    <p>
					<label class="total">subtotal</label>
					<span id="subtotal" class="field">{{ formatCurrency(item_total)}}</span>
                    </p>
                    
                    <p>
					<label class="total">ship &amp; handle</label>
					<span id="shipping" class="field">{{ formatCurrency(shipping_total)}}</span>
                    </p>
					<p id="intl-shipping-info">
                    UPS standard service includes customs and duties
					</p>
					
					{[ if(tax_total > 0 ){ ]}
					<p id="sales-tax-container">
                    <label class="total">sales tax</label>
                    <span id="sales-tax-total" class="field">{{ formatCurrency(tax_total)}}</span>
					</p>
					{[ } ]}
                    <p>
					<strong>
                    <label class="total">order total</label>
                    <span id="total" class="field">{{ formatCurrency(total)}}</span>
					</strong>
                    </p>
                    {[ if(store_credit > 0){ ]}
                    <p>
					<strong>
                    <label class="total">store credit</label>
                    <span id="store_credit_used" class="field">{{ formatCurrency(store_credit)}}</span>
					</strong>
                    </p>
                    {[ } ]}
                    
                    
                    </div>
                    <div class="clearfix"></div>
                    
                    
                    
                    </div>
                    </div>
                    </script>
                    
                    <script type="text/template" id="checkoutViewTemplate">
                    
                    <form id="mobile_checkout_form" action="https://www.supremenewyork.com/checkout.json" method="post">
                    
                    <input type="hidden" name="store_credit_id" id="store_credit_id" value="" />
                    <input type="hidden" name="from_mobile" value="1" />
                    <input type="hidden" name="cookie-sub" id="cookie-sub" />
                    <div id="checkout-form">
                    <div class="checkout-section-container">
                    <h2>billing/shipping information</h2>
                    <p class="notice" id="must-be-your-shipping-address" style="margin: 7px 0 7px 0;">must be your credit card address</p>
                    
                    <div id="checkout-loading">processing...</div>
                    <div id="checkout-errors" class="errors-block"></div>
                    <input type="submit" id="hidden_cursor_capture" style="position:absolute;left:-1000px;"/>
                    <input type="hidden" value="1" name="same_as_billing_address" />
                    
                    
                    <table id="billing-info">
                    <tbody>
                    <tr>
					<td><label for="order_billing_name">name</label></td>
					<td class="field"><input id="order_billing_name" name="order[billing_name]" size="30" type="text"></td>
                    </tr>
                    <tr>
                    <td><label for="order_email">email  </label></td>
                    <td colspan="2" class="field"><input id="order_email" name="order[email]" size="30" type="email"></td>
                    </tr>
                    <tr>
                    <td><label for="order_tel">tel </label></td>
                    <td colspan="2" class="field"><input id="order_tel" name="order[tel]" size="30" type="tel"></td>
                    </tr>
                    
                    <tr>
					<td><label for="order_billing_address">address</label></td>
					<td class="field"><input id="order_billing_address" name="order[billing_address]" size="30" type="text"></td>
                    </tr>
                    <tr class="no-bg"> <!-- blank label for english, hence no bg. -->
					<td><label for="order_billing_address_2" style="background-image:none;background-color:transparent;">&nbsp;</label></td>
					<td class="field"><input id="order_billing_address_2" name="order[billing_address_2]" size="30" type="text"></td>
                    </tr>
                    
                    <tr>
                    <td><label for="order_billing_zip" id="zip_label">zip</label></td>
                    <td colspan="2" class="field"><input id="order_billing_zip" name="order[billing_zip]" size="30" type="text"></td>
                    </tr>
                    
                    <tr>
					<td><label for="order_billing_city">city</label></td>
					<td class="field"><input id="order_billing_city" name="order[billing_city]" size="30" type="text"></td>
                    </tr>
                    
                    <tr>
					<td><label for="order_billing_state" id="state_label">state</label></td>
					<td class="field"><select id="order_billing_state" name="order[billing_state]"></select></td>
                    </tr>
                    
                    
                    
                    
                    <tr>
    				<td><label for="order_billing_country">country</label></td>
    				<td class="field"><select id="order_billing_country" name="order[billing_country]">
                    <option value="USA" selected="selected">USA</option>
                    <option value="CANADA">CANADA</option>
    				</select></td>
                    </tr>
                    
                    
                    
                    </tbody>
                    </table>
                    
                    
                    
                    <p class="checkbox-container clearfix" id="checkbox_container">
					<label>
                    <input id="remember_address" name="store_address" type="checkbox" value="1">
		 			</label>
                    
					<span class="blurb"><label id="remember_address_label" for="remember_address">remember this address?</label></span>
                    
                    </p>
                    
                    
                    <h2 id="credit-card-information-header">credit card information</h2>
                    <div id="credit-card-checkout-errors" class="errors-block"></div>
                    <div id="credit-card">
                    
                    <table>
                    <tbody>
                    
                    <tr>
                    <td><label for="credit_card_type">type</label></td>
                    <td style="width: 100%;padding-right:10px;">
                    <select id="credit_card_type" name="credit_card[type]">
                    
                    <option value="visa">Visa</option>
                    
                    <option value="american_express">American Express</option>
                    
                    <option value="master">Mastercard</option>
                    [[&quot;Visa&quot;, &quot;visa&quot;], [&quot;American Express&quot;, &quot;american_express&quot;], [&quot;Mastercard&quot;, &quot;master&quot;]]			</select>
                    <p id="paypal_info" style="display:none">you will be redirected to paypal</p>
                    </td>
                    </tr>
                    
                    
                    <tr id="credit_card_number_row">
                    <td><label for="credit_card_number">number</label></td>
                    <td style="width: 100%;padding-right: 20px;"><input id="credit_card_number" name="credit_card[number]" size="30" value="" type="tel"></td>
                    </tr>
                    
                    <tr id="exp_date_row">
                    <td><label>exp. date</label></td>
                    <td>
                    
                    <select id="credit_card_month" name="credit_card[month]">
                    <option value="01">01</option>
                    <option value="02">02</option>
                    <option value="03">03</option>
                    <option value="04">04</option>
                    <option value="05">05</option>
                    <option value="06">06</option>
                    <option value="07">07</option>
                    <option value="08">08</option>
                    <option value="09">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    </select>
                    <select id="credit_card_year" name="credit_card[year]">
                    <option value="2012">2012</option>
                    <option value="2013">2013</option>
                    <option value="2014">2014</option>
                    <option value="2015">2015</option>
                    <option value="2016">2016</option>
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                    <option value="2019">2019</option>
                    <option value="2020">2020</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    </select>
                    
                    
                    </td>
                    </tr>
                    
                    <tr id="cvv_row">
                    <td id="cvv">
                    <label for="credit_card_verification_value">CVV</label>
                    </td>
                    <td>
                    <input id="credit_card_verification_value" maxlength="4" name="credit_card[verification_value]" size="4" type="tel" value="">
                    <img src="/images/mobile/visa_cvv.gif" id="cvv-image" width="39" height="24" />
                    
                    </td>
                    </tr>
                    </tbody>
                    </table>
                    
                    
                    <div id="totals">
                    <p>
					<label class="total">subtotal</label>
					<span id="subtotal" class="field"></span>
                    </p>
                    <p>
					<label class="total">ship &amp; handle</label>
					<span id="shipping" class="field"></span>
					<span id="shipping_eu" class="field euro"></span>
                    </p>
                    
					<p id="intl-shipping-info">
                    UPS standard service includes customs and duties
					</p>
                    
                    
                    <p id="sales-tax-container" style="display:none;">
					<label class="total">sales tax</label>
					<span id="sales-tax-total" class="field"></span>
					<span id="sales-tax-total_eu" class="field euro"></span>
                    </p>
                    
                    <p id="vat-discount-container" style="display:none;">
					<label class="total">VAT discount</label>
					<span id="vat-discount-total" class="field"></span>
					<span id="vat-discount-total_eu" class="field euro"></span>
                    </p>
                    
                    
                    <p>
					<strong>
                    <label style="margin-bottom:10px;" class="total">order total</label>
                    <span id="total" class="field"></span>
                    <span id="total_eu" class="field euro total"></span>
					</strong>
                    </p>
                    
                    
                    
                    
                    
                    <p class="checkbox-container clearfix" style="margin-top:7px;border-top: 1px dotted #999;">
					<label><input name="order[terms]" type="hidden" value="0"><input id="order_terms" name="order[terms]" type="checkbox" value="1"> </label>
					<span class="blurb"><label id="order-terms-label" for="order_terms">
                    I have read and agree to the <a href="#terms">terms & conditions</a>, and accept the return policy
					</label></span>
                    </p>
                    
                    
                    </div>
                    
                    </div>
                    
                    
                    <p id="checkout-buttons" class="clearfix">
                    <a href="#" id="cancel_checkout">cancel</a>
                    <input type="submit" id="submit_button" value="process payment" />
                    </p>
                    </div>
                    </div>
                    
                    
                    </form>
                    </script>
                    
                    <script type="text/template" id="chargeErrorTemplate">
                    <div id="charge-error" class="shadow-container">
                    <p>
                    Unfortunately, we cannot process your payment. This could be due to your payment being declined by your card issuer.
                    </p>
                    <p>
                    You have not been charged by Supreme, but in some cases, your bank may still temporarily hold funds in your account, this is only a temporary hold that will usually time out after 48 to 72 hours, depending on your individual credit card issuer.
                    </p>
                    <p>
                    If you want to re-enter your card details <strong><a href="#checkout">go back</a></strong> and try again.
                    </p>
                    
                    
                    </div>
                    </script>
                    
                    <script type="text/template" id="checkoutViewProvincesTemplate">
                    <option value="AB">AB</option>
                    <option value="BC">BC</option>
                    <option value="MB">MB</option>
                    <option value="NB">NB</option>
                    <option value="NL">NL</option>
                    <option value="NT">NT</option>
                    <option value="NS">NS</option>
                    <option value="NU">NU</option>
                    <option value="ON">ON</option>
                    <option value="PE">PE</option>
                    <option value="QC">QC</option>
                    <option value="SK">SK</option>
                    <option value="YT">YT</option>
                    </script>
                    
                    <script type="text/template" id="checkoutViewStatesTemplate">
                    <option value=""></option>
                    <option value="AL">AL</option>
                    <option value="AK">AK</option>
                    <option value="AS">AS</option>
                    <option value="AZ">AZ</option>
                    <option value="AR">AR</option>
                    <option value="CA">CA</option>
                    <option value="CO">CO</option>
                    <option value="CT">CT</option>
                    <option value="DE">DE</option>
                    <option value="DC">DC</option>
                    <option value="FM">FM</option>
                    <option value="FL">FL</option>
                    <option value="GA">GA</option>
                    <option value="GU">GU</option>
                    <option value="HI">HI</option>
                    <option value="ID">ID</option>
                    <option value="IL">IL</option>
                    <option value="IN">IN</option>
                    <option value="IA">IA</option>
                    <option value="KS">KS</option>
                    <option value="KY">KY</option>
                    <option value="LA">LA</option>
                    <option value="ME">ME</option>
                    <option value="MH">MH</option>
                    <option value="MD">MD</option>
                    <option value="MA">MA</option>
                    <option value="MI">MI</option>
                    <option value="MN">MN</option>
                    <option value="MS">MS</option>
                    <option value="MO">MO</option>
                    <option value="MT">MT</option>
                    <option value="NE">NE</option>
                    <option value="NV">NV</option>
                    <option value="NH">NH</option>
                    <option value="NJ">NJ</option>
                    <option value="NM">NM</option>
                    <option value="NY">NY</option>
                    <option value="NC">NC</option>
                    <option value="ND">ND</option>
                    <option value="MP">MP</option>
                    <option value="OH">OH</option>
                    <option value="OK">OK</option>
                    <option value="OR">OR</option>
                    <option value="PW">PW</option>
                    <option value="PA">PA</option>
                    <option value="PR">PR</option>
                    <option value="RI">RI</option>
                    <option value="SC">SC</option>
                    <option value="SD">SD</option>
                    <option value="TN">TN</option>
                    <option value="TX">TX</option>
                    <option value="UT">UT</option>
                    <option value="VT">VT</option>
                    <option value="VI">VI</option>
                    <option value="VA">VA</option>
                    <option value="WA">WA</option>
                    <option value="WV">WV</option>
                    <option value="WI">WI</option>
                    <option value="WY">WY</option>
                    </script>
                    
                    <script>
                    var allCategoriesAndProducts = {"unique_image_url_prefixes":[],"products_and_categories":{"Bags":[{"name":"Hi-Vis Backpack","id":168612,"image_url":"//images.supremenewyork.com/93217/ca/RM-JVLFeasQ.jpg","price":14800,"sale_price":0,"new_item":false,"position":46,"category_name":"Bags"},{"name":"Hi-Vis Duffle","id":168613,"image_url":"//images.supremenewyork.com/93220/ca/_VvZIxcuCKc.jpg","price":13800,"sale_price":0,"new_item":false,"position":47,"category_name":"Bags"},{"name":"Hi-Vis Messenger Bag","id":168614,"image_url":"//images.supremenewyork.com/93224/ca/_g3ySyyP8HI.jpg","price":12000,"sale_price":0,"new_item":false,"position":48,"category_name":"Bags"},{"name":"Hi-Vis Hip Bag","id":168615,"image_url":"//d17ol771963kd3.cloudfront.net/93231/ca/v5XNkiRost4.jpg","price":6800,"sale_price":0,"new_item":false,"position":49,"category_name":"Bags"}],"Jackets":[{"name":"Supreme/Schott\u00ae Perfecto Leather Jacket","id":168619,"image_url":"//images.supremenewyork.com/93432/ca/JA8UtL1kwb4.jpg","price":69800,"sale_price":0,"new_item":false,"position":1,"category_name":"Jacket"},{"name":"Hooded Firemans Coat","id":168618,"image_url":"//images.supremenewyork.com/93403/ca/hithJUPVwuQ.jpg","price":24800,"sale_price":0,"new_item":false,"position":2,"category_name":"Jacket"},{"name":"Velvet Hooded Bomber","id":168617,"image_url":"//images.supremenewyork.com/93271/ca/S8D84vJv7oI.jpg","price":21800,"sale_price":0,"new_item":false,"position":3,"category_name":"Jacket"},{"name":"Quilted Coaches Jacket","id":168621,"image_url":"//images.supremenewyork.com/93496/ca/5EPMtBQcfPg.jpg","price":18800,"sale_price":0,"new_item":false,"position":4,"category_name":"Jacket"},{"name":"Hi-Vis Taped Seam Jacket","id":168616,"image_url":"//images.supremenewyork.com/93260/ca/YT-eNvm8dcs.jpg","price":32800,"sale_price":0,"new_item":false,"position":5,"category_name":"Jacket"},{"name":"Polartec\u00ae Varsity Jacket","id":168620,"image_url":"//d17ol771963kd3.cloudfront.net/93477/ca/my4RHS_xzBs.jpg","price":18800,"sale_price":0,"new_item":false,"position":6,"category_name":"Jacket"}],"Sweatshirts":[{"name":"2-Tone Fleece Pullover","id":168683,"image_url":"//d17ol771963kd3.cloudfront.net/93421/ca/kKotFiYR8RA.jpg","price":12800,"sale_price":0,"new_item":true,"position":13,"category_name":"Sweatshirts"},{"name":"Small Box Zip Up Vest","id":168623,"image_url":"//images.supremenewyork.com/93532/ca/4qeTv3R41Ik.jpg","price":12800,"sale_price":0,"new_item":false,"position":14,"category_name":"Sweatshirts"}],"Bottoms":[{"name":"Warm Up Pant","id":168689,"image_url":"//d17ol771963kd3.cloudfront.net/94781/ca/2lXyptM3m68.jpg","price":11000,"sale_price":0,"new_item":true,"position":33,"category_name":"Bottoms"},{"name":"Flight Pant","id":168667,"image_url":"//images.supremenewyork.com/94772/ca/CrzMj4Ms6pg.jpg","price":14800,"sale_price":0,"new_item":false,"position":27,"category_name":"Bottoms"},{"name":"Work Pant","id":168672,"image_url":"//d17ol771963kd3.cloudfront.net/94841/ca/0uCNTQ9QzIk.jpg","price":11800,"sale_price":0,"new_item":false,"position":28,"category_name":"Bottoms"},{"name":"Chino Pant","id":168668,"image_url":"//d17ol771963kd3.cloudfront.net/94803/ca/H0Zcz5rjfFA.jpg","price":13800,"sale_price":0,"new_item":false,"position":29,"category_name":"Bottoms"},{"name":"Stone Washed Black Slim Jean","id":168671,"image_url":"//d17ol771963kd3.cloudfront.net/94827/ca/_2LnIeIHz3g.jpg","price":12800,"sale_price":0,"new_item":false,"position":30,"category_name":"Bottoms"},{"name":"Stone Washed Slim Jean","id":168670,"image_url":"//d17ol771963kd3.cloudfront.net/94824/ca/UxrtDKBdUpg.jpg","price":14800,"sale_price":0,"new_item":false,"position":31,"category_name":"Bottoms"},{"name":"Rigid Slim Jean","id":168669,"image_url":"//d17ol771963kd3.cloudfront.net/94821/ca/TLEwyIsKvTQ.jpg","price":13800,"sale_price":0,"new_item":false,"position":32,"category_name":"Bottoms"},{"name":"Classic Logo Striped Rib Sweatpant","id":168626,"image_url":"//images.supremenewyork.com/93644/ca/LrdqFGqCNB0.jpg","price":12800,"sale_price":0,"new_item":false,"position":34,"category_name":"Bottoms"}],"T-Shirts":[{"name":"A Love Supreme Tee","id":168634,"image_url":"//images.supremenewyork.com/93786/ca/boYQFZUT-cs.jpg","price":3200,"sale_price":0,"new_item":false,"position":21,"category_name":"T-Shirts"},{"name":"Circuit Tee","id":168630,"image_url":"//images.supremenewyork.com/93730/ca/gxZsSkU4LvU.jpg","price":3200,"sale_price":0,"new_item":false,"position":22,"category_name":"T-Shirts"},{"name":"Fuck Tee","id":168633,"image_url":"//images.supremenewyork.com/93775/ca/KnTmNgl3VeI.jpg","price":3200,"sale_price":0,"new_item":false,"position":23,"category_name":"T-Shirts"},{"name":"Mask Tee","id":168636,"image_url":"//images.supremenewyork.com/93804/ca/auSxfo50M6U.jpg","price":3200,"sale_price":0,"new_item":false,"position":24,"category_name":"T-Shirts"},{"name":"Most Wanted Tee","id":168628,"image_url":"//images.supremenewyork.com/93695/ca/CC_UTFM7xpE.jpg","price":3200,"sale_price":0,"new_item":false,"position":25,"category_name":"T-Shirts"},{"name":"Hanes Tagless T-Shirts (3-Pack)","id":168681,"image_url":"//images.supremenewyork.com/94992/ca/tbnsnZ339Os.jpg","price":2800,"sale_price":0,"new_item":false,"position":26,"category_name":"T-Shirts"}],"Hats":[{"name":"Denim Croc Strap Camp Cap","id":168684,"image_url":"//d17ol771963kd3.cloudfront.net/93881/ca/IKUUkWDJW3E.jpg","price":6600,"sale_price":0,"new_item":true,"position":36,"category_name":"Hats"},{"name":"Military Shield 5-Panel","id":168688,"image_url":"//d17ol771963kd3.cloudfront.net/94506/ca/KVGYqdEa40o.jpg","price":4000,"sale_price":0,"new_item":true,"position":38,"category_name":"Hats"},{"name":"New Era FTP Beanie","id":168687,"image_url":"//d17ol771963kd3.cloudfront.net/94398/ca/jVoaEHiAodI.jpg","price":3600,"sale_price":0,"new_item":true,"position":42,"category_name":"Hats"},{"name":"Tonal Box Logo New Era","id":168678,"image_url":"//images.supremenewyork.com/94942/ca/JFeOpRKwb10.jpg","price":4800,"sale_price":0,"new_item":false,"position":35,"category_name":"Hats"},{"name":"Chain Link Camp Cap","id":168637,"image_url":"//images.supremenewyork.com/93856/ca/7JpaOAQ1X2Q.jpg","price":4400,"sale_price":0,"new_item":false,"position":37,"category_name":"Hats"},{"name":"Desert Storm Mesh Back 5-Panel","id":168659,"image_url":"//d17ol771963kd3.cloudfront.net/94490/ca/oQKvwdH-ogg.jpg","price":4000,"sale_price":0,"new_item":false,"position":39,"category_name":"Hats"},{"name":"Chainsaw 5-Panel","id":168658,"image_url":"//d17ol771963kd3.cloudfront.net/94486/ca/h5vqOcYjZ2M.jpg","price":4000,"sale_price":0,"new_item":false,"position":40,"category_name":"Hats"},{"name":"Printed Ombre Plaid 5-Panel","id":168660,"image_url":"//images.supremenewyork.com/94513/ca/2c859mS--Jk.jpg","price":4000,"sale_price":0,"new_item":false,"position":41,"category_name":"Hats"},{"name":"Basic Beanie","id":168657,"image_url":"//d17ol771963kd3.cloudfront.net/94444/ca/FC8PEK_LT2k.jpg","price":2800,"sale_price":0,"new_item":false,"position":43,"category_name":"Hats"},{"name":"Cherries Beanie","id":168656,"image_url":"//d17ol771963kd3.cloudfront.net/94377/ca/3qnyUv65DmU.jpg","price":3200,"sale_price":0,"new_item":false,"position":44,"category_name":"Hats"},{"name":"Team Stripe Beanie","id":168655,"image_url":"//images.supremenewyork.com/94343/ca/ss5sBFuGg2Y.jpg","price":3200,"sale_price":0,"new_item":false,"position":45,"category_name":"Hats"}],"Top/Sweaters":[{"name":"Dragon Football Top","id":168686,"image_url":"//d17ol771963kd3.cloudfront.net/93984/ca/83FL8rXHtDw.jpg","price":9800,"sale_price":0,"new_item":true,"position":15,"category_name":"Top/Sweater"},{"name":"Logo Rib L/S Tee","id":168685,"image_url":"//d17ol771963kd3.cloudfront.net/93921/ca/VDPG1YL3r_U.jpg","price":8400,"sale_price":0,"new_item":true,"position":16,"category_name":"Top/Sweater"},{"name":"Chain Link Sweater","id":168666,"image_url":"//images.supremenewyork.com/94700/ca/P1jX0Vqp4eI.jpg","price":14800,"sale_price":0,"new_item":false,"position":12,"category_name":"Top/Sweater"},{"name":"ESD Jacquard Top","id":168640,"image_url":"//images.supremenewyork.com/93928/ca/QgfTCkX_hhw.jpg","price":8800,"sale_price":0,"new_item":false,"position":17,"category_name":"Top/Sweater"},{"name":"Contrast Stitch Arc Logo Top","id":168641,"image_url":"//images.supremenewyork.com/93941/ca/hFvUl97yO3I.jpg","price":6800,"sale_price":0,"new_item":false,"position":18,"category_name":"Top/Sweater"},{"name":"Psycho L/S Top","id":168645,"image_url":"//images.supremenewyork.com/94099/ca/b4MUzTB8QiI.jpg","price":7800,"sale_price":0,"new_item":false,"position":19,"category_name":"Top/Sweater"},{"name":"Pocket Tee","id":168643,"image_url":"//images.supremenewyork.com/93975/ca/4IfhZFQ0n6g.jpg","price":6200,"sale_price":0,"new_item":false,"position":20,"category_name":"Top/Sweater"}],"Accessories":[{"name":"Metal Toolbox","id":168646,"image_url":"//d17ol771963kd3.cloudfront.net/94091/ca/ndDUc6F7FSI.jpg","price":6000,"sale_price":0,"new_item":false,"position":50,"category_name":"Accessories"},{"name":"Engraved Brass Zippo\u00ae","id":168676,"image_url":"//images.supremenewyork.com/94910/ca/ld1Ytf-QNoc.jpg","price":5800,"sale_price":0,"new_item":false,"position":51,"category_name":"Accessories"},{"name":"Supreme/Helios\u00ae Logo Thermos","id":168674,"image_url":"//images.supremenewyork.com/94872/ca/UNDCJVS4QEI.jpg","price":3200,"sale_price":0,"new_item":false,"position":52,"category_name":"Accessories"},{"name":"Supreme/Swiss Army\u00ae Manager","id":168649,"image_url":"//images.supremenewyork.com/94239/ca/86V7NOkqBfk.jpg","price":4400,"sale_price":0,"new_item":false,"position":53,"category_name":"Accessories"},{"name":"Ceramic Tray","id":168654,"image_url":"//d17ol771963kd3.cloudfront.net/94278/ca/4ily_Jvagjw.jpg","price":3600,"sale_price":0,"new_item":false,"position":54,"category_name":"Accessories"},{"name":"Brass Belt Buckle","id":168650,"image_url":"//images.supremenewyork.com/94252/ca/CT2MI1UXuMs.jpg","price":4400,"sale_price":0,"new_item":false,"position":55,"category_name":"Accessories"},{"name":"Supreme/Everlast\u00ae Hand Grip","id":168653,"image_url":"//d17ol771963kd3.cloudfront.net/94273/ca/Oz7YgK3_RDg.jpg","price":2000,"sale_price":0,"new_item":false,"position":56,"category_name":"Accessories"},{"name":"Fuck'Em Coasters","id":168647,"image_url":"//d17ol771963kd3.cloudfront.net/94177/ca/5eZcIkJAhto.jpg","price":2800,"sale_price":0,"new_item":false,"position":57,"category_name":"Accessories"},{"name":"M16 Bottle Opener","id":168648,"image_url":"//d17ol771963kd3.cloudfront.net/94230/ca/PQFnuFEAIgE.jpg","price":1600,"sale_price":0,"new_item":false,"position":58,"category_name":"Accessories"},{"name":"ABC Pin","id":168651,"image_url":"//d17ol771963kd3.cloudfront.net/94257/ca/N2PnCziPIBk.jpg","price":800,"sale_price":0,"new_item":false,"position":59,"category_name":"Accessories"},{"name":"Fly Pin","id":168652,"image_url":"//d17ol771963kd3.cloudfront.net/94264/ca/sWWh1JbDPZc.jpg","price":800,"sale_price":0,"new_item":false,"position":60,"category_name":"Accessories"},{"name":"\"cherry\"","id":168691,"image_url":"//d17ol771963kd3.cloudfront.net/73554/ca/Fkm-jzBCLsI.jpg","price":2000,"sale_price":0,"new_item":false,"position":65,"category_name":"Accessories"}],"Shirts":[{"name":"Snake Flannel Shirt","id":168661,"image_url":"//d17ol771963kd3.cloudfront.net/94572/ca/JmhJt6Vmrfg.jpg","price":11800,"sale_price":0,"new_item":false,"position":7,"category_name":"Shirts"},{"name":"Shadow Plaid Hooded Shirt","id":168663,"image_url":"//images.supremenewyork.com/94612/ca/f0gt7av5AG0.jpg","price":12800,"sale_price":0,"new_item":false,"position":8,"category_name":"Shirts"},{"name":"Herringbone Denim Shirt","id":168665,"image_url":"//d17ol771963kd3.cloudfront.net/94669/ca/emiMa8qLxfE.jpg","price":12800,"sale_price":0,"new_item":false,"position":9,"category_name":"Shirts"},{"name":"Army Shirt","id":168662,"image_url":"//images.supremenewyork.com/94589/ca/4GR-EOudrUg.jpg","price":13800,"sale_price":0,"new_item":false,"position":10,"category_name":"Shirts"},{"name":"Oxford Shirt","id":168664,"image_url":"//images.supremenewyork.com/94630/ca/JwDkigB-ZOU.jpg","price":11800,"sale_price":0,"new_item":false,"position":11,"category_name":"Shirts"}],"Skate":[{"name":"Supreme/Independent\u00ae Trucks","id":168679,"image_url":"//images.supremenewyork.com/94983/ca/Ztd7kAQy31o.jpg","price":5000,"sale_price":0,"new_item":false,"position":61,"category_name":"Skate"},{"name":"Supreme/Spitfire\u00ae Wheels","id":168680,"image_url":"//d17ol771963kd3.cloudfront.net/94988/ca/P0b6vUe4KU4.jpg","price":3000,"sale_price":0,"new_item":false,"position":62,"category_name":"Skate"},{"name":"Giger Skateboard","id":168677,"image_url":"//d17ol771963kd3.cloudfront.net/94929/ca/2gpsrnjy57Y.jpg","price":6600,"sale_price":0,"new_item":false,"position":63,"category_name":"Skate"},{"name":"Giger Skateboard","id":168682,"image_url":"//d17ol771963kd3.cloudfront.net/94993/ca/gTz0vrLT1Ds.jpg","price":6600,"sale_price":0,"new_item":false,"position":64,"category_name":"Skate"}],"Shoes":[{"name":"Vans\u00ae/Supreme Native American Hi","id":168690,"image_url":"//d17ol771963kd3.cloudfront.net/95014/ca/ucwoEqefyl0.jpg","price":11000,"sale_price":0,"new_item":true,"position":0,"category_name":"Shoes"}],"new":[{"name":"Logo Rib L/S Tee","id":168685,"image_url":"//d17ol771963kd3.cloudfront.net/93921/ca/VDPG1YL3r_U.jpg","price":8400,"sale_price":0,"new_item":true,"position":16,"category_name":"Top/Sweater"},{"name":"Dragon Football Top","id":168686,"image_url":"//d17ol771963kd3.cloudfront.net/93984/ca/83FL8rXHtDw.jpg","price":9800,"sale_price":0,"new_item":true,"position":15,"category_name":"Top/Sweater"},{"name":"2-Tone Fleece Pullover","id":168683,"image_url":"//d17ol771963kd3.cloudfront.net/93421/ca/kKotFiYR8RA.jpg","price":12800,"sale_price":0,"new_item":true,"position":13,"category_name":"Sweatshirts"},{"name":"Warm Up Pant","id":168689,"image_url":"//d17ol771963kd3.cloudfront.net/94781/ca/2lXyptM3m68.jpg","price":11000,"sale_price":0,"new_item":true,"position":33,"category_name":"Bottoms"},{"name":"Denim Croc Strap Camp Cap","id":168684,"image_url":"//d17ol771963kd3.cloudfront.net/93881/ca/IKUUkWDJW3E.jpg","price":6600,"sale_price":0,"new_item":true,"position":36,"category_name":"Hats"},{"name":"New Era FTP Beanie","id":168687,"image_url":"//d17ol771963kd3.cloudfront.net/94398/ca/jVoaEHiAodI.jpg","price":3600,"sale_price":0,"new_item":true,"position":42,"category_name":"Hats"},{"name":"Military Shield 5-Panel","id":168688,"image_url":"//d17ol771963kd3.cloudfront.net/94506/ca/KVGYqdEa40o.jpg","price":4000,"sale_price":0,"new_item":true,"position":38,"category_name":"Hats"},{"name":"Vans\u00ae/Supreme Native American Hi","id":168690,"image_url":"//d17ol771963kd3.cloudfront.net/95014/ca/ucwoEqefyl0.jpg","price":11000,"sale_price":0,"new_item":true,"position":0,"category_name":"Shoes"}]}};
                    var categoryOrder = ["Jackets","Coats","Shirts","Top/Sweaters","Sweatshirts","Bottoms","Shorts","T-Shirts","Hats","Bags","Accessories","Shoes","Skate"];
                    
                    var singularizedCategories = {"Jackets":"Jacket","Coats":"Coat","Shirts":"Shirt","Top/Sweaters":"Top/Sweater","Sweatshirts":"Sweatshirt","Bottoms":"Bottom","Shorts":"Short","T-Shirts":"T-Shirt","Hats":"Hat","Bags":"Bag","Accessories":"Accessory","Shoes":"Shoe","Skate":"Skate"};
                    var productTimer = false;
                    var popZoomTriggered = false;
                    var IS_JAPAN = false;
                    var IS_US = true;
                    var IS_EU = false;
                    
                    var shippingRates = {"std":1000,"spec":2500,"canada":2500};
                    var TAX_STATE					= 'NY';
                    var TAX_RATE					= 0.08875;
                    var APPAREL_THRESHOLD	= 11000;
                    var APPAREL_TAX_RATE	= 0.08875;
                    
                    
                    
                    
                    var SHOP_CLOSED = false;
                    var SALE_VISIBLE = false;
                    var FREE_SHIPPING = false;
                    
                    var LANG = {
                    addToCart: 'add to cart',
                    removeFromCart: 'remove',
                    inCart: 'in cart',
                    single_item: 'item',
                    multiple_items: 'item',
                    limited: 'limited to 1 style per product',
                    checkout: 'checkout'
                    };
                    
                    LANG.language = 'en';
                    LANG.country = 'UK';
                    if (LANG.language == 'fr')
                    LANG.country = 'FR';
                    
                    function watchShopClosedForm(){
                    $('#mailinglist').submit(function(e){
                                             var form = $(this);
                                             var email = $("input[name='email']");
                                             if (email.val() == "" || !email.val().match(/^([^\/@\s\\]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i)) {
                                             email.parent('p').addClass('error');
                                             valid = false;
                                             } else {
                                             $('#shop_closed p.copy').css('visibility', 'hidden');
                                             $('#email_field').css('visibility', 'hidden');
                                             $('#eu_field').css('visibility', 'hidden');
                                             $('#button').text("we'll notify " + email.val() +  " when the shop reopens.");			
                                             email.parent('p').removeClass('error');
                                             
                                             $.ajax({
                                                    type: 'POST',
                                                    url: $(e.target).attr('action'),
                                                    data:  form.serialize(),
                                                    dataType: 'json'
                                                    });						
                                             
                                             } 
                                             
                                             e.preventDefault();
                                             });
                    }
                    
                    function watchShopClosedForm(){
                    $('#mailinglist').submit(function(e){
                                             var form = $(this);
                                             var email = $("input[name='email']");
                                             if (email.val() == "" || !email.val().match(/^([^\/@\s\\]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i)) {
                                             email.parent('p').addClass('error');
                                             valid = false;
                                             } else {
                                             $('#shop_closed p.copy').hide();
                                             $('#email_field').hide();
                                             $('#eu_field').hide();
                                             $('.checkbox-container').hide();
                                             $('#fall-eu-notice').hide();
                                             $('#button').text("we'll notify " + email.val() +  " when the shop reopens.");			
                                             
                                             email.parent('p').removeClass('error');
                                             
                                             $.ajax({
                                                    type: 'POST',
                                                    url: $(e.target).attr('action'),
                                                    data:  form.serialize(),
                                                    dataType: 'json'
                                                    });						
                                             
                                             } 
                                             e.preventDefault();
                                             });
                    }
                    
                    </script>
                    
                    <script src="//d17ol771963kd3.cloudfront.net/assets/mobile-5dd939a2252cffd50064507fcbb8a8bb.js" type="text/javascript"></script>
                    
                    
                    <script>
                    if (!window.ga) {
                    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                     (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                     m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                     })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
                    
                    ga('create', 'UA-104557-18', 'supremenewyork.com');
                    ga('send', 'pageview');
                    }
                    </script>
                    <script>
                    if (!window._gaq) {
                    var _gaq = _gaq || [];
                    _gaq.push(['_setAccount', "UA-104557-5"]);
                    _gaq.push(['_trackPageview']);
                    
                    (function() {
                     var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                     ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                     if($("script[src='"+ga.src+"']").size() == 0){
                     var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
                     }
                     })();
                    } else {
                    ga_track('pageview');
                    }
                    
                    
                    var FIRST_AND_LAST_NAME_FORMAT = /^[A-Za-z\-]+( +[A-Za-z\-]+)+$/;
                    var TEL_FORMAT = /^[0-9]{10}$/;  
                    var STATE_FORMAT = /^[a-zA-Z]{2}$/;
                    var CANADA_ZIP = /[ABCEGHJKLMNPRSTVXY]\d[A-Z] ?\d[A-Z]\d/;
                    var US_ZIP = /^\d{5}([\-]\d{4})?$/;
                    var EMAIL_FORMAT = /^([^\/@\s\\]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/;
                    var BASIC_CHARS_FORMAT = /^[\w \-#\,\.]*$/;
                    var PO_BOX_FORMAT = /p\.?o\.? box/
                    
                    
                    if(window.IOS_APP){
                    (function(){
                     
                     var open = window.XMLHttpRequest.prototype.open,
                     send = window.XMLHttpRequest.prototype.send,
                     SCHEME = 'ajax',
                     _url, _method, _data, onReadyStateChange;
                     
                     ios = function(action, status, data){
                     var infoObj = {url:_url, method: _method, data: data};
                     if(status !== null){
                     infoObj.status = status;
                     }
                     window.location = SCHEME +'://' + action + '?xhr='+JSON.stringify(infoObj)
                     }
                     
                     window.XMLHttpRequest.prototype.open = function(method, url){
                     _method = method;
                     _url = url;
                     return open.apply(this, arguments);
                     }
                     
                     window.XMLHttpRequest.prototype.send = function(data){ 
                     // _data = data;
                     if(this.onreadystatechange.__mine == null){
                     this._onreadystatechange = this.onreadystatechange;
                     this.onreadystatechange = onReadyStateChange;
                     }
                     
                     ios('send', null, data);
                     return send.apply(this, arguments);
                     }
                     
                     onReadyStateChange = function(e) {
                     if (this.readyState === 4) {
                     if(this.status == 200 || this.status == 304){
                     ios('completed', this.status, '');
                     }else{
                     error = {url: _url, status: this.status, statusText: this.statusText};
                     // TODO - do something with this.
                     $.ajax({
                            type: 'GET',
                            url: 'http://app.supremenewyork.com/mobile_error',
                            dataType: 'jsonp',
                            data: error
                            });
                     // this would trigger an error in the native app UI:
                     // ios('error', this.status, this.statusText);
                     }
                     }
                     
                     return this._onreadystatechange.apply(this, arguments);
                     }
                     onReadyStateChange.__mine = true;
                     
                     })();
                    }
                    </script>
                    
