Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E883825785D;
	Fri,  9 Oct 2026 17:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565346; cv=none; b=TxsiQ+yZutffX0jDvLj/krf6WRaeV9Xd1mcRjn3wDqA3QX1aGRJopnwutCAFeY5GpBeqcZtEB0lCDMnm4+TgaXGWjs/SKRMb27NlN+iwFVyvybk56ZAnIRLBpdpGxe3P13aieSxM5RD4JGSQ8cq/t+o6SrIU3VypbCv6wqH68+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565346; c=relaxed/simple;
	bh=Nbaxx1cYT8/hi0/ylkMqXJ+kHR5HgrXz/PNLs+1XKS4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=cVNPk+k7n3RiIOZiRKxpm8tctYd3mNduk2/yFMrg0ApBzltH1wHi+gSYQcjjZz2fJ3LeOGeIHzlgGTxRQnNtAP1FBAp0XNXew8xT22vUn4ZdhHCaxvSNQ6M9AgFWhxVCbqs7XKgD/CAKOny5IcLxjt91x93Rm0LqJCmJg+0B/Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnVLwOUh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnVLwOUh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542151F000FF;
	Fri,  9 Oct 2026 17:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791565344;
	bh=5dMVbJnI19moENBSqVQMDpVDPhFrQzEaV/+VuGW6XHU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=MnVLwOUhgOJPC/uZi5mCOu/LRQrkel5tXE0qY/cgmI7sUAYT4PtwqXMiNAGQr1hdr
	 SJY+QBzuN7FLFXeTlr2WROHrbrLeygFZNc4RGDsray9vpLSzymMjiaQoOeXENH+sXx
	 9lzd5rtSGtNxbqhSxOFWB/qU+H257K98FYkm0lnbg56rc7bMROZ/w4syMn2NAqbG3J
	 bBKTmjmODndbtrBSjxM1gDBT7yyzimkvl/beqowHexy3D3+pxhiaRGf5APSWP1CYJ2
	 ILPVCSerolSK+kObLdo8jAgHZh1SJoULi5Nl7iIZjvEitEYox/wdQayRyJUMcb9s7B
	 hiowh3rYLwwFg==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] clk: ambarella: add CV75 RCT clock controller
From: Brian Masney <masneyb@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261009-cv75-clk-v1-2-6959b4da83c5@ambarella.com>
References: <20261009-cv75-clk-v1-0-6959b4da83c5@ambarella.com>
 <20261009-cv75-clk-v1-2-6959b4da83c5@ambarella.com>
Date: Fri, 09 Oct 2026 19:02:06 +0200
Message-Id: <179156532625.79180.13840464074277826113.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11601; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=Nbaxx1cYT8/hi0/ylkMqXJ+kHR5HgrXz/PNLs+1XKS4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJOykm/O/RK4ebfqFLu75qz7tt4zFt/Z8upKLHmzqmaT
 qFJZ2U/dZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRu9GMDLu31Pvf1nyX58t7
 2EFwpbb2oyMecgs23F65QtOPVev3zwyG/2lfljuwTLq84YCx4f/v3RrPs/+2/G3/2fdmhbP2rFK
 /VQwA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Long,

> Add a table-driven CCF driver for the CV75 root clock tree. Register
> the core PLL, AHB/APB fixed factors and UART0 composite clock, with
> osc supplied via clk_parent_data.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

The dt binding mentions a reset however I don't see any reference to it
in the driver.

