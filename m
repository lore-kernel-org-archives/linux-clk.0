Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596953;
	b=SHQfCGq7LaKArkAGL/dKN6mMZdVgEo+tDw3IarsuaCI3QOM/KrG2++2JPOiSBpDWCRPe
	 LKoYjjEvOROAxCHoF5Hs/Z+Et0BsRZ76jhzo1gjCraZVcXuzYQllFjOTJyD4yuc1iwl9V
	 AORHfBjyZmhqhvMhLzXBxB+8ocp1mes+iNj8yAkd43lU3caNb0wng76uhAWbA09bK7vGe
	 6WDD+xVo1BfvjGyUoDF0nyG/yGy4Lm/u4yXtk3dJPlRAfMki/kN0Uitryv8ESR0Gwhn4O
	 87BB17CC7lHml9pKX4x5NkPp7Hth06v+QRLlv5K2VKNzZDoFkhO00Yj1MpPeBhEt6qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fUL5kQfkQ9GiGhSC3k+Gu/IHE33nByXcPNtKI28GWJQ=;
	b=Avi6iTicuyBAM2/C9vY8wT4XLgguEGjbsVSOgMGmzP/1/PF8KZxe2UIwtb7NnP06nApT
	 h7i0E6VWWUNKCB7pLxcqpOY4ah5OwPhfI7yXelAn+fpwqxua30F55sRNh0hDU5mB5/WNb
	 dve4Z+gMIdabZKNWk4cNG3MI5Fy4xixCKZtRyHghEtlbGDuCnjGVYdy0ygxEjlr4zIVm6
	 sLXU2ihu3Y5f7HopHGdRJY47RzqbFrJP1q9NJ3dUSlgunD4qwirddw0zxfc79EdBu0Utc
	 aOTiqIy+70k5RtvpmsuPm0TTEqIiITGMlTX+qNYdDSydm+TWr7ZzDdyxbuG7uDn7AZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=F3Vp3GhO;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9381606F31B
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 19:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9381606F31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=F3Vp3GhO
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b467581b98so10844545e9.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 11:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794596951; x=1795201751; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fUL5kQfkQ9GiGhSC3k+Gu/IHE33nByXcPNtKI28GWJQ=;
        b=F3Vp3GhOUUQHMxKmC4qYaqYKH9YHV4uzULxmITI4C92OKdKgfhyQT9/cAlEyXlMvV5
         jUWxfotQ+NRE+oiKUeNJgfARw7WlSzQWZwJN5AONzi9IY3Q58poiYYD7hRf3uTpNaDv6
         lAePv7CmSXq8loEzkJzePBx24e3CNPXLgGowCIdXt1FpnA9WucZOBmRdjkoZkNhOtHfh
         Tu9b5EaMPljswjKqI/rqFfo7+Qn33GIALaxP7yUdvZrz27fibU8ikOWwk6xx4aAhsjbl
         VJIlhBl6bAZ1XVOU/IeZhPCIvrSthrCc/9Ai2oo1SkVUlHu6V68dTIynlyzWi+W/GVxE
         FvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596951; x=1795201751;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fUL5kQfkQ9GiGhSC3k+Gu/IHE33nByXcPNtKI28GWJQ=;
        b=x3ocEbrLei6so/VV0zvnpzWqmEEwgTNEDkNFugJsNkfYBSO5OcwAnkZuRtS+/F+uge
         FR1IH7FODn56e0oBZ/2yy7YtceOUHoNjOdXR2+ejTnAaDur3us0CB576v1Dh7iKrB8Us
         SNu7DnqCn0jd1YIuwAOOjYcRTtVBbhW4CvVaavfksD/krALjildzl/zo0WfFskPGwLk1
         5pTm/T3D+2hRGdfKBQ3TZhoBZTpkkcd1ITRGE+z7VYgM0BVOJbeGG9BD2OlMijBU57sG
         IUza8fo1B6GV84I6CS2B7UTgISSzuO3RNPc/ty417CHqtkJD7sA7iBiR28W5MZILobJ+
         VWLQ==
