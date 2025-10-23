Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC54C8FE
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 04:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761192369; cv=none; b=Sq0orzGkVjqskiAavtYmEfjrF2ATG1cqOufHjnwGtDg2q1zwqPvXTSROY9UeLl3Fhb/ZS392dyXPJ6qZ+Hm+glxj4nTHzAMaoFFcq+1D54jNwszzOa4qjNZRTAY++thtAa3cNSZUZIhJ+iCPaAJb5MK8TZyIGRohiUm2hY6In88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761192369; c=relaxed/simple;
	bh=lu+p95gZO8Ko+xp5FWih+ICrJYGndfVUMVr56F6hFGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIk6f1T2lkod6L9z/LLbkjyO1kSU9qoYgu9+tTN/KJkas51jp3v3GaRTJJ/ZePaO1vBDBfHaMqvcqsRhbJkT4f6qGTm8XPRMfUNKWP9WrmUoey/sKcw9mQ/+siISvuIbUf2++EOnajKahSOz15e+iYoLo36EbmmhwwOghqhVGXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RSi072gQ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RSi072gQ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so76333266b.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 21:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761192364; x=1761797164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FLjWl/UyrpDwjN3Lj8wIfqvzdip2jsamB/Mx1g4kMpA=;
        b=RSi072gQYNy+jvz5qPfJntACNHbB2XR019LKiL65wru1BSoROUxJE6nOK+gFQAG1iB
         Iwl6on4I2OmLY1DzaM5/QW6s5Te8w3YncJm8Ju8pibDyeSs7CdB7oH1O7UqpZ+16F/y1
         bJjY4YAB3bqe7LYDhQOVRD3ZAKGJ/loH+nomwwGLEsmx4Y58SAWDIO5XS278tK319fsm
         KnqM1yDjX0qLG53bCFoW4FCMZwNLB6Df2bKjt+E5FUyKbAvh8L5cFGXKonTbhKqPCAIP
         bSR7Bp5ZSPr8OYfVtiCqYzl/bti/pCSYV+yMCOiXyD/ysL66AePL0E8eqXnqn3T10xKj
         Llew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761192364; x=1761797164;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FLjWl/UyrpDwjN3Lj8wIfqvzdip2jsamB/Mx1g4kMpA=;
        b=GuDUrEzzn8/ZVo+U2RBWtao8I9PvhqrfPI/v507cM6go0y0LYfLMaqjGOHe/wXdIsH
         g2baWxqiTSu5Cz2DzQ1psiDGwhbL6EMR/N6G78odMeB6EGXqakAetmnFMAIVQxxPm181
         o1wQU4C75O5kEDEpZcs2+F07aeyMILCgnh5re97gx2+RmqQEPBJ7tAD4fyKdgIDuGGmP
         Ud0tSira173Xn2obj63PrzkEBGPvJXT4QLinvxWym0otHcwcop9aXnKvZf0KWG17Rr96
         1Psy521L3fe4VCwxoWRxEtMbY6G7iQ8lvXwAesT8APZAha6QvjBM6+/0X8Xv1GuGif/G
         lhbw==
X-Forwarded-Encrypted: i=1; AJvYcCUHlOYzoS8IqfdHc6PEi6FEyGtkBtep6vgXlt/1Syq5NnUbGS77/wj5kcH12cmPv1myTn8M7jOrw5k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7/obEWZ4zVdWlmEd7MzO/SfA6g2g5TS+ILk14vBLePXy87VsA
	CsCp21iQ7myLyTWbvbFRhnEBRhVFD5qqNkyvok7vuxe1kAHvD0X5w2nctJwDuVDEMK8=
X-Gm-Gg: ASbGnct19VDoYnR6nva8zmafaYQFxeaCoEknKMIdekVzY7Qd+s8od9gB+YqpCr8f9dk
	aJiz8IvtAwEdwFc4mErB+VhAG1B/UY10fFJsJIB8RXMR1XztafJ9xsDsqJ5pfCbip+qiXsFwbF0
	pwkuP3QzPAtiO6oRR8lp5gNGwE47D16UkQwyGlGT3WECpf1bcmIcANYJ7OqJAQ6SgFls5529H4r
	EJEfSuWzgegZvbRdv2f0kLvabvoCzMb+VP73aPLtx9fdTUKNPMgctTBfpMW36rwPLI5ZeJx1XXE
	VEAPNRDd6HDW2Q22EtepWKc/hvjb50htWwwUOmzK5XaaM4OuApyB16S4K4WPaVwUcD0zb+FmZ4W
	/tKPz3MSOMPx/d3QYmd4ijeUJH+q8184fLGsz2pBFF+sT2RQfL5vZ4J+37tIZ7bgKsXsutJObMq
	Tfx1XYnaui
