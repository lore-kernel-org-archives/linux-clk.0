Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452007;
	b=qOREpe6qSv09LaX52xM78aacQ2E5TFcUmLWBId2SgKw0FH4ZfKMnEoo+hWw1VgeOGQ2+
	 en2f8x9unZv6xeY9LLLkHuBU9FiS5nZ5kwcPL92vM6bS49s0Xv+BYTjTwVWrJjShgZQ67
	 BPdf1djq5vzApk3lEE0J1neG+EBioVF15P4hk5UO47zsSaMpZQuuu5agutJYLhfklqxck
	 dbDsMiguo9wYzlLFEmT8e2lnSJlWppj5eZ0m0KNgt/1wRFexHKRIYsf2mb+RXsYcy7wmu
	 1n8omXICN0S0/NHWt0So22qMrfRDjWiCqMpTTMbGr5fp/UpBOfiAz9CRCplFKvJwldg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452007;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Ifefo9ihND7qrhKSUeUBSFpT37+w+LdN/cEFYgqe/5Y=;
	b=pdrW+pIj6Zl+7vkERbuSUOx7YkDnSgBvfSN8vyvuQWDL7yQloKAyTxPgOBcg8fMJr70T
	 VmljasmDq4VQgqgq35aqGfn8lfmAK07WzE9/DPS+ywwypv/mwxrktkLvLASxsTahJCqyA
	 tOzv8D5/vTnQELsQ8J8xtgZbETN/RgiPEzZTQjU8RjXFiDee4WOML1uEVg/X91hocoMoW
	 lQxz92388j4IWFC876PD4i5t5Y82lhW1m1y9fHBWRzwGGvweoKiZvn2Pl5pXUz0U4lwxa
	 pGaVKIdWxn7aXzr5BMssacta0k6r1kUjz0kkVyQnItYoOAkGMEfRKLDVMh8ybaYxgiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mX5ZqBvn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAFD606A31A;
	Mon, 23 Nov 2026 16:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mX5ZqBvn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA0D1F000C0;
	Mon, 23 Nov 2026 16:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452006;
	bh=Ifefo9ihND7qrhKSUeUBSFpT37+w+LdN/cEFYgqe/5Y=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mX5ZqBvnAO1vzRTvzPk01vdJ1629C4jXJE6LGRxxW3pZrPQfnBOYagkRaKANBloBM
	 fPyR3P1QjwDs/f/RLjfzYeBfx517FMV9bNWaQRroWgrLGE9Qy6aYoKW+9ORFC5ldCC
	 IUhxXawgYkBwdJzfeB/y65hxpzrAI5NcfQHmh59AsrqYL+89VuI++T1Mt0ZmU/pNSW
	 nwj3Ood4Yg2jHw/6R5dmo2+BIdsqAUC6bJzdbyIpzBvPgBbyvDr+HW4Q+45+7D0Mw/
	 6h/muFE5OKGv9uCUo4PHp3fRsSL0O8iGhDelkLZPmdrlws6B+jbqwxxialX3wal6G9
	 h/UzEcvpaqwhQ==
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
Subject: Re: [PATCH v4 2/4] clk: siflower: Add SF19A2890 clock manager
 driver
From: Brian Masney <masneyb@kernel.org>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261122-sf19a2890-sysm-v4-2-bbfe1c495e2e@telaak.dev>
References: <20261122-sf19a2890-sysm-v4-0-bbfe1c495e2e@telaak.dev>
 <20261122-sf19a2890-sysm-v4-2-bbfe1c495e2e@telaak.dev>
Date: Mon, 23 Nov 2026 11:39:57 -0500
Message-Id: <179545199778.209212.13754058672210050271.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=20935; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=D1OTKavmQL9y0t7kDP6cLC1jkearQMDz7bnodVextKU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZcuLjpAUVMh+ysm/+9uyF8BONnU+vfOSo0r3HKRSp9
 UmK49n1jlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACay6RQjw8t1Yt8K772xi1+m
 KBlU2T11lXRvaWBh4dovuyymdD0VkWFkeHAsWK+Tf/WLtgIODwmD5dO2mXr/mMRRdDuGS7PQrr+
 SAwA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Joseph,

