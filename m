Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996084;
	b=qGuajTTIMWO/eHqoa1NUJYzuuupMGGoAlgvwQ5XTlnLEFsIoRYsv8DRQjSubIlT1sYfy
	 Vsi3Mqoggir1AskbGZZ2/O+reBvstuWublAWuSLZtTQkgSy1UisXkDV5ZX7Z13QsSk0VZ
	 7CHc97Y0zWzfn3rb4b/KZucO5INBfXtkwKHLFa4gDhjyk/Zdpwr/aDlu2TWS7Ljtw5g38
	 92d3MSh8BiLEFFsRM5OpsSJJteogfOUxktyUITtMAhobVDri14Rc12NT81vR5ht3Znmkz
	 uoR1MtQ4lNhR58S0WOaOuB0ePPnfm93gyDDVAELrKLQCMwrFswAe6AQQOI+Be7ffieQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5FtFLLqrPIj0j4XT+xADC+zvVBuuqZPSxyKy37JTMvc=;
	b=MRmFd4aB7K/9t60ceBd0mC4ESQbMbjALtVo8dmztuVTulCWMCcNi8H9S5pu/JPCIKOv6
	 yQrpLi77n4JErCU0QiQk1C/u9zcPV0xzett3Hv+K9KEdXgWUhCC81YRQUJBfopVRLFF+D
	 m9xP+SPXMvOUIqZ3KkCuLI+oPE6f3zLzpMFyER3OwsLV5K5np3NL4eBoMzUk61q/zCVBB
	 sdolVSso1ZdOvWYVhjev1P7STEr9BdUSkw1DtRftP85UlUxr9W1V1Kx7tYyozKJaXEc6o
	 FmpBC9G1f/4rqqF/1ge/x8MJGqDv6QctlDEwIeU3KoG5zMIBqKDXft9yY6ofwaz1vhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZJkJyBQr;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F26606A895
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 10:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06F26606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZJkJyBQr
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so6095655e9.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 02:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794996082; x=1795600882; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5FtFLLqrPIj0j4XT+xADC+zvVBuuqZPSxyKy37JTMvc=;
        b=ZJkJyBQrRl2JarKpSlpbyaV3YNhc6jzvLV5sYC7t3VRphdb8B4BP4KJuzvRRoWRwvS
         2SScYRhn83QFawGP+NzdjZkw1c28YBQoIm28LPIHLzkNtxWmbaXTzq6Fic81eiU8MZKZ
         POW+tWWg488oKp8VzNLAPmvXXP4NVCC3X2uBSDHbSv820ahIVF6mud5WVbVp8tQxd1iU
         BwmHrC6ghmh4UMz/kQWC4rEYysv/xLzuenzsxzRWp4cG98c7Y9qIiGWxN+DSU3Bw/+XG
         w5bcEh4ycNFwtf6XSeoJmm/MN6GXrqQr28JGZaLIIijVaIqrV48w5PPAqW3lSSsQzwch
         uJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996082; x=1795600882;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5FtFLLqrPIj0j4XT+xADC+zvVBuuqZPSxyKy37JTMvc=;
        b=uKsQ1F59lIWvkdHyhvz1qGJpdTaHUNLrRKEVaxbwtnMhHxZ7ic2BTMzqckGBCsdb0u
         ma8l66ADUnwtjn55yIP+o79wila9INzzR7uNlewi9nzeG1C7adbfGOuDHZmhJSGKlauu
         vuFjgvh3ixL+EqfwkvqL3SWroNexF1gPmGLUZp3NUG5u1V0PGVyMpVGcvlTHA0ZW+TJ9
         u38QAakFUzveRgb0bxrW7zz4adceDgGAqcqs2I/cdmus8FUyFVq1GMhfTJK3Z8xs/bz+
         2VoWFmiZcHjSTLbVv2nGfHzqpQ5q4bC9/H+3FwgEjKyHyEVVyH/veHF70F7bDEztfEoz
         ybOg==
X-Forwarded-Encrypted: i=1; AL+hErEtzRSkJxMlXCvrXh342du+BAJkNs+RaB87n6rG2kz8lqz7FPEl5gnGoTz3yrBi0v1kI8e1nBttPCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/na5hysg0vnhdBG3n6Ek0/nDOfjimQNg7hZUJ88y0OY8mdxcYM
	WU8qrEakYDvMbForXTU+c2h2XSVsnQzP+/tbhNg3ThVsgeuq9K1IOaADKSiLaDH0X2Y=
