Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F6B3C3F51
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758605; cv=none; b=G5wzdw6vfcozUyK2Uny2l7/6cRlbayD/Xtrdt1vi2xBEKVICx5yf7J4JPIVladIBIjMUZgno+3ERtidy3RZEWhdI59z7seQbq4jqp9jBmtUC4zRMHoLl82gu7LuY4JpRilQjTnfbb7rcrr6eOgZ1+7WJj8XT23kj+A70wIF3twg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758605; c=relaxed/simple;
	bh=oAk9CTHOeEEgac07xVr7ONG4c89i0VcXBB26FcNwNAk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=GOwcGAKYbEdCJeeArL1Z+zpkp4bsP1sLcYe42Fx6kvdHXMJHNEirhTnftj/HmLetAYTqfFfJofi8feoFoFf8HOak//dwSmO8f3Sp34h0FLbHLHg/yujC7G3xj8b1SBoRbpdlTzk9nO1MZXqfjLWO1SrgbZQgmDxK3I61aHNgx7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LaiRlkaZ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LaiRlkaZ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so3174443f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 01:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790758596; x=1791363396; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KB63AmDfCzUIzXvzx7Y0obbjfVyZCi8GFe+cdX17Bpc=;
        b=LaiRlkaZSn8qZlWGc95pYo1CJy3eBH6SAUDMyDeZF1vG+fl16mVgbmL/wc9FvRTDTq
         4pvv1tLzAdsefcP+FoYRwvIZKE1RxwMkKWlFbKp6VtIark/hd42RS6Ne0au3SMgWlg5C
         BfZG0LccmF4pE4LdRKpBJS3E7qE2fm01SfyhxezQQ1BdM1YcYCqDXVwEAK1dj8ni6QjF
         D9mU64NWfzP0/35YDQAcozpP3+QAIrSdTqz9G8uT/dLvRRXlqUs/ofdM2Pw3SFHxYZrt
         NedEE11nhF6KeeFwNZL1GRwhCkuw94mUQsrfW96hjnsxdH25gpc7zEww4HtGL3No74GW
         Ipfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758596; x=1791363396;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KB63AmDfCzUIzXvzx7Y0obbjfVyZCi8GFe+cdX17Bpc=;
        b=AJfxZEZTfD2RzFhHreOE+ueod/MmzxSisZMAcFAlCBRZwfjFY34+EEM1doiXyJfBC8
         y7J7GjBHisKwNrxtvR83Auwxcctj9hCDaN+mQx+lHUipR5Ps2NcRlssX3xU8xa+aGm5J
         obH7QaQzeuWdULA58aiSS82W2zaw+VQ/5277IOT1aC/ozvbWHkZE/sRvAaT7Dw9VxGnE
         t0r9RzQBiC6IX5mMy3mtlh4rfNUaMMGAYxY1gvKlA3aRAouy0tu1Qqj7IEwjYX5It/hu
         x+uvJ629ykd7cabnsKuKOTxknF9fx8WqfswIL8ozwTnK4P5FjIh989zDNkjV+hpZtRQA
         jqnw==
X-Forwarded-Encrypted: i=1; AKwUvBxJ4EvFq1J5j3Z5RruczZnlhHvWdyy4ns6iTryyV7ZtiLj4V7E/PqzG7ig9w5lDRolDX3f0cQgYM84=@vger.kernel.org
X-Gm-Message-State: AFuF++nTsHrlaiEjkJAMo8mcPdsXD/cHAiO0QhZklMuEwTjB43vMloln
	HLGdgMnOg/WUKPbccx0gI/2DdcKeTOamXi/tYlEVmPN7rQgcQiTJfGZSSTDDPwEjY4c=