X-Forwarded-Encrypted: i=1; AL+hErGw2iuC+SeQEdiLqgHdYWyLgWWNkKgTSI2zJAVc3I03D5hsCFvqkGW77Hseua2FobYOlcuAakLNNgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mYGw2IbjLIJgl8nlF9BVCxMDqZOAc2i/rwzZ5v6kZYL93GoA7
	/UKo4fls55as359FywYXqSb0nQSGhC5lbCLdcWeLDZ7oOd/GwqyUjcNbxcJ+V0McjfE=
X-Gm-Gg: AYBFou1X5im/FPcr/2N43xoXhcyQsoWDFjME3QnJKp7eeYu8frKCJ77XW+QkM8K9jtV
	R8sTLhZDLmNtmSgUca6Fgmu3hE7CAoaeqlN4mYeYku9I9eJ0JrGUFron9uS3bXhH6t7x0v02xOy
	OBKcanEPS8wg3TWepMyFFqISFrNmuNNBo3866hTHEWhI94ipZwV4h5ZAMFnKogbBIoDocytpdqv
	F6GoeUELv64dCWPQqrc0cwXrju9erEzP0AYsAikKMJAMtNHhJCjvCIKGj8MC25Kvvg9RknGPKuZ
	EYGBt002cHAUdabdfXob+Qg+fIaEW6TT49C+5brjB1Au40m+Fsnqn396Lf7zmcadZ9Ir/AmWSui
	gyJ4DoI2knIvMpL4f10Gdh+33ZhhpDIJet9Mjs19R2uLpVj7CR02qQtUlQWbST4PSH3MEf/6/24
	b7v501cTCzFJjZ01jTWlxM1gGjwTuviVXGdX6YGLN0GI7MfmfvuIFk0RTcI03ctpg3sPQzY3Gr7
	cAK47svU+wThOlqaggX6TxEYQ3Kyaw3jk6ZJatgRP/eUj3zr+3f2UrfbUnGF3NpKWJ2BrtVkn/6
	HwlWasiaW1cl4pjCb8zs4CVUTVS06aYBmZwAZeYWeGKtj/voVPrhMu/KChPxilkQn2U7fA==
X-Received: by 2002:a05:600c:8b05:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4bb55a66011mr73643995e9.8.1794596951192;
        Fri, 13 Nov 2026 11:09:11 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm183958705e9.2.2026.11.13.11.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:09:10 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, 
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com, 
 alexandre.torgue@foss.st.com, marex@nabladev.com, 
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104004332.2141282-4-elder@riscstar.com>
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-4-elder@riscstar.com>
Date: Fri, 13 Nov 2026 20:09:08 +0100
Message-Id: <179459694822.2573818.15451444985369018378.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=12040; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=eRhEKBAsO2K47GZzKlLEk56eRTDkQSpuvJ0kQ+F+HQc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFnfE0LzmD6LPtTt7xG2V/zGvWJVs/8VHo99llZOVzhCN
 FXPh6zvKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwETCEhkZfmT4acQwJDEtuiVz
 4m+//quFZ+TS5scmnKxs/ukm8UHXh+Gfbl7pr5CzN/+dUHtxMqfJ241DKlTYrijUx0Tnc3vThr0
 cAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Define a new platform driver that manages clocks implemented by the
> Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
> and disabled, but currently only the clocks that are (or will soon
> be) used are defined to be controllable.
> 
> Two registers manage the state of the clocks.  The registers are
> accessed via a regmap supplied by a system controller.  Access to
> the memory region is provided via a BAR on a PCIe endpoint function
> embedded in the TC9564 SoC.
> 
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  MAINTAINERS              |   7 +
>  drivers/clk/Kconfig      |  12 ++
>  drivers/clk/Makefile     |   1 +
>  drivers/clk/clk-tc9564.c | 288 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 308 insertions(+)
>  create mode 100644 drivers/clk/clk-tc9564.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c25ee6e0f1c6..ee01aed56508 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28332,6 +28332,13 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
>  F:	drivers/media/i2c/tc358743*
>  F:	include/media/i2c/tc358743.h
>  
> +TOSHIBA TC9564 CLOCK DRIVER
> +M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> +M:	Alex Elder <elder@kernel.org>
> +M:	Daniel Thompson <danielt@kernel.org>
> +S:	Maintained
> +F:	drivers/clk/clk-tc9564.c
> +
>  TOSHIBA TC9564 PCI DRIVER
>  M:	Alex Elder <elder@kernel.org>
>  M:	Daniel Thompson <danielt@kernel.org>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 37a8e35d4178..0d186150d0c7 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -293,6 +293,18 @@ config COMMON_CLK_S2MPS11
>  	  clock. These multi-function devices have two (S2MPS14) or three
>  	  (S2MPS11, S5M8767) fixed-rate oscillators, clocked at 32KHz each.
>  
> +config COMMON_CLK_TC9564
> +	tristate "Toshiba TC9564 clock support"
> +	depends on SOC_TOSHIBA_TC9564_SYSCON

You agreed to add COMPILE_TEST on v3 but it is still missing now.

If have a good reason to ignore or disregard something we agreed on,
it should be clearly flagged.

> +	select MFD_SYSCON
> +	default SOC_TOSHIBA_TC9564_SYSCON
> +	help
> +	  This enables support for the clock controller embedded in the
> +	  Toshiba TC9564 SoC.  The state of each clock is controlled via
> +	  MMIO to a region managed by a system controller; this ensures
> +	  access to the region is coordinated between this and the reset
> +	  and XGMAC (stmmac) drivers.

As Philipp said, the 2nd part of description is not appropriate as a config
description.

> +
>  config CLK_TWL
>  	tristate "Clock driver for the TWL PMIC family"
>  	depends on TWL4030_CORE
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 52d138d4ffc8..a11a8326d79c 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -111,6 +111,7 @@ obj-$(CONFIG_COMMON_CLK_SI570)		+= clk-si570.o
>  obj-$(CONFIG_COMMON_CLK_SP7021)		+= clk-sp7021.o
>  obj-$(CONFIG_COMMON_CLK_STM32F)		+= clk-stm32f4.o
>  obj-$(CONFIG_COMMON_CLK_STM32H7)	+= clk-stm32h7.o
> +obj-$(CONFIG_COMMON_CLK_TC9564)		+= clk-tc9564.o
>  obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
>  obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
>  obj-$(CONFIG_CLK_TWL)			+= clk-twl.o
> diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
> new file mode 100644
> index 000000000000..8eeba8591970
> --- /dev/null
> +++ b/drivers/clk/clk-tc9564.c
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>

Not needed, this driver does not use the consumer API.

> +#include <linux/clk-provider.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/soc/toshiba,tc9564.h>
> +
> +/*
> + * The full name of every clock has a prefix "tc9564" followed by a single
> + * character ('a', 'b', etc.) that differs for each chip/device number.
> + * Each clock's "name" defines the unique portion of the clock's full name.
> + */
> +#define FULL_NAME_SIZE	24	/* Enough for formatted full name */
> +#define NAME_SIZE	12	/* Unique portion of the clock name */
> +#define FORMAT_FULL_NAME(_full_name, _id, _name)		\
> +	snprintf(_full_name, FULL_NAME_SIZE, "tc9564%c_%.*s",	\
> +		'a' + (_id), NAME_SIZE, _name)

