Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3729374E7A;
	Sat,  3 Oct 2026 01:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790991188; cv=none; b=GOPrK3NFnCGNbVw8uUwCDchZtbeA0dsoRoBELxgnOccAVvB/WuG3nUCL4rsxlhQqGeeNeZqz9lHnfFfOOZkoMFMYgvS0OyuPJzBp2yphuN82oUtWaJJ9coz1L7iUDqGVWypg1c2jpzCBKH0YZS3WeP3hIB9V9uUsRrN+2sidWMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790991188; c=relaxed/simple;
	bh=Ic5FC/U4Xs2VOQ/4MlP3r3IDN/70HO/ce3U+zbXnCE8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ElsqEpOCIVib21TvvlEvH4FG6BCt2njz3d9jQxxLN1JC8PkyXol9jWCPPQAYue+1p0ICfdKonmMQH0WM0apcDYeuj6f2mQFlObr7/no4VDbBaObIu2Cz6KnR/MN/G3ljTmmudAuT/y7ho3TbYzjQYWLaEnXU01yUsbOHFqAasBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYt3+YNg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYt3+YNg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DB41F000FF;
	Sat,  3 Oct 2026 01:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790991187;
	bh=w8rb4ECWoeXUAWjPAhJvt3ZWmfD2rq4/fWzcrtDH4Es=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mYt3+YNgFU7VnKPk8VdUhtIxFqv+AKjrRTdjco6KHRBPcxqWIruNkn9JxRlUplvh1
	 ys0BIQkT8stHNlnecux6Z/JnKtcLjTfBOFsJhUQnfEm/0jvAm4hJrYgzDCMFmID+m1
	 a9TzdZsYMtsWSQChFMBA6jofu0wJMFfKy7g520KHNqfl2WmUuj4U4F6GxPM2e9mOQS
	 AmXIJBnRACI4lXzJzzhsOGgjvDNtPqWKzHF74pqd6e4QTr3tqjJFKs7lA2VHIkfFSR
	 QmLtQE7VLT+QiJwK2dw4oQtdC5QE8jGI3vSaQqQFVWrz9bsLB6bPN+GZrkjhb+Z7ri
	 PxZkux6LD80qA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/7] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20261002-perso-ma35d1-upstream-clk-v7-5-cbd991fa6270@bootlin.com>
References: <20261002-perso-ma35d1-upstream-clk-v7-0-cbd991fa6270@bootlin.com>
 <20261002-perso-ma35d1-upstream-clk-v7-5-cbd991fa6270@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 01:33:06 +0000
Message-Id: <20261003013306.D8DB41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] clk: buffer overflow via zero-length syspll_parent_data array
- [High] clk: unhandled ERR_PTR dereference in syspll_parent_data
--

commit 5e6e98e9249c8ddf8953662fc83c357de699a523
Author: Miquel Raynal <miquel.raynal@bootlin.com>

clk: nuvoton: ma35d1: Reparent SYSPLL correctly

The clock tree is still incorrect. SYSPLL is derived from HXT_GATE, very
much like CAPLL, DDRPLL, VPLL, APLL and EPLL. SYSPLL has a fixed
frequency, but if HXT gets gated, SYSPLL stops running.

> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-m=
a35d1.c
> index 2e6e1c65d01e5..0baaa93f13805 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -73,6 +73,8 @@ static const struct clk_parent_data lxtg_parent_data[] =
=3D {
>  	{ .fw_name =3D "lxt", .name =3D "lxt" },
>  };
> =20
> +static struct clk_parent_data syspll_parent_data[] =3D {};
> +

[Severity: Critical]
Does this code allocate a zero-length array in the .bss section?

Later in ma35d1_clocks_probe(), there is an unconditional write to
syspll_parent_data[0].hw, which seems to write entirely out-of-bounds
and corrupt 8 bytes of adjacent static memory.

[ ... ]

> @@ -275,22 +283,23 @@ static int ma35d1_clocks_probe(struct platform_devi=
ce *pdev)
> =20
>  	/* Old DTs do not describe the low-speed crystal */
>  	if (num_clks =3D=3D 1)
> -		hws[LXT] =3D ma35d1_clk_fixed("lxt", 32768);
> +		hws[LXT] =3D ma35d1_clk_fixed(dev, "lxt", 32768);
> =20
>  	hws[HXT_GATE] =3D ma35d1_clk_gate_parent_data(dev, "hxt_gate", hxtg_par=
ent_data,
>  						    clk_base + REG_CLK_PWRCTL, 0);

[ ... ]

>  	hws[CAPLL] =3D ma35d1_reg_clk_pll(dev, CAPLL, pllmode[0], "capll",
>  					hws[HXT_GATE], clk_base + REG_CLK_PLL0CTL0);
> -	hws[SYSPLL] =3D ma35d1_clk_fixed("syspll", 180000000);
> +	syspll_parent_data[0].hw =3D hws[HXT_GATE];
> +	hws[SYSPLL] =3D ma35d1_clk_fixed_parent_data(dev, "syspll", 180000000, =
syspll_parent_data);

[Severity: High]
If ma35d1_clk_gate_parent_data() fails when allocating hws[HXT_GATE],
it returns an ERR_PTR. Could this ERR_PTR be blindly assigned to
syspll_parent_data[0].hw and registered via ma35d1_clk_fixed_parent_data()?

Without validating the pointer with IS_ERR(), the common clock framework
might dereference this ERR_PTR in clk_core_fill_parent_index() causing
a kernel panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-perso-ma35=
d1-upstream-clk-v7-0-cbd991fa6270@bootlin.com?part=3D5
