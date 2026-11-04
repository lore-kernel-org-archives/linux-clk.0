Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777648;
	b=G+YU9zeWhf6d90o9waqVPb+9jXhKE6yMry/VC3aH+muEM6cy7Kg80LsajqE9Vbrohccu
	 BM+b1tYrE+HheOfzdIjUejKSmNFAJTIM1Pc75YJxpbhu+SZm6DH4Ex0bT64F432b0ZN8w
	 Ise55QveFCQ7HQcX5LyCVRJ//PzUjzp+ThW7aoRYWWMMu37wV4IQtcn1z3OYw4ILIjcSI
	 EhqOJtM8WTAGdev4E8jZ0JqPVyRr87mNngMTVa0vGW86nPgdJVbKGDFzjatic3KnZGUfi
	 daP14OMQKQy2mu8Y0W6rIuHlkWevoM5JFbsHB+xYzEN4A0Qk+jafVAlaPMx8yL+2+GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777648;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=M8jgFGHooMW4aU/a48BiyWJlBXcCmjk95dZMKlMFJHY=;
	b=PydrlZoxAeJdyAFSOhkYc4I9W/TYn2WR3QGsJyVPNLJpafiQm1W1GO0ZbOzlS1fo0plL
	 F7M9aXQPVrULWgHOwZ3p79OedIDTmJYDW+J0aoEIc4g71sw+/8JuwQXStXzQi5wapghcT
	 4FnmXnveNNOOjUNoMHT8Us8EAFzy1ym3MJnyizfER74NkiblR86CRt2PhK0JYa5i5iM//
	 WCwjgMA6G+nZmMDxCsfv/psD5kEGIk5OU4IVnlgeKmOadmpsYD5wI8G1IIw2WCGXcc4Jv
	 JYMrZtNgJuLUlUeosOIzYr2DGp1RBjb4r5e5Q6PEG8cVdgBqu9I/xckWKgjqkttUPpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fPVie5SK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9028606A31B;
	Wed,  4 Nov 2026 07:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fPVie5SK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF831F000C1;
	Wed,  4 Nov 2026 07:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793777647;
	bh=M8jgFGHooMW4aU/a48BiyWJlBXcCmjk95dZMKlMFJHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fPVie5SKCJLUPbbkAhx2klMiDyuphor0dyYNXU7h1RH7uohjz/K6DlwsMAA2tpInY
	 LnACzUU/PSF95tYY16FewpUxi315jJezAU6Ir7mg751gvAt7b/Dr378jjvP/yyyLMe
	 gJ5JTPFDakVAxqQJveWG2CWEIqjUml/nr7dVDAulkKN4IfhJ5OciTI9jy6tDz7Lsjl
	 LdATyURsN9ZP5cDfoO/tqrjMPP42PdOlDX7wIFEBd6Wl4YVihGlOBoKq7yNpCvrWDF
	 n3HO+3edYOB8s5JPWSqHWCUhrIQ87FDqoHz0cGAUnezmXnI55bwMiSH97gGQna8Peb
	 jCrf495sWrloA==
Message-ID: <sashiko-outbox-196801@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] clk: siflower: Add SF19A2890 clock manager driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-sf19a2890-sysm-v1-2-a4fac07df823@telaak.dev>
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-2-a4fac07df823@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 07:34:06 +0000
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
- [High] clk: siflower: fractional term scaled by fbdiv in sf19a28_pll_reca=
lc_rate()
- [High] clk: siflower: divide by zero on rate 0 in sf19a28_muxdiv_determin=
e_rate()
--

commit d358931350f6daafe39bfeb8c6193c67ccee78b9
Author: Chuanhong Guo <gch981213@gmail.com>

clk: siflower: Add SF19A2890 clock manager driver

This commit adds an early clock driver for the Siflower SF19A2890 SoC,
supporting its CPU, DDR, and common PLLs as well as the downstream mux-divi=
der
clocks.

> diff --git a/drivers/clk/siflower/clk-sf19a2890.c b/drivers/clk/siflower/=
clk-sf19a2890.c
> new file mode 100644
> index 0000000000000..f7553ac49d66f
> --- /dev/null
> +++ b/drivers/clk/siflower/clk-sf19a2890.c

