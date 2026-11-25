Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581440;
	b=aCQ4YTFtn8y7gVfe5UwwEum0nPQoz5FvWgI+DIPUYLCWTFxsaYz8AzaNlVbsLP1FWfwG
	 xo2wt40HDbNQZ+2nENK7u59Leyb/IejDNKl53Z36zYaefrCYOoTxpYZH7EFeHV+wr6XvW
	 jTarZg8GsafbrNp0FuxCmCe8KrUupqHJ+hEZoyNzeJj6/91vpfod0SYAiugR7bnSAK4UW
	 RsYI/eu0KMZHWolvXAO/2I+7PwviemggL1kDh9NVIt8F4s+Lxn96FF8+tXf9RGVa0GSJ0
	 Tvcmd1cF5lrVHEyFXaiGnIt42T04ZwDRcBCOJaeikKJsklezpehnV0QbGhMwycuEaSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581440;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=G7tHl+CojJmBKfurqUx2H1QXkoVyxgTgP0dmRjVHHTQ=;
	b=mm2ij8lquJ8+F4rjlQ3k6Tew4ktrlrB5tz8Q3/p9XfLt8fPT3qOKYG5Nq7uPrt3HYYmO
	 CFcNmiYSxFbj6VpiTSGAzRlqK0hFhhCnigWWIJGoX/T05/hwtJT44frRWT2WJe7xLbNub
	 pCMp9IZsEc4/TKqFKHAJARDXbYS1cu0LqLmc+wiy7yANR6t+tnQubYWwsS2wNVmme54zN
	 Jm5PShT5BRX/e5cUsZ3ubCQufVeNG8COv24NqGpG9D0QX72KUgRA4vwNVTTcMKCU96bJu
	 OTl/OeMa+SrjQc4319+UlBoTm9PvQ+g3m+/xgCirn5+glWTA2OIK0jYgpKnIUsfQoDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UZsdQZwh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16D1606A331;
	Wed, 25 Nov 2026 04:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UZsdQZwh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870461F000ED;
	Wed, 25 Nov 2026 04:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795581439;
	bh=G7tHl+CojJmBKfurqUx2H1QXkoVyxgTgP0dmRjVHHTQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UZsdQZwh/+QD59Y5v/PxCZ/9SdHl1xVToYq9eFq0UXSfPmuX+PBPDDebfGT9/VneB
	 uLwkJ0qadM6aZi41fRYZQhdd6BAd2GKEutfg6+DZZrEe0spRtEASX19conTYlBvFFJ
	 zP/Mvmkze/LpuuEe7m3abQfxgfqKAHU16nvQ0Cw/FGlF8mJqV9mkzbxjPHa2aGk5nZ
	 RkJRjx9abEemJfzsKCCWDdZy872v1Wr4Q5LDhUSlS0fQVR7YsacmlnqnFkWeEJy7Xl
	 NssYbwnQ/WLzLQC8x2YbMSlSggIp//13jjo0GthQFHUJ2XzOrSz6sCYr3pQkoW5eT6
	 DzQzbRwlS1qug==
Message-ID: <sashiko-outbox-232584@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] clk: qcom: Add the Netrani global clock
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-netrani-clock-v1-v2-2-9ef014e71737@krgm.moe>
References: <20261125-netrani-clock-v1-v2-0-9ef014e71737@krgm.moe>
 <20261125-netrani-clock-v1-v2-2-9ef014e71737@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 04:37:19 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [High] clk: qcom: PHY pipe and symbol muxes use
  clk_regmap_mux_closest_ops
- [Medium] clk: qcom: duplicate critical clock handling for
  GCC_CAMERA_SLEEP_CLK
- [Medium] clk: qcom: shared USB3 RCGs use clk_rcg2_ops instead of
  shared ops
- [Medium] clk: qcom: wrong parent map on gcc_ufs_phy_ice_core_clk_src
- [Medium] clk: qcom: missing use_rpm in gcc_netrani_desc keeps CX
  domain powered on
- [Medium] clk: qcom: gcc-netrani: inconsistent QUPv3 SE5 div and QSPI0
  offsets
- [Low] clk: qcom: inconsistent clk_parent_data leaves DT_* indices
  unused
--

commit 077902159f94d35202e6cca7a6f9975247f4011d
Author: SignKirigami <prcups@krgm.moe>

clk: qcom: Add the Netrani global clock controller

This commit adds the Global Clock Controller (GCC) driver for Qualcomm
Netrani, providing clocks, resets, GDSCs, and QUPv3 DFS configurations.

