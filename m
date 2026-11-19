Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117950;
	b=T6xIpy+kX5eJVh5ceEBNp1QmmMqCyCsHRlQBuvFponukkRtmKuWvQ0V73fM8EC5DLKLu
	 q5zzvYWzJTcH1DphFRBfZJJq36FPnf6DJM5V17T1Xc7anoL9zoKa1zHPawOUXXcZEDjQx
	 TvT9c5PGRvsgm+z68C2IQocao4JVXKgYhoYzsV/SFwyBkGwxzLhT1cLgMCF/kZRwJEB9k
	 ZJYyez7DyPSzszj3H9oiaf6QgnEW/oDLkHbyNtbsbZSYcRLKWcvMR35c78KGM33SasqiL
	 JD5PIkTWf7puXdPNupueDXbg0KabaltunFzkRZgdU0JHam8ixLL9j2pCQ5vMxkiJZHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117950;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hldyOmuovudpDZcKBZAqxwujml3hMneSLgSVnKSFBdw=;
	b=DjHfAMGjCAIHvACcwmILPP6v0WRssdNw+oiZ8ufUbWOM9BRlnWqaK0gnP2u17bYjMGLI
	 yl3FYKBBKRyE0MhFwVcIghaDuEeD+LSECnfuwyPsfdj81TQoGv3ytrvEXyQDi8Cin4mv+
	 yvSTUmnRxSoD3bkNhzY8zT5yFD8FmsZb3hyyymdFSnXm42K6y355U87qKhv/pajhi/a66
	 xhB5qb9umb0BnkV9XBUrMtSCgNfIzIsbnwANU1iv+IvQqa9OCFhqxZ+pN15d3XoYhnQ7V
	 r/zjRaVu36FJD2P2yDZy2D9H4pJsz2BbvIkJ06Vy1mnlFmGDV+tI6pgXAh9KfO2sy3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y79EQ6XN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDAC606A325
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 19:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y79EQ6XN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41B91F000C4;
	Thu, 19 Nov 2026 19:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117950;
	bh=hldyOmuovudpDZcKBZAqxwujml3hMneSLgSVnKSFBdw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Y79EQ6XNFGDSG2VVOEY+lw87K8NMrc2l04VTQvkewIvs5ubFzi151j+k+GMMIxDI1
	 jGBUmmpU8rrz8EHnUE4a3LX8vNnUZVmw2g8UvIJRDIttPm2/Sy8K0uUnLb0eok92HK
	 f5pFK3a3BKIxoApq7GR0eYwQT9VHBleOLyBf30r8bXFVN27K6jkGoVrLt0Kz/wkjFT
	 Hl3MFTo6y3qFi2LafxiQ2Ciy6VLO5M7aA0qtiJxXVkA9dY1fz3MxrHAA13LWOuHgPu
	 gtIWMDBCaH+wKeJmoU3rw9FIq00aZfsuRtHZeY0FvP3WJIEdzIaMOFmxfAwZ4y0+6u
	 AdCS5zeDw9XEA==
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
Subject: Re: [PATCH v6 2/2] clk: en7523: add support for .set_rate for
 en7581
From: Brian Masney <masneyb@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261117180213.88046-3-ansuelsmth@gmail.com>
References: <20261117180213.88046-1-ansuelsmth@gmail.com>
 <20261117180213.88046-3-ansuelsmth@gmail.com>
Date: Thu, 19 Nov 2026 14:52:23 -0500
Message-Id: <179511794323.284394.3927169878877033939.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=13497; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=XJR3JlA4Rw42xdwb7ukhSNCmmgO0poQPaO4nxbh2kOY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL+B1fFNjv9Wpcu4e9yoNNLbEawiFj1mUsCi2OVxS1TZ
 66bHujcUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwEQSUhgZHq5dPmFuQ5bqOQfd
 dS2LrtzpUK96Jfr1ia/tos4t7yr/NTIyNNve955VdYMlLstCWbP7c3BdrK7O1y2am1QiBEUYbJh
 5AQ==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Christian,

