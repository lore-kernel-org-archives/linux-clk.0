Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB263B3C0A;
	Sun, 18 Oct 2026 23:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364744; cv=none; b=FCQsFBMB21i/s7xkY+b3YXz8Glmc6hPbZCdOJVdJkHHvW3iWfahAZaHDVbTi/++g11OOrnqjHW2smp40RyWxzjNvBeWxVkWv5Zjc5uN0khxr0daKQ1umIKdj+H7qWAtmh4t7FcSIdpbDPYRfbhjX5/7btUa6HEpYFvg5nKPg1nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364744; c=relaxed/simple;
	bh=tCNuatnJoUalRFNkPc4cmXy6HAECylC4dzrcptEqyY8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sM9EEuh/XKp7gLGkWlKaPSGbkGH+tgzvG8KoIkgrZRqo1Hf+E4WiD5KOu5X8y6V2dJwGBCkGnyHgCbidadxitn2WND43vAKKmjhakz2CRKasdW1Cepdo8IRTrtMBruWvGje4wl0tgkbU/b4bFhSP1ojKqesh30PYcxTYA5z1ut0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuXLbKh2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XuXLbKh2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53071F000C4;
	Sun, 18 Oct 2026 23:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792364742;
	bh=bJXPuqrAQ+EC1Ww2F2gyssRNDrY5BwiUVc6E9r+bulY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XuXLbKh2EQquTQm4pAXMaps2AfLTB8jQT7qoPS/u5JdLjXsDyGLhSmRyUx0mZhA4n
	 DIamPq3cISVfTodpKrQemun3h345HQBTct09aEdOfbxbkqCs5GZDsu1zR2/H+r/GWE
	 HbXCiAUsoXClp+xUJ1A51ZfETU3PW2TdCtubmWFbMklaXQ8kPjb0urvc4mHtMohHn2
	 yjrluny4T6qs1K0jMj8LmH22zLYpAHOddbm4f0JrU0aIjnjFPTD52+McTHz8gi1alB
	 U30Kse6SDOSmfd0QCJfa2iHS1WlcaUsmBRFDKSmhD5ff4Fg0pQwQFvjqIBPiIAS/8t
	 2mchCJViuGTnQ==
Message-ID: <sashiko-outbox-176443@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] clk: tegra: Add Tegra210B01 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling" <webgeek1234@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261018-t210b01-clocks-v1-2-d9e980925925@gmail.com>
References: <20261018-t210b01-clocks-v1-0-d9e980925925@gmail.com>
 <20261018-t210b01-clocks-v1-2-d9e980925925@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 23:05:42 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] clk: tegra: u64 underflow in div_frac_get() when div1_5_not_allowe=
d is set
- [High] clk: tegra: tegra210_pllcx_set_defaults() resets already-enabled P=
LLs
- [High] clk: tegra210b01: missing pll_c4_out0 registration in tegra210_pll=
_init()
- [High] clk: tegra: missing emc and pll_m clock registration on Tegra210B01
- [High] clk: tegra: split static clk_base breaks tegra210 PLL helpers on T=
egra210B01
- [Medium] clk: tegra: tegra210_pllc4_set_defaults() clobbers val before lo=
ck check
- [Medium] clk: tegra: unrounded rate check in tegra_init_from_table() warn=
s on pll_a
- [Medium] clk: tegra: missing lock on shared PLL_OUT registers in tegra210=
_pll_init()
--

commit 72bb8089ea5a62d38632e758c4169b0ef37dff61
Author: Aaron Kling <webgeek1234@gmail.com>

clk: tegra: Add Tegra210B01 support

This commit adds an independent clock driver for the Tegra210B01 SoC in
drivers/clk/tegra/clk-tegra210b01.c along with supporting updates to
fractional divider calculations and clock table initialization.

> diff --git a/drivers/clk/tegra/clk-tegra210b01.c b/drivers/clk/tegra/clk-=
tegra210b01.c
> new file mode 100644
> index 0000000000000..8c03ff913e61b
> --- /dev/null
> +++ b/drivers/clk/tegra/clk-tegra210b01.c
> @@ -0,0 +1,3524 @@

[ ... ]

