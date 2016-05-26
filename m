Return-Path: <jonathanh@nvidia.com>
Subject: Re: [PATCH v4] clk: tegra: Initialize UTMIPLL when enabling PLLU
To: Rhyland Klein <rklein@nvidia.com>, Thierry Reding
	<thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
References: <1463585396-19562-1-git-send-email-rklein@nvidia.com>
CC: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot
	<gnurou@gmail.com>, <linux-tegra@vger.kernel.org>, Michael Turguette
	<mturquette@baylibre.com>, <linux-clk@vger.kernel.org>, Andrew Bresticker
	<abrestic@chromium.org>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <5746EB4A.4010205@nvidia.com>
Date: Thu, 26 May 2016 13:25:46 +0100
MIME-Version: 1.0
In-Reply-To: <1463585396-19562-1-git-send-email-rklein@nvidia.com>
Return-Path: jonathanh@nvidia.com
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>



On 18/05/16 16:29, Rhyland Klein wrote:
> From: Andrew Bresticker <abrestic@chromium.org>
>=20
> Move the UTMIPLL initialization code form clk-tegra<chip>.c files into
> clk-pll.c. UTMIPLL was being configured and set in HW control right
> after registration. However, when the clock init_table is processed and
> child clks of PLLU are enabled, it will call in and enable PLLU as
> well, and initiate SW enabling sequence even though PLLU is already in
> HW control. This leads to getting UTMIPLL stuck with a SEQ_BUSY status.
>=20
> Doing the initialization once during pllu_enable means we configure it
> properly into HW control.
>=20
> A side effect of the commonization/localization of the UTMIPLL init
> code, is that it corrects some errors that were present for earlier
> generations. For instance, in clk-tegra124.c, it used to have:
>=20
> define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 6)
>=20
> when the correct shift to use is present in the new version:
>=20
> define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 27)
>=20
> which matches the Tegra124 TRM register definition.
>=20
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
>=20
> [rklein: Merged in some later fixes for potential deadlocks]
>=20
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
> v4:
>  - Re-added examples in patch description
>=20
> v3:
>  - Flushed out description to describe this patch.
>=20
>  drivers/clk/tegra/clk-pll.c      | 484 +++++++++++++++++++++++++++++++++=
++++++
>  drivers/clk/tegra/clk-tegra114.c | 155 +------------
>  drivers/clk/tegra/clk-tegra124.c | 156 +------------
>  drivers/clk/tegra/clk-tegra210.c | 182 +--------------
>  drivers/clk/tegra/clk-tegra30.c  | 113 +--------
>  drivers/clk/tegra/clk.h          |  17 ++
>  6 files changed, 510 insertions(+), 597 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 4e194ecc8d5e..580cae8aee6d 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c

...

> +static int clk_pllu_enable(struct clk_hw *hw)
> +{
> +	struct tegra_clk_pll *pll =3D to_clk_pll(hw);
> +	struct clk_hw *pll_ref =3D clk_hw_get_parent(hw);
> +	struct clk_hw *osc =3D clk_hw_get_parent(pll_ref);
> +	unsigned long flags, input_rate;
> +	unsigned int i;
> +	int ret =3D 0;
> +	u32 val;
> +
> +	if (!osc) {
> +		pr_err("%s: failed to get OSC clock\n", __func__);
> +		return -EINVAL;
> +	}
> +	input_rate =3D clk_hw_get_rate(osc);
> +
> +	if (pll->lock)
> +		spin_lock_irqsave(pll->lock, flags);
> +
> +	_clk_pll_enable(hw);
> +	ret =3D clk_pll_wait_for_lock(pll);
> +	if (ret < 0)
> +		goto out;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(utmi_parameters); i++) {
> +		if (input_rate =3D=3D utmi_parameters[i].osc_frequency)
> +			break;
> +	}
> +
> +	if (i =3D=3D ARRAY_SIZE(utmi_parameters)) {
> +		pr_err("%s: Unexpected input rate %lu\n", __func__, input_rate);
> +		ret =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	val =3D pll_readl_base(pll);
> +	val &=3D ~PLLU_BASE_OVERRIDE;
> +	pll_writel_base(val, pll);
> +
> +	val =3D readl_relaxed(pll->clk_base + UTMIP_PLL_CFG2);
> +	/* Program UTMIP PLL stable and active counts */
> +	val &=3D ~UTMIP_PLL_CFG2_STABLE_COUNT(~0);
> +	val |=3D UTMIP_PLL_CFG2_STABLE_COUNT(utmi_parameters[i].stable_count);
> +	val &=3D ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
> +	val |=3D UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(
> +			utmi_parameters[i].active_delay_count);
> +	/* Remove power downs from UTMIP PLL control bits */
> +	val &=3D ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN;
> +	val &=3D ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN;
> +	val &=3D ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERDOWN;
> +	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG2);
> +
> +	val =3D readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
> +	/* Program UTMIP PLL delay and oscillator frequency counts */
> +	val &=3D ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
> +	val |=3D UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(
> +		utmi_parameters[i].enable_delay_count);
> +	val &=3D ~UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(~0);
> +	val |=3D UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(
> +		utmi_parameters[i].xtal_freq_count);
> +	/* Remove power downs from UTMIP PLL control bits */
> +	val &=3D ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
> +	val &=3D ~UTMIP_PLL_CFG1_FORCE_PLL_ACTIVE_POWERDOWN;
> +	val &=3D ~UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN;
> +	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG1);
> +
> +out:
> +	if (pll->lock)
> +		spin_unlock_irqrestore(pll->lock, flags);
> +
> +	return ret;
> +}

After applying this I get the following warning ...

In file included from include/linux/mmzone.h:7:0,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:14,
                 from drivers/clk/tegra/clk-pll.c:17:
drivers/clk/tegra/clk-pll.c: In function =91clk_pllu_enable=92:
include/linux/spinlock.h:246:30: warning: =91flags=92 may be used
uninitialized in this function [-Wmaybe-uninitialized]
   _raw_spin_unlock_irqrestore(lock, flags); \
                              ^
drivers/clk/tegra/clk-pll.c:1065:16: note: =91flags=92 was declared here
  unsigned long flags, input_rate;
                ^
In file included from include/linux/mmzone.h:7:0,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:14,
                 from drivers/clk/tegra/clk-pll.c:17:
drivers/clk/tegra/clk-pll.c: In function =91clk_pllu_tegra210_enable=92:
include/linux/spinlock.h:246:30: warning: =91flags=92 may be used
uninitialized in this function [-Wmaybe-uninitialized]
   _raw_spin_unlock_irqrestore(lock, flags); \
                              ^
drivers/clk/tegra/clk-pll.c:2511:16: note: =91flags=92 was declared here
  unsigned long flags, input_rate;
                ^
In file included from include/linux/mmzone.h:7:0,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:14,
                 from drivers/clk/tegra/clk-pll.c:17:
drivers/clk/tegra/clk-pll.c: In function =91clk_pllu_tegra114_enable=92:
include/linux/spinlock.h:246:30: warning: =91flags=92 may be used
uninitialized in this function [-Wmaybe-uninitialized]
   _raw_spin_unlock_irqrestore(lock, flags); \
                              ^
drivers/clk/tegra/clk-pll.c:1677:16: note: =91flags=92 was declared here
  unsigned long flags, input_rate;

Cheers
Jon

--=20
nvpublic
