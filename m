Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72053B19BA
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134712; cv=none; b=TtNmRIPwZnB/YSF5Gv/mVr5asbLWrsqOD7alM042o5k+fjmCYgIsWxXPECp7xrsE3yo1E7Dn0wf3E+jA19efPlaUUbWkQxN7PFsWmvnzt243UhXzr5o2s5KwLbNHM8bnQniPOMBycQLiRkJfjpv4wdgvqDRZi7K/BhGl28heps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134712; c=relaxed/simple;
	bh=Oe60+PhYiA8XGB+pxRUoUob+ZpU6mCpuEIP/Xa10CTQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rj7JhsHUDOlh4PVA6qLk0wdWcb7gVwXZL+ZeD0arjqkhcd3CmrYoWgYJAfZAleucVQVBb+PsPUIl08QW8Y9QHCBGJnIUORaOPPIWfOwa+4UhiHlyGEYpcrpglRbt4qiUAemPxEeBZ1mS0mLZuLhiPvD/MYv1SXxKLBGiSi3CxYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEJiGluE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEJiGluE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D891F00899;
	Fri, 11 Sep 2026 13:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789134711;
	bh=bPy8LLHxWPr2z52VR3ftfrSfFqcjM5ICKOe4es9SF0I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XEJiGluEAkdlRYJv31yoH5rYCf4XLJu1Jan288vRXKt5XJq87DXMAq/PGR3yviHUs
	 NQB3sYdcUuAZikbDpPAahWm+GRW05CmzXoyEskS52kyJp/Sn9lklSszxoXHtygYZcR
	 dTT1H2Hxph4B7MBxVhPQtle3hNZ86ZdqB3IhKcAbRw5XAtJyDIXPvWf6jZQiFWQ7Pd
	 1/4B8o26+dwdkmr7/YJN5nKsTOnrW72Px7PF3QgXOPkE6h334/VnTE6eRV+z8vc0YY
	 CbVLS8cCRV0roU1y8q2ubuUz1elKrTdwDRibYDGtJmFwymOpt1w7PLPI9HPm2w13Qw
	 8OwpXxotE0MfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] clk: renesas: r9a08g046: Add TSU,ADC1 clocks and
 reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Biju Das" <biju.das.jz@bp.renesas.com>
Cc: wsa+renesas@sang-engineering.com, linux-clk@vger.kernel.org
In-Reply-To: <20260911133653.115553-5-biju.das.jz@bp.renesas.com>
References: <20260911133653.115553-1-biju.das.jz@bp.renesas.com>
 <20260911133653.115553-5-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 13:51:50 +0000
Message-Id: <20260911135151.43D891F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ADC1 and TSU module clocks are assigned to the wrong MSTOP registe=
r (BUS_PERI_VIDEO instead of BUS_MCPU2).
--

commit d7fdd574b02e4a749809136361e953c55d998f3c
Author: Biju Das <biju.das.jz@bp.renesas.com>

clk: renesas: r9a08g046: Add TSU,ADC1 clocks and reset

This commit adds the P20 clock, module clocks for ADC1 and TSU, and
their corresponding module resets for the RZ/G3S (R9A08G046) SoC.

> diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9=
a08g046-cpg.c
> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
[ ... ]
> @@ -559,6 +560,12 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks=
[] =3D {
>  					MSTOP(BUS_MCPU2, BIT(0))),
>  	DEF_MOD("gpio_hclk",		R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
>  					MSTOP(BUS_PERI_CPU, BIT(6))),
> +	DEF_MOD("adc1_adclk",		R9A08G046_ADC1_ADCLK, R9A08G046_CLK_P20, 0x5a8, =
2,
> +					MSTOP(BUS_PERI_VIDEO, BIT(14))),
> +	DEF_MOD("adc1_pclk",		R9A08G046_ADC1_PCLK, R9A08G046_CLK_P20, 0x5a8, 3,
> +					MSTOP(BUS_PERI_VIDEO, BIT(14))),
> +	DEF_MOD("tsu_pclk",		R9A08G046_TSU_PCLK, R9A08G046_CLK_P20, 0x5ac, 0,
> +					MSTOP(BUS_PERI_VIDEO, BIT(15))),

[Severity: High]
Should these module clocks in r9a08g046_mod_clks be assigned to the MCU bus
(BUS_MCPU2) instead of the video bus (BUS_PERI_VIDEO)?

Writing to the video bus MSTOP register instead of the expected MCU bus
register will fail to enable the bus clocks for the ADC and TSU modules. Wh=
en
the drivers attempt to probe and access their registers, the unclocked bus
can generate an asynchronous external abort, leading to a kernel panic.

>  	DEF_MOD("pci_aclk",		R9A08G046_PCI_ACLK, R9A08G046_CLK_P1, 0x608, 0,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911133653.1155=
53-1-biju.das.jz@bp.renesas.com?part=3D4
