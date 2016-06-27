Return-Path: <rklein@nvidia.com>
From: Rhyland Klein <rklein@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette
	<mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, "Stephen
 Boyd" <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Andrew
 Bresticker" <abrestic@chromium.org>
Subject: RE: [PATCH v5] clk: tegra: Initialize UTMIPLL when enabling PLLU
Date: Mon, 27 Jun 2016 18:11:35 +0000
Message-ID: <dc524c6236144234a341fedaa22dbacb@HQMAIL112.nvidia.com>
References: <1464280891-23036-1-git-send-email-rklein@nvidia.com>
 <5763FFF5.5000303@nvidia.com> <20160617152336.GA27475@ulmo.ba.sec>
In-Reply-To: <20160617152336.GA27475@ulmo.ba.sec>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

Jonathan, can you confirm replacing usleep_range(100, 200) with udelay(2) w=
orks for you?

-rhyland

-----Original Message-----
From: Thierry Reding [mailto:thierry.reding@gmail.com]=20
Sent: Friday, June 17, 2016 11:24 AM
To: Jonathan Hunter
Cc: Rhyland Klein; Peter De Schrijver; Mike Turquette; Stephen Warren; Step=
hen Boyd; Alexandre Courbot; linux-clk@vger.kernel.org; linux-tegra@vger.ke=
rnel.org; linux-kernel@vger.kernel.org; Andrew Bresticker
Subject: Re: [PATCH v5] clk: tegra: Initialize UTMIPLL when enabling PLLU

* PGP Signed by an unknown key

On Fri, Jun 17, 2016 at 02:49:41PM +0100, Jon Hunter wrote:
> Hi Thierry,
>=20
> On 26/05/16 17:41, Rhyland Klein wrote:
> > From: Andrew Bresticker <abrestic@chromium.org>
> >=20
> > Move the UTMIPLL initialization code form clk-tegra<chip>.c files=20
> > into clk-pll.c. UTMIPLL was being configured and set in HW control=20
> > right after registration. However, when the clock init_table is=20
> > processed and child clks of PLLU are enabled, it will call in and=20
> > enable PLLU as well, and initiate SW enabling sequence even though=20
> > PLLU is already in HW control. This leads to getting UTMIPLL stuck with=
 a SEQ_BUSY status.
