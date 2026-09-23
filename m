Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AA1495504;
	Wed, 23 Sep 2026 18:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188926; cv=none; b=qNKtL7b3EGZqBjLTw8ld+UOuT898Wq7jmnFMLbbRjidIGj2E3cvviAUu7phIOr0HRBC4NeHw7iiLRYYUsuWt1Z1bXUbl6xnHWIpFbK5M8naqaBSbuIHVrH/J4/C90UKchcy5F7tzsPEuP2m1xgqhCvBxbaG2MpnCWkUCVW9VLB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188926; c=relaxed/simple;
	bh=oq9m92o6w9sZRBrmawFn+n0rCYT5VmXenCBOW43xTeU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GWYsHEoF86i/T9b9jY5cIycf9gR0BFu4rjSOCULnqWC7lEP1IKEZesWr7vc0oZIhITI/5p21SjNhOa+5ri8jl8Jab0vl+AnVAGYpQlU1fqBaPRIRJDNfRJVILrGYuVs8THbtEQFbPDk0+bunGXgCiO6RVfc2ezByQRaZflWuOPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mO+b/PQ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mO+b/PQ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F1C1F000FF;
	Wed, 23 Sep 2026 18:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790188925;
	bh=CLXnsVVcSPkhF7h8dHKlhuo4Ss7UfHsEXXx8kfXdW60=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mO+b/PQ9oPMQT4wsPcASUhT4kB8nXrtcIXzwH/3H44bGB8Zvo4xK4CeXV/TGM/lyO
	 xhDxN7b1gJ6tcOtA6PqSIsVgPl32/o1sePi4ckUaFuIsR5Vtvs8qqS3jIHC3NVIqKx
	 faw0ZkPZkmdQc+rQQim0p2K7WRVVH80jyv47gsPFgCXDKesDEgQJs89khUht2hdneN
	 CSoEw5Kj4QPrwWgRgAjEH+h4RklNFvm6Wzx0DRkS4PmMtv1GuhQmNJd4/eD9AeoiHJ
	 hamzIBscKJbnmPKJXC6gjAIZV3JQ7HSXAKUSYwDnL3aIuHCWJ3Lb7iXSCBXuUPcP4e
	 onbgysd0Mcpfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 07/12] clk: zte: Add zx PLL support infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, lee@kernel.org, linux-clk@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org
In-Reply-To: <20260923-zx29clk-v12-7-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
 <20260923-zx29clk-v12-7-9c243796b6d2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:42:04 +0000
Message-Id: <20260923184204.82F1C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: zte: set_rate rejects valid rates due to strict VCO bounds =
check
--

commit 03d27f14b3d2dbba9c34e624628df45495020947
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Add zx PLL support infrastructure

This patch adds code to decode and program PLL settings on ZTE's
zx297520v3 SoC.

> diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
> index fc76c6524a163..d3687495d06ce 100644
> --- a/drivers/clk/zte/pll-zx.c
> +++ b/drivers/clk/zte/pll-zx.c
[ ... ]
> +static u32 zx29_pll_calc_values(const struct zx29_clk_pll *pll, unsigned=
 long parent_rate,
> +				unsigned long rate, unsigned long min_rate, unsigned long max_rate)
> +{
[ ... ]
> +	for (j =3D 1; j <=3D postdiv2_max; j++) {
> +		for (i =3D 1; i <=3D postdiv1_max; i++) {
> +			u64 vco =3D (u64)rate * i * j;
> +			unsigned long out;
> +
> +			if (vco > ZX29_PLL_VCO_MAX_FREQ || vco < ZX29_PLL_VCO_MIN_FREQ)
> +				continue;

[Severity: Medium]
Will this strict bounds check reject valid rates during zx29_pll_set_rate()?

If the requested target rate maps to a VCO frequency at the very bottom edg=
e of
the valid bounds (e.g. exactly 900 MHz), the rational approximation for the
dividers could produce an actual VCO frequency just below 900 MHz.

When zx29_pll_determine_rate() returns this slightly truncated output rate,=
 it
is then passed to zx29_pll_set_rate() which passes it back to this function.

At that point, the recalculated VCO will fall slightly below
ZX29_PLL_VCO_MIN_FREQ and be strictly rejected.

[ ... ]
> +static int zx29_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			     unsigned long parent_rate)
> +{
> +	struct zx29_clk_pll *pll =3D to_zx29_clk_pll(hw);
> +	u32 setting;
> +
> +	/*
> +	 * TODO: Implement gradual PLL rate change. PLLs can be changed while t=
hey are running and
> +	 * downstream hardware is generally fine with that. The exception is DR=
AM, which reads
> +	 * incorrect values if changed too fast.
> +	 *
> +	 * Changing the mpll rate is potentially useful for over/underclocking.=
 Gating mpll is
> +	 * unrealistic because too many devices depend on it.
> +	 */
> +	setting =3D zx29_pll_calc_values(pll, parent_rate, rate, rate, rate);

[Severity: Medium]
Since zx29_pll_calc_values() can fail due to the strict VCO bounds check, d=
oes
this cause zx29_pll_set_rate() to unexpectedly return -EINVAL for a rate th=
at
was just validated by zx29_pll_determine_rate()?

This breaks the Common Clock Framework (CCF) contract, which expects set_ra=
te()
to succeed when passed a rate validated by determine_rate(). Could this cau=
se
regressions through unexpected driver probe failures?

> +	if (!setting)
> +		return -EINVAL;
> +
> +	dev_dbg(pll->dev, "%s: Setting new configuration: 0x%08x\n", clk_hw_get=
_name(hw), setting);
> +
> +	return regmap_update_bits(pll->map, pll->reg, 0x00ffffff, setting);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-zx29clk-v1=
2-0-9c243796b6d2@gmail.com?part=3D7
