Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88D8442B3F
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787303077; cv=none; b=c/3ves8CtXAxBIgVFbQz/O5GxPwO/1OoUVd4IAnS1OMU6xD2nbRYMat7mAYXlCE9xViz7gMqBXx3sYZLurmf/rc+e0SyVM7sdAYv1Cmi8jCUGapBG0hIPmfwmNrGd4W96eIhT0eLuc26eFhT37qIDzkX+fmGQ2l83RlmhQEHXAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787303077; c=relaxed/simple;
	bh=oQErjk26sorVdVO8pYJXRHtppRHpgQQgciErl9KjoIQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rTQzMVJ4JBOG6GV913tVq5kbkvhEbvabTw6IZx5sVnM8T2OHzVOEbtCQVMcJeVWNrfz+/E8vSBsAdGpNiPel8XPVdiC7ounA8mSGn91HO16XSuIbi9KP8pIEvpUTANGUv0rNm/CEpy1Y7AYaaOTQaTCcH7HD25PEB7xdfSBzRWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLyOXdkz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLyOXdkz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D0981F00A3A;
	Fri, 21 Aug 2026 09:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787303058;
	bh=P3/Am/Q1TniiQm9xR1q9M7zezqiw+DpPdnot+e9xfEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nLyOXdkzlfipIqe5CQAbWmPxJ6vl9yjz/1Um+g5oJbs+N2wl28k9U0R0Y8jyk9Ayp
	 rxweUnk29nGuuRRwmUdtczYPPSDPaPjaY/M/m0xpLj8jD+qfURru+NQvhpU+3pllYT
	 6PGbSej1oq7ibSJ9iZqiE05NgKp7cemCRBlq2E0Iw/Xb6V+kyqDuo7AsRbrYL+Dy/x
	 1G/NPy2ruRlkH2mrU/+X+ImYN+NS6O/IEz1Tud+89kIjEOXPHjtJKZjMni+faWxq2K
	 5lF0kwx07ZTA5T8/Yf7rAe6zVdoPXwWpNSUc8+910rFd2FW744KPAUKfz4Ai6ZcPuJ
	 GuZCde/mCRGqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ASoC: tlv320aic32x4: Make sure clk_init_data is
 fully initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <7acfe448928df59a62418233d716b0c9806559d5.1787239902.git.geert+renesas@glider.be>
References: <cover.1787239902.git.geert+renesas@glider.be>
 <7acfe448928df59a62418233d716b0c9806559d5.1787239902.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 09:04:17 +0000
Message-Id: <20260821090418.4D0981F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Memory leak and Use-After-Free via unmanaged clk_lookup entries.
- [High] Data race and stack Use-After-Free due to assigning a block-scoped=
 compound literal to a global array.
- [High] Unchecked return values of resource allocations and clock registra=
tions mask initialization failures.
- [High] Hardcoded clock names cause registration failures for multiple cod=
ec instances.
- [High] Unvalidated requested clock rate causes a division by zero panic.
- [High] Unvalidated parent clock rate causes a division by zero panic.
--

--- Patch [3]: [PATCH 3/3] ASoC: tlv320aic32x4: Make sure clk_init_data is =
fully initialized ---
commit bdb202ba7d1e5e85e1733f12689e1c8729d8c7d3
Author: Geert Uytterhoeven <geert+renesas@glider.be>

ASoC: tlv320aic32x4: Make sure clk_init_data is fully initialized

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Make sure all members are fully initialized, to avoid such bugs, and to
prevent future breakage when converting drivers to a different method
for specifying the parents.

> diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv3=
20aic32x4-clk.c
> index deed61650e09d..ad15ce9c60791 100644
> --- a/sound/soc/codecs/tlv320aic32x4-clk.c
> +++ b/sound/soc/codecs/tlv320aic32x4-clk.c
> @@ -451,8 +451,8 @@ static struct aic32x4_clkdesc aic32x4_clkdesc_array[]=
 =3D {
>  static struct clk *aic32x4_register_clk(struct device *dev,
>  					struct aic32x4_clkdesc *desc)
>  {
> -	struct clk_init_data init;
>  	struct clk_aic32x4 *priv;
> +	struct clk_init_data init =3D {};
>  	const char *devname =3D dev_name(dev);
> =20
>  	init.ops =3D desc->ops;

[Severity: High]
This isn't a bug introduced by this patch, but does hardcoding the clock
name directly from the static descriptor (init.name =3D desc->name) prevent
probing multiple instances of this codec?

If devm_clk_register() is called on a system with multiple codecs, will
it fail with -EEXIST because names like 'pll' and 'codec_clkin' are reused?


While reviewing this file, I noticed a few other pre-existing regressions:

[Severity: High]
This is a pre-existing issue, but is there a clk_lookup entry leaked when
the device is unbound?

sound/soc/codecs/tlv320aic32x4-clk.c:aic32x4_register_clk() {
    ...
	clk_hw_register_clkdev(&priv->hw, desc->name, devname);
	return devm_clk_register(dev, &priv->hw);
}

Since clk_hw_register_clkdev() dynamically allocates a clk_lookup on the
global list without using a devres variant or dropping it in teardown,
will the lookup retain a dangling pointer to the freed priv->hw if probe
fails or the driver is unbound?


[Severity: High]
This isn't a bug introduced by this patch, but is stack memory being written
into the static global aic32x4_clkdesc_array?

sound/soc/codecs/tlv320aic32x4-clk.c:aic32x4_register_clocks() {
    ...
	aic32x4_clkdesc_array[0].parent_names =3D
			(const char* []) { mclk_name, "bclk", "gpio", "din" };
	aic32x4_clkdesc_array[1].parent_names =3D
			(const char *[]) { mclk_name, "bclk", "gpio", "pll" };
    ...
}

Because these compound literals are block-scoped (stack allocated), if this
function returns, won't the global array point to dead stack memory, leading
to a use-after-free when the clock framework reads the parent names?


[Severity: High]
This is a pre-existing issue, but are we discarding the return value of
aic32x4_register_clk() and masking probe failures?

sound/soc/codecs/tlv320aic32x4-clk.c:aic32x4_register_clocks() {
    ...
	for (i =3D 0; i < ARRAY_SIZE(aic32x4_clkdesc_array); ++i)
		aic32x4_register_clk(dev, &aic32x4_clkdesc_array[i]);

	return 0;
}

If aic32x4_register_clk() fails due to low memory or clock name collisions,
will the driver falsely report a successful probe?


[Severity: High]
This isn't a bug introduced by this patch, but could DIV_ROUND_UP() trigger=
 a
division by zero panic?

sound/soc/codecs/tlv320aic32x4-clk.c:clk_aic32x4_div_determine_rate() {
    ...
	divisor =3D DIV_ROUND_UP(req->best_parent_rate, req->rate);
    ...
}

If a 0 rate is supplied via the Common Clock Framework API, will this
cause a kernel panic?

This same pattern also appears in clk_aic32x4_div_set_rate() where
DIV_ROUND_UP(parent_rate, rate) is called.


[Severity: High]
This is a pre-existing issue, but might do_div() trigger a division by
zero panic?

sound/soc/codecs/tlv320aic32x4-clk.c:clk_aic32x4_pll_calc_muldiv() {
    ...
	multiplier =3D (u64)rate * settings->p * 10000;
	do_div(multiplier, parent_rate);
    ...
}

If the PLL clock is queried or set when its parent clock is uninitialized or
reporting a 0 Hz rate, will do_div() divide by zero?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787239902.gi=
t.geert+renesas@glider.be?part=3D3