> diff --git a/drivers/clk/qcom/gcc-netrani.c b/drivers/clk/qcom/gcc-netran=
i.c
> new file mode 100644
> index 0000000000000..c16d931317c15
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-netrani.c
> @@ -0,0 +1,2816 @@
[ ... ]
> +enum {
> +	DT_BI_TCXO,
> +	DT_SLEEP_CLK,
> +	DT_PCIE_0_PIPE_CLK,
> +	DT_UFS_PHY_RX_SYMBOL_0_CLK,
> +	DT_UFS_PHY_RX_SYMBOL_1_CLK,
> +	DT_UFS_PHY_TX_SYMBOL_0_CLK,
> +	DT_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK,
> +};
[ ... ]
> +static const struct clk_parent_data gcc_parent_data_6[] =3D {
> +	{ .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> +	{ .hw =3D &gcc_gpll0.clkr.hw },
> +	{ .hw =3D &gcc_gpll9.clkr.hw },
> +	{ .hw =3D &gcc_gpll4.clkr.hw },
> +	{ .hw =3D &gcc_gpll0_out_even.clkr.hw },
> +};

[Severity: Low]
Only DT_BI_TCXO is used (in the PLL definitions), leaving the other six
DT_* enum constants unused because gcc_parent_data_0 through
gcc_parent_data_10 use .fw_name instead of .index, while gcc_parent_data_6
and gcc_usb30_prim_sleep_clk also carry legacy .name fallbacks.  Should the
clk_parent_data entries use .index =3D DT_* consistently across the driver?

[ ... ]

> +static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src =3D {
> +	.reg =3D 0x7b060,
> +	.shift =3D 0,
> +	.width =3D 2,
> +	.parent_map =3D gcc_parent_map_5,
> +	.clkr =3D {
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gcc_pcie_0_pipe_clk_src",
> +			.parent_data =3D gcc_parent_data_5,
> +			.num_parents =3D ARRAY_SIZE(gcc_parent_data_5),
> +			.ops =3D &clk_regmap_mux_closest_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap_mux gcc_ufs_phy_rx_symbol_0_clk_src =3D {
> +	.reg =3D 0x87060,
> +	.shift =3D 0,
> +	.width =3D 2,
> +	.parent_map =3D gcc_parent_map_7,
> +	.clkr =3D {
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gcc_ufs_phy_rx_symbol_0_clk_src",
> +			.parent_data =3D gcc_parent_data_7,
> +			.num_parents =3D ARRAY_SIZE(gcc_parent_data_7),
> +			.ops =3D &clk_regmap_mux_closest_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap_mux gcc_ufs_phy_rx_symbol_1_clk_src =3D {
> +	.reg =3D 0x870d0,
> +	.shift =3D 0,
> +	.width =3D 2,
> +	.parent_map =3D gcc_parent_map_8,
> +	.clkr =3D {
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gcc_ufs_phy_rx_symbol_1_clk_src",
> +			.parent_data =3D gcc_parent_data_8,
> +			.num_parents =3D ARRAY_SIZE(gcc_parent_data_8),
> +			.ops =3D &clk_regmap_mux_closest_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap_mux gcc_ufs_phy_tx_symbol_0_clk_src =3D {
> +	.reg =3D 0x87050,
> +	.shift =3D 0,
> +	.width =3D 2,
> +	.parent_map =3D gcc_parent_map_9,
> +	.clkr =3D {
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gcc_ufs_phy_tx_symbol_0_clk_src",
> +			.parent_data =3D gcc_parent_data_9,
> +			.num_parents =3D ARRAY_SIZE(gcc_parent_data_9),
> +			.ops =3D &clk_regmap_mux_closest_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap_mux gcc_usb3_prim_phy_pipe_clk_src =3D {
> +	.reg =3D 0x49068,
> +	.shift =3D 0,
> +	.width =3D 2,
> +	.parent_map =3D gcc_parent_map_10,
> +	.clkr =3D {
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gcc_usb3_prim_phy_pipe_clk_src",
> +			.parent_data =3D gcc_parent_data_10,
> +			.num_parents =3D ARRAY_SIZE(gcc_parent_data_10),
> +			.ops =3D &clk_regmap_mux_closest_ops,
> +		},
> +	},
> +};

[Severity: High]
Should gcc_pcie_0_pipe_clk_src, the three UFS symbol clock muxes, and
gcc_usb3_prim_phy_pipe_clk_src be defined as struct clk_regmap_phy_mux with
clk_regmap_phy_mux_ops instead of struct clk_regmap_mux with
clk_regmap_mux_closest_ops?

clk-regmap-phy-mux.h is included at the top of this file, and these 2-bit
muxes select between the external PHY clock (0) and bi_tcxo (2).  Because
clk_regmap_mux_closest_ops has no .enable or .disable callbacks and
consumer drivers only enable or disable the child branch clocks, enabling
the branch clocks will never switch the muxes from bi_tcxo to the PHY clock
source, and disabling them before PHY or GDSC power-down will never park
the muxes back on bi_tcxo, which can break PCIe/UFS/USB3 clocking or wedge
the GDSC on power collapse.

[ ... ]

> +static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src =3D {
> +	.cmd_rcgr =3D 0x87074,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_6,
> +	.freq_tbl =3D ftbl_gcc_ufs_phy_ice_core_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gcc_ufs_phy_ice_core_clk_src",
> +		.parent_data =3D gcc_parent_data_6,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_6),
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_rcg2_shared_ops,
> +	},
> +};

[Severity: Medium]
Is gcc_parent_map_6 the right parent map for gcc_ufs_phy_ice_core_clk_src?

P_GCC_GPLL1_OUT_MAIN and gcc_gpll1 are defined in this driver but never
referenced in any parent_map.  In gcc-sm4450.c,
gcc_ufs_phy_ice_core_clk_src (at the same 0x87074 offset) uses a parent map
with P_GCC_GPLL1_OUT_MAIN at cfg 4 rather than gcc_parent_map_6 (which maps
P_GCC_GPLL9_OUT_MAIN at cfg 2 for SDCC2).  Using gcc_parent_map_6 here
leaves gcc_gpll1 orphaned and causes parent lookups on
gcc_ufs_phy_ice_core_clk_src to fail if hardware selects cfg 4.

[ ... ]

> +static struct clk_rcg2 gcc_usb30_prim_master_clk_src =3D {
> +	.cmd_rcgr =3D 0x49028,
> +	.mnd_width =3D 8,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_0,
> +	.freq_tbl =3D ftbl_gcc_usb30_prim_master_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gcc_usb30_prim_master_clk_src",
> +		.parent_data =3D gcc_parent_data_0,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_0),
> +		.ops =3D &clk_rcg2_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_gcc_usb30_prim_mock_utmi_clk_src[] =3D=
 {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src =3D {
> +	.cmd_rcgr =3D 0x49040,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_0,
> +	.freq_tbl =3D ftbl_gcc_usb30_prim_mock_utmi_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gcc_usb30_prim_mock_utmi_clk_src",
> +		.parent_data =3D gcc_parent_data_0,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_0),
> +		.ops =3D &clk_rcg2_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src =3D {
> +	.cmd_rcgr =3D 0x4906c,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_2,
> +	.freq_tbl =3D ftbl_gcc_usb30_prim_mock_utmi_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gcc_usb3_prim_phy_aux_clk_src",
> +		.parent_data =3D gcc_parent_data_2,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_2),
> +		.ops =3D &clk_rcg2_ops,
> +	},
> +};

[Severity: Medium]
Should gcc_usb30_prim_master_clk_src, gcc_usb30_prim_mock_utmi_clk_src, and
gcc_usb3_prim_phy_aux_clk_src use clk_rcg2_shared_ops and
CLK_SET_RATE_PARENT (as in gcc-sm4450.c)?

gcc_usb30_prim_master_clk_src is shared by gcc_usb30_prim_master_clk and
the voted branches gcc_aggre_usb3_prim_axi_clk and
gcc_cfg_noc_usb3_prim_axi_clk, and gcc_usb3_prim_phy_aux_clk_src is shared
by gcc_usb3_prim_phy_aux_clk and gcc_usb3_prim_phy_com_aux_clk.  With
clk_rcg2_ops, these RCGs are not parked on a safe XO source when disabled
(which can wedge gcc_usb30_prim_gdsc if the parent PLL is turned off) and
rate updates while child branches are gated will attempt unforced
CMD_UPDATE writes.

[ ... ]

> +static struct clk_regmap_div gcc_qupv3_wrap0_s5_div_clk_src =3D {
> +	.reg =3D 0x2774c,
> +	.shift =3D 0,
> +	.width =3D 4,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gcc_qupv3_wrap0_s5_div_clk_src",
> +		.parent_hws =3D (const struct clk_hw*[]) {
> +			&gcc_qupv3_wrap0_s5_clk_src.clkr.hw,
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_branch gcc_qupv3_wrap0_s5_clk =3D {
> +	.halt_reg =3D 0x27610,
> +	.halt_check =3D BRANCH_HALT_VOTED,
> +	.clkr =3D {
> +		.enable_reg =3D 0x62008,
> +		.enable_mask =3D BIT(15),
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gcc_qupv3_wrap0_s5_clk",
> +			.parent_hws =3D (const struct clk_hw*[]) {
> +				&gcc_qupv3_wrap0_s5_div_clk_src.clkr.hw,
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT,
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_qupv3_wrap0_qspi0_clk =3D {
> +	.halt_reg =3D 0x27744,
[ ... ]
> +static struct clk_regmap_div gcc_qupv3_wrap1_s5_div_clk_src =3D {
> +	.reg =3D 0x28744,
> +	.shift =3D 0,
> +	.width =3D 4,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gcc_qupv3_wrap1_s5_div_clk_src",
> +		.parent_hws =3D (const struct clk_hw*[]) {
> +			&gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_regmap_div_ro_ops,
> +	},
> +};
[ ... ]
> +static struct clk_branch gcc_qupv3_wrap1_qspi0_clk =3D {
> +	.halt_reg =3D 0x28748,

[Severity: Medium]
Are the register offsets for gcc_qupv3_wrap1_s5_div_clk_src and
gcc_qupv3_wrap1_qspi0_clk (or their wrap0 counterparts) swapped?

Every other clock and reset in QUPv3 wrapper 0 (base 0x27000) and wrapper 1
(base 0x28000) uses identical relative offsets, with an 8-byte stride for
CBCRs.  Here, wrapper 0 puts qspi0_clk.halt_reg at +0x744 (0x27744) and
s5_div_clk_src.reg at +0x74c (0x2774c), whereas wrapper 1 puts
s5_div_clk_src.reg at +0x744 (0x28744) and qspi0_clk.halt_reg at +0x748
(0x28748).  If these offsets are swapped, one wrapper will read a CBCR as a
4-bit clock divider and poll the divider register for branch halt status.

[ ... ]

> +static const u32 gcc_netrani_critical_cbcrs[] =3D {
> +	0x36004, /* GCC_CAMERA_AHB_CLK */
> +	0x36018, /* GCC_CAMERA_SLEEP_CLK */
> +	0x3601c, /* GCC_CAMERA_XO_CLK */
> +	0x37004, /* GCC_DISP_AHB_CLK */
> +	0x37014, /* GCC_DISP_XO_CLK */
> +	0x81004, /* GCC_GPU_CFG_AHB_CLK */
> +	0x42004, /* GCC_VIDEO_AHB_CLK */
> +	0x42018, /* GCC_VIDEO_XO_CLK */
> +};

[Severity: Medium]
Why is 0x36018 (GCC_CAMERA_SLEEP_CLK) both listed in
gcc_netrani_critical_cbcrs and registered in gcc_netrani_clocks as
gcc_camera_sleep_clk with CLK_IS_CRITICAL and no parent?

On SM4450, 0x36018 is also present in gcc_sm4450_critical_cbcrs and is
intentionally omitted from gcc_sm4450_clocks so qcom_branch_set_clk_en()
enables the CBCR directly without registering a CLK_IS_CRITICAL clock in
CCF (which permanently holds a runtime PM reference on the clock controller
device).  If GCC_CAMERA_SLEEP_CLK is meant to be an always-on critical CBCR
here as well, it should not be registered as a CLK_IS_CRITICAL clk_branch;
if it is meant to be consumer-controlled, it should not be marked
CLK_IS_CRITICAL or listed in gcc_netrani_critical_cbcrs.

[ ... ]

> +static const struct qcom_cc_desc gcc_netrani_desc =3D {
> +	.driver_data =3D &gcc_netrani_driver_data,
> +	.config =3D &gcc_netrani_regmap_config,
> +	.clks =3D gcc_netrani_clocks,
> +	.num_clks =3D ARRAY_SIZE(gcc_netrani_clocks),
> +	.resets =3D gcc_netrani_resets,
> +	.num_resets =3D ARRAY_SIZE(gcc_netrani_resets),
> +	.gdscs =3D gcc_netrani_gdscs,
> +	.num_gdscs =3D ARRAY_SIZE(gcc_netrani_gdscs),
> +};

[Severity: Medium]
Should gcc_netrani_desc set .use_rpm =3D true?

The qcom,netrani-gcc devicetree binding requires the CX power domain on the
clock controller node, which platform_probe() attaches and powers on before
calling gcc_netrani_probe().  Without .use_rpm =3D true,
qcom_cc_really_probe() never enables runtime PM or calls
pm_runtime_put_sync(), leaving the CX power domain permanently powered on
even when all GCC clocks and GDSCs are idle.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-netrani-cl=
ock-v1-v2-0-9ef014e71737@krgm.moe?part=3D2