X-Gm-Gg: AYBFou15vPALB60I0UR7A45vRR9T2YbnPRCNNJiQ+VV0Kgjq7Ii0jMDapBMVwaclXK/
	Y1O4I72oLqXQhpeG+9DbRuVYOtjPbFfwjfMjbIXSXP55GTkgxLIHoo6Ko+DsKS50QBS3S3xou8i
	868M7NNGXDvdtYG8dfA081IbPuXU7rM3VuAB9lzhzh8ugTU7Wvmmab2vobKCHZdGtPlUza2CaV+
	MFKjqfrMzAZTPhMxtpx8vuCLDnDDlxbFH05fUntSRq+xqUtcovX0eLy6XWhPmN31cqexAjZfMAR
	83ogxnZFzbXK6PCQHj9Nx3QHqFjeSobKB46n7FA52thuv+tyav6om6YAMYIipeWa2NBztUwdp3j
	oZhasnOj6pxf0CvGEBECs7DNW01B901wX9dsa2E+6M1OuWysBIKpzycVdTebG7ztUlo2l1QQPpn
	Gc/e0fpSLgTP5C4zsR5kbveFOrtk8SVN+evlMjrt9p5uqJd/2Y/zSFUiJj2WaFkbti6yo69FVoS
	yPAAbvJvqm8wTOXEQ==
X-Received: by 2002:a05:600c:3145:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-4a01b0072cfmr11716995e9.34.1790758596318;
        Wed, 30 Sep 2026 01:56:36 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a017b7337bsm22084495e9.3.2026.09.30.01.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:56:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 2/8] clk: starfive: Add system-0 domain PLL clock
 driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Alexey Charkov <alchark@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20260828095608.19955-3-changhuang.liang@starfivetech.com>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
 <20260828095608.19955-3-changhuang.liang@starfivetech.com>
Date: Wed, 30 Sep 2026 10:56:34 +0200
Message-Id: <179075859479.1471718.5492634704694937513.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=20132; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=oAk9CTHOeEEgac07xVr7ONG4c89i0VcXBB26FcNwNAk=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl7zh0uD9ILEv+2qWJ/WauC68Gcv59nLSmxzClJmZvRs
 PbSwS6ejlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkRSrDP9WKvjuCi4/Nk6th
 jWARie2SPCsiwjDHpy/19fxbF0qPsDP8d7m9/sJZpiu1vAoTjFi/3vCOaZoWs6d6x3aPefGxX58
 xMQAA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-08-28 02:56 -0700, Changhuang Liang wrote:
> Add system-0 domain PLL clock driver for StarFive JHB100 SoC.
> 
> This driver is instantiated either as an MFD cell of the sys0 system
> controller (added in a later patch) or by matching the per0/per1 syscon
> nodes directly.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  10 +
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jhb100-pll.c    | 524 ++++++++++++++++++
>  3 files changed, 535 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.c
> 
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 852464949334..2603d054173f 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -117,6 +117,16 @@ config CLK_STARFIVE_JHB100_PER3
>  	  Say yes here to support the peripheral-3 clock controller
>  	  on the StarFive JHB100 SoC.
>  
> +config CLK_STARFIVE_JHB100_PLL
> +	bool "StarFive JHB100 PLL clock support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select STARFIVE_JHB100_SOCINFO
> +	select MFD_SYSCON
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
> @@ -15,6 +15,7 @@ obj-$(CONFIG_CLK_STARFIVE_JHB100_PER0)		+= clk-starfive-jhb100-per0.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_PER1)		+= clk-starfive-jhb100-per1.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_PER2)		+= clk-starfive-jhb100-per2.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_PER3)		+= clk-starfive-jhb100-per3.o
> +obj-$(CONFIG_CLK_STARFIVE_JHB100_PLL)		+= clk-starfive-jhb100-pll.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+= clk-starfive-jhb100-sys2.o
> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> new file mode 100644
> index 000000000000..e23365164497
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> @@ -0,0 +1,524 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JHB100 PLL Clock Generator Driver
> + *
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + */
> +
> +#include <linux/bitfield.h>
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
> +#define   JHB100_PLL_FOUTPOSTDIV_EN		BIT(14)
> +#define   JHB100_PLL_FOUTVCOP_EN		BIT(16)
> +
> +#define JHB100_PLLX_CFG1(offset)	((offset) + JHB100_PLL_CFG1_OFFSET)
> +/* frac value should be decimals multiplied by 2^24 */
> +#define   JHB100_PLL_FRAC			GENMASK(23, 0)
> +#define   JHB100_PLL_LOCK			BIT(24)
> +
> +#define JHB100_PLLX_CFG2(offset)	((offset) + JHB100_PLL_CFG2_OFFSET)
> +#define   JHB100_PLL_PD				BIT(13)
> +#define   JHB100_PLL_POSTDIV			GENMASK(15, 14)
> +#define   JHB100_PLL_REFDIV			GENMASK(23, 18)
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
> +	const char *name;
> +	const struct jhb100_pll_preset *presets;
> +	unsigned int npresets;
> +	unsigned long flags;
> +	u8 offset;
> +	bool continuous;
> +};
> +
> +#define _JHB100_PLL(_idx, _name, _presets, _npresets, _offset, _flags, _cont)	\
> +	[_idx] = {							\
> +		.name = _name,						\
> +		.offset = _offset,					\
> +		.presets = _presets,					\
> +		.npresets = _npresets,					\
> +		.flags = _flags,					\
> +		.continuous = _cont,					\
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
> +static struct jhb100_pll_priv *jhb100_pll_priv_from(struct jhb100_pll_data *pll)
> +{
> +	return container_of(pll, struct jhb100_pll_priv, pll[pll->idx]);
> +}
> +
> +static int jhb100_pll_prepare(struct clk_hw *hw)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
> +
> +	return regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> +				  JHB100_PLL_PD, 0);
> +}
> +
> +static void jhb100_pll_unprepare(struct clk_hw *hw)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
> +
> +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> +			   JHB100_PLL_PD, JHB100_PLL_PD);
> +}
> +
> +static int jhb100_pll_is_prepared(struct clk_hw *hw)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(priv->regmap, JHB100_PLLX_CFG2(info->offset), &val);
> +	if (ret)
> +		return ret;
> +
> +	return !(val & JHB100_PLL_PD);
> +}