dev->id will always be zero coming from a platform driver and this code is a lot of churn
hidden in a macro. If you must factorize this (I don't think you do) make it a function

something like snprintf(name, sizeof(name), "%s-%s", dev_name(dev), init->name)
should be enough. use kasprintf if you can't predict the size.

> +
> +/* Two registers control whether gate clocks are enabled */
> +#define CLK_CTRL0_OFFSET	0x1004	/* Common and MAC0 gate clocks */
> +#define CLK_CTRL1_OFFSET	0x100c	/* MAC1 gate clocks */
> +
> +enum clock_type { PLL, FIXED, GATE };
> +
> +struct tc9564_clock {
> +	struct regmap *regmap;
> +	struct clk_hw_onecell_data *clk_data;
> +};
> +
> +struct gate_clock {
> +	struct clk_hw hw;
> +	const struct clock_init *init;
> +};
> +
> +struct clock_init {
> +	const char name[NAME_SIZE];

just const char *name ... you are asking for trouble with this.

> +	enum clock_type type;
> +	union {
> +		u32 mult;	/* PLL rate multiplier */
> +
> +		u32 div;	/* Fixed rate clock divider */
> +
> +		struct {	/* Gate clock */
> +			u16 parent;	/* Parent clock ID, e.g. CLOCK_50M */
> +			u16 offset;	/* CLK_CTRL0_OFFSET/CLK_CTRL1_OFFSET */
> +			u32 mask;
> +		};
> +	};
> +};
> +
> +/* There is only one PLL */
> +#define PLL_INIT(_name, _mult)				\
> +	[CLOCK_##_name] = {				\
> +		.name = #_name,				\
> +		.type = PLL,				\
> +		.mult = (_mult),			\
> +	}
> +
> +/* The PLL is the parent of all the fixed rate clocks */
> +#define FIXED_INIT(_name, _div)				\
> +	[CLOCK_##_name] = {				\
> +		.name = #_name,				\
> +		.type = FIXED,				\
> +		.div = (_div),				\
> +	}
> +
> +#define GATE_INIT0(_name, _bit, _pname)	__GATE_INIT(_name, 0, _bit, _pname)
> +#define GATE_INIT1(_name, _bit, _pname)	__GATE_INIT(_name, 1, _bit, _pname)

So you are writing the param in the name  ? what is the point of that ?

> +#define __GATE_INIT(_name, _reg, _bit, _pname)		\
> +	[CLOCK_##_name] = {				\
> +		.name = #_name,				\
> +		.type = GATE,				\
> +		.parent = CLOCK_##_pname,		\
> +		.offset = CLK_CTRL ## _reg ## _OFFSET,	\
> +		.mask = BIT(_bit),			\
> +	}
> +
> +/*
> + * Clocks are initialized and registered in the order of their IDs.
> + * Parent clocks must be registered before their children.
> + */
> +static const struct clock_init clock_init[] = {
> +	PLL_INIT(PLL, 50),
> +
> +	FIXED_INIT(62_5M, 20),

Just pass literals here, and show it the table. you can then pass real name, not 125M which is very
much tied to your ids.

> +	FIXED_INIT(125M, 10),
> +	FIXED_INIT(250M, 5),
> +	FIXED_INIT(312_5M, 4),
> +
> +	GATE_INIT0(MSIGEN, 18, 62_5M),
> +
> +	GATE_INIT0(MAC0_TX, 7, 250M),
> +	GATE_INIT0(MAC0_RX, 14, 250M),
> +	GATE_INIT0(MAC0_125M, 29, 125M),
> +	GATE_INIT0(MAC0_312_5M, 30, 312_5M),
> +	GATE_INIT0(MAC0_ALL, 31, 250M),
> +
> +	GATE_INIT1(MAC1_TX, 7, 250M),
> +	GATE_INIT1(MAC1_RX, 14, 250M),
> +	GATE_INIT1(MAC1_125M, 29, 125M),
> +	GATE_INIT1(MAC1_312_5M, 30, 312_5M),
> +	GATE_INIT1(MAC1_ALL, 31, 250M),
> +	GATE_INIT1(MAC1_RMII, 15, 125M),
> +};

Could you explain why clock PCIe and I2C that where critical
in the previous version have been left out ? they are not critical anymore ?


> +#define CLOCK_COUNT	ARRAY_SIZE(clock_init)
> +
> +/* Parent is the input oscillator running at 25 MHz; PLL runs at 1250 MHz */
> +static struct clk_hw *pll_register(struct device *dev,
> +				   const struct clock_init *init)
> +{
> +	char full_name[FULL_NAME_SIZE];
> +
> +	FORMAT_FULL_NAME(full_name, dev->id, init->name);
> +
> +	return devm_clk_hw_register_fixed_factor_index(dev, full_name, 0, 0,
> +						       init->mult, 1);
> +}
> +
> +/* The PLL is the parent of all fixed clocks */
> +static struct clk_hw *fixed_register(struct device *dev,
> +				     const struct clock_init *init)
> +{
> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(dev);
> +	char full_name[FULL_NAME_SIZE];
> +	struct clk_hw *pll_hw;
> +
> +	FORMAT_FULL_NAME(full_name, dev->id, init->name);
> +
> +	pll_hw = tc9564_clock->clk_data->hws[CLOCK_PLL];
> +
> +	return devm_clk_hw_register_fixed_factor_parent_hw(dev, full_name,
> +							   pll_hw, 0,
> +							   1, init->div);
> +}
> +
> +static const struct gate_clock *hw_to_gate_clock(struct clk_hw *hw)
> +{
> +	return container_of_const(hw, struct gate_clock, hw);
> +}
> +
> +static void gate_clk_manage(struct clk_hw *hw, bool enable)
> +{
> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(clk_hw_get_dev(hw));
> +	const struct gate_clock *clock = hw_to_gate_clock(hw);
> +	u32 mask = clock->init->mask;
> +
> +	regmap_update_bits(tc9564_clock->regmap, clock->init->offset, mask,
> +			   enable ? mask : 0);

how about returning the error if any ?

> +}
> +
> +static int gate_clk_enable(struct clk_hw *hw)
> +{
> +	gate_clk_manage(hw, true);
> +
> +	return 0;
> +}
> +
> +static void gate_clk_disable(struct clk_hw *hw)
> +{
> +	gate_clk_manage(hw, false);
> +}
> +
> +static int gate_clk_is_enabled(struct clk_hw *hw)
> +{
> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(clk_hw_get_dev(hw));
> +	const struct gate_clock *clock = hw_to_gate_clock(hw);
> +	u32 val;
> +
> +	regmap_read(tc9564_clock->regmap, clock->init->offset, &val);

here too

> +
> +	return val & clock->init->mask ? 1 : 0;

you might be using val uninitialised here.

> +}
> +
> +static const struct clk_ops gate_clk_ops = {
> +	.enable = gate_clk_enable,
> +	.disable = gate_clk_disable,
> +	.is_enabled = gate_clk_is_enabled,
> +};
> +
> +static struct clk_hw *gate_register(struct device *dev,
> +				    const struct clock_init *init)
> +{
> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(dev);
> +	struct clk_init_data clk_init = { };
> +	const struct clk_hw *parent_hw;
> +	char full_name[FULL_NAME_SIZE];
> +	struct gate_clock *clock;
> +	int ret;
> +
> +	clock = devm_kzalloc_obj(dev, *clock);
> +	if (!clock)
> +		return ERR_PTR(-ENOMEM);
> +
> +	FORMAT_FULL_NAME(full_name, dev->id, init->name);
> +
> +	parent_hw = tc9564_clock->clk_data->hws[init->parent];
> +
> +	clk_init.name = full_name;
> +	clk_init.ops = &gate_clk_ops;
> +	clk_init.parent_hws = &parent_hw;
> +	clk_init.num_parents = 1;
> +
> +	clock->hw.init = &clk_init;
> +	clock->init = init;
> +
> +	ret = devm_clk_hw_register(dev, &clock->hw);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return &clock->hw;
> +}
> +
> +static int tc9564_clk_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	struct tc9564_clock *tc9564_clock;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *parent_np;
> +	int ret;
> +
> +	parent_np = dev_of_node(dev->parent);
> +	if (!parent_np)
> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
> +
> +	tc9564_clock = devm_kzalloc_obj(dev, *tc9564_clock);
> +	if (!tc9564_clock)
> +		return -ENOMEM;
> +
> +	/* Note: MMIO regmap (no error checking needed when used) */
> +	tc9564_clock->regmap = device_node_to_regmap(parent_np);
> +	if (IS_ERR(tc9564_clock->regmap))
> +		return dev_err_probe(dev, PTR_ERR(tc9564_clock->regmap),
> +				     "failed to get config regmap\n");

If the parent registers the regmap you can get it with dev_get_regmap(dev->parent, NULL)
with no syscon dep.

-- 
Jerome

