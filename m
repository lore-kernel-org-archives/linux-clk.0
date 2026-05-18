Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719F440488E;
	Mon, 18 May 2026 12:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106951; cv=pass; b=Zd4kbLrNJiR1pDDYgXsbplU0B9oY49kVn2kdizPXpaogCZhnnym+jNWqs1dQHTB1u3y+ySCInxRGgsvOEyDLL3eJkHAvlgtWwL9H8pSQV2kIJScteYGNl3QUAPFaLvG1prvyuWsm89GAOO4FjRBPwZDykdk8rP8FdJOth7W58Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106951; c=relaxed/simple;
	bh=6FnHwnsHUJ1+270roGPtSm3ZI5fNxVli81JtkKmQZaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciRN4q1mkArJXjZ/oIYHdm/fNXTUuVw0R9F5McWSLn01/XAfNAcgX/jNdBowqpRuK2yv9FhGeRX89YekDALxwUfhp5fpGoCC56vdPZfFVQpwO1Q8OxYMl+w9Wx01ik2miuU89z6sX7hrjXeE5dV18MLxI3Ifdi2ybqr7MOUDJVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=Wnnyocnw; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="Wnnyocnw"
ARC-Seal: i=1; a=rsa-sha256; t=1779106918; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j9gXmJZR8qrYInuUJ0BSBMlPzckjUBQNH15J42IobEkf3/gh14J3HK8DDtW1iOs6epZSOMTAIlsK1qRoGHZ9iEkCSWLFEQX0vdxRkTiHY3oF5vq76XegweUI1LHbtzvR0jONOWIjubpbYZF9IK1NkEJs7dagMeHCFdD5rw6NvJU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779106918; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=i3hvVwqkrHJV9MImFf7MRXkhnOCZIfBVL2l1FFmmXss=; 
	b=PZnmWWWnpqPWNAO+24mk/Wr8BpCvHPjiCzOxSApixfCYO/TRo1zG1vW6dCDW4Q6KYvQpFa83oRfuIY1Oh813bAsAne+fhn33xlWLbpEQpBK1WAA4BSRH2UwXE2nJyvnKUlHqXOWf0FYMvbhFNeE1ajhP/uGDaXnGtaXRgMyPkWk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779106918;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=i3hvVwqkrHJV9MImFf7MRXkhnOCZIfBVL2l1FFmmXss=;
	b=WnnyocnwFmdQ92cM4ejfexTxLyKrhRU6KX69esb60eXkxLI/ZBMTkLC3zk/1XQCB
	som5PNooXVPQxDrwTh0aW3ok8pjHYtf5Oh1eyDp/GSDz+Ik8tzo4KwFyq4XV/WFWjbM
	BSWoZePoCSTqz3UqDX5atqyTsU5+295qkgUGzNTM=
Received: by mx.zohomail.com with SMTPS id 1779106914673236.01119994160956;
	Mon, 18 May 2026 05:21:54 -0700 (PDT)
Date: Mon, 18 May 2026 12:21:46 +0000
From: Yao Zi <me@ziyao.cc>
To: Chuanhong Guo <gch981213@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: add support for siflower sf21-topcrm
Message-ID: <agsEWo_mo5rzUAAH@pie>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-4-438f2e0513ff@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-sf21-topcrm-v1-4-438f2e0513ff@gmail.com>
X-ZohoMailClient: External

On Sun, May 17, 2026 at 10:12:58PM +0800, Chuanhong Guo wrote:
> This commit adds a driver for the Toplevel clock and reset controller
> found on Siflower SF21A6826/SF21H8898 SoCs.
> This block contains control for 3 PLLs, several clock mux/gate/divider
> blocks, and a reset register for on-chip peripherals.

It would be better if you could split out the reset code into
drivers/reset, and initialize the reset controller as an auxiliary
device, like what has been done for SpacemiT platform
(drivers/{clock,reset}/spacemit) and AMLogic platform
(drivers/clock/meson/axg-audio.c and
drivers/reset/amlogic/reset-meson-aux.c).

I am neither clock nor reset maintainer, thus this only serves as
a suggestion, with which it ends up in better code structure.

> There are also two registers for enabling PCIE clock output in this
> block. They aren't covered by this patch because I can't test those
> without a PCIE driver. These will be added with the PCIE driver

