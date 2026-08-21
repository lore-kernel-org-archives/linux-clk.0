Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C623146D0B6
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787303095; cv=none; b=j9jqreQW49KkkftYhsyxZdfqYWRvCHOlruokDPsHcEunGVYnOVp7Oh4q/wUKkezdHq0a0t3RyPHqyaoGAz1y4mFWqa8cqSzApFdnXDy30GHzf5jKU9n/iUlsUpJmxCAH8F3K2r0xltuPOQhVZ0hXm67PPkT06IaqaqZqKizhakg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787303095; c=relaxed/simple;
	bh=dmTR+xJo0i/EyCFhSQaMnMi4xOqOnegU6WDlUW2Gq1o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=io01Y1MNsUJM6TJOMxrZf/+alMiWvuiRxxLoa/sL5iLjfpx+Zsn8UkfZnjJFGBsgmG9fdmNzUdtgKQODFdoBjsXP7AqGbq9EFJAiATMMy+nm6gbzTjj1RahW2bm14ZRjhu5rFbLRiwlYGCFfUJow+7wslytnhcP5UCl2nPa+FQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDNRyfAs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDNRyfAs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407DB1F00A3A;
	Fri, 21 Aug 2026 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787303084;
	bh=r+kQI4ckCUDvYDZjz8ofTu2S1xyhbuZpra8UNDnDZAs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JDNRyfAsMl5iCZuooMp5zfxj2BCUzimkQAGxHE6VkXGiR8EcNJAexQ29NZ6WxbGaP
	 knWNA2Ms8LcTx59RuTTZG2HcPlM4b2WXrQDhG2gFbLDRx0JMgiHuOijzOHMGPmknHX
	 38rTKMCdAn7foktkqgLPYPA+jSzoPRHwF0cKtqfma+6Z/lFZnTP1Zb0UCdQXJEqcj/
	 yCVzM+IMIH+9dL8PeMUyCZfGt3ZxiPcRzzphpS5SHUyAJ2hc4xrFPjM7zpULPa7gqv
	 aEKlS+Qc7TPZ+1LDTiJr4dzK22WGLZ/IYLum20kOJwtOGkBDqp/F9eA1whhgYKSDNK
	 1je1JEOhmLDcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] ASoC: codecs: wcd934x: Make sure clk_init_data is
 fully initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <560811bcde4b8459b5e96c131e50a94ee75664fd.1787239902.git.geert+renesas@glider.be>
References: <cover.1787239902.git.geert+renesas@glider.be>
 <560811bcde4b8459b5e96c131e50a94ee75664fd.1787239902.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 09:04:43 +0000
Message-Id: <20260821090444.407DB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free of wcd structure due to mismatched devres lifecycle=
s.
--

--- Patch [2]: [PATCH 2/3] ASoC: codecs: wcd934x: Make sure clk_init_data i=
s fully initialized ---
commit ff8f9601f6c3274a4ff6020b3e29ffe892c8e05d
Author: Geert Uytterhoeven <geert+renesas@glider.be>

ASoC: codecs: wcd934x: Make sure clk_init_data is fully initialized

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need. However,
not initializing all members may cause subtle issues. This commit makes
sure all members are fully initialized.

> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
> index caca5cc251004..0ed24cca088f8 100644
> --- a/sound/soc/codecs/wcd934x.c
> +++ b/sound/soc/codecs/wcd934x.c
> @@ -2130,9 +2130,9 @@ static struct clk *wcd934x_register_mclk_output(str=
uct wcd934x_codec *wcd)
>  	struct device *dev =3D wcd->dev;
>  	struct device_node *np =3D dev->parent->of_node;
>  	const char *parent_clk_name =3D NULL;
> +	struct clk_init_data init =3D {};
>  	const char *clk_name =3D "mclk";
>  	struct clk_hw *hw;
> -	struct clk_init_data init;
>  	int ret;
> =20
>  	if (of_property_read_u32(np, "clock-frequency", &wcd->rate))

[Severity: High]
This is a pre-existing issue, but is there a use-after-free risk due to
mismatched devres lifecycles when the driver is unbound?

The wcd structure is allocated using devm_kzalloc on the codec device's
lifecycle in wcd934x_codec_probe:

sound/soc/codecs/wcd934x.c:wcd934x_codec_probe() {
    ...
    wcd =3D devm_kzalloc(dev, sizeof(*wcd), GFP_KERNEL);
    ...
}

However, further down in wcd934x_register_mclk_output, the embedded clock
hardware is registered against the parent device's lifecycle:

sound/soc/codecs/wcd934x.c:wcd934x_register_mclk_output() {
    ...
    ret =3D devm_clk_hw_register(wcd->dev->parent, hw);
    ...
}

When the parent MFD driver is unbound (e.g. via rmmod), the driver core
first unbinds all child devices. The codec device unbinds, freeing wcd.
Then, the parent MFD device unbinds, and its devres cleanup invokes
clk_hw_unregister on the now-freed hw pointer.

Does devm_clk_hw_register need to be called on the child dev instead of
the parent?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787239902.gi=
t.geert+renesas@glider.be?part=3D2
