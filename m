Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B5F489868;
	Wed,  9 Sep 2026 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944971; cv=none; b=l+Sw1KfJUh7dTfhdpiYKXyNdSNyPElUMg/3MZ60KGBRicWHkqzndqIumaDO48lZ3O9wE5dSW7E/Gl5jcpyISDEHmgR3HbnNHnO7GMaBKTTOBl4Ee7RNTV8v3UHLpBBfIdsqrWKdDdTa7J1bbbsZqbMpQcZOPbzGLPkuubG3hA1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944971; c=relaxed/simple;
	bh=2zlVJWB97wCdBiN+v/U4QDSmp+HIyrtIL3KcFKJ1HZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sqTjCZE9GK9Wg4dD5CYlVbJD4E9DPmG7zsjhLfrfho40Df0S8tpxvfgpX2cmwepSD76lz/xQGJRmSCYSAZ2w1wersTTxJJEUrBWBRB8AZEq8UElwWC/gXkMyhG3uQgyi6dBc0o6LchFhvwVYOjp0VEETH+6H6JJx2b2hZrJbzng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NoeiB6C4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NoeiB6C4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC791F00A3A;
	Wed,  9 Sep 2026 09:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788944969;
	bh=4P1eDr7IU0NKjcTri30h5Z176GuwAWFDSO2H7VBG2DM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NoeiB6C4vv5QipiUWc6dqVW/qlGSQ7RZ5jZi/J+2ABiv/Rh8pF3lUFAZ5FlwMQQCu
	 LSmf8p4zXxzvWEWM1a+hqaXrhYjUsnbiEX86RGc7y4HhXE6fBdCPnACnx+MhMj1b28
	 fCxon+uMGkxUoDYSHY/BZWbItVPEU6xHoYxy3/q/4FY+RQfhsgn0pxGU1hkely6jB+
	 Jjapsjg4zIqTKXWa6SXy++vj6AeoyclTQ9Qqdt+xpqfAWmbJnGq29A4M7lxY5LfSC6
	 XDNJg7noaBazBRJvHHA/Db3Lu7zzf/PCd018b7bLcFc6QL41peL3jUkiuW2x/YoQLZ
	 HbKDhVS8jWF/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] clk: add TI CDCE6214 clock driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260909-clk-cdce6214-v8-2-4dfa355c1f65@pengutronix.de>
References: <20260909-clk-cdce6214-v8-0-4dfa355c1f65@pengutronix.de>
 <20260909-clk-cdce6214-v8-2-4dfa355c1f65@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 09:09:29 +0000
Message-Id: <20260909090929.7FC791F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [High] Severe copy-paste errors exist in pin configuration for IO standar=
ds on OUT3 and OUT4, corrupting unrelated registers.
- [High] Rate request callbacks do not sanitize zero inputs, leading to div=
ision by zero panics.
- [High] Clock registration for OUT0 uses the wrong parent array size, lead=
ing to stack out-of-bounds reads.
- [High] Incorrect rate calculation prevents usage of the 2x clock multipli=
er and causes CCF state desynchronization for OUT0.
- [High] Mismatched registers are used for getting and setting the parent c=
lock for OUT0.
- [High] The driver systematically ignores the return value of `regmap_read=
()`, resulting in the use of uninitialized stack memory when I2C transfers =
fail.
- [High] Clock math relies on 32-bit arithmetic (`unsigned long`), which wi=
ll integer overflow on 32-bit architectures at standard high frequencies.
- [Medium] Contradictory and flawed handling of CMOS N/P polarity and enabl=
e bits between OUT1 and OUT4.
- [Medium] Raw divisor values are passed into FIELD_PREP for a 2-bit mask i=
n PSA/PSB configuration.
- [Medium] Incorrect use of `do_div()` with an `unsigned long` divisor.
- [Medium] Unreasonably short timeout for I2C regmap polling in PLL lock.
- [Medium] Zero-initialized clk_parent_data element causes unintended fallb=
ack to DT index 0.
--

commit 3cfc7967fe6fb49dcdf0e635b82371b0f59bf24e
Author: Sascha Hauer <s.hauer@pengutronix.de>

clk: add TI CDCE6214 clock driver

The CDCE6214 is a Ultra-Low Power Clock Generator With One PLL, Four
Differential Outputs, Two Inputs, and Internal EEPROM. This patch adds
a common clk framework driver for this chip.