>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 37a8e35d4178..6bfa2c8fffe1 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -510,6 +510,7 @@ config COMMON_CLK_RPMI
>  	  the RISC-V platform management interface (RPMI) specification.
>  
>  source "drivers/clk/actions/Kconfig"
> +source "drivers/clk/ambarella/Kconfig"
>  source "drivers/clk/analogbits/Kconfig"
>  source "drivers/clk/anlogic/Kconfig"
>  source "drivers/clk/aspeed/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 52d138d4ffc8..99377a13ebc5 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -125,6 +125,7 @@ obj-$(CONFIG_COMMON_CLK_XGENE)		+= clk-xgene.o
>  
>  # please keep this section sorted lexicographically by directory path name
>  obj-y					+= actions/
> +obj-y					+= ambarella/
>  obj-y					+= analogbits/
>  obj-y					+= anlogic/
>  obj-y					+= aspeed/
> diff --git a/drivers/clk/ambarella/Kconfig b/drivers/clk/ambarella/Kconfig
> new file mode 100644
> index 000000000000..720eebdc5c9c
> --- /dev/null
> +++ b/drivers/clk/ambarella/Kconfig
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config CLK_AMBARELLA_CV75
> +	bool "Ambarella CV75 RCT clock controller"
> +	depends on ARCH_AMBARELLA || COMPILE_TEST
> +	default ARCH_AMBARELLA
> +	help
> +	  Say Y to enable the Ambarella CV75 RCT clock controller for
> +	  early bring-up clocks (core PLL, AHB, APB, UART0).
> diff --git a/drivers/clk/ambarella/Makefile b/drivers/clk/ambarella/Makefile
> new file mode 100644
> index 000000000000..29555e452441
> --- /dev/null
> +++ b/drivers/clk/ambarella/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_CLK_AMBARELLA_CV75) += clk-cv75.o
> diff --git a/drivers/clk/ambarella/clk-cv75.c b/drivers/clk/ambarella/clk-cv75.c
> new file mode 100644
> index 000000000000..7135402a36ec
> --- /dev/null
> +++ b/drivers/clk/ambarella/clk-cv75.c
> @@ -0,0 +1,361 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Ambarella CV75 RCT clock controller
> + *
> + * Copyright (C) 2026 Ambarella, Inc.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/overflow.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
> +#include <dt-bindings/clock/ambarella,cv75-rct.h>
> +
> +#define CV75_NUM_CLKS		(CV75_GCLK_APB + 1)
> +
> +#define PLL_CTRL_BYPASS		BIT(2)
> +#define PLL_CTRL_FRAC_MODE	BIT(3)
> +#define PLL_CTRL_FORCE_RESET	BIT(4)
> +#define PLL_CTRL_POWER_DOWN	BIT(5)
> +#define PLL_CTRL_HALT_VCO	BIT(6)
> +#define PLL_CTRL_SDIV		GENMASK(15, 12)
> +#define PLL_CTRL_SOUT		GENMASK(19, 16)
> +#define PLL_CTRL_INTP		GENMASK(30, 24)
> +
> +#define PLL_CTRL2_VCODIV_DIV2	BIT(8)
> +#define PLL_CTRL2_FSDIV_DIV2	BIT(9)
> +#define PLL_CTRL2_FSOUT_DIV2	BIT(11)
> +#define PLL_CTRL2_BYPASS_HSDIV	BIT(12)
> +
> +struct cv75_pll_regs {
> +	u32 ctrl;
> +	u32 frac;
> +	u32 ctrl2;
> +};
> +
> +struct cv75_pll_hw {
> +	struct clk_hw hw;
> +	struct cv75_pll_regs regs;
> +};
> +
> +struct cv75_clk {
> +	void __iomem *base;
> +	spinlock_t lock;
> +	struct cv75_pll_hw core;
> +	struct cv75_pll_hw enet;
> +	struct cv75_pll_hw sd;
> +};
> +
> +struct cv75_pll {
> +	const char *name;
> +	struct cv75_pll_hw *hw;
> +	unsigned long flags;
> +	struct cv75_pll_regs regs;
> +	int id;
> +};
> +
> +struct cv75_fixed_factor {
> +	const char *name;
> +	u32 id;
> +	struct u16_fract ratio;
> +};
> +
> +struct cv75_composite {
> +	const char *name;
> +	const struct clk_parent_data *parents;
> +	unsigned long flags;
> +	u32 id;
> +	u16 mux_reg;
> +	u16 div_reg;
> +	u8 num_parents;
> +	u8 mux_shift;
> +	u8 mux_width;
> +	u8 div_shift;
> +	u8 div_width;
> +};
> +
> +struct cv75_composite_hw {
> +	struct clk_mux mux;
> +	struct clk_divider div;
> +	struct clk_gate gate;
> +};
> +
> +static struct cv75_clk cv75_ccu;
> +
> +#define CV75_PLL(_id, _name, _ctrl, _frac, _ctrl2, _flags, _hw) {	\
> +	.name	= _name,						\
> +	.hw	= _hw,							\
> +	.flags	= _flags,						\
> +	.regs	= {							\
> +		.ctrl = _ctrl,						\
> +		.frac = _frac,						\
> +		.ctrl2 = _ctrl2,					\
> +	},								\
> +	.id	= _id,							\
> +}
> +
> +static const struct cv75_pll cv75_plls[] = {
> +	CV75_PLL(CV75_GCLK_CORE, "core", 0x000, 0x004, 0x100,
> +		 CLK_GET_RATE_NOCACHE | CLK_IS_CRITICAL, &cv75_ccu.core),
> +	CV75_PLL(-1, "pll_enet", 0x520, 0x524, 0x528,
> +		 CLK_GET_RATE_NOCACHE, &cv75_ccu.enet),
> +	CV75_PLL(-1, "pll_sd", 0x4ac, 0x4b0, 0x4b4,
> +		 CLK_GET_RATE_NOCACHE, &cv75_ccu.sd),

Why is CLK_GET_RATE_NOCACHE set on all of these?

> +};
> +
> +static const struct cv75_fixed_factor cv75_fixed_factors[] = {
> +	{ .id = CV75_GCLK_AHB, .name = "ahb", .ratio = { 1, 2 } },
> +	{ .id = CV75_GCLK_APB, .name = "apb", .ratio = { 1, 4 } },
> +};
> +
> +static const struct clk_parent_data cv75_uart_parents[] = {
> +	{ .fw_name = "osc" },
> +	{ .hw = &cv75_ccu.core.hw },
> +	{ .hw = &cv75_ccu.enet.hw },
> +	{ .hw = &cv75_ccu.sd.hw },
> +};
> +
> +#define CV75_COMPOSITE(_id, _name, _parents, _mreg, _mshift, _mwidth,	\
> +		       _dreg, _dshift, _dwidth, _flags)			\
> +{									\
> +	.id		= _id,						\
> +	.name		= _name,					\
> +	.parents	= _parents,					\
> +	.num_parents	= ARRAY_SIZE(_parents),				\
> +	.mux_reg	= _mreg,					\
> +	.mux_shift	= _mshift,					\
> +	.mux_width	= _mwidth,					\
> +	.div_reg	= _dreg,					\
> +	.div_shift	= _dshift,					\
> +	.div_width	= _dwidth,					\
> +	.flags		= _flags,					\
> +}
> +
> +static const struct cv75_composite cv75_composites[] = {
> +	CV75_COMPOSITE(CV75_GCLK_UART0, "uart0", cv75_uart_parents,
> +		       0x1c8, 0, 2, 0x038, 0, 24,
> +		       CLK_SET_RATE_NO_REPARENT),
> +};
> +
> +#define to_cv75_pll(_hw) container_of(_hw, struct cv75_pll_hw, hw)
> +
> +static unsigned long cv75_pll_recalc_rate(struct clk_hw *hw,
> +					  unsigned long parent_rate)
> +{
> +	struct cv75_pll_hw *pll = to_cv75_pll(hw);
> +	u32 ctrl, ctrl2, frac_val;
> +	u32 intp, sdiv, sout;
> +	u32 vcodiv, fsdiv, fsout;
> +	u64 vco, frac = 0;

Put in reverse Christmas tree order.

> +
> +	ctrl = readl_relaxed(cv75_ccu.base + pll->regs.ctrl);
> +	if (ctrl & (PLL_CTRL_POWER_DOWN | PLL_CTRL_HALT_VCO | PLL_CTRL_FORCE_RESET))
> +		return 0;
> +
> +	if (ctrl & PLL_CTRL_BYPASS)
> +		return parent_rate;
> +
> +	ctrl2 = readl_relaxed(cv75_ccu.base + pll->regs.ctrl2);
> +	intp = FIELD_GET(PLL_CTRL_INTP, ctrl) + 1;
> +	sdiv = FIELD_GET(PLL_CTRL_SDIV, ctrl) + 1;
> +	sout = FIELD_GET(PLL_CTRL_SOUT, ctrl) + 1;
> +	vcodiv = (ctrl2 & PLL_CTRL2_VCODIV_DIV2) ? 2 : 1;
> +	fsdiv = (ctrl2 & PLL_CTRL2_FSDIV_DIV2) ? 2 : 1;
> +	fsout = (ctrl2 & PLL_CTRL2_FSOUT_DIV2) ? 2 : 1;
> +
> +	vco = (u64)parent_rate * vcodiv * fsdiv * intp * sdiv;
> +	if (ctrl & PLL_CTRL_FRAC_MODE) {
> +		frac_val = readl_relaxed(cv75_ccu.base + pll->regs.frac);
> +		frac = mul_u64_u32_shr((u64)parent_rate * vcodiv * fsdiv * sdiv,
> +				       frac_val, 32);
> +		vco += frac;
> +	}
> +
> +	if (!(ctrl2 & PLL_CTRL2_BYPASS_HSDIV))
> +		vco = div_u64(vco, (u64)vcodiv * fsout * sout);
> +
> +	return vco;
> +}
> +
> +static const struct clk_ops cv75_pll_ops = {
> +	.recalc_rate = cv75_pll_recalc_rate,
> +};
> +
> +static int cv75_register_plls(struct device *dev,
> +			      struct clk_hw_onecell_data *data)
> +{
> +	struct clk_parent_data parent_data = { .fw_name = "osc" };
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(cv75_plls); i++) {
> +		const struct cv75_pll *desc = &cv75_plls[i];
> +		struct cv75_pll_hw *pll = desc->hw;
> +		struct clk_init_data init = {};
> +		int ret;
> +
> +		pll->regs = desc->regs;
> +
> +		init.name = desc->name;
> +		init.ops = &cv75_pll_ops;
> +		init.parent_data = &parent_data;
> +		init.num_parents = 1;
> +		init.flags = desc->flags;
> +		pll->hw.init = &init;
> +
> +		ret = devm_clk_hw_register(dev, &pll->hw);
> +		if (ret)
> +			return ret;
> +
> +		if (desc->id >= 0)
> +			data->hws[desc->id] = &pll->hw;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cv75_register_fixed_factors(struct device *dev,
> +				       struct clk_hw_onecell_data *data)
> +{
> +	for (unsigned int i = 0; i < ARRAY_SIZE(cv75_fixed_factors); i++) {
> +		const struct cv75_fixed_factor *f = &cv75_fixed_factors[i];
> +		struct clk_hw *hw;
> +
> +		hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, f->name,
> +								 &cv75_ccu.core.hw, 0,
> +								 f->ratio.numerator,
> +								 f->ratio.denominator);
> +		if (IS_ERR(hw))
> +			return PTR_ERR(hw);
> +
> +		data->hws[f->id] = hw;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct clk_hw *cv75_register_composite(struct device *dev,
> +					      const struct cv75_composite *c)
> +{
> +	const struct clk_ops *mux_ops = NULL, *div_ops = NULL, *gate_ops = NULL;
> +	struct clk_hw *mux_hw = NULL, *div_hw = NULL, *gate_hw = NULL;
> +	struct cv75_composite_hw *comp;
> +
> +	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
> +	if (!comp)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (c->mux_width) {
> +		comp->mux.reg = cv75_ccu.base + c->mux_reg;
> +		comp->mux.shift = c->mux_shift;
> +		comp->mux.mask = GENMASK(c->mux_width - 1, 0);
> +		comp->mux.lock = &cv75_ccu.lock;
> +		mux_hw = &comp->mux.hw;
> +		mux_ops = &clk_mux_ops;
> +	}
> +
> +	if (c->div_width) {
> +		comp->div.reg = cv75_ccu.base + c->div_reg;
> +		comp->div.shift = c->div_shift;
> +		comp->div.width = c->div_width;
> +		comp->div.flags = CLK_DIVIDER_ONE_BASED;
> +		comp->div.lock = &cv75_ccu.lock;
> +		div_hw = &comp->div.hw;
> +		div_ops = &clk_divider_ops;
> +
> +		comp->gate.reg = cv75_ccu.base + c->div_reg;
> +		comp->gate.bit_idx = c->div_shift + c->div_width;
> +		comp->gate.flags = CLK_GATE_SET_TO_DISABLE;
> +		comp->gate.lock = &cv75_ccu.lock;
> +		gate_hw = &comp->gate.hw;
> +		gate_ops = &clk_gate_ops;
> +	}
> +
> +	return devm_clk_hw_register_composite_pdata(dev, c->name, c->parents,
> +						    c->num_parents,
> +						    mux_hw, mux_ops,
> +						    div_hw, div_ops,
> +						    gate_hw, gate_ops, c->flags);
> +}
> +
> +static int cv75_register_composites(struct device *dev,
> +				    struct clk_hw_onecell_data *data)
> +{
> +	for (unsigned int i = 0; i < ARRAY_SIZE(cv75_composites); i++) {
> +		const struct cv75_composite *c = &cv75_composites[i];
> +		struct clk_hw *hw;
> +
> +		hw = cv75_register_composite(dev, c);
> +		if (IS_ERR(hw))
> +			return PTR_ERR(hw);
> +
> +		data->hws[c->id] = hw;
> +	}
> +
> +	return 0;
> +}

If you think that you'll have other SoC designs in the future, then you
should split out this functionality above into it's own .c file that you
can use as a library.

Brian

-- 
Brian Masney <masneyb@kernel.org>
