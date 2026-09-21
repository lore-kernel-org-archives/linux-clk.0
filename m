Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10110393DE0;
	Mon, 21 Sep 2026 07:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974083; cv=none; b=UBir0rR03zTkJdHIfqz484z7/TjpLLTt6OIIB7vd5jVIUth9sDfKwgOP5TPkkvLZzRjEElHG20d+E4gqGdu4AFBiw1hPwB1Asr3PuiQ38xdIbKx1DpTi3rl5ZxwC6PkFEeyVbj7YbdUaLv1s5UF6K9VTfFtMZi4WHaJh6/ZDHlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974083; c=relaxed/simple;
	bh=0OdRHMMlHEzu/ArIy+svvkgebwS5/LXcXJRYRGJy/hY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HeeP1zCOhU9Y1iXg9g/42ABVd/HHhmU/Usj54q7hzoESQhNn+ynKO/KKqLEf5DpATjGPC54RwHY02DqrcUDtbB3bW/ApNZOG7GHtaRgYgKqK54P0CK+BXmx5Xs+zZXBVRECdN7Os7TIeZI99H3cqV1vR15r7ZlAfUNyZdsUMAnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilZT6hYb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilZT6hYb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33001F00893;
	Mon, 21 Sep 2026 07:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789974081;
	bh=79lKfknTJ4u6RzYPuaF5SZmPkU9RE2APdy5VJdZ8VTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ilZT6hYb0wYB+s8FfoF1i2pNmouR0J6NE7lF/Nkc00aqIogZTybh/wGDzHn4QXFyH
	 embwGoTaIwh2BLybnyTbh5EGXWKHg5MT4+vnf9xrh9iw4m6o5g/egaAGIVp6uuk/Lh
	 oZQq1lJSg1fM11xF7qGjIdfThGpAzT6ROFbeXvs/qjVdfrEoT0ETpr1iibQ9sWhH+V
	 y6LxarzZs/HDWnoCbFr5jzUGtvF7YgJrsU5h/0ejJ9Vmd18B9RW29646QUS3S3Or54
	 vFrnYixbcUWUuvHQcoDA5wdefreifwxnZA3mF2B4vtJpAyeO3V6w+Qx58e2KkMYouy
	 1zdXelibntzXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] clk: add TI CDCE6214 clock driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921-clk-cdce6214-v9-2-f2ea74fd38a2@pengutronix.de>
References: <20260921-clk-cdce6214-v9-0-f2ea74fd38a2@pengutronix.de>
 <20260921-clk-cdce6214-v9-2-f2ea74fd38a2@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 07:01:21 +0000
Message-Id: <20260921070121.A33001F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] clk: cdce6214: uninitialized memory used when regmap_read() fails
- [Medium] clk: cdce6214: integer overflow in pll_determine_rate() min check
- [Medium] clk: cdce6214: missing upper bound check allows silent truncatio=
n of PLL ndiv
- [Medium] clk: cdce6214: power leak in cdce6214_clk_pll_prepare() on lock =
timeout
- [Medium] clk: cdce6214: missing EEPROM boot delay after reset de-assertion
--

commit 3f176632480b02a9e90a4fa95363d1fa484107d5
Author: Sascha Hauer <s.hauer@pengutronix.de>
Subject: clk: add TI CDCE6214 clock driver

This commit introduces a new common clock framework driver for the TI=20
CDCE6214 clock synthesizer. It registers multiple clock components including
the PLL, outputs, and dividers.

> diff --git a/drivers/clk/clk-cdce6214.c b/drivers/clk/clk-cdce6214.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/clk-cdce6214.c
> @@ -0,0 +1,1594 @@
[ ... ]
> +static int cdce6214_clk_out_is_prepared(struct clk_hw *hw)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned int mask =3D cdce6214_clk_out_mask(clock->index);
> +	unsigned int val;
> +
> +	if (!mask)
> +		return -EINVAL;
> +
> +	regmap_read(priv->regmap, R4, &val);
> +
> +	return !(val & mask);

[Severity: High]
Is it possible for I2C transfers to fail here? If regmap_read() returns an=
=20
error, val will remain uninitialized, leading to undefined behavior when th=
e=20
mask is applied. Should the return value be checked?

[ ... ]
> +static unsigned long cdce6214_clk_pll_recalc_rate(struct clk_hw *hw,
> +						  unsigned long parent_rate)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned long ndiv, num, den;
> +	unsigned int val;
> +
> +	regmap_read(priv->regmap, R30, &val);
> +	ndiv =3D FIELD_GET(R30_PLL_NDIV, val);

[Severity: High]
Similar to above, if this read fails, could we end up calculating the rate=
=20
with garbage data from the stack and propagating a corrupted frequency to=20
the clock framework?

