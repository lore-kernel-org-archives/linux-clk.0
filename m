Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954122;
	b=ApS2qyExtsxw1dvUKy2geCGbQj+oLqbmpko/Eo0LTIKpOXFEqEXAkudaPyFm3h1VUttb
	 37AgRMJ/63pRe5Ur/YN54WoIaxQsQ5IvHQdbWBagUZ+r/XRsUlse4X8uzUHe9Vyvob09I
	 ++4tMcFeMAAqnQL0IyBDM3/jKviw9ifztRONIK8jSt8dpQEkxntJIrHJTDUN57GxjKrLO
	 rSbVRDOOqnb1qJ5lj6aQvN46xhgR78kigtsYYNAh4In/BvD/gmO/Li8vSvvSaLvr8rpbF
	 4KBFqunilMB5Q0B20sZu+04CmYu+JjLt7b88FTmAQj6YorJ5lFoYIoKxDAOxmhgd8UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954122;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=f3PG1p+JcFz4gGeGrXXjHJetKWIiSij3xc+yaIrEX1o=;
	b=SSmu+uLhVN+NnFBP3i/4U2+0BibCOvf5xZvvLV2X1HoOaN8DJk8mOV52OfsIQXYHfudc
	 h9BueulOKClnXEXzxYNNDI8fRAhphA92irUbujsCzELjo5zXESjyHlrt579NrAOWZ0U9J
	 C/T5xfOSlm+vNtlpEYp5z0GoUjv8dXb0uZnDSVgJQ01Tbuqhpe1aoL+7YVqwZnhi2/HjJ
	 pkaAbcdpECfCZ1qI2wzui3bUauV5/88E2WtB84CHWGXPyalBAR3GOiOtF1YtMs77qKHij
	 GgIvWx+VPIJpvBDzrKw05CJ4khNFAqk8Wjp8wTASSmKxpCGmG/BijhNEBwdbc0aJMkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XHNjp+vt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CFA606A32C;
	Fri,  6 Nov 2026 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XHNjp+vt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB0B1F008A3;
	Fri,  6 Nov 2026 08:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793954121;
	bh=f3PG1p+JcFz4gGeGrXXjHJetKWIiSij3xc+yaIrEX1o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XHNjp+vtPW+YXFY8uhIbZ4nb8t2tISru5MOO0SiWR30+lKr8gYkQQHi8TZbJablBi
	 kWZNcUFEcPUjRBH2BpmWB8O3eXekvqlUxO7bTOy7nVVAxMnwPCHtLvTORNX3SjCAVZ
	 u523B1NKo/fPdCqw95ZSAOnn/VVLuD2Lg+9PJpnH0HQjmpTF0BMv/tcK8lG4CahW2g
	 OhPv/othBFWV47/tPYJD4F4wOEGGQP9kGLYtvWECI3WA6085JFkFoBAdtVBd28AWlL
	 9fMNHC0YmrHXPXIB6UlVfSqwnpH5waVhcBUfaJipAPaectPQlxN6j3r7EQZNtKbzUF
	 vtdnz/+VS2wog==
Message-ID: <sashiko-outbox-201071@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] clk: meson: pll: Support PLLs without a pre-divider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Carlo Caione" <ccaione@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:35:20 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] clk: meson: 32-bit integer overflow in
  meson_clk_get_pll_range_index() [1]
--

commit 241035ecfdb206acdcf290a5e288104a056a3f8b
Author: Carlo Caione <ccaione@baylibre.com>

clk: meson: pll: Support PLLs without a pre-divider

This commit makes the PLL pre-divider parameter optional in the common Meson
PLL driver, defaulting the divider to 1 when the parameter is not applicabl=
e.

> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 1ea6579a760f3..44b33051405f5 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c

[ ... ]

> @@ -174,7 +176,7 @@ static int meson_clk_get_pll_range_index(unsigned lon=
g rate,
>  	*n =3D index + 1;
> =20
>  	/* Check the predivider range */
> -	if (*n >=3D (1 << pll->n.width))
> +	if (*n >=3D (MESON_PARM_APPLICABLE(&pll->n) ? 1 << pll->n.width : 2))
>  		return -EINVAL;
> =20
>  	if (*n =3D=3D 1) {

[Severity: High]
This problem wasn't introduced by this patch, but can `pll->range->max *
parent_rate` in meson_clk_get_pll_range_index() and `parent_rate * m` in
__pll_params_with_frac() overflow 32-bit unsigned long arithmetic [1]?

drivers/clk/meson/clk-pll.c:meson_clk_get_pll_range_index() {
	...
	if (*n =3D=3D 1) {
		/* Get the boundaries out the way */
		if (rate <=3D pll->range->min * parent_rate) {
			*m =3D pll->range->min;
			return -ENODATA;
		} else if (rate >=3D pll->range->max * parent_rate) {
			*m =3D pll->range->max;
			return -ENODATA;
		}
	}
	...
}

drivers/clk/meson/clk-pll.c:__pll_params_with_frac() {
	...
	/* Bail out if we are already over the requested rate */
	if (rate < parent_rate * m / n)
		return 0;
	...
}

On 32-bit architectures, multiplying a 24 MHz `parent_rate` by a typical
multiplier (such as `pll->range->max` of 250) reaches 6,000,000,000 and wra=
ps
around 32-bit `ULONG_MAX`.  This causes the range check in
meson_clk_get_pll_range_index() to miscalculate `m` and the guard in
__pll_params_with_frac() to be bypassed, underflowing `val -=3D m * frac_ma=
x`
and writing corrupted multiplier and fractional values to the PLL hardware.

[1] https://sashiko.dev/#/bug/linux-8a5ec432-efbd-4d3f-83c7-2a50fc2850c7

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-upstream-s=
7-clk-v1-0-7d501d62621f@baylibre.com?part=3D2