X-Gm-Gg: AYBFou3vU42P9FnFuuqrw/pMKa5M966c7IsW6Ub4s0pCojVB8ZUrrW54oZf5Jumpowb
	oZd8V1lmKSrG9AerExcbrWxMmSoHk0AmZwG0luyvNUdOuuJ8Qo5wb5DwjuhZvw385UGWhAycUU2
	1IFTmCcw4RUBJ7O2HbCas4P4vyKuYTwWuE0eTEjgZcVblMvr6BaUjXcPEJKS43QBQh1T5zc/VHL
	qpnQw5Yhg4rQrIaYFhOnXuOB0DiuMqG8zn4NW9LKsHYhe0qLSE136msURSCdj5k8z6Pl/K+exe6
	P64g7tou9ROXUYRZHzTIEQBnsVbtEmI5C8+enjTeUB6VsuHe30igbCDlDSpDXEdwfXrEIfFptPi
	sPhGTT+lBo4DDkqD1em1LBBeQ7IJindj/c0DAqGw4RxFlP+W/eQ1BpmV6UVEs5wrbin2KU72gjE
	fwxOv7LRMhkXx/va61d3ZtVfOAFc4/NQwvDdfS+KUD529Ij9zZ6SR1AC4EqwfoO0670EYuiU6Ct
	Q+sPNj+ZKc8o3Fpzn1/1VWOsfc74ygaso2359EY/PRxG8GhFrd7xIJPTwEmVrYU4nb+/y58Js9e
	GmYLYjU3WYKhV1N4+ossG6sJM89zVTL7Zh0qzZuVyEP8ma8P
X-Received: by 2002:a05:600c:a4b:b0:4a2:59:f568 with SMTP id 5b1f17b1804b1-4bb7da12963mr38542405e9.14.1794996082362;
        Wed, 18 Nov 2026 02:01:22 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2abfc4sm55271565e9.7.2026.11.18.02.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:01:21 -0800 (PST)
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
Subject: Re: [PATCH 5/7] clk: amlogic: Add S7 PLL clock controller driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106-upstream-s7-clk-v1-5-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-5-7d501d62621f@baylibre.com>
Date: Wed, 18 Nov 2026 11:01:12 +0100
Message-Id: <179499607256.413320.18141155995846183804.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=16225; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=TPYIOTq9znLhKy1fBSniroKT6Tq5kDERujlzBrfvc1I=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/y3O4SvOd7s8+as71zrc+QCSmUc9E6NlC4YmmrfU+4
 a8esx/oKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwESO7mdkaOSpcn2y5/82VUHX
 O59uTe9n/NV+RMay6Wp/udiR+vsP2hgZXt/y+qEe4utTwSv4TOuX2769AUYhJZU5Qt/v3d55aGk
 LMwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The S7 PLL controller provides the fixed PLL with its fclk dividers,
