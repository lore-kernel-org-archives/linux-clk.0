Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891721;
	b=KEnNXawEnbE5qy/pSqjAYDIWmbUwNzGTKREZAj+AnZqxhbH4H5447ba3WMRLSBP9GizR
	 rZf8lyioLuH7d30bWhbaYJAVxom1n+gatBhFO1nz2VhZcMZGe1Rmzhh6i2BM8dj0GTJ4a
	 xhnbf49oU7HnAtsWc6SRW/2A2fQQ1/qGVgYbQxNHDscY1xKY5L7ii3inmjx+wMINTSlDT
	 2/Ob/Ep3v3f4DqjSGY7ELBP94WP4h6aY2stfoXZ5wTWrDBdcRKEI9iqBPb3FiIx8TNqU9
	 qzIxz+0y/JNWb6Z5HB3se4JgWYm52rS7DqdVmk/F9tMLVH217c+NwkbNdqlmAjSAM+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891721;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PgZXR7N+Lmh+g3FBLJ08FaFY9HnoscyxkkpfJpigyZg=;
	b=0i2ZpA+V1RgiwyHOjm0iGK3mu/gw7dt8d+XYZkL9vstupFNvfwnnpu8VL5SEc9VmpWkQ
	 wceCo+xTVqCnR2Fq0wUXfSUmsR4GKbv7Y20/sdsEuYn0THrSJU2PF15Eh+Sk7sNrDBzJe
	 EwPTOoI3Ebi+02rDlL/2OsrUPAtS4PE8boPXHTTFGPzHJDrCBIu0QKe10/4ghsCgwTi7M
	 hy0Aijnz6ua7XqufHnQdkGWOINmGAkUvZrYfEF7hnvoudS3pJIZL0xvw4eZzupw9xsvUd
	 YaLXhpJmysy2xBKGEru/l8val1fMYUbAG3pJnoadqawC3FS2Yt8a4SW4HeWzDA2Ghbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VTJPaeFu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024DF606A331
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 15:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VTJPaeFu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAF91F000C1;
	Thu,  5 Nov 2026 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793891720;
	bh=PgZXR7N+Lmh+g3FBLJ08FaFY9HnoscyxkkpfJpigyZg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=VTJPaeFuRJ2m79HMLaAwYC8JdH1SF+AFYd+mXCU1fuA0moeQUc5jn6eGBg2iESL72
	 DEWgfWmj6Hna5FPWTbEOIn7ciWEn/iJkiwrPekMJuV4X6P9QS+cY3Bn26rameuCa3k
	 OYrhfSTsiGNaAVnDNT5GesvGT9EZ9H7qOLnfzR8ro0oV6kO3OhH8lUG90oMLy7tgVh
	 3CiKkXltUUQzaFM/e6WiMBi36LI09IvXF4JwwgPKmtK/F5YmbCP+gJeAvRC3EoaTKS
	 PvONpT+cWkOuy6dMzYPJ3kn/XuaibeSw5KuqJnRGrhWeo2Z9QarnXJcqu3AjunXEZj
	 IMUlT1kHUQyhQ==
Message-ID: <sashiko-outbox-199304@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] clk: en7523: add support for .set_rate for
 en7581
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org
In-Reply-To: <20261105150207.23023-3-ansuelsmth@gmail.com>
References: <20261105150207.23023-1-ansuelsmth@gmail.com>
 <20261105150207.23023-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 15:15:20 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: en7523: broken SPI rate lookup in en7581_get_vals_for_rate()
- [High] clk: en7523: unchecked divider_get_val() error in en7581_get_vals_=
for_rate()
--

commit 9938b50fa7a98aecdd2b2c8ce0469da6eedd9312
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for .set_rate for en7581

This commit adds .determine_rate and .set_rate callbacks for the Airoha
EN7581 clock controller using standard clock divider helpers and divider
tables for the BUS, SPI, and SLIC clocks.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 6640e814d36a4..cf0b6ccacede9 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c

[ ... ]

