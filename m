Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53CE515970
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 16:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907743; cv=none; b=D83G+XB/5xnJaoEFsdFnMMDpljnEAbLikuKknqZUQZW00V7U7cXj9eaGw8QvO8EbLHBEyvf37F7aNVNNcLeZkKsXvFhC1XdtixQ/6EELc1s+U7tmu1IBvNZ9ogi4K2au/BtDY6+kGieRdmf9/QjHxpMSAzN5IhnAzP03JQB7a7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907743; c=relaxed/simple;
	bh=yVXRnE7u6lcjE1RHB1x/KSSUTpGnJow975aGy9p0UVQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gwbLDLE4VIi9ejKtTDOJYiHBozsobkjG6AW7xiIcCJIugudPAfwoCG5s6Vix9bhAeRqm58DppidOsiT3rDSu+XjKqgaLStG97IGDItyJzaOdMlZI/2w/4YZeHVvsbO+E0Hnes/F6HRizdC9nY5GgsOOdn/w/fDoKrDp1DuXxYHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kA+8Xi68; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kA+8Xi68"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE941F000FF;
	Tue, 13 Oct 2026 16:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907741;
	bh=iJqdD02G8Y/yTdTLNOavMtXG/KipJe4pyARxd3GiODY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kA+8Xi68bTEVWw1DUr87defOqzC+GEoIm3CNCnmst2uuAJw1R+GXNg32++IWWUNaV
	 voef5QudPTjm/pFrsF/GiMAEbQxHvdyaQT4FTLx6eYnNeUCKThxXsQD1+gMf7VO8gt
	 D5YY/Wl6PkTPYX8ACYgLmUB1BAVAEDcUpi0deozTwJJPobA9OKcrq7vPYlLIcK6VMa
	 Yeza1dRyUafdQZDnM3vwwk52bs21Fn+T0iV0czRB6EFEjPcGP4jcLKK+TFNm4XmTw+
	 5oCViygokipdJKvnWmNcTCPViqD8I74O05A26wZob8iCumCEp3PwBIjPvLDfiHSS0W
	 KP9MhG5M889FQ==
Message-ID: <sashiko-outbox-170092@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/35] clk: mediatek: Add FHCTL support to common
 probe/remove helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261013151734.3177690-16-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
 <20261013151734.3177690-16-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 16:09:00 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: mediatek: Use-After-Free of FHCTL base on probe deferral / re=
bind
- [Medium] clk: mediatek: memory leak of FHCTL iomem base on probe failure =
or no matches
--

commit 8d87854263bcfad5cea06d0fd17b75e7b846a747
Author: Akari Tsuyukusa <akkun11.open@gmail.com>

clk: mediatek: Add FHCTL support to common probe/remove helpers

Extend __mtk_clk_simple_probe() and __mtk_clk_simple_remove() to support
FHCTL. This reduces boilerplate code in apmixedsys drivers with FHCTL
support.

> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mt=
k.c
> index 1172e76516c03..8fa81a8671ad0 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
[ ... ]
> @@ -525,8 +529,18 @@ static int __mtk_clk_simple_probe(struct platform_de=
vice *pdev,
>  	}
> =20
>  	if (mcd->plls) {
> -		r =3D mtk_clk_register_plls(&pdev->dev, mcd->plls,
> +#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
> +		if (mcd->fhctl_node) {
> +			fhctl_parse_dt(mcd->fhctl_node, mcd->pllfhs,
> +				       mcd->num_pllfhs);
> +			r =3D mtk_clk_register_pllfhs(&pdev->dev, mcd->plls,
> +						    mcd->num_plls, mcd->pllfhs,
> +						    mcd->num_pllfhs, clk_data);

[Severity: Medium]
This problem wasn't introduced by this patch, but does calling
fhctl_parse_dt() here expose drivers to a memory leak of the fhctl iomem
base mapped via of_iomap() in fhctl_parse_dt()?

If mtk_clk_register_pllfhs() fails, the code jumps to the free_data label
in __mtk_clk_simple_probe(), bypassing unregister_plls. As a result, the
mapped i/o memory seems to be permanently leaked.

Additionally, if mtk_clk_register_pllfhs() fails to register the very first
pll, it skips its internal cleanup loop entirely, meaning the memory mapped
by fhctl_parse_dt() is never unmapped.

[Severity: High]
This problem wasn't introduced by this patch, but does the common
registration path expose fhctl-enabled drivers to a use-after-free during
probe deferral or device rebinds?

During a successful call, fhctl_parse_dt() mutates the static mcd->pllfhs
array by setting pllfh->state.fh_enable =3D 1 and storing the mapped i/o
pointer in pllfh->state.base.

If the probe later fails and the device is removed,
mtk_clk_unregister_pllfhs() calls iounmap() on the base but fails to clear
the fh_enable flag or the stale base pointer from the static array.

If the device is subsequently re-bound and fhctl_parse_dt() fails early
(leaving the static array unmodified), won't mtk_clk_register_pllfhs()
still see fh_enable =3D=3D 1 from the previous probe and blindly dereference
the stale, unmapped state.base pointer?

> +		} else
> +#endif
> +			r =3D mtk_clk_register_plls(&pdev->dev, mcd->plls,
>  					  mcd->num_plls, clk_data);
> +
>  		if (r)
>  			goto free_data;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013151734.3177=
690-1-akkun11.open@gmail.com?part=3D15
