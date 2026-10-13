Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8EA388E6F
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875993; cv=none; b=R0+LtUl6YAP5nSDPOY9NZNM4clExHIHBUOWkqSELhDcUMH5I3f2f9dQ26uYBmYH3pkMHpWvtPixDOWtywnQrPeJS/ZF5z16JRKFZCz1duD3YgWMR5rKOwzKd3fUrgmDKy5ZE4cmJ0TcUdPf0cC/LFH437xi6cd3fUrznrT8ON+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875993; c=relaxed/simple;
	bh=EmiZWN+5eFjUgHbK3+ugLcHCUfISddp1H3Wbi4Q2mAM=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=tz5nbMNPxFB5z+rP8Qaf7cbuPjTz1LAz+JNHLInrdRphrlMXZqAbPpBz6tD/LGencTOvxoKn2XMtgr7+5RTo+jXHGAn4lTwXPzaiKGHFjYasuoQNMr+HJKfNGa+z5v8QSVvdC3GoADCSSMqejOZzWMyiYRv6lRQP1AIS/o7j0No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IF0yxu/F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IF0yxu/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340BD1F000FF;
	Tue, 13 Oct 2026 07:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791875992;
	bh=KVL1bMp+ZSHVxT9JkS0p/HQnlihcB2Baw+rC7hSzskg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=IF0yxu/FmRNApsGXfr0k9MYNp1BiuCsg853tFGb6V/0n96D+U4p8/2uJ7Fa8N0O8j
	 xxemHXhdfGeEps7ZiYxFtOfDu45CTeiCSLwe/OUV8CczutyrOO6qQFLdYySCRW08uA
	 FoAevTi8J8ooRItk1UNyVilTeoweUGxRgphFTkZ4oababbDTMwyjeyGKhXczB8EAwI
	 imUcLLDNBIzPTDU19NH76YM4U9hhHccJ9itZFu0jeG2eNB8/KSG9hhffAtZubMPnzq
	 pitemQx3PeYIcKgpIwzZK29kfdsTT1Gk+NGYEIpg2Jh8H8Rm6isURUtn41hdv+dgMp
	 ZBRsdF4qxKexg==
Message-ID: <sashiko-outbox-169179@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] clk: socfpga: agilex5: register the SP timer
 clocks early
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>, linux-clk@vger.kernel.org
In-Reply-To: <289d5974c114e5bc71905e576a08302f7d8be6f5.1791871090.git.adrian.ho.yin.ng@altera.com>
References: <cover.1791871090.git.adrian.ho.yin.ng@altera.com>
 <289d5974c114e5bc71905e576a08302f7d8be6f5.1791871090.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 07:19:51 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: data race and missing barriers when mutating exposed hws array
--

commit b3256fb3551a9baf9b48df9a42da38b26efc5524
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

clk: socfpga: agilex5: register the SP timer clocks early

The DW APB timers are probed through TIMER_OF_DECLARE() from time_init()
and cannot defer, but the clock manager is a platform driver registered
at core_initcall(). The timer's clk_get() therefore fails and the timer
is never brought up.

Register only l4_sp_clk and its parents (boot_clk, main_pll, periph_pll,
main_pll_c3, peri_pll_c1 and noc_free_clk) from of_clk_init() using
CLK_OF_DECLARE_DRIVER(), with every other clock left as -EPROBE_DEFER.
The remaining clocks are still registered when the platform driver
probes, which reuses the early provider.

> diff --git a/drivers/clk/socfpga/clk-agilex5.c b/drivers/clk/socfpga/clk-=
agilex5.c
> index f7f0ad884f645..50dba11ab45ec 100644
> --- a/drivers/clk/socfpga/clk-agilex5.c
> +++ b/drivers/clk/socfpga/clk-agilex5.c

[ ... ]

> @@ -599,22 +620,25 @@ static int agilex5_clkmgr_init(struct platform_devi=
ce *pdev)
>  {
>  	struct stratix10_clock_data *clk_data;
>  	int i, ret;
> =20
>  	if (!agilex5_clk_data) {
>  		ret =3D agilex5_clkmgr_setup(pdev->dev.of_node);
>  		if (ret)
>  			return ret;
>  	}
> =20
>  	clk_data =3D agilex5_clk_data;
> =20
>  	agilex5_clk_register_c_perip(agilex5_main_perip_c_clks,
>  				     ARRAY_SIZE(agilex5_main_perip_c_clks),
>  				     clk_data);
> =20
>  	agilex5_clk_register_cnt_perip(agilex5_main_perip_cnt_clks,
>  				       ARRAY_SIZE(agilex5_main_perip_cnt_clks),
>  				       clk_data);
> =20
>  	agilex5_clk_register_gate(agilex5_gate_clks,
>  				  ARRAY_SIZE(agilex5_gate_clks), clk_data);

[Severity: High]
Since agilex5_clkmgr_early_init() publishes the hws array early via
of_clk_add_hw_provider(), can concurrent clock consumers access this array
while agilex5_clkmgr_init() is mutating it?

When agilex5_clk_register_c_perip() and agilex5_clk_register_gate() are
called here, they write newly allocated clocks directly into the shared
array:

agilex5_clk_register_c_perip() {
    ...
    data->clk_data.hws[clks[i].id] =3D hw_clk;
    ...
}

Because these assignments lack smp_store_release() and are not protected by
of_clk_mutex, could a consumer's of_clk_hw_onecell_get() observe the hw_clk
pointer before its initialization stores are visible in memory, leading to a
NULL pointer dereference or memory corruption?

> -	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
> -	return 0;
> +	for (i =3D 0; i < AGILEX5_NUM_CLKS; i++)
> +		if (clk_data->clk_data.hws[i] =3D=3D ERR_PTR(-EPROBE_DEFER))
> +			clk_data->clk_data.hws[i] =3D ERR_PTR(-ENOENT);

[Severity: High]
Can this loop mutate the exposed array concurrently with potential readers,
since it doesn't hold of_clk_mutex?

> +
> +	return agilex5_clkmgr_add_provider(pdev->dev.of_node);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791871090.gi=
t.adrian.ho.yin.ng@altera.com?part=3D2
