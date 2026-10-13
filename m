Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBF9521227
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 16:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910240; cv=none; b=jdFTj3oy+AEHFUPbVVWKBvG+BrEfkCd0FiOifct7b9pF+5WZR6JcRKC9qLiaU1A4iWlCqr3A3RL5I3xwerSuCgtqmUGucFeuVDjyvFpt/lX4s80ylD5TIz6GYrIutKKOsVWflTUgYlpzqQL0PmSSGyO4ijYCKofwwNyUkVADu34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910240; c=relaxed/simple;
	bh=uiAhmKkpDhRAHSqlFIzP32WQnisWH4F4wXDMGx5hNHo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=VhT66P7mHJmZ0PT2cH+SfXXAzrGaFgUwIc5lQvCz1hcZKePl4btqoO5UPmmTi9fAsatUMcmJyti9IrcTMyFEHZbDWZ39ulSqUcc0xZ7T1+iuAUfmJtWs2TIq8iX/2psTe+xq84WMFdS6TgF+VbBsGZYMhf7iY7d0M5BNB47f3pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=llA8FR72; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="llA8FR72"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4951F000FF;
	Tue, 13 Oct 2026 16:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791910239;
	bh=/xbRtRw1+caShMC5KA+xG1Gi1vwUvtLjjUPTAnuHDgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=llA8FR72ruqoa0TCtxqeN0JwHHP+WB/tfJi56JKs1xcakUZS3YdhCrC35mFkrx2Qf
	 2By0Owfmco86oAo+bWsBjp7Un1bQYVVHWpud8qTeeZeqVOrbAvtHYeSV1c2cYmOaKo
	 2o0hbWdug8jVp9huQqPimrE0zm7cH8v64tEniALtrSJC83M/YKzyinbXJQE5EM1zLH
	 y8Rzltwx836Yfxp3/w9xeVjugIEkTvakdQafpI34HFBfM2cBWNAFfMVs1iCd908kei
	 DF+IRyH+aOD+WYZijT3xdGBVrTc/qZISxb1luHTNoHgSkIXQ1bHrK/yHLCb2kzQPg+
	 RYjacsjwM2Lug==
Message-ID: <sashiko-outbox-170164@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 26/35] clk: mediatek: mt8135-apmixedsys: Switch to
 common probe/remove helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261013151734.3177690-27-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
 <20261013151734.3177690-27-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 16:50:38 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: mediatek: heap buffer overflow due to under-allocating clk_da=
ta->hws
--

commit a8601c1333aeb3d960b60f68a7bfd49fbd80c7c9
Author: Akari Tsuyukusa <akkun11.open@gmail.com>

clk: mediatek: mt8135-apmixedsys: Switch to common probe/remove helpers

The MT8135 apmixedsys driver previously needed custom probe/remove
callbacks to register and unregister PLLs. With PLL support now
available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

> diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8135-apmixedsys.c
> index e3b7dc13b458c..fe868417de482 100644
> --- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
> @@ -47,56 +47,20 @@ static const struct mtk_pll_data plls[] =3D {
>  	PLL(CLK_APMIXED_VDECPLL, "vdecpll", 0x304, 0x31c, 0x80000000, 0, 21, 0x=
2b0, 6, 0x0, 0x308, 0),
>  };
> =20
> -static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
> -{
> -	struct clk_hw_onecell_data *clk_data;
> -	struct device_node *node =3D pdev->dev.of_node;
> -	int ret;
> -
> -	clk_data =3D mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);

[ ... ]

> +static const struct mtk_clk_desc apmixed_desc =3D {
> +	.plls =3D plls,
> +	.num_plls =3D ARRAY_SIZE(plls),

[Severity: High]
Does this code under-allocate the clk_data->hws[] array, causing an
out-of-bounds heap memory overwrite?

The original probe function explicitly allocated an array of size
CLK_APMIXED_NR_CLK.  The new mtk_clk_simple_probe() helper dynamically
calculates the size of the clk_data->hws array by summing the element
counts of the provided clock arrays.

Here, ARRAY_SIZE(plls) evaluates to 10, which means an array of exactly 10
elements is allocated.  However, the Mediatek DT bindings for MT8135 APMIXED
clocks use 1-based IDs, reaching up to CLK_APMIXED_VDECPLL =3D 10.

When mtk_clk_register_plls() writes the hardware pointer using the ID as the
index:

drivers/clk/mediatek/clk-pll.c:mtk_clk_register_plls() {
    ...
		clk_data->hws[pll->id] =3D hw;
    ...
}

It writes to clk_data->hws[10] for CLK_APMIXED_VDECPLL, causing an
out-of-bounds memory overwrite.

Additionally, this breaks device tree lookups because of_clk_hw_onecell_get=
()
strictly checks that the index is less than hw_data->num, so looking up
CLK_APMIXED_VDECPLL will return -EINVAL.

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013151734.3177=
690-1-akkun11.open@gmail.com?part=3D26
