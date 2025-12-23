Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690082DC76B
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 14:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766498455; cv=none; b=OM9QUFDwV5fhrnYsgu5gNZmB89UMduyHVAXBrTLqN/5MWO5LvXVqAy6E7uMhrgJKLCZKe1x1g5cN82nHFOq2TGyaoB2b3dNxQCUv3L20DLaxqEUj0UvYTLt/F3l9tsnlmbotejrN64aG/OOSRKn32bhEXbg+l/KQuE37SbyoSCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766498455; c=relaxed/simple;
	bh=9uw/SeESYIDs2pRcy6intjc/uZMeEntIMvUXiiwFnI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SINy1R6GF2e/NkxQowMJYVy0AqeX+JbLGIxAwPRm6MWGr2g4sQFSRK4EPlFVLDZgNZabbFSyRNaAuTrJglbLawyEa/AodTUqge/W/NnX8v4sBNTit2ichuqhzz0Cak02Gzoiy4/s9e6HfyGKtxRqPQlM3cNIangfvjDKsbXml4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mtCQ9rgR; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mtCQ9rgR"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b76b5afdf04so734626366b.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 06:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1766498452; x=1767103252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hz2ngXG4tcddgwLbaHyel4daUml7whhWj+vWVEPKePE=;
        b=mtCQ9rgRCBwElxmF8KnAeR78yheH2ASm9ozRxU+bSn1+JmV/LH3x3d745rGAz9C6ng
         Ja1Mm5yAf3GY2JZV0kqIfnDIXArW2c1pQwLeglvPrTspPvXbvfPXD4UhKQ20dBRuaI3G
         1d0nST9kYAdJ4XY3YLuymT89+Ez2FileH9Bxcxnx1hNWfiJGGMUssLJn/uW5eM6HCp+V
         GgOS2v6HXxTYGGjrXVL5mnLSBBQr1aBJB/iPWjkK8GF9X4B2br1X9FxhLd5DjwkpysPs
         xAs6LsbuqlrEk//3pKsOHQPp8ozgrmABfaC5M2Djx+JOFhas4cApfz6VLdclhlZGTSs3
         cdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766498452; x=1767103252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hz2ngXG4tcddgwLbaHyel4daUml7whhWj+vWVEPKePE=;
        b=IQLU2Tn/WvVI+ja8uewjjZmGnqeYkU4t1nbozwttqqxv0XUtW/8eoVGflG0Y3WFu+O
         8fCOR6g+gvJvhvWVHDqGg4T4zAloujo+ejvWV/O7kcBE5JGQ/VSROAPzzXSIMjWlwVqd
         1KxC5vugEQwnQqwJfxUoZeyycJLR2eiAkg783HIScvqLv86YSvVkWs15rsCXT64rUSC4
         y35jkZitnEXs79ub2K3YpKpmKqG7cThbxMTphC2IGyzr0SBT+bZSC2aAbZlBH31zNAFa
         lW8dUJrLQ1GOm8FoRVbVnsKLRX7MGUBy89HHBTFUyofzOZqwRYKPf6JxrUziYzXNVYmO
         +5sw==
X-Gm-Message-State: AOJu0Yxs2difSrWK5eZxucJlcOQXBJtPP/s7gebFOKD3B7ppknuIv99A
	0kNLvlMpirvzHzkoiL4+oLHz0SI0nJr0stZj18eWA1AkFN8BZ9ceo/ce2pj1yjrLYpE=
X-Gm-Gg: AY/fxX4hCK5djwjFVkT3IkSl2NXQ4glyWGEwLr1yYNNj4z79QQ0JXTB7NG7l0SMGaKG
	wK6Hd9I4x5cuUqyTlddpNYWXA5sYE+F9jqH0KXOteMCy04INpJGpnzH/gn9aNpbcLpFUXalpwlJ
	psl/ymp+TCXO5fhYpDQalYGmMh7RQmE/TBu8mamx7txWgAiNvGaT9QyWfuhSROHCA9EpYmYTK8G
	hRQdf7rVstQdZ7pBIHM9A3F8gMy5WMGC9xrq968qMxpJQdwoos63sLos3PuokeWWbPkPuU+GyIX
	aAe5A5mMt9KD4CnlKtoDJwNhF52NYPJk9CU4GpAwPqd/fXBE8mlpCIVbX5HsA/ZWJMObk736xV5
	JPBnPgi59FEqobbjmeQzltOQJ5hMcFezAk8wzpMOW6xFVi0UZ7q473Pn5pTzNQMKtrvLum3n1rk
	5ntMDbHVz1k64ULfFOwSY5TaaclvoWpBlbRZpRZLpkjrrk5m1lK7GuBrLc7vBygC5vCA==