Why are you using prepere_ ? Are you register access on a slow bus like i2c ?

> +
> +static int jhb100_pll_regvals_get(struct regmap *regmap,
> +				  const struct jhb100_pll_info *info,
> +				  struct jhb100_pll_regvals *val)
> +{
> +	u32 value;
> +	int ret;
> +
> +	ret = regmap_read(regmap, JHB100_PLLX_CFG0(info->offset), &value);
> +	if (ret)
> +		return ret;
> +
> +	val->fbdiv = FIELD_GET(JHB100_PLL_FBDIV, value);
> +	val->foutpostdiv_en = !!FIELD_GET(JHB100_PLL_FOUTPOSTDIV_EN, value);
> +	val->foutvcop_en = !!FIELD_GET(JHB100_PLL_FOUTVCOP_EN, value);
> +
> +	ret = regmap_read(regmap, JHB100_PLLX_CFG1(info->offset), &value);
> +	if (ret)
> +		return ret;
> +
> +	val->frac = FIELD_GET(JHB100_PLL_FRAC, value);
> +
> +	ret = regmap_read(regmap, JHB100_PLLX_CFG2(info->offset), &value);
> +	if (ret)
> +		return ret;
> +
> +	val->postdiv = FIELD_GET(JHB100_PLL_POSTDIV, value);
> +	val->refdiv = FIELD_GET(JHB100_PLL_REFDIV, value);
> +
> +	return 0;
> +}

Looks like a bit of churn to me ? Can you just read the field when you need them

