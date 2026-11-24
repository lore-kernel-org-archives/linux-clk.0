Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516132;
	b=piDpQ7xM3fG560+1ZQsoXv95dj2f43cx8VQl0lzm4AiJo5iODdxOUNRaOoC/qgqPCK1b
	 sCqoMlbpmkQ62FUjKd/0FHN7BpUMwhDlnj5aEgWSxnl0RKGbyNw/G7IPrviC2tNzRYM7d
	 WEQbhI6bntPVLshGw8jWld0tsB3nHZsfL4EnMMoYvxKXAseBGlwetGG/5uyEkpRp1qz1P
	 ujkKkFwdDMgIZ+ONpARnr+bwQEgzaOPSAEUvXhVIu+SpoeLnfi3XI3Oik8hGzoXtSZeok
	 F/dQhyxPi19Wj+DGeb7eVb9Qr1FbJqliIwaWOilyXYmNwO5vd5rnm+5ou6z02nhMISg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516132;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0xMlouJrypYx/yImtpjHEvUuMDrtLk3A8nlTJrmuU3A=;
	b=WwDaklA0QhpZk4Y/CcrooUkYDPkIl25Um1R973oOaZpbI5nfOoMp/KDzpa4JwkSVebNp
	 Ym0QDTDWKTDF4q5g5yTUJUD4zavOcmvUnT9NV7aNyb7YKN6bgCeMgcUfbLz1CuOH1H0S3
	 aaHl7PYZaLLNp9mtoGmSD/ckiOuUHt5sA/uVVlFOpKOAce6+r84FyZLoYIMVOmoPfvpCQ
	 Z6k9ieNR6c7daFmxlyCSt1toZ1gmB/DSThcy33qZIzah9m3RL0yVVyGiPPFyoFWSaLVNk
	 KjyTAM8UIywulGPRBdxe/CLlMr0nVY2GL1Aq0Wuw/BYoFJRBEDKWDOxkzBXDA7UzM1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CdiunMw5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32499606A31E;
	Tue, 24 Nov 2026 10:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CdiunMw5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7581F000CA;
	Tue, 24 Nov 2026 10:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795516131;
	bh=0xMlouJrypYx/yImtpjHEvUuMDrtLk3A8nlTJrmuU3A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CdiunMw5H2E/puEF1nMlJcWqWzLJipi06O9cofA/4yJTWcA0obERovtCMznwSLX+g
	 RJ/m37VKfPlUb6iHSwft0ceHQOi1KHTfX9byKVrRBAbCD+9F/n4Ce3nNQKqW0h5TnI
	 mOICiv/YlNGBx8YDWfPvhVdlfgZgfAoY7eNceNyCRvj6gLd7m9ASlVVEOGntHzn7GX
	 fwKvD1eZ9vL67p6hG5scp2F/8vOkYQQfdpNJUiTdQGbOqWKKH/q/z0sa38+i6aW5d8
	 5x3tSqWmqO8Kh2aO4TyTAAWkZD3IbiFN3EQ7WePI+pghZnzUmDLUEyDy9GnVf/FIfC
	 FrNmVgseXGAkw==
Message-ID: <sashiko-outbox-230964@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: Add the Netrani global clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-netrani-clock-v1-v1-2-ce10cedbfa4b@krgm.moe>
References: <20261124-netrani-clock-v1-v1-0-ce10cedbfa4b@krgm.moe>
 <20261124-netrani-clock-v1-v1-2-ce10cedbfa4b@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 10:28:51 +0000
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
- [High] clk: qcom: mismatched parent arrays and num_parents in six
  Netrani RCGs
- [High] clk: qcom: missing reset entries in gcc_netrani_resets clobber
  GPLL0 at 0x0
- [Medium] clk: qcom: QUPv3 SE5 RCGs omitted from gcc_dfs_clocks[] in
  gcc-netrani
- [Medium] clk: qcom: inconsistent QUPv3 SE5 divider and QSPI0 offsets
  across wrappers
- [Medium] clk: qcom: critical gcc_camera_sleep_clk registered as
  gateable branch clock
- [Medium] clk: qcom: gcc_netrani_prepare_required_clocks() writes video
  AXI bit to 0x4201c
- [Low] clk: qcom: open-coded probe and init boilerplate in gcc-netrani
--

