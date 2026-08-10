Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BC8353A69
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786393413; cv=none; b=GoSiXJI0Rw2oEQbWvDz+FZb/YsmUxnY8jtoRprMindL2qrdcbJnlh9sLGU0aCJhL42rdVsxkig1ZR/ElRrmUEkqFvHK/SdjjE/J7pB3kA/aYTI8Co8jaLH+DFkbG+6PWUVibeWWumyQFgRV0PfT3OVasyufXRUTv208SBOv/0q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786393413; c=relaxed/simple;
	bh=GFtbL8+vA8VDIknu9JHEi10flXfzA9MYfLLjOioolB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7PG5BhZzMgsQaDRZgphBmivah0n8VC8o/Nc9hgn2i/CtwjGdchhgHoIidk6kV40wBqK3RnRE0ZPoJa+TIiuL96z8ujoKKuLcrAZvzBY6KvtF4UwEdrLW/cxhoH2bo4my3ABV2U+ZjAIur65CHNYkLJEpMQYxDVRlY+mn5dFYZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bbPYvwPi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PN6y38gV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bbPYvwPi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PN6y38gV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786393410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4EcrrxoZB2Rbpm0WKGvY7vvRyYw+T8yDIaxj3hBuWi8=;
	b=bbPYvwPil4H7NuycVMPPTphYRmKN7FZjvD7i2pmsNXKbJEWzoPT7fOt+9UVNni7jDSfYkL
	mZHky8vPG5e2r0CThajU2p+CriTLBJsbVgA6X2YPhUUHizv7hZX+3E9tQWypItz9yaGumx
	w64TGJf4xo8NXOBP+OaB2igs78XSqgQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-7ZP24gzcN-iCG2MIk7CO3Q-1; Mon, 10 Aug 2026 16:23:28 -0400
X-MC-Unique: 7ZP24gzcN-iCG2MIk7CO3Q-1
X-Mimecast-MFC-AGG-ID: 7ZP24gzcN-iCG2MIk7CO3Q_1786393408
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f45dde7595so13870736d6.3
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 13:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786393408; x=1786998208; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4EcrrxoZB2Rbpm0WKGvY7vvRyYw+T8yDIaxj3hBuWi8=;
        b=PN6y38gVoQ0kty5iOrretaIZlzflN6Gko73fPYiedJ6/7ORGIDT+D9GyQEzhG1OoSc
         HewX+YP20i4NlsS7sgQQ0r4X10HNE84m8mPwcT+t1M75uh8xT30GexrZ4SQ1mCoxwapm
         8WNM4T/dW4XZyccsdsUoqHNfBn9vc6nhWSITin1p5Crjz58d+K1G+JuOL5kcSgG8ahv1
         lEl22LpKpCqKNy8PqliRorMQ10ky99KmFhCQUqAp2H6zNZkO4kkvPMjLypSDfN+IeHFt
         mKXgjSLO8Ko3LJWnyuBQ6TOA72Dt4HRd19P7YSh8wkWQ0zQ9hje955z64yP0SKvKk4Ud
         bT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786393408; x=1786998208;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EcrrxoZB2Rbpm0WKGvY7vvRyYw+T8yDIaxj3hBuWi8=;
        b=Kuyi6RSTfx9VXgezA7K+KWsL1rgikPGCu4GvY3vvEg0fYhwVkrHg5KloNvusvSetT4
         k+ByLDHVVSuye6ymK4V9il/WI8WlLC2aE9BYpXUPbfRIddOpdQvGFIiYIAm69dmGyopU
         p3A+NYaOg1FImMzbtu+Z8cgJ1ofeq7WVFX8L0OB8pCwxk3EymVwSahQ9K7rJRhs8kVFF
         GvMUEX+p3BMh28y0IYoGGVSeBKuJxZT3HhCW6A6Fyg+d+LIUYPKwm132hZq9iQ/QssvG
         t/usGSYc0JRYs11gF23D1nvgIQY4+d390ozx8EOgbPjdWMp6BOMbTRMBRfPBM6soVIGU
         r3sQ==
X-Forwarded-Encrypted: i=1; AHgh+RroYr0con72NLPsHNQIrXV0Wm+INaWqG8xMiiV5i/DqXEbDKI0DA4qICYDdv/cZHqIDDYExgMK8eJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLBmhccqOQdi8PXDsGaOchNo3eZUpTbR1caQGXra2c1LwFq1HG
	137lQAMZX58Hajklapet7ZkhN4YaOaH/OrCnEhMM3XDnNPU5/fYYhPUZVHsYFS7pAzU6qtxm15B
	MVN1gNu8rs+lJQAcTHMQNAUpybSI3VP3FeZiprJwjCf/TosX3+XoNzIszZyv/Qg==
