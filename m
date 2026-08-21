Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE22E4582FE;
	Fri, 21 Aug 2026 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307219; cv=none; b=rATlSFpE2/P7VA2PlZouSV+RHY9KYmq+hS+6AhCoDla4w8ZbV5IdAumxK4T+e44rC/DfSoJAvj5DZTJhEomMLEIH3o/BnGXRfbC0BEm7PMaDOI/Jy9PL1pWZAA4EhM+3veEKTwNpaDIZLBpKDvF4NBHxksJXt59Bi+EPlQhY5vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307219; c=relaxed/simple;
	bh=vBrBcFMQO+oRABaXN0UyS84HUnWltQinVbf0YSAKesQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R3T+Afhmq57KWx0zsX3zUbyjpN6uPb87SvZ0lTFXl71XO1vgZCSiDoYR9Dpc0M5CdnoxEBIYrw+PZ4t6gaO4jis8w45RygLqDsb6EI186yvohctUmuH3HdF2z/iAKbRNiCgvxLRDENl9IwkljnI88A1jhQe8kgNvdiVH6P5Zaqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5MopKC2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5MopKC2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5103C1F00A3A;
	Fri, 21 Aug 2026 10:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787307206;
	bh=PHQhzTG9KdaKdfk6ton+B1lLOm5RG/1WaKSqx6nGfpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T5MopKC2hJ6MzWs28qtOffc9jE2pCvVBSNW1VJQjIw74Dyr5XkPsRfCBtnLIIqTim
	 2keb7tKQ00/LK+3xWaYJgEU3iXkKJ7LP1QORsXyY93/PnZxBZnu/sce1MV0ZEQsUq7
	 f2DWGD9KQ4Hg4OY7wNJyW9jItgbnAVtxBl7f3KSHgpcEkqx5xUAN/GEtZ6paqvTB6+
	 kWwY2d6M9GwCS3fltJKx0SMmFNw8WdDAvKJAt1ZGU5HzBrl85MOt5Oceyef9vargM9
	 f13b6RE3jvs4bEcRBt4LtBeqgtLER+gM+oCGGuXbWuQjFMGkTsrnFAlqW3Yub3/MEs
	 FspKA1l7zItlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/sun4i: Make sure clk_init_data is fully
 initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
In-Reply-To: <0f37278d04c02461e17f42032a379dccfb773171.1787239944.git.geert+renesas@glider.be>
References: <cover.1787239944.git.geert+renesas@glider.be>
 <0f37278d04c02461e17f42032a379dccfb773171.1787239944.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 10:13:25 +0000
Message-Id: <20260821101326.5103C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Resource leak and duplicate registration failure due to misuse of =
`devm_` APIs against an external device in a component `.bind` callback.
--

--- Patch [1]: [PATCH 1/2] drm/sun4i: Make sure clk_init_data is fully init=
ialized ---
commit c10328b2f0b88fab02ca03cdd9ba8cea5c03c556
Author: Geert Uytterhoeven <geert+renesas@glider.be>

drm/sun4i: Make sure clk_init_data is fully initialized

This commit zero-initializes the clk_init_data structure to ensure all
members are fully initialized. This prevents subtle issues when only
some mutually-exclusive members are set, especially under certain stack
initialization configs.

[ ... ]

> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c b/drivers/gpu/drm=
/sun4i/sun8i_hdmi_phy_clk.c
> index a4d31fe3abff1..bd0dba95421b3 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
> @@ -143,7 +143,7 @@ static const struct clk_ops sun8i_phy_clk_ops =3D {
>  int sun8i_phy_clk_create(struct sun8i_hdmi_phy *phy, struct device *dev,
>  			 bool second_parent)
>  {
> -	struct clk_init_data init;
> +	struct clk_init_data init =3D {};
>  	struct sun8i_phy_clk *priv;
>  	const char *parents[2];
> =20

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential problem
with resource lifetimes in this function.

During the component bind phase, this code uses devm_kzalloc() and
devm_clk_register() against the external PHY platform device:

sun8i_phy_clk_create() {
    ...
	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
    ...
	phy->clk_phy =3D devm_clk_register(dev, &priv->hw);
    ...
}

Because the devres group is attached to the external PHY device (`dev`) rat=
her
than the component device, it escapes the component unbind cycle.

When the HDMI component is unbound and re-bound, sun8i_phy_clk_create() runs
again. Will this permanently leak the memory allocated for `priv`?

Furthermore, will devm_clk_register() fail with -EEXIST on the second bind
since the previous clock was never unregistered?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787239944.gi=
t.geert+renesas@glider.be?part=3D1
