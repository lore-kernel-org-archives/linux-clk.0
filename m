Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795142095;
	b=wTPiB6vJQaipBVu8kpuGfte7IJmYoj70ntvvayCESUN7aSTvDg0frLBJ6QyNd8E1Sqre
	 uY+k7GvkMK/tyRB9Ie36s9fMzTUbki81DQj86ATk/k2vuijBpi2k03vsxIzeQHv1zIMXq
	 7HkfoDRR3o5AClqeQEYHZCt5yMGS5OBWo6Gpx2XHPTLD9FTE6fRZpQb5WQF/ry69JhhMk
	 lWLmv9RKN91GXbJRfE0gsbLLaHDQwD5lKQv95FtKuQVBIqn7fbzV87yk+V5gqwk7ywliH
	 UTWS2mqMwj2FgB2xHx41Du0cKM6wMpfmXdGMvJWRBty2il4H1okYOo2T0oeWBu78IhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0V9CXOY6Hd0cNFJGkaNeeNKN0eook5Wz71BB41Yzhac=;
	b=43rw0uV1bg8jmnJhmpfGrYyyXzr1RYmepAfiFg7j16pdqMzv+ZMAQhTy1VzDWm+tA86k
	 o+5SG26gjVxo6iMDFSbmd+bKZ8LiRYwgflgSgmBazrLQHyqJ5n9Q0Z+QHRWRWETwIZU9W
	 qrTrVu2OeOFfnM6k1lRCVZaXEA0dg9rdGQ3+e0susm8ELbXj7te0dBVCbOfr29yGUufhX
	 ZVwmGVPkquaSg6KQf/va07+y8WPMPXPGDT2tqmDzpK3kO6VSBDorl0ZHAqtaSylmpMQDH
	 /IjjnRrKS53G1fPRs53Z9qegaIrlcNuFJMtG6w2lXigZMxtFAOpisMgcW4TDwiNK9mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b="NZnp+S/m";
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9937F606A325
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 02:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9937F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=NZnp+S/m
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8629c7cc36eso286853a34.3
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 18:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795142093; x=1795746893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0V9CXOY6Hd0cNFJGkaNeeNKN0eook5Wz71BB41Yzhac=;
        b=NZnp+S/meNOaBGWdtK7a/pkoDLtbtjidskkoHwg7/OAlScQbdib9NL6f75SQ2eHi06
         woMTSCn3X8t2Mtyi9CuiA60jrgdGB6YDZ8k/oJXrgL263dFg+2SPiCddNIxntayjveIO
         CtIPbRDOLI1icnVVLJE6x5YyOYsXGOD7MbzwOLXTnoQcnGuB4zuju+qRlVtuYXN0Sq+2
         YhrjuLDRElEtmcnZPDPNDzsDdNBaUMNJl5RynX9LDSVHL7m8zHC4XOzMy3q83ZHe1Qn9
         Wxve7HLztqi2j4r6c0WgkpT6G41M5ZDB/TI6qjkqlW7l2TZXtjG7eJA1EHoaincAIRAr
         rlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795142093; x=1795746893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0V9CXOY6Hd0cNFJGkaNeeNKN0eook5Wz71BB41Yzhac=;
        b=x5Y/GCpLPApo1NIIl/0EdXsxXaYaA2VnLwbwfIKB1bJpewV364a0C0FGKbUnE5uwkI
         hpSNKMAfoILRXi+Clg9ERHU71NaNEJusRJTQQ1HbNvofpslppd/k6Oisi+DDdaNpUOsC
         H8TJ7VmE8sdMTC/4LbFjCHoP9+I83gPPOPupUh9SgaEiiWMdBmCmiBajkE5Tm7J/Zrrd
         n8DHz3MgBAwwy1fmFnpWDkeA7W2SaTD2uDR2j4i7vQvv2cT6hF5WU8PapYRX5JJ0gWDm
         gcBdeWq6hYL/E6UhA7suMoyspZWNOojrWLoHh9seJ3wMr5VBYJPJ41fHGTvK2v4nDWkl
         m07Q==
X-Forwarded-Encrypted: i=1; AL+hErFhL1nyb5fOgLIFv6+FJvcvZcQCewtlFBo6YiSHz2V/CcCrR15tRYeK8XWTULUabh3Gh3L97RrWwIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+duuvLo6Qsw+/1Tzm65noKvR9Hb7px43BOg8CDP9CncjZUCTD8
	7MXeGNWzEcltnZ2rhdVJ7/SokHsAvL1thoqGZjTO64XjcCbpsCAERbTwgcx7S4vjRWg=
