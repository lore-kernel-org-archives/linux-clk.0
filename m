Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444255;
	b=01lY87tIwN6wDmNOXycRzT+rLB2VZZa65kZuzNmyEbZY2GncZXvkiG6QOzgQkdxQ+MD0
	 3fvBvccLo78TsQT/VGh2mu6xmYfBxGW0ayQ5Ip1q/RIBT2C7+i7EymA2ScVddf5Tp8nJp
	 GzpNWBatYs/5WbUWs/bIWPM9KjxMyKBXAAsWqh0E9cnsGMt0C7csQZm9CrifRax8UxrsX
	 1MWUwQ8kckeExZSg8FO8KFWfhoQ1enyM1WA0cjYO5kYHDVfQz6tkUxYts7yYrb2nTJ2cw
	 zjxYHuJ7RekZf7VmTwZRBbAomuz+fckMnvjKPEZy15Afe66oq2+BRLDl4MOhDvjQcQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444255;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=gjKALxOJFxG8UPiX46nDuXcwHUPMssJRgdYUqts3/dE=;
	b=j5c+g5ROMYLh/2mfoUJPEofHiSfKWBjKVDSZudxkOqXr9o955ptMUUShzII179xts9BX
	 ta3owzd8Uwbbc8yZLpMsMSvbHyEapM7WU8VdYfEMOubGqOEOUwuj1UDGZX5kqHjuxz+fg
	 QzmT3Eu8KPoABRGU6IwTC+lsFA/a0mAIDcr6z1vIn8Dh1rZQ+rdfm9UUCkUV90CCyMmeT
	 bA2ZtENDjuDYNyXtZDtR+1KbqbktXhJIxE0VNJD3rNBNzcSZg5F2MJUIO4rGreItWLhnd
	 CaTjNuTsG1GQ6lnSEuihAVFoP/jcJlRfEpOydnG+xY4MbnImXvPjXG1V0hQg4etO9eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mzxajcvg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407E6606A321;
	Thu, 12 Nov 2026 00:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mzxajcvg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7443D1F00A05;
	Thu, 12 Nov 2026 00:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794444254;
	bh=gjKALxOJFxG8UPiX46nDuXcwHUPMssJRgdYUqts3/dE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mzxajcvgAkvhwfEdzB25fKJhTZUHAj8SD/wf32E1pJNu9cPU8MKu+RYBrTFytCT1k
	 4fheQAzH4EgEJGVM7XuXSjUY3biTBc+lB0i+++l2lqAYb4/oBECVoUnX4MB1PM2Hx4
	 n8X5uYdMXQoNHFZdP7h9XW2sMMfLd4jbKtw8JEWubCRJv8mOxD7d3Lb9dVxkB+dRWq
	 ndNp0JjHE7Y98RJZO90TIC7zf62VB/NfO8d00KNtbZKLbn448dFBpxqrP3lwG87DFA
	 Ac8CuMRduxFB0bUCM7dz6d13H9rB/uzpFOn7d9e+c1nrRW0BR9ooHV5Y5o1YDZdIkT
	 3FVIalTGAYpMw==
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
Subject: Re: [PATCH v2 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
From: Brian Masney <masneyb@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-3-624559bb8ec7@foss.st.com>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v2-3-624559bb8ec7@foss.st.com>
Date: Wed, 11 Nov 2026 19:44:08 -0500
Message-Id: <179444424838.1126566.15847633472676891180.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=7204; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=TiNTrbXao3sKZzrEQ2J3r1cIhFom2KEL9P62Ql6x9l8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+ct9Sknq0Ry+unclc8lRjrZzp67Z+oyfTGay7Fy1rc
 Frdo7ixo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIl4nWdkmOfSeCji/1arRofp
 NknnhTx8mw+ls+8/OLH228L/bAW+HAz/zL623bin+0onUEJvJ6+m7f9vElw3P09oVInZJpr1uFO
 GFwA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Gabriel,

> On STM32MP23x and STM32MP25x, the LTDC pixel clock is selected in the
> SYSCFG DISPLAYCLKCR register among the DSI PHY byte lane clock, the LVDS
> PHY pixel clock (reset value) and the LTDC kernel clock, the latter
> being the one needed by the RGB (DPI) output.
> 
> No driver registers this clock, so the selection can't be changed from
> its reset value and a display connected to the LTDC RGB output can't
> work.
> 
> Add a driver registering this clock as a mux. The SYSCFG node is bound
> to the STM32MP2 SYSCFG driver, which populates its sub-nodes, so the
> driver is probed from the "st,stm32mp25-syscfg-clk" clock-controller
> sub-node and uses the regmap of the parent SYSCFG node. The mux parents
> are taken from the "clocks" property of the sub-node, and the clock is
> exposed through a onecell provider so that the other SYSCFG clocks can
> be added later.
> 
> Co-developed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  drivers/clk/stm32/Kconfig                |  11 +++
>  drivers/clk/stm32/Makefile               |   1 +
>  drivers/clk/stm32/clk-stm32mp25-syscfg.c | 134 +++++++++++++++++++++++++++++++
>  3 files changed, 146 insertions(+)
>
> diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
> index 5dbd75cde657..a298983f5511 100644
> --- a/drivers/clk/stm32/Kconfig
> +++ b/drivers/clk/stm32/Kconfig
> @@ -39,5 +39,16 @@ config COMMON_CLK_STM32MP257
>  	help
>  	  Support for stm32mp25x SoC family clocks.
>  
> +config COMMON_CLK_STM32MP25_SYSCFG
> +	tristate "Clock driver for stm32mp25x SYSCFG clocks"
> +	depends on COMMON_CLK_STM32MP257

Note for my future reference: The common has || COMPILE_TEST already.

Also add:

depends on SOC_STM32MP2 || COMPILE_TEST

> +	select MFD_SYSCON
> +	default COMMON_CLK_STM32MP257
> +	help
> +	  Support for the clocks provided by the stm32mp25x SYSCFG, i.e.
> +	  the LTDC pixel clock source selection between the LTDC kernel
> +	  clock (RGB output), the LVDS PHY pixel clock and the DSI byte
> +	  lane clock.
> +
>  endif
>  
> diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
> index e04727b59449..8088d172651f 100644
> --- a/drivers/clk/stm32/Makefile
> +++ b/drivers/clk/stm32/Makefile
> @@ -2,3 +2,4 @@ obj-$(CONFIG_COMMON_CLK_STM32MP135)	+= clk-stm32mp13.o clk-stm32-core.o reset-st
>  obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o reset-stm32.o
>  obj-$(CONFIG_COMMON_CLK_STM32MP215)	+= clk-stm32mp21.o clk-stm32-core.o reset-stm32.o
>  obj-$(CONFIG_COMMON_CLK_STM32MP257)	+= clk-stm32mp25.o clk-stm32-core.o reset-stm32.o
> +obj-$(CONFIG_COMMON_CLK_STM32MP25_SYSCFG)	+= clk-stm32mp25-syscfg.o
> diff --git a/drivers/clk/stm32/clk-stm32mp25-syscfg.c b/drivers/clk/stm32/clk-stm32mp25-syscfg.c
> new file mode 100644
> index 000000000000..69b9a7592838
> --- /dev/null
> +++ b/drivers/clk/stm32/clk-stm32mp25-syscfg.c
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) STMicroelectronics 2023 - All Rights Reserved