> Add a driver for the clock manager of the Siflower SF19A2890: the CPU,
> DDR and common PLLs, and the muxes with dividers that derive the bus,
> CPU and peripheral clocks from them. The GIC timer probes before the
> platform bus and needs the CPU clock, so the driver registers that clock
> and its PLLs early, from CLK_OF_DECLARE_DRIVER, and the other clocks from
> a platform driver.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [Joseph Telaak:
>   - take it from Chuanhong's siflower-7.1 branch
>   - read the PLL power-down register at the PLL's offset, not at
>     offset 1
>   - take the oscillators from the node's clocks and the PLLs by
>     pointer, not by global name
>   - count the clocks in the driver, not in the binding header
>   - drop the spinlock and sf_rmw(), which nothing used
>   - unregister the clocks and unmap on errors
>   - return 0 for a zero divider and compute the VCO rate in 64 bits
>   - scale the fractional part of the VCO rate by the reference, not
>     by the integer rate
>   - reject a rate of 0 in the mux dividers instead of dividing by it
>   - map the mux values with a table and keep MUXDIV_USE_NCO when
>     setting the parent
>   - register only the CPU clock and its PLLs early, the others from a
>     platform driver
>   - pr_fmt, u32 offsets and sorted includes
>   - one Kconfig symbol without the menu, depending on
>     MACH_SIFLOWER_MIPS
>   - checkpatch --strict cleanups, commit message and subject]

Since you made a bunch of changes and are upstreaming this, at this
point you can probably make yourself the primary author at this point
on these patches and keep Chuanhong's signed-off-by along with a
Co-developed-by. If the original driver is available at a public URL,
you can call that out in the commit description and include that with
a Link tag as well.

> Co-developed-by: Joseph Telaak <joseph@telaak.dev>
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  MAINTAINERS                          |   1 +
>  drivers/clk/Kconfig                  |   1 +
>  drivers/clk/Makefile                 |   1 +
>  drivers/clk/siflower/Kconfig         |  11 +
>  drivers/clk/siflower/Makefile        |   2 +
>  drivers/clk/siflower/clk-sf19a2890.c | 486 +++++++++++++++++++++++++++++++++++
>  6 files changed, 502 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ce8d0596939c..de087d1c255d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25703,6 +25703,7 @@ M:	Joseph Telaak <joseph@telaak.dev>
>  L:	linux-clk@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml
> +F:	drivers/clk/siflower/clk-sf19a2890.c
>  F:	include/dt-bindings/clock/siflower,sf19a2890-clk.h
>  
>  SILEAD TOUCHSCREEN DRIVER
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 37a8e35d4178..8e73490cb702 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -536,6 +536,7 @@ source "drivers/clk/renesas/Kconfig"
>  source "drivers/clk/rockchip/Kconfig"
>  source "drivers/clk/samsung/Kconfig"
>  source "drivers/clk/sifive/Kconfig"
> +source "drivers/clk/siflower/Kconfig"
>  source "drivers/clk/socfpga/Kconfig"
>  source "drivers/clk/sophgo/Kconfig"
>  source "drivers/clk/spacemit/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 52d138d4ffc8..d2f07584783e 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -160,6 +160,7 @@ obj-y					+= renesas/
>  obj-$(CONFIG_COMMON_CLK_ROCKCHIP)	+= rockchip/
>  obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
>  obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> +obj-y					+= siflower/
>  obj-y					+= socfpga/
>  obj-y					+= sophgo/
>  obj-y					+= spacemit/
> diff --git a/drivers/clk/siflower/Kconfig b/drivers/clk/siflower/Kconfig
> new file mode 100644
> index 000000000000..ad1b04b4bb9b
> --- /dev/null
> +++ b/drivers/clk/siflower/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config CLK_SF19A2890
> +	bool "Clock driver for Siflower SF19A2890"
> +	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
> +	default MACH_SIFLOWER_MIPS