X-Gm-Gg: AYBFou2ve+iuiTtpQu+TmTp8cDrBtbP07N2lCrt7hpyW7I00mM4bojHb4VcgftojkLZ
	++PMmWJx5AeRtod6QddTkKbQoeL0guZezNHqORaoebgIeSUtNZ7JfnyQ5yeY8jllD5wXN0q+qsQ
	XcZgX5vumcA2TL0beMvWBdveyTKXYk9QvtaFw0aDx+r8AOrEsnPxd+688iIGxIb7rmmYTARkLHh
	Iz6EDCf4a0OPRN1GxHFlU5+3jg3j64Bgxg5LURlCfB55cWbnWhbJl29cOn1TYhE0IJIOVkCtUQe
	AYObE0Dr3Gga4iQ/g8tbZbf4ivMIYOnR1ksEZ4EpFTCc1gcCdRtXPBLh3ZRcdqXzOp2CZ970ecI
	OcX06NgqsQYersynwwpXzqAqb+FALMC5wbCJfFVvohJ6MDcG1EDY6qjUjAb/b/3D+EqFDMKbqLB
	bS2xeKwTGzCd+tWgxbATu5MLfEhu8gkUDok86PncqRSjPM5tBR7+c7TTs1BXsGSabY8YfPBUODB
	dqa6Yea5v4kEEkIGB2GCbXSXyhu2l+QLhc4PFmopL6xzDg4RebVaS1dyowNmoMz6UTE5riAGF4s
	4QynUWmo7FRhQp75fEmZK8IPOuSw0A==
X-Received: by 2002:a05:6808:178e:b0:4f5:1cd4:d2be with SMTP id 5614622812f47-57a035c3e91mr2546223b6e.0.1795142093323;
        Thu, 19 Nov 2026 18:34:53 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a2eb50d63sm1145363b6e.0.2026.11.19.18.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 18:34:53 -0800 (PST)
Message-ID: <14556676-77ea-48d9-b135-2d77c615f3cd@riscstar.com>
Date: Thu, 19 Nov 2026 20:34:52 -0600
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-4-elder@riscstar.com>
 <179459694822.2573818.15451444985369018378.b4-review@b4>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <179459694822.2573818.15451444985369018378.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 1:09 PM, Jerome Brunet wrote:
>> Define a new platform driver that manages clocks implemented by the
>> Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
>> and disabled, but currently only the clocks that are (or will soon
>> be) used are defined to be controllable.
>>
>> Two registers manage the state of the clocks.  The registers are
>> accessed via a regmap supplied by a system controller.  Access to
>> the memory region is provided via a BAR on a PCIe endpoint function
>> embedded in the TC9564 SoC.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>

Sorry for the delayed response.

>> ---
>>   MAINTAINERS              |   7 +
>>   drivers/clk/Kconfig      |  12 ++
>>   drivers/clk/Makefile     |   1 +
>>   drivers/clk/clk-tc9564.c | 288 +++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 308 insertions(+)
>>   create mode 100644 drivers/clk/clk-tc9564.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c25ee6e0f1c6..ee01aed56508 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -28332,6 +28332,13 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
>>   F:	drivers/media/i2c/tc358743*
>>   F:	include/media/i2c/tc358743.h
>>   
>> +TOSHIBA TC9564 CLOCK DRIVER
>> +M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>> +M:	Alex Elder <elder@kernel.org>
>> +M:	Daniel Thompson <danielt@kernel.org>
>> +S:	Maintained
>> +F:	drivers/clk/clk-tc9564.c
>> +
>>   TOSHIBA TC9564 PCI DRIVER
>>   M:	Alex Elder <elder@kernel.org>
>>   M:	Daniel Thompson <danielt@kernel.org>
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index 37a8e35d4178..0d186150d0c7 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -293,6 +293,18 @@ config COMMON_CLK_S2MPS11
>>   	  clock. These multi-function devices have two (S2MPS14) or three
>>   	  (S2MPS11, S5M8767) fixed-rate oscillators, clocked at 32KHz each.
>>   
>> +config COMMON_CLK_TC9564
>> +	tristate "Toshiba TC9564 clock support"
>> +	depends on SOC_TOSHIBA_TC9564_SYSCON
> 
> You agreed to add COMPILE_TEST on v3 but it is still missing now.

Yes I did agree to that, and I'm sorry I didn't mention that it
had not been done yet.  I have now done some additional testing
with cross-compiling a few other architectures and have more
confidence "COMPILE_TEST" will work correctly.  This will be
included in the next version of this code.  (Really!)