It's currently 2026.

> + * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/st,stm32mp25-syscfg-clk.h>
> +
> +#define SYSCFG_DISPLAYCLKCR		0x5000
> +#define DISPLAYCLKCR_DPIVSLVDS		GENMASK(1, 0)
> +
> +#define STM32MP25_SYSCFG_NUM_CLKS	(CK_SYSCFG_PIX_LTDC + 1)
> +
> +/*
> + * The LTDC pixel clock source is selected in SYSCFG_DISPLAYCLKCR among
> + * the DSI byte lane clock, the LVDS PHY pixel clock (reset value) and
> + * the LTDC kernel clock, which is used with the RGB (DPI) output.
> + *
> + * The parents are listed in the DPIVSLVDS field order, while .index refers
> + * to the "clocks" property of the node, ordered "ltdc", "lvds", "dsi" so
> + * that the inputs missing on a SoC can be omitted at the end of the list.
> + */
> +static const struct clk_parent_data clk_pix_ltdc_parents[] = {
> +	{ .index = 2 },	/* dsi */
> +	{ .index = 1 },	/* lvds */
> +	{ .index = 0 },	/* ltdc */
> +};
> +
> +struct stm32mp25_syscfg_mux {
> +	struct clk_hw hw;
> +	struct regmap *regmap;
> +};
> +
> +static inline struct stm32mp25_syscfg_mux *to_syscfg_mux(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct stm32mp25_syscfg_mux, hw);
> +}
> +
> +static u8 stm32mp25_syscfg_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct stm32mp25_syscfg_mux *mux = to_syscfg_mux(hw);
> +	unsigned int val;
> +
> +	regmap_read(mux->regmap, SYSCFG_DISPLAYCLKCR, &val);

