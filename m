Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADECB2F5473
	for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 09:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976402; cv=none; b=X3NFfEjUZSf81NG4JI5wjB59rFRaCSCCNucTGRB3c9aA6f94rSCdEwnSc2bjhrAiwQxQTe4IAWIl+Zye9SLH3xZAZbDMYja9DDKxOoQUbsv8Y8rakqMKGHR499uNDNa2DmKk+HE+aDiP/jUubErjzKocl/eegJ0pINI6JeIPnjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976402; c=relaxed/simple;
	bh=aO0xTpzyoxPb+ebNFdsdTlQuSxjcQSVJzsbBRTjzVUs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QBZZ4eUvUdVMpnESzwOgkDLzzxorTo2EGhAx56JhRFKphoA2ZoktDq2dfw+oRn0AnQyb+cmNEH2/5tXh3MI31Bsb45oo0BKGr71fY49NnKvpRpkWwHb5a7VOc7OEl8Lq/150LlFH0VGkED4OucIK0KM5LVk3b/VoS4Brxrm3o6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZlkZvNWT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZlkZvNWT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so25940165e9.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 01:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763976395; x=1764581195; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U1MsvOkvY0k2X769TfRivDRIjdc4gRIxH1Da4VZs1TU=;
        b=ZlkZvNWTZQK95UiejtGfoiKtjsgEQzZmV/r4I1zHIFL2SHdt02Z3af2835z7SSZBx2
         nautRqb6iY57mXZPwg/6fT7PrwBpj97926BUNA8yXYC/x1aShoG3RwxkuoKb8O0T4d9J
         b3ECvQy15AO5scoo7vkdPX40KRoc91nfIkaBYlO9M4a06SSqT7MGZ9Kq8sV3JAp5Wq1a
         xPvwmHojX+zXGUBQw6xSj6XIAdTfdB9UdiGOP0LJgsVqHexgfmOEcQc5u85FQQjElwkk
         bHiI5o6xDIc9BHd6GEC6F+G0iHBaEg5UIxQSeDmpa1J85O/jKrCQHe1g4sFRu0ItiOPe
         IjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976395; x=1764581195;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U1MsvOkvY0k2X769TfRivDRIjdc4gRIxH1Da4VZs1TU=;
        b=aCFbPdjjqgwiEivUvNJkE27ouuWiW5FlT83r9OISV+ts+N/qt5A21a2DLEnbhXOcur
         QjzcZ/KFJhrBElSc8fIH3xY1zEgzPfviZn96is9nFzzjxRg8ej6IdisKUZYgZNFfFoS0
         jSKXnvivOZEwOTh/G65Joujlztq8iZd5WUZfV/tPXLO5bQ/BTjUWUdt7xEBGKKtSPfp6
         KwmthtIK9wBQ1aqsXilGA4YXesefkbZPHKGnJamgnJTBWhF4AdXfcbmMxs4qnnowpsmS
         83cvorX8uF41jwFga0upvWnXFVrhdJa5UHSDu/XwDwy1o/9gdEmZSCszOUNT2EGVNY6N
         Lw7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4Jj6e2NxR+CMECoqy0dzVL2M9OMWlfKFCLmpksQ5BNc+V0BMLGFEa+b+fAcnmzir5VXMBEFbqsxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YycSlaJd7DsUkfnWt9pqDN6NrQTEoq3LvBday0cChzZzF8OrMpX
	XN9I4oJAhbpJ80IUJXaU6r0edjoQOji3XB3Ca1za/Ujjsc2EglDGx8b+PADxyfTHg/Q=
X-Gm-Gg: ASbGncvKceIAL5r/HVCHibHuGHv7aGD5A592qGWFBQMHTPJF86gunlKfomSZ9fawO0I
	iZU82/v6weHoABw4nYEJ3w6Zq5IayW2Z0EEq5fzCNdTPvQx5Q6znWdRGfFf829Oo34Tx5HLgaeR
	rgq7a3gPJNKalun+HyOFiiaJU8vOUtbsWQPFU/IwgS7aSFvY9iwQ7zJ4UnDCk/sA5H1XNlDneta
	cZyK/aiQOSPYmQ7WH09p+YVR2kaaBCXxIdlcwJfuy+tazolEfBHt0BIsgcTf/r/vJciv7tQQHAq
	/jOXPKnZ3qXsfNscuJ8xtOfz79zomad+uuaLlUUc4TGebG93Iwisw3sU2qwqxOaHpRe38SLGl6o
	GoVgvHE8yMYUqWJWuZ/abAR6rLm36Ss+aZaiokAz+MQpvPPInn2LWP+SRSa45xIdCEFwwcvlgmR
	7mgbqZSezAeA==
