Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795403672;
	b=wKkOqlToacxj1PqhZl/T9mbav5eRDz5wIajdMk58d/92RG1/flE1T1C1kJfhi6fz+mf0
	 MHnbJ8+5ps7NpaIv/FHQh3VtES6MLCh5ZqYEoRhiXaRFbdrS3AijBnnQVezIrAI0lOfXX
	 tGXY7twhx81nEDUwohB0r1ooSdmUpEwcPSu6MysoAxhn04Akq/wQxj5UUFIooWEkzqqr3
	 7gx4pdEZAtGNcjfcH78yFK7DIzVjQPvxoki3wlhSbWVhgeUoJr2wpzEWr6lNUzvUMZNK/
	 O31arGyYaZrZ4xKwxC/zwV064yVQUXN6aSL/2GD9W0ldBKd7qulbkzc4fTTf3+PgfWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/k4k+cnfaazr8l7czMr5WHdPn/xXFLWlSOSOeD+WgRI=;
	b=OFYypf4JHqxUobtVshhuIVh1+X8KTjpX5UsiHCZGBJDwwbG/HnCDk2HeaOBtNLo7NhT7
	 5bPDCkvIHZGMU2U8gNjew/LIiDWY6IvVJeg3N0xl59MYTQoIGCjGNyzEUd3/fVSF+rkpm
	 gCn1CtXDvPKvuzfKBRYCS5Z3H2BHtoTz+nDnAab+MWKLol9GS2px/NM4bNtN/8OWQM2yl
	 Vh0ljMjs85fhmcJCSbyJVTJy27KPR5NFdNG3ORRhw05CMVEbzXPOAxsXPzxMRgQr7n2M0
	 Al4WqX/7VrjyvwUCikkuRSR8zUwBaaTGU2h2NxbVyiokdSrgmMURX16w4pIStVIch6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=dC6Wn0Hm;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F12F606A320
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 03:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F12F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=dC6Wn0Hm
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8253bc5a613so1783413a34.0
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 19:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795403670; x=1796008470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/k4k+cnfaazr8l7czMr5WHdPn/xXFLWlSOSOeD+WgRI=;
        b=dC6Wn0HmZOg4a5nC9NSi7MnPqrNvCY3F2N508ey9vaMnkbAF7XZbNqNODak2cT8bsb
         ZNKkhI3j567ZixOMxw6qhnhL/Jys6y3QBpbi2UCRbPAAB9eVBPEr8r0x0fwDgj2QBU8e
         47xlCwBdD8Y5dssKAndvazS6tH7NYYnlGcJADeFGGp2TmRSCu/R+txty53h2FG/gzw0f
         F4mrFBjDA0MzNCjslquOuLDQomFF21UrSdSiJ3QyrnFncFW9gGqXME/GBUuziQ8PHlF0
         J1mx0Dzl2gH5WEn2I7pSd7K5M2hksu9+yJ7shWLb0f9oFrH4QT9vyCn0JLCe9HtZGlY9
         z5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795403670; x=1796008470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/k4k+cnfaazr8l7czMr5WHdPn/xXFLWlSOSOeD+WgRI=;
        b=W0HYzrPBH5gtRtwCSlRk/alcXU7s/yACNe0EX6gF0XEuC40gyygX+y1WE7+GGtMB6t
         H6WGIaLQygKXPcIe04pS0FSvj16GsdWRv4QQIpZCTQ9cOkai6FAhSN+aY13/RcaijUzn
         pKDh996UYOs+lHLeYpGcqZmDujPm37hrWtSaxeolctZNZ2eLo6EydddDSwFFP02M5Xky
         FjdyfOp/F+8ekLWy1oLfoGwo2L5Rj5gPX+4TrYd4l4c1HolSJ6rzrM5BbLeyxxZlY2qP
         1I/nYQiio21c0k4ZRT7J5tR7gegadtqOxlhLzVK1tab7k1WO/Mxl664kiKRh/RLGPng5
         +x/A==
