Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794441378;
	b=sF2c2jkkVuFXceyl4mZB86Pk+s75WCq/0Y2dtPVlS3dSg2U3hSgCcRQ2t36tEBwgdIOc
	 GmfZ3HVgSqPapfuoTyPwunt8P1McUl9ROrTTbGMt9Iqwdc7m3PIjpSAa2jlofNqYdQvdf
	 KDIjBXZo7clg5QUOcYX3qpBBM/wLxK97y+rmWzTd/W81BjFRjJlzSs5QMm09YnZfIk1S9
	 mfPgZCP11oBf9AiuJwOjvQmYO9kVsRoXkyUn08RJVdwUbrVPVruUMmg6nNCa34Vg70tT4
	 s4Kr+taFMYtWfcoJ6ZzvLeOELwoDTDiylQP8E/Mwy8+U7dtHpgVXjS+p9IMpNHqSU2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794441378;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=YWczProYhfVBAqCq7SW60CuAwYPgXgNarIrqGhyivw8=;
	b=d8V7owsgP4LcmqwbvaVv/Wx4NtVM2M33UiryMRJtMRiiobHbxfnCiAmTTPLO5eZTZ3o3
	 U2nuFKQfDXzvplRh7RgDTfrwX7kRTsWo0tRqqpxIr59ahmjMl8dAiRZwf7CzUsqlhX8W/
	 fTRLhbwdzOBthQfsvEhbPby0GX0QrJdgRPOy0iT6NC+HDWtLfplX3xCnO2LDcvuvHz2PM
	 FAVQdoqnjicNEoWxTGB2f3ijgnX63gPVBLc9Ffzyb8sVaLtpqZO3/4sYgQP0n6Kj7S4V0
	 +f8f+5OIRb9INUj6Cfv4Iv73yejpBjUrh2y5VyHYYTMKNHRgRk2YAMoE9wnCR8qayBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FRX41xje;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E86B606A336;
	Wed, 11 Nov 2026 23:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FRX41xje
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0311F00A0B;
	Wed, 11 Nov 2026 23:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794441378;
	bh=YWczProYhfVBAqCq7SW60CuAwYPgXgNarIrqGhyivw8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=FRX41xjeGGvZC+P3LDF/GESOk/9MbOja/aNbjP6xsK9OVQrtNbW1dMW0w6e7nXaPo
	 VfrAcfogQirI7J69yYiKaZGdXpq4pRqUG4OZ5Ejj02p3v9XYKcXnzcbYX3CeLAlSH1
	 i2PFZRrp5LxXFO59AXw3h+Ug1KizaLGuYjDBQUWnt+61DPqjp+qkLzI9NZdVrd5roM
	 tZUd6j+Ah2sNWOnPvi+Mjg9gXUlgh/GSnore7vrQx1wA7iZ2wA4SadG0ohEds0SkGT
	 ipCHd1Q8BZrr6vaHhoWrQkLOex7je6hCSK3e/baY15enaLf83N/bi1nS9KqJ2t+vE7
	 Yzll0ytCU7oLA==
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
Subject: Re: [PATCH v5 2/2] clk: en7523: add support for .set_rate for
 en7581
From: Brian Masney <masneyb@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261110001128.1041-3-ansuelsmth@gmail.com>
References: <20261110001128.1041-1-ansuelsmth@gmail.com>
 <20261110001128.1041-3-ansuelsmth@gmail.com>
