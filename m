Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CE44AC148;
	Tue, 15 Sep 2026 15:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486974; cv=none; b=MU4Z0QWW5rAUlh+zjGdM6m1k1gwWOvoO/nNWW3GnARZa6kRK28izr0dzp1VHDKav2oWuXk4iy7qHmgXbToDyMRHBFdWCENSWWoxA7/wAXXX9p/onGjNLj5j+az6o251mykIvpGSeUuaK2zVMX1b7tCAvIF0smFKDdtN7WP5etpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486974; c=relaxed/simple;
	bh=G9rsXUEn+iYA0gFCYudDC1EwCnJ3h5Rbna4+J/7Ko8E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gU5TprJryEclm6G3s+RSPF27kBLC9vWneWRuE1LL/3XA7xFXTipM1GZvRZnjgq6m3Skh5Pwukb3oTRlo3I64wniQdQBrxxxX1saOR3tjXFHe6QffrN6pcQnSF6HtU2IB5BnwCXvuZS2ZxK6Mqi+SS+dBjl0rzZms3hdTkuh2RMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTytRoDV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTytRoDV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C34F1F000FF;
	Tue, 15 Sep 2026 15:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789486972;
	bh=ccSY9K9uxYM1oSI+gBiTsIbZc/U86mLwcFMnuY4QCwg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gTytRoDVAFEtRuf5n1yWftyVuhg/Eh1T9+kAOIFDBGYIsZ0he7wduUL1I8eA18Cwx
	 q52H3R4CaLFXrkOMA0lUa6s1CeW4KCScCBz0m5TVwaVIrSedWT7SmmyH4WywBtlPX+
	 pmhyaFiExWZhVz0AGltnLBNYoIZnSmbSkqEhtEDOWQZhFOWcl7QSOyacNpqoHKchKF
	 dS6izIBSKzk8WdG2tzqOLWt2mMXEpOxgy4W5JGmW/jYRUIj7HqGDp6TItzCDpsCh2m
	 X6tTCywXIVNG5nvMLJvZjvCMl84WE8nftEbKMBt1JcebwiCF+FSF5xm8KW93Jj42Ku
	 CuISanhpZV1ZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 16/20] phy: Add common Innosilicon HDMI PHY helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: linux-clk@vger.kernel.org, mfd@lists.linux.dev, linux-phy@lists.infradead.org, lee@kernel.org, olteanv@gmail.com, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, vkoul@kernel.org, dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org
In-Reply-To: <20260915-jh7110-clean-send-v4-16-f0e4fd6f2cc8@samsung.com>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153242eucas1p1394a6a5e272f106b9cab2a0f709ddeb8@eucas1p1.samsung.com>
 <20260915-jh7110-clean-send-v4-16-f0e4fd6f2cc8@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 15:42:51 +0000
Message-Id: <20260915154252.0C34F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] phy: division by zero kernel panic in recalc_rate() on register re=
ad failure
--

commit 543e5d00d9e079829f4ad47de05248c127f81d1c
Author: Michal Wilczynski <m.wilczynski@samsung.com>

phy: Add common Innosilicon HDMI PHY helpers

This commit adds a common library for the Innosilicon HDMI PHY IP, which
is used by several SoCs. It extracts the pre-PLL configuration table
format, lookups, and clock rate helpers into shared code.

> diff --git a/drivers/phy/phy-inno-hdmi.c b/drivers/phy/phy-inno-hdmi.c
> new file mode 100644
> index 0000000000000..77e745a87d22b
> --- /dev/null
> +++ b/drivers/phy/phy-inno-hdmi.c

[ ... ]

> +unsigned long
> +inno_hdmi_phy_pre_pll_recalc_rate(const struct inno_hdmi_phy_pre_pll *pl=
l,
> +				  unsigned long parent_rate)
> +{
> +	u8 nd, no_a, no_b, no_d;
> +	unsigned long frac, rate;
> +	u64 vco, vco_rate;
> +	u16 nf;
> +
> +	nd =3D inno_read(pll, INNO_PRE_PLL_DIV_1) & INNO_PRE_PLL_PRE_DIV_MASK;
> +	nf =3D (inno_read(pll, INNO_PRE_PLL_DIV_2) &
> +	      INNO_PRE_PLL_FB_DIV_11_8_MASK) << 8;
> +	nf |=3D inno_read(pll, INNO_PRE_PLL_DIV_3);
> +	vco =3D parent_rate * nf;

[Severity: High]
This is a pre-existing issue, but does this code cause an integer overflow
on 32-bit architectures?

When inno_hdmi_phy_pre_pll_recalc_rate() executes, parent_rate * nf
multiplies two 32-bit integers, which could silently overflow before
assignment to the 64-bit vco variable.

> +
> +	if (!(inno_read(pll, INNO_PRE_PLL_DIV_2) &
> +	      INNO_PRE_PLL_FRAC_DIV_DISABLE)) {
> +		frac =3D inno_read(pll, INNO_PRE_PLL_FRAC_DIV_7_0) |
> +		       (inno_read(pll, INNO_PRE_PLL_FRAC_DIV_15_8) << 8) |
> +		       (inno_read(pll, INNO_PRE_PLL_FRAC_DIV_23_16) << 16);
> +		vco +=3D DIV_ROUND_CLOSEST(parent_rate * frac,
> +					 BIT(INNO_FRAC_DIV_WIDTH));

[Severity: High]
This isn't a bug introduced by this patch, but does parent_rate * frac
also massively overflow before rounding on 32-bit systems?

Since parent_rate is typically 24MHz and frac is a 24-bit divider, their
product exceeds the 32-bit maximum. This causes silent truncation and leads
to completely incorrect calculated VCO rates.

> +	}
> +
> +	vco_rate =3D vco;
> +
> +	if (inno_read(pll, INNO_PRE_PLL_CONTROL) & INNO_PCLK_VCO_DIV_5_MASK) {
> +		do_div(vco, nd * 5);

[Severity: High]
Can this result in a division by zero kernel panic?

inno_read() returns 0 if regmap_read() fails. If nd evaluates to 0 due to
an uninitialized register or a read failure, the denominator becomes 0.

> +	} else {
> +		no_a =3D inno_read(pll, INNO_PCLK_DIV_AB) & INNO_PCLK_DIV_A_MASK;
> +		no_b =3D FIELD_GET(INNO_PCLK_DIV_B_MASK,
> +				 inno_read(pll, INNO_PCLK_DIV_AB)) + 2;
> +		no_d =3D inno_read(pll, INNO_PCLK_DIV_CD) & INNO_PCLK_DIV_D_MASK;
> +
> +		do_div(vco, nd * (no_a =3D=3D 1 ? no_b : no_a) * no_d * 2);

[Severity: High]
Could this also trigger a division by zero crash?

If nd, no_a, or no_d evaluates to 0 due to read failures, the denominator
becomes 0.

The legacy RK3228 driver guarded against no_a being 0 with an explicit
check (if (!no_a) no_a =3D 1;), but it appears this protection was removed
when creating this shared code.

> +	}
> +
> +	rate =3D DIV_ROUND_CLOSEST((unsigned long)vco, 1000) * 1000;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-jh7110-cle=
an-send-v4-0-f0e4fd6f2cc8@samsung.com?part=3D16