> If have a good reason to ignore or disregard something we agreed on,
> it should be clearly flagged.
> 
>> +	select MFD_SYSCON
>> +	default SOC_TOSHIBA_TC9564_SYSCON
>> +	help
>> +	  This enables support for the clock controller embedded in the
>> +	  Toshiba TC9564 SoC.  The state of each clock is controlled via
>> +	  MMIO to a region managed by a system controller; this ensures
>> +	  access to the region is coordinated between this and the reset
>> +	  and XGMAC (stmmac) drivers.
> 
> As Philipp said, the 2nd part of description is not appropriate as a config
> description.

I will simplify this help text.

> 
>> +
>>   config CLK_TWL
>>   	tristate "Clock driver for the TWL PMIC family"
>>   	depends on TWL4030_CORE
>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>> index 52d138d4ffc8..a11a8326d79c 100644
>> --- a/drivers/clk/Makefile
>> +++ b/drivers/clk/Makefile
>> @@ -111,6 +111,7 @@ obj-$(CONFIG_COMMON_CLK_SI570)		+= clk-si570.o
>>   obj-$(CONFIG_COMMON_CLK_SP7021)		+= clk-sp7021.o
>>   obj-$(CONFIG_COMMON_CLK_STM32F)		+= clk-stm32f4.o
>>   obj-$(CONFIG_COMMON_CLK_STM32H7)	+= clk-stm32h7.o
>> +obj-$(CONFIG_COMMON_CLK_TC9564)		+= clk-tc9564.o
>>   obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
>>   obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
>>   obj-$(CONFIG_CLK_TWL)			+= clk-twl.o
>> diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
>> new file mode 100644
>> index 000000000000..8eeba8591970
>> --- /dev/null
>> +++ b/drivers/clk/clk-tc9564.c
>> @@ -0,0 +1,288 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/*
>> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
>> + */
>> +
>> +#include <linux/bits.h>
>> +#include <linux/clk.h>
> 
> Not needed, this driver does not use the consumer API.

OK.

