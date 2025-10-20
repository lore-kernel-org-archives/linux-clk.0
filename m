Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239692D640F
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760987994; cv=none; b=ZSnCTBAY78cj4IjsCJRwRr8oIZukBDBmaTjmJDIHtdDVKP05kwFhW0dgO1iN8PAgRhvy+z9dGffzROJeRyKjG9A2GVpm8OP1wVRqr8J1VupphcIoIswju99d/1Y4Izh9Mu5QSkeFPOM31ruGi1EK2sx5CRVUeij7piW0NUf8dic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760987994; c=relaxed/simple;
	bh=vdPCScQSgAAL2WyPO0aJjHrLCVNYBrruwyni11S9av0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jtrVpemrIfXMGX1tf/rzXszxOkJpqK7P+/1j8cpzrXXh5UHMuH7ORSpRedxE1xnOh/xvSp0LV2S6WuScMwR4GHd+kMsShcRuro48SaBANGBUJmg5ntNNEyndVsXk5KTJ3tBsFIPCFNt3IriNJWlQ9Rp8BEcJODhGtSjktblUwIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=krM1SMM8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="krM1SMM8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-471bde1e8f8so8826815e9.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987989; x=1761592789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l+uFkVa2u5HB8Xqrap3smBvxLAVYpo23297fy2cjAVs=;
        b=krM1SMM8pe1ZEayns2LLs6AnctA7zFXT0P3eNGe5CcXe+B5BmSO4vWwqx9slHy1bsZ
         dmiFFiGyb+eDP84YJcNsx1bGKzx2pRUPFLsSEn0J51A93DZU1qWt+fGptmH2eBs0G9GF
         mtv7DqAsmMvhRUN96mRTruLfempMvNHNnE39NE2rkoGBfk59L1ItzbkecMtCrQEFcLtQ
         tqy7PRe/LvbrrVjEGbH00Sm99caIzWrKHejMsX2LWJLcx3tpfMmJg021lHGtVY8DyZbp
         wekMGp/gEmbkIg39Oco3VzT5qzKyQpJmFiq/93qPREZ5Ib5Wbf3Y/44osIAS1PQhTO0X
         pZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987989; x=1761592789;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+uFkVa2u5HB8Xqrap3smBvxLAVYpo23297fy2cjAVs=;
        b=krF7o7PKzk30UGtZB9CxfAreRoI5vNj7Ks+5xqfng+bnEREK5MEEeGevNJwWBtRlUF
         hgGRPXLnu1P+S5Dcm3ydM1ZK7sslgr8wD/UBilo8oqF/Z/c4+0ODCFjwlJEL+7Yk2umB
         k9eWF8hGhZICUNWzRN7grOzLW1ZmWJYuRyPSH6idaF8fTi1Du1dbbvT1IjuQ/luZHO0V
         b5J2wJzlo2LLiE0kI5KjOpH5H8on0AaGVlb27Uy6TIX2qCPhBBnBpqNHVMYsl7ElF5Wu
         eg/vooh++ndR1H/mRFoXIlboM7WHXTleBa4gNrcADulel4B0xi2FMfjJbVuzQiC3o3VE
         us5A==
X-Gm-Message-State: AOJu0YzLneXjmHO5nYu3LInM5sUnnakaGgD3zQlQiX1SybSezn9CyLN1
	ph0OakqwNImX5Akh4bRMKLdl4wAN5nJ35cmEkGRWL9l6qE14ZAQBRdw/KsFMXSc0V10=
X-Gm-Gg: ASbGncu5b2uNDd3Rv9Nz3Kb2nF8xThsfl2CQIiiZLj4GPTHEpi+ojg7+6CWZt4z7Cac
	LXFkY/aB+6FfR/8i0wdLQ2+91jV5uUeTbt14xTy3g6g/mQVtIMOCkEOK/taLgk+gnRLgAx5oN4X
	qCi6+7OLDJJtljWUaK6nC4+bVMBLVDMGg9h5LGnh9ypQz3REVLuDqfi5n9YRW5MhvnchvC/jpkj
	/av6s17dTxEhx59zaZxyBFLgM9zMDRwQakX+SVTKr9Pavt7PnkwNP+QYSsKUCh8CWXDtvMxDfDv
	5kY9Qt8SF9h3+h2Y8CzuVAOIbtZKzmg6sfsAu2BO37z1yNs6mx++M+ZPM0rlb/USuaW7Z4WSfMZ
	K1kfExvl/yPFPIjm1H3+SI8sydSUsAeF0CMkdOl/+eST3C6Kty2UunbmVWPeYl7Oj489O4Yd8iW
	L+ph6iuMev
X-Google-Smtp-Source: AGHT+IGyDLbOrAVFyVlclFlduDeAPiKLL+XPFcf6nUCR2OVZ1JSE5xowDpETyC6TnlDfw1Og0gsFRg==
X-Received: by 2002:a05:600c:4f89:b0:46e:3edc:2811 with SMTP id 5b1f17b1804b1-4711787750dmr94185105e9.14.1760987989393;
        Mon, 20 Oct 2025 12:19:49 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5c34sm258496125e9.10.2025.10.20.12.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:19:48 -0700 (PDT)
