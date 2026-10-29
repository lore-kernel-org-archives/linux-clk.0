Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258752;
	b=AppG9yvgGscmtzW0ea9Q6MvH9yHnutjXHoff8aWcL7JiAQHqSy33/ZOO9eI5igJ515bZ
	 WWeQCWuXMeaTGt9FJirqWMBU95IeWRq/cH2yJAuwE3dFD7gaSO8/WZooe/Ome6mU906ky
	 JMR5/1Vg1gF/EJ5xnoZL3D6fJxSFoR/NbJ9jROYLKDAcwo0oyOcChsWJOUquJ6x4nygYi
	 cU2q4z1YpsEaO0v9vmuTM0XThjWcBwIdLZxcKYJ9TsGD2LNuXGpEkBuxzdP4qVPPOaUz4
	 zCu4Lb06EZhJ4keMs9qcqiopvH0wigguh4b+RKFIlwuhRg1ZAKmameSPl209kOh16mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258752;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1+V/8LjNgGwsyhy2q8z9zU7tcDLH3Yc5b4XX9L7E1Vg=;
	b=UmZ4CNS+ACUEbGaf2ANNSVMGLxBFFcGyaJ+r7kbQwBeYIyi3B2DLG1JhtV5jk4d5xf0U
	 Pk8vXxHJ5Nk3Ttwl0Cu0cnC5an1vFxDgc+hHMSL1O1tGtnteC4TZFh0vBZEqFDIoWEblM
	 nhC6oqjsI9/P8RUrJcq+MK6H21YmEqGghfME6ssLO9WxKOFvza81wM5SOBGIKkKznFVF1
	 yr+F7/sLRy5kirgHLDZIups1XlerrssoiefpjHja+SETHnRamqTaijB1wTK/RazpFCNf6
	 67eiqlHnU1huPdiowt6lJIUmVnpbNHCMIF993KXBjm31bEGCqB2HGsQrpJgNkir6yOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZJAU2/eD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEFB606A31D;
	Thu, 29 Oct 2026 07:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZJAU2/eD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6F11F01829;
	Thu, 29 Oct 2026 07:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793258752;
	bh=1+V/8LjNgGwsyhy2q8z9zU7tcDLH3Yc5b4XX9L7E1Vg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZJAU2/eDgDgYK9HG+8gglqtmQrwQPBydT/fyMmtJq/cw+63VW+j882+F/fflqIqNx
	 pKJ1A4kcgopRCXAm413vsOyGQVOwaRHxPTjSjHZgI//i4hqkESpfHrjcrJopLbiZQk
	 xY/HlTuR1tWZJvP6x5gzjz8AFZ39T5QIXRUUJcitCuxTFidP0qpf90byBNLunIfXaa
	 HJkKg6sj0A6c7JeOWFaYOzQggjHKBqCe9kEsSJeFPzqOXYev8mmsT+ilVsLT0v5iyh
	 dZbu+bTbm24Mp1yyLywIMyDBULN79F/H1CvT5j/bp8oqEL4/rlifT6LHwuI/x+30kD
	 KWVejgMNPsJQw==
Message-ID: <sashiko-outbox-188863@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v11 2/5] clk: qcom: Add Global Clock Controller
 (GCC) driver for SM7250
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029-master-v11-2-2c29e382162c@gmail.com>
References: <20261029-master-v11-0-2c29e382162c@gmail.com>
 <20261029-master-v11-2-2c29e382162c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 07:25:51 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] clk: qcom: gcc-sm7250: wrong parent source and map on gcc_cpuss_ah=
b_clk_src
- [High] clk: qcom: gcc-sm7250: missing CLK_OPS_PARENT_ENABLE on gcc_sdcc2_=
apps_clk_src
- [High] clk: qcom: gcc-sm7250: mark gcc_cpuss_gnoc_clk critical to prevent=
 gating
--

commit df02ee88c50cbe124252b368c43513c346759f86
Author: Sreeshankar K <sreeshankar0910@gmail.com>

clk: qcom: Add Global Clock Controller (GCC) driver for SM7250

