Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E253129B8D0
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 15:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778513802; cv=none; b=UHyGpokKDncwo0NNktF5Jz94PyHKPhRSvZOqPT8itXtlUTtSc/TM5SI0Nb3LRph/eStSo9qgOA6m1JXWdER0sZqwbOk4pK8JEDe5sn8Pb4Jmx44KjhKleArfBkK9unqYOo+wFFlPaSSeA7CkZidQngQsrABxhkGaRzqyJ2XbOsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778513802; c=relaxed/simple;
	bh=tfZ68+YAlyfHV5vbst/b+MiOuzpWAt/CDNN1olb+uLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlWm0KQDXyhp8Y9XJ1+s7vFtpNNl+T4T1v808qbrNGRZp9s/bvJGBviz4z7MU0Je0ZAX0a0hfuJ6f7WyzS2sAj4mQ0S41oBFoDFIifMl28ZeBEpJToqYi4p8MyZU56cROR2SR7mYHq1Jha2Ic1qeXTuD9Fx3z5JcTCvvvEvyt+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=daLh5qDM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZiMEm7uo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="daLh5qDM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZiMEm7uo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778513799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RokP4FryjglM8RTSO6xPMzNsz+yonGnt7z5nuw4bWYA=;
	b=daLh5qDMSbq8l9tHIFV7x9heir5/2klBHiArX/xCoyrluDfwPdnzV64fxARoetT61mHVmr
	qTsSxD5gYi3cgEF1uRd7QR2tDLHLJ3ObKHesoSdsyolz4iUICHlQNVqksUQt5YO2FvaQKS
	2O+HNM+qZfz1V9fPVV/10IqaUhxCcYI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-GxU9ejy3M1q10PkE6A5HDQ-1; Mon, 11 May 2026 11:36:35 -0400
X-MC-Unique: GxU9ejy3M1q10PkE6A5HDQ-1
X-Mimecast-MFC-AGG-ID: GxU9ejy3M1q10PkE6A5HDQ_1778513795
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-90cb6202d40so3372385a.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 08:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778513795; x=1779118595; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RokP4FryjglM8RTSO6xPMzNsz+yonGnt7z5nuw4bWYA=;
        b=ZiMEm7uoQyoeBICZU8Xv3ZBvUfSN/JG6eZGoRy7ioCuFYIYnHKDD6nLnw4qoTEONYQ
         fV6C5Ec7ucmPPxXGdqGjbwkcVOKdljgkNqeqI6SDImcq4D0uhpJraYV33ja2QsDJl0BM
         NQwJEjkTju63GVOBsCPCQRSK/kHVxavemYfFK59H9xrFs6jcg1snG0m9FV/ITHELUwH4
         NMXIDpv/h4YFHQE9xPe68HujblKVQCb0R2HTlAeiu5rZKWA4vR+aYM4kjx3X9tQAZdGa
         RrKQrP4gUkvArBJy9HYRjtAj0oTX9Llf/OCJ8+krCvzGyk90wxjrJhs/YAS8uPC8b4IH
         1htw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778513795; x=1779118595;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RokP4FryjglM8RTSO6xPMzNsz+yonGnt7z5nuw4bWYA=;
        b=NBuweKoH36wlCiVZ98TJv+Pbn+G1qdPyqkct3mJ4Poq2xCbjV69XueFvDoLOGN4use
         68+C0hzZDZ9pKVR7Cwpjm5yRKMzI4/XuQ61ZfRC0MEEGkPpTAZRPJx55ljsR35E9Kxr1
         BBNiyZOkVmVowP1IFWDByBBI9hngT2Ji7zn7y4pjGUeoIQAE70MjqaZmGZw0kOdWJtSS
         g0tVXVUL2sqiZOoUqvLRhySotNQTkR1PnOdUid8j64xgcsYB92HJ8cchYHohZiCgdKPw
         rbQ2Lr4H9dBQifXZqWzYHIxCfrJoqWzsIV7A1JjBoEdATvHgM8l3d7rkWEhZRIIZOJRh
         yYSg==
