Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD5D484227
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 10:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937161; cv=none; b=eXx8W9Kjr8JlBjQ383Ac16jhSIFsoxUoVCnuJeXXE3qN0kISN+ojrpUN7VrA12VZ592dyCv+noUAp8nLBJtbPD+n8eB6VA50E+SQiEQbbj8+WJXDKPPnLd5xMprjBVkTiEayloynCizWTfkcpIep8jj9zZN6wW1jvVfgfCoNPQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937161; c=relaxed/simple;
	bh=LW/8uHtir8x31QlmcMdPFXU8Om72Wd8P9PbqoWw1bZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=usU0YBqlLm4kDKsF/wtl5tlbh8wiiPmNNtZmDRirc6DHvGpMC9+OG8YTkVhip8BGheJG+glgMpsHB3ZKHNjkQQ41ta0tQhCMhwt8MBmOO4e4It3vMVNQ0T+GTZs2urTRZWZOYZg4G1yTRoDfdSrMFLIJVoo7yrdtTrkbdK3OIjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4EpwwMJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4EpwwMJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C24C1F000FF;
	Fri,  2 Oct 2026 10:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790937159;
	bh=0qovhc8ZtwF1Rj8fSOJB6ZJY8DJhnjwShqLS6cpBuJc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X4EpwwMJ6CJZBEEgawkY7ZYeQNOtdBY6TvR7PGyIjpwMiN7SOZnebrr4HomUHkal/
	 0+rZwY20muZomL8BRT23zaQx1tNEaErtFX+yZfZM5yX/ufvItaeHOSkiclw/eY861l
	 vPj/1HkxoRsEcSv74KJXdZazDspIyk5ArZN1Wtd0JJHVSlvm/w76Ld8N4XVSdqe28X
	 fJPDxcTPSLM3PJ446jz3gZ0xxoRw7Y3biOkSx8Bt8UBTvy9P7OYSea500HzGQJN9eC
	 X23Ose5w2RmRrNV7ev9GPKzW/tG90btJcttSfXtkORCqbOyWoPk4RBKuKlDTUPjr3M
	 XKEY2aPaPE34Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] clk: socfpga: agilex5: register the SP timer
 clocks early
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <cc6e826f93e113e42fbba46f7da2ad8cda7cdb57.1790935401.git.adrian.ho.yin.ng@altera.com>
References: <cover.1790935401.git.adrian.ho.yin.ng@altera.com>
 <cc6e826f93e113e42fbba46f7da2ad8cda7cdb57.1790935401.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 10:32:38 +0000
Message-Id: <20261002103239.6C24C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] clk: socfpga: Use-After-Free of IOMEM on probe failure
- [High] clk: socfpga: loss of early clocks on early provider failure
- [Medium] clk: socfpga: memory and iomem leaks on init error paths
--

commit 41c265642a4fb3df23199b307d15dbfdc7f70409
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: clk: socfpga: agilex5: register the SP timer clocks early

This commit registers the SP timer clocks early from of_clk_init() because
they are probed from time_init() and cannot defer. The remaining clocks are
registered when the platform driver probes, reusing the early provider.

> diff --git a/drivers/clk/socfpga/clk-agilex5.c b/drivers/clk/socfpga/clk-=
agilex5.c
> index f7f0ad884f645..e439950dd6da7 100644
> --- a/drivers/clk/socfpga/clk-agilex5.c
> +++ b/drivers/clk/socfpga/clk-agilex5.c

[ ... ]

