Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8104F440622;
	Fri,  9 Oct 2026 12:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550142; cv=none; b=PwTSz/Y6vUG1Nw12cFljt2ShZaaAagvzzuwQlJfjDQbOVegVQc+ALcM1cNDKvt1ZlscqqajDXg7pI7ybChWszbrce+dFU1dcYPjdLrpb+fWojT4Y4rfKVbLth/WsQIiEkZoqrI+wgEoQCzt3JLkk3fiLKp979rrB1lTLpDr/Gec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550142; c=relaxed/simple;
	bh=1gmCRl5yG2iTeU/h0MDzKGFSFmMIxp2EdCvNurN/Vwc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YR4PhwY5GXP+UoGiLKYKkj0Q0pRv/lPwgnQTjvYfJNdIvKBM68HpW+puhXDCYg77/ClqMaZQ5Y2V9htn4CSSEZJhYUQ316KvFlOYK6LLd+uUDlc3/m321b9CbFr2xZkvCc0WA3f/ciw2PsmkYIgD8rzRH+DhXELf8wT2rlox7lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FV9GtJOl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FV9GtJOl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769231F000FF;
	Fri,  9 Oct 2026 12:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791550136;
	bh=2g3NbG/86hO7ppVkSmZQ5BB/XZeuzpVHqFw/u/VRcIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FV9GtJOlDdgsJLivBQtZ6wGxKmXwJmsUWKkVMDRdQeEoBNRenRlODYi/99qQ5YNIh
	 uz60fMz64HzbWExmUkHWI2s/bOGhpWU+j/EzBFfDFLc35vO1FT1wQy6mszcxEKkUFe
	 ZHZBXuo+g4Ku1+0gye72WSBguF7+H+Q80ZCWv0SMNVy3DNlkpOoX+a5hke2lZedZYv
	 CXWWhc3+WsJ2QFRvgJTSiObwdUiAwnSHCeDQPIPcENAkft3GgpIElsGTWDiqXEX90p
	 EmSf49/VOI1S+nw78JXdQoqWpr+11uHN8Q0++32s4BUjaF+DmREQN4AXC0YevjWxJu
	 axv8n7TrVHr+A==
Message-ID: <sashiko-outbox-165562@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/14] clk: samsung: exynos8855: add block usb clock
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raghav Sharma" <raghav.s@samsung.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20261009120137.2801911-11-raghav.s@samsung.com>
References: <20261009120137.2801911-1-raghav.s@samsung.com>
 <CGME20261009114359epcas5p36e3efa42b4c80144cbdfdac6cbb687f6@epcas5p3.samsung.com>
 <20261009120137.2801911-11-raghav.s@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:48:56 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: samsung: incorrect gate_dbg_offset causes double-offset memor=
y reads
--

commit 8e0eb8d00c0f187c13c3ca956facb4eb6bd98db3
Author: Raghav Sharma <raghav.s@samsung.com>

clk: samsung: exynos8855: add block usb clock support
   =20
Register compatible and cmu_info data to support clocks.
CMU_USB, this provides clocks for USB

> diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/c=
lk-exynos8855.c
> index 16d71db11ad06..010ca79116d30 100644
> --- a/drivers/clk/samsung/clk-exynos8855.c
> +++ b/drivers/clk/samsung/clk-exynos8855.c
> @@ -20,11 +20,13 @@
>  #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
>  #define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
>  #define CLKS_NR_HSI                     (CLK_GOUT_SYSREG_HSI  + 1)
> +#define CLKS_NR_USB                     (CLK_GOUT_SYSREG_USB + 1)
> =20
>  #define EXYNOS8855_HSI_GATE_DBG_OFFSET      0x2000
>  #define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
>  #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
>  #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
> +#define EXYNOS8855_USB_GATE_DBG_OFFSET      0x2004
> =20
>  #define EXYNOS8855_DRCG_EN_OFFSET       0x104
>  #define EXYNOS8855_MEMCLK_OFFSET        0x108
> @@ -1261,6 +1263,79 @@ static const struct samsung_cmu_info hsi_cmu_info =
__initconst =3D {
>  	.memclk_offset          =3D EXYNOS8855_MEMCLK_OFFSET,
>  };
> =20
> +/* ---- CMU_USB --------------------------------------------------------=
- */
> +
> +/* Register Offset definitions for CMU_USB (0x13000000) */
> +#define CMU_USB_PLL_CON0_MUX_CLKCMU_USB_NOC_USER                   0x600
> +#define CMU_USB_PLL_CON0_MUX_CLKCMU_USB_USB20DRD_USER              0x610
> +#define CMU_USB_CLK_CON_MUX_CLK_USB_USB20DRD                       0x1000
> +#define CMU_USB_CLK_CON_DIV_CLK_USB_NOC_DIV3                       0x1800
> +#define CMU_USB_CLK_CON_GAT_BLK_USB_UID_CMU_USB_IPCLKPORT_PCLK     0x2000
> +#define CMU_USB_CLK_CON_GAT_BLK_USB_UID_SYSREG_USB_IPCLKPORT_PCLK  0x2030
> +#define CMU_USB_CONTROLLER_OPTION0_CMU_CTRL                        0x800