X-Forwarded-Encrypted: i=1; AFNElJ8GWPeXPuKL2gxyUG/8I/HHnud9S9vr6TUhSeE/x4+fGIbPEz6JlIeAV1AQmNMe2MJTpAkOv3BQMK4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2u2Q5/Mzs0w/JFIHLHOzPLBFIzrF1AyZ80KdgbPzTR9NzWi+p
	Q91qdtWOb/UrzuSwSXz75W7Mv8V4ujrUBJ8EnQCJN0X7OnJxdO7HhsRELsnfTkw2pak5bScFpA1
	XqgzMsulqzI4+AbqrOi8WNi+7HCR9QGaCmNrhGHjzHDLsyxqy/OUWUhTTDQzlWA==
X-Gm-Gg: Acq92OF1/bU+kx/gigNiUFXXi5sY4wKhr/fDb1nRw8u/rqqQowLNT8qY3ECaOGZfvyh
	yVd6r2iFZ3f7EqigI9KK1N6hMyTepg+hlUGxnHb/KrNe5wVsNt1701E/kZ/zu0bs40hzg0TfUcP
	E5BNMyT63AqhE0CGMP+Wj7XEDw7NVxPjGtyAeuPpwom9hv75kVY/+Bfs+rHRE4YvgN0Al12bKtg
	1MFwY4T1l9UyOGG/j2ypcaEjLWuZeckgXSK5KLCyQabybc6Tr1wzQRbLgJ6nUUH07qJARzpXKD5
	bS0xOKsHGI+P58bjaVdMyhw1ZgpsdWJ7wFO4vXi8uk+YjCAm2HfhPMPcWSOP2qhQ4fz97+uFB9P
	eMsCfjDLhpa8/U8/3cUSfAflIIBrsNcteFaw2OTGaYJo4r6iGrcDO5Keb
X-Received: by 2002:a05:620a:4453:b0:8f2:a656:1d8c with SMTP id af79cd13be357-909102449e3mr1418347685a.38.1778513795049;
        Mon, 11 May 2026 08:36:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4453:b0:8f2:a656:1d8c with SMTP id af79cd13be357-909102449e3mr1418337185a.38.1778513794109;
        Mon, 11 May 2026 08:36:34 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9ea06sm1075432485a.20.2026.05.11.08.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:36:33 -0700 (PDT)
Date: Mon, 11 May 2026 11:36:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: jian.hu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/10] clk: amlogic: Add A9 PLL clock controller driver
Message-ID: <agH3f3F0pUNOzdPB@redhat.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-8-41cb4071b7c9@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-b4-a9_clk-v1-8-41cb4071b7c9@amlogic.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Jian,

On Mon, May 11, 2026 at 08:47:30PM +0800, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> Add the PLL clock controller driver for the Amlogic A9 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/Kconfig  |  13 +
>  drivers/clk/meson/Makefile |   1 +
>  drivers/clk/meson/a9-pll.c | 831 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 845 insertions(+)
> 
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index cf8cf3f9e4ee..3549e67d6988 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -132,6 +132,19 @@ config COMMON_CLK_A1_PERIPHERALS
>  	  device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>  	  controller to work.
>  
> +config COMMON_CLK_A9_PLL
> +	tristate "Amlogic A9 SoC PLL controller support"
> +	depends on ARM64

depends on ARM64 || COMPILE_TEST

> +	default ARCH_MESON
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_CLKC_UTILS
> +	select COMMON_CLK_MESON_PLL
> +	imply COMMON_CLK_SCMI
> +	help
> +	  Support for the PLL clock controller on Amlogic A311Y3 based
> +	  device, AKA A9. PLLs are required by most peripheral to operate.
> +	  Say Y if you want A9 PLL clock controller to work.
> +
>  config COMMON_CLK_C3_PLL
>  	tristate "Amlogic C3 PLL clock controller"
>  	depends on ARM64
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index c6719694a242..77636033061f 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>  obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>  obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
> +obj-$(CONFIG_COMMON_CLK_A9_PLL) += a9-pll.o
>  obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
>  obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>  obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
> diff --git a/drivers/clk/meson/a9-pll.c b/drivers/clk/meson/a9-pll.c
> new file mode 100644
> index 000000000000..84b591c3afff
> --- /dev/null
> +++ b/drivers/clk/meson/a9-pll.c
> @@ -0,0 +1,831 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/amlogic,a9-pll-clkc.h>
> +#include "clk-regmap.h"
> +#include "clk-pll.h"
> +#include "meson-clkc-utils.h"

Sort the headers

