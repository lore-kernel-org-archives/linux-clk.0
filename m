Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25DA432BD3;
	Sat, 10 Oct 2026 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633770; cv=none; b=VW5rA0rxggKjZiOLMbowAMwczJ9rnG2hKxELC4yt1SZS1OvCil9WmMHtIGNvgAK+zPOaQi1w9KPfdEfU2IfCROHeoQ+JC8NuhOGQjsL/EW6145RCJiE4gswcxuWcsglFZWX7Vm714Tp8m3LI0TWFAGMT+WN2I5ankdnO7rtxNtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633770; c=relaxed/simple;
	bh=aNl+9/5g9ZzJDhAZcPTlaq/mPu9VyoT2YbisiQbeG1w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mFRi9Wtu2ObFlLhdfIRiIhX16hltrdW6+7xce49IxPrG1LQow1Zw+4RKVNewIxPK8YoQTD7Dra0ZVIWo4RWfHGf2N4OiU4SzwP/ir3seX73DMjMGy2YsS9zwbZnwz4+xTaJF2UY6ZfgXdhT4JcsYgg6Fll/h0MQTse+rR3xudjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCcUlRMY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCcUlRMY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26D31F000FF;
	Sat, 10 Oct 2026 12:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791633769;
	bh=WWuAeY5/fYrpvuYh4URg2y3Lj8NDhWWudUAt32JOsos=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cCcUlRMYHCk/Nf4MSx5xtb2aM4ZADdgWapVNcUK2pRDrC2DBhd35hp/km9su+53DB
	 a76deN13lJzYT6CqdZ5kzf/rznhOLR++Dbqml22l3pH9SKKR6LJT4Lh7KWYrs8qNLe
	 4cn5jcZFbw8rH6Ud+vtEEI4Y1jAWP0PILBW2oSs/OUdddf6mG8sNZ6KGlMXRbMbXqp
	 HzjzFYdVJrKGDLvPcBW3X4M2vtK1YQNiaVl37QPzDkcyrG1g3O0QO/+JYq740Q4ezz
	 DC7lon5R4xMYtR2IJbDmTTz5yDE1ZgOGv4YBKh7hP4MkVCtKwKfcrMrVk/atn+YxAy
	 eI1reby6dS9VA==
Message-ID: <sashiko-outbox-166483@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] clk: mediatek: mt8167: Map apmixedsys iomem as
 shared
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: robh@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, olteanv@gmail.com
In-Reply-To: <20261010115539.9237-4-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
 <20261010115539.9237-4-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 12:02:48 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] clk: mediatek: IS_ERR() used to check of_iomap() return value inst=
ead of NULL check
- [High] clk: mediatek: missing platform_set_drvdata() causes silent failur=
e in remove()
- [Medium] clk: mediatek: missing iounmap() for driver base mapping in remo=
ve()
--

commit 847eb51d406a77cda5e7387f55742129733ec7b6
Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>

clk: mediatek: mt8167: Map apmixedsys iomem as shared

The hdmi_phy for mt8167 and the apmixedsys clocks share the same IO
memory region and they both map it using devm_platform_ioremap_resource,
which implies exclusive access. Switch the apmixedsys driver to of_iomap,
like it is done in the mt8173-apmixedsys driver. Also, implement the
remove function while we're at it.

> diff --git a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8167-apmixedsys.c
> index fb6c21bbeef81..3e8611991de78 100644
> --- a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
[ ... ]
> @@ -97,17 +98,19 @@ static int clk_mt8167_apmixed_probe(struct platform_d=
evice *pdev)
>  	struct device *dev =3D &pdev->dev;
>  	int ret;
> =20
> -	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	base =3D of_iomap(node, 0);
>  	if (IS_ERR(base))

[Severity: High]
Does this code handle the of_iomap() return value correctly? of_iomap()
returns NULL on failure, rather than an ERR_PTR. If it fails, base will be
NULL, which bypasses this error check and propagates to the register
functions.

>  		return PTR_ERR(base);
> =20
>  	clk_data =3D mtk_devm_alloc_clk_data(dev, MT8167_CLK_APMIXED_NR_CLK);
> -	if (!clk_data)
> -		return -ENOMEM;
> +	if (IS_ERR_OR_NULL(clk_data)) {

[Severity: High]
Does this code need to save clk_data to the device's driver data? It looks
like clk_mt8167_apmixed_probe() allocates clk_data but never calls
platform_set_drvdata() to store it before returning.

> +		ret =3D -ENOMEM;
> +		goto unmap_io;
> +	}
[ ... ]
> @@ -124,10 +127,22 @@ static int clk_mt8167_apmixed_probe(struct platform=
_device *pdev)
>  	mtk_clk_unregister_dividers(adj_divs, ARRAY_SIZE(adj_divs), clk_data);
>  unregister_plls:
>  	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
> +unmap_io:
> +	iounmap(base);
> =20
>  	return ret;
>  }
> =20
> +static void clk_mt8167_apmixed_remove(struct platform_device *pdev)
> +{
> +	struct device_node *node =3D pdev->dev.of_node;
> +	struct clk_hw_onecell_data *clk_data =3D platform_get_drvdata(pdev);

[Severity: High]
Since platform_set_drvdata() was never called in the probe function, won't
platform_get_drvdata() evaluate to NULL here? This would render the
subsequent unregister calls as no-ops, failing to unregister the clocks.

[Severity: Medium]
Does this remove function leak the I/O memory mapping? The base mapping
created by of_iomap() in clk_mt8167_apmixed_probe() doesn't appear to be
unmapped via iounmap() here.

Since base is only a local variable in the probe function and isn't saved to
a device context, there is no way for clk_mt8167_apmixed_remove() to retrie=
ve
the pointer to clean it up.

> +
> +	of_clk_del_provider(node);
> +	mtk_clk_unregister_dividers(adj_divs, ARRAY_SIZE(adj_divs), clk_data);
> +	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010115539.9237=
-1-l.scorcia@gmail.com?part=3D3