This commit adds the Global Clock Controller (GCC) driver for Qualcomm SM72=
50
SoC devices, registering PLLs, RCGs, branch clocks, GDSCs, and resets.

> diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm7250.c
> new file mode 100644
> index 0000000000000..e4304c667dace
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sm7250.c
> @@ -0,0 +1,2286 @@

[ ... ]

> +enum {
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,
> +	DT_SLEEP_CLK,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_GPLL0_OUT_EVEN,
> +	P_GPLL0_OUT_MAIN,
> +	P_GPLL6_OUT_MAIN,
> +	P_GPLL9_OUT_MAIN,
> +	P_SLEEP_CLK,
> +};

[ ... ]

> +static const struct parent_map gcc_parent_map_0[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_GPLL0_OUT_MAIN, 1 },
> +	{ P_GPLL0_OUT_EVEN, 6 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_0[] =3D {
> +	{ .index =3D DT_BI_TCXO },
> +	{ .hw =3D &gpll0.clkr.hw },
> +	{ .hw =3D &gpll0_out_even.clkr.hw },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_0_ao[] =3D {
> +	{ .index =3D DT_BI_TCXO_AO },
> +};

[ ... ]

> +static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] =3D {
> +	F(19200000, DT_BI_TCXO_AO, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 gcc_cpuss_ahb_clk_src =3D {
> +	.cmd_rcgr =3D 0x48010,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_0,
> +	.freq_tbl =3D ftbl_gcc_cpuss_ahb_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data){
> +		.name =3D "gcc_cpuss_ahb_clk_src",
> +		.parent_data =3D gcc_parent_data_0_ao,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_0_ao),
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_rcg2_ops,
> +	},
> +};

[Severity: High]
In drivers/clk/qcom/gcc-sm7250.c, ftbl_gcc_cpuss_ahb_clk_src passes
DT_BI_TCXO_AO (which is 1 in the DT clock index enum) instead of P_BI_TCXO
(which is 0 in the parent source enum) as the source argument to F().

In addition, gcc_cpuss_ahb_clk_src pairs the 3-entry gcc_parent_map_0 with
gcc_parent_data_0_ao, which only defines 1 entry.

When clk_rcg2_determine_rate() or clk_rcg2_set_rate() runs on
gcc_cpuss_ahb_clk_src, it calls qcom_find_src_index() in
drivers/clk/qcom/common.c:

    int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map=
, u8 src)
    {
        int i, num_parents =3D clk_hw_get_num_parents(hw);

        for (i =3D 0; i < num_parents; i++)
            if (src =3D=3D map[i].src)
                return i;

        return -ENOENT;
    }

Because num_parents is 1 and map[0].src is P_BI_TCXO (0), passing
src =3D DT_BI_TCXO_AO (1) causes qcom_find_src_index() to return -ENOENT.
Furthermore, with only 1 entry in gcc_parent_data_0_ao,
__clk_rcg2_get_parent() cannot resolve gpll0 or gpll0_out_even if selected =
in
hardware, and if gcc_parent_data_0_ao is expanded to 3 entries,
DT_BI_TCXO_AO (1) collides with P_GPLL0_OUT_EVEN (1).

Should ftbl_gcc_cpuss_ahb_clk_src use P_BI_TCXO, and should
gcc_parent_data_0_ao either include the remaining parents from
gcc_parent_data_0 or use a matching single-entry parent_map?

[ ... ]

> +static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] =3D {
> +	F(400000, P_BI_TCXO, 12, 1, 4),
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(25000000, P_GPLL0_OUT_EVEN, 6, 1, 2),
> +	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
> +	F(100000000, P_GPLL0_OUT_EVEN, 3, 0, 0),
> +	F(202000000, P_GPLL9_OUT_MAIN, 4, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 gcc_sdcc2_apps_clk_src =3D {
> +	.cmd_rcgr =3D 0x1400c,
> +	.mnd_width =3D 8,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_4,
> +	.freq_tbl =3D ftbl_gcc_sdcc2_apps_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data){
> +		.name =3D "gcc_sdcc2_apps_clk_src",
> +		.parent_data =3D gcc_parent_data_4,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_4),
> +		.ops =3D &clk_rcg2_floor_ops,
> +	},
> +};