Date: Wed, 11 Nov 2026 18:55:58 -0500
Message-Id: <179444135864.1126566.13931750325129218557.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=10110; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=SvhKZ80Oh3/bgcVqwYOr/6djJjcwtbDDiZJjS/j0KnI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+MswsNKk0u3h8IyfnQ7cX0zlcZz4+8MfTy9Rhoc+3B
 Rcfn8vr6ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiy4wZ/nu1fq6+d4+fNSLQ
 ueWL3+3Mj598zhR4Rwqu+/L8m+0aWWWG/wXFrvLhVs+Emm/EzT2Z9DFMvEB1G9OK3FXzlfYK5lx
 dzQcA
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
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/clk-en7523.c | 228 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 227 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 6640e814d36a..b0aed88528c5 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -119,6 +119,8 @@ struct en_clk_desc {
>  	u16 div_val0;
>  	u8 div_step;
>  	u8 div_offset;
> +	unsigned long div_flags;

Nothing sets this flag.

> +	const struct clk_div_table *div_table;
>  };
>  
>  struct en_clk_gate {
> @@ -161,7 +163,88 @@ struct en_clk_soc_data {
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
> @@ -215,6 +298,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
>  		.div_shift = 0,
>  		.div_step = 1,
>  		.div_offset = 1,
> +		.div_table = bus_div,

en7523_get_div() is still present, and en7523_register_clocks() still
refers to it. Should it be made generic to use the div_table as well?

>  	}, {
>  		.id = EN7523_CLK_SLIC,
>  		.name = "slic",
> @@ -230,6 +314,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
>  		.div_shift = 24,
>  		.div_val0 = 20,
>  		.div_step = 2,
> +		.div_table = slic_div,
>  	}, {
>  		.id = EN7523_CLK_SPI,
>  		.name = "spi",
> @@ -242,6 +327,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
>  		.div_shift = 8,
>  		.div_val0 = 40,
>  		.div_step = 2,
> +		.div_table = spi_div,
>  	}, {
>  		.id = EN7523_CLK_NPU,
>  		.name = "npu",
> @@ -311,6 +397,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
>  		.div_shift = 0,
>  		.div_step = 1,
>  		.div_offset = 1,
> +		.div_table = bus_div,
>  	}, {
>  		.id = EN7523_CLK_SLIC,
>  		.name = "slic",
> @@ -326,6 +413,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
>  		.div_shift = 24,
>  		.div_val0 = 20,
>  		.div_step = 2,
> +		.div_table = slic_div,
>  	}, {
>  		.id = EN7523_CLK_SPI,
>  		.name = "spi",
> @@ -338,6 +426,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
>  		.div_shift = 8,
>  		.div_val0 = 40,
>  		.div_step = 2,
> +		.div_table = spi_div,
>  	}, {
>  		.id = EN7523_CLK_NPU,
>  		.name = "npu",
> @@ -775,11 +864,148 @@ static unsigned long en7581_recalc_rate(struct clk_hw *hw,
>  		return 0;
>  	}
>  
> -	return rate / en7523_get_div(desc, val);
> +	if (desc->div_bits) {
> +		val >>= desc->div_shift;
> +		val &= (1 << desc->div_bits) - 1;
> +
> +		rate = divider_recalc_rate(hw, rate, val,
> +					   desc->div_table,
> +					   desc->div_flags,
> +					   desc->div_bits);
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
> +				   desc->div_bits, desc->div_flags);
> +	if (*div_val < 0)
> +		return 0;
> +
> +	return divider_recalc_rate(hw, parent_rate, *div_val,
> +				   desc->div_table, desc->div_flags,
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
> +		if (tmp_rate && tmp_rate == rate)

is the 'tmp_rate && ' redundant?

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
> +		if (tmp_rate && tmp_rate == rate)
> +			break;
> +	}
> +
> +	/* Failed to found matching clock, return error */

Typically if it can't find an exact rate, then it will return the
closest matching rate. As written this means that callers need to know
in advance the valid rounded rates.

> +	if (tmp_base_val >= desc->n_base_values) {
> +		dev_err(dev, "Invalid rate for clock %s\n",

Since this runs from determine_rate(), make this dev_dbg().

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
> +static int en7581_determine_rate(struct clk_hw *hw,
> +				 struct clk_rate_request *req)
> +{
> +	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
> +	u32 div_val, base_val;
> +
> +	/* Just check if the rate is possible */
> +	return en7581_get_vals_for_rate(hw, en_clk->desc, req->rate,
> +					&base_val, &div_val);
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
> +	int err;
> +
> +	err = en7581_get_vals_for_rate(hw, en_clk->desc, rate,
> +				       &base_val, &div_val);
> +	if (err)
> +		return err;
> +
> +	if (desc->div_bits) {
> +		reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> +
> +		mask = (BIT(desc->div_bits) - 1) << desc->div_shift;
> +		val = div_val << desc->div_shift;
> +
> +		err = regmap_update_bits(map, reg, mask, val);
> +		if (err)
> +			return dev_err_probe(dev, err, "Failed to update div reg for clock %s\n",
> +					     desc->name);

As pointed out by Sashiko, use dev_err()

Brian

-- 
Brian Masney <masneyb@kernel.org>