X-Google-Smtp-Source: AGHT+IFA6RvzcWL7SV4PhOa1l4cOrOZaMwrOpdRtONh9euKXAAoa1cN4d9OgvE8FKw3tGhlOJ4g8QQ==
X-Received: by 2002:a05:600c:1909:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-477c11337e0mr111008585e9.31.1763976394379;
        Mon, 24 Nov 2025 01:26:34 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:4e2e:74ae:77df:106f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477bf3af0e1sm182199065e9.10.2025.11.24.01.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:26:33 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Chuan Liu
 <chuan.liu@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  "Stephen Boyd" <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  "Dmitry Rokosov"
 <ddrokosov@sberdevices.ru>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 4/5] clk: meson: t7: add support for the T7 SoC PLL
 clock
In-Reply-To: <20251121105934.1759745-5-jian.hu@amlogic.com> (Jian Hu's message
	of "Fri, 21 Nov 2025 18:59:33 +0800")
References: <20251121105934.1759745-1-jian.hu@amlogic.com>
	<20251121105934.1759745-5-jian.hu@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 24 Nov 2025 10:26:33 +0100
Message-ID: <1ja50bvl12.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 21 Nov 2025 at 18:59, Jian Hu <jian.hu@amlogic.com> wrote:

> Add PLL clock controller driver for the Amlogic T7 SoC family.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/Kconfig  |   14 +
>  drivers/clk/meson/Makefile |    1 +
>  drivers/clk/meson/t7-pll.c | 1068 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1083 insertions(+)
>  create mode 100644 drivers/clk/meson/t7-pll.c
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 71481607a6d5..6cdc6a96e105 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -201,4 +201,18 @@ config COMMON_CLK_S4_PERIPHERALS
>  	help
>  	  Support for the peripherals clock controller on Amlogic S805X2 and S905Y4
>  	  devices, AKA S4. Say Y if you want S4 peripherals clock controller to work.
> +
> +config COMMON_CLK_T7_PLL
> +	tristate "Amlogic T7 SoC PLL controller support"
> +	depends on ARM64
> +	default ARCH_MESON
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_CLKC_UTILS
> +	select COMMON_CLK_MESON_PLL
> +	imply COMMON_CLK_SCMI
> +	help
> +	  Support for the PLL clock controller on Amlogic A311D2 based
> +	  device, AKA T7. PLLs are required by most peripheral to operate
> +	  Say Y if you are a T7 based device.
> +
>  endmenu
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index c6998e752c68..8e3f7f94c639 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -26,3 +26,4 @@ obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
>  obj-$(CONFIG_COMMON_CLK_S4_PLL) += s4-pll.o
>  obj-$(CONFIG_COMMON_CLK_S4_PERIPHERALS) += s4-peripherals.o
> +obj-$(CONFIG_COMMON_CLK_T7_PLL) += t7-pll.o
> diff --git a/drivers/clk/meson/t7-pll.c b/drivers/clk/meson/t7-pll.c
> new file mode 100644
> index 000000000000..bee8a7489371
> --- /dev/null
> +++ b/drivers/clk/meson/t7-pll.c
> @@ -0,0 +1,1068 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2024-2025 Amlogic, Inc. All rights reserved.
> + * Author: Jian Hu <jian.hu@amlogic.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include "clk-regmap.h"
> +#include "clk-pll.h"
> +#include "clk-mpll.h"
> +#include "meson-clkc-utils.h"
> +#include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
> +
> +#define GP0PLL_CTRL0		0x00
> +#define GP0PLL_CTRL1		0x04
> +#define GP0PLL_CTRL2		0x08
> +#define GP0PLL_CTRL3		0x0c
> +#define GP0PLL_CTRL4		0x10
> +#define GP0PLL_CTRL5		0x14
> +#define GP0PLL_CTRL6		0x18
> +#define GP0PLL_STS		0x1c

A new line between each register region would help readability

