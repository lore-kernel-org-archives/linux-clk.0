Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0FC4AA006;
	Thu,  3 Sep 2026 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450681; cv=none; b=OGLBoS1Bu3BH4VYkBoyU4UAen3sb6daC/FXhQV5JgjuANuzEc3s82p3fAau87skjf/ZtI1yPQIc7nTgrvBRcLpRe3Kex2vuqI6pN7dkOSpUpa9nloDkh+uCgsF4eov1sdL3k34autzZDpZs1p9rLwA9XBDrIC5q/g7ANb+qfulg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450681; c=relaxed/simple;
	bh=gfV8lbxdOIUklmvVCKFw0CBK5E4ztLJwusEP7Qv29oI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OmSDCvZPXODwLDGqV7yI/qeyMvlLrdOAC6Vgi2i1j4T7646OkPuyyZDoS16UwcuNUFfCWVLamg6XVDyIK+sx+u8nuKwZu0YlVXKjhbwLTMuZxtxse/uj532AGCSxWScSXsP3E8L5sf4ZmVhUUi7Vug+4wu6KpDKtdAdFpR+ofXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmKMukAp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmKMukAp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA4C1F000E9;
	Thu,  3 Sep 2026 15:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788450679;
	bh=OkTZE4ypwPyLM5Qf7df3BuIci4sZOqTNp+6IhiqM/6U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KmKMukAprycX9mJrg/Y3F600M+PqwvsH7EseLIzWfghCl3kB3Mxwnj4KG9I7BnZHL
	 61wwM/Buu9l7iKqWblynGlISwnD2KSDi9IpIKlBK9OG12GxafO3uQrMszrgZRyxMUE
	 uB7tCG+LIlbtCiOnEVQisSa88weX7mXJH9wNdufyEeu4j/VIAF5/eE20VtvEn3vVtt
	 86QjP2FWSWDF2Rj4Tj/sq1PEUjFiB6+o4ha3rkHLen7U+dXfhgPKQjSncFpbdA0F0N
	 L4k1HWckJNiPWneOiry9I0/y3E8hxZdidoQNLDtNf1RdLQFc5RmklDUQobQvP5Lulx
	 21rFijRtn3jVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 4/4] clk: imx: pll14xx: support spread spectrum
 clock generation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: linux-clk@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260903153836.373267-5-dario.binacchi@amarulasolutions.com>
References: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
 <20260903153836.373267-5-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:51:19 +0000
Message-Id: <20260903155119.ADA4C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Potential 32-bit integer overflow in the numerator of the mrr ca=
lculation escapes bounds checking.
- [Medium] Invalid SSC configurations generate repeated warnings on every c=
lock rate change.
--

commit 769a49cba9b51c72357919447fa12a82a6548ced
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

    clk: imx: pll14xx: support spread spectrum clock generation
   =20
    Add support for spread spectrum clock (SSC) generation to the pll14xx
    driver.

> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index b6f1cc9f57005..5b187101c558c 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c

[ ... ]

> @@ -366,6 +377,58 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, =
unsigned long drate,
>  	return 0;
>  }
> =20
> +static void __clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
> +					       unsigned long parent_rate,
> +					       unsigned int pdiv,
> +					       unsigned int mdiv)
> +{
> +	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
> +	struct clk_spread_spectrum *conf =3D &pll->ss_conf;
> +	u32 sscg_ctrl, mfr, mrr, sel_pf;

[ ... ]

> +	if (!mfr || mfr > FIELD_MAX(MFREQ_CTL_MASK)) {
> +		pr_warn("%s: SSC disabled, modulation frequency (%u Hz) out of range\n=
",
> +			clk_hw_get_name(hw), conf->modfreq_hz);
> +		goto out;
> +	}
> +
> +	mrr =3D (conf->spread_bp * mdiv * BIT(6)) / (10000 * mfr);

[Severity: Medium]
Could this calculation overflow 32-bit arithmetic?

If conf->spread_bp from the device tree is a large invalid value, the
left-to-right evaluated multiplication conf->spread_bp * mdiv occurs
in 32-bit arithmetic before being promoted.

Furthermore, on 32-bit architectures where BIT(6) is a 32-bit type,
the entire numerator conf->spread_bp * mdiv * BIT(6) is evaluated in 32 bit=
s,
which can overflow for spread_bp values as low as 65600. This wrapped value
could then inadvertently pass the mrr > FIELD_MAX(...) bounds check that
follows.

While typical values are well within bounds, the commit message mentions
a goal of using 64-bit arithmetic to prevent 32-bit wrapping from
out-of-range DT values. It appears this code misses that protection
for spread_bp.

> +	if (!mrr || mrr > FIELD_MAX(MRAT_CTL_MASK)) {
> +		pr_warn("%s: SSC disabled, spread (%u permyriad) out of range\n",
> +			clk_hw_get_name(hw), conf->spread_bp);
> +		goto out;
> +	}
> +
> +	sscg_ctrl |=3D SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK, mfr) |
> +		FIELD_PREP(MRAT_CTL_MASK, mrr) |
> +		FIELD_PREP(SEL_PF_MASK, sel_pf);
> +
> +out:
> +	writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL);
> +}

[ ... ]

> +static int clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
> +					    const struct clk_spread_spectrum *ss_conf)
> +{
> +	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
> +	struct clk_hw *parent =3D clk_hw_get_parent(hw);
> +	unsigned long parent_rate =3D parent ? clk_hw_get_rate(parent) : 0;
> +	unsigned long flags;
> +	u32 div_ctl0;
> +
> +	spin_lock_irqsave(&pll->lock, flags);
> +
> +	pll->ss_conf =3D *ss_conf;

[Severity: Medium]
Will caching an invalid configuration here cause excessive log spam?

If an out-of-bounds spread spectrum configuration is provided, it is
unconditionally cached to pll->ss_conf and 0 is returned instead of an erro=
r.

Subsequent runtime calls to clk_pll1443x_set_rate() will re-evaluate this
cached invalid configuration via __clk_pll1443x_set_spread_spectrum(), which
will repeatedly trigger the un-ratelimited pr_warn() calls on every clock
rate change.

> +
> +	/*
> +	 * Apply the configuration to the hardware right away, using the
> +	 * current PLL dividers: the clock framework does not call set_rate()
> +	 * if the requested rate is unchanged, so relying on it would leave
> +	 * the SSC settings unapplied when the PLL is already at the target
> +	 * rate (e.g. configured by the bootloader).
> +	 */
> +	div_ctl0 =3D readl_relaxed(pll->base + DIV_CTL0);
> +	__clk_pll1443x_set_spread_spectrum(hw, parent_rate,
> +					   FIELD_GET(PDIV_MASK, div_ctl0),
> +					   FIELD_GET(MDIV_MASK, div_ctl0));
> +
> +	spin_unlock_irqrestore(&pll->lock, flags);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903153836.3732=
67-1-dario.binacchi@amarulasolutions.com?part=3D4