s/PCIE/PCIe/g which is the formal spelling.

> patchset later after I get that working.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  drivers/clk/Kconfig                    |    1 +
>  drivers/clk/Makefile                   |    1 +
>  drivers/clk/siflower/Kconfig           |   22 +
>  drivers/clk/siflower/Makefile          |    1 +
>  drivers/clk/siflower/clk-sf21-topcrm.c | 1053 ++++++++++++++++++++++++++++++++
>  5 files changed, 1078 insertions(+)

...

> diff --git a/drivers/clk/siflower/clk-sf21-topcrm.c b/drivers/clk/siflower/clk-sf21-topcrm.c
> new file mode 100644
> index 000000000000..7d4c5e370d6d
> --- /dev/null
> +++ b/drivers/clk/siflower/clk-sf21-topcrm.c
> @@ -0,0 +1,1053 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include <linux/clk-provider.h>
> +#include <linux/bitfield.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/rational.h>
> +#include <linux/module.h>
> +#include <linux/reset-controller.h>
> +#include <linux/spinlock.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/siflower,sf21-topcrm.h>

Consider sorting the headers?

...

> +static int sf21_cmnpll_vco_determine_rate(struct clk_hw *hw,
> +					  struct clk_rate_request *req)
> +{
> +	unsigned long fbdiv, refdiv;
> +
> +	rational_best_approximation(req->rate, req->best_parent_rate,
> +				    BIT(PLL_CMN_FBDIV_BITS) - 1,
> +				    BIT(PLL_CMN_REFDIV_BITS) - 1, &fbdiv,

FIELD_MAX(PLL_CMN_{FBDIV,REFDIV}_BITS}) would be simpler, with which it
should be possible to get avoid of PLL_CMN_*_BITS.

> +				    &refdiv);
> +	if (!refdiv || !fbdiv)
> +		return -EINVAL;
> +
> +	req->rate = (req->best_parent_rate / refdiv) * fbdiv;
> +
> +	return 0;
> +}
> +
> +static int sf21_cmnpll_vco_set_rate(struct clk_hw *hw, unsigned long rate,
> +				    unsigned long parent_rate)
> +{
> +	struct sf_clk_common *priv = hw_to_sf_clk_common(hw);
> +	unsigned long flags;
> +	unsigned long fbdiv, refdiv;
> +	u32 val;
> +	int ret;
> +
> +	rational_best_approximation(rate, parent_rate,
> +				    BIT(PLL_CMN_FBDIV_BITS) - 1,
> +				    BIT(PLL_CMN_REFDIV_BITS) - 1, &fbdiv,
> +				    &refdiv);
> +	if (!refdiv || !fbdiv)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(priv->lock, flags);

	guard(spinlock_irqsave)(priv->lock)

might simplify the code (especially the error handling path in this
function), this applies as well for other places where
spin_lock_irqsave() involves.

> +
> +	sf_rmw(priv, PLL_CMN_CFG1, PLL_CMN_REFDIV | PLL_CMN_FBDIV | PLL_CMN_PD,
> +	       FIELD_PREP(PLL_CMN_REFDIV, refdiv) |
> +		       FIELD_PREP(PLL_CMN_FBDIV, fbdiv));
> +	sf_writel(priv, CFG_LOAD, CFG_LOAD_CMN_PLL);
> +	sf_writel(priv, CFG_LOAD, 0);
> +
> +	ret = readl_poll_timeout_atomic(priv->base + PLL_CMN_LOCK, val, val & 1,
> +					0, PLL_LOCK_TIMEOUT_US);
> +	if (ret)
> +		goto out_unlock;
> +
> +out_unlock:
> +	spin_unlock_irqrestore(priv->lock, flags);
> +	return ret;
> +}

...

