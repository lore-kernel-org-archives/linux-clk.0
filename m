Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5541951812D
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 16:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908608; cv=none; b=dOzDogZXrqHEityM8TUVNtA2NlX/n4FeMiHw+IH3QntktzE4TqliOd3nHGZD6bryi3b51LFsVpWyiomMT5ofDNOyAa3wYloPWIOiePO4/S2TCXiP8TIk0C7TpkUciBW0Db6W92FQnfw0QebHYbf2MTM4XKSNZbPlhN9/het/Hn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908608; c=relaxed/simple;
	bh=KqCY3iHN+FBtSoWp/1s17eiNxBWZtrCOg/2lE03zBoI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=q0D9/fSWfJ9BJTF9Hp9EokVSTjhFLt83JeVDnax1ObpqFg7KCyhUJMkSe076mIe1UyxZzUSE+/wQJUAUIVPS292w/OzsyuU9fWaqz0mXnnnJgI8zwlEIq9RrExTW4WcYVXm2FaxyOEoj7NKAi28TgFILH0xNFpRNiB5o14F3YGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBYQds2Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBYQds2Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FB21F000FF;
	Tue, 13 Oct 2026 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791908607;
	bh=8isl4HufXAWb/VC+0CjAvcY4aOI/aWtekVLySkH4oc4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bBYQds2Q14kL6zGISgbQ684CuaM8oRAhnugqipNm/TuX/dfKBOFHyg4OKVOEfBv2y
	 wJzb4WuNfb5F6QV3bgPB3EVXw667fDj+I3cKFQE7O7nueidZovv0jcAgBtW4BJm0RF
	 dVWv0kXzs3X1OCSv/z0yqeYpBmPYTos+smEXdfyCApVA3e7Hv8VmXiTKTp9UnKoh4R
	 9eKbeqCyDJT9HfVnwIho1Bju0C7JgBhhxY/LBPa7BKKqhgR3bsjVb3evwWOfFWapKM
	 MjaasTnhbrWdIbhtQBX6QmmMOTYqSzpY+w8ql35X1hM/a1zmEqxYK+dRfAls/1lj4z
	 B1hQ0VqM+BDGg==
Message-ID: <sashiko-outbox-170106@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 16/35] clk: mediatek: mt2701: Switch to common
 probe/remove helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261013151734.3177690-17-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
 <20261013151734.3177690-17-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 16:23:26 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] clk: mediatek: heap buffer overflow in mtk_clk_simple_probe() =
due to sparse clock IDs
- [High] clk: mediatek: UAF from __initconst cpu_muxes during deferred probe
--

commit 659dcd3d07d9476de418d05bc84f3a19e38f1127
Author: Akari Tsuyukusa <akkun11.open@gmail.com>

clk: mediatek: mt2701: Switch to common probe/remove helpers

The MT2701 topckgen and pericfg drivers register clock types already
supported by the common helpers, so their custom initialization
routines can be replaced with struct mtk_clk_desc.

> diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk=
-mt2701.c
> index 710c4f2f9f304..5ea0c4acaf1be 100644
> --- a/drivers/clk/mediatek/clk-mt2701.c
> +++ b/drivers/clk/mediatek/clk-mt2701.c

[ ... ]

> @@ -655,38 +656,19 @@ static const struct mtk_gate top_clks[] =3D {
>  		28),
>  };
> =20
> -static int mtk_topckgen_init(struct platform_device *pdev)
> -{

[ ... ]

> -	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> -}
> +static const struct mtk_clk_desc topck_desc =3D {
> +	.clks =3D top_clks,
> +	.num_clks =3D ARRAY_SIZE(top_clks),

[Severity: Critical]
Does this code cause a heap buffer overflow regression during probe?

Looking at __mtk_clk_simple_probe() in drivers/clk/mediatek/clk-mtk.c, it
allocates clk_data based on the sum of all element counts:

__mtk_clk_simple_probe()
    num_clks =3D mcd->num_clks + mcd->num_composite_clks;
    num_clks +=3D mcd->num_fixed_clks + mcd->num_factor_clks;
    ...
    clk_data =3D mtk_alloc_clk_data(num_clks);

Since the device tree clock IDs are sparse, the maximum clock ID can be much
larger than the total number of registered clocks.=20

When mtk_clk_register_gates() assigns the hardware clock to the index
matching its ID:

mtk_clk_register_gates()
    if (!IS_ERR_OR_NULL(clk_data->hws[cg->id])) {

won't it write out of bounds of the undersized array?

[ ... ]

> @@ -725,81 +707,21 @@ static const struct mtk_fixed_factor infra_fixed_di=
vs[] =3D {
>  static u16 infrasys_rst_ofs[] =3D { 0x30, 0x34, };
>  static u16 pericfg_rst_ofs[] =3D { 0x0, 0x4, };
> =20
> -static const struct mtk_clk_rst_desc clk_rst_desc[] =3D {

[ ... ]

> -	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc[0]);
> -
> -	return 0;
> -}
> +static const struct mtk_clk_desc infracfg_desc =3D {
> +	.clks =3D infra_clks,
> +	.num_clks =3D ARRAY_SIZE(infra_clks),
> +	.factor_clks =3D infra_fixed_divs,
> +	.num_factor_clks =3D ARRAY_SIZE(infra_fixed_divs),
> +	.cpumuxes =3D cpu_muxes,

[Severity: High]
Does this create a use-after-free regression for cpu_muxes?

The cpu_muxes array is annotated with __initconst. Previously it was used in
an early init callback, but this patch passes it to the standard platform
driver probe function mtk_clk_simple_probe() via the infracfg_desc.cpumuxes
pointer.

Since mtk_clk_simple_probe() can run during deferred probe or upon manual
sysfs bind after the module initialization sections have been freed, will t=
he
probe function access the freed cpu_muxes array?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013151734.3177=
690-1-akkun11.open@gmail.com?part=3D16