> diff --git a/drivers/clk/clk-cdce6214.c b/drivers/clk/clk-cdce6214.c
> new file mode 100644
> index 0000000000000..d012b79f37880
> --- /dev/null
> +++ b/drivers/clk/clk-cdce6214.c
> @@ -0,0 +1,1620 @@

[ ... ]

> +static int cdce6214_clk_out0_determine_rate(struct clk_hw *hw,
> +					    struct clk_rate_request *req)
> +{
> +	unsigned int div;
> +
> +	if (req->rate >=3D req->best_parent_rate)
> +		req->rate =3D req->best_parent_rate * 2;

[Severity: High]
Does this multiplication by 2 overflow a 32-bit unsigned long when the
VCO operates near its maximum limit of 2.625 GHz?

Also, does this branch lack an early return? If the consumer requests
the 2x multiplier rate, it appears to fall through and recalculate div,
inadvertently resetting the rate back to the 1x target.

[ ... ]

> +static u8 cdce6214_clk_out0_get_parent(struct clk_hw *hw)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned int val;
> +
> +	regmap_read(priv->regmap, R2, &val);
> +
> +	if (FIELD_GET(R2_REFSEL_SW, val) =3D=3D 2)
> +		return 1;

[Severity: High]
Is R2 the correct register here? cdce6214_clk_out0_set_parent writes
the mux state to R25. Operating on different registers prevents the
clock framework from accurately tracking the hardware parent state.

[ ... ]

> +static unsigned int cdce6214_get_out_div(unsigned long rate, unsigned lo=
ng parent_rate)
> +{
> +	unsigned int div;
> +
> +	div =3D divider_get_val(rate, parent_rate, NULL, 14, CLK_DIVIDER_ONE_BA=
SED);

[Severity: High]
Can rate be zero here? If a consumer requests a rate of 0 Hz,
divider_get_val() triggers a divide-by-zero panic internally when it
calls DIV_ROUND_UP_ULL(parent_rate, 0).

[ ... ]

> +static u8 cdce6214_clk_out_get_parent(struct clk_hw *hw)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned int val, idx;
> +
> +	switch (clock->index) {
> +	case CDCE6214_CLK_OUT1:
> +		regmap_read(priv->regmap, R56, &val);
> +		idx =3D FIELD_GET(R56_CH1_MUX, val);

[Severity: High]
If regmap_read() fails due to an I2C error, does val remain
uninitialized? This appears to feed stack garbage into FIELD_GET(),
eventually returning a non-deterministic hardware index to the clock core.

[ ... ]

> +static unsigned long cdce6214_clk_pll_recalc_rate(struct clk_hw *hw,
> +						  unsigned long parent_rate)
> +{

[ ... ]

> +	return parent_rate * ndiv + DIV_ROUND_CLOSEST(parent_rate * num, den);

[Severity: High]
Could parent_rate * num overflow on 32-bit architectures? A standard=20
parent rate multiplied by a large fractional numerator might easily
exceed the 32-bit unsigned long maximum limit.

[ ... ]

> +static int pll_calc_values(unsigned long parent_rate, unsigned long out,
> +			   unsigned long *ndiv, unsigned long *num, unsigned long *den)
> +{
> +	u64 a;
> +
> +	if (out < CDCE6214_VCO_MIN || out > CDCE6214_VCO_MAX)
> +		return -EINVAL;
> +
> +	*den =3D 10000000;
> +	*ndiv =3D out / parent_rate;

[Severity: High]
Can parent_rate be zero here if the upstream reference clock is disabled
or returns 0? This would result in a direct division by zero panic.

> +	a =3D out % parent_rate;
> +	a *=3D *den;
> +	do_div(a, parent_rate);

[Severity: Medium]
Is it safe to pass parent_rate (an unsigned long) to do_div()?
do_div() expects a 32-bit divisor, and passing a 64-bit value on
64-bit architectures causes silent truncation and type checking warnings.

[ ... ]

> +static int cdce6214_wait_pll_lock(struct cdce6214 *priv)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D regmap_read_poll_timeout(priv->regmap, R7, val,
> +				       val & R7_LOCK_DET, 0, 1000);

[Severity: Medium]
Is a 1000us timeout sufficient for I2C regmap polling? Since standard
100kHz I2C transactions take around 300us each, this timeout might only all=
ow
2 or 3 polling attempts and could result in spurious failures.

[ ... ]

> +static int cdce6214_clk_register(struct cdce6214 *priv)
> +{

[ ... ]

> +	init[CDCE6214_CLK_OUT0].ops =3D &cdce6214_clk_out0_ops;
> +	init[CDCE6214_CLK_OUT0].num_parents =3D ARRAY_SIZE(pdata_out);
> +	init[CDCE6214_CLK_OUT0].parent_data =3D pdata_out0;

[Severity: High]
Does this incorrectly use ARRAY_SIZE(pdata_out) (size 4) instead of
ARRAY_SIZE(pdata_out0) (size 2)? This instructs the clock framework to
read past the bounds of the 2-element stack-allocated array.

> +	init[CDCE6214_CLK_OUT0].flags =3D CLK_SET_RATE_NO_REPARENT;
> +
> +	pdata_out[0].hw =3D &priv->clk[CDCE6214_CLK_PSA].hw;
> +	pdata_out[1].hw =3D &priv->clk[CDCE6214_CLK_PSB].hw;
> +	pdata_out[3].hw =3D &priv->clk[CDCE6214_CLK_OUT0].hw;

[Severity: Medium]
Element pdata_out[2] is left uninitialized (all zeros). If the hardware
mux returns an index of 2, the zero-initialized entry instructs the
framework to fall back to DT index 0, which could create a bogus clock topo=
logy.

[ ... ]

> +static int cdce6214_clk_psx_set_rate(struct clk_hw *hw, unsigned long ra=
te,
> +				     unsigned long parent_rate)
> +{

[ ... ]

> +	switch (clock->index) {
> +	case CDCE6214_CLK_PSA:
> +		regmap_update_bits(priv->regmap, R47, R47_PLL_PSA,
> +				   FIELD_PREP(R47_PLL_PSA, div));

[Severity: Medium]
Does div (which can be 4, 5, or 6) exceed the bounds of the 2-bit
R47_PLL_PSA mask? Passing values larger than the mask field to
FIELD_PREP() is an API violation, even if bitwise truncation happens
to map to the correct register indices.

[ ... ]

> +static int cdce6214_pinconf_set_iostd(struct cdce6214 *priv, unsigned in=
t pin,
> +				      unsigned int param)
> +{

[ ... ]

> +	case OUT3:
> +		switch (param) {
> +		case CDCE6214_IOSTD_LVDS:
> +			regmap_set_bits(reg, R70, R70_CH3_LVDS_EN);
> +			regmap_clear_bits(reg, R68, R68_CH3_LPHCSL_EN);
> +			break;
> +		case CDCE6214_IOSTD_LP_HCSL:
> +			regmap_set_bits(reg, R70, R70_CH3_LVDS_EN);
> +			regmap_clear_bits(reg, R68, R65_CH2_LVDS_EN);
> +			break;

[Severity: High]
Should setting CDCE6214_IOSTD_LP_HCSL on OUT3 write to
R65_CH2_LVDS_EN? This appears to be a copy-paste error that writes
the wrong LVDS bits to an unrelated hardware register.

> +		}
> +		break;
> +	case OUT4:
> +		switch (param) {
> +		case CDCE6214_IOSTD_CMOS:
> +			regmap_clear_bits(reg, R75, R75_CH4_LVDS_EN);
> +			regmap_clear_bits(reg, R73, R73_CH4_LPHCSL_EN);
> +			break;
> +		case CDCE6214_IOSTD_LVDS:
> +			regmap_clear_bits(reg, R73, R73_CH4_LPHCSL_EN);
> +			regmap_set_bits(reg, R75, R75_CH4_LVDS_EN);
> +			break;
> +		case CDCE6214_IOSTD_LP_HCSL:
> +			regmap_clear_bits(reg, R75, R75_CH4_LVDS_EN);
> +			regmap_set_bits(reg, R72, R73_CH4_LPHCSL_EN);
> +			break;

[Severity: High]
Does setting CDCE6214_IOSTD_LP_HCSL on OUT4 inadvertently write R73
flags into R72? R72 controls the CH4 divider and muxing, which
corrupts unrelated settings.

[ ... ]

> +static int cdce6214_pinconf_set_cmosn_mode(struct cdce6214 *priv, unsign=
ed int pin,
> +					   unsigned int param)
> +{

[ ... ]

> +	/* Relevant fields are identical for register 59 and 75 */
> +	regmap_update_bits(priv->regmap, reg, R59_CH1_CMOSN_POL | R59_CH1_CMOSN=
_EN, val);

[Severity: Medium]
Are these fields truly identical? It appears that register 75 swaps the
positions of the N and P bits compared to register 59. This might cause the
wrong output leg to be enabled when configuring OUT4.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-clk-cdce62=
14-v8-0-4dfa355c1f65@pengutronix.de?part=3D2
