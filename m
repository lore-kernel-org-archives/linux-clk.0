Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554309;
	b=lOJKm1vt90OizjrapPlM6p77+s68WejxQn3d3mLjl0yvTM1E4j8ffzhsG2PuzcaZfORV
	 +az7qo2AOYAfOkK0WozfXR+E+2X6v9AS8YoGRg350EmbcEhLEjtiwWmU+mu5wizRSUjRL
	 cRshKTI/UIgdlqmtWatykWMeVLEyj2bBhCuZMgeRoXlZpAfkKlfSpvlXDMawdDsyK3ko6
	 HSWohUomWxCjek0FRvkZhp8rpD9MGDjRgoBNxi+2A7S3HCQS+jypsUhCDSS6H8M+7A1Hw
	 veQ2PJAEAfnKHefksQp3HWe9JHo41Rh0tZN/wek/Cl3PJGjCM4ElrGHXjhkk8pokm1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554309;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DsD9LGXBj6Jra4Jv7udCvBynd7rLvaV97w5MkBs8GCs=;
	b=TCo0OjRlJGJ+LKbF1j8FCbFYSJCnQlPs6sI29vfpkXDD/HTFoyk3CmP/k7ryQgyBKX40
	 vBmcEoUOnK+GBlAmcl7T/2qfkXPZG1Qe0Ua1Sm6Ot8hNrq1ARXFweaisG3pY66WPIVc4M
	 OjI+1y0bqXafAop9bGOxlEiMFj0X5Lq6PVt2BFZwUuQMfVBA3ZCXt85N/EadQdiXFFbdj
	 xwC5roIuBiumH9O22Bo0UVcjRiX6CwBitwquoZ9dMWwiJhN63asovqYLYsbQdGUH6Z7pp
	 p46BVyYbdTnpZPcw77AKMeZanMU9DTc2eeQMTZoYLbtuOsRob8M9v6QSq32b8Ywi/TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cRPtodh2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0166606A321;
	Fri, 13 Nov 2026 07:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cRPtodh2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27AF01F000C4;
	Fri, 13 Nov 2026 07:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794554309;
	bh=DsD9LGXBj6Jra4Jv7udCvBynd7rLvaV97w5MkBs8GCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cRPtodh29JWVeppnMdQ9WQuFH6Iyi6jALbJX4J+RlbVLKElvq8m1egQTRazM9P1Bd
	 q47UNV0nG5COxA//Mtt+PzIyBKJkFE/sjG/giP117p3HVPgnid6zij9QgAQeunVEfH
	 3bUkOE7E9LBcZhrWWgfT9Kg0I5jV3xAa5DNMIdI/bE16Rw/PvyfU5bfsd1Pxp2BPah
	 ZHV0WAmoKmkheHW1L4wgJVMWq/lX0+RhGYSVrMv+Jy4VxN2qKvUptPCryr1XyX8wPO
	 Ps5DymzNocuh0/2fjS7JXfsEHUlgDP8TkKg+yy0vJlauGxBjgGYLk8aUoDjYZ35H3H
	 xwEcwzRTyM8EA==
Message-ID: <sashiko-outbox-212336@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/8] clk: sunxi-ng: a733: Add mod clocks support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-a733-clk-v7-6-db7c5451ffa2@pigmoral.tech>
References: <20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech>
 <20261112-a733-clk-v7-6-db7c5451ffa2@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 07:18:25 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] clk: sunxi-ng: a733: unintended CLK_SET_RATE_PARENT on
  eink_clk
- [Medium] clk: sunxi-ng: a733: missing CLK_SET_RATE_PARENT on media mod
  clocks
--

commit 6e107a79cabf47c1760cd7e323625401bc6ffc47
Author: Junhui Liu <junhui.liu@pigmoral.tech>

clk: sunxi-ng: a733: Add mod clocks support

This commit adds module clock definitions for the Allwinner A733 SoC to the
sun60i-a733 CCU driver.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index 8bc603393f5a5..5ea65bf5b5e05 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c

[ ... ]

