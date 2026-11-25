Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612582;
	b=RK6R89Xn5jV6QkVNwSSvvayzPNNCujz6WmSws87qZ5JSt2rETBTO48Rv7a6Yxcyd5RJA
	 fIt9A4MzrxpTUiDU/Jw2UnBQS4mEn2JtJHEvSXnYyXOKfEiQ/uMtrEUqGaLGhKtkKeeH5
	 u0fzMrpn+wUXrQEVmckA5sM/OWirZnkc32ox0yikZX0Fk4RFWsG4Js56VaNML/0EZKc1U
	 AAE9+SUyvjvAHiu0XgVwOGuZJKzCRJniR0R2YhmdCHaGcAnE//myJGZnM72VPRf7kLCYZ
	 dEjDOZmRh4Oij9qOa2eGGtjL/ojpORSQLWFGKJnCJ4hBzohqkXhBI4LjhhDvJHm8cLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612582;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OwnuwFo7LbrdY2thjBeupKTPsMyvEa9mZU7slAlTgjM=;
	b=SKtxVexI04zemJ0Doa8hwFpUf8YK0r3n5mMTAoEg+A3w9YpdbIu38Rs9SyNqFR+Z64cu
	 GNNliW+jAHOvwk3yCKYCWTyEUhlFbNo0bQQIAy9bvpkOZpCHBacNsfbcL0tJhtleghCWp
	 dd07zLPQstfgy8bdaPBTGj2UXzjc4MeAxp8d5bt6NCi4PnyZHoKUiUb/wapbHc72nVDXx
	 MV2nHzxGtVsynb0MFHWeq7ewaSsWKxHJsy9fyG09EuyHNAoLTiljTwip4XnJnkz3VZ/78
	 NvNuCx7QBBT+31slQ34GE0Vx45ii6Cm9rbCRxPM+Al6n/fvT5nQ1ifZYjUHGzeQU9pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BoFNLh4a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F14606A31E;
	Wed, 25 Nov 2026 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BoFNLh4a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A779E1F000C4;
	Wed, 25 Nov 2026 13:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795612581;
	bh=OwnuwFo7LbrdY2thjBeupKTPsMyvEa9mZU7slAlTgjM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BoFNLh4aI/eezZO6WvWUcbHP877BQ57bJVU/Uipu2K4g2cOyIDyYjoxyDx5HDtOn+
	 8MZ79jlccKuWMcyEWXgjFHlLR81h7MPaRpNSQwj+BW1iiSxI6lKGEYtWrmqo1jrZb+
	 Q3QkuCkYnZxuNCEKuHAiBkQtMU00kWZco2FK/6urHhxnzlffX8Hc95OsyaxUvrGZ1+
	 p4qnH114SQ/uP+/liMqjPmQVUp84cmGdm3+BBYSfm+wJK+ebFHYGLdIBT5oGvUIp8e
	 Fw50ZBNs67sY0zFlY0w34XVVKnjwhjWs/9DAJ7Q6Y53fuiSRPbNKq7u/VrPFXfPJ8z
	 iah7U0AhlkrEg==
Message-ID: <sashiko-outbox-233476@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] clk: qcom: Add the Netrani global clock
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-netrani-clock-v3-v3-2-9b19d320f422@krgm.moe>
References: <20261125-netrani-clock-v3-v3-0-9b19d320f422@krgm.moe>
 <20261125-netrani-clock-v3-v3-2-9b19d320f422@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:16:21 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] clk: qcom: gcc-netrani: inconsistent QUPv3 SE5 div and QSPI0
  offsets
--

commit b262655da83f0e19b2cd700f2ff0d1064e955f7c
Author: SignKirigami <prcups@krgm.moe>

clk: qcom: Add the Netrani global clock controller

This commit adds the global clock controller driver for Qualcomm Netrani,
including clock topology, reset controls, QUPv3 DFS roots, and PCIe, USB,
and UFS GDSCs.

> diff --git a/drivers/clk/qcom/gcc-netrani.c b/drivers/clk/qcom/gcc-netran=
i.c
> new file mode 100644
> index 0000000000000..a2b09b88adb53
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-netrani.c
> @@ -0,0 +1,2726 @@

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
> +
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
> +	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s5_clk_src,
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
> +
> +static struct clk_branch gcc_qupv3_wrap1_s5_clk =3D {
> +	.halt_reg =3D 0x28610,
> +	.halt_check =3D BRANCH_HALT_VOTED,
> +	.clkr =3D {
> +		.enable_reg =3D 0x62008,
> +		.enable_mask =3D BIT(27),
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gcc_qupv3_wrap1_s5_clk",
> +			.parent_hws =3D (const struct clk_hw*[]) {
> +				&gcc_qupv3_wrap1_s5_div_clk_src.clkr.hw,
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT,
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};
> +
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
Are the register offsets for the SE5 divider and QSPI0 branch clock
consistent between QUPv3 wrapper 0 and wrapper 1?

Every other register across wrapper 0 (base 0x27000) and wrapper 1 (base
0x28000) uses identical relative offsets, including the SE5 RCG at +0x618.
After that 0x12c-byte DFS RCG block, wrapper 0 places
gcc_qupv3_wrap0_qspi0_clk.halt_reg at +0x744 (0x27744) and
gcc_qupv3_wrap0_s5_div_clk_src.reg at +0x74c (0x2774c), whereas wrapper 1
places gcc_qupv3_wrap1_s5_div_clk_src.reg at +0x744 (0x28744) and
gcc_qupv3_wrap1_qspi0_clk.halt_reg at +0x748 (0x28748).

If the two wrappers share the same register layout (typically QSPI0 CBCR
at +0x744 and SE5 CDIVR at +0x748), reading the wrong register will cause
clk_regmap_div_ro_ops to miscalculate the SE5 clock rate and
clk_branch2_ops to poll the divider register for QSPI0 branch halt status.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-netrani-cl=
ock-v3-v3-0-9b19d320f422@krgm.moe?part=3D2
