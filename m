Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D2D2E4247;
	Fri,  9 Jan 2026 17:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767978230; cv=none; b=a6xXke0ef4j9nBZplz5MKB+S3sdcFgNtLWqsVuiD1NP9FqR6HQcIB5lyeDSCtspwuXPq4qktgbZsYBAmdFAXiqMogoH2mooo/1WVMkFEr0D8rDK0Xh1U482D+6yZs4sEQthaH9ToC0QQ1XWXlr1SF6h2/8qEeyTvRtXYrODEbEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767978230; c=relaxed/simple;
	bh=HAnLULaMUOc5Nc5jyCi1DTCw+t7mBlxZV/qBH8OF/pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mSCRVE+wu7izqfTmRoi6huU9bQJVe/bWsL164SND+WVzpgDlnsB1XXcho60J0qyAQsraU2quBXdCQ1DX5gH908CInclsPc5KMrd9YP0w5PO9sXd/bLKAhqH7mpx4sd+Vzchv8ZJhhNac3X4kPR4lCHN2ft+rslWJOR1+OrsCXQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=BvMpH1m5; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="BvMpH1m5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1767978227; x=1799514227;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HAnLULaMUOc5Nc5jyCi1DTCw+t7mBlxZV/qBH8OF/pw=;
  b=BvMpH1m5YeoMP4Mq80DV2/+doUvbiLjz1Z16P49F4UZB0BkH6fyCTS3w
   rksO9sGfOSNkM8uq0ClaplGFof8dw/Jj5msdgqj5OCICI2DRz/83y9jGf
   sE+QVIB/Z5EFuPIzr7r+dHejfwG+OI35lYQ8hjy5m4fUvDg3kxpSTTtp5
   WhKKSZVg8/iDbuRccPQXN3H0SOFJN1ElbsK/x5OXG7r9vjNMxY5IDG0OO
   H0WKuMAsztfWrN1THqw+6xZEQ+Y9FVVUAxXablV2+z6NLZl61cAsD2X+x
   Y5qqFPEhJkIc093RBg6XXZ6kqNKv9XinQUOIhzexkqmyBsQ6CLenAMyHC
   A==;
X-CSE-ConnectionGUID: RKd1RUMeRFOIyoqLuXNK1Q==
X-CSE-MsgGUID: SNK/4r0HSISKVG1n6XCSeg==
X-IronPort-AV: E=Sophos;i="6.21,214,1763449200"; 
   d="scan'208";a="50915444"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 10:03:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 9 Jan 2026 10:03:25 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 9 Jan 2026 10:03:25 -0700
Message-ID: <0402804e-7575-42b2-9990-1b09fca80451@microchip.com>
Date: Fri, 9 Jan 2026 10:03:42 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/31] clk: at91: dt-compat: switch to parent_hw and
 parent_data
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <alexandre.belloni@bootlin.com>,
	<nicolas.ferre@microchip.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <varshini.rajendran@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <628859234f4b2523f43b3ac05d5e29ceb05a7f61.1758226719.git.Ryan.Wanner@microchip.com>
 <eed15c43-dde3-410b-b2a3-655f4acf8d97@tuxon.dev>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <eed15c43-dde3-410b-b2a3-655f4acf8d97@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 10/20/25 12:15, Claudiu Beznea wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi, Ryan,
