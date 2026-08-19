Received: from mail-106104.protonmail.ch (mail-106104.protonmail.ch [79.135.106.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8D33E5EC5;
	Wed, 19 Aug 2026 23:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787183106; cv=none; b=d1uJZCgru6AewnfeAvXaVOAZKG+j4pESmQsuBAbWnMmpfdxzM13L1IEMzf4dwiK6+MzUyQZf1bomKZm6LStChugxhZ7eQEyHCtUGKRWsI0qqqxJCgMp6VQGPHsYm2+K4kqIrmpJ033N0k/9aa0Jmkjlk5k+wdaZhoQcKYBYkCI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787183106; c=relaxed/simple;
	bh=NpxhhghZH96jiprY7833SIQdk62ROTWi6y93t8EqsyE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=joXtDzjvOeNt8vOKNWgb40DbmBMA5la+B2HOBFmTmS0czzXX1epmj/Vv2v7WZPoTP5ebpX+DVP+cgK/WdFUB1+lChceJWajOSU2G/MtJE0UD90GPqObxM/VRGsz2FbkyjC100ajicar0c82TuvcuFjsrA7X9ahR9JbvsSWn4I/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Cgw1i1dM; arc=none smtp.client-ip=79.135.106.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Cgw1i1dM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1787183094; x=1787442294;
	bh=Bm3T+3R4e12qE2fuXOHpf0T1yx4lHyAb2v65jzA26H8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Cgw1i1dMhzUmxUlLX9NXMeI/6Hq4mA6btiEvuNOuF4r4rrGU0kBFB8k6SX8rDMkKy
	 M+HPVnzYeljlpuva6D6SgeGNWK1fvI+Dun0zfckPA2xgqFeM/HLgFnAzQGETHEawgy
	 ArHYYL1jjIzBI6SuDw6FLD53/nFljraLfvxptiD/X2G+Pn8FHU4Mv/sfjA55OoLU3O
	 llsFQD+brhBsgu6a1lXIQ7VbToBLGmUFegQDozFjAsSmTtpmK0CPJZq2HIQ8DVhvi+
	 FOjNAQGW5QTsoD7qo3b5Z5eEBLF2Kn39stre9DbTam6z1KUk3hovfc81E967sB8NWd
	 4dcG7gr1Vnm6w==
Date: Wed, 19 Aug 2026 23:44:51 +0000
To: sashiko-reviews@lists.linux.dev
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 3/3] clk: samsung: Introduce Exynos5515 clock driver
Message-ID: <Ct9YPMTdD6F2UHUYPgnPFXxKNMRyZFYVZHJG6P5Tp-7fPMzboeweP7k-mIIu1XbeEmhe3CN1I7QDmsYcHH-lxWruE4BwzXJ5QXTc5MPlg-A=@protonmail.com>
In-Reply-To: <20260818220901.4BCC91F000E9@smtp.kernel.org>
References: <20260818-for-next-lucky7-clock-v2-0-cda0cc80f158@member.fsf.org> <20260818-for-next-lucky7-clock-v2-3-cda0cc80f158@member.fsf.org> <20260818220901.4BCC91F000E9@smtp.kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 0d70a57540a6cc3b960c523f3f265b4aa0b845d2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] PERI CMU muxes incorrectly use TOP CMU mux outputs instead of di=
vider outputs, bypassing clock gating and division.
> - [Medium] EXYNOS5515_MEMCLK_OFFSET is uninitialized and excluded from th=
e suspend/resume sysreg array.
> --
>=20
> --- Patch [3]: [PATCH v2 3/3] clk: samsung: Introduce Exynos5515 clock dr=
iver ---
> commit ec18c4d69f3cc6d71671cf32be2a8263d5584524
> Author: Aiden Isik <aidenisik@member.fsf.org>
> Subject: clk: samsung: Introduce Exynos5515 clock driver
>=20
> This commit adds Common Clock Framework support for the Exynos5515 SoC. I=
t introduces the CMU_TOP, CMU_PERI, and CMU_FSYS clock management units.
>=20
> > diff --git a/drivers/clk/samsung/clk-exynos5515.c b/drivers/clk/samsung=
/clk-exynos5515.c
> > new file mode 100644
> > index 0000000000000..aeaa51c1c7354
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-exynos5515.c
> > @@ -0,0 +1,1485 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> [ ... ]
> > +#define EXYNOS5515_GATE_DBG_OFFSET=090x4000
> > +#define EXYNOS5515_DRCG_EN_OFFSET=090x0104
> > +#define EXYNOS5515_MEMCLK_OFFSET=090x0108
>=20
> [Severity: Medium]
> EXYNOS5515_MEMCLK_OFFSET is defined here, but it appears to be missing fr=
om
> the drcg_sysreg array below and is not assigned to the memclk_offset fiel=
d
> in any samsung_cmu_info structs (like top_cmu_info). Will this cause the =
MEMCLK
> register state to be lost during system suspend and resume cycles, and sk=
ip
> its initialization during boot?

None of the CMUs introduced by this patchset have this. The
CMUs which have this on Exynos5515 are CMU_DPU, CMU_G3D, CMU_MFC,
CMU_VTS, and CMU_CHUB.

>=20
> [ ... ]
> > +static const unsigned long drcg_sysreg[] __initconst =3D {
> > +=09EXYNOS5515_DRCG_EN_OFFSET,
> > +};
> > +
> > +static const struct samsung_cmu_info top_cmu_info __initconst =3D {
> [ ... ]
> > +=09.gate_dbg_offset=09=3D EXYNOS5515_GATE_DBG_OFFSET,
> > +=09.option_offset=09=09=3D CMU_CMU_TOP_CONTROLLER_OPTION,
> > +=09.drcg_offset=09=09=3D EXYNOS5515_DRCG_EN_OFFSET,
> > +};
> [ ... ]
> > +/* Parent clock list for CMU_PERI muxes */
> > +PNAME(mout_pll_peri_bus_user_p)=09=09=3D { "oscclk",
> > +=09=09=09=09=09    "mout_cmu_peri_bus" };
> > +
> > +PNAME(mout_pll_peri_ip_user_p)=09=09=3D { "oscclk",
> > +=09=09=09=09=09    "mout_cmu_peri_ip" };
> > +
> > +/* Parent clock list for CMU_PERI muxes: for SPI */
> > +PNAME(mout_peri_spi_p)=09=09=09=3D { "oscclk",
> > +=09=09=09=09=09    "mout_pll_peri_ip_user" };
> > +
> > +/* Parent clock list for CMU_PERI muxes: for UART */
> > +PNAME(mout_pll_peri_uart_user_p)=09=3D { "oscclk",
> > +=09=09=09=09=09    "mout_cmu_peri_uart" };
>=20
> [Severity: High]
> Should these parent lists use the divided outputs from TOP CMU
> (like dout_cmu_peri_bus, dout_cmu_peri_ip, and dout_cmu_peri_uart)
> instead of the direct mux outputs (mout_cmu_peri_*)?
>=20
> Using the direct mout_* clocks here bypasses the intended clock division
> and gating, which might lead to incorrect peripheral clock frequencies an=
d
> break power management for these blocks.

This is how they are handled by Samsung themselves in their own kernel
fork.
The Exynos990 clock driver upstream also does this, so it is most likely
correct.

>=20
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-for-next=
-lucky7-clock-v2-0-cda0cc80f158@member.fsf.org?part=3D3
> 
