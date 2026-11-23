Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393596;
	b=aiyLnmtS8sxE0io1P77lmh7WEc/NEKaBSZruJoGc1dR3sXCOItL/brM6solGsjiy8i8n
	 Eh93a+KXXktflIGprb8nJnNRiahwrc91dBQgWmaI3hZt97aic31kJa3SxvjPEicLx/Hfy
	 HLs9CXVdxuhg3tIdxEbNatTNGkt+Dm1DL7iX9YBEcAUOi7ZJGQj6a+Tz54sw/I4Q22I0E
	 sHHkItLSBPdtxr1X1HrmRGfjvBXgrimVUCDchISwPXR1xy2iju50xLaEaPtWDKUDecdkc
	 j13eLKg/hk+7vH2OrKaSenOHa2OLvcBkhe+vDMsP5x1MPONSq0Qb3PlZkTSWkfoWZFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393596;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j9MANKbmxmioiftQzMUVAQNLP8UB9i0QdgFkSk8CpqU=;
	b=RYhQGHZUiLCn96iEvVacM889Yu0AAIXOBc3rV8i0GWqkCcOjYKOkcbBlz6Hw3XrmyItW
	 /eAPE/sAxpSRhq3ZNk8mfP5FjwEGFsz6VuHroLWU12YQIg7/wiezsOydoz3E4D2kiXJL3
	 uBH+oveiKWcFRfAACF3X/Rlaq4V21usmqV5V7KNVqksC2QZNLismWAwp4Mn8LK5dyV2B6
	 ZNPC5mCjHdZ3rFJCeLwZ1RGAzksybcjsYqhfor2fqI1wKjpOAyOaIApdmAB3ioOY3cWvO
	 PbXw6RCz9amw4wb/Vl3Qcv0zMthb5xZKcGHJqECFJ0VN08yb8VUAOt6XbNZuPiX1srA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FoMKlil0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E535606A31D;
	Mon, 23 Nov 2026 00:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FoMKlil0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CAC1F000C6;
	Mon, 23 Nov 2026 00:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795393595;
	bh=j9MANKbmxmioiftQzMUVAQNLP8UB9i0QdgFkSk8CpqU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FoMKlil0TmOgPwT+CUdn6/CLrmgsfDj2NL7QPExmC/ah3HRXHxqYHxei74X9NDz92
	 rGs2d8ToFfd08KnjfzItCC9kYbWWn0nuAKyULmv9VGbxctuCN+lu+dR4yyO5rm7lPN
	 Y+3PhGe4P1Go7PRuvDy5Oe/u4HzGQF4rmT7KZ9N7JXCPEgEmigUnV/Di5SQxm+uJiM
	 tpR6MM+1r505G43IDjEtp19NeD6SV1ntZo+05rEVo1NEUOF1c7Ccmboo+uNdkDBCgu
	 5em8G+pf2uaCu8LaNDPVIALYxmghmuDUy3qTr5hip/Kfx7fNwow+7NkB47F32yBlyC
	 mA9oqbduhZcdg==
Message-ID: <sashiko-outbox-228472@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] clk: rockchip: rk3506: Register the SAI MCLK
 output gates
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xiangyu Zhu" <1194781887@qq.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <tencent_8AD71C4349D2274F40A1B9ED0A78F1AF1A05@qq.com>
References: <cover.1795366993.git.1194781887@qq.com>
 <tencent_8AD71C4349D2274F40A1B9ED0A78F1AF1A05@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 00:26:35 +0000
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
- [Medium] clk: rockchip: rk3506: unconditional grf_type_sys gate
  registration
- [Low] clk: rockchip: rk3506: undocumented PMU GRF compatible in
  rk3506_clk_init()
--

commit d1659ebc394f448c890bbce69298f3c2ffbb7f0f
Author: Xiangyu Zhu <1194781887@qq.com>

clk: rockchip: rk3506: Register the SAI MCLK output gates

This commit registers the four SAI MCLK output GRF gate clocks for the
RK3506 SoC across the system GRF and PMU GRF.