regmap return value is not checked and val is uninitialized if an error
occurs.

> +
> +	return FIELD_GET(DISPLAYCLKCR_DPIVSLVDS, val);
> +}
> +
> +static int stm32mp25_syscfg_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct stm32mp25_syscfg_mux *mux = to_syscfg_mux(hw);
> +
> +	return regmap_update_bits(mux->regmap, SYSCFG_DISPLAYCLKCR,
> +				  DISPLAYCLKCR_DPIVSLVDS,
> +				  FIELD_PREP(DISPLAYCLKCR_DPIVSLVDS, index));
> +}
> +
> +static const struct clk_ops stm32mp25_syscfg_mux_ops = {
> +	.get_parent = stm32mp25_syscfg_mux_get_parent,
> +	.set_parent = stm32mp25_syscfg_mux_set_parent,
> +	.determine_rate = clk_hw_determine_rate_no_reparent,
> +};
> +
> +static int stm32mp25_syscfg_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct clk_hw_onecell_data *clk_data;
> +	struct clk_init_data init = { };
> +	struct stm32mp25_syscfg_mux *mux;
> +	int ret;

Put in reverse Christmas tree order.

> +
> +	clk_data = devm_kzalloc_flex(dev, *clk_data, hws,
> +				     STM32MP25_SYSCFG_NUM_CLKS);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	clk_data->num = STM32MP25_SYSCFG_NUM_CLKS;
> +
> +	mux = devm_kzalloc_obj(dev, *mux);
> +	if (!mux)
> +		return -ENOMEM;
> +
> +	/* The mux is a sub-node of the SYSCFG, whose regmap it shares */
> +	mux->regmap = syscon_node_to_regmap(dev->parent->of_node);

Instead of dev->parent->of_node, you can use:

    struct device_node *np __free(device_node) = of_get_parent(dev->of_node);
    mux->regmap = syscon_node_to_regmap(np);

> +	if (IS_ERR(mux->regmap))
> +		return dev_err_probe(dev, PTR_ERR(mux->regmap),
> +				     "failed to get the SYSCFG regmap\n");
> +
> +	init.name = "clk_pix_ltdc";
> +	init.ops = &stm32mp25_syscfg_mux_ops;
> +	init.parent_data = clk_pix_ltdc_parents;
> +	init.num_parents = ARRAY_SIZE(clk_pix_ltdc_parents);
> +	init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;

clk_hw_determine_rate_no_reparent() already prevents reparenting, so
CLK_SET_RATE_NO_REPARENT is redundant here. It doesn't hurt anything
though.

Brian

-- 
Brian Masney <masneyb@kernel.org>