commit 391c2be97d7837927f3384c23157765a1781b299
Author: SignKirigami <prcups@krgm.moe>

clk: qcom: Add the Netrani global clock controller

This commit adds the global clock controller (GCC) driver for Qualcomm
Netrani, providing clocks, resets, power domains, and QUPv3 DFS roots.

> diff --git a/drivers/clk/qcom/gcc-netrani.c b/drivers/clk/qcom/gcc-netran=
i.c
> new file mode 100644
> index 0000000000000..f8bbd0edd528c
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-netrani.c
> @@ -0,0 +1,2833 @@

[ ... ]

> +static const struct parent_map gcc_parent_map_0[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_GCC_GPLL0_OUT_MAIN, 1 },
> +	{ P_GCC_GPLL0_OUT_EVEN, 6 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_0[] =3D {
> +	{ .fw_name =3D "bi_tcxo" },
> +	{ .hw =3D &gcc_gpll0.clkr.hw },
> +	{ .hw =3D &gcc_gpll0_out_even.clkr.hw },
> +};

[ ... ]

> +static const struct parent_map gcc_parent_map_2[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_SLEEP_CLK, 5 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_2[] =3D {
> +	{ .fw_name =3D "bi_tcxo" },
> +	{ .fw_name =3D "sleep_clk" },
> +};
> +
> +static const struct parent_map gcc_parent_map_3[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_GCC_GPLL0_OUT_MAIN, 1 },
> +	{ P_GCC_GPLL0_OUT_ODD, 2 },
> +	{ P_GCC_GPLL10_OUT_MAIN, 3 },
> +	{ P_GCC_GPLL0_OUT_EVEN, 6 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_3[] =3D {
> +	{ .fw_name =3D "bi_tcxo" },
> +	{ .hw =3D &gcc_gpll0.clkr.hw },
> +	{ .hw =3D &gcc_gpll0_out_odd.clkr.hw },
> +	{ .hw =3D &gcc_gpll10.clkr.hw },
> +	{ .hw =3D &gcc_gpll0_out_even.clkr.hw },
> +};
> +
> +static const struct parent_map gcc_parent_map_4[] =3D {
> +	{ P_BI_TCXO, 0 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_4[] =3D {
> +	{ .fw_name =3D "bi_tcxo" },
> +};
> +
> +static const struct parent_map gcc_parent_map_5[] =3D {
> +	{ P_PCIE_0_PIPE_CLK, 0 },
> +	{ P_BI_TCXO, 2 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_5[] =3D {
> +	{ .fw_name =3D "pcie_0_pipe_clk" },
> +	{ .fw_name =3D "bi_tcxo" },
> +};

[ ... ]

> +static struct clk_rcg2 gcc_pcie_0_aux_clk_src =3D {
> +	.cmd_rcgr =3D 0x7b064,
> +	.mnd_width =3D 16,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_2,
> +	.freq_tbl =3D ftbl_gcc_pcie_0_aux_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gcc_pcie_0_aux_clk_src",
> +		.parent_data =3D gcc_parent_data_2,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_3),
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_rcg2_shared_ops,
> +	},
> +};

[ ... ]

> +static struct clk_rcg2 gcc_sdcc1_apps_clk_src =3D {
> +	.cmd_rcgr =3D 0xb3010,
> +	.mnd_width =3D 8,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_3,
> +	.freq_tbl =3D ftbl_gcc_sdcc1_apps_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gcc_sdcc1_apps_clk_src",
> +		.parent_data =3D gcc_parent_data_3,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_4),
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_rcg2_shared_floor_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_gcc_sdcc1_ice_core_clk_src[] =3D {
> +	F(100000000, P_GCC_GPLL0_OUT_ODD, 2, 0, 0),
> +	F(150000000, P_GCC_GPLL0_OUT_EVEN, 2, 0, 0),
> +	F(300000000, P_GCC_GPLL0_OUT_EVEN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src =3D {
> +	.cmd_rcgr =3D 0xb3030,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_3,
> +	.freq_tbl =3D ftbl_gcc_sdcc1_ice_core_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gcc_sdcc1_ice_core_clk_src",
> +		.parent_data =3D gcc_parent_data_3,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_4),
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_rcg2_shared_floor_ops,
> +	},
> +};

[ ... ]

> +static const struct freq_tbl ftbl_gcc_ufs_phy_ice_core_clk_src[] =3D {
> +	F(100000000, P_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
> +	F(200000000, P_GCC_GPLL0_OUT_MAIN, 3, 0, 0),
> +	F(403000000, P_GCC_GPLL4_OUT_MAIN, 2, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src =3D {
> +	.cmd_rcgr =3D 0x87074,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_0,
> +	.freq_tbl =3D ftbl_gcc_ufs_phy_ice_core_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gcc_ufs_phy_ice_core_clk_src",
> +		.parent_data =3D gcc_parent_data_0,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_2),
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src =3D {
> +	.cmd_rcgr =3D 0x870a8,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_4,
> +	.freq_tbl =3D ftbl_gcc_pcie_0_aux_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gcc_ufs_phy_phy_aux_clk_src",
> +		.parent_data =3D gcc_parent_data_4,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_5),
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_rcg2_shared_ops,
> +	},
> +};

[ ... ]

> +static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src =3D {
> +	.cmd_rcgr =3D 0x4906c,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_2,
> +	.freq_tbl =3D ftbl_gcc_usb30_prim_mock_utmi_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gcc_usb3_prim_phy_aux_clk_src",
> +		.parent_data =3D gcc_parent_data_2,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_3),
> +		.ops =3D &clk_rcg2_ops,
> +	},
> +};

[Severity: High]
Do these six RCGs pass a mismatched ARRAY_SIZE() for .num_parents?

In gcc_pcie_0_aux_clk_src, gcc_ufs_phy_phy_aux_clk_src, and
gcc_usb3_prim_phy_aux_clk_src, .num_parents is larger than the assigned
parent_data and parent_map arrays, so clk_core_populate_parent_map() and
qcom_find_src_index() read past the end of those tables.

In gcc_sdcc1_apps_clk_src and gcc_sdcc1_ice_core_clk_src,
ARRAY_SIZE(gcc_parent_data_4) truncates the 5-entry gcc_parent_data_3 table
to 1 entry (P_BI_TCXO), causing qcom_find_src_index() to fail with -ENOENT
for every PLL-backed rate in their frequency tables.

In gcc_ufs_phy_ice_core_clk_src, .num_parents uses gcc_parent_data_2 while
.parent_data and .parent_map use gcc_parent_data_0 and gcc_parent_map_0,
which also lack the P_GCC_GPLL4_OUT_MAIN parent required for the 403 MHz
entry in ftbl_gcc_ufs_phy_ice_core_clk_src.

[ ... ]

> +static struct clk_branch gcc_camera_sleep_clk =3D {
> +	.halt_reg =3D 0x36018,
> +	.halt_check =3D BRANCH_HALT,
> +	.clkr =3D {
> +		.enable_reg =3D 0x36018,
> +		.enable_mask =3D BIT(0),
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gcc_camera_sleep_clk",
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_video_axi0_clk =3D {
> +	.halt_reg =3D 0x4200c,
> +	.halt_check =3D BRANCH_HALT_SKIP,
> +	.hwcg_reg =3D 0x4200c,
> +	.hwcg_bit =3D 1,
> +	.clkr =3D {
> +		.enable_reg =3D 0x4200c,
> +		.enable_mask =3D BIT(0),
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gcc_video_axi0_clk",
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};

[ ... ]

> +static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init =3D {
> +	.name =3D "gcc_qupv3_wrap0_s5_clk_src",
> +	.parent_data =3D gcc_parent_data_0,
> +	.num_parents =3D ARRAY_SIZE(gcc_parent_data_0),
> +	.flags =3D CLK_SET_RATE_PARENT,
> +	.ops =3D &clk_rcg2_shared_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src =3D {
> +	.cmd_rcgr =3D 0x27618,
> +	.mnd_width =3D 16,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_0,
> +	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s5_clk_src,
> +	.clkr.hw.init =3D &gcc_qupv3_wrap0_s5_clk_src_init,
> +};
> +
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

[ ... ]

> +static struct clk_branch gcc_qupv3_wrap0_qspi0_clk =3D {
> +	.halt_reg =3D 0x27744,
> +	.halt_check =3D BRANCH_HALT_VOTED,
> +	.clkr =3D {
> +		.enable_reg =3D 0x62010,
> +		.enable_mask =3D BIT(24),
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gcc_qupv3_wrap0_qspi0_clk",
> +			.parent_hws =3D (const struct clk_hw*[]) {
> +				&gcc_qupv3_wrap0_s5_clk_src.clkr.hw,
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT,
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};

[ ... ]

> +static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init =3D {
> +	.name =3D "gcc_qupv3_wrap1_s5_clk_src",
> +	.parent_data =3D gcc_parent_data_0,
> +	.num_parents =3D ARRAY_SIZE(gcc_parent_data_0),
> +	.flags =3D CLK_SET_RATE_PARENT,
> +	.ops =3D &clk_rcg2_shared_ops,
> +};
> +
> +static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src =3D {
> +	.cmd_rcgr =3D 0x28618,
> +	.mnd_width =3D 16,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_0,
> +	.freq_tbl =3D ftbl_gcc_qupv3_wrap1_s5_clk_src,
> +	.clkr.hw.init =3D &gcc_qupv3_wrap1_s5_clk_src_init,
> +};
> +
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
> +	.halt_check =3D BRANCH_HALT_VOTED,
> +	.clkr =3D {
> +		.enable_reg =3D 0x62010,
> +		.enable_mask =3D BIT(25),
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gcc_qupv3_wrap1_qspi0_clk",
> +			.parent_hws =3D (const struct clk_hw*[]) {
> +				&gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT,
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};

[Severity: Medium]
Are the SE5 divider and QSPI0 CBCR offsets swapped between QUPv3 wrapper 0
and wrapper 1?

Both wrappers have identical relative offsets up to +0x618, but wrapper 0
places gcc_qupv3_wrap0_qspi0_clk.halt_reg at +0x744 (0x27744) and
gcc_qupv3_wrap0_s5_div_clk_src.reg at +0x74c (0x2774c), whereas wrapper 1
places gcc_qupv3_wrap1_s5_div_clk_src.reg at +0x744 (0x28744) and
gcc_qupv3_wrap1_qspi0_clk.halt_reg at +0x748 (0x28748).  One of the two
wrappers will read the CBCR as a clock divider and poll the divider register
for branch halt status.

[ ... ]

> +static const struct qcom_reset_map gcc_netrani_resets[] =3D {
> +	[GCC_CAMERA_BCR] =3D { 0x36000 },
> +	[GCC_DISPLAY_BCR] =3D { 0x37000 },
> +	[GCC_GPU_BCR] =3D { 0x81000 },

[ ... ]

> +	[GCC_USB3PHY_PHY_SEC_BCR] =3D { 0x60010 },
> +	[GCC_VIDEO_BCR] =3D { 0x42000 },
> +};

[Severity: High]
Are GCC_EMMC_BCR and GCC_VIDEO_AXI0_CLK_ARES missing from
gcc_netrani_resets[]?

Both IDs are defined in include/dt-bindings/clock/qcom,netrani-gcc.h below
GCC_VIDEO_BCR, so their slots in gcc_netrani_resets[] are zero-initialized.
Because qcom_reset_set_assert() does not check for unpopulated entries,
asserting or deasserting either reset writes BIT(0) to register 0x0, which =
is
the mode register for gcc_gpll0, toggling GPLL0 output control instead of
resetting the peripheral.

> +
> +static const struct clk_rcg_dfs_data gcc_dfs_clocks[] =3D {
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s2_clk_src),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s3_clk_src),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s4_clk_src),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk_src),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk_src),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s2_clk_src),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk_src),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk_src),
> +};

[Severity: Medium]
Should gcc_dfs_clocks[] also include gcc_qupv3_wrap0_s5_clk_src and
gcc_qupv3_wrap1_s5_clk_src?

Both SE5 RCGs define standalone mutable struct clk_init_data structs
(gcc_qupv3_wrap0_s5_clk_src_init and gcc_qupv3_wrap1_s5_clk_src_init) for
DEFINE_RCG_DFS(), but omitting them from gcc_dfs_clocks[] means
qcom_cc_register_rcg_dfs() never checks or enables DFS on QUPv3 SE5.

[ ... ]

> +static int gcc_netrani_prepare_required_clocks(struct device *dev,
> +					     struct regmap *regmap)
> +{
> +	static const u32 keep_enabled[] =3D {
> +		0x36004, /* GCC_CAMERA_AHB_CLK */
> +		0x36018, /* GCC_CAMERA_SLEEP_CLK */
> +		0x3601c, /* GCC_CAMERA_XO_CLK */
> +		0x37004, /* GCC_DISP_AHB_CLK */
> +		0x37014, /* GCC_DISP_XO_CLK */
> +		0x81004, /* GCC_GPU_CFG_AHB_CLK */
> +		0x42004, /* GCC_VIDEO_AHB_CLK */
> +		0x42018, /* GCC_VIDEO_XO_CLK */
> +	};
> +	int ret;
> +	unsigned int i;
> +
> +	ret =3D regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg,
> +				 CBCR_FORCE_MEM_CORE_ON, CBCR_FORCE_MEM_CORE_ON);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to retain UFS ICE memory\n");
> +
> +	/* Do not disable already-enabled critical clocks when a later write fa=
ils. */
> +	for (i =3D 0; i < ARRAY_SIZE(keep_enabled); i++) {
> +		ret =3D regmap_update_bits(regmap, keep_enabled[i],
> +					 CBCR_CLOCK_ENABLE, CBCR_CLOCK_ENABLE);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to enable clock at %#x\n",
> +					     keep_enabled[i]);
> +	}

[Severity: Medium]
Won't clk_disable_unused() turn gcc_camera_sleep_clk (0x36018) back off at
late_initcall?

Unlike the other clocks in keep_enabled[], 0x36018 is also registered in
gcc_netrani_clocks[GCC_CAMERA_SLEEP_CLK] with clk_branch2_ops instead of
clk_branch2_aon_ops (and without CLK_IS_CRITICAL), so clk_disable_unused()
will clear CBCR_CLOCK_ENABLE when no consumer holds it enabled.  In additio=
n,
GCC_VIDEO_XO_CLK (139, 0x42018) is the highest ID in the binding header,
above the last entry in gcc_netrani_clocks[] (GCC_VIDEO_THROTTLE_CORE_CLK,
138), so requesting GCC_VIDEO_XO_CLK fails the bounds check in
qcom_cc_clk_hw_get() with -EINVAL instead of returning a NULL dummy clock.

> +
> +	ret =3D regmap_update_bits(regmap, 0x4201c, BIT(21), BIT(21));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to configure video AXI clock\n"=
);
> +
> +	return 0;
> +}