Message-ID: <a007a272-03e3-40fd-871a-aa315f99697c@tuxon.dev>
Date: Mon, 20 Oct 2025 22:19:47 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 26/31] clk: at91: at91sam9x5: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <015b98fa475f97ae8e952343ee9703c9c0d37d19.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <015b98fa475f97ae8e952343ee9703c9c0d37d19.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 9/19/25 00:16, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch AT91SAM9X5 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/at91sam9x5.c | 108 +++++++++++++++++++---------------
>  1 file changed, 61 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
> index 13331e015dd7..46d5ea2e6417 100644
> --- a/drivers/clk/at91/at91sam9x5.c
> +++ b/drivers/clk/at91/at91sam9x5.c
> @@ -38,9 +38,9 @@ static const struct clk_pll_characteristics plla_characteristics = {
>  	.out = plla_out,
>  };
>  
> -static const struct {
> +static struct {
>  	char *n;
> -	char *p;
> +	struct clk_hw *parent_hw;
>  	unsigned long flags;
>  	u8 id;
>  } at91sam9x5_systemck[] = {
> @@ -48,12 +48,12 @@ static const struct {
>  	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
>  	 * to keep it enabled in case there is no Linux consumer for it.
>  	 */
> -	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
> -	{ .n = "smdck", .p = "smdclk",   .id = 4 },
> -	{ .n = "uhpck", .p = "usbck",    .id = 6 },
> -	{ .n = "udpck", .p = "usbck",    .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",    .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",    .id = 9 },
> +	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
> +	{ .n = "smdck", .id = 4 },
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
>  };
>  
>  static const struct clk_pcr_layout at91sam9x5_pcr_layout = {
> @@ -133,12 +133,13 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
>  					const struct pck *extra_pcks,
>  					bool has_lcdck)
>  {
> +	struct clk_hw *main_rc_hw, *main_osc_hw, *hw;
>  	struct clk_range range = CLK_RANGE(0, 0);
>  	const char *slck_name, *mainxtal_name;
>  	struct pmc_data *at91sam9x5_pmc;
> -	const char *parent_names[6];
> +	struct clk_parent_data parent_data[6];
>  	struct regmap *regmap;
> -	struct clk_hw *hw;
> +	struct clk_hw *smdck_hw, *usbck_hw;
>  	int i;
>  	bool bypass;
>  
> @@ -162,56 +163,58 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
>  	if (!at91sam9x5_pmc)
>  		return;
>  
> -	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> -					   50000000);
> -	if (IS_ERR(hw))
> +	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> +						   50000000);
> +	if (IS_ERR(main_rc_hw))
>  		goto err_free;
>  
>  	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>  
> -	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL,
> -					bypass);
> -	if (IS_ERR(hw))
> +	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> +						 &AT91_CLK_PD_NAME(mainxtal_name), bypass);
> +	if (IS_ERR(main_osc_hw))
>  		goto err_free;
>  
> -	parent_names[0] = "main_rc_osc";
> -	parent_names[1] = "main_osc";
> -	hw = at91_clk_register_sam9x5_main(regmap, "mainck", parent_names, NULL, 2);
> +	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
> +	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
> +	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
>  	at91sam9x5_pmc->chws[PMC_MAIN] = hw;
>  
> -	hw = at91_clk_register_pll(regmap, "pllack", "mainck", NULL, 0,
> +	hw = at91_clk_register_pll(regmap, "pllack", NULL,
> +				   &AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_MAIN]), 0,
>  				   &at91rm9200_pll_layout, &plla_characteristics);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> -	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack", NULL);
> +	hw = at91_clk_register_plldiv(regmap, "plladivck", NULL, &AT91_CLK_PD_HW(hw));
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
>  	at91sam9x5_pmc->chws[PMC_PLLACK] = hw;
>  
> -	hw = at91_clk_register_utmi(regmap, NULL, "utmick", "mainck", NULL);
> +	hw = at91_clk_register_utmi(regmap, NULL, "utmick", NULL,
> +				    &AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_MAIN]));
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
>  	at91sam9x5_pmc->chws[PMC_UTMI] = hw;
>  
> -	parent_names[0] = slck_name;
> -	parent_names[1] = "mainck";
> -	parent_names[2] = "plladivck";
> -	parent_names[3] = "utmick";
> +	parent_data[0] = AT91_CLK_PD_NAME(slck_name);
> +	parent_data[1] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_MAIN]);
> +	parent_data[2] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_PLLACK]);
> +	parent_data[3] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_UTMI]);
>  	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
> -					   parent_names, NULL,
> +					   NULL, parent_data,
>  					   &at91sam9x5_master_layout,
>  					   &mck_characteristics, &mck_lock);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> -	hw = at91_clk_register_master_div(regmap, "masterck_div",
> -					  "masterck_pres", NULL,
> +	hw = at91_clk_register_master_div(regmap, "masterck_div", NULL,
> +					  &AT91_CLK_PD_HW(hw),
>  					  &at91sam9x5_master_layout,
>  					  &mck_characteristics, &mck_lock,
>  					  CLK_SET_RATE_GATE, 0);
> @@ -220,28 +223,30 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
>  
>  	at91sam9x5_pmc->chws[PMC_MCK] = hw;
>  
> -	parent_names[0] = "plladivck";
> -	parent_names[1] = "utmick";
> -	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, NULL, 2);
> -	if (IS_ERR(hw))
> +	parent_data[0] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_PLLACK]);
> +	parent_data[1] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_UTMI]);
> +	usbck_hw = at91sam9x5_clk_register_usb(regmap, "usbck", NULL, parent_data, 2);
> +	if (IS_ERR(usbck_hw))
>  		goto err_free;
>  
> -	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, NULL, 2);
> -	if (IS_ERR(hw))
> +	parent_data[0] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_PLLACK]);
> +	parent_data[1] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_UTMI]);

No need for these. parent_data[] is already filled from the USB clk
registration.
