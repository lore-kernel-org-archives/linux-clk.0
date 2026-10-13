Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08001525A75
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 17:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912243; cv=none; b=DiQ24aDzMY12HbzIKaamT/jS0ekbAy5GRL46CKPh2vMgtIJU4rzDW6YnG6yIxJ0ajG+SheAZdaFH+G7wgHeA1jUWsAHw3VBKo9LHGN0nN8qyOj5MqmZM0y9etfM21s/FYpLw7BntYjjld9p224AiQjlJ4AXnrU56Lv/na1cOxMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912243; c=relaxed/simple;
	bh=LWy5Fwm5w2z43MLGiHr85w0rO4LFK2RqgzUaxD90Vtk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=t7i1ViXFeXWDb4feFn9mplMb9c/1RtwjtvqgyRkLRtmCItos//Y1ZT7cSx4WMc7ruXbgZiDhz2yWyflgoPSb96DXjURh3LtmBV8CD7e+Xl57q6o2xpq429yy4GDrgIiwn49wmisQgGKeH22uQE0xLGJTUfUke3AZyRFGrmBrXLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9YD6t4Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9YD6t4Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78361F000FF;
	Tue, 13 Oct 2026 17:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791912241;
	bh=Khx44oudycswJRfqoPvGM3yewUMDgdqdlQiuN2yFEOI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R9YD6t4Z1QI2L4xdAgPMledbY1ZiiMIhmafHh37HCrOErAT18HQp5nGJV6wkjdrWN
	 2SL9sgu0+g710ERATiyGwe+cluqcR2Ov4KabbkGXGqlTd8RU09RHxa8OIz3AJh/+VE
	 9Tufwv/JtPzZlnZnxgxmROElHirF4u3ChdxbOFC54NWt+6Ly5Pv3dMlOkmK9KdWY8a
	 Vtudy04b0au7G0ipm3xA+p4v6Sh9AxGoEeaGfuHNu+7GGgZj5Ig4eo3ggmme4u97vl
	 9/aADNcAYo7jW3/ROmqxhrj221CEbVtWdzdO7dClcaHaI0SQAOMpkgRxb2Q6NjXLf/
	 MbunOZVnC65Qw==
Message-ID: <sashiko-outbox-170217@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 34/35] clk: mediatek: mt8196: Switch to common
 probe/remove helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261013151734.3177690-35-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
 <20261013151734.3177690-35-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 17:24:01 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: mediatek: redundant ioremap and exclusive region request fo=
r PLLs
--

commit 493ba4ac616daf31697a4dcddf3d65ea3f269cb3
Author: Akari Tsuyukusa <akkun11.open@gmail.com>

clk: mediatek: mt8196: Switch to common probe/remove helpers

This commit updates the MT8196 apmixedsys, mcusys, and mfg drivers to use
the common mtk_clk_simple_probe() and mtk_clk_simple_remove() helpers by
representing their PLL configurations with struct mtk_clk_desc.

> diff --git a/drivers/clk/mediatek/clk-mt8196-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8196-apmixedsys.c
> index c4ebb0170b82b..a20fa02070a88 100644
> --- a/drivers/clk/mediatek/clk-mt8196-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8196-apmixedsys.c

[ ... ]

> @@ -192,8 +141,8 @@ static const struct of_device_id of_match_clk_mt8196_=
apmixed[] =3D {
>  MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_apmixed);
> =20
>  static struct platform_driver clk_mt8196_apmixed_drv =3D {
> -	.probe =3D clk_mt8196_apmixed_probe,
> -	.remove =3D clk_mt8196_apmixed_remove,
> +	.probe =3D mtk_clk_simple_probe,

[Severity: Medium]
Does switching to mtk_clk_simple_probe() cause an unintended exclusive=20
memory region request for the shared apmixedsys controller?

By switching to the common helper without setting .shared_io =3D true in=20
the mtk_clk_desc structures, __mtk_clk_simple_probe() will map the IO=20
region exclusively:

drivers/clk/mediatek/clk-mtk.c:__mtk_clk_simple_probe() {
	/* Composite and divider clocks needs us to pass iomem pointer */
	if (mcd->composite_clks || mcd->divider_clks || mcd->plls) {
		if (!mcd->shared_io)
			base =3D devm_platform_ioremap_resource(pdev, 0);
...
}

Because devm_platform_ioremap_resource() calls request_mem_region(),=20
this exclusive claim could conflict with other drivers expecting to=20
access this shared syscon node.

Furthermore, the exclusively mapped `base` pointer appears to be completely=
=20
unused for PLL registration, as mtk_clk_register_plls() maps the region a=20
second time via of_iomap():

drivers/clk/mediatek/clk-pll.c:mtk_clk_register_plls() {
...
	base =3D of_iomap(dev->of_node, 0);
...
}

Would it be safer to set .shared_io =3D true in apmixed_desc and=20
apmixed2_desc (and similarly for other shared controllers in this patch) to=
=20
avoid the redundant mapping and exclusive resource lock?

> +	.remove =3D mtk_clk_simple_remove,
>  	.driver =3D {
>  		.name =3D "clk-mt8196-apmixed",
>  		.of_match_table =3D of_match_clk_mt8196_apmixed,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013151734.3177=
690-1-akkun11.open@gmail.com?part=3D34
