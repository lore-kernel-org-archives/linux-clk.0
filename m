Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E841847F3A1
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937325; cv=none; b=G5k+LLs/kq78YG/ZhmnWmla7t02ihV3S2tAgijT4SK9YVAZ68s2VCpZ/ofsuYmpZkjFpwnDCyMK/gL3dmn8o+cRn0mBRN/Cywoa9yc575zUH3EC/KPGlAEBENNRdHdXHUabMkvPVuEf4G1NE5rBHaccfhAExWw0f8Jv27Qa8v54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937325; c=relaxed/simple;
	bh=5QWp2uhF76R39u41+1oeJWoMQvajnENrgq3uaCojZaU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tUGDRp/yADDE6TbBbpT2KwHGWy+bAsL8YUKtp+VREVxnrHipJ3adEtaIVSoaOgaqvqM9L47VL2LNeIixYJoDEDdFEfTN7SU5dY5M6E1jEvzi1EiHzDD06TPTqMtWutji83k+9vFQTBTS83P1FxLxkLIxXMEA+YXoetgrNAgVMl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOD8jLj2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOD8jLj2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0531F000FF;
	Fri,  2 Oct 2026 10:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790937318;
	bh=XjphhJgW/nGZqEpN1eYi7P3d2EW1iyRoLYV2FNXoJlg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GOD8jLj2S7vb11YsOFX8pG9KCXNoJaUKBP27FoH1cbnmDaMwzvM7lv2+nBGY5SHwp
	 osNbk7b3hJRrKfysE8IEtJYHVA7LcioUSsPwbzQk1RlfB9AcNSTJ30H5zi67+R8DQJ
	 6rXWMf6hpiLj4qMheorGVmO0B8jnoh41aaVCDSFk8mFgTC4vqCr0uNKwOBeWO8rjic
	 QLWU5VUwvf8ZME0bkqtyakdW8e4dHz/Hl8aWSgxAZ/w7gX0ZXGkdqW/l7O3a4OHoFG
	 RJpW4z/oovsER1gczAagVKBTPAXisaJsxm7vdb5HvjU1GdVOhfAGsrMf6OdP13R90q
	 dsEXxvnrGVawQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] clk: socfpga: stratix10: register the SP timer
 clocks early
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <3164e6dcf09ca68c2ff9537b0f96aefcc793366a.1790935401.git.adrian.ho.yin.ng@altera.com>
References: <cover.1790935401.git.adrian.ho.yin.ng@altera.com>
 <3164e6dcf09ca68c2ff9537b0f96aefcc793366a.1790935401.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 10:35:18 +0000
Message-Id: <20261002103518.AD0531F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] clk: socfpga: use-after-free of unmapped IO memory on probe failure
- [Medium] clk: socfpga: memory leak of clk_data on probe error
- [Medium] clk: socfpga: incomplete early init rollback causes fatal regist=
ration conflicts
--

commit 68e80ef968cd718473fa02d4989427b8a0ddd324
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

clk: socfpga: stratix10: register the SP timer clocks early

The patch registers the SP timer clocks early using CLK_OF_DECLARE_DRIVER()
to prevent probe deferral, while deferring the remaining clocks to the
platform driver probe.

> diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
> index b4bf4e2d38e16..7eae2dfa408d5 100644
> --- a/drivers/clk/socfpga/clk-s10.c
> +++ b/drivers/clk/socfpga/clk-s10.c

[ ... ]

> +static struct stratix10_clock_data *s10_clk_data_alloc(void __iomem *bas=
e)
> +{
> +	struct stratix10_clock_data *clk_data;
> +	int i;
> +
> +	clk_data =3D kzalloc(struct_size(clk_data, clk_data.hws, STRATIX10_NUM_=
CLKS),
> +			   GFP_KERNEL);
> +	if (!clk_data)
> +		return NULL;

[ ... ]

> +static void __init s10_clkmgr_early_init(struct device_node *np)
>  {

[ ... ]

> +	s10_clk_register_early(clk_data);
> =20
> -	for (i =3D 0; i < num_clks; i++)
> -		clk_data->clk_data.hws[i] =3D ERR_PTR(-ENOENT);
> +	if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_da=
ta)) {
> +		pr_err("%s: failed to add clock provider\n", __func__);
> +		return;
> +	}

[Severity: Medium]
If of_clk_add_hw_provider() fails here, does it leave the globally register=
ed
early clocks active but without a provider?

Since s10_clk_data is left as NULL, won't the fallback probe s10_clkmgr_ini=
t()
attempt to re-register the early clocks via s10_clk_register_early()? Could
this cause a fatal name collision (-EEXIST) in the clock framework and
permanently deprive downstream consumers of the early clocks?

> -	s10_clk_register_pll(s10_pll_clks, ARRAY_SIZE(s10_pll_clks), clk_data);
> +	s10_clk_data =3D clk_data;
> +}
> +
> +CLK_OF_DECLARE_DRIVER(stratix10_clkmgr, "intel,stratix10-clkmgr",
> +		      s10_clkmgr_early_init);
> +
> +static int s10_clkmgr_init(struct platform_device *pdev)
> +{
> +	struct stratix10_clock_data *clk_data =3D s10_clk_data;
> +	void __iomem *base;
> +	int i;
> +
> +	if (!clk_data) {
> +		base =3D devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(base)) {
> +			pr_err("%s: failed to map clock registers\n", __func__);
> +			return PTR_ERR(base);
> +		}
> +
> +		clk_data =3D s10_clk_data_alloc(base);
> +		if (!clk_data)
> +			return -ENOMEM;
> +
> +		s10_clk_register_early(clk_data);
> +	}

[ ... ]

> -	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
> -	return 0;
> +	for (i =3D 0; i < STRATIX10_NUM_CLKS; i++)
> +		if (clk_data->clk_data.hws[i] =3D=3D ERR_PTR(-EPROBE_DEFER))
> +			clk_data->clk_data.hws[i] =3D ERR_PTR(-ENOENT);
> +
> +	if (clk_data =3D=3D s10_clk_data)
> +		return 0;
> +
> +	return of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get,
> +				      &clk_data->clk_data);
>  }

[Severity: Medium]
If of_clk_add_hw_provider() fails here and propagates the error directly, d=
oes
it leak the clk_data allocation?

Since clk_data is now allocated with kzalloc() in s10_clk_data_alloc()
instead of devm_kzalloc(), bypassing explicit cleanup on this error path
appears to permanently leak the memory.

[Severity: High]
Does propagating the error from of_clk_add_hw_provider() also cause a
use-after-free on unmapped IO memory?

If the fallback probe mapped base using devm_platform_ioremap_resource(), a
probe failure will trigger devres cleanup and automatically unmap base.
However, since the clocks were registered without being tied to devres in
s10_clk_register_early(), they remain globally active and hold pointers to =
the
now unmapped IO memory.

Could any subsequent access by the clock framework to these clocks derefere=
nce
the unmapped memory and lead to a kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790935401.gi=
t.adrian.ho.yin.ng@altera.com?part=3D3
