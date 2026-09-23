Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AA149BD6A;
	Wed, 23 Sep 2026 11:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162826; cv=none; b=tyHkeqhhcbLddEVlWYxKRDqaT9rH4Z+Jhnk9rXxHEU3ypjd7MS/q4Tg9dTYc3mJ+SmS7UOuLng3XqdIFNTNIz4S1j2JGKalSG4aWGehmjCP+u/aMcQ6gvrcELz07okANN7qjneBnlFMs1BSU8AnzdDvrVa2xFN/pKWS5/8uPY6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162826; c=relaxed/simple;
	bh=06ukY6DI+yCW2nbj3H003UgQahYCNCHfp2zSXTeQO8c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aF2unEoOp4PtDk2o5+kw5l72LdhmuU64StfB74ZQjLdl2y9oYgW/rlocXIIrQ2nGbcT7W7UG6fVOkxmQCJHwMiqIw+ruyTAMsC/HvwSquwDYP6Ykg3uKc362XS9wiaPMRoEJuFuzqz2WYy5M167pn0FY/KhHNLvX7AjPgErPQ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aODYLeHQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aODYLeHQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A02B1F000FF;
	Wed, 23 Sep 2026 11:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790162819;
	bh=+LxFcEd5n3YmVBBGdksS9bGfa7jabHQS4QFMq1GBl8k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aODYLeHQPOE4FLgiTUWOVnDHIHXTOXfQlXCv8lAEEiFiv1gmWn9u5c1Q1TiTGloTO
	 Fs9lwCWCsc7J34GIdKTe3C2WlkWDaXP8/HRYYLmNhVwp8KvHJwz2i6cEY6lvrOoCMS
	 cK0RmhqhADpHb9tfHfNZ5AeI2HYGPxrBDwheUlh1NNUAdA+IPJeTZt2kmKJbuyDyw3
	 fb8YIWJFqxxTufgbXjbMYoKV06FModuiOO6imVDOWLAr52oCVMAPdYeAJl14qJTen+
	 sZmFsVtTTQtzzE0A3q3kPDlxnj4YwX3cgOd9TSyY+dkuPZgRrTG4Z2gW0N8UTh1yuL
	 n7ZtECcfJD3+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 3/3] clk: meson: t7: Model PLL pre-divider as a
 divider clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jian Hu" <jian.hu@amlogic.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260923-meson_refactor_n-v1-3-3a8ce27121a2@amlogic.com>
References: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
 <20260923-meson_refactor_n-v1-3-3a8ce27121a2@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 11:26:59 +0000
Message-Id: <20260923112659.8A02B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: meson: t7: PLL pre-dividers permanently stuck at 0 due to mis=
sing CLK_SET_RATE_PARENT
- [Low] clk: meson: build failure in drivers after struct meson_clk_pll_dat=
a change
--

commit 03f0a62ef49427b4fecb0de15b51e80cb45be623
Author: Jian Hu <jian.hu@amlogic.com>

clk: meson: t7: Model PLL pre-divider as a divider clock

This commit replaces the dedicated PLL pre-divider with a standalone
divider clock in the Meson T7 clock driver. The PLL DCO clocks are=20
updated to take the new pre-divider clock as their parent instead of=20
the input clock directly.

> diff --git a/drivers/clk/meson/t7-pll.c b/drivers/clk/meson/t7-pll.c
> index 0a622f45fa368..049f0c879c458 100644
> --- a/drivers/clk/meson/t7-pll.c
> +++ b/drivers/clk/meson/t7-pll.c
> @@ -71,6 +71,34 @@
>  #define MCLK_PLL_CNTL4		0x10
>  #define MCLK_PLL_STS		0x14
> =20
> +static const struct clk_div_table t7_prediv_div_table[] =3D {
> +	{ .val =3D 1, .div =3D 1 },
> +	{ /* sentinel */ }
> +};
> +
> +static struct clk_regmap t7_gp0_prediv =3D {
> +	.data =3D &(struct clk_regmap_div_data){
> +		.offset =3D GP0PLL_CTRL0,
> +		.shift =3D 10,
> +		.width =3D 5,
> +		.table =3D t7_prediv_div_table,
> +		/*
> +		 * The hardware reset value is 0. Allow it during clock registration
> +		 * to avoid a warning from the common divider code.
> +		 * set_rate() will program the valid divider value (1).
> +		 */
> +		.flags =3D CLK_DIVIDER_ALLOW_ZERO,

[ ... ]

> @@ -97,11 +125,6 @@ static struct clk_regmap t7_gp0_pll_dco =3D {
>  			.shift   =3D 0,
>  			.width   =3D 8,
>  		},
> -		.n =3D {
> -			.reg_off =3D GP0PLL_CTRL0,
> -			.shift   =3D 10,
> -			.width   =3D 5,
> -		},

[Severity: Low]
When removing the .n parameter initialization here (and presumably from
struct meson_clk_pll_data in a prerequisite commit), does this patch series
also update other Meson drivers like drivers/clk/meson/gxbb.c and
drivers/clk/meson/axg.c?=20

Looking at other drivers in the tree, they appear to still statically
initialize .n in their declarations:

drivers/clk/meson/gxbb.c:gxbb_fixed_pll_dco() {
        ...
        .n =3D {
            .reg_off =3D HHI_MPLL_CNTL,
            .shift   =3D 9,
            .width   =3D 5,
        },
        ...
}

Will leaving these initializations in place cause a build failure with a
'has no member' error for those drivers?

>  		.l =3D {
>  			.reg_off =3D GP0PLL_STS,
>  			.shift   =3D 31,
> @@ -119,8 +142,8 @@ static struct clk_regmap t7_gp0_pll_dco =3D {
>  	.hw.init =3D &(struct clk_init_data){
>  		.name =3D "gp0_pll_dco",
>  		.ops =3D &meson_clk_pll_ops,
> -		.parent_data =3D &(const struct clk_parent_data) {
> -			.fw_name =3D "in0",
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_gp0_prediv.hw
>  		},
>  		.num_parents =3D 1,
>  	},

[Severity: High]
Since the pre-divider relies on .set_rate() to correct the invalid
hardware reset value of 0, will the common clock framework ever actually
call .set_rate() on the pre-divider?

Without adding the CLK_SET_RATE_PARENT flag here on the DCO clock
(t7_gp0_pll_dco), rate requests to the DCO won't propagate up to the
pre-divider. Could this leave the pre-divider stuck at the invalid 0 state
and permanently prevent the PLL from functioning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-meson_refa=
ctor_n-v1-0-3a8ce27121a2@amlogic.com?part=3D3
