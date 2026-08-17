Received: from mail-106103.protonmail.ch (mail-106103.protonmail.ch [79.135.106.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6A321D3F5
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 11:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965160; cv=none; b=axMhM3RKxm968zWSSM6ANlROf27EOf+cNzNxyyiABQ5Sy1ip+/+JSf+yC7ZIWNkRFJovMa25SxYR6IIxvPA4n2ohd74y3VdU32X/3fc7Kqkn0JxG5yFtQ8uJxuRPdvydPGiuyzWLBYTp+0QDfTkHLwsp9Ws6e8caM460mctNfAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965160; c=relaxed/simple;
	bh=5xei31jWfbCvjJWYAWxdOGjoutWr7qVmV319yL89d4k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lGuWa28U6rWh0gVYUcKrlDthHUaI+qPZwRm6SmCIhF7A2LlC2X5zLT6qNWoA1sc7E4aO6Vl1Xzz9VwLhf4PQetgzH4CEW1VwLEqmgz/0amAKljLGrhrVBr5jjK792h7eQwTGYBEob57t/tRQQFx4Mxj0JT+uPBjX8zbkGY+pwtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=IVZO/xFD; arc=none smtp.client-ip=79.135.106.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="IVZO/xFD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1786965149; x=1787224349;
	bh=E5G9u9fUe0iGm+rUuoOsMW1cZLD8NY482SDhJ2sWIns=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IVZO/xFDha57j4U7Zjb5cuJXWObIccJIyLCVLqDSXKoW5xGP6VRL+SKzXMkDYe4Qt
	 xbCLjrMf/iEafIf2fWHxtL/VGk+ITFqzc5XZl0sSdTJH12S/1V/Ympw4f2EaEHgBY0
	 m3prP3VeK0r6O/4xoPwsYI+S0U7bLkRka6QIu4p+1NYufdEdiQNN4f70PRr5v9El8A
	 22fhOgwIkt/Fc9v3Np63ibUxVAQuHcnoaf9pnlB0x+LNl3+qHyRoOxmNfca09R/WJj
	 1hDkhWm3cZNewkgwd3OT9UmpnDZ3qi+8nk/cFi8hwUJXvZP6OWHijMwH11ppa8cOAn
	 lOPCNdT314b0w==
Date: Mon, 17 Aug 2026 11:12:25 +0000
To: sashiko-reviews@lists.linux.dev
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 3/3] clk: samsung: Introduce Exynos5515 clock driver
Message-ID: <BdKoBOnRuIhrT7tN4m3VwHkPBE8h5rTX4ZSgs3xnFjtnEw-xyS-LtWmX1r6efxBmC7b7JWlSkp49_8gsJTrFXja-3au5EusJ443xPQuFTLE=@protonmail.com>
In-Reply-To: <20260817102753.AD2711F00A3A@smtp.kernel.org>
References: <20260817-for-next-lucky7-clock-v1-0-032e4b229c76@member.fsf.org> <20260817-for-next-lucky7-clock-v1-3-032e4b229c76@member.fsf.org> <20260817102753.AD2711F00A3A@smtp.kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 5c2396f84eec43ac44cd52c30b8f10b0ecebfb2a
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Clock Tree Misconfiguration / Unintended Clock Bypass in CMU_PER=
I
> - [High] Incorrect Mux Parent Clock Order in CMU_FSYS User MUXes
> - [Medium] Missing Initialization and State Preservation for EXYNOS5515_M=
EMCLK_OFFSET
> --
>=20
> --- Patch [3]: [PATCH 3/3] clk: samsung: Introduce Exynos5515 clock drive=
r ---
> commit 30844f6e4b1e1ae616f216fdbd770df29393e674
> Author: Aiden Isik <aidenisik@member.fsf.org>
>=20
> clk: samsung: Introduce Exynos5515 clock driver
>=20
> CMU_TOP is the top level clock management unit which contains PLLs,
> muxes, dividers and gates that feed the other clock management units.
> CMU_PERI provides clocks for USI blocks and their children, PWM, MCT,
> and watchdog timers. CMU_FSYS provides clocks for MMC, USB, GPIO, etc.
>=20
> > diff --git a/drivers/clk/samsung/clk-exynos5515.c b/drivers/clk/samsung=
/clk-exynos5515.c
> > new file mode 100644
> > index 0000000000000..f989a13f1a574
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-exynos5515.c
> > @@ -0,0 +1,1485 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
>=20
> [ ... ]
>=20
> > +static const unsigned long drcg_sysreg[] __initconst =3D {
> > +=09EXYNOS5515_DRCG_EN_OFFSET,
> > +};
>=20
> [Severity: Medium]
> Is it intended that EXYNOS5515_MEMCLK_OFFSET is missing from the drcg_sys=
reg
> array? Without this offset, the memory clock gating state won't be saved =
or
> restored across power management suspend/resume cycles.
>=20
> > +
> > +static const struct samsung_cmu_info top_cmu_info __initconst =3D {
>=20
> [ ... ]
>=20
> > +=09.gate_dbg_offset=09=3D EXYNOS5515_GATE_DBG_OFFSET,
> > +=09.option_offset=09=09=3D CMU_CMU_TOP_CONTROLLER_OPTION,
> > +=09.drcg_offset=09=09=3D EXYNOS5515_DRCG_EN_OFFSET,
> > +};
>=20

This is intentional, downstream only has this on a few blocks and
these are not amongst those blocks. Will see if a maintainer agrees.

> [Severity: Medium]
> Will this break the dynamic root clock gating initialization? The
> .memclk_offset =3D EXYNOS5515_MEMCLK_OFFSET assignment seems to be missin=
g
> here, which might prevent samsung_en_dyn_root_clk_gating() from enabling =
the
> memory clock gate correctly.
>=20

See above.

> [ ... ]
>=20
> > +/* Parent clock list for CMU_PERI muxes */
> > +PNAME(mout_pll_peri_bus_user_p)=09=09=3D { "oscclk",
> > +=09=09=09=09=09    "mout_cmu_peri_bus" };
> > +
> > +PNAME(mout_pll_peri_ip_user_p)=09=09=3D { "oscclk",
> > +=09=09=09=09=09    "mout_cmu_peri_ip" };
>=20
> [Severity: High]
> Does this correctly route the clocks from CMU_TOP? Referencing the
> intermediate mout_cmu_peri_* clocks here instead of the final
> dout_cmu_peri_* dividers appears to bypass the hardware gates and divider=
s
> defined in CMU_TOP. Could this lead to incorrect clock rate calculations =
and
> resource leaks if the CMU_TOP blocks fail to gate when PERI clocks are
> disabled?

Unsure, but this is how downstream does it.

>=20
> [ ... ]
>=20
> > +/* Parent clock list for CMU_FSYS muxes */
> > +PNAME(mout_pll_fsys_bus_user_p)=09=09=3D { "dout_cmu_fsys_bus",
> > +=09=09=09=09=09    "oscclk" };
> > +
> > +/* Parent clock list for CMU_FSYS muxes: for MMC */
> > +PNAME(mout_pll_fsys_mmc_card_user_p)=09=3D { "dout_cmu_fsys_mmc_card",
> > +=09=09=09=09=09    "oscclk" };
> > +
> > +PNAME(mout_pll_fsys_mmc_embd_user_p)=09=3D { "dout_cmu_fsys_mmc_embd",
> > +=09=09=09=09=09    "oscclk" };
> > +
> > +/* Parent clock list for CMU_FSYS muxes: for USB */
> > +PNAME(mout_pll_fsys_usb20drd_user_p)=09=3D { "dout_cmu_fsys_usb20drd",
> > +=09=09=09=09=09    "oscclk" };
>=20
> [Severity: High]
> Is the parent clock order inverted in these MUXes? User MUX arrays like t=
hose
> in CMU_PERI map oscclk to hardware value 0 and the bus clock to 1. Since =
the
> clock framework uses the array index for the register value, placing oscc=
lk
> at index 1 here will write 0 when requesting the high-speed bus clock,
> inadvertently selecting the 26MHz oscclk instead. Could this cause
> performance degradation and hardware instability?
>=20

Possibly, I thought the ordering was just cosmetic and for the
kernel's informational purposes. HWACG seems to mask the problem
if there is one but will still fix in v2.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-for-next=
-lucky7-clock-v1-0-032e4b229c76@member.fsf.org?part=3D3
>=20

Kind regards,
- Aiden Isik