> +static unsigned long sf21_dualdiv_round_rate(unsigned long rate,
> +					     unsigned long parent_rate,
> +					     unsigned int range,
> +					     unsigned int *diva,
> +					     unsigned int *divb)
> +{
> +	unsigned int div = DIV_ROUND_CLOSEST(parent_rate, rate);
> +	unsigned int best_diff, da, db, cur_div, cur_diff;
> +
> +	if (div <= 1) {
> +		*diva = 1;
> +		*divb = 1;
> +		return parent_rate;
> +	}
> +
> +	best_diff = div - 1;
> +	*diva = 1;
> +	*divb = 1;
> +
> +	for (da = 1; da <= range; da++) {
> +		db = DIV_ROUND_CLOSEST(div, da);
> +		if (db > da)
> +			db = da;
> +
> +		cur_div = da * db;
> +		if (div > cur_div)
> +			cur_diff = div - cur_div;
> +		else
> +			cur_diff = cur_div - div;
> +
> +		if (cur_diff < best_diff) {
> +			best_diff = cur_diff;
> +			*diva = da;
> +			*divb = db;
> +		}
> +		if (cur_diff == 0)
> +			break;
> +	}
> +
> +	return parent_rate / *diva / *divb;
> +}
> +
> +static int sf21_cmnpll_postdiv_determine_rate(struct clk_hw *hw,
> +					      struct clk_rate_request *req)
> +{
> +	unsigned int diva, divb;
> +
> +	if (!req->rate)
> +		return -EINVAL;
> +
> +	req->rate = sf21_dualdiv_round_rate(req->rate, req->best_parent_rate,
> +					    7, &diva, &divb);
> +
> +	return 0;
> +}
> +
> +static int sf21_cmnpll_postdiv_set_rate(struct clk_hw *hw,
> +					unsigned long rate,
> +					unsigned long parent_rate)
> +{
> +	struct sf_clk_common *priv = hw_to_sf_clk_common(hw);
> +	unsigned int diva, divb;
> +	unsigned long flags;
> +
> +	if (!rate)
> +		return -EINVAL;
> +
> +	sf21_dualdiv_round_rate(rate, parent_rate, 7, &diva, &divb);
> +
> +	spin_lock_irqsave(priv->lock, flags);
> +	sf_rmw(priv, PLL_CMN_CFG1, PLL_CMN_POSTDIV1 | PLL_CMN_POSTDIV2,
> +	       FIELD_PREP(PLL_CMN_POSTDIV1, diva) |
> +		       FIELD_PREP(PLL_CMN_POSTDIV2, divb));
> +	sf_writel(priv, CFG_LOAD, CFG_LOAD_CMN_PLL);
> +	sf_writel(priv, CFG_LOAD, 0);
> +	spin_unlock_irqrestore(priv->lock, flags);
> +	return 0;
> +}
> +
> +static unsigned long
> +sf21_cmnpll_postdiv_recalc_rate(struct clk_hw *hw,
> +				unsigned long parent_rate)
> +{
> +	struct sf_clk_common *priv = hw_to_sf_clk_common(hw);
> +	u32 cfg = sf_readl(priv, PLL_CMN_CFG1);
> +	unsigned long div1 = FIELD_GET(PLL_CMN_POSTDIV1, cfg);
> +	unsigned long div2 = FIELD_GET(PLL_CMN_POSTDIV2, cfg);
> +
> +	if (!div1 || !div2)
> +		return 0;
> +
> +	return parent_rate / div1 / div2;
> +}
> +
> +static const struct clk_ops sf21_cmnpll_postdiv_ops = {
> +	.recalc_rate = sf21_cmnpll_postdiv_recalc_rate,
> +	.determine_rate = sf21_cmnpll_postdiv_determine_rate,
> +	.set_rate = sf21_cmnpll_postdiv_set_rate,
> +};
> +
> +static struct sf_clk_common cmnpll_postdiv = {
> +	.hw.init = CLK_HW_INIT_HW("cmnpll_postdiv", &cmnpll_vco.hw,
> +				  &sf21_cmnpll_postdiv_ops, 0),
> +};

...

> +static int sf21_pciepll_fout_determine_rate(struct clk_hw *hw,
> +					    struct clk_rate_request *req)
> +{
> +	unsigned int diva, divb;
> +
> +	if (!req->rate)
> +		return -EINVAL;
> +
> +	req->rate = sf21_dualdiv_round_rate(req->rate, req->best_parent_rate,
> +					    8, &diva, &divb);

cmnpll_postdiv works in a very similar way to pciepll_fout. As you could
see in the code, they both contain two divisors to configure, and their
rates could all be calculated through sf21_dualdiv_round_rate(),

> +	return 0;
> +}