> 
>> +#include <linux/clk-provider.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/soc/toshiba,tc9564.h>
>> +
>> +/*
>> + * The full name of every clock has a prefix "tc9564" followed by a single
>> + * character ('a', 'b', etc.) that differs for each chip/device number.
>> + * Each clock's "name" defines the unique portion of the clock's full name.
>> + */
>> +#define FULL_NAME_SIZE	24	/* Enough for formatted full name */
>> +#define NAME_SIZE	12	/* Unique portion of the clock name */
>> +#define FORMAT_FULL_NAME(_full_name, _id, _name)		\
>> +	snprintf(_full_name, FULL_NAME_SIZE, "tc9564%c_%.*s",	\
>> +		'a' + (_id), NAME_SIZE, _name)
> 
> dev->id will always be zero coming from a platform driver and this code is a lot of churn
> hidden in a macro. If you must factorize this (I don't think you do) make it a function

Sashiko also pointed out the dev->id being always 0.

> something like snprintf(name, sizeof(name), "%s-%s", dev_name(dev), init->name)
> should be enough. use kasprintf if you can't predict the size.

That's a lot simpler and almost certainly won't fail.  I'll do
what you suggest.

>> +
>> +/* Two registers control whether gate clocks are enabled */
>> +#define CLK_CTRL0_OFFSET	0x1004	/* Common and MAC0 gate clocks */
>> +#define CLK_CTRL1_OFFSET	0x100c	/* MAC1 gate clocks */
>> +
>> +enum clock_type { PLL, FIXED, GATE };
>> +
>> +struct tc9564_clock {
>> +	struct regmap *regmap;
>> +	struct clk_hw_onecell_data *clk_data;
>> +};
>> +
>> +struct gate_clock {
>> +	struct clk_hw hw;
>> +	const struct clock_init *init;
>> +};
>> +
>> +struct clock_init {
>> +	const char name[NAME_SIZE];
> 
> just const char *name ... you are asking for trouble with this.

Right, this can happen once using kasprintf() for the name.

> 
>> +	enum clock_type type;
>> +	union {
>> +		u32 mult;	/* PLL rate multiplier */
>> +
>> +		u32 div;	/* Fixed rate clock divider */
>> +
>> +		struct {	/* Gate clock */
>> +			u16 parent;	/* Parent clock ID, e.g. CLOCK_50M */
>> +			u16 offset;	/* CLK_CTRL0_OFFSET/CLK_CTRL1_OFFSET */
>> +			u32 mask;
>> +		};
>> +	};
>> +};
>> +
>> +/* There is only one PLL */
>> +#define PLL_INIT(_name, _mult)				\
>> +	[CLOCK_##_name] = {				\
>> +		.name = #_name,				\
>> +		.type = PLL,				\
>> +		.mult = (_mult),			\
>> +	}
>> +
>> +/* The PLL is the parent of all the fixed rate clocks */
>> +#define FIXED_INIT(_name, _div)				\
>> +	[CLOCK_##_name] = {				\
>> +		.name = #_name,				\
>> +		.type = FIXED,				\
>> +		.div = (_div),				\
>> +	}
>> +
>> +#define GATE_INIT0(_name, _bit, _pname)	__GATE_INIT(_name, 0, _bit, _pname)
>> +#define GATE_INIT1(_name, _bit, _pname)	__GATE_INIT(_name, 1, _bit, _pname)
> 
> So you are writing the param in the name  ? what is the point of that ?

I'm not sure I understand this, but my next response below might
address it.

> 
>> +#define __GATE_INIT(_name, _reg, _bit, _pname)		\
>> +	[CLOCK_##_name] = {				\
>> +		.name = #_name,				\
>> +		.type = GATE,				\
>> +		.parent = CLOCK_##_pname,		\
>> +		.offset = CLK_CTRL ## _reg ## _OFFSET,	\
>> +		.mask = BIT(_bit),			\
>> +	}
>> +
>> +/*
>> + * Clocks are initialized and registered in the order of their IDs.
>> + * Parent clocks must be registered before their children.
>> + */
>> +static const struct clock_init clock_init[] = {
>> +	PLL_INIT(PLL, 50),
>> +
>> +	FIXED_INIT(62_5M, 20),
> 
> Just pass literals here, and show it the table. you can then pass real name, not 125M which is very
> much tied to your ids.

Well, the IDs are fixed and named meaningfully.  But I *think*
you are suggesting not to use macros in initialization (and to
not make the formatted name depend on the symbolic name).
I think that's pretty reasonable, so that's what I will do.

> 
>> +	FIXED_INIT(125M, 10),
>> +	FIXED_INIT(250M, 5),
>> +	FIXED_INIT(312_5M, 4),
>> +
>> +	GATE_INIT0(MSIGEN, 18, 62_5M),
>> +
>> +	GATE_INIT0(MAC0_TX, 7, 250M),
>> +	GATE_INIT0(MAC0_RX, 14, 250M),
>> +	GATE_INIT0(MAC0_125M, 29, 125M),
>> +	GATE_INIT0(MAC0_312_5M, 30, 312_5M),
>> +	GATE_INIT0(MAC0_ALL, 31, 250M),
>> +
>> +	GATE_INIT1(MAC1_TX, 7, 250M),
>> +	GATE_INIT1(MAC1_RX, 14, 250M),
>> +	GATE_INIT1(MAC1_125M, 29, 125M),
>> +	GATE_INIT1(MAC1_312_5M, 30, 312_5M),
>> +	GATE_INIT1(MAC1_ALL, 31, 250M),
>> +	GATE_INIT1(MAC1_RMII, 15, 125M),
>> +};
> 
> Could you explain why clock PCIe and I2C that where critical
> in the previous version have been left out ? they are not critical anymore ?

I pulled out support for all clocks whose ID was never
used in software, including these two.  They're never
actually used in practice, which means they never got
modified (and therefore never disabled).

That said, I don't mind adding these two back again
and marking them CLK_IS_CRITICAL as you suggested.
(Unfortunately I haven't found a comparable flag
for resets.)

I said this elsewhere, but I do not have a real clock
tree that explains what rates some of these even use.
For those that aren't referenced in code, it might
not matter anyway, but regardless, I'm trying to just
avoid claiming anything about the unused clocks, so
I'd rather leave them out.

So again, I'll plan to define and support the PCIe and
I2C clocks in the next version, but the others I plan
to just leave out until we get better information.

>> +#define CLOCK_COUNT	ARRAY_SIZE(clock_init)
>> +
>> +/* Parent is the input oscillator running at 25 MHz; PLL runs at 1250 MHz */
>> +static struct clk_hw *pll_register(struct device *dev,
>> +				   const struct clock_init *init)
>> +{
>> +	char full_name[FULL_NAME_SIZE];
>> +
>> +	FORMAT_FULL_NAME(full_name, dev->id, init->name);
>> +
>> +	return devm_clk_hw_register_fixed_factor_index(dev, full_name, 0, 0,
>> +						       init->mult, 1);
>> +}
>> +
>> +/* The PLL is the parent of all fixed clocks */
>> +static struct clk_hw *fixed_register(struct device *dev,
>> +				     const struct clock_init *init)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(dev);
>> +	char full_name[FULL_NAME_SIZE];
>> +	struct clk_hw *pll_hw;
>> +
>> +	FORMAT_FULL_NAME(full_name, dev->id, init->name);
>> +
>> +	pll_hw = tc9564_clock->clk_data->hws[CLOCK_PLL];
>> +
>> +	return devm_clk_hw_register_fixed_factor_parent_hw(dev, full_name,
>> +							   pll_hw, 0,
>> +							   1, init->div);
>> +}
>> +
>> +static const struct gate_clock *hw_to_gate_clock(struct clk_hw *hw)
>> +{
>> +	return container_of_const(hw, struct gate_clock, hw);
>> +}
>> +
>> +static void gate_clk_manage(struct clk_hw *hw, bool enable)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(clk_hw_get_dev(hw));
>> +	const struct gate_clock *clock = hw_to_gate_clock(hw);
>> +	u32 mask = clock->init->mask;
>> +
>> +	regmap_update_bits(tc9564_clock->regmap, clock->init->offset, mask,
>> +			   enable ? mask : 0);
> 
> how about returning the error if any ?