> +
> +#define GP0PLL_CTRL0			0x00
> +#define GP0PLL_CTRL1			0x04
> +#define GP0PLL_CTRL2			0x08
> +#define GP0PLL_CTRL3			0x0c
> +#define GP0PLL_CTRL4			0x10
> +
> +/* HIFI0 and HIFI1 share the same IP and register offset layout. */
> +#define HIFIPLL_CTRL0			0x00
> +#define HIFIPLL_CTRL1			0x04
> +#define HIFIPLL_CTRL2			0x08
> +#define HIFIPLL_CTRL3			0x0c
> +#define HIFIPLL_CTRL4			0x10
> +
> +/* MCLK0 and MCLK1 share the same IP and register offset layout. */
> +#define MCLKPLL_CTRL0			0x00
> +#define MCLKPLL_CTRL1			0x04
> +#define MCLKPLL_CTRL2			0x08
> +#define MCLKPLL_CTRL3			0x0c
> +#define MCLKPLL_CTRL4			0x10
> +
> +#define A9_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
> +	MESON_COMP_SEL(a9_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
> +
> +#define A9_COMP_DIV(_name, _reg, _shift, _width) \
> +	MESON_COMP_DIV(a9_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
> +
> +#define A9_COMP_GATE(_name, _reg, _bit) \
> +	MESON_COMP_GATE(a9_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
> +
> +/*
> + * Compared with previous SoC PLLs, the A9 PLL input path has an inherent
> + * 2-divider. The N pre-divider follows the same calculation rule as OD,
> + * where the pre-divider ratio equals 2^N.
> + *
> + * A9 PLL is composed as follows:
> + *
> + *                      PLL
> + *         +---------------------------------+
> + *         |                                 |
> + *         |             +--+                |
> + *  in/2 >>---[ /2^N ]-->|  |      +-----+   |
> + *         |             |  |------| DCO |----->> out
> + *         |  +--------->|  |      +--v--+   |
> + *         |  |          +--+         |      |
> + *         |  |                       |      |
> + *         |  +--[ *(M + (F/Fmax) ]<--+      |
> + *         |                                 |
> + *         +---------------------------------+
> + *
> + * out = in / 2  * (m + frac / frac_max) / 2^n
> + */
> +
> +static struct clk_fixed_factor a9_gp0_in_div2_div = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gp0_in_div2_div",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "in0",
> +		},
> +		.num_parents = 1,
> +	},

You can use CLK_HW_INIT_FW_NAME() for the hw.init here and other places
below.

> +};
> +
> +static struct clk_regmap a9_gp0_in_div2 = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = GP0PLL_CTRL0,
> +		.bit_idx = 27,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "gp0_in_div2",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_gp0_in_div2_div.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +/* The output frequency range of the A9 PLL_DCO is 1.4 GHz to 2.8 GHz. */
> +static const struct pll_mult_range a9_pll_mult_range = {
> +	.min = 117,
> +	.max = 233,
> +};
> +
> +static const struct reg_sequence a9_gp0_pll_init_regs[] = {
> +	{ .reg = GP0PLL_CTRL0, .def = 0x00010000 },
> +	{ .reg = GP0PLL_CTRL1, .def = 0x11480000 },
> +	{ .reg = GP0PLL_CTRL2, .def = 0x1219b010 },
> +	{ .reg = GP0PLL_CTRL3, .def = 0x00008010 }
> +};
> +
> +static struct clk_regmap a9_gp0_pll_dco = {
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
> +		.n = {
> +			.reg_off = GP0PLL_CTRL0,
> +			.shift   = 12,
> +			.width   = 3,
> +		},
> +		.frac = {
> +			.reg_off = GP0PLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 17,
> +		},
> +		.l = {
> +			.reg_off = GP0PLL_CTRL0,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = GP0PLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.l_detect = {
> +			.reg_off = GP0PLL_CTRL0,
> +			.shift   = 30,
> +			.width   = 1,
> +		},
> +		.range = &a9_pll_mult_range,
> +		.init_regs = a9_gp0_pll_init_regs,
> +		.init_count = ARRAY_SIZE(a9_gp0_pll_init_regs),
> +		.flags = CLK_MESON_PLL_RST_ACTIVE_LOW |
> +			 CLK_MESON_PLL_N_POWER_OF_TWO |
> +			 CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "gp0_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_gp0_in_div2.hw
> +		},
> +		.num_parents = 1,
> +	},