> @@ -511,6 +521,893 @@ static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(mbus_clk=
, "mbus", mbus_parents, 0x588

[ ... ]

> +static const struct clk_hw *eink_parents[] =3D {
> +	&pll_periph0_480M_clk.common.hw,
> +	&pll_periph0_400M_clk.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(eink_clk, "eink", eink_parents, 0xa6=
0,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_SET_RATE_PARENT);

[Severity: Medium]
Should eink_clk omit CLK_SET_RATE_PARENT?  Unlike eink_panel_clk, eink_pare=
nts
only contains pll_periph0_480M_clk and pll_periph0_400M_clk.  Because
pll_periph0_480M_clk uses writable ccu_div_ops without read-only or gate
protection, calling clk_set_rate() on eink_clk can reprogram the shared
480 MHz peripheral PLL divider used by UART, GIC, MBUS, SPI, UFS, and USB
clocks.

[ ... ]

> +static const struct clk_hw *npu_parents[] =3D {
> +	&pll_npu_clk.common.hw,
> +	&pll_periph0_800M_clk.common.hw,
> +	&pll_periph0_600M_clk.hw,
> +	&pll_periph0_480M_clk.common.hw,
> +	&pll_ve0_clk.common.hw,
> +	&pll_ve1_clk.common.hw,
> +	&pll_de_3x_clk.common.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(npu_clk, "npu", npu_parents, 0xb00,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +
> +/*
> + * GPU_CLK =3D ClockSource * ((16 - M) / 16)
> + * Here we use a div_table to select M values that result in integer div=
isors.
> + */
> +static struct clk_div_table gpu_div_table[] =3D {
> +	{ .val =3D 0, .div =3D 1 },
> +	{ .val =3D 8, .div =3D 2 },
> +	{ .val =3D 12, .div =3D 4 },
> +	{ .val =3D 14, .div =3D 8 },
> +	{ .val =3D 15, .div =3D 16 },
> +	{ /* sentinel */ },
> +};
> +static const struct clk_parent_data gpu_parents[] =3D {
> +	{ .hw =3D &pll_gpu0_clk.common.hw, },
> +	{ .hw =3D &pll_periph0_800M_clk.common.hw, },
> +	{ .hw =3D &pll_periph0_600M_clk.hw, },
> +	{ .hw =3D &pll_periph0_400M_clk.hw, },
> +	{ .hw =3D &pll_periph0_300M_clk.hw, },
> +	{ .hw =3D &pll_periph0_200M_clk.hw, },
> +};
> +static struct ccu_div gpu0_clk =3D {
> +	.enable		=3D BIT(31),
> +	.div		=3D _SUNXI_CCU_DIV_TABLE(0, 4, gpu_div_table),
> +	.mux		=3D _SUNXI_CCU_MUX(24, 3),
> +	.common		=3D {
> +		.reg		=3D 0xb20,
> +		.features	=3D CCU_FEATURE_UPDATE_BIT,
> +		.hw.init	=3D CLK_HW_INIT_PARENTS_DATA("gpu0", gpu_parents,
> +							   &ccu_div_ops, 0),
> +	}
> +};

[ ... ]

> +static const struct clk_hw *i2spcm_parents[] =3D {
> +	&pll_audio0_4x_clk.common.hw,
> +	&pll_audio1_div2_clk.hw,
> +	&pll_audio1_div5_clk.hw,
> +	&pll_periph0_200M_clk.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(i2spcm0_clk, "i2spcm0", i2spcm_paren=
ts, 0x1200,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);

[ ... ]

> +static const struct clk_parent_data display_parents[] =3D {
> +	{ .hw =3D &pll_video0_4x_clk.common.hw },
> +	{ .hw =3D &pll_video1_4x_clk.common.hw },
> +	{ .hw =3D &pll_video2_4x_clk.common.hw },
> +	{ .hw =3D &pll_periph0_2x_clk.common.hw },
> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(tcon_lcd0_clk, "tcon-lcd0", displa=
y_parents, 0x1500,
> +				      0, 5,	/* M */
> +				      24, 3,	/* mux */
> +				      BIT(31),	/* gate */
> +				      0);

[Severity: Medium]
Are the display (tcon_lcd0..2_clk, combphy0..1_clk, edp_tv_clk, hdmi_tv_clk=
),
audio (i2spcm0..4_clk, i2spcm2_asrc_clk, spdif_tx_clk, dmic_clk), GPU
(gpu0_clk), and NPU (npu_clk) module clocks missing CLK_SET_RATE_PARENT?

The parent video and audio PLL post-dividers (pll_video0..2_4x/3x_clk and
pll_audio1_div2/div5_clk) set CLK_SET_RATE_PARENT specifically so downstream
module clocks can adjust the dedicated video and audio PLLs, and pll_audio0,
pll_gpu0, and pll_npu are likewise dedicated to those blocks.  Without
CLK_SET_RATE_PARENT on these module clocks, clk_set_rate() is limited to
dividing the boot-time PLL rate and cannot configure exact pixel clocks, au=
dio
sample rates, or GPU/NPU frequencies.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-a733-clk-v=
7-0-db7c5451ffa2@pigmoral.tech?part=3D6