Following up from Sashiko: I don't see MACH_SIFLOWER_MIPS in linux-next.
Add a single patch that adds MACH_SIFLOWER_MIPS so that we can have an
immutable branch between the clk / MIPS trees. Which ever series is
ready first can setup the immutable branch for the other tree.

> +	help
> +	  Supports the clock manager of the Siflower SF19A2890: its PLLs
> +	  and the muxes and dividers that feed the CPU, the buses and the
> +	  peripherals. The GIC timer runs from the CPU clock, so a kernel
> +	  for this SoC needs it built in.
> diff --git a/drivers/clk/siflower/Makefile b/drivers/clk/siflower/Makefile
> new file mode 100644
> index 000000000000..3f4d689f7d9b
> --- /dev/null
> +++ b/drivers/clk/siflower/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_CLK_SF19A2890) += clk-sf19a2890.o
> diff --git a/drivers/clk/siflower/clk-sf19a2890.c b/drivers/clk/siflower/clk-sf19a2890.c
> new file mode 100644
> index 000000000000..4dad8f65eb4b
> --- /dev/null
> +++ b/drivers/clk/siflower/clk-sf19a2890.c
> @@ -0,0 +1,486 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#define pr_fmt(fmt) "sf19a2890-clk: " fmt
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device-id/of.h>
> +#include <linux/io.h>
> +#include <linux/math64.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include <dt-bindings/clock/siflower,sf19a2890-clk.h>
> +
> +#define CLK_SF19A2890_NR_CLKS	(CLK_MUXDIV_NPU_PE + 1)
> +
> +#define REG_PLL_BASE		0x0
> +#define REG_PLL_PD		0x0
> +#define  PLL_PD			BIT(0)
> +#define  PLL_PD_VCO		BIT(1)
> +#define  PLL_PD_POSTDIV		BIT(2)
> +#define  PLL_PD_4PHASE		BIT(3)
> +#define  PLL_PD_DAC		BIT(4)
> +#define  PLL_PD_DSM		BIT(5)
> +
> +/*
> + * PLL_PARAM is a 48-bit value put into 6 registers, 8-bit per register:
> + * REFDIV = PLL_PARAM[47:42]
> + * POSTDIV2 = PLL_PARAM[41:39]
> + * POSTDIV1 = PLL_PARAM[38:36]
> + * FRAC = PLL_PARAM[35:12]
> + * FBDIV = PLL_PARAM[11:0]
> + */
> +
> +#define REG_PLL_PARAM(_x)	(0x4 + (_x) * 4)
> +#define  PLL_REFDIV_HI		47
> +#define  PLL_REFDIV_LO		42
> +#define  PLL_POSTDIV2_HI	41
> +#define  PLL_POSTDIV2_LO	39
> +#define  PLL_POSTDIV1_HI	38
> +#define  PLL_POSTDIV1_LO	36
> +#define  PLL_FRAC_HI		35
> +#define  PLL_FRAC_LO		12
> +#define  PLL_FRAC_BITS		(PLL_FRAC_HI - PLL_FRAC_LO + 1)
> +#define  PLL_FBDIV_HI		11
> +#define  PLL_FBDIV_LO		0
> +
> +#define REG_PLL_CFG 0x1c
> +#define  PLL_CFG_BYPASS		BIT(0)
> +#define  PLL_CFG_SRC		GENMASK(2, 1)
> +#define  PLL_CFG_OCLK_SEL	BIT(3)
> +#define  PLL_CFG_OCLK_GATE	BIT(4)
> +#define  PLL_CFG_LOAD_DIVS	BIT(5)
> +
> +#define REG_PLL_LOCK 0x20
> +
> +/*
> + * Read-only register indicating the value of the hardware clock source
> + * override pin. When the first bit of this register is set, PLL clock
> + * source is forced to the 40M oscillator regardless of PLL_CFG_SRC
> + * value.
> + */
> +#define REG_PLL_SRC_OVERRIDE 0x24
> +
> +struct sf_clk_common {
> +	void __iomem *base;
> +	struct clk_hw hw;
> +};
> +
> +struct sf19a2890_clk {
> +	struct sf_clk_common common;
> +	u32 offset;
> +};
> +
> +#define SF_CLK_COMMON(_name, _parents, _op, _flags)				\
> +	{								\
> +		.hw.init = CLK_HW_INIT_PARENTS_DATA(_name, _parents, _op,	\
> +						    _flags),		\
> +	}
> +
> +static inline struct sf_clk_common *hw_to_sf_clk_common(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct sf_clk_common, hw);
> +}
> +
> +static inline struct sf19a2890_clk *cmn_to_clk(struct sf_clk_common *cmn_priv)
> +{
> +	return container_of(cmn_priv, struct sf19a2890_clk, common);
> +}
> +
> +static inline u32 sf_readl(struct sf_clk_common *priv, u32 reg)
> +{
> +	return readl(priv->base + reg);
> +}
> +
> +static inline void sf_writel(struct sf_clk_common *priv, u32 reg, u32 val)
> +{
> +	writel(val, priv->base + reg);
> +}
> +
> +static u32 sf_pll_param_get(struct sf19a2890_clk *priv, u32 hi, u32 lo)
> +{
> +	struct sf_clk_common *cmn = &priv->common;
> +	u32 ret = 0;
> +	int reg_hi = hi / 8;
> +	int reg_lo = lo / 8;
> +	u32 reg_hi_pos = hi % 8;
> +	u32 reg_lo_pos = lo % 8;
> +	int i;
> +
> +	if (reg_hi == reg_lo) {
> +		u32 mask = (BIT(reg_hi_pos - reg_lo_pos + 1)) - 1;
> +		u32 reg_val = sf_readl(cmn, priv->offset + REG_PLL_PARAM(reg_hi));
> +
> +		return (reg_val >> reg_lo_pos) & mask;
> +	}
> +
> +	ret = sf_readl(cmn, priv->offset + REG_PLL_PARAM(reg_hi)) & (BIT(reg_hi_pos + 1) - 1);
> +	for (i = reg_hi - 1; i > reg_lo; i--)
> +		ret = (ret << 8) | sf_readl(cmn, priv->offset + REG_PLL_PARAM(i));
> +	ret = (ret << (8 - reg_lo_pos)) |
> +	      (sf_readl(cmn, priv->offset + REG_PLL_PARAM(reg_lo)) >> reg_lo_pos);
> +
> +	return ret;
> +}
> +
> +static unsigned long sf19a28_pll_recalc_rate(struct clk_hw *hw,
> +					     unsigned long parent_rate)
> +{
> +	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
> +	struct sf19a2890_clk *priv = cmn_to_clk(cmn_priv);
> +	u32 refdiv = sf_pll_param_get(priv, PLL_REFDIV_HI, PLL_REFDIV_LO);
> +	u32 fbdiv = sf_pll_param_get(priv, PLL_FBDIV_HI, PLL_FBDIV_LO);
> +	u32 postdiv1 = sf_pll_param_get(priv, PLL_POSTDIV1_HI, PLL_POSTDIV1_LO);
> +	u32 postdiv2 = sf_pll_param_get(priv, PLL_POSTDIV2_HI, PLL_POSTDIV2_LO);
> +	u32 pll_pd = sf_readl(cmn_priv, priv->offset + REG_PLL_PD);
> +	u64 rate;
> +	u32 frac;
> +
> +	if (!refdiv || !postdiv1 || !postdiv2)
> +		return 0;
> +
> +	rate = div_u64((u64)parent_rate * fbdiv, refdiv);
> +
> +	/* With the DSM on, the VCO runs at parent / refdiv * (fbdiv + frac / 2^24) */
> +	if (!(pll_pd & PLL_PD_DSM)) {
> +		frac = sf_pll_param_get(priv, PLL_FRAC_HI, PLL_FRAC_LO);
> +		rate += div_u64((u64)parent_rate * frac, refdiv) >> PLL_FRAC_BITS;
> +	}
> +
> +	return div_u64(rate, postdiv1 * postdiv2);
> +}
> +
> +static u8 sf19a28_pll_get_parent(struct clk_hw *hw)
> +{
> +	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
> +	struct sf19a2890_clk *priv = cmn_to_clk(cmn_priv);
> +	u32 cfg;
> +
> +	if (sf_readl(cmn_priv, priv->offset + REG_PLL_SRC_OVERRIDE))
> +		return 1;
> +
> +	cfg = sf_readl(cmn_priv, priv->offset + REG_PLL_CFG);
> +
> +	return (FIELD_GET(PLL_CFG_SRC, cfg) == 1);
> +}
> +
> +static const struct clk_ops sf19a28_pll_ops = {
> +	.recalc_rate = sf19a28_pll_recalc_rate,
> +	.get_parent = sf19a28_pll_get_parent,
> +};
> +
> +static const struct clk_parent_data clk_pll_parents[] = {
> +	{ .fw_name = "osc12m" },
> +	{ .fw_name = "osc40m" },
> +};
> +
> +#define SF19A28_PLL(_name, _offset, _flags)				\
> +	struct sf19a2890_clk _name = {					\
> +		.common = SF_CLK_COMMON(#_name, clk_pll_parents,	\
> +					&sf19a28_pll_ops, _flags),	\
> +		.offset = REG_PLL_BASE + (_offset),			\
> +	}
> +
> +static SF19A28_PLL(pll_cpu, 0x0, 0);
> +static SF19A28_PLL(pll_ddr, 0x40, 0);
> +static SF19A28_PLL(pll_cmn, 0x80, 0);
> +
> +#define REG_MUXDIV_BASE		0x400
> +#define REG_MUXDIV_CFG		0x0
> +#define  MUXDIV_USE_NCO		BIT(3)
> +#define  MUXDIV_SRC_SEL		GENMASK(2, 0)
> +#define REG_MUXDIV_RATIO	0x4
> +#define  MUXDIV_RATIO_MAX	0xff
> +#define REG_MUXDIV_NCO_V	0x8
> +#define REG_MUXDIV_EN		0xc
> +#define REG_MUXDIV_XN_DIV_RATIO	0x10
> +#define  MUXDIV_XN_DIV_MAX	3
> +
> +static unsigned long sf19a28_muxdiv_recalc_rate(struct clk_hw *hw,
> +						unsigned long parent_rate)
> +{
> +	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
> +	struct sf19a2890_clk *priv = cmn_to_clk(cmn_priv);
> +	u32 div;
> +
> +	div = sf_readl(cmn_priv, priv->offset + REG_MUXDIV_RATIO) + 1;
> +	return parent_rate / div;
> +}
> +
> +static int sf19a28_muxdiv_determine_rate(struct clk_hw *hw,
> +					 struct clk_rate_request *req)
> +{
> +	unsigned int div;
> +
> +	if (!req->rate)
> +		div = MUXDIV_RATIO_MAX + 1;
> +	else
> +		div = DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);
> +
> +	if (!div)
> +		div = 1;
> +	else if (div > MUXDIV_RATIO_MAX + 1)
> +		div = MUXDIV_RATIO_MAX + 1;
> +
> +	req->rate = req->best_parent_rate / div;
> +	return 0;
> +}
> +
> +static int sf19a28_muxdiv_set_rate(struct clk_hw *hw, unsigned long rate,
> +				   unsigned long parent_rate)
> +{
> +	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
> +	struct sf19a2890_clk *priv = cmn_to_clk(cmn_priv);
> +	unsigned int div;
> +
> +	if (!rate)
> +		return -EINVAL;
> +
> +	div = DIV_ROUND_CLOSEST(parent_rate, rate);
> +	if (div < 1)
> +		div = 1;
> +	else if (div > MUXDIV_RATIO_MAX + 1)
> +		div = MUXDIV_RATIO_MAX + 1;
> +	div -= 1;
> +
> +	sf_writel(cmn_priv, priv->offset + REG_MUXDIV_RATIO, div);
> +
> +	return 0;
> +}
> +
> +static int sf19a28_muxdiv_enable(struct clk_hw *hw)
> +{
> +	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
> +	struct sf19a2890_clk *priv = cmn_to_clk(cmn_priv);
> +
> +	sf_writel(cmn_priv, priv->offset + REG_MUXDIV_EN, 1);
> +	return 0;
> +}
> +
> +static void sf19a28_muxdiv_disable(struct clk_hw *hw)
> +{
> +	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
> +	struct sf19a2890_clk *priv = cmn_to_clk(cmn_priv);
> +
> +	sf_writel(cmn_priv, priv->offset + REG_MUXDIV_EN, 0);
> +}
> +
> +static int sf19a28_muxdiv_is_enabled(struct clk_hw *hw)
> +{
> +	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
> +	struct sf19a2890_clk *priv = cmn_to_clk(cmn_priv);
> +
> +	return !!sf_readl(cmn_priv, priv->offset + REG_MUXDIV_EN);
> +}
> +
> +/* MUXDIV_SRC_SEL values of clk_muxdiv_parents */
> +static const u32 sf19a28_muxdiv_table[] = { 0, 1, 2, 4, 6 };
> +
> +static u8 sf19a28_muxdiv_get_parent(struct clk_hw *hw)
> +{
> +	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
> +	struct sf19a2890_clk *priv = cmn_to_clk(cmn_priv);
> +	u32 cfg = sf_readl(cmn_priv, priv->offset + REG_MUXDIV_CFG);
> +
> +	return clk_mux_val_to_index(hw, sf19a28_muxdiv_table, 0, FIELD_GET(MUXDIV_SRC_SEL, cfg));
> +}
> +
> +static int sf19a28_muxdiv_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
> +	struct sf19a2890_clk *priv = cmn_to_clk(cmn_priv);
> +	u32 cfg = sf_readl(cmn_priv, priv->offset + REG_MUXDIV_CFG);
> +
> +	/* Keep MUXDIV_USE_NCO */
> +	cfg &= ~MUXDIV_SRC_SEL;
> +	cfg |= FIELD_PREP(MUXDIV_SRC_SEL, clk_mux_index_to_val(sf19a28_muxdiv_table, 0, index));
> +	sf_writel(cmn_priv, priv->offset + REG_MUXDIV_CFG, cfg);
> +
> +	return 0;
> +}
> +
> +static const struct clk_parent_data clk_muxdiv_parents[] = {
> +	{ .hw = &pll_cpu.common.hw },
> +	{ .hw = &pll_ddr.common.hw },
> +	{ .hw = &pll_cmn.common.hw },
> +	{ .fw_name = "osc12m" },
> +	{ .fw_name = "osc40m" },
> +};
> +
> +static const struct clk_ops sf19a28_muxdiv_ops = {
> +	.recalc_rate = sf19a28_muxdiv_recalc_rate,
> +	.determine_rate = sf19a28_muxdiv_determine_rate,
> +	.set_rate = sf19a28_muxdiv_set_rate,
> +	.enable = sf19a28_muxdiv_enable,
> +	.disable = sf19a28_muxdiv_disable,
> +	.is_enabled = sf19a28_muxdiv_is_enabled,
> +	.get_parent = sf19a28_muxdiv_get_parent,
> +	.set_parent = sf19a28_muxdiv_set_parent,
> +};
> +
> +#define SF19A28_MUXDIV(_name, _offset, _flags)				\
> +	struct sf19a2890_clk _name = {					\
> +		.common = SF_CLK_COMMON(#_name, clk_muxdiv_parents,	\
> +					&sf19a28_muxdiv_ops, _flags),	\
> +		.offset = REG_MUXDIV_BASE + (_offset),			\
> +	}
> +
> +static SF19A28_MUXDIV(muxdiv_bus1, 0x0, CLK_IS_CRITICAL);
> +static SF19A28_MUXDIV(muxdiv_bus2, 0x20, CLK_IS_CRITICAL);
> +static SF19A28_MUXDIV(muxdiv_bus3, 0x40, CLK_IS_CRITICAL);
> +static SF19A28_MUXDIV(muxdiv_cpu, 0x100, CLK_SET_RATE_NO_REPARENT);
> +static SF19A28_MUXDIV(muxdiv_pbus, 0x120, CLK_IS_CRITICAL);
> +static SF19A28_MUXDIV(muxdiv_mem_phy, 0x140, CLK_IS_CRITICAL);
> +static SF19A28_MUXDIV(muxdiv_uart, 0x180, 0);
> +static SF19A28_MUXDIV(muxdiv_eth_ref, 0x200, 0);
> +static SF19A28_MUXDIV(muxdiv_eth_byp_ref, 0x220, 0);
> +static SF19A28_MUXDIV(muxdiv_eth_tsu, 0x240, 0);
> +static SF19A28_MUXDIV(muxdiv_gmac_byp_ref, 0x260, 0);
> +static SF19A28_MUXDIV(muxdiv_m6250_0, 0x280, 0);
> +static SF19A28_MUXDIV(muxdiv_m6250_1, 0x2a0, 0);
> +static SF19A28_MUXDIV(muxdiv_wlan24_plf, 0x2c0, 0);
> +static SF19A28_MUXDIV(muxdiv_wlan5_plf, 0x2e0, 0);
> +static SF19A28_MUXDIV(muxdiv_usbphy_ref, 0x300, 0);
> +static SF19A28_MUXDIV(muxdiv_tclk, 0x320, 0);
> +static SF19A28_MUXDIV(muxdiv_npu_pe, 0x340, 0);
> +
> +static struct clk_hw *const sf19a2890_hws[CLK_SF19A2890_NR_CLKS] = {
> +	[CLK_PLL_CPU] = &pll_cpu.common.hw,
> +	[CLK_PLL_DDR] = &pll_ddr.common.hw,
> +	[CLK_PLL_CMN] = &pll_cmn.common.hw,
> +	[CLK_MUXDIV_BUS1] = &muxdiv_bus1.common.hw,
> +	[CLK_MUXDIV_BUS2] = &muxdiv_bus2.common.hw,
> +	[CLK_MUXDIV_BUS3] = &muxdiv_bus3.common.hw,
> +	[CLK_MUXDIV_CPU] = &muxdiv_cpu.common.hw,
> +	[CLK_MUXDIV_PBUS] = &muxdiv_pbus.common.hw,
> +	[CLK_MUXDIV_MEM_PHY] = &muxdiv_mem_phy.common.hw,
> +	[CLK_MUXDIV_UART] = &muxdiv_uart.common.hw,
> +	[CLK_MUXDIV_ETH_REF] = &muxdiv_eth_ref.common.hw,
> +	[CLK_MUXDIV_ETH_BYP_REF] = &muxdiv_eth_byp_ref.common.hw,
> +	[CLK_MUXDIV_ETH_TSU] = &muxdiv_eth_tsu.common.hw,
> +	[CLK_MUXDIV_GMAC_BYP_REF] = &muxdiv_gmac_byp_ref.common.hw,
> +	[CLK_MUXDIV_M6250_0] = &muxdiv_m6250_0.common.hw,
> +	[CLK_MUXDIV_M6250_1] = &muxdiv_m6250_1.common.hw,
> +	[CLK_MUXDIV_WLAN24_PLF] = &muxdiv_wlan24_plf.common.hw,
> +	[CLK_MUXDIV_WLAN5_PLF] = &muxdiv_wlan5_plf.common.hw,
> +	[CLK_MUXDIV_USBPHY_REF] = &muxdiv_usbphy_ref.common.hw,
> +	[CLK_MUXDIV_TCLK] = &muxdiv_tclk.common.hw,
> +	[CLK_MUXDIV_NPU_PE] = &muxdiv_npu_pe.common.hw,
> +};
> +
> +/*
> + * The MIPS GIC timer runs from the CPU clock and probes from
> + * TIMER_OF_DECLARE() in time_init(), before the platform bus. Register that
> + * clock and the PLLs it may run from early, and the others at probe.
> + */
> +static const unsigned int sf19a2890_early_clks[] __initconst = {
> +	CLK_PLL_CPU,
> +	CLK_PLL_DDR,
> +	CLK_PLL_CMN,
> +	CLK_MUXDIV_CPU,
> +};
> +
> +static struct clk_hw_onecell_data *sf19a2890_clk_data;
> +static void __iomem *sf19a2890_clk_base;
> +
> +static void __init sf19a2890_clk_early_init(struct device_node *node)
> +{
> +	struct clk_hw_onecell_data *data;
> +	void __iomem *base;
> +	unsigned int i;
> +	int ret;
> +
> +	data = kzalloc_flex(*data, hws, CLK_SF19A2890_NR_CLKS);
> +	if (!data)
> +		return;
> +
> +	data->num = CLK_SF19A2890_NR_CLKS;
> +	/* The clocks registered at probe defer until then */
> +	for (i = 0; i < data->num; i++)
> +		data->hws[i] = ERR_PTR(-EPROBE_DEFER);
> +
> +	base = of_iomap(node, 0);
> +	if (!base) {
> +		pr_err("failed to map the registers\n");
> +		goto err_free;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(sf19a2890_early_clks); i++) {
> +		unsigned int id = sf19a2890_early_clks[i];
> +		struct clk_hw *hw = sf19a2890_hws[id];
> +
> +		hw_to_sf_clk_common(hw)->base = base;
> +		ret = of_clk_hw_register(node, hw);
> +		if (ret) {
> +			pr_err("failed to register clock %u: %d\n", id, ret);
> +			goto err_unregister;
> +		}
> +		data->hws[id] = hw;
> +	}
> +
> +	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data);
> +	if (ret) {
> +		pr_err("failed to add the clock provider: %d\n", ret);
> +		goto err_unregister;
> +	}
> +
> +	sf19a2890_clk_data = data;
> +	sf19a2890_clk_base = base;
> +	return;
> +
> +err_unregister:
> +	while (i--)
> +		clk_hw_unregister(data->hws[sf19a2890_early_clks[i]]);
> +	iounmap(base);
> +err_free:
> +	kfree(data);
> +}
> +
> +CLK_OF_DECLARE_DRIVER(sf19a2890_clk, "siflower,sf19a2890-clk", sf19a2890_clk_early_init);
> +
> +static int sf19a2890_clk_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *data = sf19a2890_clk_data;
> +	struct device *dev = &pdev->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!data)
> +		return -ENODEV;
> +
> +	for (i = 0; i < data->num; i++) {
> +		struct clk_hw *hw = sf19a2890_hws[i];
> +
> +		/* Registered early */
> +		if (!IS_ERR(data->hws[i]))
> +			continue;
> +
> +		hw_to_sf_clk_common(hw)->base = sf19a2890_clk_base;
> +		ret = devm_clk_hw_register(dev, hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register clock %u\n", i);
> +	}
> +
> +	/* Hand out the clocks only once they are all registered */
> +	for (i = 0; i < data->num; i++)
> +		data->hws[i] = sf19a2890_hws[i];

Also a follow up from Sashiko: Just register the clocks and let the
framework deal with the orphans. You shouldn't have to delay handing out
the clocks.

Brian

-- 
Brian Masney <masneyb@kernel.org>