> +
> +static unsigned long jhb100_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	struct jhb100_pll_regvals val;
> +	u32 power = 0;
> +	u64 rate;
> +	int ret;
> +
> +	ret = jhb100_pll_regvals_get(priv->regmap, &priv->match_data->pll_info[pll->idx], &val);
> +	if (ret)
> +		return 0;
> +
> +	/*
> +	 *
> +	 * if (foutvcop_en)
> +	 *      rate = parent * (fbdiv + frac / 2^24) / refdiv
> +	 *
> +	 * if (foutpostdiv_en)
> +	 *      rate = parent * (fbdiv + frac / 2^24) / refdiv / 2^(postdiv + 1)
> +	 *
> +	 * parent * (fbdiv + frac / 2^24) = parent * fbdiv + parent * frac / 2^24

This show the overcomplexity you've put in this driver by mixing toghether the PLL with the 2 skip-able post dividre
You could simply decribe the topology.
* 1 PLL
* 2 Post-divider and 2 muxes to skip them.

CCF already provide the helper for those.

> +	 */
> +
> +	if (!!val.foutvcop_en == !!val.foutpostdiv_en || !val.refdiv)
> +		return 0;
> +
> +	rate = mul_u32_u32(parent_rate, val.frac) >> 24;
> +
> +	if (val.foutpostdiv_en)
> +		power = val.postdiv + 1;
> +
> +	rate += mul_u32_u32(parent_rate, val.fbdiv);
> +	rate = div_u64(rate, (u64)val.refdiv << power);
> +
> +	return rate;
> +}
> +
> +static int jhb100_pll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
> +	const struct jhb100_pll_preset *selected = &info->presets[0];
> +	unsigned int idx;
> +
> +	/* if the parent rate doesn't match our expectations the presets won't work */
> +	if (req->best_parent_rate != JHB100_PLL_OSC_RATE) {
> +		req->rate = jhb100_pll_recalc_rate(hw, req->best_parent_rate);
> +		return 0;

Yet you still return a rate. Are you preset, which presumably describe some constraints
for fractional multiplier properly described ?

Add just below you do not care for the preset ...

> +	}
> +
> +	/* continuous means support any rate */
> +	if (info->continuous)
> +		return 0;

??

I somehow doubt that you support everything down to the 1 Hz. You still must determine
what you will provide.

> +
> +	/* find highest rate lower or equal to the requested rate */
> +	for (idx = 1; idx < info->npresets; idx++) {
> +		const struct jhb100_pll_preset *val = &info->presets[idx];
> +
> +		if (req->rate < val->freq)
> +			break;
> +
> +		selected = val;
> +	}
> +
> +	req->rate = selected->freq;

Instead of storing plain rate in your preset table, you could just store the multiplier you
support and let reclac_rate do the job