[Severity: High]
In drivers/clk/qcom/gcc-sm7250.c, ftbl_gcc_sdcc2_apps_clk_src uses
P_GPLL9_OUT_MAIN (gpll9) for the 202 MHz entry. Unlike gpll0, gpll9 is only
used by gcc_sdcc2_apps_clk_src and is not enabled by default.

Because gcc_sdcc2_apps_clk_src uses clk_rcg2_floor_ops without setting
CLK_OPS_PARENT_ENABLE in its flags (unlike gcc_sdcc1_apps_clk_src with gpll=
6),
calling clk_set_rate() on gcc_sdcc2_apps_clk to or from 202 MHz while the
clock is unprepared or disabled will invoke update_config() in
drivers/clk/qcom/clk-rcg2.c while gpll9 is off.

Wouldn't that cause the RCG update handshake to time out with a warning and
return -EBUSY unless CLK_OPS_PARENT_ENABLE is set on gcc_sdcc2_apps_clk_src?

[ ... ]

> +static struct clk_branch gcc_cpuss_gnoc_clk =3D {
> +	.halt_reg =3D 0x48064,
> +	.halt_check =3D BRANCH_HALT_VOTED,
> +	.clkr =3D {
> +		.enable_reg =3D 0x52000,
> +		.enable_mask =3D BIT(29),
> +		.hw.init =3D &(const struct clk_init_data){
> +			.name =3D "gcc_cpuss_gnoc_clk",
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};

[ ... ]

> +static struct clk_regmap *gcc_sm7250_clocks[] =3D {
> +	[GCC_AGGRE_UFS_PHY_AXI_CLK] =3D &gcc_aggre_ufs_phy_axi_clk.clkr,
> +	[GCC_AGGRE_USB3_PRIM_AXI_CLK] =3D &gcc_aggre_usb3_prim_axi_clk.clkr,
> +	[GCC_BOOT_ROM_AHB_CLK] =3D &gcc_boot_rom_ahb_clk.clkr,
> +	[GCC_CAMERA_HF_AXI_CLK] =3D &gcc_camera_hf_axi_clk.clkr,
> +	[GCC_CAMERA_SF_AXI_CLK] =3D &gcc_camera_sf_axi_clk.clkr,
> +	[GCC_CFG_NOC_USB3_PRIM_AXI_CLK] =3D &gcc_cfg_noc_usb3_prim_axi_clk.clkr,
> +	[GCC_CPUSS_AHB_CLK_SRC] =3D &gcc_cpuss_ahb_clk_src.clkr,
> +	[GCC_CPUSS_GNOC_CLK] =3D &gcc_cpuss_gnoc_clk.clkr,

[ ... ]

> +static void gcc_sm7250_clk_regs_configure(struct device *dev, struct reg=
map *regmap)
> +{
> +	/*
> +	 * Disable the GPLL0 active input to NPU and GPU
> +	 * via MISC registers.
> +	 */
> +	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
> +	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
> +
> +	/*
> +	 * Critical clocks sharing the same register with
> +	 * different masks
> +	 */
> +	regmap_update_bits(regmap, 0x52000, BIT(21), BIT(21)); /* GCC_CPUSS_AHB=
_CLK */
> +}

[Severity: High]
In drivers/clk/qcom/gcc-sm7250.c, gcc_cpuss_gnoc_clk is registered in
gcc_sm7250_clocks[] with clk_branch2_ops and without CLK_IS_CRITICAL.

When clk_disable_unused() runs at late_initcall_sync and no consumer has
claimed GCC_CPUSS_GNOC_CLK, clk_disable_unused_subtree() will call
clk_branch2_disable() -> clk_disable_regmap() and clear BIT(29) in vote
register 0x52000, gating the CPU subsystem to GNOC interconnect clock and
hanging the system.

Should gcc_cpuss_gnoc_clk be marked with CLK_IS_CRITICAL (or handled via
gcc_sm7250_clk_regs_configure() like GCC_CPUSS_AHB_CLK in register 0x52000)=
 so
that it is not disabled at boot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-master-v11=
-0-2c29e382162c@gmail.com?part=3D2