> the GP0, HIFI0 and HIFI1 PLLs, and the HDMI PLL.
> 
> Add a driver for it. The GP0 and HIFI PLLs are expected to run with
> their input divided by 2 (div0p5) and the HDMI PLL without it, as the
> firmware and the init sequences set them up.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  drivers/clk/meson/Kconfig  |  14 +
>  drivers/clk/meson/Makefile |   1 +
>  drivers/clk/meson/s7-pll.c | 648 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 663 insertions(+)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index d460514bb8a1..35f2971448af 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -229,6 +229,20 @@ config COMMON_CLK_S4_PERIPHERALS
>  	  Support for the peripherals clock controller on Amlogic S805X2 and S905Y4
>  	  devices, AKA S4. Say Y if you want S4 peripherals clock controller to work.
>  
> +config COMMON_CLK_S7_PLL
> +	tristate "Amlogic S7 SoC PLL controller support"
> +	depends on ARM64 || COMPILE_TEST
> +	default ARCH_MESON
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_CLKC_UTILS
> +	select COMMON_CLK_MESON_PLL
> +	imply COMMON_CLK_SCMI
> +	help
> +	  Support for the PLL clock controller on Amlogic S805X3 based
> +	  devices, AKA S7. This controller provides the fixed PLL and its
> +	  dividers, the GP0, HIFI0 and HIFI1 PLLs and the HDMI PLL. Say Y if
> +	  you want the S7 PLL clock controller to work.
> +
>  config COMMON_CLK_T7_PLL
>  	tristate "Amlogic T7 SoC PLL controller support"
>  	depends on ARM64
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index 56b04254eb1a..9d439106d11c 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -28,5 +28,6 @@ obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
>  obj-$(CONFIG_COMMON_CLK_S4_PLL) += s4-pll.o
>  obj-$(CONFIG_COMMON_CLK_S4_PERIPHERALS) += s4-peripherals.o
> +obj-$(CONFIG_COMMON_CLK_S7_PLL) += s7-pll.o
>  obj-$(CONFIG_COMMON_CLK_T7_PLL) += t7-pll.o
>  obj-$(CONFIG_COMMON_CLK_T7_PERIPHERALS) += t7-peripherals.o
> diff --git a/drivers/clk/meson/s7-pll.c b/drivers/clk/meson/s7-pll.c
> new file mode 100644
> index 000000000000..2aa253a5f211
> --- /dev/null
> +++ b/drivers/clk/meson/s7-pll.c
> @@ -0,0 +1,648 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Amlogic S7 PLL Clock Controller Driver
> + *
> + * Copyright (c) 2026 BayLibre, SAS.
> + * Author: Carlo Caione <ccaione@baylibre.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include "clk-regmap.h"
> +#include "clk-pll.h"
> +#include "meson-clkc-utils.h"
> +#include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
> +
> +#define FIXPLL_CTRL0			0x040
> +#define FIXPLL_CTRL1			0x044
> +#define FIXPLL_STS			0x05c
> +#define GP0PLL_CTRL0			0x080
> +#define GP0PLL_CTRL1			0x084
> +#define GP0PLL_CTRL2			0x088
> +#define GP0PLL_CTRL3			0x08c
> +#define GP0PLL_STS			0x09c
> +#define HIFI0PLL_CTRL0			0x100
> +#define HIFI0PLL_CTRL1			0x104
> +#define HIFI0PLL_CTRL2			0x108
> +#define HIFI0PLL_CTRL3			0x10c
> +#define HIFI1PLL_CTRL0			0x110
> +#define HIFI1PLL_CTRL1			0x114
> +#define HIFI1PLL_CTRL2			0x118
> +#define HIFI1PLL_CTRL3			0x11c
> +#define HIFI0PLL_STS			0x120
> +#define HIFI1PLL_STS			0x124
> +#define HDMIPLL_CTRL0			0x1c0
> +#define HDMIPLL_CTRL1			0x1c4
> +#define HDMIPLL_CTRL2			0x1c8
> +#define HDMIPLL_CTRL3			0x1cc
> +#define HDMIPLL_STS			0x1dc
> +
> +static struct clk_regmap s7_fixed_pll_vco = {
> +	.data = &(struct meson_clk_pll_data) {
> +		.en = {
> +			.reg_off = FIXPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = FIXPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 9,
> +		},
> +		.n = {
> +			.reg_off = FIXPLL_CTRL0,
> +			.shift   = 11,
> +			.width   = 5,
> +		},
> +		.l = {
> +			.reg_off = FIXPLL_STS,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = FIXPLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "fixed_pll_vco",
> +		.ops = &meson_clk_pll_ro_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "fix",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap s7_fixed_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = FIXPLL_CTRL0,
> +		.shift = 9,
> +		.width = 2,
> +		.flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "fixed_pll",
> +		.ops = &clk_regmap_divider_ro_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s7_fixed_pll_vco.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +#define S7_FCLK(_name, _mult, _divider, _reg, _bit)			\
> +static struct clk_fixed_factor s7_##_name##_div = {			\

Nitpick: get the static out of the macro as it is done for the other macro
used in other SoCs. This keeps things consistent and help quickly id the
macro is declaring something.

> +	.mult = (_mult),						\
> +	.div = (_divider),						\
> +	.hw.init = &(struct clk_init_data) {				\
> +		.name = #_name "_div",					\
> +		.ops = &clk_fixed_factor_ops,				\
> +		.parent_hws = (const struct clk_hw *[]) {		\
> +			&s7_fixed_pll.hw				\
> +		},							\
> +		.num_parents = 1,					\
> +	},								\
> +};									\
>

I don't like macros declaring multiple clocks like that. One line, one clock.

+									\
> +static struct clk_regmap s7_##_name = {					\
> +	.data = &(struct clk_regmap_gate_data) {			\
> +		.offset = (_reg),					\
> +		.bit_idx = (_bit),					\
> +	},								\
> +	.hw.init = &(struct clk_init_data) {				\
> +		.name = #_name,						\
> +		.ops = &clk_regmap_gate_ro_ops,				\
> +		.parent_hws = (const struct clk_hw *[]) {		\
> +			&s7_##_name##_div.hw				\
> +		},							\
> +		.num_parents = 1,					\
> +	},								\
> +}
> +
> +/* The datasheet documents FIXPLL_CTRL1[30:26] as a single fclk_en field */

Not sure what this imply ?

> +S7_FCLK(fclk_div2, 1, 2, FIXPLL_CTRL1, 30);
> +S7_FCLK(fclk_div3, 1, 3, FIXPLL_CTRL1, 26);
> +S7_FCLK(fclk_div4, 1, 4, FIXPLL_CTRL1, 27);
> +S7_FCLK(fclk_div5, 1, 5, FIXPLL_CTRL1, 28);
> +S7_FCLK(fclk_div7, 1, 7, FIXPLL_CTRL1, 29);
> +S7_FCLK(fclk_div2p5, 2, 5, FIXPLL_CTRL0, 25);
> +
> +static const struct pll_mult_range s7_pll_mult_range = {
> +	.min = 134,
> +	.max = 265,
> +};
> +
> +static const struct reg_sequence s7_gp0_pll_init_regs[] = {
> +	{ .reg = GP0PLL_CTRL0,	.def = 0x02520800 },
> +	{ .reg = GP0PLL_CTRL1,	.def = 0x09900322 },
> +	{ .reg = GP0PLL_CTRL2,	.def = 0x00000000 },
> +	{ .reg = GP0PLL_CTRL3,	.def = 0x00000006 },
> +};
> +
> +static struct clk_fixed_factor s7_gp0_pll_div0p5 = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "gp0_pll_div0p5",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "gp0",
> +		},
> +		.num_parents = 1,
> +	},

