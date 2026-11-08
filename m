Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794161239;
	b=KelDo54zT25bGxsmLpkDGt2tdKSVMhBJxDN8myGSodNTJ1GBpswGVgRXaicbcCOnd2X9
	 OQhqfG0Wm0RMiQOR97TvLoau9EM2yEPX4lCVZf5yk8RwJXeeygUphwK/lgy5po/5r/hRh
	 6YgRLG9W1Pf3twRD4+zIKWwNjEHN9HXB3lAssdzUZbkzvXc/5vjXuNmUVDMMUVJw+YSCh
	 PLa0O0jknEFOvg9TGqY87kiuHpdKLsCBBfrW0U83aKOFafWR2198+MeIQOobKi3tXEQNv
	 7Tr+OHgu3T9cb7JEPT9lMTdkWAEfe6pWYjdh3/y8Mco9s4JGriexUe5ogkM4vBKCTZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161239;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HxfvaLA8cIY3Y2v91Caf1CvLUDTO2eAy8BOKMcGFWJA=;
	b=eZYx4OrN6zRYwQAO2GRiZucOIYJTMgu39PuN8qxNJ9Qd5/MDEDnztP4s0XnLKTlNhIS+
	 yXcs2XfefXX6JIPhRYKg+mEBztektNJdNduwiPZRH+0qg2wilZQhc/yFQ1yiI7Mi0fg+0
	 C2u6Pqdru0DjAPxXmKmY1F0qLZnUQOf/BLM4C2a1QG3vU4Jrj6k2Uf5pEIkL8w3pTfG/3
	 tFRPzl3/uNzKCUvI1S3TreUX9CZk/uk76BEmyCfMu0flfcu8V7hb2MuEOEiKbqtsFgGzL
	 /RjR48lnMEhba1n5OIjfLDJzX43OLT9Ir2GsfSy5pmiRcyto+e0Px7tgO9xXRL2Gsuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lr52LkXB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00782606A31C;
	Sun,  8 Nov 2026 18:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lr52LkXB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967221F0089F;
	Sun,  8 Nov 2026 18:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794161238;
	bh=HxfvaLA8cIY3Y2v91Caf1CvLUDTO2eAy8BOKMcGFWJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lr52LkXBQjd07p503ZMWIY6H63zFhwEnu2bTkmiIfJwPBX8MT+OQaiUDmeIia6byD
	 +L9iPPpJjVjrACTumZY3Gh8Lvi+pF+b6RHjnP30Uk1k6CtnafNXlOn7oTqyDXCy9SV
	 V70I00zOtDpA8sljfpJvczt5M+O6WELX3aZ6Z40G8Y32NQF7Kvz2z+QbVgiWxYFhry
	 9nrtziiDkeOE7tn++lFmaaMhiLNTDcoATlEzphIKuOE2v6sXgvWFhC2ME0UxSq3bjz
	 Kaj6XrZJyPsVRXpYh6cjWtzkHiaj8OW9Qbb1aBLBVLOyZ602OXj8ovWtyuI+XwJGQw
	 +8PBhrhIhVmxg==
Message-ID: <sashiko-outbox-203896@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107-gcc_i2c_tsc_support-v1-2-433d02972d7e@oss.qualcomm.com>
References: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
 <20261107-gcc_i2c_tsc_support-v1-2-433d02972d7e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 18:07:18 +0000
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
- [Medium] clk: qcom: segcc-nord: erroneous DFS registration of
  se_gcc_cnoc_i2c_slave_clk_src
- [Low] clk: qcom: segcc-nord: duplicate 19.2 MHz freq_tbl and misplaced
  RCG definition
--

commit 5e0b8aed90909a3578c24b44cabdb5fafa31fe1c
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: segcc-nord: Add I2C and TSC clock support

This commit adds the I2C slave and TSC subsystem clocks, reset lines, and
GPLL1 parent PLL definitions to the Nord SE GCC driver.