X-Google-Smtp-Source: AGHT+IGYPXJ/69XN6gGfQWUoIVBAYdG82ZOyLblXkLMpSFGydFm/34pKyRhBFoWGTba47CrlMHh16w==
X-Received: by 2002:a17:906:c108:b0:b6d:6d66:e8e9 with SMTP id a640c23a62f3a-b80371f98e6mr1586569566b.61.1766498451606;
        Tue, 23 Dec 2025 06:00:51 -0800 (PST)
Received: from ?IPV6:2a02:2f04:620a:8300:4258:c40f:5faf:7af5? ([2a02:2f04:620a:8300:4258:c40f:5faf:7af5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8080e2177csm396549266b.68.2025.12.23.06.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 06:00:51 -0800 (PST)
Message-ID: <cb19cd94-7f81-4f75-a7db-bf25192986ed@tuxon.dev>
Date: Tue, 23 Dec 2025 16:00:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/31] clk: at91: clk-usb: add support for
 clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, Nicolas.Ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Varshini.Rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <6979b3734462c97381159f3968a3f22b6193e04d.1758226719.git.Ryan.Wanner@microchip.com>
 <27aab227-01e3-4074-8aab-38623b4d9808@tuxon.dev>
 <14ea374c-2889-4bc5-b0c9-fb5b5498593e@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <14ea374c-2889-4bc5-b0c9-fb5b5498593e@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/18/25 18:23, Ryan.Wanner@microchip.com wrote:
> On 10/20/25 12:17, Claudiu Beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi, Ryan,
>>
>> On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>
>>> Add support for clk_parent_data in usb clock driver.
>>>
>>> All the SoC based drivers that rely on clk-usb were adapted
>>> to the new API change. The switch itself for SoCs will be done
>>> in subsequent patches.
>>>
>>> Remove the use of __clk_get_hw() for the slow clocks.
>>>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>> [ryan.wanner@microchip: Add SAMA7D65 and SAM9X75 SoCs to the changes.
>>> Change how the main_xtal and slcks are initialized so they match the
>>> parent_data API]
>>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>>> ---
>>>   drivers/clk/at91/at91rm9200.c  |  2 +-
>>>   drivers/clk/at91/at91sam9260.c |  2 +-
>>>   drivers/clk/at91/at91sam9g45.c |  2 +-
>>>   drivers/clk/at91/at91sam9n12.c |  2 +-
>>>   drivers/clk/at91/at91sam9x5.c  |  2 +-
>>>   drivers/clk/at91/clk-usb.c     | 41 ++++++++++++++++++++++------------
>>>   drivers/clk/at91/dt-compat.c   |  6 ++---
>>>   drivers/clk/at91/pmc.h         | 11 +++++----
>>>   drivers/clk/at91/sam9x60.c     |  2 +-
>>>   drivers/clk/at91/sam9x7.c      | 21 +++++++++--------
>>>   drivers/clk/at91/sama5d2.c     |  2 +-
>>>   drivers/clk/at91/sama5d3.c     |  2 +-
>>>   drivers/clk/at91/sama5d4.c     |  2 +-
>>>   drivers/clk/at91/sama7d65.c    | 24 +++++++++++---------
>>>   14 files changed, 72 insertions(+), 49 deletions(-)
>>>
>>
>> [ ... ]
>>
>>> @@ -882,10 +885,10 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>>>
>>>        sam9x7_pmc->chws[PMC_MCK] = hw;
>>>
>>> -     parent_names[0] = "plla_divpmcck";
>>> -     parent_names[1] = "upll_divpmcck";
>>> -     parent_names[2] = "main_osc";
>>> -     usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
>>> +     parent_data[0] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
>>> +     parent_data[1] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw);
>>> +     parent_data[2] = AT91_CLK_PD_HW(main_osc_hw);
>>> +     usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", NULL, parent_data, 3);
>>
>> sam9x60_clk_register_usb() could be converted to use parent_hws member of
>> struct clk_init_data instead of parent_data.
> 
> So this would mean that I would pass in an array of the plls as
> parent_hws, and use that to load the clk_init_data struct instead of
> filling the array of parent_data as it is changed to in this patch set?
> 
> And this would be functionally the same since parent_data points to
> clk_hw?>
> 

It should be something like:

  	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
@@ -235,7 +235,10 @@ _at91sam9x5_clk_register_usb(struct regmap *regmap, const 
char *name, const clk_hw **parent_hws)

  	init.name = name;
  	init.ops = &at91sam9x5_usb_ops;
-	init.parent_names = parent_names;
+	if (parent_hws)
+		init.parent_hws = parent_hws;
+	else
+		init.parent_names = parent_names;

Thank you,
Claudiu