Is it the good old predivider here ? Shouldn't it be modelled with
a read-only divider rather that a fixed factor ? just in case whatever
came before did not leave things as we first expected ?

Applies to the other PLL instances

> +};
> +
> +static struct clk_regmap s7_gp0_pll_vco = {
> +	.data = &(struct meson_clk_pll_data) {
> +		.en = {
> +			.reg_off = GP0PLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = GP0PLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 9,
> +		},
> +		.frac = {
> +			.reg_off = GP0PLL_CTRL2,
> +			.shift   = 0,
> +			.width   = 17,
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
> +		.frac_max = 131072,

Nit: 131072 is 1 << frac.width, which is already the default.

> +		.range = &s7_pll_mult_range,
> +		.init_regs = s7_gp0_pll_init_regs,
> +		.init_count = ARRAY_SIZE(s7_gp0_pll_init_regs),
> +		.flags = CLK_MESON_PLL_NOINIT_ENABLED,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "gp0_pll_vco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s7_gp0_pll_div0p5.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap s7_gp0_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = GP0PLL_CTRL0,
> +		.shift = 9,
> +		.width = 2,
> +		.flags = CLK_DIVIDER_POWER_OF_TWO |
> +			 CLK_DIVIDER_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "gp0_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s7_gp0_pll_vco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +/* hifi is HIFI0 in the datasheet */

What is stopping us from calling that then ?

> +static const struct reg_sequence s7_hifi_pll_init_regs[] = {
> +	{ .reg = HIFI0PLL_CTRL0,	.def = 0x02520800 },
> +	{ .reg = HIFI0PLL_CTRL1,	.def = 0x09900322 },
> +	{ .reg = HIFI0PLL_CTRL2,	.def = 0x00000000 },
> +	{ .reg = HIFI0PLL_CTRL3,	.def = 0x00000006 },
> +};
> +
> +static struct clk_fixed_factor s7_hifi_pll_div0p5 = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi_pll_div0p5",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "hifi",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap s7_hifi_pll_vco = {
> +	.data = &(struct meson_clk_pll_data) {
> +		.en = {
> +			.reg_off = HIFI0PLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = HIFI0PLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 9,
> +		},
> +		.frac = {
> +			.reg_off = HIFI0PLL_CTRL2,
> +			.shift   = 0,
> +			.width   = 17,
> +		},
> +		.l = {
> +			.reg_off = HIFI0PLL_STS,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = HIFI0PLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.frac_max = 100000,
> +		.range = &s7_pll_mult_range,
> +		.init_regs = s7_hifi_pll_init_regs,
> +		.init_count = ARRAY_SIZE(s7_hifi_pll_init_regs),
> +		.flags = CLK_MESON_PLL_ROUND_CLOSEST |
> +			 CLK_MESON_PLL_NOINIT_ENABLED,

I don't why we would keep the HIFI PLL as it was from the bootloader.
GP0 could be used for inherited splash screen. I don't think this
use case applies to the HIFI pll.

> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi_pll_vco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s7_hifi_pll_div0p5.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap s7_hifi_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = HIFI0PLL_CTRL0,
> +		.shift = 9,
> +		.width = 2,
> +		.flags = CLK_DIVIDER_POWER_OF_TWO |
> +			 CLK_DIVIDER_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s7_hifi_pll_vco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct reg_sequence s7_hifi1_pll_init_regs[] = {
> +	{ .reg = HIFI1PLL_CTRL0,	.def = 0x02520800 },
> +	{ .reg = HIFI1PLL_CTRL1,	.def = 0x09900322 },
> +	{ .reg = HIFI1PLL_CTRL2,	.def = 0x00000000 },
> +	{ .reg = HIFI1PLL_CTRL3,	.def = 0x00000006 },
> +};
> +
> +static struct clk_fixed_factor s7_hifi1_pll_div0p5 = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi1_pll_div0p5",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "hifi1",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap s7_hifi1_pll_vco = {
> +	.data = &(struct meson_clk_pll_data) {
> +		.en = {
> +			.reg_off = HIFI1PLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = HIFI1PLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 9,
> +		},
> +		.frac = {
> +			.reg_off = HIFI1PLL_CTRL2,
> +			.shift   = 0,
> +			.width   = 17,
> +		},
> +		.l = {
> +			.reg_off = HIFI1PLL_STS,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = HIFI1PLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.frac_max = 100000,
> +		.range = &s7_pll_mult_range,
> +		.init_regs = s7_hifi1_pll_init_regs,
> +		.init_count = ARRAY_SIZE(s7_hifi1_pll_init_regs),
> +		.flags = CLK_MESON_PLL_ROUND_CLOSEST |
> +			 CLK_MESON_PLL_NOINIT_ENABLED,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi1_pll_vco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s7_hifi1_pll_div0p5.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap s7_hifi1_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = HIFI1PLL_CTRL0,
> +		.shift = 9,
> +		.width = 2,
> +		.flags = CLK_DIVIDER_POWER_OF_TWO |
> +			 CLK_DIVIDER_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi1_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s7_hifi1_pll_vco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct pll_mult_range s7_hdmi_pll_mult_range = {
> +	.min = 125,
> +	.max = 249,
> +};
> +
> +static const struct reg_sequence s7_hdmi_pll_init_regs[] = {
> +	{ .reg = HDMIPLL_CTRL0,	.def = 0x00881000 },
> +	{ .reg = HDMIPLL_CTRL1,	.def = 0x2c6011cc },
> +	{ .reg = HDMIPLL_CTRL2,	.def = 0x86801000 },
> +	{ .reg = HDMIPLL_CTRL3,	.def = 0x00000000 },
> +};
> +
> +static const struct clk_div_table s7_hdmi_pll_div0p5_table[] = {
> +	{ .val = 0, .div = 1 },
> +	{ .val = 1, .div = 2 },
> +	{ /* sentinel */ }
> +};
> +
> +static struct clk_regmap s7_hdmi_pll_div0p5 = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = HDMIPLL_CTRL1,
> +		.shift = 19,
> +		.width = 1,
> +		.table = s7_hdmi_pll_div0p5_table,
> +		.flags = CLK_DIVIDER_READ_ONLY,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hdmi_pll_div0p5",
> +		.ops = &clk_regmap_divider_ro_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "hdmi",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap s7_hdmi_pll_vco = {
> +	.data = &(struct meson_clk_pll_data) {
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
> +		.frac = {
> +			.reg_off = HDMIPLL_CTRL3,
> +			.shift   = 0,
> +			.width   = 17,
> +		},
> +		.l = {
> +			.reg_off = HDMIPLL_STS,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = HDMIPLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.range = &s7_hdmi_pll_mult_range,
> +		.init_regs = s7_hdmi_pll_init_regs,
> +		.init_count = ARRAY_SIZE(s7_hdmi_pll_init_regs),
> +		.flags = CLK_MESON_PLL_RST_ACTIVE_LOW |
> +			 CLK_MESON_PLL_NOINIT_ENABLED,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hdmi_pll_vco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s7_hdmi_pll_div0p5.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +/*
> + * The datasheet documents HDMIPLL_CTRL2[22:19] and [18:15] as single fields:
> + * each is two power-of-two dividers.

This comment is somehow confusing because it only partialy matches the clocks
defined bellow. Please clarify.

-- 
Jerome

