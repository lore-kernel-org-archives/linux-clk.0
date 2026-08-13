Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72F43B2D00;
	Thu, 13 Aug 2026 10:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615810; cv=none; b=YK0SyMXoVAeXDDbraVwt4U+3KHXwjyrn2nSaTpXvRatZvLkGEqKbfC9UIoAIA4oYTHsQAaFa44A7SkkcQaqat/AmHjHeqrSarBr0kEZnde63T/9X35JOIuHQwD+OfHxQj7OQte9Gc0DDlNWeW3l1wboajWED1aIlGmvqSbrkyt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615810; c=relaxed/simple;
	bh=7206dMFxUoVb74j6j3jILW6/qtWkA8ZAX+/eZQ4VWF0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YzCnZp0uSv8hjALr/WQ1pahuv4c8xIeAC13XdiRljqtMkKTzd4jHPz3SS/L9/vQDhxE6zvp1JV+nV4dbe6rNSJnmFe7Xp3molU4npJwTxzQJGAVruXtN4tD4JK+m1XnA3gccbD1Q+vv018TtP4L7weqki6Bc/XPV0ZAz+DBOUCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+pS8844; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+pS8844"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1745F1F000E9;
	Thu, 13 Aug 2026 10:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786615807;
	bh=Xs4qR1uSpwbjf2Zhq8cyXTfQTqrgNSc/HqCFH4k6ODo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O+pS8844IQei5u2MxR+do9q9aGXUfBr6af+j9hma0LFXBD0yhNWfbNNKhqxBvm8Pm
	 Db1A9W5IRt91DfXORJIle4T/Bes+EViMVHLP+n6KCq0CKjKk3wT1s0HwuVnxSGJumA
	 FZdpb0YkMTMoV0XraDI8181HJdgGpZDHiwMw66AyiY+GwdD0Z+g5saR8Ny5j3s3V/Q
	 cgmg/Y1IvrhLco0CdUm3JCIr+DP/H8Rz66sWfaI3/dqnPVYUqPouOg8u//DE7p+f3Z
	 A3WSgIpU4DaNp1Hwm2AxaGYO6G5rPhfU2rbeY2RJX/3sBYQwxmgA7ZEmWyn0jlgo96
	 CBnZzUc2/oi7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] clk: ambarella: add CV75 CCU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260813-cv75-v3-a-v3-4-cfdd20b1b4dd@ambarella.com>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
 <20260813-cv75-v3-a-v3-4-cfdd20b1b4dd@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 10:10:06 +0000
Message-Id: <20260813101007.1745F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] VCO range iteration underflows and corrupts the PLL CTRL3 register=
 if `fvco_mhz` evaluates to 0.
- [High] `amb_pll_calc_params` omits the feedback and output dividers (`fsd=
iv` and `fsout`) when determining parameters, resulting in drastically inco=
rrect clock frequencies.
- [High] Division by zero kernel panic in `amb_pll_calc_params()` when the =
parent clock rate is zero.
- [Medium] Setting the rate of a non-ONE_BASED divider to 0 permanently dis=
ables the clock due to an incorrect mask.
- [Medium] `amb_pll_determine_rate` unnecessarily restricts integer PLL rat=
es to multiples of `parent_rate / 2`.
- [Low] Passing a 64-bit divisor to `DIV_ROUND_CLOSEST_ULL` causes a build =
failure on 32-bit architectures.
--

--- Patch [4]: [PATCH v3 4/6] clk: ambarella: add CV75 CCU driver ---
commit 434160130974a0a15aae2d546aa85876cbc1fe59
Author: Long Zhao <longzhao@ambarella.com>

clk: ambarella: add CV75 CCU driver

Add the Ambarella CV75 clock driver covering the core PLL and the
UART0 / AHB / APB clocks needed for early console bring-up.