X-Forwarded-Encrypted: i=1; AL+hErERCKUl+laqPGQAILLaFeGYZ+Afv2s0UhP2vKYEJNWSkB9WvS+T24g7r8qORWXmD2DsF6Xpd2d476s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N0eAxV03/K6Uz/QquspMN5XoZQ4lmht+ttttWdI5O4aOLphxt
	2IAjxlc+WpeodMo04kPBr7OOggy580CoartIw/9bckhVyNm3iZBOh6eMCH/uE4Kmu44=
X-Gm-Gg: AZFdTZdKuEo4805auC8CdhBHS4xMvYP/4NBElg+UQclXAQW7GfgmdbgYQxymhkmsJOn
	CI8w5x4fi9JOLHAu24ffMqYX5G6ZHpBGMiPZfxeZ02ViF3WT6tB7ciHqOQKZ8sg4rh2nvbEKKC3
	Sg1hRKRqvjBu9EDNxorUjo+0Fdf3fJxvEfAyt46nDe3sYIbgzLQWL3FVlqSktXPMvoB7y0tkFgi
	rr2T250v9SWZxiVJu6w9cgZnW6oXbXCklWkDTSHWdE4Nl/zuZ9Y6qmhJK8mcjzmMnvzUAlBuJB3
	j6vp09SAJgIBkcYmmhizEB2F/cSf7l6iQRXTZdYI6wcJv61/dDc5OLoRK7sbeZVAR5D2C2bUghX
	wVRxTHJRlKojvCJ/5psRSWK8taieKQeONWzsHZGuf7q9uX1sa4MEBf6wWjliHDOqvmHcB9clBgi
	97a7YSCR7KLZJNCbZDxuuOFPn+X7UR5VP+ExmqNjhD3XilDxk3Fq2VzyCH2K5+k6yc9srOms9EK
	KNllN1Cd61n56n9BeQsJtN+huYVNB5TjKkhCH5BpdtFKX7LDXW5sO8SozL3CRrxdfsEYoqrDEvI
	2yYFZFWi3rYNyyFz3CEMIJl99h7uu6wk
X-Received: by 2002:a05:6808:f03:b0:50c:bc6f:fba8 with SMTP id 5614622812f47-57a0c7c3651mr11272385b6e.65.1795403670195;
        Sun, 22 Nov 2026 19:14:30 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a31928e6dsm7849462b6e.2.2026.11.22.19.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 19:14:29 -0800 (PST)
Message-ID: <4df1a689-2540-40fd-bfee-8a739aa2384d@riscstar.com>
Date: Sun, 22 Nov 2026 21:14:28 -0600
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
Subject: Re: [PATCH v2 2/2] clk: toshiba: introduce a TC9564 clock/reset
 driver
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 fabrice.gasnier@foss.st.com, alexandre.torgue@foss.st.com,
 marex@nabladev.com, changhuang.liang@starfivetech.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261120183212.1264522-1-elder@riscstar.com>
 <20261120183212.1264522-3-elder@riscstar.com> <awGPfkiR1ujU4M7i@lore-desk>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <awGPfkiR1ujU4M7i@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 6:33 AM, Lorenzo Bianconi wrote:
>> Define a new platform driver that manages clocks implemented by the
>> Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
>> and disabled, but currently only the clocks that are (or will soon
>> be) used are defined to be controllable.
> 
> Is it a repetition of the sentences below?

Yes.  It seems I started editing this and never finished.
Sashiko also pointed out there was a problem here.

>> Two registers manage the state of the clocks.  The registers are
>> accessed via a regmap supplied by a system controller.  Access to
>> the memory region is provided via a BAR on a PCIe endpoint function
>> embedded in the TC9564 SoC.
> 
> I guess this is a leftover, right?

Yes.