X-Gm-Gg: AR+sD12xVt0ikuDTl+KkGrNx8gtu3cXVxLZ+ronPAkaO7OOYScgYV3rBARYkCflQMwf
	hkOfY4MYKSb+kqmmCLlDsF6M1FlAvpxFcVjoh4ukt07CnIQvSojyXqu1VTu1LaHnae7dP7zN2zG
	+jI2m0jrs/pmGROwDZsE53gfBUQTYeU5AXVzj7010S66ooG9J+W5fnM1qBXs75kdqdvtkAhfW+g
	hMr6btC+X8XPik8Nsigx19s37GwISjGU+Be5CH+Jn8uzIjY4OpXK10GstfuE7ewYnmQtVTR+SzP
	Ka2LNAsoNNFWJnTluWjuvrYC21A0n8yKHU9Y+RMih+BhozterHanFCju2Ia9/qP9YpBwLHSGfg=
	=
X-Received: by 2002:a05:6214:484:b0:904:4275:e165 with SMTP id 6a1803df08f44-908a7087bd4mr262934646d6.19.1786393407964;
        Mon, 10 Aug 2026 13:23:27 -0700 (PDT)
X-Received: by 2002:a05:6214:484:b0:904:4275:e165 with SMTP id 6a1803df08f44-908a7087bd4mr262933926d6.19.1786393407384;
        Mon, 10 Aug 2026 13:23:27 -0700 (PDT)
Received: from redhat.com ([2600:382:7724:75b0:81eb:3823:e2d:90dd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a918ecbesm79757186d6.9.2026.08.10.13.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 13:23:26 -0700 (PDT)
Date: Mon, 10 Aug 2026 16:23:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
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
Message-ID: <anozO_Q-a7AFQkaE@redhat.com>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-3-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809015054.210577-3-changhuang.liang@starfivetech.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Changhuang,

On Sat, Aug 08, 2026 at 06:50:48PM -0700, Changhuang Liang wrote:
> Add system-0 domain PLL clock driver for StarFive JHB100 SoC.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |   8 +
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jhb100-pll.c    | 535 ++++++++++++++++++
>  3 files changed, 544 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.c
> 
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 852464949334..a39dd22112fa 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -117,6 +117,14 @@ config CLK_STARFIVE_JHB100_PER3
>  	  Say yes here to support the peripheral-3 clock controller
>  	  on the StarFive JHB100 SoC.
>  
> +config CLK_STARFIVE_JHB100_PLL
> +	bool "StarFive JHB100 PLL clock support"

Can this be a tristate?

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

const char *name ?

> +	const struct jhb100_pll_preset *presets;
> +	unsigned int npresets;
> +	unsigned long flag;

flags

> +	u8 offset;
> +	bool continuous;
> +};
> +
> +#define _JHB100_PLL(_idx, _name, _presets, _npresets, _offset, _flag, _cont)	\
> +	[_idx] = {							\
> +		.name = _name,						\
> +		.offset = _offset,					\
> +		.presets = _presets,					\
> +		.npresets = _npresets,					\
> +		.flag = _flag,						\
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
> +			   JHB100_PLL_PD, BIT(JHB100_PLL_PD_SHIFT));
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
> +	val->fbdiv = (value & JHB100_PLL_FBDIV) >> JHB100_PLL_FBDIV_SHIFT;
> +	val->foutpostdiv_en = !!((value & JHB100_PLL_FOUTPOSTDIV_EN) >>
> +				 JHB100_PLL_FOUTPOSTDIV_EN_SHIFT);
> +	val->foutvcop_en = !!((value & JHB100_PLL_FOUTVCOP_EN) >>
> +			      JHB100_PLL_FOUTVCOP_EN_SHIFT);
> +
> +	ret = regmap_read(regmap, JHB100_PLLX_CFG1(info->offset), &value);
> +	if (ret)
> +		return ret;
> +
> +	val->frac = (value & JHB100_PLL_FRAC) >> JHB100_PLL_FRAC_SHIFT;
> +
> +	ret = regmap_read(regmap, JHB100_PLLX_CFG2(info->offset), &value);
> +	if (ret)
> +		return ret;
> +
> +	val->postdiv = (value & JHB100_PLL_POSTDIV) >> JHB100_PLL_POSTDIV_SHIFT;
> +	val->refdiv = (value & JHB100_PLL_REFDIV) >> JHB100_PLL_REFDIV_SHIFT;

Use FIELD_GET() and FIELD_PREP() throughout to simplify.

> +
> +	return 0;
> +}
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
> +	}
> +
> +	/* continuous means support any rate */
> +	if (info->continuous)
> +		return 0;
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
> +	cfg = ((u32)val->fbdiv << JHB100_PLL_FBDIV_SHIFT) |
> +	      ((u32)val->foutpostdiv_en << JHB100_PLL_FOUTPOSTDIV_EN_SHIFT) |
> +	      ((u32)val->foutvcop_en << JHB100_PLL_FOUTVCOP_EN_SHIFT);
> +
> +	ret = regmap_update_bits(priv->regmap, JHB100_PLLX_CFG0(info->offset),
> +				 JHB100_PLL_FBDIV | JHB100_PLL_FOUTPOSTDIV_EN |
> +				 JHB100_PLL_FOUTVCOP_EN, cfg);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(priv->regmap, JHB100_PLLX_CFG1(info->offset), JHB100_PLL_FRAC,
> +				 val->frac << JHB100_PLL_FRAC_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	cfg = ((u32)val->refdiv << JHB100_PLL_REFDIV_SHIFT) |
> +	      ((u32)val->postdiv << JHB100_PLL_POSTDIV_SHIFT);
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
> +	return -EINVAL;

Add newline before return.

> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +static int jhb100_pll_registers_read(struct seq_file *s, void *unused)
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
> +static int jhb100_pll_registers_open(struct inode *inode, struct file *f)
> +{
> +	return single_open(f, jhb100_pll_registers_read, inode->i_private);
> +}
> +
> +static const struct file_operations jhb100_pll_registers_ops = {
> +	.owner = THIS_MODULE,
> +	.open = jhb100_pll_registers_open,
> +	.release = single_release,
> +	.read = seq_read,
> +	.llseek = seq_lseek
> +};

You can use DEFINE_SHOW_ATTRIBUTE() to replace some boilerplate.

> +
> +static void jhb100_pll_debug_init(struct clk_hw *hw, struct dentry *dentry)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +
> +	debugfs_create_file("registers", 0400, dentry, pll,
> +			    &jhb100_pll_registers_ops);
> +}
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
> +	struct jhb100_pll_priv *priv;
> +	unsigned int idx;
> +	int ret;
> +
> +	match_data = of_device_get_match_data(&pdev->dev);