[Severity: Medium]
Should this regmap_update_bits() target 0x4200c (gcc_video_axi0_clk) instead
of 0x4201c?

Offset 0x4201c is gcc_venus_ctl_axi_clk on SM4450, whereas Netrani's video
AXI clock (gcc_video_axi0_clk) is at 0x4200c.

> +
> +static int gcc_netrani_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +	int ret;
> +
> +	regmap =3D qcom_cc_map(pdev, &gcc_netrani_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	ret =3D qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
> +				       ARRAY_SIZE(gcc_dfs_clocks));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D gcc_netrani_prepare_required_clocks(&pdev->dev, regmap);
> +	if (ret)
> +		return ret;
> +
> +	return qcom_cc_really_probe(&pdev->dev, &gcc_netrani_desc, regmap);
> +}
> +
> +static struct platform_driver gcc_netrani_driver =3D {
> +	.probe =3D gcc_netrani_probe,
> +	.driver =3D {
> +		.name =3D "gcc-netrani",
> +		.of_match_table =3D gcc_netrani_match_table,
> +	},
> +};
> +
> +static int __init gcc_netrani_init(void)
> +{
> +	return platform_driver_register(&gcc_netrani_driver);
> +}
> +subsys_initcall(gcc_netrani_init);
> +
> +static void __exit gcc_netrani_exit(void)
> +{
> +	platform_driver_unregister(&gcc_netrani_driver);
> +}
> +module_exit(gcc_netrani_exit);

[Severity: Low]
This isn't a bug, but struct qcom_cc_driver_data (.clk_cbcrs, .dfs_rcgs, and
.clk_regs_configure with qcom_branch_set_force_mem_core()), qcom_cc_probe(),
and subsys_platform_driver() could replace the open-coded probe and init
boilerplate here, matching gcc-sm4450.c.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-netrani-cl=
ock-v1-v1-0-ce10cedbfa4b@krgm.moe?part=3D2