[ ... ]

> +static unsigned long sf19a28_pll_recalc_rate(struct clk_hw *hw,
> +					     unsigned long parent_rate)
> +{
> +	struct sf_clk_common *cmn_priv =3D hw_to_sf_clk_common(hw);
> +	struct sf19a2890_clk *priv =3D cmn_to_clk(cmn_priv);
> +	u32 refdiv =3D sf_pll_param_get(priv, PLL_REFDIV_HI, PLL_REFDIV_LO);
> +	u32 fbdiv =3D sf_pll_param_get(priv, PLL_FBDIV_HI, PLL_FBDIV_LO);
> +	u32 postdiv1 =3D sf_pll_param_get(priv, PLL_POSTDIV1_HI, PLL_POSTDIV1_L=
O);
> +	u32 postdiv2 =3D sf_pll_param_get(priv, PLL_POSTDIV2_HI, PLL_POSTDIV2_L=
O);
> +	u32 pll_pd =3D sf_readl(cmn_priv, priv->offset + REG_PLL_PD);
> +	u64 rate;
> +	u32 frac;
> +
> +	if (!refdiv || !postdiv1 || !postdiv2)
> +		return 0;
> +
> +	rate =3D (u64)(parent_rate / refdiv) * fbdiv;
> +
> +	if (!(pll_pd & PLL_PD_DSM)) {
> +		frac =3D sf_pll_param_get(priv, PLL_FRAC_HI, PLL_FRAC_LO);
> +		rate +=3D (rate * frac) >> PLL_FRAC_BITS;
> +	}

[Severity: High]
In sf19a28_pll_recalc_rate() in drivers/clk/siflower/clk-sf19a2890.c, when =
the
delta-sigma modulator is enabled (!(pll_pd & PLL_PD_DSM)), does multiplying
rate by frac scale the fractional component by an extra factor of fbdiv?

Because rate is already multiplied by fbdiv before the DSM check, computing
(rate * frac) >> PLL_FRAC_BITS evaluates to:

    ((parent_rate / refdiv) * fbdiv * frac) >> PLL_FRAC_BITS

For a fractional-N PLL, shouldn't the fractional term be scaled only by the
reference frequency (parent_rate / refdiv) rather than by the integer VCO
rate?

[ ... ]

> +static int sf19a28_muxdiv_determine_rate(struct clk_hw *hw, struct clk_r=
ate_request *req)
> +{
> +	unsigned int div;
> +
> +	div =3D DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);
> +	if (!div)
> +		div =3D 1;
> +	else if (div > MUXDIV_RATIO_MAX + 1)
> +		div =3D MUXDIV_RATIO_MAX + 1;
> +
> +	req->rate =3D req->best_parent_rate / div;
> +	return 0;
> +}
> +
> +static int sf19a28_muxdiv_set_rate(struct clk_hw *hw, unsigned long rate,
> +				   unsigned long parent_rate)
> +{
> +	struct sf_clk_common *cmn_priv =3D hw_to_sf_clk_common(hw);
> +	struct sf19a2890_clk *priv =3D cmn_to_clk(cmn_priv);
> +	unsigned int div;
> +
> +	div =3D DIV_ROUND_CLOSEST(parent_rate, rate);

[Severity: High]
Can sf19a28_muxdiv_determine_rate() and sf19a28_muxdiv_set_rate() in
drivers/clk/siflower/clk-sf19a2890.c divide by zero if a consumer calls
clk_round_rate(clk, 0) or clk_set_rate(clk, 0)?

In the common clock framework, clk_core_init_rate_req() initializes
req->min_rate to 0 by default, so a requested rate of 0 is passed directly
into sf19a28_muxdiv_determine_rate() as req->rate =3D=3D 0 without being cl=
amped.
Similarly, if req->rate evaluates to 0, clk_change_rate() can pass rate =3D=
=3D 0
to sf19a28_muxdiv_set_rate().

Should both functions guard against a zero target rate before calling
DIV_ROUND_CLOSEST()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-sf19a2890-=
sysm-v1-0-a4fac07df823@telaak.dev?part=3D2