> 
>>
>> Define the binding for the clock and reset controller that present in
>> the Toshiba TC9564 SoC.
>>
>> Define a new platform driver that manages clocks and resets implemented
>> by the Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
>> and disabled, but some of these won't be used any time soon by software,
>> so they are omitted.
>>
>> There are also 13 resets that can be asserted or deasserted, but support
>> for some of these is omitted as well.
>>
>> The I2C and PCIE clocks and resets are treated as CRITICAL, meaning their
>> state should never be changed (and a warning is issued if changing their
>> state is attempted).
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - New driver that combines clock and reset functionality
>>      - Map the platform memory resource rather than using a regmap
>>      - Kconfig adds COMPILE_TEST, and its help text is simplified
>>      - Clock names now defined based on dev_name()
>>      - gate_clk_manage() and reset_manage() return 0, so their
>>        callers can be made a little simpler
>>      - Flex array counted-by field is now explicitly assigned
>>
>>   MAINTAINERS              |   1 +
>>   drivers/clk/Kconfig      |   8 +
>>   drivers/clk/Makefile     |   1 +
>>   drivers/clk/clk-tc9564.c | 501 +++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 511 insertions(+)
>>   create mode 100644 drivers/clk/clk-tc9564.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index af088e1092e63..9503c304c35ed 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -28689,6 +28689,7 @@ M:	Alex Elder <elder@kernel.org>
>>   M:	Daniel Thompson <danielt@kernel.org>
>>   S:	Maintained
>>   F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
>> +F:	drivers/clk/clk-tc9564.c
>>   F:	include/dt-bindings/clock/toshiba,tc9564.h
>>   
>>   TOSHIBA TC9564 PCI DRIVER
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index 6bfa2c8fffe1b..b27807ee93863 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -185,6 +185,14 @@ config COMMON_CLK_CDCE706
>>   	help
>>   	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
>>   
>> +config COMMON_CLK_TC9564
>> +	tristate "Toshiba TC9564 clock and reset support"
>> +	depends on TC9564_PCI || COMPILE_TEST
>> +	default TC9564_PCI
>> +	help
>> +	  This enables support for the clock and reset controllers embedded
>> +	  in the Toshiba TC9564 SoC.
>> +
>>   config COMMON_CLK_TPS68470
>>   	tristate "Clock Driver for TI TPS68470 PMIC"
>>   	depends on I2C
>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>> index 99377a13ebc57..d67cfb6d623d3 100644
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
>> index 0000000000000..65ed524bf2ee7
>> --- /dev/null
>> +++ b/drivers/clk/clk-tc9564.c
>> @@ -0,0 +1,501 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/*
>> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
>> + */
>> +
>> +#include <linux/bits.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset-controller.h>
>> +#include <linux/slab.h>
>> +
>> +#include <dt-bindings/clock/toshiba,tc9564.h>
>> +
>> +/*
>> + * Two registers implement clock enable/disable bits for all gated clocks.
>> + * And two registers implement reset assertion bits for all resets.
>> + * These offsets are relative to the address space defined in devicetree.
>> + */
>> +#define CLOCK0_OFFSET	0x0
>> +#define CLOCK1_OFFSET	0x8
>> +#define RESET0_OFFSET	0x4
>> +#define RESET1_OFFSET	0xc
> 
> nit: I guess you can just put these values in clock_init/reset_init structs.

You mean just put the "raw numbers" there?  I actually started
with that but thought it was clearer to use the symbolic names
defined above.  My plan is to keep what I have on this.