[ ... ]
> +static int cdce6214_clk_pll_determine_rate(struct clk_hw *hw,
> +					   struct clk_rate_request *req)
> +{
> +	if (!req->best_parent_rate)
> +		return -EINVAL;
> +
> +	req->rate =3D clamp(req->rate, CDCE6214_VCO_MIN, CDCE6214_VCO_MAX);
> +
> +	if (req->rate < req->best_parent_rate * CDCE6214_PLL_NDIV_MIN)

[Severity: Medium]
Does this multiplication risk overflowing on 32-bit systems?=20

If the parent rate is high (e.g., > 178.9 MHz), could the multiplication
req->best_parent_rate * CDCE6214_PLL_NDIV_MIN wrap around the 32-bit unsign=
ed=20
long, bypassing the lower bound check?

> +		return -EINVAL;
> +
> +	req->min_rate =3D CDCE6214_VCO_MIN;
> +	req->max_rate =3D CDCE6214_VCO_MAX;

[Severity: Medium]
Is an upper bound check also needed here to ensure the computed ndiv fits=20
into the 15-bit hardware maximum? If the parent clock is very low, it seems=
=20
a valid VCO rate could still result in an ndiv that is too large.

[ ... ]
> +static int cdce6214_clk_pll_prepare(struct clk_hw *hw)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +
> +	regmap_clear_bits(priv->regmap, R5, R5_PLL_POWER_BITS);
> +
> +	regmap_set_bits(priv->regmap, R0, RO_RECAL);
> +
> +	return cdce6214_wait_pll_lock(priv);

[Severity: Medium]
If the PLL lock times out, does this exit path leave the LDOs and VCO=20
permanently active? Would it make sense to roll back the R5_PLL_POWER_BITS=
=20
changes on error to prevent wasting power?

[ ... ]
> +static int cdce6214_clk_pll_set_rate(struct clk_hw *hw, unsigned long ra=
te,
> +				     unsigned long parent_rate)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned long ndiv, num, den;
> +	int ret;
> +
> +	ret =3D pll_calc_values(parent_rate, rate, &ndiv, &num, &den);
> +	if (ret < 0)
> +		return ret;
> +
> +	regmap_update_bits(priv->regmap, R34, R34_PLL_DEN_23_16,
> +			   FIELD_PREP(R34_PLL_DEN_23_16, den >> 16));
> +	regmap_update_bits(priv->regmap, R33, R33_PLL_DEN_15_0,
> +			   FIELD_PREP(R33_PLL_DEN_15_0, den & 0xffff));
> +	regmap_update_bits(priv->regmap, R32, R32_PLL_NUM_23_16,
> +			   FIELD_PREP(R32_PLL_NUM_23_16, num >> 16));
> +	regmap_update_bits(priv->regmap, R31, R31_PLL_NUM_15_0,
> +			   FIELD_PREP(R31_PLL_NUM_15_0, num & 0xffff));
> +	regmap_update_bits(priv->regmap, R30, R30_PLL_NDIV,
> +			   FIELD_PREP(R30_PLL_NDIV, ndiv));

[Severity: Medium]
If an out-of-bounds ndiv reaches this point, will it be silently truncated=
=20
by FIELD_PREP and written to the register, breaking the frequency=20
configuration?

[ ... ]
> +static int cdce6214_pinconf_get_xo_cload(struct cdce6214 *priv, unsigned=
 int pin)
> +{
> +	unsigned int val;
> +
> +	if (pin !=3D SECREF)
> +		return -EOPNOTSUPP;
> +
> +	regmap_read(priv->regmap, R24, &val);
> +
> +	val =3D FIELD_GET(R24_IP_XO_CLOAD, val);
> +
> +	if (val >=3D ARRAY_SIZE(ip_xo_cload))
> +		return -EINVAL;
> +
> +	return ip_xo_cload[val];

[Severity: High]
Is this another place where a failed I2C read could cause us to evaluate=20
uninitialized stack memory? It seems this could lead to returning random=20
elements.

[ ... ]
> +static int cdce6214_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct cdce6214 *priv;
> +	struct pinctrl_dev *pctl;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->client =3D client;
> +	priv->dev =3D dev;
> +	i2c_set_clientdata(client, priv);
> +	dev_set_drvdata(dev, priv);
> +
> +	priv->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LO=
W);
> +	if (IS_ERR(priv->reset_gpio)) {
> +		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> +				     "failed to get reset gpio\n");
> +	}
> +
> +	priv->regmap =3D devm_regmap_init_i2c(client, &cdce6214_regmap_config);
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "failed to init regmap\n");
> +
> +	ret =3D cdce6214_configure(priv);

[Severity: Medium]
Does the CDCE6214 require a brief boot delay after the reset de-assertion=20
to load its EEPROM before I2C communication begins? It looks like we call=20
cdce6214_configure() immediately, which might cause probe failures if the=20
hardware isn't ready.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-clk-cdce62=
14-v9-0-f2ea74fd38a2@pengutronix.de?part=3D2