> Add support for EN7523 driver to configure rate for Airoha EN7581 SoC.
> The SoC expose both base clock selector and clock divisor hence it's
> possible to change the rate.
> 
> This will be especially needed for new SoC AN7583 that require changes
> for the MDIO and the eMMC.
> 
> The clock were assumed correctly configured by the bootloader but this
> goes against the rule of "kernel should not depend on external
> configuration".
> 
> To support the use of standard clock divider API, clock_div_table are added
> where needed (BUS, SPI and SLIC) in additionl to the previous info to
> derive and simulate the clock from the divisor registers.
> 
> Recalc rate for Airoha EN7581 is updated to use the divider_recalc_rate API
> for consistency with .set_rate and .determine_rate.
> 
> en7523_get_div() is updated to use the div table to drop redundant values.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/clk-en7523.c | 322 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 288 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 634e75348c71..2bbc1e71fa2d 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -116,9 +116,7 @@ struct en_clk_desc {
>  	u16 div_reg;
>  	u8 div_bits;
>  	u8 div_shift;
> -	u16 div_val0;
> -	u8 div_step;
> -	u8 div_offset;
> +	const struct clk_div_table *div_table;
>  };
>  
>  struct en_clk_gate {
> @@ -161,7 +159,88 @@ struct en_clk_soc_data {
>  static const u32 gsw_base[] = { 400000000, 500000000 };
>  static const u32 emi_base[] = { 333000000, 400000000 };
>  static const u32 bus_base[] = { 500000000, 540000000 };
> +/* From documentation divisor 1 is n/a */
> +static const struct clk_div_table bus_div[] = {
> +	{ .val = 1, .div = 2 },
> +	{ .val = 2, .div = 3 },
> +	{ .val = 3, .div = 4 },
> +	{ .val = 4, .div = 5 },
> +	{ .val = 5, .div = 6 },
> +	{ .val = 6, .div = 7 },
> +	{ .val = 7, .div = 8 },
> +	{ /* sentinel */ }
> +};
>  static const u32 slic_base[] = { 100000000, 3125000 };
> +static const struct clk_div_table slic_div[] = {
> +	{ .val = 0, .div = 20 },
> +	{ .val = 1, .div = 2 },
> +	{ .val = 2, .div = 4 },
> +	{ .val = 3, .div = 6 },
> +	{ .val = 4, .div = 8 },
> +	{ .val = 5, .div = 10 },
> +	{ .val = 6, .div = 12 },
> +	{ .val = 7, .div = 14 },
> +	{ .val = 8, .div = 16 },
> +	{ .val = 9, .div = 18 },
> +	{ .val = 10, .div = 20 },
> +	{ .val = 11, .div = 22 },
> +	{ .val = 12, .div = 24 },
> +	{ .val = 13, .div = 26 },
> +	{ .val = 14, .div = 28 },
> +	{ .val = 15, .div = 30 },
> +	{ .val = 16, .div = 32 },
> +	{ .val = 17, .div = 34 },
> +	{ .val = 18, .div = 36 },
> +	{ .val = 19, .div = 38 },
> +	{ .val = 20, .div = 40 },
> +	{ .val = 21, .div = 42 },
> +	{ .val = 22, .div = 44 },
> +	{ .val = 23, .div = 46 },
> +	{ .val = 24, .div = 48 },
> +	{ .val = 25, .div = 50 },
> +	{ .val = 26, .div = 52 },
> +	{ .val = 27, .div = 54 },
> +	{ .val = 28, .div = 56 },
> +	{ .val = 29, .div = 58 },
> +	{ .val = 30, .div = 60 },
> +	{ .val = 31, .div = 62 },
> +	{ /* sentinel */ }
> +};
> +static const struct clk_div_table spi_div[] = {
> +	{ .val = 0, .div = 40 },
> +	{ .val = 1, .div = 2 },
> +	{ .val = 2, .div = 4 },
> +	{ .val = 3, .div = 6 },
> +	{ .val = 4, .div = 8 },
> +	{ .val = 5, .div = 10 },
> +	{ .val = 6, .div = 12 },
> +	{ .val = 7, .div = 14 },
> +	{ .val = 8, .div = 16 },
> +	{ .val = 9, .div = 18 },
> +	{ .val = 10, .div = 20 },
> +	{ .val = 11, .div = 22 },
> +	{ .val = 12, .div = 24 },
> +	{ .val = 13, .div = 26 },
> +	{ .val = 14, .div = 28 },
> +	{ .val = 15, .div = 30 },
> +	{ .val = 16, .div = 32 },
> +	{ .val = 17, .div = 34 },
> +	{ .val = 18, .div = 36 },
> +	{ .val = 19, .div = 38 },
> +	{ .val = 20, .div = 40 },
> +	{ .val = 21, .div = 42 },
> +	{ .val = 22, .div = 44 },
> +	{ .val = 23, .div = 46 },
> +	{ .val = 24, .div = 48 },
> +	{ .val = 25, .div = 50 },
> +	{ .val = 26, .div = 52 },
> +	{ .val = 27, .div = 54 },
> +	{ .val = 28, .div = 56 },
> +	{ .val = 29, .div = 58 },
> +	{ .val = 30, .div = 60 },
> +	{ .val = 31, .div = 62 },
> +	{ /* sentinel */ }
> +};
>  static const u32 npu_base[] = { 333000000, 400000000, 500000000 };
>  /* EN7581 */
>  static const u32 emi7581_base[] = { 540000000, 480000000, 400000000, 300000000 };
> @@ -185,8 +264,6 @@ static const struct en_clk_desc en7523_base_clks[] = {
>  
>  		.div_bits = 3,
>  		.div_shift = 0,
> -		.div_step = 1,
> -		.div_offset = 1,
>  	}, {
>  		.id = EN7523_CLK_EMI,
>  		.name = "emi",
> @@ -199,8 +276,6 @@ static const struct en_clk_desc en7523_base_clks[] = {
>  
>  		.div_bits = 3,
>  		.div_shift = 0,
> -		.div_step = 1,
> -		.div_offset = 1,
>  	}, {
>  		.id = EN7523_CLK_BUS,
>  		.name = "bus",
> @@ -213,8 +288,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
>  
>  		.div_bits = 3,
>  		.div_shift = 0,
> -		.div_step = 1,
> -		.div_offset = 1,
> +		.div_table = bus_div,
>  	}, {
>  		.id = EN7523_CLK_SLIC,
>  		.name = "slic",
> @@ -228,8 +302,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
>  		.div_reg = REG_SPI_CLK_DIV_SEL,
>  		.div_bits = 5,
>  		.div_shift = 24,
> -		.div_val0 = 20,
> -		.div_step = 2,
> +		.div_table = slic_div,
>  	}, {
>  		.id = EN7523_CLK_SPI,
>  		.name = "spi",
> @@ -240,8 +313,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
>  
>  		.div_bits = 5,
>  		.div_shift = 8,
> -		.div_val0 = 40,
> -		.div_step = 2,
> +		.div_table = spi_div,
>  	}, {
>  		.id = EN7523_CLK_NPU,
>  		.name = "npu",
> @@ -254,8 +326,6 @@ static const struct en_clk_desc en7523_base_clks[] = {
>  
>  		.div_bits = 3,
>  		.div_shift = 0,
> -		.div_step = 1,
> -		.div_offset = 1,
>  	}, {
>  		.id = EN7523_CLK_CRYPTO,
>  		.name = "crypto",
> @@ -281,8 +351,6 @@ static const struct en_clk_desc en7581_base_clks[] = {
>  
>  		.div_bits = 3,
>  		.div_shift = 0,
> -		.div_step = 1,
> -		.div_offset = 1,
>  	}, {
>  		.id = EN7523_CLK_EMI,
>  		.name = "emi",
> @@ -295,8 +363,6 @@ static const struct en_clk_desc en7581_base_clks[] = {
>  
>  		.div_bits = 3,
>  		.div_shift = 0,
> -		.div_step = 1,
> -		.div_offset = 1,
>  	}, {
>  		.id = EN7523_CLK_BUS,
>  		.name = "bus",
> @@ -309,8 +375,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
>  
>  		.div_bits = 3,
>  		.div_shift = 0,
> -		.div_step = 1,
> -		.div_offset = 1,
> +		.div_table = bus_div,
>  	}, {
>  		.id = EN7523_CLK_SLIC,
>  		.name = "slic",
> @@ -324,8 +389,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
>  		.div_reg = REG_SPI_CLK_DIV_SEL,
>  		.div_bits = 5,
>  		.div_shift = 24,
> -		.div_val0 = 20,
> -		.div_step = 2,
> +		.div_table = slic_div,
>  	}, {
>  		.id = EN7523_CLK_SPI,
>  		.name = "spi",
> @@ -336,8 +400,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
>  
>  		.div_bits = 5,
>  		.div_shift = 8,
> -		.div_val0 = 40,
> -		.div_step = 2,
> +		.div_table = spi_div,
>  	}, {
>  		.id = EN7523_CLK_NPU,
>  		.name = "npu",
> @@ -350,8 +413,6 @@ static const struct en_clk_desc en7581_base_clks[] = {
>  
>  		.div_bits = 3,
>  		.div_shift = 0,
> -		.div_step = 1,
> -		.div_offset = 1,
>  	}, {
>  		.id = EN7523_CLK_CRYPTO,
>  		.name = "crypto",
> @@ -568,16 +629,20 @@ static u32 en7523_get_base_rate(const struct en_clk_desc *desc, u32 val)
>  
>  static u32 en7523_get_div(const struct en_clk_desc *desc, u32 val)
>  {
> -	if (!desc->div_bits)
> -		return 1;
> +	const struct clk_div_table *clkt;
>  
>  	val >>= desc->div_shift;
>  	val &= (1 << desc->div_bits) - 1;
>  
> -	if (!val && desc->div_val0)
> -		return desc->div_val0;
> +	if (desc->div_table) {
> +		for (clkt = desc->div_table; clkt->div; clkt++)
> +			if (clkt->val == val)
> +				return clkt->div;
>  
> -	return (val + desc->div_offset) * desc->div_step;
> +		return 0;
> +	}
> +
> +	return val + 1;
>  }
>  
>  static int en7523_pci_is_enabled(struct clk_hw *hw)
> @@ -708,10 +773,18 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
>  		const struct en_clk_desc *desc = &en7523_base_clks[i];
>  		u32 reg = desc->div_reg ? desc->div_reg : desc->base_reg;
>  		u32 val = readl(base + desc->base_reg);
> +		u32 div;
>  
>  		rate = en7523_get_base_rate(desc, val);
> +
>  		val = readl(base + reg);
> -		rate /= en7523_get_div(desc, val);
> +		if (desc->div_bits) {
> +			div = en7523_get_div(desc, val);
> +			if (!div)
> +				continue;
> +
> +			rate /= div;
> +		}
>  
>  		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
>  		if (IS_ERR(hw)) {
> @@ -774,11 +847,192 @@ static unsigned long en7581_recalc_rate(struct clk_hw *hw,
>  		return 0;
>  	}
>  
> -	return rate / en7523_get_div(desc, val);
> +	if (desc->div_bits) {
> +		val >>= desc->div_shift;
> +		val &= (1 << desc->div_bits) - 1;
> +
> +		rate = divider_recalc_rate(hw, rate, val,
> +					   desc->div_table, 0,
> +					   desc->div_bits);

You can combine these into two lines.

> +	}
> +
> +	return rate;
> +}
> +
> +/*
> + * Simulate rate with every divisor supported
> + * 1. Search the divisor for the requested rate
> + * 2. Simulate the final rate with the new divisor
> + */
> +static unsigned long en7581_get_div_for_rate(struct clk_hw *hw,
> +					     unsigned long rate,
> +					     unsigned long parent_rate,
> +					     const struct en_clk_desc *desc,
> +					     int *div_val)
> +{
> +	*div_val = divider_get_val(rate, parent_rate, desc->div_table,
> +				   desc->div_bits, 0);

I think you should use divider_determine_rate instead for the rounding.

> +	if (*div_val < 0)
> +		return 0;
> +
> +	return divider_recalc_rate(hw, parent_rate, *div_val,
> +				   desc->div_table, 0,
> +				   desc->div_bits);
> +}
> +
> +static int en7581_get_vals_for_rate(struct clk_hw *hw,
> +				    const struct en_clk_desc *desc,
> +				    unsigned long rate,
> +				    u32 *base_val, u32 *div_val)
> +{
> +	struct device *dev = clk_hw_get_dev(hw);
> +	unsigned long parent_rate, tmp_rate;
> +	int tmp_base_val = 0;
> +	int tmp_div_val = 0;

The two int lines can be combined.

> +
> +	if (!rate || (!desc->base_bits && !desc->div_bits))
> +		return -EINVAL;
> +
> +	if (!desc->base_bits) {
> +		parent_rate = desc->base_value;
> +
> +		tmp_rate = en7581_get_div_for_rate(hw, rate, parent_rate,
> +						   desc, &tmp_div_val);
> +
> +		/* Matching clock found */
> +		if (tmp_rate == rate)
> +			goto exit;
> +	}
> +
> +	/* Search requested rate with every matching base rate + divisor */
> +	for (; tmp_base_val < desc->n_base_values; tmp_base_val++) {
> +		parent_rate = desc->base_values[tmp_base_val];
> +		tmp_rate = parent_rate;
> +
> +		if (desc->div_bits)
> +			tmp_rate = en7581_get_div_for_rate(hw, rate, parent_rate,
> +							   desc, &tmp_div_val);
> +
> +		/* Matching clock found */
> +		if (tmp_rate == rate)
> +			break;
> +	}
> +
> +	/* Impossible, should be validated by determine rate */
> +	if (tmp_base_val >= desc->n_base_values) {
> +		dev_err(dev, "Invalid rate for clock %s\n",
> +			desc->name);
> +		return -EINVAL;
> +	}
> +
> +exit:
> +	*base_val = tmp_base_val;
> +	*div_val = tmp_div_val;
> +
> +	return 0;
> +}
> +
> +static void en7581_find_best_rate(struct clk_hw *hw, struct clk_rate_request *req,
> +				  const struct en_clk_desc *desc,
> +				  unsigned long parent_rate,
> +				  unsigned long requested_rate,
> +				  unsigned long *best_diff)
> +{
> +	unsigned long tmp_rate, diff;
> +	int tmp_div_val;
> +
> +	tmp_rate = parent_rate;
> +	if (desc->div_bits)
> +		tmp_rate = en7581_get_div_for_rate(hw, requested_rate, parent_rate,
> +						   desc, &tmp_div_val);
> +
> +	if (!tmp_rate || tmp_rate < req->min_rate ||
> +	    tmp_rate > req->max_rate)
> +		return;
> +
> +	diff = abs_diff(requested_rate, tmp_rate);
> +	if (diff < *best_diff) {
> +		*best_diff = diff;
> +		req->rate = tmp_rate;
> +	}
> +}
> +
> +static int en7581_determine_rate(struct clk_hw *hw,
> +				 struct clk_rate_request *req)
> +{
> +	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
> +	const struct en_clk_desc *desc = en_clk->desc;
> +	unsigned long best_diff = ULONG_MAX;
> +	unsigned long rate = req->rate;
> +	int tmp_base_val = 0;
> +
> +	if (!rate || (!desc->base_bits && !desc->div_bits))
> +		return -EINVAL;
> +
> +	if (!desc->base_bits) {
> +		en7581_find_best_rate(hw, req, desc, desc->base_value,
> +				      rate, &best_diff);
> +		goto exit;
> +	}
> +
> +	for (; tmp_base_val < desc->n_base_values; tmp_base_val++)
> +		en7581_find_best_rate(hw, req, desc,
> +				      desc->base_values[tmp_base_val],
> +				      rate, &best_diff);
> +
> +exit:
> +	return best_diff == ULONG_MAX ? -EINVAL : 0;
> +}
> +
> +static int en7581_set_rate(struct clk_hw *hw, unsigned long rate,
> +			   unsigned long parent_rate)
> +{
> +	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
> +	const struct en_clk_desc *desc = en_clk->desc;
> +	struct device *dev = clk_hw_get_dev(hw);
> +	struct regmap *map = en_clk->map;
> +	u32 base_val, div_val;
> +	u32 reg, val, mask;

The u32 lines can be combined.

Brian

-- 
Brian Masney <masneyb@kernel.org>