[ ... ]

> +static const struct samsung_gate_clock usb_gate_clks[] __initconst =3D {
> +	/* System will hang if this critical clock is gated */
> +	GATE(CLK_GOUT_CMU_USB, "gout_cmu_usb",
> +	     "mout_clkcmu_usb_noc_user",
> +	     CMU_USB_CLK_CON_GAT_BLK_USB_UID_CMU_USB_IPCLKPORT_PCLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_SYSREG_USB, "gout_sysreg_usb",
> +	     "mout_clkcmu_usb_noc_user",
> +	     CMU_USB_CLK_CON_GAT_BLK_USB_UID_SYSREG_USB_IPCLKPORT_PCLK,
> +	     21, 0, 0),
> +};
> +
> +static const struct samsung_cmu_info usb_cmu_info __initconst =3D {
> +	.mux_clks               =3D usb_mux_clks,
> +	.nr_mux_clks            =3D ARRAY_SIZE(usb_mux_clks),
> +	.div_clks               =3D usb_div_clks,
> +	.nr_div_clks            =3D ARRAY_SIZE(usb_div_clks),
> +	.gate_clks              =3D usb_gate_clks,
> +	.nr_gate_clks           =3D ARRAY_SIZE(usb_gate_clks),
> +	.nr_clk_ids             =3D CLKS_NR_USB,
> +	.clk_regs               =3D usb_clk_regs,
> +	.nr_clk_regs            =3D ARRAY_SIZE(usb_clk_regs),
> +	.sysreg_clk_regs	=3D dcrg_memclk_sysreg,
> +	.nr_sysreg_clk_regs	=3D ARRAY_SIZE(dcrg_memclk_sysreg),
> +	.clk_name               =3D "bus",
> +	.auto_clock_gate        =3D true,
> +	.gate_dbg_offset        =3D EXYNOS8855_USB_GATE_DBG_OFFSET,

[Severity: High]
Could this offset result in reading incorrect physical addresses when check=
ing
auto-clock-gating state?

Looking at the CCF framework, the gate debug register address is computed by
adding the gate's absolute offset and the gate_dbg_offset:

drivers/clk/samsung/clk.c:
		reg_offs =3D ctx->reg_base + list->offset;

		if (ctx->auto_clock_gate && ctx->gate_dbg_offset)
			clk_hw =3D samsung_register_auto_gate(ctx->dev, NULL,
				list->name, list->parent_name, NULL, NULL,
				list->flags, reg_offs + ctx->gate_dbg_offset,
				list->bit_idx, list->gate_flags, &ctx->lock);

If list->offset is already an absolute offset like 0x2000
(CMU_USB_CLK_CON_GAT_BLK_USB_UID_CMU_USB_IPCLKPORT_PCLK), and we add 0x2004=
 to
it, the final address becomes reg_base + 0x4004 instead of 0x2004. This wou=
ld
read unmapped or incorrect hardware registers.

Should EXYNOS8855_USB_GATE_DBG_OFFSET be a relative shift (like 0x4) instead
of an absolute offset?

This problem wasn't introduced by this patch, but it appears the existing
EXYNOS8855_PERIC_GATE_DBG_OFFSET and other definitions also specify absolute
offsets, which would incorrectly double the offset for those gates as well.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009120137.2801=
911-1-raghav.s@samsung.com?part=3D10
