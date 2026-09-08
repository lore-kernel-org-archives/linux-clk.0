Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3BE5964EF
	for <linux-clk@vger.kernel.org>; Tue,  8 Sep 2026 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890994; cv=none; b=qjQ9iFmYFhIdT/7ww9jJEQbbsWE3mxDzlMNR0byEHagKxQr8NXwtFvn0oKyifScCY6tUB5S0CQMmH/J8kt5VmmosmjZV8cfsWmPQYsz1SKbPNCsKFNdq+xapsFyztG10zHDh5viDhDOIIon2dRL+IU99SZDdowjpoSnmpIf9rd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890994; c=relaxed/simple;
	bh=6BDEWh969l9FypyeRAtf9c4IsCh8ekdYNyx/w/9Zn3g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FaKOS9Vf53AjfS4zuDuR3A85PF8S0HuWIx0kXNjswozMkVWSbruQWAY27bsct4ufcbZck37YK/9QLVnxVvDhYL85RngyNRQyveab5pvTXIgIpa3IjdXSSbu4ZFHSrxTiY8FA1IOoi2HhgH/jqrHcw8NLQSkGM5n6n/Tw3paRhlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQoGI9l9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQoGI9l9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793A41F00A3A;
	Tue,  8 Sep 2026 18:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890992;
	bh=eYEQoSqYKiPvXwSVJpBAzor56A+IcXWFMe8g7EgMr6A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NQoGI9l98cXvRY7QIwKH45CwYdoirOTuRNECyep5012uq9OhbDdvs2BLKQkMSQIoB
	 9a5zRRFNI37AF1ogorty1wiZDbYYlXNg1C3VTmeKKAhDl4q0HjrDuqOMkLi5j8VlS8
	 J3147Dy0gtgPFrUVFDtZU0bfHeLaQJYlHZz++EWVmS7BkvFdgfGsOzctCOXMj88HUO
	 KVMHROzqwEZBiMl4y1Jz5oUObXstOWtOvCaYeNRxjfWqbaVvGs3OJXqxWKo/B6Tpl2
	 80ZcIeYSYMeL/mlgtEpEhh/BupAKyqbMr+JfiB6OkLTVn10MJWYgu0tbcbL3uFxDVK
	 YwWaQgnEDdwSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] clk: renesas: convert drivers over to use
 subsys_platform_driver()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Brian Masney" <bmasney@redhat.com>
Cc: wsa+renesas@sang-engineering.com, linux-clk@vger.kernel.org
In-Reply-To: <20260908-subsys_initcall-v1-4-cbccf4cd4288@redhat.com>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-4-cbccf4cd4288@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 18:09:52 +0000
Message-Id: <20260908180952.793A41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing of_genpd_del_provider() on error paths leads to stale OF P=
M domain provider registrations and Critical Use-After-Free.
--

commit 26447fc60447ea2456fb17817135325feb86bdfb
Author: Brian Masney <bmasney@redhat.com>
Subject: clk: renesas: convert drivers over to use subsys_platform_driver()

Reduce boilerplate code in the drivers and convert them over to use
subsys_platform_driver().

> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas=
/renesas-cpg-mssr.c
> index 80f4403ea2baf..87b555e38980a 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
[ ... ]
> -static int __init cpg_mssr_init(void)
> -{
> -	return platform_driver_probe(&cpg_mssr_driver, cpg_mssr_probe);
> -}
> -
> -subsys_initcall(cpg_mssr_init);
> +subsys_platform_driver_probe(cpg_mssr_driver, cpg_mssr_probe);

[Severity: High]
This is a pre-existing issue, but I noticed a potential use-after-free
on the error path for cpg_mssr_probe().

In cpg_mssr_add_clk_domain(), the OF provider is successfully registered:

    return of_genpd_add_provider_simple(np, genpd);

However, there doesn't seem to be a corresponding devres cleanup registered
for this. If cpg_mssr_probe() fails later on, the devres cleanup routine
will call pm_genpd_remove() to unregister the PM domain.

Because of_genpd_add_provider_simple() sets genpd->has_provider =3D true,
pm_genpd_remove() will abort with -EBUSY and fail to remove the domain
from the global gpd_list.

Devres will then free the devm-allocated driver structure, which contains
the genpd struct.

Does this leave the global gpd_list and of_genpd_providers lists with
dangling pointers to the freed genpd struct, leading to memory corruption
when those lists are accessed later?

> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-=
cpg.c
> index 7f8decef92fd9..f6293c968bcf9 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
[ ... ]
> -static int __init rzg2l_cpg_init(void)
> -{
> -	return platform_driver_probe(&rzg2l_cpg_driver, rzg2l_cpg_probe);
> -}
> -
> -subsys_initcall(rzg2l_cpg_init);
> +subsys_platform_driver_probe(rzg2l_cpg_driver, rzg2l_cpg_probe);

[Severity: High]
This is the same pre-existing issue as above, but affecting the error path=
=20
in rzg2l_cpg_probe().

In rzg2l_cpg_add_clk_domain(), the OF provider is registered with
of_genpd_add_provider_simple(np, genpd) but lacks a devres cleanup action.

If the probe fails after this point, could this lead to the same resource
leak and use-after-free scenario when the PM domain lists are subsequently
accessed?

> diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-=
cpg.c
> index 63f13fe4e4b0e..7ce94680c79a2 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
[ ... ]
> -static int __init rzv2h_cpg_init(void)
> -{
> -	return platform_driver_probe(&rzv2h_cpg_driver, rzv2h_cpg_probe);
> -}
> -
> -subsys_initcall(rzv2h_cpg_init);
> +subsys_platform_driver_probe(rzv2h_cpg_driver, rzv2h_cpg_probe);

[Severity: High]
Similarly, this pre-existing issue appears to affect rzv2h_cpg_probe().

In rzv2h_cpg_add_pm_domains(), the provider is registered via
of_genpd_add_provider_simple(np, &pd->genpd) without a cleanup handler.

Would a probe failure in this driver also result in dangling pointers in
the global PM domain lists?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-subsys_ini=
tcall-v1-0-cbccf4cd4288@redhat.com?part=3D4