> 
>> +
>> +struct tc9564_clock {
>> +	void __iomem *ioaddr;		/* Mapped clock/reset registers */
>> +	struct clk_hw_onecell_data *clk_data;
>> +	struct reset_controller_dev rcdev;
>> +};
>> +
>> +struct gate_clock {
>> +	const struct clock_init *init;
>> +	struct clk_hw hw;
>> +};
>> +
>> +enum clock_type { PLL, FIXED, GATE, CRITICAL_GATE };
>> +
>> +struct clock_init {
>> +	const char *name;
>> +	enum clock_type type;
>> +	union {
>> +		u32 mult;	/* PLL rate multiplier */
>> +
>> +		struct {	/* Fixed rate clock; parent is PLL */
>> +			u32 numerator;	/* 0 is treated as 1 */
>> +			u32 denominator;
>> +		};
>> +
>> +		struct {	/* Gated clock; parent is a fixed rate clock */
>> +			u16 parent;	/* Parent clock ID, e.g. CLOCK_100M */
>> +			u16 offset;	/* Register offset */
>> +			u32 mask;	/* Value is 2^n (only one bit set) */
>> +		};
>> +	};
>> +};
>> +
>> +struct reset_init {
>> +	u32 offset;	/* Register offset */
>> +	u32 mask;	/* Value is 2^n (only one bit set) */
>> +};
>> +
>> +/*
>> + * Clocks are initialized and registered in the order of their IDs.
>> + * There is one PLL, and it is initialized first.  Fixed clocks are
>> + * initialized after that, and the gated clocks are initialized last
>> + * (after their parent clocks have been registered).
>> + */
> 
> please see the comment below.
> 
>> +static const struct clock_init clock_init[] = {
>> +	[CLOCK_PLL] = {
>> +		.name = "pll",
>> +		.type = PLL,
>> +		.mult = 50,
>> +	},
> 
> unnecessary new-line

The newlines separated the three clock types in the array.

But they might go away anyway after I reconsider grouping them
differently (based on your suggestion).

> 
>> +
>> +	[CLOCK_62_5M] = {
>> +		.name = "62.5MHz",
>> +		.type = FIXED,
>> +		.denominator = 20,
>> +	},
>> +	[CLOCK_100M] = {
>> +		.name = "100MHz",
>> +		.type = FIXED,
>> +		.numerator = 2,
>> +		.denominator = 25,
>> +	},
>> +	[CLOCK_125M] = {
>> +		.name = "125MHz",
>> +		.type = FIXED,
>> +		.denominator = 10,
>> +	},
>> +	[CLOCK_250M] = {
>> +		.name = "250MHz",
>> +		.type = FIXED,
>> +		.denominator = 5,
>> +	},
>> +	[CLOCK_312_5M] = {
>> +		.name = "312.5MHz",
>> +		.type = FIXED,
>> +		.denominator = 4,
>> +	},
>> +
>> +	[CLOCK_I2C] = {
>> +		.name = "i2c",
>> +		.type = CRITICAL_GATE,
>> +		.parent = CLOCK_100M,
>> +		.offset = CLOCK0_OFFSET,
>> +		.mask = BIT(12),
>> +	},
>> +	[CLOCK_PCIE] = {
>> +		.name = "PCIe",
>> +		.type = CRITICAL_GATE,
>> +		.parent = CLOCK_100M,
>> +		.offset = CLOCK0_OFFSET,
>> +		.mask = BIT(9),
>> +	},
>> +	[CLOCK_MSIGEN] = {
>> +		.name = "msigen",
>> +		.type = GATE,
>> +		.parent = CLOCK_62_5M,
>> +		.offset = CLOCK0_OFFSET,
>> +		.mask = BIT(18),
>> +	},
>> +
>> +	[CLOCK_MAC0_TX] = {
>> +		.name = "MAC0-TX",
>> +		.type = GATE,
>> +		.parent = CLOCK_250M,
>> +		.offset = CLOCK0_OFFSET,
>> +		.mask = BIT(7),
>> +	},
>> +	[CLOCK_MAC0_RX] = {
>> +		.name = "MAC0-RX",
>> +		.type = GATE,
>> +		.parent = CLOCK_250M,
>> +		.offset = CLOCK0_OFFSET,
>> +		.mask = BIT(14),
>> +	},
>> +	[CLOCK_MAC0_125M] = {
>> +		.name = "MAC0-125MHz",
>> +		.type = GATE,
>> +		.parent = CLOCK_125M,
>> +		.offset = CLOCK0_OFFSET,
>> +		.mask = BIT(29),
>> +	},
>> +	[CLOCK_MAC0_312_5M] = {
>> +		.name = "MAC0-312.5MHz",
>> +		.type = GATE,
>> +		.parent = CLOCK_312_5M,
>> +		.offset = CLOCK0_OFFSET,
>> +		.mask = BIT(30),
>> +	},
>> +	[CLOCK_MAC0_ALL] = {
>> +		.name = "MAC0-ALL",
>> +		.type = GATE,
>> +		.parent = CLOCK_250M,
>> +		.offset = CLOCK0_OFFSET,
>> +		.mask = BIT(31),
>> +	},
>> +
>> +	[CLOCK_MAC1_TX] = {
>> +		.name = "MAC1-TX",
>> +		.type = GATE,
>> +		.parent = CLOCK_250M,
>> +		.offset = CLOCK1_OFFSET,
>> +		.mask = BIT(7),
>> +	},
>> +	[CLOCK_MAC1_RX] = {
>> +		.name = "MAC1-RX",
>> +		.type = GATE,
>> +		.parent = CLOCK_250M,
>> +		.offset = CLOCK1_OFFSET,
>> +		.mask = BIT(14),
>> +	},
>> +	[CLOCK_MAC1_125M] = {
>> +		.name = "MAC1-125MHz",
>> +		.type = GATE,
>> +		.parent = CLOCK_125M,
>> +		.offset = CLOCK1_OFFSET,
>> +		.mask = BIT(29),
>> +	},
>> +	[CLOCK_MAC1_312_5M] = {
>> +		.name = "MAC1-312.5MHz",
>> +		.type = GATE,
>> +		.parent = CLOCK_312_5M,
>> +		.offset = CLOCK1_OFFSET,
>> +		.mask = BIT(30),
>> +	},
>> +	[CLOCK_MAC1_ALL] = {
>> +		.name = "MAC1-ALL",
>> +		.type = GATE,
>> +		.parent = CLOCK_250M,
>> +		.offset = CLOCK1_OFFSET,
>> +		.mask = BIT(31),
>> +	},
>> +};
>> +#define CLOCK_COUNT	ARRAY_SIZE(clock_init)
>> +
>> +static const struct reset_init reset_init[] = {
>> +	[RESET_I2C] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(12),
>> +	},
>> +	[RESET_PCIE] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(9),
>> +	},
>> +	[RESET_MSIGEN] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(18),
>> +	},
> 
> unnecessary new-line
> 
>> +
>> +	[RESET_MAC0_MAC] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(7),
>> +	},
>> +	[RESET_MAC0_PMA] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(30),
>> +	},
>> +	[RESET_MAC0_XPCS] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(31),
>> +	},
>> +
>> +	[RESET_MAC1_MAC] = {
>> +		.offset = RESET1_OFFSET,
>> +		.mask = BIT(7),
>> +	},
>> +	[RESET_MAC1_PMA] = {
>> +		.offset = RESET1_OFFSET,
>> +		.mask = BIT(30),
>> +	},
>> +	[RESET_MAC1_XPCS] = {
>> +		.offset = RESET1_OFFSET,
>> +		.mask = BIT(31),
>> +	},
>> +};
>> +#define RESET_COUNT	ARRAY_SIZE(reset_init)
>> +
>> +/* Parent is the input oscillator running at 25 MHz; PLL runs at 1250 MHz */
>> +static struct clk_hw *pll_register(struct device *dev, const char *name,
>> +				   const struct clock_init *init)
>> +{
>> +	return devm_clk_hw_register_fixed_factor_index(dev, name, 0, 0,
>> +						       init->mult, 1);
>> +}
>> +
>> +/* The PLL is the parent of all fixed clocks */
>> +static struct clk_hw *fixed_register(struct device *dev, const char *name,
>> +				     const struct clock_init *init)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(dev);
>> +	u32 numerator = init->numerator ? : 1;
>> +	struct clk_hw *pll_hw;
>> +
>> +	pll_hw = tc9564_clock->clk_data->hws[CLOCK_PLL];
>> +
>> +	return devm_clk_hw_register_fixed_factor_parent_hw(dev, name, pll_hw,
>> +							   0, numerator,
>> +							   init->denominator);
>> +}
>> +
>> +static const struct gate_clock *hw_to_gate_clock(struct clk_hw *hw)
>> +{
>> +	return container_of_const(hw, struct gate_clock, hw);
>> +}
>> +
>> +static int gate_clk_manage(struct clk_hw *hw, bool enable)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(clk_hw_get_dev(hw));
>> +	const struct gate_clock *clock = hw_to_gate_clock(hw);
>> +	u32 mask = clock->init->mask;
>> +	void __iomem *ioaddr;
>> +	u32 val;
>> +
>> +	ioaddr = tc9564_clock->ioaddr + clock->init->offset;
>> +
>> +	val = readl(ioaddr);
>> +	if (enable)
>> +		val |= mask;
>> +	else
>> +		val &= ~mask;
>> +	writel(val, ioaddr);
>> +
>> +	return 0;
>> +}
>> +
>> +static int gate_clk_enable(struct clk_hw *hw)
>> +{
>> +	return gate_clk_manage(hw, true);
>> +}
>> +
>> +static void gate_clk_disable(struct clk_hw *hw)
>> +{
>> +	(void)gate_clk_manage(hw, false);
>> +}
>> +
>> +static int gate_clk_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(clk_hw_get_dev(hw));
>> +	const struct gate_clock *clock = hw_to_gate_clock(hw);
>> +	void __iomem *ioaddr;
>> +
>> +	ioaddr = tc9564_clock->ioaddr + clock->init->offset;
>> +
>> +	return readl(ioaddr) & clock->init->mask ? 1 : 0;
> 
> This is racy with gate_clk_manage() but it is not harmful as for reset (please
> see below) but I guess regmap can be helpful for clock as well.

