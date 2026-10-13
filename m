Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5191951C060
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907095; cv=none; b=sqa1HOrnMV8KGQy61ziNmCNrvaGbSH41TbTItt0F/P7ioGudw81ek84yVU/TJxjaIQQQ8nt0ZHsiGMpV8XRLR2RVNEGMtz0qyP0RRrGhi7V1LwmUo8T45HmPwsVpEiRLn/7DtldHiX9zt+9lm9e9CDmX7V40Tjrejx6df0LDkvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907095; c=relaxed/simple;
	bh=6TMmM4pPJ50WCdJE7T14NB90EJRCEa8olceCDRjF4aw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EDFLc+kekBqmnNPanKO3tztL/ggoKjz1fRO5L5SGDUOTivhcCNNM/zwTPn3eyvy8DaSXrU9tFtyotYu9P8dhpVF9bjAU2xpdjXuoZQcoBl7Xhl7gqtg16jxVClp6IfJm/piz/3aINybPc/zoLNWcS1IX7kW8QAgRmj6AzHv1cdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IiEE0Zlf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IiEE0Zlf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D311F000FF;
	Tue, 13 Oct 2026 15:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907094;
	bh=/IIbV6pMHm0aBBcxrRbLijy9CpisO+LHOWpbikyHBD0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IiEE0ZlfG4bSdcEdbV6zUW2K/FDQymoS7ZjFKHOmrDbcO9qzDELzIJWmivYr7MJSu
	 pkXVVqc3NjWkmWrAoqWqIsgePYR8NfJ9mHukvDL45S2lG66mBag4X3ibjo9wSsxZEU
	 gHasQRb9CNh9BFPqBaqFmUFOFUgC5XYqcYS2cGvRcGi+0Kme5N/LCKOEvbLg+9pkJP
	 bcZVIEjjdN1qZr20AQlmmdfMpGujy2vF2d0ui1J6o/QK/pcQra07J5avLx1PyYA2r/
	 5C5cXaDvEO7yvHWh7D+So+kxgo5nnqQnfTk394JvO2Vb/KOdogwRh7yblrk5l2mwLN
	 wYYaFb7fBpDWA==
Message-ID: <sashiko-outbox-170069@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/35] clk: mediatek: Add PLL support to common
 probe/remove helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261013151734.3177690-14-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
 <20261013151734.3177690-14-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 15:58:13 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: mtk: redundant iomap for plls causes memory leak
--

commit 5289a3c612ab2d43573cbb1c18f5582e2661818a
Author: Akari Tsuyukusa <akkun11.open@gmail.com>

clk: mediatek: Add PLL support to common probe/remove helpers

This commit extends __mtk_clk_simple_probe() and __mtk_clk_simple_remove()
to support PLLs. This reduces boilerplate code in apmixedsys drivers.

> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mt=
k.c
> index 004098a839b2c..e06cd40d995a9 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c

[ ... ]

> @@ -486,7 +487,7 @@ static int __mtk_clk_simple_probe(struct platform_dev=
ice *pdev,
>  	}
> =20
>  	/* Composite and divider clocks needs us to pass iomem pointer */
> -	if (mcd->composite_clks || mcd->divider_clks) {
> +	if (mcd->composite_clks || mcd->divider_clks || mcd->plls) {
>  		if (!mcd->shared_io)
>  			base =3D devm_platform_ioremap_resource(pdev, 0);
>  		else
> @@ -514,7 +515,7 @@ static int __mtk_clk_simple_probe(struct platform_dev=
ice *pdev,
>  	num_clks =3D mcd->num_clks + mcd->num_composite_clks;
>  	num_clks +=3D mcd->num_fixed_clks + mcd->num_factor_clks;
>  	num_clks +=3D mcd->num_mux_clks + mcd->num_divider_clks;
> -	num_clks +=3D mcd->num_cpumuxes;
> +	num_clks +=3D mcd->num_cpumuxes + mcd->num_plls;
> =20
>  	clk_data =3D mtk_alloc_clk_data(num_clks);
>  	if (!clk_data) {
> @@ -522,11 +523,18 @@ static int __mtk_clk_simple_probe(struct platform_d=
evice *pdev,
>  		goto free_base;
>  	}
> =20
> +	if (mcd->plls) {
> +		r =3D mtk_clk_register_plls(&pdev->dev, mcd->plls,
> +					  mcd->num_plls, clk_data);

[Severity: Medium]
Does adding mcd->plls to the earlier base mapping condition cause a resource
leak?=20

Since mtk_clk_register_plls() maps its own I/O memory using of_iomap()
internally and isn't passed the base pointer mapped above, the newly
mapped memory remains unused.=20

If mcd->shared_io is true, of_iomap() maps memory into base but it is never
unmapped on the success path, leading to a virtual I/O memory leak each
time a device successfully probes. If mcd->shared_io is false, it
redundantly calls devm_platform_ioremap_resource() to create an unused
duplicate mapping.

Could mcd->plls be removed from the earlier mapping condition to prevent
this?

> +		if (r)
> +			goto free_data;
> +	}
> +

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013151734.3177=
690-1-akkun11.open@gmail.com?part=3D13