...

> +static const struct clk_ops sf21_pciepll_fout_ops = {
> +	.enable = sf21_pciepll_fout_enable,
> +	.disable = sf21_pciepll_fout_disable,
> +	.is_enabled = sf21_pciepll_fout_is_enabled,

Besides field/register offsets, the only difference I could tell between
cmnpll_postdiv and pciepll_fout is that pciepll_fout clocks could be
gated.

Would it be a good idea to describe the gating function separately as a
clock, and merge the common part of pciepll_fout and cmnpll_postdiv? In
which way you could save a lot of mostly duplicated code.

> +	.recalc_rate = sf21_pciepll_fout_recalc_rate,
> +	.determine_rate = sf21_pciepll_fout_determine_rate,
> +	.set_rate = sf21_pciepll_fout_set_rate,
> +};

...

> +struct sf21_clk_muxdiv {
> +	struct sf_clk_common common;
> +	u16 en;
> +	u8 mux_reg;
> +	u8 mux_offs;
> +	u8 div_reg;
> +	u8 div_offs;
> +};
> +
> +#define CRM_CLK_SEL(_x)		((_x) * 4 + 0x80)
> +#define  CLK_SEL1_PLL_TEST	GENMASK(6, 4)
> +#define CRM_CLK_EN		0x8c
> +#define CRM_CLK_DIV(_x)		((_x) * 4 + 0x94)
> +#define  CRM_CLK_DIV_MASK	GENMASK(7, 0)
> +
> +static unsigned long sf21_muxdiv_recalc_rate(struct clk_hw *hw,
> +					     unsigned long parent_rate)
> +{
> +	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
> +	struct sf21_clk_muxdiv *priv =
> +		container_of(cmn_priv, struct sf21_clk_muxdiv, common);
> +	ulong div_reg = CRM_CLK_DIV(priv->div_reg);
> +	u16 div_offs = priv->div_offs;
> +	u16 div_val = (sf_readl(cmn_priv, div_reg) >> div_offs) &
> +		      CRM_CLK_DIV_MASK;
> +	div_val += 1;
> +	return parent_rate / div_val;
> +}
> +
> +static int sf21_muxdiv_determine_rate(struct clk_hw *hw,
> +				      struct clk_rate_request *req)
> +{
> +	unsigned int div;
> +
> +	if (!req->rate)
> +		return -EINVAL;
> +
> +	div = DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);
> +	if (!div)
> +		div = 1;
> +	else if (div > CRM_CLK_DIV_MASK + 1)
> +		div = CRM_CLK_DIV_MASK + 1;
> +
> +	req->rate = req->best_parent_rate / div;
> +	return 0;
> +}
> +
> +static int sf21_muxdiv_set_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long parent_rate)
> +{
> +	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
> +	struct sf21_clk_muxdiv *priv =
> +		container_of(cmn_priv, struct sf21_clk_muxdiv, common);
> +	ulong div_reg = CRM_CLK_DIV(priv->div_reg);
> +	u16 div_offs = priv->div_offs;
> +	unsigned long flags;
> +	unsigned int div;
> +
> +	if (!rate)
> +		return -EINVAL;
> +
> +	div = DIV_ROUND_CLOSEST(parent_rate, rate);
> +	if (div < 1)
> +		div = 1;
> +	else if (div > CRM_CLK_DIV_MASK + 1)
> +		div = CRM_CLK_DIV_MASK + 1;
> +	div -= 1;
> +
> +	spin_lock_irqsave(cmn_priv->lock, flags);
> +	sf_rmw(cmn_priv, div_reg, CRM_CLK_DIV_MASK << div_offs,
> +	       div << div_offs);
> +	sf_writel(cmn_priv, CFG_LOAD, CFG_LOAD_DIV);
> +	sf_writel(cmn_priv, CFG_LOAD, 0);
> +	spin_unlock_irqrestore(cmn_priv->lock, flags);
> +	return 0;
> +}
> +
> +static int sf21_muxdiv_enable(struct clk_hw *hw)
> +{
> +	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
> +	struct sf21_clk_muxdiv *priv =
> +		container_of(cmn_priv, struct sf21_clk_muxdiv, common);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(cmn_priv->lock, flags);
> +	sf_rmw(cmn_priv, CRM_CLK_EN, 0, BIT(priv->en));
> +	/*
> +	 * Clock divider value load only happens when the clock is running.
> +	 * Pulse the CFG_LOAD_DIV so that set_rate() which happened
> +	 * before enable() is applied.
> +	 */
> +	sf_writel(cmn_priv, CFG_LOAD, CFG_LOAD_DIV);
> +	sf_writel(cmn_priv, CFG_LOAD, 0);
> +	spin_unlock_irqrestore(cmn_priv->lock, flags);
> +	return 0;
> +}
> +
> +static void sf21_muxdiv_disable(struct clk_hw *hw)
> +{
> +	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
> +	struct sf21_clk_muxdiv *priv =
> +		container_of(cmn_priv, struct sf21_clk_muxdiv, common);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(cmn_priv->lock, flags);
> +	sf_rmw(cmn_priv, CRM_CLK_EN, BIT(priv->en), 0);
> +	spin_unlock_irqrestore(cmn_priv->lock, flags);
> +}
> +
> +static int sf21_muxdiv_is_enabled(struct clk_hw *hw)
> +{
> +	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
> +	struct sf21_clk_muxdiv *priv =
> +		container_of(cmn_priv, struct sf21_clk_muxdiv, common);
> +	u32 reg_val = sf_readl(cmn_priv, CRM_CLK_EN);
> +
> +	return reg_val & (BIT(priv->en)) ? 1 : 0;
> +}
> +
> +static u8 sf21_muxdiv_get_parent(struct clk_hw *hw)
> +{
> +	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
> +	struct sf21_clk_muxdiv *priv =
> +		container_of(cmn_priv, struct sf21_clk_muxdiv, common);
> +	ulong mux_reg = CRM_CLK_SEL(priv->mux_reg);
> +	u16 mux_offs = priv->mux_offs;
> +	u32 reg_val = sf_readl(cmn_priv, mux_reg);
> +
> +	return reg_val & BIT(mux_offs) ? 1 : 0;
> +}
> +
> +static int sf21_muxdiv_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
> +	struct sf21_clk_muxdiv *priv =
> +		container_of(cmn_priv, struct sf21_clk_muxdiv, common);
> +	ulong mux_reg = CRM_CLK_SEL(priv->mux_reg);
> +	u16 mux_offs = priv->mux_offs;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(cmn_priv->lock, flags);
> +	if (index)
> +		sf_rmw(cmn_priv, mux_reg, 0, BIT(mux_offs));
> +	else
> +		sf_rmw(cmn_priv, mux_reg, BIT(mux_offs), 0);
> +
> +	spin_unlock_irqrestore(cmn_priv->lock, flags);
> +	return 0;
> +}