> diff --git a/drivers/clk/rockchip/clk-rk3506.c b/drivers/clk/rockchip/clk=
-rk3506.c
> index dd59bd60382ef..5046a6585d580 100644
> --- a/drivers/clk/rockchip/clk-rk3506.c
> +++ b/drivers/clk/rockchip/clk-rk3506.c
[ ... ]
> @@ -608,6 +609,8 @@ static struct rockchip_clk_branch rk3506_clk_branches=
[] __initdata =3D {
>  			RK3506_CLKGATE_CON(18), 3, GFLAGS),
>  	GATE(MCLK_OUT_SAI2, "mclk_out_sai2", "mclk_sai2", 0,
>  			RK3506_CLKGATE_CON(18), 4, GFLAGS),
> +	GATE_GRF(MCLK_OUT_SAI2_TO_IO, "mclk_sai2_to_io", "mclk_out_sai2",
> +		 0, 0x4, 2, CLK_GATE_HIWORD_MASK, grf_type_sys),
>  	COMPOSITE(MCLK_SAI3_SRC, "mclk_sai3_src", mclk_sai_asrc_parents_p, 0,
>  			RK3506_CLKSEL_CON(52), 8, 4, MFLAGS, 0, 8, DFLAGS,
>  			RK3506_CLKGATE_CON(18), 5, GFLAGS),
> @@ -617,6 +620,8 @@ static struct rockchip_clk_branch rk3506_clk_branches=
[] __initdata =3D {
>  			RK3506_CLKGATE_CON(18), 7, GFLAGS),
>  	GATE(MCLK_OUT_SAI3, "mclk_out_sai3", "mclk_sai3_src", 0,
>  			RK3506_CLKGATE_CON(18), 8, GFLAGS),
> +	GATE_GRF(MCLK_OUT_SAI3_TO_IO, "mclk_sai3_to_io", "mclk_out_sai3",
> +		 0, 0x4, 3, CLK_GATE_HIWORD_MASK, grf_type_sys),

[Severity: Medium]
Will registering MCLK_OUT_SAI2_TO_IO and MCLK_OUT_SAI3_TO_IO
unconditionally in rk3506_clk_branches fail when the CRU node does not
have a rockchip,grf phandle?

rockchip_clk_init_base() populates ctx->grf from the CRU node's
rockchip,grf property, which is not defined in
Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
(additionalProperties: false).  When rockchip,grf is absent, ctx->grf is
ERR_PTR(-ENODEV), causing rockchip_clk_register_gate_grf() to log an
error and fail with -EOPNOTSUPP at boot.

If these gates are moved to a separate conditional branch table (or if
system GRF is looked up and added via rockchip_clk_add_grf()), note that
clk_nr_clks in rk3506_clk_init() is currently computed only from
rk3506_clk_branches and would also need to account for the IDs in the
auxiliary GRF branch tables.

>  	COMPOSITE(MCLK_SAI4_SRC, "mclk_sai4_src", mclk_sai_asrc_parents_p, 0,
>  			RK3506_CLKSEL_CON(53), 8, 4, MFLAGS, 0, 8, DFLAGS,
>  			RK3506_CLKGATE_CON(18), 9, GFLAGS),
> @@ -782,11 +787,20 @@ static struct rockchip_clk_branch rk3506_clk_branch=
es[] __initdata =3D {
>  			RK3506_CLKGATE_CON(20), 0, GFLAGS),
>  };
> =20
> +static struct rockchip_clk_branch rk3506_clk_pmu_grf_branches[] __initda=
ta =3D {
> +	GATE_GRF(MCLK_OUT_SAI0_TO_IO, "mclk_sai0_to_io", "mclk_out_sai0",
> +		 0, 0x4, 8, CLK_GATE_HIWORD_MASK, grf_type_pmu0),
> +	GATE_GRF(MCLK_OUT_SAI1_TO_IO, "mclk_sai1_to_io", "mclk_out_sai1",
> +		 0, 0x4, 9, CLK_GATE_HIWORD_MASK, grf_type_pmu0),
> +};
> +
>  static void __init rk3506_clk_init(struct device_node *np)
>  {
>  	struct rockchip_clk_provider *ctx;
>  	unsigned long clk_nr_clks;
>  	void __iomem *reg_base;
> +	struct regmap *pmu_grf;
> +	bool have_pmu_grf =3D false;
> =20
>  	clk_nr_clks =3D rockchip_clk_find_max_clk_id(rk3506_clk_branches,
>  						   ARRAY_SIZE(rk3506_clk_branches)) + 1;
> @@ -804,6 +818,15 @@ static void __init rk3506_clk_init(struct device_nod=
e *np)
>  		return;
>  	}
> =20
> +	pmu_grf =3D syscon_regmap_lookup_by_compatible("rockchip,rk3506-grf-pmu=
");

[Severity: Low]
Is "rockchip,rk3506-grf-pmu" the intended compatible string here?  It is
not documented in Documentation/devicetree/bindings/soc/rockchip/grf.yaml,
where other Rockchip PMU GRF bindings use the "rockchip,<soc>-pmu-grf"
(or "-pmu0-grf" / "-pmugrf") naming convention.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_362F86565B9=
82729D9FAF4092C36DF5C0D0A@qq.com?part=3D2