> diff --git a/drivers/clk/qcom/segcc-nord.c b/drivers/clk/qcom/segcc-nord.c
> index ef97da3852e35..7fdfa44fb1036 100644
> --- a/drivers/clk/qcom/segcc-nord.c
> +++ b/drivers/clk/qcom/segcc-nord.c
[ ... ]
> @@ -189,6 +207,43 @@ static const struct clk_parent_data se_gcc_parent_da=
ta_4[] =3D {
>  	{ .index =3D DT_SLEEP_CLK },
>  };
> =20
> +static const struct freq_tbl ftbl_se_gcc_cnoc_i2c_slave_clk_src[] =3D {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_init_data se_gcc_cnoc_i2c_slave_clk_src_init =3D {
> +	.name =3D "se_gcc_cnoc_i2c_slave_clk_src",
> +	.parent_data =3D se_gcc_parent_data_2,
> +	.num_parents =3D ARRAY_SIZE(se_gcc_parent_data_2),
> +	.flags =3D CLK_SET_RATE_PARENT,
> +	.ops =3D &clk_rcg2_shared_no_init_park_ops,
> +};
> +
> +static struct clk_rcg2 se_gcc_cnoc_i2c_slave_clk_src =3D {
> +	.cmd_rcgr =3D 0x13034,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D se_gcc_parent_map_2,
> +	.freq_tbl =3D ftbl_se_gcc_cnoc_i2c_slave_clk_src,
> +	.hw_clk_ctrl =3D true,
> +	.clkr.hw.init =3D &se_gcc_cnoc_i2c_slave_clk_src_init,
> +};
> +
> +static const struct parent_map se_gcc_parent_map_5[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_SE_GCC_GPLL0_OUT_MAIN, 1 },
> +	{ P_SE_GCC_GPLL5_OUT_MAIN, 3 },
> +	{ P_SE_GCC_GPLL1_OUT_MAIN, 4 },
> +};
> +
> +static const struct clk_parent_data se_gcc_parent_data_5[] =3D {
> +	{ .index =3D DT_BI_TCXO },
> +	{ .hw =3D &se_gcc_gpll0.clkr.hw },
> +	{ .hw =3D &se_gcc_gpll5.clkr.hw },
> +	{ .hw =3D &se_gcc_gpll1.clkr.hw },
> +};

[Severity: Low]
This isn't a bug, but ftbl_se_gcc_cnoc_i2c_slave_clk_src is identical to
ftbl_se_gcc_emac0_phy_aux_clk_src, which se_gcc_emac1_phy_aux_clk_src and
se_gcc_i2c_slave_xo_clk_src already reuse.  Could
se_gcc_cnoc_i2c_slave_clk_src reuse ftbl_se_gcc_emac0_phy_aux_clk_src and
be placed with the other RCG definitions after the parent map tables?

[ ... ]

> @@ -1570,11 +1754,14 @@ static const struct qcom_reset_map se_gcc_nord_re=
sets[] =3D {
>  	[SE_GCC_EMAC0_BCR] =3D { 0x24000 },
>  	[SE_GCC_EMAC1_BCR] =3D { 0x25000 },
> +	[SE_GCC_I2C_BCR] =3D { 0x2c000 },
>  	[SE_GCC_QUPV3_WRAPPER_0_BCR] =3D { 0x26000 },
>  	[SE_GCC_QUPV3_WRAPPER_1_BCR] =3D { 0x27000 },
> +	[SE_GCC_TSCSS_BCR] =3D { 0x2a000 },
>  };
> =20
>  static const struct clk_rcg_dfs_data se_gcc_nord_dfs_clocks[] =3D {
> +	DEFINE_RCG_DFS(se_gcc_cnoc_i2c_slave_clk_src),
>  	DEFINE_RCG_DFS(se_gcc_qupv3_wrap0_s0_clk_src),
>  	DEFINE_RCG_DFS(se_gcc_qupv3_wrap0_s1_clk_src),
>  	DEFINE_RCG_DFS(se_gcc_qupv3_wrap0_s2_clk_src),

[Severity: Medium]
Should se_gcc_cnoc_i2c_slave_clk_src be registered in
se_gcc_nord_dfs_clocks?

se_gcc_cnoc_i2c_slave_clk_src is a fixed-19.2 MHz CNOC RCG with
mnd_width =3D 0, not a QUPv3 GENI Serial Engine RCG.  Passing it to
qcom_cc_register_rcg_dfs() -> clk_rcg2_enable_dfs() reads cmd_rcgr +
SE_CMD_DFSR_OFFSET (0x13048), which is outside its 8-byte RCG register
block.

If bit 0 at 0x13048 happens to be set, clk_rcg2_enable_dfs() replaces the
clock's ops with clk_rcg2_dfs_ops (dropping the enable, disable, and
set_rate callbacks needed by se_gcc_i2c_slave_ahb_clk) and clears
freq_tbl.  Any subsequent rate calculation when CFG_MODE_MASK is non-zero
in the registers read as DFS performance levels will compute mask =3D
BIT(rcg->mnd_width) - 1 =3D 0, leaving m =3D 0 and n =3D 0 and triggering a
divide-by-zero in calc_rate().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-gcc_i2c_ts=
c_support-v1-0-433d02972d7e@oss.qualcomm.com?part=3D2