> diff --git a/drivers/clk/ambarella/ccu_mux_div.c b/drivers/clk/ambarella/=
ccu_mux_div.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/ambarella/ccu_mux_div.c
[ ... ]
> +static int amb_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
[ ... ]
> +	if (!rate) {
> +		/* Assert the reset/disable bit above the divider field. */
> +		val =3D BIT(div->width);
> +		mask =3D clk_div_mask(div->width + 1);
> +	} else {
> +		val =3D divider_get_val(rate, parent_rate, NULL,
> +				      div->width, div->flags);
> +		if (val < 0)
> +			return val;
> +
> +		mask =3D (div->flags & CLK_DIVIDER_ONE_BASED) ?
> +			clk_div_mask(div->width + 1) : clk_div_mask(div->width);

[Severity: Medium]
When setting the rate to 0, the driver asserts the reset/disable bit above
the divider field. When a non-zero rate is subsequently requested, this log=
ic
uses a mask that strictly covers only the divider field.

Will this exclude the higher disable bit during the update, leaving the clo=
ck
permanently disabled?

> +	}
> +
> +	regmap_update_bits(div->map, div->offset, mask << div->shift,
> +			   val << div->shift);
[ ... ]
> diff --git a/drivers/clk/ambarella/ccu_pll.c b/drivers/clk/ambarella/ccu_=
pll.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/ambarella/ccu_pll.c
[ ... ]
> +static int amb_pll_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
> +{
> +	struct amb_pll *pll =3D to_amb_pll(hw);
> +	unsigned long half_refclk =3D req->best_parent_rate / 2;
> +
> +	if (pll->frac_mode)
> +		return 0;
> +
> +	if (!half_refclk)
> +		return -EINVAL;
> +
> +	req->rate =3D roundup(req->rate, half_refclk);

[Severity: Medium]
Does clamping the requested rate to a multiple of half_refclk artificially
restrict the hardware's capabilities?

Because the hardware sout divider supports ranges up to 16, it looks like it
could natively support a wide and fine-grained selection of exact integer
frequencies instead of being clamped this way.

> +
> +	return 0;
> +}
> +
> +static int amb_pll_calc_params(struct amb_pll *pll, unsigned long rate,
> +			       unsigned long parent_rate, u32 ctrl2_val,
> +			       u32 *intp, u32 *sdiv, u32 *sout,
> +			       u32 *vcodiv, u32 *fsdiv, u32 *fsout)
> +{
[ ... ]
> +	max_numerator =3D soc_data->vco_max_mhz;
> +	max_numerator =3D div_u64(max_numerator * 1000000ULL, parent_rate);

[Severity: High]
In amb_pll_determine_rate(), if the PLL is in frac_mode, it returns 0
immediately without validating if half_refclk is zero:

static int amb_pll_determine_rate(...) {
        ...
        if (pll->frac_mode)
                return 0;

        if (!half_refclk)
                return -EINVAL;
        ...
}

If a zero-rate parent clock reaches amb_pll_calc_params(), will this
division by zero trigger a kernel panic?

> +	max_numerator =3D div_u64(max_numerator, *vcodiv * *fsdiv);
> +	max_numerator =3D min(128UL, max_numerator);
> +	if (!max_numerator)
> +		return -EINVAL;
> +
> +	max_denominator =3D AMB_PLL_MAX_SOUT;
> +	rate_tmp =3D rate;
> +	rational_best_approximation(rate_tmp, parent_rate, max_numerator,
> +				    max_denominator, &intp_ul, &sout_ul);

[Severity: High]
The hardware frequency depends on fsdiv and fsout, but this call requests an
approximation using just rate and parent_rate.=20

If the hardware is left in a state where fsdiv and fsout are not identical,
will the resulting frequency be scaled incorrectly and bypass the refinement
loop?

> +
> +	while (parent_rate * *fsdiv * intp_ul * *sdiv / *fsout / sout_ul >
[ ... ]
> +static int amb_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
[ ... ]
> +	old_rate =3D amb_pll_recalc_rate(hw, parent_rate) * pll->fix_divider;
> +	rate_tmp =3D old_rate > rate ? 0 : rate - old_rate;
> +	if (rate_tmp && pll->frac_mode) {
> +		u64 dividend, divider;
> +
> +		dividend =3D (u64)rate_tmp * sout * fsout;
> +		dividend <<=3D 32;
> +		divider =3D (u64)sdiv * fsdiv * parent_rate;
> +		frac_val =3D DIV_ROUND_CLOSEST_ULL(dividend, divider);

[Severity: Low]
The divider variable evaluates to a 64-bit integer, but
DIV_ROUND_CLOSEST_ULL() invokes do_div() which expects a 32-bit divisor on
32-bit architectures.

Will this trigger a __div64_32 link failure under COMPILE_TEST?

> +		regmap_write(pll->map, reg[FRAC_OFFSET], frac_val);
> +		ctrl_val |=3D CTRL_FRAC_MODE;
> +	}
> +
> +	if (soc_data->pll_version >=3D 2) {
[ ... ]
> +	} else {
> +		u32 fvco_mhz, range;
> +
> +		fvco_mhz =3D amb_pll_calc_vco(pll, parent_rate) / 1000000UL;
> +		for (range =3D 0; range < ARRAY_SIZE(soc_data->vco_range);
> +		     range++) {
> +			if (fvco_mhz > soc_data->vco_range[range])
> +				break;
> +		}
> +		range =3D ARRAY_SIZE(soc_data->vco_range) - range - 1;
> +
> +		regmap_read(pll->map, reg[CTRL3_OFFSET], &ctrl3_val);
> +		ctrl3_val &=3D ~CTRL3_VCO_RANGE_MASK;
> +		ctrl3_val |=3D range << 1;

[Severity: High]
If the PLL parent rate is exceptionally low (e.g., from a dummy clock),
fvco_mhz can evaluate to 0. Since 0 is not strictly greater than any range
minimum, the loop finishes at 4.

Will the subsequent calculation 4 - 4 - 1 underflow to 0xFFFFFFFF and
corrupt the CTRL3 register bits?

> +		regmap_write(pll->map, reg[CTRL3_OFFSET], ctrl3_val);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-cv75-v3-a-=
v3-0-cfdd20b1b4dd@ambarella.com?part=3D4