> >=20
> > Doing the initialization once during pllu_enable means we configure=20
> > it properly into HW control.
> >=20
> > A side effect of the commonization/localization of the UTMIPLL init=20
> > code, is that it corrects some errors that were present for earlier=20
> > generations. For instance, in clk-tegra124.c, it used to have:
> >=20
> > define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 6)
> >=20
> > when the correct shift to use is present in the new version:
> >=20
> > define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 27)
> >=20
> > which matches the Tegra124 TRM register definition.
> >=20
> > Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> >=20
> > [rklein: Merged in some later fixes for potential deadlocks]
> >=20
> > Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> > ---
> > v5:
> >  - Initialized flags to 0 to avoid harmless spinlock warnings
> >=20
> > v4:
> >  - Re-added examples in patch description
> >=20
> > v3:
> >  - Flushed out description to describe this patch.
> >=20
> >  drivers/clk/tegra/clk-pll.c      | 484 +++++++++++++++++++++++++++++++=
++++++++
> >  drivers/clk/tegra/clk-tegra114.c | 155 +------------ =20
> > drivers/clk/tegra/clk-tegra124.c | 156 +------------ =20
> > drivers/clk/tegra/clk-tegra210.c | 182 +-------------- =20
> > drivers/clk/tegra/clk-tegra30.c  | 113 +--------
> >  drivers/clk/tegra/clk.h          |  17 ++
> >  6 files changed, 510 insertions(+), 597 deletions(-)
> >=20
> > diff --git a/drivers/clk/tegra/clk-pll.c=20
> > b/drivers/clk/tegra/clk-pll.c index 4e194ecc8d5e..31e20110fae4=20
> > 100644
> > --- a/drivers/clk/tegra/clk-pll.c
> > +++ b/drivers/clk/tegra/clk-pll.c
>=20
> ...
>=20
> > +static int clk_pllu_tegra210_enable(struct clk_hw *hw) {
> > +	struct tegra_clk_pll *pll =3D to_clk_pll(hw);
> > +	struct clk_hw *pll_ref =3D clk_hw_get_parent(hw);
> > +	struct clk_hw *osc =3D clk_hw_get_parent(pll_ref);
> > +	unsigned long flags =3D 0, input_rate;
> > +	unsigned int i;
> > +	int ret =3D 0;
> > +	u32 val;
> > +
> > +	if (!osc) {
> > +		pr_err("%s: failed to get OSC clock\n", __func__);
> > +		return -EINVAL;
> > +	}
> > +	input_rate =3D clk_hw_get_rate(osc);
> > +
> > +	if (pll->lock)
> > +		spin_lock_irqsave(pll->lock, flags);
> > +
> > +	_clk_pll_enable(hw);
> > +	ret =3D clk_pll_wait_for_lock(pll);
> > +	if (ret < 0)
> > +		goto out;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(utmi_parameters); i++) {
> > +		if (input_rate =3D=3D utmi_parameters[i].osc_frequency)
> > +			break;
> > +	}
> > +
> > +	if (i =3D=3D ARRAY_SIZE(utmi_parameters)) {
> > +		pr_err("%s: Unexpected input rate %lu\n", __func__, input_rate);
> > +		ret =3D -EINVAL;
> > +		goto out;
> > +	}
> > +
> > +	val =3D pll_readl_base(pll);
> > +	val &=3D ~PLLU_BASE_OVERRIDE;
> > +	pll_writel_base(val, pll);
> > +
> > +	/* Put PLLU under HW control */
> > +	val =3D readl_relaxed(pll->clk_base + PLLU_HW_PWRDN_CFG0);
> > +	val |=3D PLLU_HW_PWRDN_CFG0_IDDQ_PD_INCLUDE |
> > +	       PLLU_HW_PWRDN_CFG0_USE_SWITCH_DETECT |
> > +	       PLLU_HW_PWRDN_CFG0_USE_LOCKDET;
> > +	val &=3D ~(PLLU_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL |
> > +		  PLLU_HW_PWRDN_CFG0_CLK_SWITCH_SWCTL);
> > +	writel_relaxed(val, pll->clk_base + PLLU_HW_PWRDN_CFG0);
> > +
> > +	val =3D readl_relaxed(pll->clk_base + XUSB_PLL_CFG0);
> > +	val &=3D ~XUSB_PLL_CFG0_PLLU_LOCK_DLY;
> > +	writel_relaxed(val, pll->clk_base + XUSB_PLL_CFG0);
> > +	udelay(1);
> > +
> > +	val =3D readl_relaxed(pll->clk_base + PLLU_HW_PWRDN_CFG0);
> > +	val |=3D PLLU_HW_PWRDN_CFG0_SEQ_ENABLE;
> > +	writel_relaxed(val, pll->clk_base + PLLU_HW_PWRDN_CFG0);
> > +	udelay(1);
> > +
> > +	/* Disable PLLU clock branch to UTMIPLL since it uses OSC */
> > +	val =3D pll_readl_base(pll);
> > +	val &=3D ~PLLU_BASE_CLKENABLE_USB;
> > +	pll_writel_base(val, pll);
> > +
> > +	val =3D readl_relaxed(pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
> > +	if (val & UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE) {
> > +		pr_debug("UTMIPLL already enabled\n");
> > +		goto out;
> > +	}
> > +	val &=3D ~UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE;
> > +	writel_relaxed(val, pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
> > +
> > +	/* Program UTMIP PLL stable and active counts */
> > +	val =3D readl_relaxed(pll->clk_base + UTMIP_PLL_CFG2);
> > +	val &=3D ~UTMIP_PLL_CFG2_STABLE_COUNT(~0);
> > +	val |=3D UTMIP_PLL_CFG2_STABLE_COUNT(utmi_parameters[i].stable_count)=
;
> > +	val &=3D ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
> > +	val |=3D UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(
> > +			utmi_parameters[i].active_delay_count);
> > +	val |=3D UTMIP_PLL_CFG2_PHY_XTAL_CLOCKEN;
> > +	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG2);
> > +
> > +	/* Program UTMIP PLL delay and oscillator frequency counts */
> > +	val =3D readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
> > +	val &=3D ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
> > +	val |=3D UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(
> > +		utmi_parameters[i].enable_delay_count);
> > +	val &=3D ~UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(~0);
> > +	val |=3D UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(
> > +		utmi_parameters[i].xtal_freq_count);
> > +	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG1);
> > +
> > +	/* Remove power downs from UTMIP PLL control bits */
> > +	val =3D readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
> > +	val &=3D ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
> > +	val |=3D UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
> > +	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG1);
> > +	udelay(100);
>=20
> In next-20160617 I see that this udelay is now a usleep_range(100,=20
> 200) and this is causing the following splat when the clock is=20
> enabled. I don't think that we can use usleep here ...

Okay, I'll back out the patch. I'd really prefer to avoid busy-looping for =
100 microseconds here, so can we please find another way to do this?

Thierry

* Unknown Key
* 0x7F3EB3A1