You're saying this should be protected in case a concurrent
update is happening?

This read will return either the value before such an update or
after it, but either way it will be a valid value.  It is always
possible the state changes immediately after the read (even with
spinlock protection).  I don't think there's any need for locking
here.

> 
>> +}
>> +
>> +static const struct clk_ops gate_clk_ops = {
>> +	.enable = gate_clk_enable,
>> +	.disable = gate_clk_disable,
>> +	.is_enabled = gate_clk_is_enabled,
>> +};
>> +
>> +static struct clk_hw *gate_register(struct device *dev, const char *name,
>> +				    const struct clock_init *init)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(dev);
>> +	struct clk_init_data clk_init = { };
>> +	const struct clk_hw *parent_hw;
>> +	struct gate_clock *clock;
>> +	int ret;
>> +
>> +	clock = devm_kzalloc_obj(dev, *clock);
>> +	if (!clock)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	parent_hw = tc9564_clock->clk_data->hws[init->parent];
>> +
>> +	clk_init.name = name;
>> +	clk_init.ops = &gate_clk_ops;
>> +	clk_init.parent_hws = &parent_hw;
>> +	clk_init.num_parents = 1;
>> +	if (init->type == CRITICAL_GATE)
>> +		clk_init.flags = CLK_IS_CRITICAL;
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
>> +/* Warn on requests to assert or deassert critical resets */
>> +static bool reset_is_critical(unsigned long id)
>> +{
>> +	return WARN_ON(id == RESET_I2C) || WARN_ON(id == RESET_PCIE);
>> +}
>> +
>> +static int reset_manage(struct reset_controller_dev *rcdev,
>> +			unsigned long id, bool assert)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(rcdev->dev);
>> +	const struct reset_init *reset = &reset_init[id];
>> +	u32 mask = reset->mask;
>> +	void __iomem *ioaddr;
>> +	u32 val;
>> +
>> +	if (reset_is_critical(id))
>> +		return 0;		/* Just ignore the request */
>> +
>> +	ioaddr = tc9564_clock->ioaddr + reset->offset;
> 
> AFAIK reset framework does not provide any serialization for reset_control_ops.
> Since multiple reset lines share the same register, reset_manage() is racy and
> multiple calls to reset_control_assert() can write stale values. I think you
> should add a spin_lock here or rely on regmap.

