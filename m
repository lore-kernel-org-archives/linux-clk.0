Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:35915 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752322AbcCGLYv (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 7 Mar 2016 06:24:51 -0500
Received: by mail-wm0-f48.google.com with SMTP id n186so81019587wmn.1
        for <linux-clk@vger.kernel.org>; Mon, 07 Mar 2016 03:24:50 -0800 (PST)
Subject: Re: [PATCH 08/17] clk: Add PLX Technology OXNAS Standard Clocks
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
 <1457005210-18485-9-git-send-email-narmstrong@baylibre.com>
 <20160304022532.GE24999@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <56DD64FC.8040800@baylibre.com>
Date: Mon, 7 Mar 2016 12:24:44 +0100
MIME-Version: 1.0
In-Reply-To: <20160304022532.GE24999@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 03/04/2016 03:25 AM, Stephen Boyd wrote:
> On 03/03, Neil Armstrong wrote:
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index eca8e01..b75ef5c 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -192,6 +192,12 @@ config COMMON_CLK_PXA
>>  	---help---
>>  	  Sypport for the Marvell PXA SoC.
>>  
>> +config COMMON_CLK_OXNAS
>> +	def_bool COMMON_CLK
>> +	select MFD_SYSCON
> 
> So this is always built if I have the common clk framework
> enabled? Not good.
Fixed.

>> +#include <linux/clk.h>
>> +#include <linux/clkdev.h>
> 
> Are either of these includes used?
> 
>> +#include <linux/clk-provider.h>
>> +#include <linux/of.h>
>> +#include <linux/delay.h>
> 
> Is this include used?
> 
>> +#include <linux/stringify.h>
>> +#include <linux/reset.h>
> 
> Is this include used?
> 
>> +#include <linux/io.h>
> 
> Is this include used?
> 
>> +#include <linux/regmap.h>
>> +#include <linux/mfd/syscon.h>
> 
> #include <linux/kernel.h> for container_of?

Fixed an cleaned up, thanks.


>> +static int std_clk_enable(struct clk_hw *hw)
>> +{
>> +	struct clk_std *std = to_stdclk(hw);
>> +
>> +	regmap_write(std->regmap, CLK_SET_REGOFFSET, BIT(std->bit));
> 
> I hope the regmap is fast_io? Otherwise this is scheduling while
> atomic.
Yes, but due to the nature of the registers, I can't use the clk-regmap module.

>> +
>> +	return 0;
>> +}
>> +
>> +static void std_clk_disable(struct clk_hw *hw)
>> +{
>> +	struct clk_std *std = to_stdclk(hw);
>> +
>> +	regmap_write(std->regmap, CLK_CLR_REGOFFSET, BIT(std->bit));
>> +}
>> +
>> +static struct clk_ops std_clk_ops = {
> 
> const?
> 
>> +	.enable = std_clk_enable,
>> +	.disable = std_clk_disable,
>> +	.is_enabled = std_clk_is_enabled,
>> +};
>> +
> [..]
>> +
>> +static struct clk_hw *std_clk_hw_tbl[] = {
> 
> const?
> 
>> +	&clk_leon.hw,
>> +	&clk_dma_sgdma.hw,
>> +	&clk_cipher.hw,
>> +	&clk_sata.hw,
>> +	&clk_audio.hw,
>> +	&clk_usbmph.hw,
>> +	&clk_etha.hw,
>> +	&clk_pciea.hw,
>> +	&clk_nand.hw,
>> +};
>> +
>> +static struct clk *std_clk_tbl[ARRAY_SIZE(std_clk_hw_tbl)];
>> +
>> +static struct clk_onecell_data std_clk_data;
> 
> These are pretty generic. Perhaps oxnas_clk_data and
> oxnas_clk_hw_tbl?
> 
>> +
>> +static void __init oxnas_init_stdclk(struct device_node *np)
>> +{
>> +	int i;
>> +	struct regmap *regmap = syscon_node_to_regmap(of_get_parent(np));
>> +
>> +	if (!regmap)
>> +		panic("failed to have parent regmap\n");
>> +
>> +	for (i = 0; i < ARRAY_SIZE(std_clk_hw_tbl); i++) {
>> +		struct clk_std *std = container_of(std_clk_hw_tbl[i],
>> +						   struct clk_std, hw);
>> +
>> +		if (WARN_ON(!std))
>> +			return;
>> +		std->regmap = regmap;
>> +
>> +		std_clk_tbl[i] = clk_register(NULL, std_clk_hw_tbl[i]);
>> +		if (WARN_ON(IS_ERR(std_clk_tbl[i])))
>> +			return;
>> +	}
>> +
>> +	std_clk_data.clks = std_clk_tbl;
>> +	std_clk_data.clk_num = ARRAY_SIZE(std_clk_tbl);
>> +
>> +	of_clk_add_provider(np, of_clk_src_onecell_get, &std_clk_data);
>> +}
>> +CLK_OF_DECLARE(oxnas_pllstd, "plxtech,ox810se-stdclk", oxnas_init_stdclk);
> 
> Can this be a platform driver instead?
> 
> Is there a binding for this compatible?

I refactored the driver to be platform driver and cleaned up the structure to be const and allocate the clocks at probe.

The bindings was in a separate patch, I forgot to CC linux-clk :
http://lkml.kernel.org/r/1457005210-18485-10-git-send-email-narmstrong@baylibre.com

In the meantime I added the indices description in the bindings.

Neil


