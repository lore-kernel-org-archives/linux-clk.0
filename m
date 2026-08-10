Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799413F8886;
	Mon, 10 Aug 2026 16:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786378983; cv=none; b=Z5aPsR2yK1cP39i+U7wzbjwmO8GuaGFDAnU3IyGMI1x5nu7BdajNXdkhr4XWT7YYZGYlvjuoqw230ozpAIHiygpMT2HXuBolVOZvnd0dHdFn9Z3ffcXTqcIV4NGZrJ4OD32oBpsmZ2zAE+KTtJQGn/ebPVBB2V8/BR2FMSBXbeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786378983; c=relaxed/simple;
	bh=zrTXGkEj15qj+pV7Ht4wXY9bzOU8Xy5LjFBaQi0yqKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5L03LfKO4tboLszM2LBXOsmQdbnPJNtsgM/+LZeXTiO8oCoeVubUOS1HC045/2+jVow6dyBeWhM9qFGCReHcz/cruo8FqdB9qgu+6bfyHEpD+Ghs3l4GVd4O6mYTnPw5lC7nLSD/2N/sk3zg4ZhqczBskcL5eMcGIGtg3qSBjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIWGefKe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIWGefKe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C641F000E9;
	Mon, 10 Aug 2026 16:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786378980;
	bh=lPA0hgjX0+etax1MRVsxDBKxrC7Iewn4gJ1q1ZCNRIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YIWGefKekOjPawLIhUt2RJ1gripSUNZ8WgtZNC2JQ5x7f/Lw3dapn/CGhydytjNWh
	 /yJ6F2ipueVjAZVkHx18bJTdOrhFeQ1BOZLRjOgnkNpMgROHb87oT9dJLkPTAcmAZy
	 y+qu/5wf/JAmU6zhAb/Oo86Fd+bU6nvDb4Q5EJTzDleHu/iKBvm5M5goejE/G9ARSo
	 nIPC5SLLiHJe1T1qKT30JolX8YYIJUJ1MH5FUTiFiRvoCiZzVuJAKvfrcLoaVrBV3X
	 1pRZwZErwK6a9AWjOclM70gRWCF83f2imgqdeh507ShnbQDcetEYOsQFtaeCVJalNZ
	 pe+03yLPYLVzQ==
Date: Mon, 10 Aug 2026 17:22:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/8] clk: starfive: Add system-0 domain PLL clock
 driver
Message-ID: <20260810-dislocate-neurology-f40943216b3e@spud>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-3-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C/huAhpc1duaPjmO"
Content-Disposition: inline
In-Reply-To: <20260809015054.210577-3-changhuang.liang@starfivetech.com>

--C/huAhpc1duaPjmO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 08, 2026 at 06:50:48PM -0700, Changhuang Liang wrote:
> Add system-0 domain PLL clock driver for StarFive JHB100 SoC.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Could you please get either Hal or someone like Xingyu Wu to review
the clock driver changes?

Thanks,
Conor.

