Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1525A340D86;
	Mon, 12 Jan 2026 21:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768253138; cv=none; b=u14An1wTL449WIhfUQpOnzE42d4FAf/3xcn7AFchRacqsuMhJTDofdDaKdd/NhqsgL/zX1oy29OJ2nciCLk/O3FP4qWQbKJB+KfOXkvaMkzg8FM/s2jSTnGkqVqQ9iPkzH6W7973ASiJ8+lOkdGMrIQrnOB5IieSrBtAiqXJfS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768253138; c=relaxed/simple;
	bh=fvSsA+S0/oU9AH4QpW4EiN6TixJIJsN16h6Ww3Ssy+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=W9lTzk2hHhioNJMDamxrbi9aEHfeUJznjbFnSYid70EC4+V0qGXVEJS0lRo5iOeIrFbNjTegMHmSGKqQ6YbKqPnOV+haVFpdU2P7hfxAu6QRPgf05Z68V/8fW/fhg+adJ2ta/2OVzcDi+X88B3zdDyv3MxCYG8MrLtEZCyaS9gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=I0w8SE98; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="I0w8SE98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768253137; x=1799789137;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fvSsA+S0/oU9AH4QpW4EiN6TixJIJsN16h6Ww3Ssy+A=;
  b=I0w8SE98fNxWXqlfPUVX7uh+yqRGu6QUX5PNVZ+omfP948HzDkbIldJl
   3W7osLvedX3sPyliDYKHKa/F3ussqr/hZRH0Ctg8MdUurEbktQCfsJ45I
   OwUrtIEcZIz0n8JvXWjazwpCPd5NFIGBnaTXVl3+77w3XVUBrO+LYpBHw
   Md2Z9uOO6HngREQgXTOvAQ4zLFg9xW7J7iG7J/YUiDJgRvt7FRrv/8gWs
   KgsSzPyzT4c81yhX5rFenwvTit0Zo4Ll8tkLIDNJj/nSNJ+DBshyZUsOt
   YSFwXH1h5t1Pr/W6YD9H/U+6V+jWnilxjQwlUf6IqR0l2YlhUbvoPQRuC
   w==;
X-CSE-ConnectionGUID: xddJJ4WoRF6RVqk1KSStEA==
X-CSE-MsgGUID: kRrye1T+QrWBSihmqI4mJg==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; 
   d="scan'208";a="52207534"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Jan 2026 14:25:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 12 Jan 2026 14:25:18 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 12 Jan 2026 14:25:18 -0700
Message-ID: <bf0c00b5-9e7d-47d1-b503-2d27d862a171@microchip.com>
Date: Mon, 12 Jan 2026 14:25:38 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/31] clk: at91: clk-usb: add support for
 clk_parent_data
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <alexandre.belloni@bootlin.com>,
	<nicolas.ferre@microchip.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <varshini.rajendran@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <6979b3734462c97381159f3968a3f22b6193e04d.1758226719.git.Ryan.Wanner@microchip.com>
 <27aab227-01e3-4074-8aab-38623b4d9808@tuxon.dev>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <27aab227-01e3-4074-8aab-38623b4d9808@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 10/20/25 12:17, Claudiu Beznea wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi, Ryan,
> 
> On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>
>> Add support for clk_parent_data in usb clock driver.
>>
>> All the SoC based drivers that rely on clk-usb were adapted
>> to the new API change. The switch itself for SoCs will be done
>> in subsequent patches.
>>
>> Remove the use of __clk_get_hw() for the slow clocks.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> [ryan.wanner@microchip: Add SAMA7D65 and SAM9X75 SoCs to the changes.
>> Change how the main_xtal and slcks are initialized so they match the
>> parent_data API]
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>> ---
>>  drivers/clk/at91/at91rm9200.c  |  2 +-
>>  drivers/clk/at91/at91sam9260.c |  2 +-
>>  drivers/clk/at91/at91sam9g45.c |  2 +-
>>  drivers/clk/at91/at91sam9n12.c |  2 +-
>>  drivers/clk/at91/at91sam9x5.c  |  2 +-
>>  drivers/clk/at91/clk-usb.c     | 41 ++++++++++++++++++++++------------
>>  drivers/clk/at91/dt-compat.c   |  6 ++---
>>  drivers/clk/at91/pmc.h         | 11 +++++----
>>  drivers/clk/at91/sam9x60.c     |  2 +-
>>  drivers/clk/at91/sam9x7.c      | 21 +++++++++--------
>>  drivers/clk/at91/sama5d2.c     |  2 +-
>>  drivers/clk/at91/sama5d3.c     |  2 +-
>>  drivers/clk/at91/sama5d4.c     |  2 +-
>>  drivers/clk/at91/sama7d65.c    | 24 +++++++++++---------
>>  14 files changed, 72 insertions(+), 49 deletions(-)
>>
> 
> [ ... ]
> 
>> @@ -882,10 +885,10 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>>
>>       sam9x7_pmc->chws[PMC_MCK] = hw;
>>
>> -     parent_names[0] = "plla_divpmcck";
>> -     parent_names[1] = "upll_divpmcck";
>> -     parent_names[2] = "main_osc";
>> -     usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
>> +     parent_data[0] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
>> +     parent_data[1] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw);
>> +     parent_data[2] = AT91_CLK_PD_HW(main_osc_hw);
>> +     usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", NULL, parent_data, 3);
> 
> sam9x60_clk_register_usb() could be converted to use parent_hws member of
> struct clk_init_data instead of parent_data.

Looking more in depth sam9x60_clk_register_usb() calls
at91sam9x_clk_register_usb() which like in 21/31 is called in dt-compact
and only the clock name is passed into it. Should I make another
function for sam9x60_clk_register_usb() that uses parent_hw?

Ryan>

