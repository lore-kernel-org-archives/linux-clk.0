Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E173E1680;
	Mon, 17 Aug 2026 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786962475; cv=none; b=rnWJJeO4pG0zu4djBfKurgJuDyX45e/y1i1zKoyzn3EQmwuutdligV4WNn0xPrrgVvBhpHFjQ5MRaDx890DlKl4KOTRRGLL3VI/t9/duO4QJl6CPckVdMfMh7RZ8jNY9kwHVCrXzTU1u7G4Rle9OFC/RO4xJi3yV0aFF+HNbsaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786962475; c=relaxed/simple;
	bh=Ub2ET0nreelBWuPAy1VNfFijwSt8gbQmMKulCpxzN+Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FPx8KEWfcPamdZ+CbGNsbPmJ6VQt8RBaFRoUdZjhVsWXe4Vm2vfrOR+BCQpa2D0hgmLEAoAyTeeH0EQ/c3QclO8SNNk2ptkfkpbV1vYoz95Ovj/55MmdNKnecZZfWwKjgP4bremchUqsEMjfFJm1ctLS9wdJ+78yMlc3Qc0L1Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgJ++YgL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgJ++YgL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2711F00A3A;
	Mon, 17 Aug 2026 10:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786962474;
	bh=V1aFH/N/EBeNsvJYXVGPwx5EQiCM1pFTf5ka54Sozm4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CgJ++YgL1SVnP94dfPU1o76QaC6GiurObr0iybS63gVGAZSGJTW1ocyvvk4gOvwis
	 YQellKT0wodZ3BhbsxRIhEdlrMy2L6rA/+oxNanYRcU9j869iB6AUv2073VG+RT9+/
	 4z+oI1x9NWAVeOyZHGs+RtOKvzIn+Js3n6chPTv/9S+nfYL656sPPTmZ01ItXVuUfn
	 NG0x/ACQMT1mWRlSRYuH4dsZ5QhBifMzvMmTqAZP+cC950Ota3lP71j05oSUjIOfkG
	 BVznoxVSBGiD2CoFYFFYhRLHE2ZlQ0RUagKjNIcVSkTNA2Lt6zNpFINnwKFrJkRpZN
	 K8dUqepSAKsdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] clk: samsung: Introduce Exynos5515 clock driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aiden Isik" <aidenisik@member.fsf.org>
Cc: robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260817-for-next-lucky7-clock-v1-3-032e4b229c76@member.fsf.org>
References: <20260817-for-next-lucky7-clock-v1-0-032e4b229c76@member.fsf.org>
 <20260817-for-next-lucky7-clock-v1-3-032e4b229c76@member.fsf.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:27:53 +0000
Message-Id: <20260817102753.AD2711F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Clock Tree Misconfiguration / Unintended Clock Bypass in CMU_PERI
- [High] Incorrect Mux Parent Clock Order in CMU_FSYS User MUXes
- [Medium] Missing Initialization and State Preservation for EXYNOS5515_MEM=
CLK_OFFSET
--

--- Patch [3]: [PATCH 3/3] clk: samsung: Introduce Exynos5515 clock driver =
---
commit 30844f6e4b1e1ae616f216fdbd770df29393e674
Author: Aiden Isik <aidenisik@member.fsf.org>

clk: samsung: Introduce Exynos5515 clock driver

CMU_TOP is the top level clock management unit which contains PLLs,
muxes, dividers and gates that feed the other clock management units.
CMU_PERI provides clocks for USI blocks and their children, PWM, MCT,
and watchdog timers. CMU_FSYS provides clocks for MMC, USB, GPIO, etc.

> diff --git a/drivers/clk/samsung/clk-exynos5515.c b/drivers/clk/samsung/c=
lk-exynos5515.c
> new file mode 100644
> index 0000000000000..f989a13f1a574
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos5515.c
> @@ -0,0 +1,1485 @@
> +// SPDX-License-Identifier: GPL-2.0-only

[ ... ]

> +static const unsigned long drcg_sysreg[] __initconst =3D {
> +	EXYNOS5515_DRCG_EN_OFFSET,
> +};

[Severity: Medium]
Is it intended that EXYNOS5515_MEMCLK_OFFSET is missing from the drcg_sysreg
array? Without this offset, the memory clock gating state won't be saved or
restored across power management suspend/resume cycles.

> +
> +static const struct samsung_cmu_info top_cmu_info __initconst =3D {

[ ... ]

> +	.gate_dbg_offset	=3D EXYNOS5515_GATE_DBG_OFFSET,
> +	.option_offset		=3D CMU_CMU_TOP_CONTROLLER_OPTION,
> +	.drcg_offset		=3D EXYNOS5515_DRCG_EN_OFFSET,
> +};

[Severity: Medium]
Will this break the dynamic root clock gating initialization? The
.memclk_offset =3D EXYNOS5515_MEMCLK_OFFSET assignment seems to be missing
here, which might prevent samsung_en_dyn_root_clk_gating() from enabling the
memory clock gate correctly.

[ ... ]

> +/* Parent clock list for CMU_PERI muxes */
> +PNAME(mout_pll_peri_bus_user_p)		=3D { "oscclk",
> +					    "mout_cmu_peri_bus" };
> +
> +PNAME(mout_pll_peri_ip_user_p)		=3D { "oscclk",
> +					    "mout_cmu_peri_ip" };

[Severity: High]
Does this correctly route the clocks from CMU_TOP? Referencing the
intermediate mout_cmu_peri_* clocks here instead of the final
dout_cmu_peri_* dividers appears to bypass the hardware gates and dividers
defined in CMU_TOP. Could this lead to incorrect clock rate calculations and
resource leaks if the CMU_TOP blocks fail to gate when PERI clocks are
disabled?

[ ... ]

> +/* Parent clock list for CMU_FSYS muxes */
> +PNAME(mout_pll_fsys_bus_user_p)		=3D { "dout_cmu_fsys_bus",
> +					    "oscclk" };
> +
> +/* Parent clock list for CMU_FSYS muxes: for MMC */
> +PNAME(mout_pll_fsys_mmc_card_user_p)	=3D { "dout_cmu_fsys_mmc_card",
> +					    "oscclk" };
> +
> +PNAME(mout_pll_fsys_mmc_embd_user_p)	=3D { "dout_cmu_fsys_mmc_embd",
> +					    "oscclk" };
> +
> +/* Parent clock list for CMU_FSYS muxes: for USB */
> +PNAME(mout_pll_fsys_usb20drd_user_p)	=3D { "dout_cmu_fsys_usb20drd",
> +					    "oscclk" };

[Severity: High]
Is the parent clock order inverted in these MUXes? User MUX arrays like tho=
se
in CMU_PERI map oscclk to hardware value 0 and the bus clock to 1. Since the
clock framework uses the array index for the register value, placing oscclk
at index 1 here will write 0 when requesting the high-speed bus clock,
inadvertently selecting the 26MHz oscclk instead. Could this cause
performance degradation and hardware instability?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-for-next-l=
ucky7-clock-v1-0-032e4b229c76@member.fsf.org?part=3D3