> ---
>  drivers/clk/starfive/Kconfig                  |   8 +
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jhb100-pll.c    | 535 ++++++++++++++++++
>  3 files changed, 544 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.c
>=20
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 852464949334..a39dd22112fa 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -117,6 +117,14 @@ config CLK_STARFIVE_JHB100_PER3
>  	  Say yes here to support the peripheral-3 clock controller
>  	  on the StarFive JHB100 SoC.
> =20
> +config CLK_STARFIVE_JHB100_PLL
> +	bool "StarFive JHB100 PLL clock support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	default ARCH_STARFIVE
> +	help
> +	  Say yes here to support the PLL clock controller on the
> +	  StarFive JHB100 SoC.
> +
>  config CLK_STARFIVE_JHB100_SYS0
>  	bool "StarFive JHB100 system-0 clock support"
>  	depends on ARCH_STARFIVE || COMPILE_TEST
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index f00690f0cdad..547a8c170728 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_CLK_STARFIVE_JHB100_PER0)		+=3D clk-starfi=
ve-jhb100-per0.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_PER1)		+=3D clk-starfive-jhb100-per1.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_PER2)		+=3D clk-starfive-jhb100-per2.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_PER3)		+=3D clk-starfive-jhb100-per3.o
> +obj-$(CONFIG_CLK_STARFIVE_JHB100_PLL)		+=3D clk-starfive-jhb100-pll.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+=3D clk-starfive-jhb100-sys0.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+=3D clk-starfive-jhb100-sys1.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+=3D clk-starfive-jhb100-sys2.o
> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk=
/starfive/clk-starfive-jhb100-pll.c
> new file mode 100644
> index 000000000000..55d589bc831e
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> @@ -0,0 +1,535 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JHB100 PLL Clock Generator Driver
> + *
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/math64.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/units.h>
> +
> +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> +
> +/* this driver expects a 25MHz input frequency from the oscillator */
> +#define JHB100_PLL_OSC_RATE		(25 * HZ_PER_MHZ)
> +
> +/* System-0 domain PLL */
> +#define JHB100_PLL2_OFFSET		0x00
> +#define JHB100_PLL3_OFFSET		0x0c
> +#define JHB100_PLL4_OFFSET		0x18
> +#define JHB100_PLL5_OFFSET		0x24
> +
> +#define JHB100_PLL_CFG0_OFFSET		0x0
> +#define JHB100_PLL_CFG1_OFFSET		0x4
> +#define JHB100_PLL_CFG2_OFFSET		0x8
> +
> +#define JHB100_PLLX_CFG0(offset)	((offset) + JHB100_PLL_CFG0_OFFSET)
> +/* fbdiv value should be 16 to 4095 */
> +#define   JHB100_PLL_FBDIV			GENMASK(13, 2)
> +#define   JHB100_PLL_FBDIV_SHIFT		2
> +#define   JHB100_PLL_FOUTPOSTDIV_EN		BIT(14)
> +#define   JHB100_PLL_FOUTPOSTDIV_EN_SHIFT	14
> +#define   JHB100_PLL_FOUTVCOP_EN		BIT(16)
> +#define   JHB100_PLL_FOUTVCOP_EN_SHIFT		16
> +
> +#define JHB100_PLLX_CFG1(offset)	((offset) + JHB100_PLL_CFG1_OFFSET)
> +/* frac value should be decimals multiplied by 2^24 */
> +#define   JHB100_PLL_FRAC			GENMASK(23, 0)
> +#define   JHB100_PLL_FRAC_SHIFT			0
> +#define   JHB100_PLL_LOCK			BIT(24)
> +#define   JHB100_PLL_LOCK_SHIFT			24
> +
> +#define JHB100_PLLX_CFG2(offset)	((offset) + JHB100_PLL_CFG2_OFFSET)
> +#define   JHB100_PLL_PD				BIT(13)
> +#define   JHB100_PLL_PD_SHIFT			13
> +#define   JHB100_PLL_POSTDIV			GENMASK(15, 14)
> +#define   JHB100_PLL_POSTDIV_SHIFT		14
> +#define   JHB100_PLL_REFDIV			GENMASK(23, 18)
> +#define   JHB100_PLL_REFDIV_SHIFT		18
> +
> +#define JHB100_PLL_TIMEOUT_US		1000
> +#define JHB100_PLL_INTERVAL_US		100
> +
> +struct jhb100_pll_preset {
> +	unsigned long freq;
> +	u32 frac;			/* frac value should be decimals multiplied by 2^24 */
> +	unsigned fbdiv		: 12;	/* fbdiv value should be 16 to 4095 */
> +	unsigned refdiv		: 6;
> +	unsigned postdiv	: 2;
> +	unsigned foutpostdiv_en	: 1;
> +	unsigned foutvcop_en	: 1;
> +};
> +
> +struct jhb100_pll_info {
> +	char *name;
> +	const struct jhb100_pll_preset *presets;
> +	unsigned int npresets;
> +	unsigned long flag;
> +	u8 offset;
> +	bool continuous;
> +};
> +
> +#define _JHB100_PLL(_idx, _name, _presets, _npresets, _offset, _flag, _c=
ont)	\
> +	[_idx] =3D {							\
> +		.name =3D _name,						\
> +		.offset =3D _offset,					\
> +		.presets =3D _presets,					\
> +		.npresets =3D _npresets,					\
> +		.flag =3D _flag,						\
> +		.continuous =3D _cont,					\
> +	}
> +
> +#define JHB100_PLL(idx, name, presets, npresets, offset, cont)			\
> +	_JHB100_PLL(idx, name, presets, npresets, offset, 0, cont)
> +
> +struct jhb100_pll_match_data {
> +	const struct jhb100_pll_info *pll_info;
> +	int num_pll;
> +};
> +
> +struct jhb100_pll_data {
> +	struct clk_hw hw;
> +	unsigned int idx;
> +};
> +
> +struct jhb100_pll_priv {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	const struct jhb100_pll_match_data *match_data;
> +	struct jhb100_pll_data pll[];
> +};
> +
> +struct jhb100_pll_regvals {
> +	u32 fbdiv;
> +	u32 frac;
> +	u32 postdiv;
> +	u32 refdiv;
> +	bool foutpostdiv_en;
> +	bool foutvcop_en;
> +};
> +
> +static struct jhb100_pll_data *jhb100_pll_data_from(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct jhb100_pll_data, hw);
> +}
> +
> +static struct jhb100_pll_priv *jhb100_pll_priv_from(struct jhb100_pll_da=
ta *pll)
> +{
> +	return container_of(pll, struct jhb100_pll_priv, pll[pll->idx]);
> +}
> +
> +static int jhb100_pll_prepare(struct clk_hw *hw)
> +{
> +	struct jhb100_pll_data *pll =3D jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv =3D jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info =3D &priv->match_data->pll_info[pll-=
>idx];
> +
> +	return regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> +				  JHB100_PLL_PD, 0);
> +}
> +
> +static void jhb100_pll_unprepare(struct clk_hw *hw)
> +{
> +	struct jhb100_pll_data *pll =3D jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv =3D jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info =3D &priv->match_data->pll_info[pll-=
>idx];
> +
> +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> +			   JHB100_PLL_PD, BIT(JHB100_PLL_PD_SHIFT));
> +}
> +
> +static int jhb100_pll_is_prepared(struct clk_hw *hw)
> +{
> +	struct jhb100_pll_data *pll =3D jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv =3D jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info =3D &priv->match_data->pll_info[pll-=
>idx];
> +	u32 val;
> +	int ret;
> +
> +	ret =3D regmap_read(priv->regmap, JHB100_PLLX_CFG2(info->offset), &val);
> +	if (ret)
> +		return ret;
> +
> +	return !(val & JHB100_PLL_PD);
> +}
> +
> +static int jhb100_pll_regvals_get(struct regmap *regmap,
> +				  const struct jhb100_pll_info *info,
> +				  struct jhb100_pll_regvals *val)
> +{
> +	u32 value;
> +	int ret;
> +
> +	ret =3D regmap_read(regmap, JHB100_PLLX_CFG0(info->offset), &value);
> +	if (ret)
> +		return ret;
> +
> +	val->fbdiv =3D (value & JHB100_PLL_FBDIV) >> JHB100_PLL_FBDIV_SHIFT;
> +	val->foutpostdiv_en =3D !!((value & JHB100_PLL_FOUTPOSTDIV_EN) >>
> +				 JHB100_PLL_FOUTPOSTDIV_EN_SHIFT);
> +	val->foutvcop_en =3D !!((value & JHB100_PLL_FOUTVCOP_EN) >>
> +			      JHB100_PLL_FOUTVCOP_EN_SHIFT);
> +
> +	ret =3D regmap_read(regmap, JHB100_PLLX_CFG1(info->offset), &value);
> +	if (ret)
> +		return ret;
> +
> +	val->frac =3D (value & JHB100_PLL_FRAC) >> JHB100_PLL_FRAC_SHIFT;
> +
> +	ret =3D regmap_read(regmap, JHB100_PLLX_CFG2(info->offset), &value);
> +	if (ret)
> +		return ret;
> +
> +	val->postdiv =3D (value & JHB100_PLL_POSTDIV) >> JHB100_PLL_POSTDIV_SHI=
FT;
> +	val->refdiv =3D (value & JHB100_PLL_REFDIV) >> JHB100_PLL_REFDIV_SHIFT;
> +
> +	return 0;
> +}
> +
> +static unsigned long jhb100_pll_recalc_rate(struct clk_hw *hw, unsigned =
long parent_rate)
> +{
> +	struct jhb100_pll_data *pll =3D jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv =3D jhb100_pll_priv_from(pll);
> +	struct jhb100_pll_regvals val;
> +	u32 power =3D 0;
> +	u64 rate;
> +	int ret;
> +
> +	ret =3D jhb100_pll_regvals_get(priv->regmap, &priv->match_data->pll_inf=
o[pll->idx], &val);
> +	if (ret)
> +		return 0;
> +
> +	/*
> +	 *
> +	 * if (foutvcop_en)
> +	 *      rate =3D parent * (fbdiv + frac / 2^24) / refdiv
> +	 *
> +	 * if (foutpostdiv_en)
> +	 *      rate =3D parent * (fbdiv + frac / 2^24) / refdiv / 2^(postdiv +=
 1)
> +	 *
> +	 * parent * (fbdiv + frac / 2^24) =3D parent * fbdiv + parent * frac / =
2^24
> +	 */
> +
> +	if (!!val.foutvcop_en =3D=3D !!val.foutpostdiv_en || !val.refdiv)
> +		return 0;
> +
> +	rate =3D mul_u32_u32(parent_rate, val.frac) >> 24;
> +
> +	if (val.foutpostdiv_en)
> +		power =3D val.postdiv + 1;
> +
> +	rate +=3D mul_u32_u32(parent_rate, val.fbdiv);
> +	rate =3D div_u64(rate, (u64)val.refdiv << power);
> +
> +	return rate;
> +}
> +
> +static int jhb100_pll_determine_rate(struct clk_hw *hw, struct clk_rate_=
request *req)
> +{
> +	struct jhb100_pll_data *pll =3D jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv =3D jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info =3D &priv->match_data->pll_info[pll-=
>idx];
> +	const struct jhb100_pll_preset *selected =3D &info->presets[0];
> +	unsigned int idx;
> +
> +	/* if the parent rate doesn't match our expectations the presets won't =
work */
> +	if (req->best_parent_rate !=3D JHB100_PLL_OSC_RATE) {
> +		req->rate =3D jhb100_pll_recalc_rate(hw, req->best_parent_rate);
> +		return 0;
> +	}
> +
> +	/* continuous means support any rate */
> +	if (info->continuous)
> +		return 0;
> +
> +	/* find highest rate lower or equal to the requested rate */
> +	for (idx =3D 1; idx < info->npresets; idx++) {
> +		const struct jhb100_pll_preset *val =3D &info->presets[idx];
> +
> +		if (req->rate < val->freq)
> +			break;
> +
> +		selected =3D val;
> +	}
> +
> +	req->rate =3D selected->freq;
> +
> +	return 0;
> +}
> +
> +static int jhb100_pll_set_preset(struct clk_hw *hw, const struct jhb100_=
pll_preset *val)
> +{
> +	struct jhb100_pll_data *pll =3D jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv =3D jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info =3D &priv->match_data->pll_info[pll-=
>idx];
> +	unsigned int value, cfg;
> +	int ret;
> +
> +	cfg =3D ((u32)val->fbdiv << JHB100_PLL_FBDIV_SHIFT) |
> +	      ((u32)val->foutpostdiv_en << JHB100_PLL_FOUTPOSTDIV_EN_SHIFT) |
> +	      ((u32)val->foutvcop_en << JHB100_PLL_FOUTVCOP_EN_SHIFT);
> +
> +	ret =3D regmap_update_bits(priv->regmap, JHB100_PLLX_CFG0(info->offset),
> +				 JHB100_PLL_FBDIV | JHB100_PLL_FOUTPOSTDIV_EN |
> +				 JHB100_PLL_FOUTVCOP_EN, cfg);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(priv->regmap, JHB100_PLLX_CFG1(info->offset)=
, JHB100_PLL_FRAC,
> +				 val->frac << JHB100_PLL_FRAC_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	cfg =3D ((u32)val->refdiv << JHB100_PLL_REFDIV_SHIFT) |
> +	      ((u32)val->postdiv << JHB100_PLL_POSTDIV_SHIFT);
> +
> +	ret =3D regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> +				 JHB100_PLL_REFDIV | JHB100_PLL_POSTDIV, cfg);
> +	if (ret)
> +		return ret;
> +
> +	/* waiting for PLL to lock */
> +	return regmap_read_poll_timeout(priv->regmap, JHB100_PLLX_CFG1(info->of=
fset),
> +					value, value & JHB100_PLL_LOCK,
> +					JHB100_PLL_INTERVAL_US,
> +					JHB100_PLL_TIMEOUT_US);
> +}
> +
> +static int jhb100_pll_rate_to_preset(struct clk_hw *hw, unsigned long ra=
te,
> +				     unsigned long parent_rate)
> +{
> +	struct jhb100_pll_preset val =3D {
> +		.refdiv =3D 1,
> +		.postdiv =3D 3,
> +		.foutpostdiv_en =3D 1,
> +		.foutvcop_en =3D 0,
> +	};
> +	unsigned int power =3D 0;
> +	u64 fbdiv_24, t;
> +	u32 fbdiv;
> +
> +	if (val.foutpostdiv_en)
> +		power =3D val.postdiv + 1;
> +
> +	t =3D (u64)val.refdiv << power;
> +	t *=3D rate;
> +
> +	fbdiv =3D div64_ul(t, parent_rate);
> +	if (fbdiv < 16 || fbdiv > 4095)
> +		return -EINVAL;
> +	val.fbdiv =3D fbdiv;
> +
> +	fbdiv_24 =3D div64_ul(t << 24, parent_rate);
> +	val.frac =3D fbdiv_24 - ((u64)fbdiv << 24);
> +
> +	return jhb100_pll_set_preset(hw, &val);
> +}
> +
> +static int jhb100_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			       unsigned long parent_rate)
> +{
> +	struct jhb100_pll_data *pll =3D jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv =3D jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info =3D &priv->match_data->pll_info[pll-=
>idx];
> +	const struct jhb100_pll_preset *val;
> +	unsigned int idx;
> +
> +	/* if the parent rate doesn't match our expectations the presets won't =
work */
> +	if (parent_rate !=3D JHB100_PLL_OSC_RATE)
> +		return -EINVAL;
> +
> +	if (info->continuous)
> +		return jhb100_pll_rate_to_preset(hw, rate, parent_rate);
> +
> +	for (idx =3D 0, val =3D &info->presets[0]; idx < info->npresets; idx++,=
 val++) {
> +		if (val->freq =3D=3D rate)
> +			return jhb100_pll_set_preset(hw, val);
> +	}
> +	return -EINVAL;
> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +static int jhb100_pll_registers_read(struct seq_file *s, void *unused)
> +{
> +	struct jhb100_pll_data *pll =3D s->private;
> +	struct jhb100_pll_priv *priv =3D jhb100_pll_priv_from(pll);
> +	struct jhb100_pll_regvals val;
> +	int ret;
> +
> +	ret =3D jhb100_pll_regvals_get(priv->regmap, &priv->match_data->pll_inf=
o[pll->idx], &val);
> +	if (ret)
> +		return ret;
> +
> +	seq_printf(s, "fbdiv=3D%u\n"
> +		      "frac=3D%u\n"
> +		      "refdiv=3D%u\n"
> +		      "postdiv=3D%u\n"
> +		      "foutpostdiv_en=3D%u\n"
> +		      "foutvcop_en=3D%u\n",
> +		      val.fbdiv, val.frac, val.refdiv, val.postdiv,
> +		      val.foutpostdiv_en, val.foutvcop_en);
> +
> +	return 0;
> +}
> +
> +static int jhb100_pll_registers_open(struct inode *inode, struct file *f)
> +{
> +	return single_open(f, jhb100_pll_registers_read, inode->i_private);
> +}
> +
> +static const struct file_operations jhb100_pll_registers_ops =3D {
> +	.owner =3D THIS_MODULE,
> +	.open =3D jhb100_pll_registers_open,
> +	.release =3D single_release,
> +	.read =3D seq_read,
> +	.llseek =3D seq_lseek
> +};
> +
> +static void jhb100_pll_debug_init(struct clk_hw *hw, struct dentry *dent=
ry)
> +{
> +	struct jhb100_pll_data *pll =3D jhb100_pll_data_from(hw);
> +
> +	debugfs_create_file("registers", 0400, dentry, pll,
> +			    &jhb100_pll_registers_ops);
> +}
> +#else
> +#define jhb100_pll_debug_init NULL
> +#endif
> +
> +static const struct clk_ops jhb100_pll_ops =3D {
> +	.prepare =3D jhb100_pll_prepare,
> +	.unprepare =3D jhb100_pll_unprepare,
> +	.is_prepared =3D jhb100_pll_is_prepared,
> +	.recalc_rate =3D jhb100_pll_recalc_rate,
> +	.determine_rate =3D jhb100_pll_determine_rate,
> +	.set_rate =3D jhb100_pll_set_rate,
> +	.debug_init =3D jhb100_pll_debug_init,
> +};
> +
> +static struct clk_hw *jhb100_pll_get(struct of_phandle_args *clkspec, vo=
id *data)
> +{
> +	struct jhb100_pll_priv *priv =3D data;
> +	unsigned int idx =3D clkspec->args[0];
> +
> +	if (idx < priv->match_data->num_pll)
> +		return &priv->pll[idx].hw;
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static int jhb100_pll_probe(struct platform_device *pdev)
> +{
> +	const struct jhb100_pll_match_data *match_data;
> +	struct jhb100_pll_priv *priv;
> +	unsigned int idx;
> +	int ret;
> +
> +	match_data =3D of_device_get_match_data(&pdev->dev);
> +	if (!match_data)
> +		return -EINVAL;
> +
> +	priv =3D devm_kzalloc(&pdev->dev,
> +			    struct_size(priv, pll, match_data->num_pll),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->match_data =3D match_data;
> +	priv->dev =3D &pdev->dev;
> +	priv->regmap =3D syscon_node_to_regmap(priv->dev->of_node);
> +	if (IS_ERR(priv->regmap))
> +		return PTR_ERR(priv->regmap);
> +
> +	for (idx =3D 0; idx < match_data->num_pll; idx++) {
> +		struct clk_parent_data parents =3D {
> +			.index =3D 0,
> +		};
> +		struct clk_init_data init =3D {
> +			.name =3D match_data->pll_info[idx].name,
> +			.ops =3D &jhb100_pll_ops,
> +			.parent_data =3D &parents,
> +			.num_parents =3D 1,
> +			.flags =3D match_data->pll_info[idx].flag,
> +		};
> +		struct jhb100_pll_data *pll =3D &priv->pll[idx];
> +
> +		pll->hw.init =3D &init;
> +		pll->idx =3D idx;
> +
> +		ret =3D devm_clk_hw_register(&pdev->dev, &pll->hw);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return devm_of_clk_add_hw_provider(&pdev->dev, jhb100_pll_get, priv);
> +}
> +
> +static const struct jhb100_pll_preset jhb100_pll2_presets[] =3D {
> +	{
> +		.freq =3D 903168000,
> +		.fbdiv =3D 72,
> +		.frac =3D 4252017,
> +		.refdiv =3D 1,
> +		.postdiv =3D 0,
> +		.foutpostdiv_en =3D 1,
> +		.foutvcop_en =3D 0,
> +	},
> +};
> +
> +static const struct jhb100_pll_preset jhb100_pll3_presets[] =3D {
> +	{
> +		.freq =3D 800000000,
> +		.fbdiv =3D 64,
> +		.frac =3D 0,
> +		.refdiv =3D 1,
> +		.postdiv =3D 0,
> +		.foutpostdiv_en =3D 1,
> +		.foutvcop_en =3D 0,
> +	},
> +};
> +
> +static const struct jhb100_pll_info jhb100_sys0_pll_info[] =3D {
> +	JHB100_PLL(JHB100_SYS0PLL_PLL2_OUT, "pll2_out", jhb100_pll2_presets,
> +		   ARRAY_SIZE(jhb100_pll2_presets), JHB100_PLL2_OFFSET, false),
> +	_JHB100_PLL(JHB100_SYS0PLL_PLL3_OUT, "pll3_out", jhb100_pll3_presets,
> +		    ARRAY_SIZE(jhb100_pll3_presets), JHB100_PLL3_OFFSET,
> +		    CLK_IS_CRITICAL, false),
> +	_JHB100_PLL(JHB100_SYS0PLL_PLL4_OUT, "pll4_out", NULL, 0,
> +		    JHB100_PLL4_OFFSET, CLK_IGNORE_UNUSED, true),
> +	_JHB100_PLL(JHB100_SYS0PLL_PLL5_OUT, "pll5_out", NULL, 0,
> +		    JHB100_PLL5_OFFSET, CLK_IGNORE_UNUSED, true),
> +};
> +
> +static const struct jhb100_pll_match_data jhb100_sys0_pll =3D {
> +	.pll_info =3D jhb100_sys0_pll_info,
> +	.num_pll =3D ARRAY_SIZE(jhb100_sys0_pll_info),
> +};
> +
> +static const struct of_device_id jhb100_pll_match[] =3D {
> +	{
> +		.compatible =3D "starfive,jhb100-sys0-syscon",
> +		.data =3D &jhb100_sys0_pll,
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, jhb100_pll_match);
> +
> +static struct platform_driver jhb100_pll_driver =3D {
> +	.probe =3D jhb100_pll_probe,
> +	.driver =3D {
> +		.name =3D "clk-starfive-jhb100-pll",
> +		.of_match_table =3D jhb100_pll_match,
> +		.suppress_bind_attrs =3D true,
> +	},
> +};
> +builtin_platform_driver(jhb100_pll_driver);
> --=20
> 2.25.1
>=20

--C/huAhpc1duaPjmO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCann63gAKCRB4tDGHoIJi
0psJAP9oERyDkEPantSePVJoTWk/e2+t8NtkRVGb5jaGoI4RRQD/Ve+c3wSPxXOt
ZbvHushHSn/HLnwgQaWqxNjFfDE6ZAc=
=RG+0
-----END PGP SIGNATURE-----

--C/huAhpc1duaPjmO--
