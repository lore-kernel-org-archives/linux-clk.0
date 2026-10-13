Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6211047F3A7
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 16:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909070; cv=none; b=fZKm3lMxeQjvHRKH/uwXPJ9PdHVmR9K0dzeT8VrivTPFnEFOkcVTTm7rGUrym3pmPSi7s0B4SZd9AAp/AVU0wwY8b59Tk2jYSP2otBaMOwuKczAucEEJq+N/yBeLWUGoqhid7DkC2LyctaZmR2ByJ/7CxB7YW2EFcuCKadfLmaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909070; c=relaxed/simple;
	bh=VDjL5H6BKHjY86uGVwFKtuP8Z7TsUlu+mWaWAKgXsHE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=pWMotk/C/eoJXHS9VbbvqXONStf81nBsw/37hj3X4kHPxyhnx+knSV0tScacMxYVGoC0sq0UjGI3LO9ZDXjYeSvoQvbmyYveGEkNt/C4Rst2odTMEsZhFMVtcsiZhOWxCf5QKk1ay4x6aJtppWRSBl5uSEHHbFUQ8KWLEVzhhlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghYRpcDh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghYRpcDh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3EB1F000FF;
	Tue, 13 Oct 2026 16:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791909069;
	bh=c0vJ/ClRjvu2EhwBUU6IaOsVNDLCLeiZUBK4mL1Uo6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ghYRpcDhcqBANhbf5hnXprgCeuPSFcFIfRl+lY/PtBwjvfDlK9TmzUs/5OjPANtw1
	 DY4YYewHLn8hvqOrZy1Ko2zWzWgR2RoKHDoiPNSSb18QRmg+OHeD0cjM+SYZqRTelr
	 ja6lZZvkoI7PKl5phVlAf97I5cEXIn4zCFymq0ocDoFv0l+rUUu3e9jRsp8CPaCurN
	 7PaZcJHg3onmBg6xNDczBHsPuscpCqdDH8bsHNk+YmWsBh0hzCUmq++0Cj0SM1IJqd
	 w/CCqhHEbfpy6fIgeaXkyNCTjXYmO+4O7i64o//Q+sf+MQZ8n0kLXQkxhp2S+jmcpB
	 9Y1Hr7LHOP29w==
Message-ID: <sashiko-outbox-170116@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 19/35] clk: mediatek: mt6779: Switch to common
 probe/remove helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261013151734.3177690-20-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
 <20261013151734.3177690-20-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 16:31:08 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: heap buffer overflow during clock registration due to sparse =
IDs
--

commit 667fb3289a24a54cc5cde32a40e6a991c9fdb902
Author: Akari Tsuyukusa <akkun11.open@gmail.com>

clk: mediatek: mt6779: Switch to common probe/remove helpers
   =20
The MT6779 apmixedsys driver used a custom probe to register PLLs.
With PLL registration now supported by the common helpers, it can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

> diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk=
-mt6779.c
> index 4b9dcb910b03f..a806789ae27c1 100644
> --- a/drivers/clk/mediatek/clk-mt6779.c
> +++ b/drivers/clk/mediatek/clk-mt6779.c
[ ... ]
> @@ -1211,125 +1209,47 @@ static const struct mtk_pll_data plls[] =3D {
>  	    0, 0, 32, 8, 0x02D4, 1, 0, 0x14, 1, 0x02D8, 0, 0x02D4),
>  };
> =20
> -static int clk_mt6779_apmixed_probe(struct platform_device *pdev)
> -{
> -	struct clk_hw_onecell_data *clk_data;
> -	struct device_node *node =3D pdev->dev.of_node;
> -
> -	clk_data =3D mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
> -	if (!clk_data)
> -		return -ENOMEM;
> -
> -	mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
> -
> -	mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
> -			       ARRAY_SIZE(apmixed_clks), clk_data);
> -
> -	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> -}
> -
> -static int clk_mt6779_top_probe(struct platform_device *pdev)
> -{
> -	void __iomem *base;
> -	struct clk_hw_onecell_data *clk_data;
> -	struct device_node *node =3D pdev->dev.of_node;
> -
> -	base =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> -
> -	clk_data =3D mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> -	if (!clk_data)
> -		return -ENOMEM;
> -
> -	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
> -				    clk_data);
> -
> -	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
> -
> -	mtk_clk_register_muxes(&pdev->dev, top_muxes,
> -			       ARRAY_SIZE(top_muxes), node,
> -			       &mt6779_clk_lock, clk_data);
> -
> -	mtk_clk_register_composites(&pdev->dev, top_aud_muxes,
> -				    ARRAY_SIZE(top_aud_muxes), base,
> -				    &mt6779_clk_lock, clk_data);
> -
> -	mtk_clk_register_composites(&pdev->dev, top_aud_divs,
> -				    ARRAY_SIZE(top_aud_divs), base,
> -				    &mt6779_clk_lock, clk_data);
> -
> -	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> -}
> -
[ ... ]
> +static const struct mtk_clk_desc apmixed_desc =3D {
> +	.clks =3D apmixed_clks,
> +	.num_clks =3D ARRAY_SIZE(apmixed_clks),
> +	.plls =3D plls,
> +	.num_plls =3D ARRAY_SIZE(plls),
>  };
> =20
> +static const struct mtk_clk_desc topck_desc =3D {
> +	.fixed_clks =3D top_fixed_clks,
> +	.num_fixed_clks =3D ARRAY_SIZE(top_fixed_clks),
> +	.factor_clks =3D top_divs,
> +	.num_factor_clks =3D ARRAY_SIZE(top_divs),
> +	.mux_clks =3D top_muxes,
> +	.num_mux_clks =3D ARRAY_SIZE(top_muxes),
> +	.composite_clks =3D top_aud_muxes_divs,
> +	.num_composite_clks =3D ARRAY_SIZE(top_aud_muxes_divs),
> +	.clk_lock =3D &mt6779_clk_lock,
> +};

[Severity: High]
Does this struct initialization fail to account for sparse DT binding IDs?

The previous code allocated clk_data using a maximum bounds macro, for
example mtk_alloc_clk_data(CLK_TOP_NR_CLK).

By switching to mtk_clk_simple_probe(), it appears __mtk_clk_simple_probe()
calculates the number of clocks by simply summing the array sizes (e.g.
num_fixed_clks + num_factor_clks + ...), which may total fewer than 100
elements.

However, the clock registration functions like mtk_clk_register_composites()
write directly into clk_data->hws[mc->id] =3D hw, where mc->id uses the spa=
rse
DT binding IDs (such as CLK_TOP_UNIVPLL_D3_D16, which is 152).

Can this overflow the dynamically allocated clk_data->hws flexible array and
corrupt heap memory during probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013151734.3177=
690-1-akkun11.open@gmail.com?part=3D19