Use device_get_match_data() instead since this is deprecated.

Brian


> +	if (!match_data)
> +		return -EINVAL;
> +
> +	priv = devm_kzalloc(&pdev->dev,
> +			    struct_size(priv, pll, match_data->num_pll),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->match_data = match_data;
> +	priv->dev = &pdev->dev;
> +	priv->regmap = syscon_node_to_regmap(priv->dev->of_node);
> +	if (IS_ERR(priv->regmap))
> +		return PTR_ERR(priv->regmap);
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
> +			.flags = match_data->pll_info[idx].flag,
> +		};
> +		struct jhb100_pll_data *pll = &priv->pll[idx];
> +
> +		pll->hw.init = &init;
> +		pll->idx = idx;
> +
> +		ret = devm_clk_hw_register(&pdev->dev, &pll->hw);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return devm_of_clk_add_hw_provider(&pdev->dev, jhb100_pll_get, priv);
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
> +	_JHB100_PLL(JHB100_SYS0PLL_PLL5_OUT, "pll5_out", NULL, 0,
> +		    JHB100_PLL5_OFFSET, CLK_IGNORE_UNUSED, true),
> +};
> +
> +static const struct jhb100_pll_match_data jhb100_sys0_pll = {
> +	.pll_info = jhb100_sys0_pll_info,
> +	.num_pll = ARRAY_SIZE(jhb100_sys0_pll_info),
> +};
> +
> +static const struct of_device_id jhb100_pll_match[] = {
> +	{
> +		.compatible = "starfive,jhb100-sys0-syscon",
> +		.data = &jhb100_sys0_pll,
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, jhb100_pll_match);
> +
> +static struct platform_driver jhb100_pll_driver = {
> +	.probe = jhb100_pll_probe,
> +	.driver = {
> +		.name = "clk-starfive-jhb100-pll",
> +		.of_match_table = jhb100_pll_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +builtin_platform_driver(jhb100_pll_driver);
> -- 
> 2.25.1
> 

