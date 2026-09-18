Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF89502D4E
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 15:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745029; cv=none; b=SfqI20whPAC3+Mey6snD4wyhV5uQ9FOihS6Lm7VXAEsZ3EjLULjWC34RouO0V2bRhbl9XfUNSFvbM4HWoMcSxH1XbBLd0O6yRe7MUrOV0wtftfL5l0PjEIEQ08Ha/18AYcHXm9S/ZPJfti21aA9pyqxGogXzzK2oqu3H/8P1eSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745029; c=relaxed/simple;
	bh=jhtQ0/y/4IxNaahfbVoVuEul2w9LlNQks/R4jiVLKc8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E7t5quhZaj7rfA/BV0gsfv0ai6CeOrDpy+6OcTNSwQx1HC7noFT8Z4O+0faZaUXj5GiZsYx+hAmf4agvsn2QzOSwI1VoJKv1DvV/6UINd+7plGQkERIWy22QQuWXQ5YIgVyI8Vve5MRxuH0nNjcTU+CY5+p0gkVe59wPndjCIKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCop+t6q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCop+t6q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F881F0089A;
	Fri, 18 Sep 2026 15:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789745028;
	bh=At9NRiEdsGVRlqWhcLZWA3SWGHxThyuu+71vyGIMmL4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TCop+t6qGAM8nJSrEtl5/lpZ4T9yGCVC0ybb+tRUe/w+0y0Q2OWPZk6bxk2W7Lx7+
	 orQxdMYGH7NlFiaWvAmpVFArd9ooqMXfuwYF0AGMYSMBdEF8MSLU3h9EpPHBFKFzPk
	 j6AnZ+m1GQJg/AFzAkNd5lzpnR7V/KZ1+gQTweXBbXYgYL4eJ8Du3hmCM2Rzrprdbe
	 A0ilsrDrBzUYjSkt5pk9Ow5TqVzNpGIEGZmgX8PZqh1dZjfbJiff9zeWylzOp8jd6A
	 hK32RQEcMPzEZ+SolqKod0RaHp7GDL2h3oIDRYMQ/OLNrPXKXUy+Iw7x2XvWFQ7ntF
	 F5uR74Li/x8vQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/8] clk: renesas: r9a08g046: Add TSU,ADC1 clocks and
 reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Biju Das" <biju.das.jz@bp.renesas.com>
Cc: wsa+renesas@sang-engineering.com, linux-clk@vger.kernel.org
In-Reply-To: <20260918150730.122056-2-biju.das.jz@bp.renesas.com>
References: <20260918150730.122056-1-biju.das.jz@bp.renesas.com>
 <20260918150730.122056-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 15:23:47 +0000
Message-Id: <20260918152347.D7F881F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: renesas: incorrect MSTOP bus for ADC1 and TSU clocks
--

commit e17a7f8fc3947f6cab70a435b3bbdc24af6057ce
Author: Biju Das <biju.das.jz@bp.renesas.com>

clk: renesas: r9a08g046: Add TSU,ADC1 clocks and reset

This commit adds clock P20, module clocks for ADC1 and TSU, and the
corresponding resets for the RZ/G3S (R9A08G046) SoC.

> diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9=
a08g046-cpg.c
> index 22821321a1d37..2c5ca5ab5f578 100644
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

[Severity: Medium]
Looking at r9a08g046_mod_clks in drivers/clk/renesas/r9a08g046-cpg.c, are
the MSTOP bus assignments for these ADC1 and TSU clocks correct?

Based on similar architecture mapping in RZ/G2L and RZ/G3S (which use
BUS_MCPU2 for these identical register offsets), it seems this code
might be assigning BUS_PERI_VIDEO when it should use BUS_MCPU2.

If these devices actually reside on BUS_MCPU2, could this regression
cause a write to the wrong MSTOP register during initialization or
runtime PM? This might cause the ADC1 and TSU clocks to fail to ungate
while concurrently corrupting bits 14 and 15 of the video module stop
register when the devices are probed.

>  	DEF_MOD("pci_aclk",		R9A08G046_PCI_ACLK, R9A08G046_CLK_P1, 0x608, 0,
>  					MSTOP(BUS_PERI_COM, BIT(10))),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918150730.1220=
56-1-biju.das.jz@bp.renesas.com?part=3D1
