Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A6A44C66C
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937358; cv=none; b=fXkUAUa5R2jTkWMxURObHHO0xUICY0qIWLSC4Yb7VbQ+V99Cdb/lvNi7J2hncT3DvIroryoZW3ldbe4iI+6VznUzV/2P1xLhKfRDTDuvH/lu1tRkJhHXWfFJMqnCfLcjlaWkaxUz14WFlPNs9eSeY55GC3YFBWS+UC5rzzhjNkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937358; c=relaxed/simple;
	bh=V7lHTsHvZeDNZDQVCJstR4+kRVHO5Ma2v75ep6DRSzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=naCXFS1L0W+RduI8dRj0cdztELfMMc8pWarUejVHvyuVVm+4SsdM636oVsVkMn1RAmpargSdN9OmVZysoe8i6TJ4L2Md54cJGaIL+TTOb+zfsXccnedpdunJqvQ91H/xM2C1ASombOdtJTJy4dCZ+Xu87oKCqjT88VTW/GYIja8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8jwljFg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8jwljFg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E2D1F000FF;
	Fri,  2 Oct 2026 10:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790937356;
	bh=GVDybXNR0/PJT/sfEqUTOvL0hLdyiWMhUYOcrpJeZSs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b8jwljFgfnML5PzYEn8R3be8U8yNyiPcRiqytfXbvQd3tODvKrWgFt4YRwTu2zpXd
	 Tgs9F2MVS3WEjxZuesCKhW5PFIwSBQIss/bnFe/7TzzABKBgrGTvnXSUq5oySLaG3/
	 O2og8aM8CQu5YRPTya4nJOEjo9cEGi4vJoWFG0dCc4zgfuKTiHB4cN30M21E6ks5ZC
	 sIAjHbVMobix+ePDXYw1IDI5GtAHrFMv1OoG/zj7Prnarv2mbiz83n/WevP9v1V7b8
	 0wwc6r4VBGU01Eyx8clfsKb88kYPs5KirkbMP7GuzYtldjOxK6j0BIMQ+zP2OzZX41
	 Xa/msnCavScMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] clk: socfpga: agilex: register the SP timer
 clocks early
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <b0214433cf10ebc094c6685f60a12abe58860523.1790935401.git.adrian.ho.yin.ng@altera.com>
References: <cover.1790935401.git.adrian.ho.yin.ng@altera.com>
 <b0214433cf10ebc094c6685f60a12abe58860523.1790935401.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 10:35:55 +0000
Message-Id: <20261002103556.47E2D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] clk: socfpga: use-after-free of I/O memory on probe failure
- [Medium] clk: socfpga: memory and I/O mapping leaks on error paths
- [Medium] clk: socfpga: double registration of early clocks on provider fa=
ilure
--

commit 1aa58afee8b5118fcfe81945cc09867307ba4bd8
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: clk: socfpga: agilex: register the SP timer clocks early

This commit splits the clock registration for the Agilex platform into an
early initialization phase to support timers that require clocks before
core_initcall, and defers the remaining clocks to the platform driver probe.

> diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-a=
gilex.c
> index 2bdea1997b5ef..91a80b7b1886a 100644
> --- a/drivers/clk/socfpga/clk-agilex.c
> +++ b/drivers/clk/socfpga/clk-agilex.c

[ ... ]

> +static void __init
> +agilex_clkmgr_of_init(struct device_node *np,
> +		      void (*register_early)(struct stratix10_clock_data *))
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
> +	clk_data =3D agilex_clk_data_alloc(base);
> +	if (!clk_data) {
> +		iounmap(base);
> +		return;
> +	}
> +
> +	register_early(clk_data);
> +
> +	if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_da=
ta)) {

[Severity: Medium]
If of_clk_add_hw_provider() fails, register_early() will have already
registered the clocks via the CCF APIs. Because agilex_clk_data is not set,
they become permanently inaccessible to consumers.=20

When the platform driver later probes, it will attempt to register these ea=
rly
clocks again because agilex_clk_data is still NULL. Can this result in
duplicate CCF name rejections, leaving the new array with -ENOENT?

> +		pr_err("%s: failed to add clock provider\n", __func__);
> +		return;

[Severity: Medium]
Does this error path leak the I/O mapping and memory? It appears of_iomap()
base and agilex_clk_data_alloc() clk_data are not cleaned up with
iounmap() and kfree() before returning.

> +	}
> +
> +	agilex_clk_data =3D clk_data;
> +}

[ ... ]

> +static int agilex_clkmgr_add_provider(struct platform_device *pdev,
> +				      struct stratix10_clock_data *clk_data)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < AGILEX_NUM_CLKS; i++)
> +		if (clk_data->clk_data.hws[i] =3D=3D ERR_PTR(-EPROBE_DEFER))
> +			clk_data->clk_data.hws[i] =3D ERR_PTR(-ENOENT);
> +
> +	if (clk_data =3D=3D agilex_clk_data)
> +		return 0;
> +
> +	return of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get,
> +				      &clk_data->clk_data);

[Severity: High]
If early init was skipped or failed, agilex_clkmgr_get_clk_data() maps I/O
memory using devm_platform_ioremap_resource() and registers clocks.

Unlike the original code which ignored the return value, this propagates the
error from of_clk_add_hw_provider(). Returning the error causes the driver
core's devres to unmap the memory, but the clocks remain globally registere=
d in
CCF with raw pointers to the unmapped base.

Can this lead to a use-after-free of devm-managed I/O memory if CCF attempts
to read from the unmapped base during operations like debugfs reads?

> +}
> +
> +static int agilex_clkmgr_init(struct platform_device *pdev)
> +{
> +	struct stratix10_clock_data *clk_data;
> +
> +	clk_data =3D agilex_clkmgr_get_clk_data(pdev, agilex_clk_register_early=
);
> +	if (IS_ERR(clk_data))
> +		return PTR_ERR(clk_data);
> =20
>  	agilex_clk_register_c_perip(agilex_main_perip_c_clks,
>  				 ARRAY_SIZE(agilex_main_perip_c_clks), clk_data);
> @@ -490,36 +625,17 @@ static int agilex_clkmgr_init(struct platform_devic=
e *pdev)
> =20
>  	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
>  			      clk_data);
> +
> +	return agilex_clkmgr_add_provider(pdev, clk_data);

[Severity: Medium]
If agilex_clkmgr_add_provider() fails, probe returns an error. Does this le=
ak
the clk_data allocated by kzalloc() in agilex_clk_data_alloc()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790935401.gi=
t.adrian.ho.yin.ng@altera.com?part=3D1
