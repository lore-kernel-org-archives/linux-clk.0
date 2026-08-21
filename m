Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA0E3AE6E2
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307579; cv=none; b=ccZd/eOkhP4CuQrkeDitw3hu0Y+Q+Fya4P86vcXVJ8wB8STqYTKE1Bqdgk8CxFX0hLPf5+WpKKYac0npetsr+3siQPH7DC52dwJYn+iSRUAIRggSsJQdkPIk5zl7CScA6zoxmcclXCO3YY+oHFfLSzkFcIWUWIeikfbdsAiQLxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307579; c=relaxed/simple;
	bh=P2HxezIUarLP1MOZcC/+7eaBgwKc5Hll7MDrt++CT88=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c+DFm3X5qqEsk+XrBM76BBcQQPL1B/8HSEoYkvqxYh1Hz32/s5eDCG5rj7YQfBQ+SfRyzZfwEJVj4h2cnQjsNYf1W08k3XRVnOfgCIQFixlhnKsv4t69NORubI+6VjwjBlPJ3T9MfXRv7dYl9KQaUD6R99OERXxcEeiL+Ni0lYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSBQLWxf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSBQLWxf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B162B1F00A3A;
	Fri, 21 Aug 2026 10:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787307572;
	bh=pltpl88MKbeeVdKGrQ7s9RfJnANxTJ5ndZAsX2xoPXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TSBQLWxfDxDa764fJb61bhLCaME/btB/QPV5TLTNNmod6DZTiaqceUPwNYcs5pIE5
	 2ynrr6MbvZgwdYxsAwDZEfo39NL6vQbbdOANaa1mGMYXjOqkQanpwr3E6WRyTbFJiF
	 xwX47cJYDfJYe9rP5DXT89POZoiwCUefiALsCs/zOpm02OroK2fsIdO3/hjaPNZIQL
	 H5H6130UcvhqvQIW1XcnU2dP/AuITh00PEIjo6SN2oADRNgh8s8hbAto8mAbZ+ymgw
	 ErsbKqxd7AEwHMF0KUwD57BxkmfdF+/Tnxk5rCrn7saTZ6iN8OHXZ24Bt0j6IUK7k5
	 icVs6jI3wtytA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] phy: freescale: fsl-samsung-hdmi: Make sure
 clk_init_data is fully initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: neil.armstrong@linaro.org, linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, vkoul@kernel.org
In-Reply-To: <3c3be1c676eea5d32102864c57643b1573bc0db0.1787240165.git.geert+renesas@glider.be>
References: <cover.1787240165.git.geert+renesas@glider.be>
 <3c3be1c676eea5d32102864c57643b1573bc0db0.1787240165.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 10:19:31 +0000
Message-Id: <20260821101931.B162B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A global static variable is mutated during clock rate queries, cau=
sing data races and state corruption with PM resume operations.
--

--- Patch [1]: [PATCH 1/2] phy: freescale: fsl-samsung-hdmi: Make sure clk_=
init_data is fully initialized ---
commit eace776c1e0b617b09367e8f7566adff67211a9f
Author: Geert Uytterhoeven <geert+renesas@glider.be>

phy: freescale: fsl-samsung-hdmi: Make sure clk_init_data is fully initiali=
zed

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

> diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/f=
reescale/phy-fsl-samsung-hdmi.c
> index d010fec15671d..76c0d571e3155 100644
> --- a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> +++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> @@ -610,7 +610,7 @@ static int phy_clk_register(struct fsl_samsung_hdmi_p=
hy *phy)
>  {
>  	struct device *dev =3D phy->dev;
>  	struct device_node *np =3D dev->of_node;
> -	struct clk_init_data init;
> +	struct clk_init_data init =3D {};
>  	const char *parent_name;
>  	struct clk *phyclk;
>  	int ret;

[Severity: High]
This is a pre-existing issue, but does mutating the global static variable
calculated_phy_pll_cfg during side-effect-free clock queries cause state
corruption?

In fsl_samsung_hdmi_phy_find_settings(), the global variable is modified
unconditionally:

drivers/phy/freescale/phy-fsl-samsung-hdmi.c:fsl_samsung_hdmi_phy_find_sett=
ings() {
    ...
	/* Calculate the integer divider */
	int_div_clk =3D fsl_samsung_hdmi_phy_find_pms(rate, &p, &m, &s);
	fsl_samsung_hdmi_calculate_phy(&calculated_phy_pll_cfg, int_div_clk, p, m,=
 s);
    ...
}

Then in fsl_samsung_hdmi_phy_configure(), a pointer to this global is saved:

drivers/phy/freescale/phy-fsl-samsung-hdmi.c:fsl_samsung_hdmi_phy_configure=
() {
    ...
	phy->cur_cfg =3D cfg;
    ...
}

If a clock driver sets a rate (saving the pointer) and later performs a
clk_round_rate() query, the query will overwrite calculated_phy_pll_cfg.

When the device resumes, it restores the hardware using this potentially
corrupted pointer:

drivers/phy/freescale/phy-fsl-samsung-hdmi.c:fsl_samsung_hdmi_phy_resume() {
    ...
	if (phy->cur_cfg)
		ret =3D fsl_samsung_hdmi_phy_configure(phy, phy->cur_cfg);
    ...
}

Can this lead to the hardware being restored to an incorrect frequency
upon PM resume?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787240165.gi=
t.geert+renesas@glider.be?part=3D1
