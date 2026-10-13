Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E501151CF64
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 17:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910863; cv=none; b=o3UgtBjJepbigTsd0alJwktvEL3fbNhKGuXvb/b8LveLCpHlxfajynyHax7ZeIBYYOX6OcWrG/1yDGJGx/ySTa48Tg/Oc7pT0pFhupI0M08/m/LZRmi281BpHy2dXYIhPZJabDbymp5b27IUCBQlmfF8e3wr8zr7ZaC41ZQz+Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910863; c=relaxed/simple;
	bh=8W4LKPvV4v7PlyWREvOa9W6pEZnn3qr9igYUlgJBVOc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lsq4FZhRY0gpqz7DVwpZnR6TmZIznEPr+3Ju3bTpbjInLaK30+nVeT/WAGrr53L3iiyQPzGMr94vUNGJ4kyrmbiWtxFKjUkGI0RUxPWsAXPCRDoBndsqR2//ov2nQvUFGki8lDjf8V7azM3huoE+RQIGsgduNWQIfeD7cildW7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m3Yu+QWs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m3Yu+QWs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E05A1F000FF;
	Tue, 13 Oct 2026 17:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791910861;
	bh=b8Vmp9rhSEahU61UvwwunH/VIYOHmqMpfZ5KF8DFeUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m3Yu+QWs88mAlQ6Wl2TPgwHrWUGIxxHHnuRN6QrDFJ0nfvCB5GqDTvQ5uTEJcyjN7
	 wG84EmSSOrH9ZQ5S5ORN2yvjjEZCogRv040IwK8lylOoGWpzyDlK1O9YBr47LGODFs
	 9GkQPsZRPUFVbjGPlUS3RdrZuayRZq/rbDYSJKYCnwlcWtyPnRVTahwq46dwdSFA16
	 hrTZHvyE1b+t6KSILjmQIhBpqaE47/e3TNIjnA2yXKC/W85JmB74BW+am48RB6vTcE
	 SX/0/d4w68G9Ya5/IuCI5Af0kHU5wHct3b/NkmeIj+3voSfohng2jmzIGUeJTHLpmw
	 Kn++4kG1PHPvQ==
Message-ID: <sashiko-outbox-170182@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 28/35] clk: mediatek: mt8173-infracfg: Switch to
 common probe/remove helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261013151734.3177690-29-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
 <20261013151734.3177690-29-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 17:01:00 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: mediatek: early timer initialization breaks due to removal of=
 CLK_OF_DECLARE_DRIVER
- [High] clk: mediatek: out-of-bounds array write in mtk_clk_simple_probe d=
ue to sparse IDs
--

commit cabfa228cff0aa82afbc9489448b517cc6478e89
Author: Akari Tsuyukusa <akkun11.open@gmail.com>

clk: mediatek: mt8173-infracfg: Switch to common probe/remove helpers

The MT8173 infracfg driver previously needed custom probe/remove
callbacks to register and unregister cpumux. With cpumux support now
available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

> diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/med=
iatek/clk-mt8173-infracfg.c
> index 9b8c358977891..fdd994736e833 100644
> --- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c

[ ... ]

> @@ -70,95 +68,29 @@ static const struct mtk_clk_rst_desc clk_rst_desc =3D=
 {
>  	.rst_bank_nr =3D ARRAY_SIZE(infrasys_rst_ofs),
>  };
> =20
> +static const struct mtk_clk_desc infracfg_desc =3D {
> +	.clks =3D infra_gates,
> +	.num_clks =3D ARRAY_SIZE(infra_gates),
> +	.factor_clks =3D infra_divs,
> +	.num_factor_clks =3D ARRAY_SIZE(infra_divs),
> +	.cpumuxes =3D cpu_muxes,
> +	.num_cpumuxes =3D ARRAY_SIZE(cpu_muxes),
> +	.rst_desc =3D &clk_rst_desc,
> +};

[Severity: High]
Does this code under-allocate the clock array by using the sum of element
counts rather than the maximum clock ID?

The transition to mtk_clk_simple_probe() calculates num_clks by summing the
array sizes in infracfg_desc (11 gates + 1 factor + 2 cpumuxes =3D 14 eleme=
nts).
Consequently, mtk_alloc_clk_data(14) allocates exactly 14 elements.

However, mt8173-infracfg uses sparse IDs. For example, CLK_INFRA_CA72SEL is
defined as 14. When mtk_clk_register_cpumuxes() registers this cpumux, it
attempts to assign the clock pointer to clk_data->hws[14]:

drivers/clk/mediatek/clk-cpumux.c:mtk_clk_register_cpumuxes() {
    ...
		clk_data->hws[mux->id] =3D hw;
    ...
}

This performs an out-of-bounds write past the end of the allocation. The
previous custom probe avoided this by explicitly allocating CLK_INFRA_NR_CLK
elements.

>  static const struct of_device_id of_match_clk_mt8173_infracfg[] =3D {
> -	{ .compatible =3D "mediatek,mt8173-infracfg" },
> +	{ .compatible =3D "mediatek,mt8173-infracfg", .data =3D &infracfg_desc =
},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_infracfg);
> =20
> -static void clk_mt8173_infra_init_early(struct device_node *node)
> -{
> -	int i;
> -
> -	infra_clk_data =3D mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
> -	if (!infra_clk_data)
> -		return;
> -
> -	for (i =3D 0; i < CLK_INFRA_NR_CLK; i++)
> -		infra_clk_data->hws[i] =3D ERR_PTR(-EPROBE_DEFER);
> -
> -	mtk_clk_register_factors(infra_early_divs,
> -				 ARRAY_SIZE(infra_early_divs), infra_clk_data);
> -
> -	of_clk_add_hw_provider(node, of_clk_hw_onecell_get, infra_clk_data);
> -}
> -CLK_OF_DECLARE_DRIVER(mtk_infrasys, "mediatek,mt8173-infracfg",
> -		      clk_mt8173_infra_init_early);

[Severity: High]
Does removing CLK_OF_DECLARE_DRIVER break early timer initialization?

The MT8173 device tree defines a system timer matching mediatek,mt6577-time=
r,
which depends on CLK_INFRA_CLK_13M. This timer is initialized during early =
boot
via TIMER_OF_DECLARE running synchronously from timer_probe().

By removing CLK_OF_DECLARE_DRIVER from mt8173-infracfg, the infracfg clock
provider is deferred to the standard platform module probe phase. When
timer_probe() executes early in boot, of_clk_get() for CLK_INFRA_CLK_13M
returns -EPROBE_DEFER.

Since timer_probe() completely ignores deferred probing and never retries:

drivers/clocksource/timer-probe.c:timer_probe() {
    ...
		ret =3D init_func_ret(np);
		if (ret) {
			if (ret !=3D -EPROBE_DEFER)
				pr_err("Failed to initialize '%pOF': %d\n", np, ret);
			continue;
		}
    ...
}

This causes the system to permanently lose its mt6577-timer (clocksource,
clockevents, and sched_clock), leading to a boot regression.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013151734.3177=
690-1-akkun11.open@gmail.com?part=3D28