> +
> +	return 0;
> +}
> +
> +static int jhb100_pll_set_preset(struct clk_hw *hw, const struct jhb100_pll_preset *val)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
> +	unsigned int value, cfg;
> +	int ret;
> +
> +	cfg = FIELD_PREP(JHB100_PLL_FBDIV, (u32)val->fbdiv) |
> +	      FIELD_PREP(JHB100_PLL_FOUTPOSTDIV_EN, (u32)val->foutpostdiv_en) |
> +	      FIELD_PREP(JHB100_PLL_FOUTVCOP_EN, (u32)val->foutvcop_en);
> +
> +	ret = regmap_update_bits(priv->regmap, JHB100_PLLX_CFG0(info->offset),
> +				 JHB100_PLL_FBDIV | JHB100_PLL_FOUTPOSTDIV_EN |
> +				 JHB100_PLL_FOUTVCOP_EN, cfg);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(priv->regmap, JHB100_PLLX_CFG1(info->offset), JHB100_PLL_FRAC,
> +				 FIELD_PREP(JHB100_PLL_FRAC, val->frac));
> +	if (ret)
> +		return ret;
> +
> +	cfg = FIELD_PREP(JHB100_PLL_REFDIV, (u32)val->refdiv) |
> +	      FIELD_PREP(JHB100_PLL_POSTDIV, (u32)val->postdiv);
> +
> +	ret = regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> +				 JHB100_PLL_REFDIV | JHB100_PLL_POSTDIV, cfg);
> +	if (ret)
> +		return ret;
> +
> +	/* waiting for PLL to lock */
> +	return regmap_read_poll_timeout(priv->regmap, JHB100_PLLX_CFG1(info->offset),
> +					value, value & JHB100_PLL_LOCK,
> +					JHB100_PLL_INTERVAL_US,
> +					JHB100_PLL_TIMEOUT_US);
> +}
> +
> +static int jhb100_pll_rate_to_preset(struct clk_hw *hw, unsigned long rate,
> +				     unsigned long parent_rate)
> +{
> +	struct jhb100_pll_preset val = {
> +		.refdiv = 1,
> +		.postdiv = 3,
> +		.foutpostdiv_en = 1,
> +		.foutvcop_en = 0,
> +	};
> +	unsigned int power = 0;
> +	u64 fbdiv_24, t;
> +	u32 fbdiv;
> +
> +	if (val.foutpostdiv_en)
> +		power = val.postdiv + 1;
> +
> +	t = (u64)val.refdiv << power;
> +	t *= rate;
> +
> +	fbdiv = div64_ul(t, parent_rate);
> +	if (fbdiv < 16 || fbdiv > 4095)
> +		return -EINVAL;
> +	val.fbdiv = fbdiv;
> +
> +	fbdiv_24 = div64_ul(t << 24, parent_rate);
> +	val.frac = fbdiv_24 - ((u64)fbdiv << 24);
> +
> +	return jhb100_pll_set_preset(hw, &val);
> +}
> +
> +static int jhb100_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			       unsigned long parent_rate)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
> +	const struct jhb100_pll_preset *val;
> +	unsigned int idx;
> +
> +	/* if the parent rate doesn't match our expectations the presets won't work */
> +	if (parent_rate != JHB100_PLL_OSC_RATE)
> +		return -EINVAL;
> +
> +	if (info->continuous)
> +		return jhb100_pll_rate_to_preset(hw, rate, parent_rate);
> +
> +	for (idx = 0, val = &info->presets[0]; idx < info->npresets; idx++, val++) {
> +		if (val->freq == rate)
> +			return jhb100_pll_set_preset(hw, val);
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +static int jhb100_pll_registers_show(struct seq_file *s, void *unused)
> +{
> +	struct jhb100_pll_data *pll = s->private;
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	struct jhb100_pll_regvals val;
> +	int ret;
> +
> +	ret = jhb100_pll_regvals_get(priv->regmap, &priv->match_data->pll_info[pll->idx], &val);
> +	if (ret)
> +		return ret;
> +
> +	seq_printf(s, "fbdiv=%u\n"
> +		      "frac=%u\n"
> +		      "refdiv=%u\n"
> +		      "postdiv=%u\n"
> +		      "foutpostdiv_en=%u\n"
> +		      "foutvcop_en=%u\n",
> +		      val.fbdiv, val.frac, val.refdiv, val.postdiv,
> +		      val.foutpostdiv_en, val.foutvcop_en);
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(jhb100_pll_registers);
> +
> +static void jhb100_pll_debug_init(struct clk_hw *hw, struct dentry *dentry)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +
> +	debugfs_create_file("registers", 0400, dentry, pll,
> +			    &jhb100_pll_registers_fops);
> +}

regmap already provided a way to see the register through debugfs.
This debugfs whole debugfs section can go away

> +#else
> +#define jhb100_pll_debug_init NULL
> +#endif
> +
> +static const struct clk_ops jhb100_pll_ops = {
> +	.prepare = jhb100_pll_prepare,
> +	.unprepare = jhb100_pll_unprepare,
> +	.is_prepared = jhb100_pll_is_prepared,
> +	.recalc_rate = jhb100_pll_recalc_rate,
> +	.determine_rate = jhb100_pll_determine_rate,
> +	.set_rate = jhb100_pll_set_rate,
> +	.debug_init = jhb100_pll_debug_init,
> +};
> +
> +static struct clk_hw *jhb100_pll_get(struct of_phandle_args *clkspec, void *data)
> +{
> +	struct jhb100_pll_priv *priv = data;
> +	unsigned int idx = clkspec->args[0];
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
> +	const struct platform_device_id *id;
> +	struct device *dev = &pdev->dev;
> +	struct jhb100_pll_priv *priv;
> +	struct device_node *np;
> +	unsigned int idx;
> +	int ret;
> +
> +	id = platform_get_device_id(pdev);
> +	if (!id)
> +		return dev_err_probe(dev, -EINVAL, "no match data\n");
> +
> +	/*
> +	 * Instantiated as an MFD cell of the sys0 system controller,
> +	 * which owns the DT node describing the PLL registers.
> +	 */
> +	match_data = (const struct jhb100_pll_match_data *)id->driver_data;
> +	np = dev_of_node(dev->parent);
> +
> +	priv = devm_kzalloc(&pdev->dev, struct_size(priv, pll, match_data->num_pll),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->match_data = match_data;
> +	priv->regmap = syscon_node_to_regmap(np);
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "failed to get syscon regmap\n");
> +
> +	for (idx = 0; idx < match_data->num_pll; idx++) {
> +		struct clk_parent_data parents = {
> +			.index = 0,
> +		};
> +		struct clk_init_data init = {
> +			.name = match_data->pll_info[idx].name,
> +			.ops = &jhb100_pll_ops,
> +			.parent_data = &parents,
> +			.num_parents = 1,
> +			.flags = match_data->pll_info[idx].flags,
> +		};
> +		struct jhb100_pll_data *pll = &priv->pll[idx];
> +
> +		pll->hw.init = &init;
> +		pll->idx = idx;
> +
> +		ret = devm_clk_hw_register(dev, &pll->hw);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return devm_of_clk_add_hw_provider(dev, jhb100_pll_get, priv);
> +}
> +
> +static const struct jhb100_pll_preset jhb100_pll2_presets[] = {
> +	{
> +		.freq = 903168000,
> +		.fbdiv = 72,
> +		.frac = 4252017,
> +		.refdiv = 1,
> +		.postdiv = 0,
> +		.foutpostdiv_en = 1,
> +		.foutvcop_en = 0,
> +	},
> +};
> +
> +static const struct jhb100_pll_preset jhb100_pll3_presets[] = {
> +	{
> +		.freq = 800000000,
> +		.fbdiv = 64,
> +		.frac = 0,
> +		.refdiv = 1,
> +		.postdiv = 0,
> +		.foutpostdiv_en = 1,
> +		.foutvcop_en = 0,
> +	},
> +};
> +
> +static const struct jhb100_pll_info jhb100_sys0_pll_info[] = {
> +	JHB100_PLL(JHB100_SYS0PLL_PLL2_OUT, "pll2_out", jhb100_pll2_presets,
> +		   ARRAY_SIZE(jhb100_pll2_presets), JHB100_PLL2_OFFSET, false),
> +	_JHB100_PLL(JHB100_SYS0PLL_PLL3_OUT, "pll3_out", jhb100_pll3_presets,
> +		    ARRAY_SIZE(jhb100_pll3_presets), JHB100_PLL3_OFFSET,
> +		    CLK_IS_CRITICAL, false),
> +	_JHB100_PLL(JHB100_SYS0PLL_PLL4_OUT, "pll4_out", NULL, 0,
> +		    JHB100_PLL4_OFFSET, CLK_IGNORE_UNUSED, true),

Please comment when adding CLK_IGNORE_UNUSED so people have an idea why
it is needed and how it can be removed

> +	_JHB100_PLL(JHB100_SYS0PLL_PLL5_OUT, "pll5_out", NULL, 0,
> +		    JHB100_PLL5_OFFSET, CLK_IGNORE_UNUSED, true),
> +};
> +
> +static const struct jhb100_pll_match_data jhb100_sys0_pll = {
> +	.pll_info = jhb100_sys0_pll_info,
> +	.num_pll = ARRAY_SIZE(jhb100_sys0_pll_info),
> +};
> +
> +static const struct platform_device_id jhb100_pll_ids[] = {
> +	{
> +		.name = "jhb100-sys0-pll",
> +		.driver_data = (unsigned long)&jhb100_sys0_pll,
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(platform, jhb100_pll_ids);
> +
> +static struct platform_driver jhb100_pll_driver = {
> +	.probe = jhb100_pll_probe,
> +	.id_table = jhb100_pll_ids,
> +	.driver = {
> +		.name = "clk-starfive-jhb100-pll",
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +builtin_platform_driver(jhb100_pll_driver);
> -- 
> 2.25.1
> 
> 