> @@ -486,35 +502,92 @@ static int agilex5_clk_register_pll(const struct ag=
ilex5_pll_clock *clks,
>  	return 0;
>  }
> =20
> -static int agilex5_clkmgr_init(struct platform_device *pdev)
> +static struct stratix10_clock_data *agilex5_clk_data;
> +
> +static struct stratix10_clock_data *agilex5_clk_data_alloc(void __iomem =
*base)
>  {
> -	struct device_node *np =3D pdev->dev.of_node;
> -	struct device *dev =3D &pdev->dev;
>  	struct stratix10_clock_data *clk_data;
> -	void __iomem *base;
> -	int i, num_clks;
> -
> -	base =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> -
> -	num_clks =3D AGILEX5_NUM_CLKS;
> +	int i;
> =20
> -	clk_data =3D devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
> -				num_clks), GFP_KERNEL);
> +	clk_data =3D kzalloc(struct_size(clk_data, clk_data.hws, AGILEX5_NUM_CL=
KS),
> +			   GFP_KERNEL);
>  	if (!clk_data)
> -		return -ENOMEM;
> +		return NULL;
> =20
>  	clk_data->base =3D base;
> -	clk_data->clk_data.num =3D num_clks;
> +	clk_data->clk_data.num =3D AGILEX5_NUM_CLKS;
> +
> +	for (i =3D 0; i < AGILEX5_NUM_CLKS; i++)
> +		clk_data->clk_data.hws[i] =3D ERR_PTR(-EPROBE_DEFER);
> =20
> -	for (i =3D 0; i < num_clks; i++)
> -		clk_data->clk_data.hws[i] =3D ERR_PTR(-ENOENT);
> +	return clk_data;
> +}

[ ... ]

> +static void __init agilex5_clkmgr_early_init(struct device_node *np)
> +{
> +	struct stratix10_clock_data *clk_data;
> +	void __iomem *base;
> +
> +	base =3D of_iomap(np, 0);
> +	if (!base) {
> +		pr_err("%s: failed to map clock registers\n", __func__);
> +		return;
> +	}
> +
> +	clk_data =3D agilex5_clk_data_alloc(base);
> +	if (!clk_data) {
> +		iounmap(base);
> +		return;
> +	}
> +
> +	agilex5_clk_register_early(clk_data);
> +
> +	if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_da=
ta)) {
> +		pr_err("%s: failed to add clock provider\n", __func__);
> +		return;
> +	}

[Severity: Medium]
Does this code leak the mapped IOMEM base and the allocated clk_data on fai=
lure?
Returning directly here without calling iounmap() and kfree() will permanen=
tly
leak them.

[Severity: High]
If of_clk_add_hw_provider() fails here, agilex5_clk_data remains NULL but t=
he
early clocks are already registered in the Common Clock Framework (CCF).

During late init, agilex5_clkmgr_init() sees agilex5_clk_data is NULL and
attempts to re-register the early clocks. CCF rejects the duplicate names,
causing the early clock indices in the new clk_data to remain ERR_PTR.
The late provider registration succeeds but without the early clocks, break=
ing
consumers that need them.

Could this code deregister the early clocks on this error path, or handle
the registration failure differently to prevent this?

> +
> +	agilex5_clk_data =3D clk_data;
> +}

[ ... ]

> @@ -526,8 +599,15 @@ static int agilex5_clkmgr_init(struct platform_devic=
e *pdev)
>  	agilex5_clk_register_gate(agilex5_gate_clks,
>  				  ARRAY_SIZE(agilex5_gate_clks), clk_data);
> =20
> -	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
> -	return 0;
> +	for (i =3D 0; i < AGILEX5_NUM_CLKS; i++)
> +		if (clk_data->clk_data.hws[i] =3D=3D ERR_PTR(-EPROBE_DEFER))
> +			clk_data->clk_data.hws[i] =3D ERR_PTR(-ENOENT);
> +
> +	if (clk_data =3D=3D agilex5_clk_data)
> +		return 0;
> +
> +	return of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get,
> +				      &clk_data->clk_data);
>  }

[Severity: High]
Does this error path result in a use-after-free of the IOMEM base?

If clk_data was allocated dynamically in this function and
of_clk_add_hw_provider() fails, the probe function returns an error, which
triggers devres to unmap the IOMEM base. However, the clocks were registered
into the CCF without devres management and remain globally accessible.
If they are accessed later, they will dereference the unmapped IOMEM base.

[Severity: Medium]
Additionally, if of_clk_add_hw_provider() fails, does this code leak the
dynamically allocated clk_data structure? Since agilex5_clk_data_alloc() was
changed from using devm_kzalloc() to kzalloc(), it requires manual cleanup
on failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790935401.gi=
t.adrian.ho.yin.ng@altera.com?part=3D2