You can use CLK_HW_INIT_HWS() here and other places below.

Brian


> +};
> +
> +/* For gp0, hifi and mclk pll, the maximum value of od is 4. */
> +static const struct clk_div_table a9_pll_od_table[] = {
> +	{ 0,  1 },
> +	{ 1,  2 },
> +	{ 2,  4 },
> +	{ 3,  8 },
> +	{ 4,  16 },
> +	{ /* sentinel */ }
> +};
> +
> +static struct clk_regmap a9_gp0_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = GP0PLL_CTRL0,
> +		.shift = 20,
> +		.width = 3,
> +		.table = a9_pll_od_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "gp0_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_gp0_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_fixed_factor a9_hifi0_in_div2_div = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "hifi0_in_div2_div",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "in0",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_hifi0_in_div2 = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = HIFIPLL_CTRL0,
> +		.bit_idx = 27,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi0_in_div2",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_hifi0_in_div2_div.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static const struct reg_sequence a9_hifi0_pll_init_regs[] = {
> +	{ .reg = HIFIPLL_CTRL0, .def = 0x00010000 },
> +	{ .reg = HIFIPLL_CTRL1, .def = 0x11480000 },
> +	{ .reg = HIFIPLL_CTRL2, .def = 0x1219b010 },
> +	{ .reg = HIFIPLL_CTRL3, .def = 0x00008010 }
> +};
> +
> +static struct clk_regmap a9_hifi0_pll_dco = {
> +	.data = &(struct meson_clk_pll_data) {
> +		.en = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 9,
> +		},
> +		.n = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 12,
> +			.width   = 3,
> +		},
> +		.frac = {
> +			.reg_off = HIFIPLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 17,
> +		},
> +		.l = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.l_detect = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 30,
> +			.width   = 1,
> +		},
> +		.range = &a9_pll_mult_range,
> +		.init_regs = a9_hifi0_pll_init_regs,
> +		.init_count = ARRAY_SIZE(a9_hifi0_pll_init_regs),
> +		.frac_max = 100000,
> +		.flags = CLK_MESON_PLL_RST_ACTIVE_LOW |
> +			 CLK_MESON_PLL_N_POWER_OF_TWO |
> +			 CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi0_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_hifi0_in_div2.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_hifi0_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = HIFIPLL_CTRL0,
> +		.shift = 20,
> +		.width = 3,
> +		.table = a9_pll_od_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi0_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_hifi0_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_fixed_factor a9_hifi1_in_div2_div = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "hifi1_in_div2_div",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "in0",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_hifi1_in_div2 = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = HIFIPLL_CTRL0,
> +		.bit_idx = 27,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi1_in_div2",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_hifi1_in_div2_div.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static const struct reg_sequence a9_hifi1_pll_init_regs[] = {
> +	{ .reg = HIFIPLL_CTRL0, .def = 0x00010000 },
> +	{ .reg = HIFIPLL_CTRL1, .def = 0x11480000 },
> +	{ .reg = HIFIPLL_CTRL2, .def = 0x1219b011 },
> +	{ .reg = HIFIPLL_CTRL3, .def = 0x00008010 }
> +};
> +
> +static struct clk_regmap a9_hifi1_pll_dco = {
> +	.data = &(struct meson_clk_pll_data) {
> +		.en = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 9,
> +		},
> +		.n = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 12,
> +			.width   = 3,
> +		},
> +		.frac = {
> +			.reg_off = HIFIPLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 17,
> +		},
> +		.l = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.l_detect = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 30,
> +			.width   = 1,
> +		},
> +		.range = &a9_pll_mult_range,
> +		.init_regs = a9_hifi1_pll_init_regs,
> +		.init_count = ARRAY_SIZE(a9_hifi1_pll_init_regs),
> +		.frac_max = 100000,
> +		.flags = CLK_MESON_PLL_RST_ACTIVE_LOW |
> +			 CLK_MESON_PLL_N_POWER_OF_TWO |
> +			 CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi1_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_hifi1_in_div2.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_hifi1_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = HIFIPLL_CTRL0,
> +		.shift = 20,
> +		.width = 3,
> +		.table = a9_pll_od_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi1_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_hifi1_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +/*
> + * Unlike GP0 and HIFI PLLs, the input divider 2 of MCLK PLL is
> + * enabled by default and has no enable control bit.
> + */
> +static struct clk_fixed_factor a9_mclk0_in_div2 = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mclk0_in_div2_div",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "in0",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static const struct reg_sequence a9_mclk0_pll_init_regs[] = {
> +	{ .reg = MCLKPLL_CTRL1, .def = 0x00422000 },
> +	{ .reg = MCLKPLL_CTRL2, .def = 0x60000100 },
> +	{ .reg = MCLKPLL_CTRL3, .def = 0x02000200 },
> +	{ .reg = MCLKPLL_CTRL4, .def = 0xd616d616 }
> +};
> +
> +static struct clk_regmap a9_mclk0_pll_dco = {
> +	.data = &(struct meson_clk_pll_data) {
> +		.en = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 9,
> +		},
> +		.n = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 12,
> +			.width   = 3,
> +		},
> +		.l = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.l_detect = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 30,
> +			.width   = 1,
> +		},
> +		.range = &a9_pll_mult_range,
> +		.init_regs = a9_mclk0_pll_init_regs,
> +		.init_count = ARRAY_SIZE(a9_mclk0_pll_init_regs),
> +		.flags = CLK_MESON_PLL_RST_ACTIVE_LOW |
> +			 CLK_MESON_PLL_N_POWER_OF_TWO |
> +			 CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk0_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk0_in_div2.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_mclk0_0_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = MCLKPLL_CTRL3,
> +		.shift = 0,
> +		.width = 3,
> +		.table = a9_pll_od_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk0_0_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk0_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_mclk0_0_pre = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = MCLKPLL_CTRL3,
> +		.shift = 3,
> +		.width = 5,
> +		.flags = CLK_DIVIDER_MAX_AT_ZERO,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk0_0_pre",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk0_0_pll.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct clk_parent_data a9_mclk0_0_parents[] = {
> +	{ .hw = &a9_mclk0_0_pre.hw },
> +	{ .fw_name = "in0" },
> +	{ .fw_name = "in1" },
> +	{ .fw_name = "in2" }
> +};
> +
> +static A9_COMP_SEL(mclk0_0, MCLKPLL_CTRL3, 12, 0x3, a9_mclk0_0_parents);
> +static A9_COMP_DIV(mclk0_0, MCLKPLL_CTRL3, 10, 1);
> +static A9_COMP_GATE(mclk0_0, MCLKPLL_CTRL3, 8);
> +
> +static struct clk_regmap a9_mclk0_1_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = MCLKPLL_CTRL3,
> +		.shift = 16,
> +		.width = 3,
> +		.table = a9_pll_od_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk0_1_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk0_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_mclk0_1_pre = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = MCLKPLL_CTRL3,
> +		.shift = 19,
> +		.width = 5,
> +		.flags = CLK_DIVIDER_MAX_AT_ZERO,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk0_1_pre",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk0_1_pll.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct clk_parent_data a9_mclk0_1_parents[] = {
> +	{ .hw = &a9_mclk0_1_pre.hw },
> +	{ .fw_name = "in0" },
> +	{ .fw_name = "in1" },
> +	{ .fw_name = "in2" }
> +};
> +
> +static A9_COMP_SEL(mclk0_1, MCLKPLL_CTRL3, 28, 0x3, a9_mclk0_1_parents);
> +static A9_COMP_DIV(mclk0_1, MCLKPLL_CTRL3, 26, 1);
> +static A9_COMP_GATE(mclk0_1, MCLKPLL_CTRL3, 24);
> +
> +static struct clk_fixed_factor a9_mclk1_in_div2 = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mclk1_in_div2",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "in0",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_mclk1_pll_dco = {
> +	.data = &(struct meson_clk_pll_data) {
> +		.en = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 9,
> +		},
> +		.n = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 12,
> +			.width   = 3,
> +		},
> +		.l = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.l_detect = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 30,
> +			.width   = 1,
> +		},
> +		.range = &a9_pll_mult_range,
> +		.init_regs = a9_mclk0_pll_init_regs,
> +		.init_count = ARRAY_SIZE(a9_mclk0_pll_init_regs),
> +		.flags = CLK_MESON_PLL_RST_ACTIVE_LOW |
> +			 CLK_MESON_PLL_N_POWER_OF_TWO |
> +			 CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk1_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk1_in_div2.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_mclk1_0_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = MCLKPLL_CTRL3,
> +		.shift = 0,
> +		.width = 3,
> +		.table = a9_pll_od_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk1_0_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk1_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_mclk1_0_pre = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = MCLKPLL_CTRL3,
> +		.shift = 3,
> +		.width = 5,
> +		.flags = CLK_DIVIDER_MAX_AT_ZERO,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk1_0_pre",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk1_0_pll.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct clk_parent_data a9_mclk1_0_parents[] = {
> +	{ .hw = &a9_mclk1_0_pre.hw },
> +	{ .fw_name = "in0" },
> +	{ .fw_name = "in1" },
> +	{ .fw_name = "in2" }
> +};
> +
> +static A9_COMP_SEL(mclk1_0, MCLKPLL_CTRL3, 12, 0x3, a9_mclk1_0_parents);
> +static A9_COMP_DIV(mclk1_0, MCLKPLL_CTRL3, 10, 1);
> +static A9_COMP_GATE(mclk1_0, MCLKPLL_CTRL3, 8);
> +
> +static struct clk_regmap a9_mclk1_1_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = MCLKPLL_CTRL3,
> +		.shift = 16,
> +		.width = 3,
> +		.table = a9_pll_od_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk1_1_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk1_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_mclk1_1_pre = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = MCLKPLL_CTRL3,
> +		.shift = 19,
> +		.width = 5,
> +		.flags = CLK_DIVIDER_MAX_AT_ZERO,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk1_1_pre",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk1_1_pll.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct clk_parent_data a9_mclk1_1_parents[] = {
> +	{ .hw = &a9_mclk1_1_pre.hw },
> +	{ .fw_name = "in0" },
> +	{ .fw_name = "in1" },
> +	{ .fw_name = "in2" }
> +};
> +
> +static A9_COMP_SEL(mclk1_1, MCLKPLL_CTRL3, 28, 0x3, a9_mclk1_1_parents);
> +static A9_COMP_DIV(mclk1_1, MCLKPLL_CTRL3, 26, 1);
> +static A9_COMP_GATE(mclk1_1, MCLKPLL_CTRL3, 24);
> +
> +static struct clk_hw *a9_gp0_hw_clks[] = {
> +	[CLKID_GP0_IN_DIV2_DIV]		= &a9_gp0_in_div2_div.hw,
> +	[CLKID_GP0_IN_DIV2]		= &a9_gp0_in_div2.hw,
> +	[CLKID_GP0_PLL_DCO]		= &a9_gp0_pll_dco.hw,
> +	[CLKID_GP0_PLL]			= &a9_gp0_pll.hw,
> +};
> +
> +static struct clk_hw *a9_hifi0_hw_clks[] = {
> +	[CLKID_HIFI0_IN_DIV2_DIV]	= &a9_hifi0_in_div2_div.hw,
> +	[CLKID_HIFI0_IN_DIV2]		= &a9_hifi0_in_div2.hw,
> +	[CLKID_HIFI0_PLL_DCO]		= &a9_hifi0_pll_dco.hw,
> +	[CLKID_HIFI0_PLL]		= &a9_hifi0_pll.hw,
> +};
> +
> +static struct clk_hw *a9_hifi1_hw_clks[] = {
> +	[CLKID_HIFI1_IN_DIV2_DIV]	= &a9_hifi1_in_div2_div.hw,
> +	[CLKID_HIFI1_IN_DIV2]		= &a9_hifi1_in_div2.hw,
> +	[CLKID_HIFI1_PLL_DCO]		= &a9_hifi1_pll_dco.hw,
> +	[CLKID_HIFI1_PLL]		= &a9_hifi1_pll.hw,
> +};
> +
> +static struct clk_hw *a9_mclk0_hw_clks[] = {
> +	[CLKID_MCLK0_IN_DIV2]		= &a9_mclk0_in_div2.hw,
> +	[CLKID_MCLK0_PLL_DCO]		= &a9_mclk0_pll_dco.hw,
> +	[CLKID_MCLK0_0_PLL]		= &a9_mclk0_0_pll.hw,
> +	[CLKID_MCLK0_0_PRE]		= &a9_mclk0_0_pre.hw,
> +	[CLKID_MCLK0_0_SEL]		= &a9_mclk0_0_sel.hw,
> +	[CLKID_MCLK0_0_DIV]		= &a9_mclk0_0_div.hw,
> +	[CLKID_MCLK0_0]			= &a9_mclk0_0.hw,
> +	[CLKID_MCLK0_1_PLL]		= &a9_mclk0_1_pll.hw,
> +	[CLKID_MCLK0_1_PRE]		= &a9_mclk0_1_pre.hw,
> +	[CLKID_MCLK0_1_SEL]		= &a9_mclk0_1_sel.hw,
> +	[CLKID_MCLK0_1_DIV]		= &a9_mclk0_1_div.hw,
> +	[CLKID_MCLK0_1]			= &a9_mclk0_1.hw,
> +};
> +
> +static struct clk_hw *a9_mclk1_hw_clks[] = {
> +	[CLKID_MCLK1_IN_DIV2]		= &a9_mclk1_in_div2.hw,
> +	[CLKID_MCLK1_PLL_DCO]		= &a9_mclk1_pll_dco.hw,
> +	[CLKID_MCLK1_0_PLL]		= &a9_mclk1_0_pll.hw,
> +	[CLKID_MCLK1_0_PRE]		= &a9_mclk1_0_pre.hw,
> +	[CLKID_MCLK1_0_SEL]		= &a9_mclk1_0_sel.hw,
> +	[CLKID_MCLK1_0_DIV]		= &a9_mclk1_0_div.hw,
> +	[CLKID_MCLK1_0]			= &a9_mclk1_0.hw,
> +	[CLKID_MCLK1_1_PLL]		= &a9_mclk1_1_pll.hw,
> +	[CLKID_MCLK1_1_PRE]		= &a9_mclk1_1_pre.hw,
> +	[CLKID_MCLK1_1_SEL]		= &a9_mclk1_1_sel.hw,
> +	[CLKID_MCLK1_1_DIV]		= &a9_mclk1_1_div.hw,
> +	[CLKID_MCLK1_1]			= &a9_mclk1_1.hw,
> +};
> +
> +static const struct meson_clkc_data a9_gp0_data = {
> +	.hw_clks = {
> +		.hws = a9_gp0_hw_clks,
> +		.num = ARRAY_SIZE(a9_gp0_hw_clks),
> +	},
> +};
> +
> +static const struct meson_clkc_data a9_hifi0_data = {
> +	.hw_clks = {
> +		.hws = a9_hifi0_hw_clks,
> +		.num = ARRAY_SIZE(a9_hifi0_hw_clks),
> +	},
> +};
> +
> +static const struct meson_clkc_data a9_hifi1_data = {
> +	.hw_clks = {
> +		.hws = a9_hifi1_hw_clks,
> +		.num = ARRAY_SIZE(a9_hifi1_hw_clks),
> +	},
> +};
> +
> +static const struct meson_clkc_data a9_mclk0_data = {
> +	.hw_clks = {
> +		.hws = a9_mclk0_hw_clks,
> +		.num = ARRAY_SIZE(a9_mclk0_hw_clks),
> +	},
> +};
> +
> +static const struct meson_clkc_data a9_mclk1_data = {
> +	.hw_clks = {
> +		.hws = a9_mclk1_hw_clks,
> +		.num = ARRAY_SIZE(a9_mclk1_hw_clks),
> +	},
> +};
> +
> +static const struct of_device_id a9_pll_clkc_match_table[] = {
> +	{ .compatible = "amlogic,a9-gp0-pll",	.data = &a9_gp0_data, },
> +	{ .compatible = "amlogic,a9-hifi0-pll",	.data = &a9_hifi0_data, },
> +	{ .compatible = "amlogic,a9-hifi1-pll",	.data = &a9_hifi1_data, },
> +	{ .compatible = "amlogic,a9-mclk0-pll",	.data = &a9_mclk0_data, },
> +	{ .compatible = "amlogic,a9-mclk1-pll", .data = &a9_mclk1_data, },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, a9_pll_clkc_match_table);
> +
> +static struct platform_driver a9_pll_clkc_driver = {
> +	.probe		= meson_clkc_mmio_probe,
> +	.driver		= {
> +		.name	= "a9-pll-clkc",
> +		.of_match_table = a9_pll_clkc_match_table,
> +	},
> +};
> +module_platform_driver(a9_pll_clkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic A9 PLL Clock Controller Driver");
> +MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("CLK_MESON");
> 
> -- 
> 2.47.1
> 
> 

