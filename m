Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542F03DB635
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307317; cv=none; b=AQ/3D6TOpOg32bH1Z2y16UsP5LtpoudHdHVtx2Tqniabefq/UrNhID49M4bLOUu8FmWGUMZmqsYsMec/nk/m9Wzg0+hk8giNjaiB84CQBG/wdm2zDjW+Iic8SPQlI5VG3sDee0VGWKTlsuAwF4F15X28cj3d/xOIIId9vIY6SxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307317; c=relaxed/simple;
	bh=3qERxUk3y0KNFGC0v54gS3ZXyPW3mXzB41z0sGGPUAw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TZcLOLyT5g5Ed6NfhbowW7A4nM2Ok6PIeGTSBdc5AecT/ddGC81ILhDdq8gXwC85FkFrMMmQMjbskQ60Yu7u9QdqVSZDlemMy2asiNOcBFuMkKAet1nYTAwV7Yy/0WHa1AnmK20nKES6SqplqMbkZ7DxOUBRvyfEdsvZFrQSNz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwRWFDcP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwRWFDcP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29471F000E9;
	Fri, 21 Aug 2026 10:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787307303;
	bh=qC59Yc1xbdYmOehKc5dawCJSVC2bdsfspeH6AOhNNQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JwRWFDcP1xt1/3t5+wZeVp8ZNlPD/MM0duA9tfCkKHurX5/kBcYopX/J/npRTQVPC
	 cA/IwlGW/ctcPKyj6OR9Jif3XLjr+rePwaIDEfVOSB30FqVE/zGpagCi/LEBBw5qZq
	 5Knaj97rL4WkrxZt87HAr5KJk663iLrPKipJCdQAXDQUq5+RmKSXQX9uWlyAkRtpIL
	 /vpZXvBkiLRYXGBIXYrNVuiTVzEeuuont7u16H8U8UXF29dpEWSGKp3MkxGf7B4EO1
	 /SUBNys+Czl6M1627CfdTaArUWqT1CsvT6gGT+1CU3uFPbGHqjDt0DwUFCi5JI854w
	 3SuXQMUpZEdnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] media: samsung: exynos4-is: Make sure clk_init_data
 is fully initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, media-ci@linuxtv.org, neil.armstrong@linaro.org
In-Reply-To: <2cace1b92cc8333eca63874de17dd5d5b1f9e5d6.1787240035.git.geert+renesas@glider.be>
References: <cover.1787240035.git.geert+renesas@glider.be>
 <2cace1b92cc8333eca63874de17dd5d5b1f9e5d6.1787240035.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 10:15:02 +0000
Message-Id: <20260821101502.F29471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double free and use-after-free of device node references in OF ite=
rator loop.
--

--- Patch [3]: [PATCH 3/3] media: samsung: exynos4-is: Make sure clk_init_d=
ata is fully initialized ---
commit f3a10ad891243d9b897aed17537077a8bb8725bc
Author: Geert Uytterhoeven <geert+renesas@glider.be>

    media: samsung: exynos4-is: Make sure clk_init_data is fully initialized
   =20
    The clk_init_data structure contains mutually-exclusive members for
    specifying clock parents. This commit ensures all members are fully
    initialized to zero, preventing subtle bugs with uninitialized data.

> diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/driv=
ers/media/platform/samsung/exynos4-is/media-dev.c
> index 2e08c4435859e..638babf528221 100644
> --- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
> @@ -1313,7 +1313,7 @@ static int fimc_md_register_clk_provider(struct fim=
c_md *fmd)
> =20
>  	for (i =3D 0; i < FIMC_MAX_CAMCLKS; i++) {
>  		struct cam_clk *camclk =3D &cp->camclk[i];
> -		struct clk_init_data init;
> +		struct clk_init_data init =3D {};
>  		const char *p_name;
> =20
>  		ret =3D of_property_read_string_index(dev->of_node,

[Severity: High]
This is a pre-existing issue, but I noticed a potential double-free of devi=
ce
node references elsewhere in this file.

Looking at fimc_md_parse_port_node(), it iterates over child nodes using the
scoped iterator macro:

drivers/media/platform/samsung/exynos4-is/media-dev.c:fimc_md_parse_port_no=
de() {
    ...
	for_each_child_of_node_scoped(port, ep) {
		ret =3D fimc_md_parse_one_endpoint(fmd, ep);
		if (ret < 0)
			return ret;
	}
    ...
}

This macro automatically manages the reference counting for ep, dropping it
implicitly when the loop advances or exits.

However, inside fimc_md_parse_one_endpoint(), the code explicitly calls
of_node_put(ep) on all paths:

drivers/media/platform/samsung/exynos4-is/media-dev.c:fimc_md_parse_one_end=
point() {
    ...
	asd =3D v4l2_async_nf_add_fwnode_remote(&fmd->subdev_notifier,
					      of_fwnode_handle(ep),
					      struct v4l2_async_connection);

	of_node_put(ep);
    ...
}

Because the reference is already dropped in the helper function, wouldn't t=
he
subsequent put by the iterator's loop advance or scope exit result in a
double-free and a use-after-free of the device node?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787240035.gi=
t.geert+renesas@glider.be?part=3D3