> +#define GP1PLL_CTRL0		0x00
> +#define GP1PLL_CTRL1		0x04
> +#define GP1PLL_CTRL2		0x08
> +#define GP1PLL_CTRL3		0x0c
> +#define GP1PLL_STS		0x1c
> +#define HIFIPLL_CTRL0		0x00
> +#define HIFIPLL_CTRL1		0x04
> +#define HIFIPLL_CTRL2		0x08
> +#define HIFIPLL_CTRL3		0x0c
> +#define HIFIPLL_CTRL4		0x10
> +#define HIFIPLL_CTRL5		0x14
> +#define HIFIPLL_CTRL6		0x18
> +#define HIFIPLL_STS		0x1c
> +#define PCIEPLL_CTRL0		0x00
> +#define PCIEPLL_CTRL1		0x04
> +#define PCIEPLL_CTRL2		0x08
> +#define PCIEPLL_CTRL3		0x0c
> +#define PCIEPLL_CTRL4		0x10
> +#define PCIEPLL_CTRL5		0x14
> +#define PCIEPLL_STS		0x18
> +#define MPLL_CTRL0		0x00
> +#define MPLL_CTRL1		0x04
> +#define MPLL_CTRL2		0x08
> +#define MPLL_CTRL3		0x0c
> +#define MPLL_CTRL4		0x10
> +#define MPLL_CTRL5		0x14
> +#define MPLL_CTRL6		0x18
> +#define MPLL_CTRL7		0x1c
> +#define MPLL_CTRL8		0x20
> +#define MPLL_STS		0x24
> +#define HDMIPLL_CTRL0		0x00
> +#define HDMIPLL_CTRL1		0x04
> +#define HDMIPLL_CTRL2		0x08
> +#define HDMIPLL_CTRL3		0x0c
> +#define HDMIPLL_CTRL4		0x10
> +#define HDMIPLL_CTRL5		0x14
> +#define HDMIPLL_CTRL6		0x18
> +#define HDMIPLL_STS		0x1c
> +#define MCLK_PLL_CNTL0		0x00
> +#define MCLK_PLL_CNTL1		0x04
> +#define MCLK_PLL_CNTL2		0x08
> +#define MCLK_PLL_CNTL3		0x0c
> +#define MCLK_PLL_CNTL4		0x10
> +#define MCLK_PLL_STS		0x14
> +
> +static const struct pll_mult_range t7_media_pll_mult_range = {
> +	.min = 125,
> +	.max = 250,
> +};
> +
> +static const struct reg_sequence t7_gp0_init_regs[] = {
> +	{ .reg = GP0PLL_CTRL1,  .def = 0x00000000 },
> +	{ .reg = GP0PLL_CTRL2,  .def = 0x00000000 },
> +	{ .reg = GP0PLL_CTRL3,  .def = 0x48681c00 },
> +	{ .reg = GP0PLL_CTRL4,  .def = 0x88770290 },
> +	{ .reg = GP0PLL_CTRL5,  .def = 0x3927200a },
> +	{ .reg = GP0PLL_CTRL6,  .def = 0x56540000 },
> +};
> +
> +static struct clk_regmap t7_gp0_pll_dco = {
> +	.data = &(struct meson_clk_pll_data){
> +		.en = {
> +			.reg_off = GP0PLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = GP0PLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 8,
> +		},
> +		.n = {
> +			.reg_off = GP0PLL_CTRL0,
> +			.shift   = 10,
> +			.width   = 5,
> +		},
> +		.l = {
> +			.reg_off = GP0PLL_STS,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = GP0PLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.range = &t7_media_pll_mult_range,
> +		.init_regs = t7_gp0_init_regs,
> +		.init_count = ARRAY_SIZE(t7_gp0_init_regs),
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gp0_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "in0",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_gp0_pll = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = GP0PLL_CTRL0,
> +		.shift = 16,
> +		.width = 3,
> +		.flags = CLK_DIVIDER_POWER_OF_TWO,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "gp0_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_gp0_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +/*
> + * The gp1 pll IP is different with gp0 pll, the PLL DCO range is
> + * 1.6GHZ - 3.2GHZ, and the reg_sequence is short
> + */

Nitpick: if you are not going to explain why the reg_sequence is short
the last part of the comment is not very useful.

> +static const struct pll_mult_range t7_gp1_pll_mult_range = {
> +	.min = 67,
> +	.max = 133,
> +};
> +
> +static const struct reg_sequence t7_gp1_init_regs[] = {
> +	{ .reg = GP1PLL_CTRL1,  .def = 0x1420500f },
> +	{ .reg = GP1PLL_CTRL2,  .def = 0x00023001 },
> +	{ .reg = GP1PLL_CTRL3,  .def = 0x00000000 },
> +};
> +
> +static struct clk_regmap t7_gp1_pll_dco = {
> +	.data = &(struct meson_clk_pll_data){
> +		.en = {
> +			.reg_off = GP1PLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = GP1PLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 8,
> +		},
> +		.n = {
> +			.reg_off = GP1PLL_CTRL0,
> +			.shift   = 16,
> +			.width   = 5,
> +		},
> +		.l = {
> +			.reg_off = GP1PLL_STS,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = GP1PLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.range = &t7_gp1_pll_mult_range,
> +		.init_regs = t7_gp1_init_regs,
> +		.init_count = ARRAY_SIZE(t7_gp1_init_regs),
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gp1_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "in0",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_gp1_pll = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = GP1PLL_CTRL0,
> +		.shift = 12,
> +		.width = 3,
> +		.flags = CLK_DIVIDER_POWER_OF_TWO,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "gp1_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_gp1_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct reg_sequence t7_hifi_init_regs[] = {
> +	{ .reg = HIFIPLL_CTRL1, .def = 0x00000000 },
> +	{ .reg = HIFIPLL_CTRL2, .def = 0x00000000 },
> +	{ .reg = HIFIPLL_CTRL3, .def = 0x6a285c00 },
> +	{ .reg = HIFIPLL_CTRL4, .def = 0x65771290 },
> +	{ .reg = HIFIPLL_CTRL5, .def = 0x3927200a },
> +	{ .reg = HIFIPLL_CTRL6, .def = 0x56540000 }
> +};
> +
> +static struct clk_regmap t7_hifi_pll_dco = {
> +	.data = &(struct meson_clk_pll_data){
> +		.en = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 8,
> +		},
> +		.n = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 10,
> +			.width   = 5,
> +		},
> +		.frac = {
> +			.reg_off = HIFIPLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 17,
> +		},
> +		.l = {
> +			.reg_off = HIFIPLL_STS,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.range = &t7_media_pll_mult_range,
> +		.init_regs = t7_hifi_init_regs,
> +		.init_count = ARRAY_SIZE(t7_hifi_init_regs),
> +		.frac_max = 100000,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "hifi_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "in0",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_hifi_pll = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HIFIPLL_CTRL0,
> +		.shift = 16,
> +		.width = 2,
> +		.flags = CLK_DIVIDER_POWER_OF_TWO,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_hifi_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +/*
> + * The T7 PCIE PLL is fined tuned to deliver a very precise
> + * 100MHz reference clock for the PCIe Analog PHY, and thus requires
> + * a strict register sequence to enable the PLL.
> + */
> +static const struct reg_sequence t7_pcie_pll_init_regs[] = {
> +	{ .reg = PCIEPLL_CTRL0,	.def = 0x200c04c8 },
> +	{ .reg = PCIEPLL_CTRL0,	.def = 0x300c04c8 },
> +	{ .reg = PCIEPLL_CTRL1,	.def = 0x30000000 },
> +	{ .reg = PCIEPLL_CTRL2,	.def = 0x00001100 },
> +	{ .reg = PCIEPLL_CTRL3,	.def = 0x10058e00 },
> +	{ .reg = PCIEPLL_CTRL4,	.def = 0x000100c0 },
> +	{ .reg = PCIEPLL_CTRL5,	.def = 0x68000048 },
> +	{ .reg = PCIEPLL_CTRL5,	.def = 0x68000068, .delay_us = 20 },
> +	{ .reg = PCIEPLL_CTRL4,	.def = 0x008100c0, .delay_us = 20 },
> +	{ .reg = PCIEPLL_CTRL0,	.def = 0x340c04c8 },
> +	{ .reg = PCIEPLL_CTRL0,	.def = 0x140c04c8, .delay_us = 20 },
> +	{ .reg = PCIEPLL_CTRL2,	.def = 0x00001000 }
> +};
> +
> +static struct clk_regmap t7_pcie_pll_dco = {
> +	.data = &(struct meson_clk_pll_data){
> +		.en = {
> +			.reg_off = PCIEPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = PCIEPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 8,
> +		},
> +		.n = {
> +			.reg_off = PCIEPLL_CTRL0,
> +			.shift   = 10,
> +			.width   = 5,
> +		},
> +		.l = {
> +			.reg_off = PCIEPLL_CTRL0,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = PCIEPLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.init_regs = t7_pcie_pll_init_regs,
> +		.init_count = ARRAY_SIZE(t7_pcie_pll_init_regs),
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "pcie_pll_dco",
> +		.ops = &meson_clk_pcie_pll_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "in0",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_pcie_pll_dco_div2 = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "pcie_pll_dco_div2",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_pcie_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap t7_pcie_pll_od = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = PCIEPLL_CTRL0,
> +		.shift = 16,
> +		.width = 5,
> +		/* the divisor is 32 when [16:21] = 0 */
> +		.flags = CLK_DIVIDER_MAX_AT_ZERO,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "pcie_pll_od",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_pcie_pll_dco_div2.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_pcie_pll = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "pcie_pll",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_pcie_pll_od.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_mpll_prediv = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll_prediv",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "in0",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static const struct reg_sequence t7_mpll0_init_regs[] = {
> +	{ .reg = MPLL_CTRL2, .def = 0x40000033 }
> +};
> +
> +static struct clk_regmap t7_mpll0_div = {
> +	.data = &(struct meson_clk_mpll_data){
> +		.sdm = {
> +			.reg_off = MPLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 14,
> +		},
> +		.sdm_en = {
> +			.reg_off = MPLL_CTRL1,
> +			.shift   = 30,
> +			.width	 = 1,
> +		},
> +		.n2 = {
> +			.reg_off = MPLL_CTRL1,
> +			.shift   = 20,
> +			.width   = 9,
> +		},
> +		.ssen = {
> +			.reg_off = MPLL_CTRL1,
> +			.shift   = 29,
> +			.width	 = 1,
> +		},
> +		.init_regs = t7_mpll0_init_regs,
> +		.init_count = ARRAY_SIZE(t7_mpll0_init_regs),
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll0_div",
> +		.ops = &meson_clk_mpll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_mpll_prediv.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_mpll0 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = MPLL_CTRL1,
> +		.bit_idx = 31,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll0",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) { &t7_mpll0_div.hw },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct reg_sequence t7_mpll1_init_regs[] = {
> +	{ .reg = MPLL_CTRL4,	.def = 0x40000033 }
> +};
> +
> +static struct clk_regmap t7_mpll1_div = {
> +	.data = &(struct meson_clk_mpll_data){
> +		.sdm = {
> +			.reg_off = MPLL_CTRL3,
> +			.shift   = 0,
> +			.width   = 14,
> +		},
> +		.sdm_en = {
> +			.reg_off = MPLL_CTRL3,
> +			.shift   = 30,
> +			.width	 = 1,
> +		},
> +		.n2 = {
> +			.reg_off = MPLL_CTRL3,
> +			.shift   = 20,
> +			.width   = 9,
> +		},
> +		.ssen = {
> +			.reg_off = MPLL_CTRL3,
> +			.shift   = 29,
> +			.width	 = 1,
> +		},
> +		.init_regs = t7_mpll1_init_regs,
> +		.init_count = ARRAY_SIZE(t7_mpll1_init_regs),
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll1_div",
> +		.ops = &meson_clk_mpll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_mpll_prediv.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_mpll1 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = MPLL_CTRL3,
> +		.bit_idx = 31,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll1",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) { &t7_mpll1_div.hw },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct reg_sequence t7_mpll2_init_regs[] = {
> +	{ .reg = MPLL_CTRL6, .def = 0x40000033 }
> +};
> +
> +static struct clk_regmap t7_mpll2_div = {
> +	.data = &(struct meson_clk_mpll_data){
> +		.sdm = {
> +			.reg_off = MPLL_CTRL5,
> +			.shift   = 0,
> +			.width   = 14,
> +		},
> +		.sdm_en = {
> +			.reg_off = MPLL_CTRL5,
> +			.shift   = 30,
> +			.width	 = 1,
> +		},
> +		.n2 = {
> +			.reg_off = MPLL_CTRL5,
> +			.shift   = 20,
> +			.width   = 9,
> +		},
> +		.ssen = {
> +			.reg_off = MPLL_CTRL5,
> +			.shift   = 29,
> +			.width	 = 1,
> +		},
> +		.init_regs = t7_mpll2_init_regs,
> +		.init_count = ARRAY_SIZE(t7_mpll2_init_regs),
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll2_div",
> +		.ops = &meson_clk_mpll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_mpll_prediv.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_mpll2 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = MPLL_CTRL5,
> +		.bit_idx = 31,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll2",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) { &t7_mpll2_div.hw },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct reg_sequence t7_mpll3_init_regs[] = {
> +	{ .reg = MPLL_CTRL8, .def = 0x40000033 }
> +};
> +
> +static struct clk_regmap t7_mpll3_div = {
> +	.data = &(struct meson_clk_mpll_data){
> +		.sdm = {
> +			.reg_off = MPLL_CTRL7,
> +			.shift   = 0,
> +			.width   = 14,
> +		},
> +		.sdm_en = {
> +			.reg_off = MPLL_CTRL7,
> +			.shift   = 30,
> +			.width	 = 1,
> +		},
> +		.n2 = {
> +			.reg_off = MPLL_CTRL7,
> +			.shift   = 20,
> +			.width   = 9,
> +		},
> +		.ssen = {
> +			.reg_off = MPLL_CTRL7,
> +			.shift   = 29,
> +			.width	 = 1,
> +		},
> +		.init_regs = t7_mpll3_init_regs,
> +		.init_count = ARRAY_SIZE(t7_mpll3_init_regs),
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll3_div",
> +		.ops = &meson_clk_mpll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_mpll_prediv.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_mpll3 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = MPLL_CTRL7,
> +		.bit_idx = 31,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll3",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) { &t7_mpll3_div.hw },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct reg_sequence t7_hdmi_init_regs[] = {
> +	{ .reg = HDMIPLL_CTRL1, .def = 0x00000000 },
> +	{ .reg = HDMIPLL_CTRL2, .def = 0x00000000 },
> +	{ .reg = HDMIPLL_CTRL3, .def = 0x6a28dc00 },
> +	{ .reg = HDMIPLL_CTRL4, .def = 0x65771290 },
> +	{ .reg = HDMIPLL_CTRL5, .def = 0x39272000 },
> +	{ .reg = HDMIPLL_CTRL6, .def = 0x56540000 }
> +};
> +
> +static struct clk_regmap t7_hdmi_pll_dco = {
> +	.data = &(struct meson_clk_pll_data){
> +		.en = {
> +			.reg_off = HDMIPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = HDMIPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 9,
> +		},
> +		.n = {
> +			.reg_off = HDMIPLL_CTRL0,
> +			.shift   = 10,
> +			.width   = 5,
> +		},
> +		.l = {
> +			.reg_off = HDMIPLL_CTRL0,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = HDMIPLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.range = &t7_media_pll_mult_range,
> +		.init_regs = t7_hdmi_init_regs,
> +		.init_count = ARRAY_SIZE(t7_hdmi_init_regs),
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "hdmi_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .fw_name = "in0", }
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_hdmi_pll_od = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HDMIPLL_CTRL0,
> +		.shift = 16,
> +		.width = 4,
> +		.flags = CLK_DIVIDER_POWER_OF_TWO,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "hdmi_pll_od",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_hdmi_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap t7_hdmi_pll = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HDMIPLL_CTRL0,
> +		.shift = 20,
> +		.width = 2,
> +		.flags = CLK_DIVIDER_POWER_OF_TWO,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "hdmi_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_hdmi_pll_od.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct pll_mult_range t7_mclk_pll_mult_range = {
> +	.min = 67,
> +	.max = 133,
> +};
> +
> +static const struct reg_sequence t7_mclk_init_regs[] = {
> +	{ .reg = MCLK_PLL_CNTL1, .def = 0x1470500f },
> +	{ .reg = MCLK_PLL_CNTL2, .def = 0x00023001 },
> +	{ .reg = MCLK_PLL_CNTL3, .def = 0x18180000 },
> +	{ .reg = MCLK_PLL_CNTL4, .def = 0x00180303 },
> +};
> +
> +static struct clk_regmap t7_mclk_pll_dco = {
> +	.data = &(struct meson_clk_pll_data){
> +		.en = {
> +			.reg_off = MCLK_PLL_CNTL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = MCLK_PLL_CNTL0,
> +			.shift   = 0,
> +			.width   = 8,
> +		},
> +		.n = {
> +			.reg_off = MCLK_PLL_CNTL0,
> +			.shift   = 16,
> +			.width   = 5,
> +		},
> +		.l = {
> +			.reg_off = MCLK_PLL_CNTL0,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = MCLK_PLL_CNTL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.l_detect = {
> +			.reg_off = MCLK_PLL_CNTL2,
> +			.shift   = 6,
> +			.width   = 1,
> +		},
> +		.range = &t7_mclk_pll_mult_range,
> +		.init_regs = t7_mclk_init_regs,
> +		.init_count = ARRAY_SIZE(t7_mclk_init_regs),
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mclk_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "in0",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +/* max div is 16 */
> +static const struct clk_div_table t7_mclk_div[] = {
> +	{ .val = 0, .div = 1 },
> +	{ .val = 1, .div = 2 },
> +	{ .val = 2, .div = 4 },
> +	{ .val = 3, .div = 8 },
> +	{ .val = 4, .div = 16 },
> +	{ /* sentinel */ }
> +};
> +
> +static struct clk_regmap t7_mclk_pre_od = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = MCLK_PLL_CNTL0,
> +		.shift = 12,
> +		.width = 3,
> +		.table = t7_mclk_div,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mclk_pre_od",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_mclk_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap t7_mclk_pll = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = MCLK_PLL_CNTL4,
> +		.shift = 16,
> +		.width = 5,
> +		.flags = CLK_DIVIDER_ONE_BASED,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mclk_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_mclk_pre_od.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap t7_mclk_0_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = MCLK_PLL_CNTL4,
> +		.mask = 0x3,
> +		.shift = 4,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mclk_0_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .hw = &t7_mclk_pll.hw },
> +			{ .fw_name = "in1", },
> +			{ .fw_name = "in2", },
> +		},
> +		.num_parents = 3,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_mclk_0_div2 = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mclk_0_div2",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_hws = (const struct clk_hw *[]) { &t7_mclk_0_sel.hw },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap t7_mclk_0_pre = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = MCLK_PLL_CNTL4,
> +		.bit_idx = 2,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk_0_pre",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_mclk_0_div2.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap t7_mclk_0 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = MCLK_PLL_CNTL4,
> +		.bit_idx = 0,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk_0",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_mclk_0_pre.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap t7_mclk_1_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = MCLK_PLL_CNTL4,
> +		.mask = 0x3,
> +		.shift = 12,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mclk_1_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .hw = &t7_mclk_pll.hw },
> +			{ .fw_name = "in1", },
> +			{ .fw_name = "in2", },
> +		},
> +		.num_parents = 3,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_mclk_1_div2 = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mclk_1_div2",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_hws = (const struct clk_hw *[]) { &t7_mclk_1_sel.hw },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap t7_mclk_1_pre = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = MCLK_PLL_CNTL4,
> +		.bit_idx = 10,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk_1_pre",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_mclk_1_div2.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap t7_mclk_1 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = MCLK_PLL_CNTL4,
> +		.bit_idx = 8,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk_1",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&t7_mclk_1_pre.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_hw *t7_gp0_hw_clks[] = {
> +	[CLKID_GP0_PLL_DCO]		= &t7_gp0_pll_dco.hw,
> +	[CLKID_GP0_PLL]			= &t7_gp0_pll.hw,
> +};
> +
> +static struct clk_hw *t7_gp1_hw_clks[] = {
> +	[CLKID_GP1_PLL_DCO]		= &t7_gp1_pll_dco.hw,
> +	[CLKID_GP1_PLL]			= &t7_gp1_pll.hw,
> +};
> +
> +static struct clk_hw *t7_hifi_hw_clks[] = {
> +	[CLKID_HIFI_PLL_DCO]		= &t7_hifi_pll_dco.hw,
> +	[CLKID_HIFI_PLL]		= &t7_hifi_pll.hw,
> +};
> +
> +static struct clk_hw *t7_pcie_hw_clks[] = {
> +	[CLKID_PCIE_PLL_DCO]		= &t7_pcie_pll_dco.hw,
> +	[CLKID_PCIE_PLL_DCO_DIV2]	= &t7_pcie_pll_dco_div2.hw,
> +	[CLKID_PCIE_PLL_OD]		= &t7_pcie_pll_od.hw,
> +	[CLKID_PCIE_PLL]		= &t7_pcie_pll.hw,
> +};
> +
> +static struct clk_hw *t7_mpll_hw_clks[] = {
> +	[CLKID_MPLL_PREDIV]		= &t7_mpll_prediv.hw,
> +	[CLKID_MPLL0_DIV]		= &t7_mpll0_div.hw,
> +	[CLKID_MPLL0]			= &t7_mpll0.hw,
> +	[CLKID_MPLL1_DIV]		= &t7_mpll1_div.hw,
> +	[CLKID_MPLL1]			= &t7_mpll1.hw,
> +	[CLKID_MPLL2_DIV]		= &t7_mpll2_div.hw,
> +	[CLKID_MPLL2]			= &t7_mpll2.hw,
> +	[CLKID_MPLL3_DIV]		= &t7_mpll3_div.hw,
> +	[CLKID_MPLL3]			= &t7_mpll3.hw,
> +};
> +
> +static struct clk_hw *t7_hdmi_hw_clks[] = {
> +	[CLKID_HDMI_PLL_DCO]		= &t7_hdmi_pll_dco.hw,
> +	[CLKID_HDMI_PLL_OD]		= &t7_hdmi_pll_od.hw,
> +	[CLKID_HDMI_PLL]		= &t7_hdmi_pll.hw,
> +};
> +
> +static struct clk_hw *t7_mclk_hw_clks[] = {
> +	[CLKID_MCLK_PLL_DCO]		= &t7_mclk_pll_dco.hw,
> +	[CLKID_MCLK_PRE]		= &t7_mclk_pre_od.hw,
> +	[CLKID_MCLK_PLL]		= &t7_mclk_pll.hw,
> +	[CLKID_MCLK_0_SEL]		= &t7_mclk_0_sel.hw,
> +	[CLKID_MCLK_0_DIV2]		= &t7_mclk_0_div2.hw,
> +	[CLKID_MCLK_0_PRE]		= &t7_mclk_0_pre.hw,
> +	[CLKID_MCLK_0]			= &t7_mclk_0.hw,
> +	[CLKID_MCLK_1_SEL]		= &t7_mclk_1_sel.hw,
> +	[CLKID_MCLK_1_DIV2]		= &t7_mclk_1_div2.hw,
> +	[CLKID_MCLK_1_PRE]		= &t7_mclk_1_pre.hw,
> +	[CLKID_MCLK_1]			= &t7_mclk_1.hw,
> +};
> +
> +static const struct meson_clkc_data t7_gp0_data = {
> +	.hw_clks = {
> +		.hws = t7_gp0_hw_clks,
> +		.num = ARRAY_SIZE(t7_gp0_hw_clks),
> +	},
> +};
> +
> +static const struct meson_clkc_data t7_gp1_data = {
> +	.hw_clks = {
> +		.hws = t7_gp1_hw_clks,
> +		.num = ARRAY_SIZE(t7_gp1_hw_clks),
> +	},
> +};
> +
> +static const struct meson_clkc_data t7_hifi_data = {
> +	.hw_clks = {
> +		.hws = t7_hifi_hw_clks,
> +		.num = ARRAY_SIZE(t7_hifi_hw_clks),
> +	},
> +};
> +
> +static const struct meson_clkc_data t7_pcie_data = {
> +	.hw_clks = {
> +		.hws = t7_pcie_hw_clks,
> +		.num = ARRAY_SIZE(t7_pcie_hw_clks),
> +	},
> +};
> +
> +static const struct reg_sequence t7_mpll_init_regs[] = {
> +	{ .reg = MPLL_CTRL0, .def = 0x00000543 }
> +};
> +
> +static const struct meson_clkc_data t7_mpll_data = {
> +	.hw_clks = {
> +		.hws = t7_mpll_hw_clks,
> +		.num = ARRAY_SIZE(t7_mpll_hw_clks),
> +	},
> +	.init_regs = t7_mpll_init_regs,
> +	.init_count = ARRAY_SIZE(t7_mpll_init_regs),
> +};
> +
> +static const struct meson_clkc_data t7_hdmi_data = {
> +	.hw_clks = {
> +		.hws = t7_hdmi_hw_clks,
> +		.num = ARRAY_SIZE(t7_hdmi_hw_clks),
> +	},
> +};
> +
> +static const struct meson_clkc_data t7_mclk_data = {
> +	.hw_clks = {
> +		.hws = t7_mclk_hw_clks,
> +		.num = ARRAY_SIZE(t7_mclk_hw_clks),
> +	},
> +};
> +
> +static const struct of_device_id t7_pll_clkc_match_table[] = {
> +	{ .compatible = "amlogic,t7-gp0-pll",	.data = &t7_gp0_data, },
> +	{ .compatible = "amlogic,t7-gp1-pll",	.data = &t7_gp1_data, },
> +	{ .compatible = "amlogic,t7-hifi-pll",	.data = &t7_hifi_data, },
> +	{ .compatible = "amlogic,t7-pcie-pll",	.data = &t7_pcie_data, },
> +	{ .compatible = "amlogic,t7-mpll",	.data = &t7_mpll_data, },
> +	{ .compatible = "amlogic,t7-hdmi-pll",	.data = &t7_hdmi_data, },
> +	{ .compatible = "amlogic,t7-mclk-pll",	.data = &t7_mclk_data, },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, t7_pll_clkc_match_table);
> +
> +static struct platform_driver t7_pll_clkc_driver = {
> +	.probe = meson_clkc_mmio_probe,
> +	.driver = {
> +		.name = "t7-pll-clkc",
> +		.of_match_table = t7_pll_clkc_match_table,
> +	},
> +};
> +module_platform_driver(t7_pll_clkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic T7 PLL Clock Controller driver");
> +MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("CLK_MESON");

-- 
Jerome