> +bool tegra210b01_plle_hw_sequence_is_enabled(void)
> +{
> +	u32 value;
> +
> +	value =3D readl_relaxed(clk_base + PLLE_AUX);
> +	if (value & PLLE_AUX_SEQ_ENABLE)
> +		return true;
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(tegra210b01_plle_hw_sequence_is_enabled);
> +
> +int tegra210b01_plle_hw_sequence_start(void)
> +{
> +	u32 value;
> +
> +	if (tegra210b01_plle_hw_sequence_is_enabled())
> +		return 0;
> +
> +	/* skip if PLLE is not enabled yet */
> +	value =3D readl_relaxed(clk_base + PLLE_MISC0);
> +	if (!(value & PLLE_MISC_LOCK))
> +		return -EIO;
> +
> +	value &=3D ~PLLE_MISC_IDDQ_SW_CTRL;
> +	writel_relaxed(value, clk_base + PLLE_MISC0);
> +
> +	value =3D readl_relaxed(clk_base + PLLE_AUX);
> +	value |=3D (PLLE_AUX_USE_LOCKDET | PLLE_AUX_SS_SEQ_INCLUDE);
> +	value &=3D ~(PLLE_AUX_ENABLE_SWCTL | PLLE_AUX_SS_SWCTL);
> +	writel_relaxed(value, clk_base + PLLE_AUX);
> +
> +	fence_udelay(1, clk_base);
> +
> +	value |=3D PLLE_AUX_SEQ_ENABLE;
> +	writel_relaxed(value, clk_base + PLLE_AUX);
> +
> +	fence_udelay(1, clk_base);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(tegra210b01_plle_hw_sequence_start);
> +
> +void tegra210b01_xusb_pll_hw_control_enable(void)
> +{
> +	u32 val;
> +
> +	val =3D readl_relaxed(clk_base + XUSBIO_PLL_CFG0);
> +	val &=3D ~(XUSBIO_PLL_CFG0_CLK_ENABLE_SWCTL |
> +		 XUSBIO_PLL_CFG0_PADPLL_RESET_SWCTL);
> +	val |=3D XUSBIO_PLL_CFG0_PADPLL_USE_LOCKDET |
> +	       XUSBIO_PLL_CFG0_PADPLL_SLEEP_IDDQ;
> +	writel_relaxed(val, clk_base + XUSBIO_PLL_CFG0);
> +}
> +EXPORT_SYMBOL_GPL(tegra210b01_xusb_pll_hw_control_enable);
> +
> +void tegra210b01_xusb_pll_hw_sequence_start(void)
> +{
> +	u32 val;
> +
> +	val =3D readl_relaxed(clk_base + XUSBIO_PLL_CFG0);
> +	val |=3D XUSBIO_PLL_CFG0_SEQ_ENABLE;
> +	writel_relaxed(val, clk_base + XUSBIO_PLL_CFG0);
> +}
> +EXPORT_SYMBOL_GPL(tegra210b01_xusb_pll_hw_sequence_start);

[Severity: High]
How do existing Tegra210 peripheral and PHY drivers interact with these
helpers when booting on Tegra210B01?

Both clk-tegra210.o and clk-tegra210b01.o are built under
CONFIG_ARCH_TEGRA_210_SOC and each defines its own file-static clk_base. On=
 a
Tegra210B01 system booting with nvidia,tegra210b01-car, only
tegra210b01_clock_init() runs, leaving clk_base in clk-tegra210.c as NULL.

Existing drivers such as drivers/phy/tegra/xusb-tegra210.c (in
tegra210_uphy_init(), tegra210_pex_uphy_enable(), and
tegra210_sata_uphy_enable()) and drivers/memory/tegra/tegra210-emc-core.c c=
all
tegra210_plle_hw_sequence_is_enabled(), tegra210_plle_hw_sequence_start(),
tegra210_xusb_pll_hw_control_enable(), tegra210_xusb_pll_hw_sequence_start(=
),
tegra210_sata_pll_hw_control_enable(), tegra210_sata_pll_hw_sequence_start(=
),
and tegra210_clk_emc_*() in clk-tegra210.c:

drivers/phy/tegra/xusb-tegra210.c:tegra210_uphy_init() {
	...
	if (!tegra210_plle_hw_sequence_is_enabled())
		tegra210_plle_hw_sequence_start();
	...
}

Won't those calls dereference the NULL clk_base in clk-tegra210.c while the=
se
new tegra210b01_* symbols have no callers in the tree (and no #else stubs in
include/linux/clk/tegra.h when CONFIG_ARCH_TEGRA_210_SOC is disabled)?

[ ... ]

> +static void tegra210_pllcx_set_defaults(const char *name,
> +					struct tegra_clk_pll *pllcx)
> +{
> +	pllcx->params->defaults_set =3D true;
> +
> +	if (readl_relaxed(clk_base + pllcx->params->base_reg) & PLL_ENABLE &&
> +			!pllcx->params->defaults_set) {
> +		/* PLL is ON: only check if defaults already set */
> +		pllcx_check_defaults(pllcx->params);
> +		if (!pllcx->params->defaults_set)
> +			pr_warn("%s already enabled. Postponing set full defaults\n",
> +				name);
> +		return;
> +	}
> +
> +	/* Defaults assert PLL reset, and set IDDQ */
> +	writel_relaxed(PLLCX_MISC0_DEFAULT_VALUE,
> +			clk_base + pllcx->params->ext_misc_reg[0]);
> +	writel_relaxed(PLLCX_MISC1_DEFAULT_VALUE,
> +			clk_base + pllcx->params->ext_misc_reg[1]);
> +	writel_relaxed(PLLCX_MISC2_DEFAULT_VALUE,
> +			clk_base + pllcx->params->ext_misc_reg[2]);
> +	writel_relaxed(PLLCX_MISC3_DEFAULT_VALUE,
> +			clk_base + pllcx->params->ext_misc_reg[3]);
> +	udelay(1);
> +}

[Severity: High]
In tegra210_pllcx_set_defaults(), pllcx->params->defaults_set is set to true
right before testing !pllcx->params->defaults_set in the if condition.

Because !pllcx->params->defaults_set is always false there, the PLL_ENABLE
branch becomes dead code. When _pllc_set_defaults(), _pllc2_set_defaults(),
_pllc3_set_defaults(), or _plla1_set_defaults() is called for a PLL that was
already enabled by the bootloader, won't this fall through and write
PLLCX_MISC0_DEFAULT_VALUE and PLLCX_MISC1_DEFAULT_VALUE, asserting reset and
IDDQ on a live PLL?

[ ... ]

> +static void tegra210_pllc4_set_defaults(struct tegra_clk_pll *pllc4)
> +{
> +	u32 default_val;
> +	u32 val =3D readl_relaxed(clk_base + pllc4->params->base_reg);
> +
> +	pllc4->params->defaults_set =3D true;
> +
> +	if (val & PLL_ENABLE) {
> +		/*
> +		 * PLL is ON: check if defaults already set, then set those
> +		 * that can be updated in flight.
> +		 */
> +		if (val & PLLDSS_BASE_IDDQ) {
> +			pr_warn("PLL_C4 boot enabled with IDDQ set\n");
> +			pllc4->params->defaults_set =3D false;
> +		}
> +
> +		/* ignore lock enable */
> +		default_val =3D PLLC4_MISC0_DEFAULT_VALUE;
> +		_pll_misc_chk_default(clk_base, pllc4->params, 0, default_val,
> +				     PLLDSS_MISC0_WRITE_MASK &
> +				     (~PLLDSS_MISC0_LOCK_ENABLE));
> +
> +		val =3D readl_relaxed(clk_base + PLLC4_OUT) & PLLC4_OUT_VREG_MASK;
> +		if (val !=3D PLLC4_OUT_DEFAULT_VALUE) {
> +			pr_warn("boot PLL_C4 vreg 0x%x: expected 0x%x\n",
> +				val, PLLC4_OUT_DEFAULT_VALUE);
> +			pllc4->params->defaults_set =3D false;
> +		}
> +
> +		/* Enable lock detect */
> +		if (val & PLLDSS_BASE_LOCK_OVERRIDE) {
> +			val &=3D ~PLLDSS_BASE_LOCK_OVERRIDE;
> +			writel_relaxed(val, clk_base + pllc4->params->base_reg);
> +		}

[Severity: Medium]
In tegra210_pllc4_set_defaults(), val initially holds the value read from
pllc4->params->base_reg, but it is overwritten with:

	val =3D readl_relaxed(clk_base + PLLC4_OUT) & PLLC4_OUT_VREG_MASK;

Since PLLC4_OUT_VREG_MASK is 0xf0000000 and PLLDSS_BASE_LOCK_OVERRIDE is
(1 << 24), won't the subsequent check for (val & PLLDSS_BASE_LOCK_OVERRIDE)
always evaluate to false instead of checking and clearing the lock override
bit in PLLC4_BASE?

[ ... ]

> +	for (i =3D 0; i < ARRAY_SIZE(tegra210_periph); i++) {
> +		struct tegra_periph_init_data *init =3D &tegra210_periph[i];
> +		struct clk **clkp;
> +
> +		clkp =3D tegra_lookup_dt_id(init->clk_id, tegra210_clks);
> +		if (!clkp) {
> +			pr_warn("clock %u not found\n", init->clk_id);
> +			continue;
> +		}
> +
> +		clk =3D tegra_clk_register_periph_data(clk_base, init);
> +		*clkp =3D clk;
> +	}
> +
> +	tegra_periph_clk_init(clk_base, pmc_base, tegra210_clks, &pll_p_params);
> +
> +	/* mc */
> +	tegra210_clk_register_mc("mc", "emc");
> +}

[Severity: High]
tegra210_periph_clk_init() registers the mc clock with "emc" as its parent,
and tegra210_clks[] and devclks[] mark TEGRA210_CLK_PLL_M as present:

	[tegra_clk_pll_m] =3D { .dt_id =3D TEGRA210_CLK_PLL_M, .present =3D true },

However, unlike clk-tegra210.c, tegra210_periph_clk_init() never calls
tegra210_clk_register_emc() (leaving np unused and clks[TEGRA210_CLK_EMC]
unregistered), and tegra210_pll_init() never registers pll_m or pll_mb.

Won't this leave mc orphaned without a parent and cause clks[TEGRA210_CLK_E=
MC]
and clks[TEGRA210_CLK_PLL_M] to become ERR_PTR(-EINVAL) in
tegra_add_of_provider()?

> +static void __init tegra210_pll_init(void __iomem *clk_base,
> +				     void __iomem *pmc)
> +{
> +	struct clk *clk;
> +
> +	/* PLL_RE reference clock must be selected by boot-loader */
> +	pll_re_use_utmipll =3D readl_relaxed(clk_base + PLLRE_BASE) &
> +		PLLRE_BASE_CLKIN_SEL;
> +
> +	/* PLLC */
> +	clk =3D tegra_clk_register_pllc_tegra210("pll_c", "pll_ref", clk_base,
> +			pmc, 0, &pll_c_params, NULL);
> +	if (!WARN_ON(IS_ERR(clk)))
> +		clk_register_clkdev(clk, "pll_c", NULL);
> +	clks[TEGRA210_CLK_PLL_C] =3D clk;
> +
> +	/* PLLC_OUT1 */
> +	clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
> +			clk_base + PLLC_OUT, 0, TEGRA_DIVIDER_ROUND_UP,
> +			8, 8, 1, NULL);
> +	clk =3D tegra_clk_register_pll_out("pll_c_out1", "pll_c_out1_div",
> +				clk_base + PLLC_OUT, 1, 0,
> +				CLK_SET_RATE_PARENT, 0, NULL);
> +	clk_register_clkdev(clk, "pll_c_out1", NULL);
> +	clks[TEGRA210_CLK_PLL_C_OUT1] =3D clk;

[ ... ]

> +	clk =3D tegra_clk_register_divider("pll_re_out1_div", "pll_re_vco",
> +					 clk_base + PLLRE_OUT1, 0,
> +					 TEGRA_DIVIDER_ROUND_UP,
> +					 8, 8, 1, NULL);
> +	clk =3D tegra_clk_register_pll_out("pll_re_out1", "pll_re_out1_div",
> +					 clk_base + PLLRE_OUT1, 1, 0,
> +					 CLK_SET_RATE_PARENT, 0, NULL);
> +	clks[TEGRA210_CLK_PLL_RE_OUT1] =3D clk;
> +
> +	/* PLLE */
> +	clk =3D tegra_clk_register_plle_tegra210("pll_e", "pll_ref",
> +				      clk_base, 0, &pll_e_params, &pll_e_lock);
> +	clk_register_clkdev(clk, "pll_e", NULL);
> +	clks[TEGRA210_CLK_PLL_E] =3D clk;
> +
> +	/* PLLC4 */
> +	clk =3D tegra_clk_register_pllre_tegra210("pll_c4_vco", "pll_ref",
> +		clk_base, pmc, 0, &pll_c4_vco_params, NULL, pll_ref_freq);
> +	clk_register_clkdev(clk, "pll_c4_vco", NULL);
> +	clks[TEGRA210_CLK_PLL_C4] =3D clk;
> +
> +	/* PLLC4_OUT1 */
> +	clk =3D clk_register_fixed_factor(NULL, "pll_c4_out1", "pll_c4_vco",
> +					CLK_SET_RATE_PARENT, 1, 3);
> +	clk_register_clkdev(clk, "pll_c4_out1", NULL);
> +	clks[TEGRA210_CLK_PLL_C4_OUT1] =3D clk;
> +
> +	/* PLLC4_OUT2 */
> +	clk =3D clk_register_fixed_factor(NULL, "pll_c4_out2", "pll_c4_vco",
> +					CLK_SET_RATE_PARENT, 1, 5);
> +	clk_register_clkdev(clk, "pll_c4_out2", NULL);
> +	clks[TEGRA210_CLK_PLL_C4_OUT2] =3D clk;
> +
> +	/* PLLC4_OUT3 */
> +	clk =3D tegra_clk_register_divider("pll_c4_out3_div", "pll_c4_out0",
> +			clk_base + PLLC4_OUT, 0, TEGRA_DIVIDER_ROUND_UP,
> +			8, 8, 1, NULL);
> +	clk =3D tegra_clk_register_pll_out("pll_c4_out3", "pll_c4_out3_div",
> +				clk_base + PLLC4_OUT, 1, 0,
> +				CLK_SET_RATE_PARENT, 0, NULL);
> +	clk_register_clkdev(clk, "pll_c4_out3", NULL);
> +	clks[TEGRA210_CLK_PLL_C4_OUT3] =3D clk;

[Severity: High]
In tegra210_pll_init(), pll_c4_out3_div is registered with "pll_c4_out0" as
its parent, and TEGRA210_CLK_PLL_C4_OUT0 is marked present in tegra210_clks=
[]
and listed in devclks[], as well as used as a parent by peripheral clocks
such as la, sdmmc, ape, and qspi.

However, pll_c4_out0 itself is never registered in tegra210_pll_init() and
clks[TEGRA210_CLK_PLL_C4_OUT0] is never populated. Should pll_c4_out0 be
registered between pll_c4_vco and pll_c4_out1 as in clk-tegra210.c?

[Severity: Medium]
Also in tegra210_pll_init(), the divider and pll_out pairs for PLLC_OUT
(pll_c_out1_div and pll_c_out1), PLLRE_OUT1 (pll_re_out1_div and pll_re_out=
1),
and PLLC4_OUT (pll_c4_out3_div and pll_c4_out3) each share a single 32-bit
register, but pass NULL for their spinlock parameter.

Since clk_frac_div_set_rate() runs under prepare_lock while
clk_pll_out_enable() and clk_pll_out_disable() run under enable_lock, can
concurrent rate changes and enable/disable operations race on read-modify-w=
rite
updates to PLLC_OUT, PLLRE_OUT1, and PLLC4_OUT without a shared spinlock?

[ ... ]

> diff --git a/drivers/clk/tegra/clk-utils.c b/drivers/clk/tegra/clk-utils.c
> index 1a5daae4e5014..4283f314c513f 100644
> --- a/drivers/clk/tegra/clk-utils.c
> +++ b/drivers/clk/tegra/clk-utils.c
> @@ -31,7 +31,7 @@ int div_frac_get(unsigned long rate, unsigned parent_ra=
te, u8 width,
>  	if (flags & TEGRA_DIVIDER_INT)
>  		divider_ux1 *=3D mul;
> =20
> -	if (divider_ux1 < mul)
> +	if (!div1_5_not_allowed && divider_ux1 < mul)
>  		return 0;
> =20
>  	divider_ux1 -=3D mul;
> @@ -39,5 +39,8 @@ int div_frac_get(unsigned long rate, unsigned parent_ra=
te, u8 width,
>  	if (divider_ux1 > div_mask(width))
>  		return div_mask(width);
> =20
> +	if (div1_5_not_allowed && (divider_ux1 > 0) && (divider_ux1 < mul))
> +		divider_ux1 =3D (flags & TEGRA_DIVIDER_ROUND_UP) ? mul : 0;
> +
>  	return divider_ux1;
>  }

[Severity: High]
In div_frac_get(), when tegra210b01_adjust_clks() sets div1_5_not_allowed to
true and a caller requests a rate high enough that do_div(divider_ux1, rate)
produces divider_ux1 < mul (for example, when rate > parent_rate), the early
return 0 is skipped.

Execution then reaches:

	divider_ux1 -=3D mul;

	if (divider_ux1 > div_mask(width))
		return div_mask(width);

Because divider_ux1 is a u64, subtracting mul when divider_ux1 < mul
underflows to a large unsigned value and returns div_mask(width) (the maxim=
um
divider) instead of 0 (1:1 division).

Since a 1:1.5 divider has divider_ux1 =3D=3D 3 before subtracting mul =3D=
=3D 2 (and
divider_ux1 =3D=3D 1 after subtracting mul), should the pre-subtraction
(divider_ux1 < mul) check remain unconditional?

> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
> index 78655422253d5..7930b2acd2368 100644
> --- a/drivers/clk/tegra/clk.c
> +++ b/drivers/clk/tegra/clk.c
> @@ -289,13 +290,27 @@ void tegra_init_from_table(struct tegra_clk_init_ta=
ble *tbl,
>  			}
>  		}
> =20
> -		if (tbl->rate)
> -			if (clk_set_rate(clk, tbl->rate)) {
> +		if (tbl->rate) {
> +			bool can_set_rate =3D true;
> +
> +			if ((tbl->flags & TEGRA_TABLE_RATE_CHANGE_OVERCLOCK) &&
> +			    __clk_is_enabled(clk)) {\
> +				if (tbl->rate !=3D clk_get_rate(clk)) {
> +					pr_err("%s: Can't set rate %lu of %s\n",
> +					       __func__, tbl->rate,
> +					       __clk_get_name(clk));
> +					WARN_ON(1);
> +				}
> +				can_set_rate =3D false;
> +			}

[Severity: Medium]
In tegra_init_from_table(), when TEGRA_TABLE_RATE_CHANGE_OVERCLOCK is set on
an already-enabled clock, tbl->rate is compared directly against
clk_get_rate(clk).

In t210b01_init_table[], TEGRA210_CLK_PLL_A is configured with:

	{ TEGRA210_CLK_PLL_A, TEGRA210_CLK_CLK_MAX, 564480000, 1,
		TEGRA_TABLE_RATE_CHANGE_OVERCLOCK },

Because PLL_A uses a fractional SDM divider (PLL_SDM_COEFF =3D 8192), its a=
ctual
recalculated rate from clk_get_rate() is 564478125 Hz (with a 38.4 MHz
reference) rather than 564480000 Hz. If PLL_A is already enabled at boot,
won't (tbl->rate !=3D clk_get_rate(clk)) always trigger pr_err() and WARN_O=
N(1)
unless tbl->rate is compared using clk_round_rate()?

> +
> +			if (can_set_rate && clk_set_rate(clk, tbl->rate)) {
>  				pr_err("%s: Failed to set rate %lu of %s\n",
>  				       __func__, tbl->rate,
>  				       __clk_get_name(clk));
>  				WARN_ON(1);
>  			}
> +		}
> =20
>  		if (tbl->state)
>  			if (clk_prepare_enable(clk)) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018-t210b01-cl=
ocks-v1-0-d9e980925925@gmail.com?part=3D2