> @@ -338,6 +426,7 @@ static const struct en_clk_desc en7581_base_clks[] =
=3D {
>  		.div_shift =3D 8,
>  		.div_val0 =3D 40,
>  		.div_step =3D 2,
> +		.div_table =3D spi_div,
>  	}, {
>  		.id =3D EN7523_CLK_NPU,
>  		.name =3D "npu",
> @@ -775,11 +864,127 @@ static unsigned long en7581_recalc_rate(struct clk=
_hw *hw,
>  		return 0;
>  	}
> =20
> -	return rate / en7523_get_div(desc, val);
> +	if (desc->div_bits) {
> +		val >>=3D desc->div_shift;
> +		val &=3D (1 << desc->div_bits) - 1;
> +
> +		rate =3D divider_recalc_rate(hw, rate, val,
> +					   desc->div_table,
> +					   desc->div_flags,
> +					   desc->div_bits);
> +	}
> +
> +	return rate;
> +}
> +
> +static int en7581_get_vals_for_rate(struct clk_hw *hw,
> +				    const struct en_clk_desc *desc,
> +				    unsigned long rate,
> +				    u32 *base_val, u32 *div_val)
> +{
> +	struct device *dev =3D clk_hw_get_dev(hw);
> +	int tmp_base_val =3D 0;
> +	int tmp_div_val =3D 0;
> +
> +	if (!desc->base_bits && !desc->div_bits)
> +		return -EINVAL;
> +
> +	/* Search requested rate with every matching base rate + divisor */
> +	for (; tmp_base_val < desc->n_base_values; tmp_base_val++) {
> +		unsigned long parent_rate =3D desc->base_values[tmp_base_val];
> +		unsigned long tmp_rate =3D parent_rate;

[Severity: High]
Does en7581_get_vals_for_rate() in drivers/clk/clk-en7523.c always fail with
-EINVAL when called for EN7523_CLK_SPI via en7581_determine_rate() or
en7581_set_rate()?

In en7581_base_clks, EN7523_CLK_SPI defines a fixed .base_value =3D 4000000=
00
and leaves .base_bits and .n_base_values as 0:

	{
		.id =3D EN7523_CLK_SPI,
		.name =3D "spi",

		.base_reg =3D REG_SPI_CLK_DIV_SEL,

		.base_value =3D 400000000,

		.div_bits =3D 5,
		.div_shift =3D 8,
		.div_val0 =3D 40,
		.div_step =3D 2,
		.div_table =3D spi_div,
	},

When en7581_get_vals_for_rate() is called for EN7523_CLK_SPI,
desc->n_base_values is 0, so the for loop never executes and the check
tmp_base_val >=3D desc->n_base_values is immediately true, returning -EINVAL
for every SPI clock rate.

Should en7581_get_vals_for_rate() handle clocks where desc->base_bits is 0
by testing a single iteration with parent_rate =3D desc->base_value (similar
to how en7523_get_base_rate() handles !desc->base_bits)?

> +
> +		/*
> +		 * Simulate rate with every divisor supported
> +		 * 1. Search the divisor for the requested rate
> +		 * 2. Simulate the final rate with the new divisor
> +		 */
> +		if (desc->div_bits) {
> +			tmp_div_val =3D divider_get_val(rate, parent_rate,
> +						      desc->div_table,
> +						      desc->div_bits,
> +						      desc->div_flags);
> +			tmp_rate =3D divider_recalc_rate(hw, parent_rate,
> +						       tmp_div_val,
> +						       desc->div_table,
> +						       desc->div_flags,
> +						       desc->div_bits);
> +		}

[Severity: High]
What happens in en7581_get_vals_for_rate() in drivers/clk/clk-en7523.c when
divider_get_val() returns -EINVAL because DIV_ROUND_UP_ULL(parent_rate, rat=
e)
is not in desc->div_table?

Because tmp_div_val is passed to divider_recalc_rate() without checking for
a negative error code, _get_div() looks up (unsigned int)-EINVAL in
desc->div_table, fails to find a match, and returns 0. Since
CLK_DIVIDER_ALLOW_ZERO is not set in desc->div_flags, divider_recalc_rate()
triggers a WARN() and returns parent_rate:

drivers/clk/clk-divider.c:divider_recalc_rate() {
	div =3D _get_div(table, val, flags, width);
	if (!div) {
		WARN(!(flags & CLK_DIVIDER_ALLOW_ZERO),
			"%s: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set\n",
			clk_hw_get_name(hw));
		return parent_rate;
	}
}

This causes two problems on clocks using a clk_div_table (EN7523_CLK_BUS,
EN7523_CLK_SLIC, and EN7523_CLK_SPI):

First, evaluating a valid rate that is derived from a subsequent entry in
desc->base_values[] (such as 67.5 MHz on EN7523_CLK_BUS from 540 MHz / 8, or
a rate on EN7523_CLK_SLIC derived from slic_base[1] =3D 3.125 MHz) will fail
divider_get_val() on the first base rate and trigger a kernel WARN() before
moving on to the next base rate.

Second, if a caller requests a rate equal to parent_rate on a clock where
divisor 1 is not supported (for example, 600 MHz or 540 MHz on EN7523_CLK_B=
US
where divisor 1 is n/a in bus_div, or 100 MHz or 3.125 MHz on
EN7523_CLK_SLIC), divider_recalc_rate() returns parent_rate, which matches
tmp_rate =3D=3D rate. en7581_get_vals_for_rate() then succeeds with *div_va=
l set
to (u32)-EINVAL, and en7581_set_rate() writes the low bits of -EINVAL into
the hardware divider register via regmap_update_bits().

Should en7581_get_vals_for_rate() check if (tmp_div_val < 0) and continue to
the next base rate before calling divider_recalc_rate()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105150207.2302=
3-1-ansuelsmth@gmail.com?part=3D2