> 
> On 9/19/25 00:16, Ryan.Wanner@microchip.com wrote:
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>
>> Switch old dt-compat clocks to use parent_hw and parent_data. Having
>> parent_hw instead of parent names improves to clock registration
>> speed and re-parenting.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>> ---
>>  drivers/clk/at91/dt-compat.c | 80 +++++++++++++++++++++++++-----------
>>  1 file changed, 56 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
>> index fa8658d3be7b..9ca871b817e0 100644
>> --- a/drivers/clk/at91/dt-compat.c
>> +++ b/drivers/clk/at91/dt-compat.c
>> @@ -43,7 +43,8 @@ static void __init of_sama5d2_clk_audio_pll_frac_setup(struct device_node *np)
>>
>>       parent_name = of_clk_get_parent_name(np, 0);
>>
>> -     hw = at91_clk_register_audio_pll_frac(regmap, name, parent_name, NULL);
>> +     hw = at91_clk_register_audio_pll_frac(regmap, name, NULL,
>> +                                           &AT91_CLK_PD_NAME(parent_name));
>>       if (IS_ERR(hw))
>>               return;
>>
>> @@ -69,7 +70,8 @@ static void __init of_sama5d2_clk_audio_pll_pad_setup(struct device_node *np)
>>
>>       parent_name = of_clk_get_parent_name(np, 0);
>>
>> -     hw = at91_clk_register_audio_pll_pad(regmap, name, parent_name, NULL);
>> +     hw = at91_clk_register_audio_pll_pad(regmap, name, NULL,
>> +                                          &AT91_CLK_PD_NAME(parent_name));
>>       if (IS_ERR(hw))
>>               return;
>>
>> @@ -95,7 +97,7 @@ static void __init of_sama5d2_clk_audio_pll_pmc_setup(struct device_node *np)
>>
>>       parent_name = of_clk_get_parent_name(np, 0);
>>
>> -     hw = at91_clk_register_audio_pll_pmc(regmap, name, parent_name, NULL);
>> +     hw = at91_clk_register_audio_pll_pmc(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
>>       if (IS_ERR(hw))
>>               return;
>>
>> @@ -129,6 +131,7 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
>>       struct clk_hw *hw;
>>       unsigned int num_parents;
>>       const char *parent_names[GENERATED_SOURCE_MAX];
>> +     struct clk_parent_data parent_data[GENERATED_SOURCE_MAX];
>>       struct device_node *gcknp, *parent_np;
>>       struct clk_range range = CLK_RANGE(0, 0);
>>       struct regmap *regmap;
>> @@ -149,6 +152,8 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
>>       if (IS_ERR(regmap))
>>               return;
>>
>> +     for (unsigned int i = 0; i < num_parents; i++)
>> +             parent_data[i] = AT91_CLK_PD_NAME(parent_names[i]);
>>       for_each_child_of_node(np, gcknp) {
>>               int chg_pid = INT_MIN;
>>
>> @@ -171,7 +176,7 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
>>
>>               hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
>>                                                &dt_pcr_layout, name,
>> -                                              parent_names, NULL, NULL,
>> +                                              NULL, parent_data, NULL,
>>                                                num_parents, id, &range,
>>                                                chg_pid);
>>               if (IS_ERR(hw))
>> @@ -201,7 +206,7 @@ static void __init of_sama5d4_clk_h32mx_setup(struct device_node *np)
>>
>>       parent_name = of_clk_get_parent_name(np, 0);
>>
>> -     hw = at91_clk_register_h32mx(regmap, name, parent_name, NULL);
>> +     hw = at91_clk_register_h32mx(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
>>       if (IS_ERR(hw))
>>               return;
>>
>> @@ -228,6 +233,8 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
>>               return;
>>
>>       for_each_child_of_node(np, i2s_mux_np) {
>> +             struct clk_parent_data parent_data[2];
>> +
>>               if (of_property_read_u8(i2s_mux_np, "reg", &bus_id))
>>                       continue;
>>
>> @@ -238,8 +245,10 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
>>               if (ret != 2)
>>                       continue;
>>
>> +             parent_data[0] = AT91_CLK_PD_NAME(parent_names[0]);
>> +             parent_data[1] = AT91_CLK_PD_NAME(parent_names[1]);
>>               hw = at91_clk_i2s_mux_register(regmap_sfr, i2s_mux_np->name,
>> -                                            parent_names, NULL, 2, bus_id);
>> +                                            NULL, parent_data, 2, bus_id);
>>               if (IS_ERR(hw))
>>                       continue;
>>
>> @@ -269,7 +278,8 @@ static void __init of_at91rm9200_clk_main_osc_setup(struct device_node *np)
>>       if (IS_ERR(regmap))
>>               return;
>>
>> -     hw = at91_clk_register_main_osc(regmap, name, parent_name, NULL, bypass);
>> +     hw = at91_clk_register_main_osc(regmap, name, NULL,
>> +                                     &AT91_CLK_PD_NAME(parent_name), bypass);
>>       if (IS_ERR(hw))
>>               return;
>>
>> @@ -323,7 +333,7 @@ static void __init of_at91rm9200_clk_main_setup(struct device_node *np)
>>       if (IS_ERR(regmap))
>>               return;
>>
>> -     hw = at91_clk_register_rm9200_main(regmap, name, parent_name, NULL);
>> +     hw = at91_clk_register_rm9200_main(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
>>       if (IS_ERR(hw))
>>               return;
>>
>> @@ -336,6 +346,7 @@ static void __init of_at91sam9x5_clk_main_setup(struct device_node *np)
>>  {
>>       struct clk_hw *hw;
>>       const char *parent_names[2];
>> +     struct clk_parent_data parent_data[2];
>>       unsigned int num_parents;
>>       const char *name = np->name;
>>       struct regmap *regmap;
>> @@ -354,7 +365,9 @@ static void __init of_at91sam9x5_clk_main_setup(struct device_node *np)
>>
>>       of_property_read_string(np, "clock-output-names", &name);
>>
>> -     hw = at91_clk_register_sam9x5_main(regmap, name, parent_names, NULL,
>> +     parent_data[0] = AT91_CLK_PD_NAME(parent_names[0]);
>> +     parent_data[1] = AT91_CLK_PD_NAME(parent_names[1]);
>> +     hw = at91_clk_register_sam9x5_main(regmap, name, NULL, parent_data,
>>                                          num_parents);
>>       if (IS_ERR(hw))
>>               return;
>> @@ -396,6 +409,7 @@ of_at91_clk_master_setup(struct device_node *np,
>>       struct clk_hw *hw;
>>       unsigned int num_parents;
>>       const char *parent_names[MASTER_SOURCE_MAX];
>> +     struct clk_parent_data parent_data[MASTER_SOURCE_MAX];
>>       const char *name = np->name;
>>       struct clk_master_characteristics *characteristics;
>>       struct regmap *regmap;
>> @@ -419,13 +433,15 @@ of_at91_clk_master_setup(struct device_node *np,
>>       if (IS_ERR(regmap))
>>               return;
>>
>> +     for (unsigned int i = 0; i < MASTER_SOURCE_MAX; i++)
>> +             parent_data[i] = AT91_CLK_PD_NAME(parent_names[i]);
>>       hw = at91_clk_register_master_pres(regmap, "masterck_pres", num_parents,
>> -                                        parent_names, NULL, layout,
>> +                                        NULL, parent_data, layout,
>>                                          characteristics, &mck_lock);
>>       if (IS_ERR(hw))
>>               goto out_free_characteristics;
>>
>> -     hw = at91_clk_register_master_div(regmap, name, "masterck_pres", NULL,
>> +     hw = at91_clk_register_master_div(regmap, name, NULL, &AT91_CLK_PD_HW(hw),
>>                                         layout, characteristics,
>>                                         &mck_lock, CLK_SET_RATE_GATE, 0);
> 
> Looks like at91_clk_register_master_div() could be kept to use parent_hws
> instead of parent_data.

Looking into this more the register_master_div calls
at91_clk_register_master_internal() which is used for all of the SoCs.
Some of the SoCs that use this function only have the parents passed in
by name string and not clk_hw. Would it be wise to add another function
for this to account for clk_hw and parent name? Or keep the use of
parent_data?

Ryan

