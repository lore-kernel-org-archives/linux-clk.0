Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E323F3A6F19
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308192; cv=none; b=Msl+/67gYI/gDts52jH2svI8maOb1Y3KFTjRCwMr+r1PDG98HUNF0lJ+KqvHum46F6ENnpSaVjhCZf4d8qsdivgkkq0G6nn59VlNl84RCSGb9G5utZzs3hUepPV4RgFpIuYA0d/Z1V4x803W7nj3vb1u5ggfk9orhbTRf+AbAUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308192; c=relaxed/simple;
	bh=g3jIMLojJDeQoKl5vjznPMQaNEyk2dHwnjXrdv2Ux20=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XKSlzlBy2gySNPEQZD49+61D2eUxDAQdWPHdHmznALwlsnX7j5u9cX8RFSbkJhXYHvN63yQPRBi1PqW6sMgXIZnSGKjMbDIcB3PK1dUG1R61NCj6f5xoXs26Q3RC5ISop4z74x7dj4LIayEGSzT+VWuY+x0jrql7O2dXx9VdyjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNfInL2e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNfInL2e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AEE1F000E9;
	Fri, 21 Aug 2026 10:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787308177;
	bh=wJPeVQgm5j/WSE7VShIXcWxl9EhpW+1WepDlwjN0hBo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JNfInL2eM/U2Lv09rwG8C/4uN2uGeNF5d3GAhCuePHmFbHsYCyLYbolc0vAqhQ7at
	 wxz6rQxS/1s9zgMoMVPoj8xyZx0IxH5aAuuuZt8ndu4oEDTdowC6KmDLSWli1hu9do
	 GbQvsFGSFE2b8jLV1qfzPhY4RB5+3WtOVqTROiMDGsdS8gtlxxqGbw6UU9/BLym/TE
	 yp2WC1PhZD1d6t76BI1ypCR6MXc120GPDKNGVGi7MNm9PQ/kJmmL7rAWchhsQaEB1v
	 u7h1vvAqQi8OJNjIx6Aih+KnfTwWNTIT9sy+z/nymf4Zv9P0UX+nVXA6hjsvQJf0oe
	 wkwraRC5e/KzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] phy: rockchip: Make sure clk_init_data is fully
 initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <adb5bd47343dd31661748d5de14cb28a2bae2d17.1787240165.git.geert+renesas@glider.be>
References: <cover.1787240165.git.geert+renesas@glider.be>
 <adb5bd47343dd31661748d5de14cb28a2bae2d17.1787240165.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 10:29:36 +0000
Message-Id: <20260821102936.F2AEE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect validation of the `refclk` pointer results in registerin=
g a clock with 1 parent but a NULL parent name if the optional 'phyclk' is =
missing.
- [High] Missing `of_clk_del_provider` on the error path of `inno_hdmi_phy_=
probe`, leading to a use-after-free in the OF clock provider list.
--

--- Patch [2]: [PATCH 2/2] phy: rockchip: Make sure clk_init_data is fully =
initialized ---
commit 830443ad1b9c48211b68c5bb691a7101b0e76d09
Author: Geert Uytterhoeven <geert+renesas@glider.be>

phy: rockchip: Make sure clk_init_data is fully initialized

This commit zero-initializes the clk_init_data structures across several
rockchip phy drivers to ensure all mutually-exclusive members are cleared.
This prevents subtle bugs when specific initialization configurations are
enabled.

> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/=
rockchip/phy-rockchip-inno-hdmi.c
> index 1483907413faa..80aeed965c3f3 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
> @@ -999,7 +999,7 @@ static int inno_hdmi_phy_clk_register(struct inno_hdm=
i_phy *inno)
>  {
>  	struct device *dev =3D inno->dev;
>  	struct device_node *np =3D dev->of_node;
> -	struct clk_init_data init;
> +	struct clk_init_data init =3D {};
>  	const char *parent_name;
>  	int ret;

[Severity: High]
This isn't a bug introduced by this patch, but does the clock provider
registration here leak on the probe error path?

In inno_hdmi_phy_probe(), if devm_of_phy_provider_register() fails after
the clock is registered:

inno_hdmi_phy_probe() {
    ...
    ret =3D inno_hdmi_phy_clk_register(inno);
        // Calls of_clk_add_provider() which adds to global list
    ...
    phy_provider =3D devm_of_phy_provider_register(...);
    return PTR_ERR_OR_ZERO(phy_provider);
}

If the phy provider registration fails, the probe aborts without calling
of_clk_del_provider(). Devres will free inno->phyclk, leaving a dangling
pointer in the global of_clk_providers list which could trigger a
use-after-free during subsequent clock lookups.

> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/=
rockchip/phy-rockchip-inno-usb2.c
> index 7d8a533f24aea..e47b89015586f 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> @@ -400,7 +400,7 @@ static int
>  rockchip_usb2phy_clk480m_register(struct rockchip_usb2phy *rphy)
>  {
>  	struct device_node *node =3D rphy->dev->of_node;
> -	struct clk_init_data init;
> +	struct clk_init_data init =3D {};
>  	struct clk *refclk =3D NULL;
>  	const char *clk_name;
>  	int i;

[Severity: High]
This is a pre-existing issue, but does this function correctly handle
missing optional clocks later in the logic?

If the optional phyclk is not found, refclk remains NULL. However, the
validation check further down evaluates NULL as true:

rockchip_usb2phy_clk480m_register() {
    ...
    if (!IS_ERR(refclk)) {
        clk_name =3D __clk_get_name(refclk);
        init.parent_names =3D &clk_name;
        init.num_parents =3D 1;
    } else {
        ...
    }
}

Since !IS_ERR(NULL) is true, it attempts to register the clock with 1 parent
and a NULL parent name, causing clk_register() to fail with -EINVAL and
breaking USB PHY support on platforms missing this clock.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787240165.gi=
t.geert+renesas@glider.be?part=3D2