X-Google-Smtp-Source: AGHT+IGcruIaMLkNnRD1j1lyvN9vWTVd0H5SAGOMEn82BeFnCti7XhjHIhVBA2aIYkly8qfJgZ+fIg==
X-Received: by 2002:a17:906:fe46:b0:b04:830f:822d with SMTP id a640c23a62f3a-b6475708ebcmr2917031266b.63.1761192364505;
        Wed, 22 Oct 2025 21:06:04 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511f8634sm99543166b.29.2025.10.22.21.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 21:06:03 -0700 (PDT)
Message-ID: <ab443375-524d-4e6c-a640-7e580c2d0c64@tuxon.dev>
Date: Thu, 23 Oct 2025 07:06:01 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/9] clk: microchip: mpfs: use regmap for clocks
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 pierre-henry.moussay@microchip.com, valentina.fernandezalanis@microchip.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
 <20251013-undercook-flatfoot-70dca974cd19@spud>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251013-undercook-flatfoot-70dca974cd19@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Conor,

On 10/13/25 20:45, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the PolarFire SoC clock driver to use regmaps instead of iomem
> addresses as a preparatory work for supporting the new binding for this
> device that will only provide the second of the two register regions, and
> will require the use of syscon regmap to access the "cfg" and "periph"
> clocks currently supported by the driver.
> 
> This is effectively a revert of commit 4da2404bb003 ("clk: microchip:
> mpfs: convert cfg_clk to clk_divider") and commit d815569783e6 ("clk:
> microchip: mpfs: convert periph_clk to clk_gate") as it resurrects the
> ops structures removed in those commits, with the readl()s and
> writel()s replaced by regmap_read()s and regmap_writes()s.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/clk/microchip/Kconfig    |   2 +
>  drivers/clk/microchip/clk-mpfs.c | 250 ++++++++++++++++++++++++++-----
>  2 files changed, 211 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
> index 0724ce65898f..1b9e43eb5497 100644
> --- a/drivers/clk/microchip/Kconfig
> +++ b/drivers/clk/microchip/Kconfig
> @@ -7,6 +7,8 @@ config MCHP_CLK_MPFS
>  	bool "Clk driver for PolarFire SoC"
>  	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
>  	default ARCH_MICROCHIP_POLARFIRE
> +	depends on MFD_SYSCON
>  	select AUXILIARY_BUS
> +	select REGMAP_MMIO
>  	help
>  	  Supports Clock Configuration for PolarFire SoC
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
> index c22632a7439c..e3362be9b266 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -6,8 +6,10 @@
>   */
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <dt-bindings/clock/microchip,mpfs-clock.h>
>  #include <soc/microchip/mpfs.h>
>  
> @@ -30,6 +32,14 @@
>  #define MSSPLL_POSTDIV_WIDTH	0x07u
>  #define MSSPLL_FIXED_DIV	4u
>  
> +static const struct regmap_config mpfs_clk_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.max_register = REG_SUBBLK_CLOCK_CR,
> +};
> +
>  /*
>   * This clock ID is defined here, rather than the binding headers, as it is an
>   * internal clock only, and therefore has no consumers in other peripheral
> @@ -39,6 +49,7 @@
>  
>  struct mpfs_clock_data {
>  	struct device *dev;
> +	struct regmap *regmap;
>  	void __iomem *base;
>  	void __iomem *msspll_base;
>  	struct clk_hw_onecell_data hw_data;
> @@ -67,18 +78,37 @@ struct mpfs_msspll_out_hw_clock {
>  
>  #define to_mpfs_msspll_out_clk(_hw) container_of(_hw, struct mpfs_msspll_out_hw_clock, hw)
>  
> +struct mpfs_cfg_clock {
> +	struct regmap *map;
> +	const struct clk_div_table *table;
> +	u8 map_offset;
> +	u8 shift;
> +	u8 width;
> +	u8 flags;
> +};
> +
>  struct mpfs_cfg_hw_clock {
> -	struct clk_divider cfg;
> -	struct clk_init_data init;
> +	struct mpfs_cfg_clock cfg;
> +	struct clk_hw hw;

This one could be moved first as its members are all pointers, to avoid
padding, if any.

>  	unsigned int id;
> -	u32 reg_offset;
> +};
> +
> +#define to_mpfs_cfg_clk(_hw) container_of(_hw, struct mpfs_cfg_hw_clock, hw)
> +
> +struct mpfs_periph_clock {
> +	struct regmap *map;
> +	u8 map_offset;
> +	u8 shift;
>  };
>  
>  struct mpfs_periph_hw_clock {
> -	struct clk_gate periph;
> +	struct mpfs_periph_clock periph;
> +	struct clk_hw hw;
>  	unsigned int id;
>  };
>  
> +#define to_mpfs_periph_clk(_hw) container_of(_hw, struct mpfs_periph_hw_clock, hw)
> +
>  /*
>   * mpfs_clk_lock prevents anything else from writing to the
>   * mpfs clk block while a software locked register is being written.
> @@ -219,16 +249,66 @@ static int mpfs_clk_register_msspll_outs(struct device *dev,
>  /*
>   * "CFG" clocks
>   */
> +static unsigned long mpfs_cfg_clk_recalc_rate(struct clk_hw *hw, unsigned long prate)
> +{
> +	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
> +	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
> +	u32 val;
>  
> -#define CLK_CFG(_id, _name, _parent, _shift, _width, _table, _flags, _offset) {		\
> -	.id = _id,									\
> -	.cfg.shift = _shift,								\
> -	.cfg.width = _width,								\
> -	.cfg.table = _table,								\
> -	.reg_offset = _offset,								\
> -	.cfg.flags = _flags,								\
> -	.cfg.hw.init = CLK_HW_INIT(_name, _parent, &clk_divider_ops, 0),		\
> -	.cfg.lock = &mpfs_clk_lock,							\
> +	regmap_read(cfg->map, cfg->map_offset, &val);
> +	val >>= cfg->shift;
> +	val &= clk_div_mask(cfg->width);
> +
> +	return divider_recalc_rate(hw, prate, val, cfg->table, cfg->flags, cfg->width);
> +}
> +
> +static long mpfs_cfg_clk_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *prate)
> +{
> +	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
> +	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
> +
> +	return divider_round_rate(hw, rate, prate, cfg->table, cfg->width, 0);
> +}
> +
> +static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long prate)
> +{
> +	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
> +	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
> +	unsigned long flags;
> +	u32 val;
> +	int divider_setting;

This could be moved near flags to keep the reverse christmas tree order as
in the rest of this patch.

> +
> +	divider_setting = divider_get_val(rate, prate, cfg->table, cfg->width, 0);
> +
> +	if (divider_setting < 0)
> +		return divider_setting;
> +
> +	spin_lock_irqsave(&mpfs_clk_lock, flags);

As spin locking is introduced in this file by this patch, you can go
directly w/ cleanup helpers for locking.

> +
> +	regmap_read(cfg->map, cfg->map_offset, &val);
> +	val &= ~(clk_div_mask(cfg->width) << cfg_hw->cfg.shift);

Why cfg_hw->cfg.shift here --------------------^ but cfg->shift on the next
line?

> +	val |= divider_setting << cfg->shift;
> +	regmap_write(cfg->map, cfg->map_offset, val);

Can't the regmap_read() + updated + regmap_write() be replaced by
regmap_update_bits() ?

> +
> +	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops mpfs_clk_cfg_ops = {
> +	.recalc_rate = mpfs_cfg_clk_recalc_rate,
> +	.round_rate = mpfs_cfg_clk_round_rate,
.round_rate is now considered deprecated. Brian (added to cc) tried to
remove all its users.

.determine_rate() should be used now.

> +	.set_rate = mpfs_cfg_clk_set_rate,
> +};
> +
> +#define CLK_CFG(_id, _name, _parent, _shift, _width, _table, _flags, _offset) {	\
> +	.id = _id,								\
> +	.cfg.shift = _shift,							\
> +	.cfg.width = _width,							\
> +	.cfg.table = _table,							\
> +	.cfg.map_offset = _offset,						\
> +	.cfg.flags = _flags,							\
> +	.hw.init = CLK_HW_INIT(_name, _parent, &mpfs_clk_cfg_ops, 0),		\
>  }
>  
>  #define CLK_CPU_OFFSET		0u
> @@ -248,10 +328,10 @@ static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
>  		.cfg.shift = 0,
>  		.cfg.width = 12,
>  		.cfg.table = mpfs_div_rtcref_table,
> -		.reg_offset = REG_RTC_CLOCK_CR,
> +		.cfg.map_offset = REG_RTC_CLOCK_CR,
>  		.cfg.flags = CLK_DIVIDER_ONE_BASED,
> -		.cfg.hw.init =
> -			CLK_HW_INIT_PARENTS_DATA("clk_rtcref", mpfs_ext_ref, &clk_divider_ops, 0),
> +		.hw.init =
> +			CLK_HW_INIT_PARENTS_DATA("clk_rtcref", mpfs_ext_ref, &mpfs_clk_cfg_ops, 0),
>  	}
>  };
>  
> @@ -264,14 +344,14 @@ static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *
>  	for (i = 0; i < num_clks; i++) {
>  		struct mpfs_cfg_hw_clock *cfg_hw = &cfg_hws[i];
>  
> -		cfg_hw->cfg.reg = data->base + cfg_hw->reg_offset;
> -		ret = devm_clk_hw_register(dev, &cfg_hw->cfg.hw);
> +		cfg_hw->cfg.map = data->regmap;
> +		ret = devm_clk_hw_register(dev, &cfg_hw->hw);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
>  					     cfg_hw->id);
>  
>  		id = cfg_hw->id;
> -		data->hw_data.hws[id] = &cfg_hw->cfg.hw;
> +		data->hw_data.hws[id] = &cfg_hw->hw;
>  	}
>  
>  	return 0;
> @@ -281,15 +361,67 @@ static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *
>   * peripheral clocks - devices connected to axi or ahb buses.
>   */
>  
> -#define CLK_PERIPH(_id, _name, _parent, _shift, _flags) {			\
> -	.id = _id,								\
> -	.periph.bit_idx = _shift,						\
> -	.periph.hw.init = CLK_HW_INIT_HW(_name, _parent, &clk_gate_ops,		\
> -				  _flags),					\
> -	.periph.lock = &mpfs_clk_lock,						\
> +static int mpfs_periph_clk_enable(struct clk_hw *hw)
> +{
> +	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
> +	struct mpfs_periph_clock *periph = &periph_hw->periph;
> +	u32 val;
> +	unsigned long flags;

This could be moved above to have reverse chritmass tree order, or dropped
if using cleanup helpers for locking.

> +
> +	spin_lock_irqsave(&mpfs_clk_lock, flags);
> +
> +	regmap_read(periph->map, periph->map_offset, &val);
> +	val |= 1u << periph->shift;

Maybe BIT(periph->shift) is simpler here?

> +	regmap_write(periph->map, periph->map_offset, val);

Looks like this could be replaced by regmap_update_bits()

> +
> +	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
> +
> +	return 0;
>  }
>  
> -#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT##_OFFSET].cfg.hw)
> +static void mpfs_periph_clk_disable(struct clk_hw *hw)
> +{
> +	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
> +	struct mpfs_periph_clock *periph = &periph_hw->periph;
> +	u32 val;
> +	unsigned long flags;

Same here.

> +
> +	spin_lock_irqsave(&mpfs_clk_lock, flags);
> +
> +	regmap_read(periph->map, periph->map_offset, &val);
> +	val &= ~(1u << periph->shift);

Maybe BIT(periph->shift) ?

> +	regmap_write(periph->map, periph->map_offset, val);

regmap_update_bits() ?

> +
> +	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
> +}
> +
> +static int mpfs_periph_clk_is_enabled(struct clk_hw *hw)
> +{
> +	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
> +	struct mpfs_periph_clock *periph = &periph_hw->periph;
> +	u32 val;
> +
> +	regmap_read(periph->map, periph->map_offset, &val);
> +	if (val & (1u << periph->shift))
> +		return 1;
> +
> +	return 0;

Personal preference: this could be replaced by:

	return !!(val & (1u << periph->shift));

or:

	return !!(val & BIT(periph->shift));

> +}
> +
> +static const struct clk_ops mpfs_periph_clk_ops = {
> +	.enable = mpfs_periph_clk_enable,
> +	.disable = mpfs_periph_clk_disable,
> +	.is_enabled = mpfs_periph_clk_is_enabled,
> +};
> +
> +#define CLK_PERIPH(_id, _name, _parent, _shift, _flags) {				\
> +	.id = _id,									\
> +	.periph.map_offset = REG_SUBBLK_CLOCK_CR,					\
> +	.periph.shift = _shift,								\
> +	.hw.init = CLK_HW_INIT_HW(_name, _parent, &mpfs_periph_clk_ops, _flags),	\
> +}
> +
> +#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT##_OFFSET].hw)
>  
>  /*
>   * Critical clocks:
> @@ -346,19 +478,60 @@ static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_c
>  	for (i = 0; i < num_clks; i++) {
>  		struct mpfs_periph_hw_clock *periph_hw = &periph_hws[i];
>  
> -		periph_hw->periph.reg = data->base + REG_SUBBLK_CLOCK_CR;
> -		ret = devm_clk_hw_register(dev, &periph_hw->periph.hw);
> +		periph_hw->periph.map = data->regmap;
> +		ret = devm_clk_hw_register(dev, &periph_hw->hw);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
>  					     periph_hw->id);
>  
>  		id = periph_hws[i].id;
> -		data->hw_data.hws[id] = &periph_hw->periph.hw;
> +		data->hw_data.hws[id] = &periph_hw->hw;
>  	}
>  
>  	return 0;
>  }
>  
> +static inline int mpfs_clk_syscon_probe(struct mpfs_clock_data *clk_data,
> +					struct platform_device *pdev)
> +{
> +	clk_data->regmap = syscon_regmap_lookup_by_compatible("microchip,mpfs-mss-top-sysreg");
> +	if (IS_ERR(clk_data->regmap))
> +		return PTR_ERR(clk_data->regmap);
> +
> +	clk_data->msspll_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(clk_data->msspll_base))
> +		return PTR_ERR(clk_data->msspll_base);
> +
> +	return 0;
> +}
> +
> +static inline int mpfs_clk_old_format_probe(struct mpfs_clock_data *clk_data,
> +					    struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	dev_warn(&pdev->dev, "falling back to old devicetree format");
> +
> +	clk_data->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(clk_data->base))
> +		return PTR_ERR(clk_data->base);
> +
> +	clk_data->msspll_base = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(clk_data->msspll_base))
> +		return PTR_ERR(clk_data->msspll_base);
> +
> +	clk_data->regmap = devm_regmap_init_mmio(dev, clk_data->base, &mpfs_clk_regmap_config);
> +	if (IS_ERR(clk_data->regmap))
> +		return PTR_ERR(clk_data->regmap);
> +
> +	ret = mpfs_reset_controller_register(dev, clk_data->base + REG_SUBBLK_RESET_CR);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

The last lines here could be replaced by:

	return mpfs_reset_controller_register();

> +}
> +
>  static int mpfs_clk_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -374,13 +547,12 @@ static int mpfs_clk_probe(struct platform_device *pdev)
>  	if (!clk_data)
>  		return -ENOMEM;
>  
> -	clk_data->base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(clk_data->base))
> -		return PTR_ERR(clk_data->base);
> -
> -	clk_data->msspll_base = devm_platform_ioremap_resource(pdev, 1);
> -	if (IS_ERR(clk_data->msspll_base))
> -		return PTR_ERR(clk_data->msspll_base);
> +	ret = mpfs_clk_syscon_probe(clk_data, pdev);
> +	if (ret) {
> +		ret = mpfs_clk_old_format_probe(clk_data, pdev);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	clk_data->hw_data.num = num_clks;
>  	clk_data->dev = dev;
> @@ -406,11 +578,7 @@ static int mpfs_clk_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, &clk_data->hw_data);
> -	if (ret)
> -		return ret;
> -
> -	return mpfs_reset_controller_register(dev, clk_data->base + REG_SUBBLK_RESET_CR);
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, &clk_data->hw_data);
>  }
>  
>  static const struct of_device_id mpfs_clk_of_match_table[] = {