I'll no longer be using a regmap in the next version, but I think
I understand your point (gate_clk_enable() below can return what
this returns) and will implement it that way.

> 
>> +}
>> +
>> +static int gate_clk_enable(struct clk_hw *hw)
>> +{
>> +	gate_clk_manage(hw, true);
>> +
>> +	return 0;
>> +}
>> +
>> +static void gate_clk_disable(struct clk_hw *hw)
>> +{
>> +	gate_clk_manage(hw, false);
>> +}
>> +
>> +static int gate_clk_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(clk_hw_get_dev(hw));
>> +	const struct gate_clock *clock = hw_to_gate_clock(hw);
>> +	u32 val;
>> +
>> +	regmap_read(tc9564_clock->regmap, clock->init->offset, &val);
> 
> here too
> 
>> +
>> +	return val & clock->init->mask ? 1 : 0;
> 
> you might be using val uninitialised here.

The next version will not be using regmap (it will use readl()
here), so this is moot.

>> +}
>> +
>> +static const struct clk_ops gate_clk_ops = {
>> +	.enable = gate_clk_enable,
>> +	.disable = gate_clk_disable,
>> +	.is_enabled = gate_clk_is_enabled,
>> +};
>> +
>> +static struct clk_hw *gate_register(struct device *dev,
>> +				    const struct clock_init *init)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(dev);
>> +	struct clk_init_data clk_init = { };
>> +	const struct clk_hw *parent_hw;
>> +	char full_name[FULL_NAME_SIZE];
>> +	struct gate_clock *clock;
>> +	int ret;
>> +
>> +	clock = devm_kzalloc_obj(dev, *clock);
>> +	if (!clock)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	FORMAT_FULL_NAME(full_name, dev->id, init->name);
>> +
>> +	parent_hw = tc9564_clock->clk_data->hws[init->parent];
>> +
>> +	clk_init.name = full_name;
>> +	clk_init.ops = &gate_clk_ops;
>> +	clk_init.parent_hws = &parent_hw;
>> +	clk_init.num_parents = 1;
>> +
>> +	clock->hw.init = &clk_init;
>> +	clock->init = init;
>> +
>> +	ret = devm_clk_hw_register(dev, &clock->hw);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return &clock->hw;
>> +}
>> +
>> +static int tc9564_clk_probe(struct platform_device *pdev)
>> +{
>> +	struct clk_hw_onecell_data *clk_data;
>> +	struct tc9564_clock *tc9564_clock;
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *parent_np;
>> +	int ret;
>> +
>> +	parent_np = dev_of_node(dev->parent);
>> +	if (!parent_np)
>> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
>> +
>> +	tc9564_clock = devm_kzalloc_obj(dev, *tc9564_clock);
>> +	if (!tc9564_clock)
>> +		return -ENOMEM;
>> +
>> +	/* Note: MMIO regmap (no error checking needed when used) */
>> +	tc9564_clock->regmap = device_node_to_regmap(parent_np);
>> +	if (IS_ERR(tc9564_clock->regmap))
>> +		return dev_err_probe(dev, PTR_ERR(tc9564_clock->regmap),
>> +				     "failed to get config regmap\n");
> 
> If the parent registers the regmap you can get it with dev_get_regmap(dev->parent, NULL)
> with no syscon dep.

Thank you very much for your review.

					-Alex