I think you're right.  This was also mentioned by Sashiko.
  >> +
>> +	val = readl(ioaddr);
>> +	if (assert)
>> +		val |= mask;
>> +	else
>> +		val &= ~mask;
>> +	writel(val, ioaddr);
>> +
>> +	return 0;
>> +}
>> +
>> +static int reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	return reset_manage(rcdev, id, true);
>> +}
>> +
>> +static int reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	return reset_manage(rcdev, id, false);
>> +}
>> +
>> +static int reset_status(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(rcdev->dev);
>> +	const struct reset_init *reset = &reset_init[id];
>> +	void __iomem *ioaddr;
>> +
>> +	ioaddr = tc9564_clock->ioaddr + reset->offset;
>> +
>> +	return readl(ioaddr) & reset->mask ? 1 : 0;
>> +}
>> +
>> +static const struct reset_control_ops reset_control_ops = {
>> +	.assert = reset_assert,
>> +	.deassert = reset_deassert,
>> +	.status = reset_status,
>> +};
>> +
>> +static int tc9564_clk_probe(struct platform_device *pdev)
>> +{
>> +	struct clk_hw_onecell_data *clk_data;
>> +	struct reset_controller_dev *rcdev;
>> +	struct tc9564_clock *tc9564_clock;
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	np = dev_of_node(dev);
>> +	if (!np)
>> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
>> +
>> +	tc9564_clock = devm_kzalloc_obj(dev, *tc9564_clock);
>> +	if (!tc9564_clock)
>> +		return -ENOMEM;
>> +
>> +	tc9564_clock->ioaddr = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(tc9564_clock->ioaddr))
>> +		return dev_err_probe(dev, PTR_ERR(tc9564_clock->ioaddr),
>> +				     "failed to map registers\n");
>> +
>> +	clk_data = devm_kzalloc_flex(dev, *tc9564_clock->clk_data, hws,
>> +				     CLOCK_COUNT);
>> +	if (!clk_data)
>> +		return -ENOMEM;
>> +	clk_data->num = CLOCK_COUNT;
>> +
>> +	tc9564_clock->clk_data = clk_data;
>> +
>> +	/* Record the driver data pointer before we register anything */
>> +	dev_set_drvdata(dev, tc9564_clock);
>> +
>> +	/* Initialize all the clocks, then register the provider */
>> +	for (u32 i = 0; i < clk_data->num; i++) {
>> +		const struct clock_init *init = &clock_init[i];
>> +		struct clk_hw *hw;
>> +		char *name;
>> +
>> +		name = kasprintf(GFP_KERNEL, "%s-%s", dev_name(dev), init->name);
> 
> nit: I guess you can use devm_kasprintf() here and get rid of the kfree().

I could, but why not free it right now rather than
holding that memory until the device disappears?

> 
>> +		if (!name)
>> +			return -ENOMEM;
>> +
>> +		if (init->type == PLL)
> 
> nit: I would use a switch here.

I considered a switch but with exactly three options
I prefer this.  I did add critical resets, and they're
handled together with non-critical ones.  I'm not sure
I'll take your suggestion, but... I'll take another look.

>> +			hw = pll_register(dev, name, init);
>> +		else if (init->type == FIXED)
>> +			hw = fixed_register(dev, name, init);
>> +		else
>> +			hw = gate_register(dev, name, init);
> 
> I think this approach is a bit fragile since the clock dependency is guaranteed
> by the order defined in include/dt-bindings/clock/toshiba,tc9564.h, right?

That's right, but those numbers are not going to change.

Nevertheless, you're right and I've been slightly uneasy about relying
on their numeric order.  Let me look at this again.  Maybe I can just
have three groups of clocks (or one PLL and two other groups).

> PLL clock --> fixed clocks --> gate_clocks
> 
> Would it better to enforce it in the code allocating first the PLL out of the
> loop, then fixed rate clocks with a specific routine and, at the end, gate clocks?

Thank you very much for your review Lorenzo.

					-Alex

> Regards,
> Lorenzo
> 
>> +		kfree(name);
>> +
>> +		if (IS_ERR(hw))
>> +			return dev_err_probe(dev, PTR_ERR(hw),
>> +					     "failed to register %s\n",
>> +					     init->name);
>> +		clk_data->hws[i] = hw;
>> +	}
>> +
>> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to add clock provider\n");
>> +
>> +	/* Set up and register the reset controller */
>> +	rcdev = &tc9564_clock->rcdev;
>> +	rcdev->ops = &reset_control_ops;
>> +	rcdev->owner = THIS_MODULE;
>> +	rcdev->dev = dev;
>> +	rcdev->of_node = np;
>> +	rcdev->nr_resets = RESET_COUNT;
>> +
>> +	ret = devm_reset_controller_register(dev, rcdev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to register reset controller\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id tc9564_clock_match[] = {
>> +	{ .compatible = "toshiba,tc9564-clock", },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, tc9564_clock_match);
>> +
>> +static struct platform_driver tc9564_clk_driver = {
>> +	.probe = tc9564_clk_probe,
>> +	.driver = {
>> +		.name = KBUILD_MODNAME,
>> +		.of_match_table = tc9564_clock_match,
>> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>> +	},
>> +};
>> +module_platform_driver(tc9564_clk_driver);
>> +
>> +MODULE_DESCRIPTION("Toshiba TC9564 Clock Driver");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.53.0
>>

