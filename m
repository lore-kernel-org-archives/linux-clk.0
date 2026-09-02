Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3201B471264
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347085; cv=none; b=ZFeBo57ZzHH4Ni7YWdvsW99FjdeeVGn4Jybh2WAU/s170Nt+/NiWR/Si3EVsesjd1qxEKJM+ENqK2bYegfIYOcO1IP8uBujOGfzsu2om/mHJRAMdtv0orHF+IZYXALQn/jzsdG8mExIt3VI2WsPxzpPLtRSdY+za5UabrDPGCOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347085; c=relaxed/simple;
	bh=DrhB9ZgUC5wNi9hnmxjDJH1nIIRwpM5CLD1SI7ZpTPg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nwu59Yach/Y57+yfRKW4cEPF8uLh5t42ufJmJgelmaeubHzzO/IX/RGTXDu0ctceNGtbd/Nc9l6W+Keg9OAJjRyqHylh8cx1VS+XA3EH0kvZ7TDc6RPDR1XKPcFg+6Bl8aNvfG4MjgfZ+D28rlFRVVhzjxRSYnGKLBLr3OZAgh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdX1UUx0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdX1UUx0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959CD1F00A3A;
	Wed,  2 Sep 2026 11:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788347083;
	bh=B3GzZzemlbI7fsrgLOlHSAVP67QXPUgbKvNmtPorbms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cdX1UUx0mpG5CnWiR/NIady4ljQLKRbHjuxSFFj5YuDjaoJ8jBUp8C6SJzKRkYRbv
	 cgmypDHuS9kvXitscjLwKAdWVHIcNYHaLzjkfF7fV84EG5KSs9hgDCS8IsfgKqb81q
	 jFB52j1MQ188/N4udPQh4Q1GoxuGMjpKba82Rd2TxCZ4MtDNeHNlVqZxFWandBMWG0
	 tXU97YTc6G8FxrPbyUPA3J5+j/TiAndPScp7Dw2wOxqIG88dYUUq81BlugYj7YpSUa
	 SQBEm1yER5ypaTQIPBCwKVveg9ZZg6U1b+hUahOlowrzRRWcan//XLCAhba58QRdkO
	 lKBSAkzhjbjow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] clk: renesas: rzv2h: Convert to clk_hw based
 provider API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ovidiu Panait" <ovidiu.panait.rb@renesas.com>
Cc: linux-clk@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260902104939.25522-3-ovidiu.panait.rb@renesas.com>
References: <20260902104939.25522-1-ovidiu.panait.rb@renesas.com>
 <20260902104939.25522-3-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:04:43 +0000
Message-Id: <20260902110443.959CD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing OF genpd provider cleanup on the probe error path leads to=
 a Use-After-Free.
--

commit a63d8b10a46c55aa614df9d149b0a17736dc2cc5
Author: John Madieu <john.madieu.xa@bp.renesas.com>

clk: renesas: rzv2h: Convert to clk_hw based provider API

The driver mixes the clk consumer API with the clk_hw provider API for its
internal clock storage and OF lookup callback. Convert it to use clk_hw
consistently.

> diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-=
cpg.c
> index 86f6f2f700a65..9b0d691b1f5d0 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
[ ... ]
> @@ -1547,19 +1542,13 @@ static int __init rzv2h_cpg_add_pm_domains(struct=
 rzv2h_cpg_priv *priv)
>  	return of_genpd_add_provider_simple(np, &pd->genpd);

[Severity: High]
This is a pre-existing issue, but does this missing OF genpd provider clean=
up
on the probe error path lead to a Use-After-Free?

If a subsequent operation in rzv2h_cpg_probe() (such as
rzv2h_cpg_reset_controller_register()) fails, the devm framework automatica=
lly
frees the struct rzv2h_cpg_pd that was allocated with devm_kzalloc().

However, the cleanup action pm_genpd_remove() returns -EBUSY and aborts
because of_genpd_add_provider_simple() sets genpd->has_provider =3D true.
Because of_genpd_del_provider() is never called to unset this flag and
remove the provider, the domain remains registered in the global
of_genpd_providers list, gpd_list, and the device core.

When a consumer device subsequently probes and looks up its PM domain, or
when the PM domain core walks the lists, it could dereference the freed
pd->genpd memory.

>  }
> =20
> -static void rzv2h_cpg_del_clk_provider(void *data)
> -{
> -	of_clk_del_provider(data);
> -}
> -

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902104939.2552=
2-1-ovidiu.panait.rb@renesas.com?part=3D2
