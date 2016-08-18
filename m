Return-Path: <sboyd@codeaurora.org>
Date: Thu, 18 Aug 2016 11:30:14 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Stephen Boyd <stephen.boyd@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Jisheng Zhang <jszhang@marvell.com>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v2] clk: berlin: Migrate to clk_hw based registration and
 OF APIs
Message-ID: <20160818183014.GF361@codeaurora.org>
References: <20160816224052.1659-1-stephen.boyd@linaro.org>
 <57B581BA.8090701@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <57B581BA.8090701@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/18, Sebastian Hesselbarth wrote:
> On 17.08.2016 00:40, Stephen Boyd wrote:
> >Now that we have clk_hw based provider APIs to register clks, we
> >can get rid of struct clk pointers while registering clks in
> >these drivers, allowing us to move closer to a clear split of
> >consumer and provider clk APIs. We also remove some __init
> >markings in header files as they're useless and we're in the
> >area.
> >
> >Cc: Jisheng Zhang <jszhang@marvell.com>
> >Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> >Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> >Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> >---
> >
> >Changes from v1:
> >  * Fixed alignment
> >  * Added note about dropping __init in commit text
> >
> >  drivers/clk/berlin/berlin2-avpll.c | 12 ++---
> >  drivers/clk/berlin/berlin2-avpll.h |  8 +---
> >  drivers/clk/berlin/berlin2-div.c   |  4 +-
> >  drivers/clk/berlin/berlin2-div.h   |  4 +-
> >  drivers/clk/berlin/berlin2-pll.c   |  6 +--
> >  drivers/clk/berlin/berlin2-pll.h   |  9 ++--
> >  drivers/clk/berlin/bg2.c           | 98 ++++++++++++++++++++------------------
> >  drivers/clk/berlin/bg2q.c          | 39 ++++++++-------
> >  8 files changed, 92 insertions(+), 88 deletions(-)
> >
> >diff --git a/drivers/clk/berlin/berlin2-avpll.c b/drivers/clk/berlin/berlin2-avpll.c
> >index fd0f26c38465..5b0e4213b3ae 100644
> >--- a/drivers/clk/berlin/berlin2-avpll.c
> >+++ b/drivers/clk/berlin/berlin2-avpll.c
> >@@ -188,7 +188,7 @@ static const struct clk_ops berlin2_avpll_vco_ops = {
> >  	.recalc_rate	= berlin2_avpll_vco_recalc_rate,
> >  };
> >
> >-struct clk * __init berlin2_avpll_vco_register(void __iomem *base,
> >+int __init berlin2_avpll_vco_register(void __iomem *base,
> >  			       const char *name, const char *parent_name,
> >  			       u8 vco_flags, unsigned long flags)
> >  {
> >@@ -197,7 +197,7 @@ struct clk * __init berlin2_avpll_vco_register(void __iomem *base,
> >
> >  	vco = kzalloc(sizeof(*vco), GFP_KERNEL);
> >  	if (!vco)
> >-		return ERR_PTR(-ENOMEM);
> >+		return -ENOMEM;
> >
> >  	vco->base = base;
> >  	vco->flags = vco_flags;
> >@@ -208,7 +208,7 @@ struct clk * __init berlin2_avpll_vco_register(void __iomem *base,
> >  	init.num_parents = 1;
> >  	init.flags = flags;
> >
> >-	return clk_register(NULL, &vco->hw);
> >+	return clk_hw_register(NULL, &vco->hw);
> >  }
> >
> >  struct berlin2_avpll_channel {
> >@@ -364,7 +364,7 @@ static const struct clk_ops berlin2_avpll_channel_ops = {
> >   */
> >  static const u8 quirk_index[] __initconst = { 0, 6, 5, 4, 3, 2, 1, 7 };
> >
> >-struct clk * __init berlin2_avpll_channel_register(void __iomem *base,
> >+int __init berlin2_avpll_channel_register(void __iomem *base,
> >  			   const char *name, u8 index, const char *parent_name,
> >  			   u8 ch_flags, unsigned long flags)
> >  {
> >@@ -373,7 +373,7 @@ struct clk * __init berlin2_avpll_channel_register(void __iomem *base,
> >
> >  	ch = kzalloc(sizeof(*ch), GFP_KERNEL);
> >  	if (!ch)
> >-		return ERR_PTR(-ENOMEM);
> >+		return ENOMEM;
> [...]
> 
> Stephen,
> 
> thanks for the conversion! There is a '-' missing in the line above.
> With Jisheng's Tested-by and the minor fix above, feel free to add my
> 
> Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Thanks! Fixed and applied to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