I believe besides the divider reloading part, clk_mux_ops,
clk_divider_ops, and clk_gate_ops have already provided the logic
you implemented here. So it might be a better option to composite them
together to implement your clocks instead of building from scratch.

> +static const struct clk_ops sf21_clk_muxdiv_ops = {
> +	.enable = sf21_muxdiv_enable,
> +	.disable = sf21_muxdiv_disable,
> +	.is_enabled = sf21_muxdiv_is_enabled,
> +	.recalc_rate = sf21_muxdiv_recalc_rate,
> +	.determine_rate = sf21_muxdiv_determine_rate,
> +	.set_rate = sf21_muxdiv_set_rate,
> +	.get_parent = sf21_muxdiv_get_parent,
> +	.set_parent = sf21_muxdiv_set_parent,
> +};

...

> +static SF21_MUXDIV(muxdiv_cpu, clk_periph_parents, 0, 1, 0, 0, 0,
> +		   CLK_IGNORE_UNUSED);

If it supplies the CPU core, shouldn't it be CLK_IS_CRITICAL instead?

> +static SF21_MUXDIV(muxdiv_pic, clk_periph_parents, 0, 3, 3, 16, 1,
> +		   CLK_IGNORE_UNUSED);

Do you have any information about purpose of the clock and why it's
marked as CLK_IGNORE_UNUSED? It's better to have a comment explaining
this since it's not very obvious...

Best regards,
Yao Zi
