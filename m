Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365513;
	b=yz+g57Dt5IPPuTcco/1IFS7qgzVmUKpJPErrEDDfAIJfVJ2BNlPrxb+sNiNhL7thMct/
	 XpxhjSId2WzfttUUX1UrWvHUc2kgvdUqlWTrc+fl/IsMKi6j5XjvjfsiTO2EUX+mzN4s3
	 WksTak6F0h9z7aYch9IJnYpP7GCZZxP7+qyt2gFRIBA44s6onh/WTy8HwrZZ8ngbWL6cL
	 4lTcSrp3tbmf/UE5NHOQ9LIBqjx4UreNlkkQem3vJBZ/lvxxGaG10meQMyJJ4nqzEr0eq
	 8o33ORd4cLYCW7KUj5XUBq4/tUSpkNWruCwoPwibmPjPOytrgu/BzFj+W42DVE87j1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365513;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rPKC2iAErhabfICV/5s+IrsgLKScvUzd+OnEnGWWjCs=;
	b=eYKPRfeppgCcH4OCZEzrYWm8zwnnMKq2XnqY7Ilhh4t2shYGnAq4ki9yyM42p/cBdbVh
	 Yirej4PqQCLoxzzhSrHrhfVeDQAstAiHCB/LO8kecSY020rFWWfVrN521VA4ZZvCp4TA9
	 uE92OCOoJM/rn/qnh3mLntsmjKHWx4nMlQ5vfv1p4QymVGeWWaJgcYQP8LNirQPX6rYuP
	 2MajKj6BVOrwiBSTfm2LSGmKF1fk4BTAbaXY5Un1FrQbqtl8ixrm0Qsbu77BzYt9KZSZs
	 /iys1Tfa1Lr/GCWRoNwCnEIwIN5beVg77bumgy8qjnykASWanwjsKTR0QjX/yP59KVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AbiPT3eC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B68606A320;
	Sun, 22 Nov 2026 16:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AbiPT3eC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D561F000C4;
	Sun, 22 Nov 2026 16:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795365513;
	bh=rPKC2iAErhabfICV/5s+IrsgLKScvUzd+OnEnGWWjCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AbiPT3eCd1WfF6BtaL2/M4oClSipv0NP7WY+oag4FKVmtCpoxYHle9MkupUA21Hv4
	 cppJMn2iAG4JypEB+CARm8habHYF+O6FqGZv+WTk/XnP5W4mHpFKfUj0Z5xfTW9Tfq
	 udIN3kHactdzhOrFmB38UcTeAsohP0ciVx9dj328UvKpub65YF8+iHCpLCWdrCVJPd
	 +0gowlJ6a4WpNbITL5eVXoNOgl/iao+BO1zCXZuDxbz/pN0xx3n0hKJ1wp6ev5jVAZ
	 lW2te0PH6Sg6l5wmbz8AyDOfCp/2/deusR/E1ysXR37d0AJQ4CsSFnTEwHXxg4YqpC
	 SwaeETRcsS32Q==
Message-ID: <sashiko-outbox-228112@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] clk: rockchip: rk3506: Register the SAI MCLK
 output gates
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xiangyu Zhu" <1194781887@qq.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <tencent_C39B83AEA61743AAF1CCB394F87DDA05E409@qq.com>
References: <cover.1795363509.git.1194781887@qq.com>
 <tencent_C39B83AEA61743AAF1CCB394F87DDA05E409@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 16:38:32 +0000
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
- [High] clk: rockchip: rk3506: wrong GRF regmap assigned in
  rk3506_clk_init()
- [Medium] clk: rockchip: rk3506: undocumented GRF DT bindings in
  rk3506_clk_init()
--

commit 844c13fa6f3e153943a1988cd51a8f5b1886cb96
Author: Xiangyu Zhu <1194781887@qq.com>

clk: rockchip: rk3506: Register the SAI MCLK output gates

This commit looks up the RK3506 PMU GRF syscon and registers four SAI MCLK
output GRF gate clocks across the PMU and system GRFs.

> diff --git a/drivers/clk/rockchip/clk-rk3506.c b/drivers/clk/rockchip/clk=
-rk3506.c
> index dd59bd60382ef..d3c3452e2e68e 100644
> --- a/drivers/clk/rockchip/clk-rk3506.c
> +++ b/drivers/clk/rockchip/clk-rk3506.c
[ ... ]
> @@ -520,6 +521,8 @@ static struct rockchip_clk_branch rk3506_clk_branches=
[] __initdata =3D {
>  			RK3506_CLKGATE_CON(14), 0, GFLAGS),
>  	GATE(MCLK_OUT_SAI0, "mclk_out_sai0", "mclk_sai0", 0,
>  			RK3506_CLKGATE_CON(14), 1, GFLAGS),
> +	GATE_GRF(MCLK_OUT_SAI0_TO_IO, "mclk_sai0_to_io", "mclk_out_sai0",
> +		 0, 0x4, 8, CLK_GATE_HIWORD_MASK, grf_type_pmu0),
>  	COMPOSITE(MCLK_SAI1, "mclk_sai1", mclk_sai_asrc_parents_p, 0,
>  			RK3506_CLKSEL_CON(41), 8, 4, MFLAGS, 0, 8, DFLAGS,
>  			RK3506_CLKGATE_CON(14), 2, GFLAGS),
> @@ -527,6 +530,8 @@ static struct rockchip_clk_branch rk3506_clk_branches=
[] __initdata =3D {
>  			RK3506_CLKGATE_CON(14), 3, GFLAGS),
>  	GATE(MCLK_OUT_SAI1, "mclk_out_sai1", "mclk_sai1", 0,
>  			RK3506_CLKGATE_CON(14), 4, GFLAGS),
> +	GATE_GRF(MCLK_OUT_SAI1_TO_IO, "mclk_sai1_to_io", "mclk_out_sai1",
> +		 0, 0x4, 9, CLK_GATE_HIWORD_MASK, grf_type_pmu0),
>  	GATE(HCLK_ASRC0, "hclk_asrc0", "hclk_lsperi_root", 0,
>  			RK3506_CLKGATE_CON(14), 5, GFLAGS),
>  	COMPOSITE(CLK_ASRC0, "clk_asrc0", gpll_v0pll_v1pll_g_parents_p, 0,
> @@ -608,6 +613,8 @@ static struct rockchip_clk_branch rk3506_clk_branches=
[] __initdata =3D {
>  			RK3506_CLKGATE_CON(18), 3, GFLAGS),
>  	GATE(MCLK_OUT_SAI2, "mclk_out_sai2", "mclk_sai2", 0,
>  			RK3506_CLKGATE_CON(18), 4, GFLAGS),
> +	GATE_GRF(MCLK_OUT_SAI2_TO_IO, "mclk_sai2_to_io", "mclk_out_sai2",
> +		 0, 0x4, 2, CLK_GATE_HIWORD_MASK, grf_type_sys),
>  	COMPOSITE(MCLK_SAI3_SRC, "mclk_sai3_src", mclk_sai_asrc_parents_p, 0,
>  			RK3506_CLKSEL_CON(52), 8, 4, MFLAGS, 0, 8, DFLAGS,
>  			RK3506_CLKGATE_CON(18), 5, GFLAGS),
> @@ -617,6 +624,8 @@ static struct rockchip_clk_branch rk3506_clk_branches=
[] __initdata =3D {
>  			RK3506_CLKGATE_CON(18), 7, GFLAGS),
>  	GATE(MCLK_OUT_SAI3, "mclk_out_sai3", "mclk_sai3_src", 0,
>  			RK3506_CLKGATE_CON(18), 8, GFLAGS),
> +	GATE_GRF(MCLK_OUT_SAI3_TO_IO, "mclk_sai3_to_io", "mclk_out_sai3",
> +		 0, 0x4, 3, CLK_GATE_HIWORD_MASK, grf_type_sys),
>  	COMPOSITE(MCLK_SAI4_SRC, "mclk_sai4_src", mclk_sai_asrc_parents_p, 0,
>  			RK3506_CLKSEL_CON(53), 8, 4, MFLAGS, 0, 8, DFLAGS,
>  			RK3506_CLKGATE_CON(18), 9, GFLAGS),
> @@ -787,10 +796,20 @@ static void __init rk3506_clk_init(struct device_no=
de *np)
>  	struct rockchip_clk_provider *ctx;
>  	unsigned long clk_nr_clks;
>  	void __iomem *reg_base;
> +	struct regmap *pmu_grf;
> =20
>  	clk_nr_clks =3D rockchip_clk_find_max_clk_id(rk3506_clk_branches,
>  						   ARRAY_SIZE(rk3506_clk_branches)) + 1;
> =20
> +	/*
> +	 * The PMU GRF only carries the SAI0/SAI1 MCLK output gates, so a
> +	 * missing (or not yet probed) syscon must not prevent the CRU itself
> +	 * from being registered.
> +	 */
> +	pmu_grf =3D syscon_regmap_lookup_by_compatible("rockchip,rk3506-grf-pmu=
");
> +	if (IS_ERR(pmu_grf))
> +		pr_warn("%s: could not get PMU GRF syscon\n", __func__);

[Severity: Medium]
Are the GRF DeviceTree bindings used here documented in the RK3506 schemas?

Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml sets
additionalProperties: false and does not define the rockchip,grf phandle
property that rockchip_clk_init_base() uses to populate ctx->grf, so a
conforming DT leaves ctx->grf as ERR_PTR(-ENODEV).  In addition,
"rockchip,rk3506-grf-pmu" is not documented in
Documentation/devicetree/bindings/soc/rockchip/grf.yaml.

> +
>  	reg_base =3D of_iomap(np, 0);
>  	if (!reg_base) {
>  		pr_err("%s: could not map cru region\n", __func__);
> @@ -804,6 +823,10 @@ static void __init rk3506_clk_init(struct device_nod=
e *np)
>  		return;
>  	}
> =20
> +	if (!IS_ERR(pmu_grf) &&
> +	    rockchip_clk_add_grf(ctx, pmu_grf, grf_type_pmu0))
> +		pr_warn("%s: could not add PMU GRF\n", __func__);

[Severity: High]
Does registering only grf_type_pmu0 in ctx->aux_grf_table cause
MCLK_OUT_SAI2_TO_IO and MCLK_OUT_SAI3_TO_IO to bind to pmu_grf instead of
the system GRF?

In rockchip_clk_register_branches(), grf is initialized to ctx->grf once
before the loop and only updated when list->grf_type matches an entry in
ctx->aux_grf_table:

drivers/clk/rockchip/clk.c:rockchip_clk_register_branches() {
    ...
	struct regmap *grf =3D ctx->grf;
    ...
	for (idx =3D 0; idx < nr_clk; idx++, list++) {
		flags =3D list->flags;
		clk =3D NULL;

		/* for GRF-dependent branches, choose the right grf first */
		if (list->branch_type =3D=3D branch_grf_mux ||
		    list->branch_type =3D=3D branch_grf_gate ||
		    list->branch_type =3D=3D branch_grf_mmc) {
			hash_for_each_possible(ctx->aux_grf_table, agrf, node, list->grf_type) {
				if (agrf->type =3D=3D list->grf_type) {
					grf =3D agrf->grf;
					break;
				}
			}
		}
    ...
}

After MCLK_OUT_SAI0_TO_IO and MCLK_OUT_SAI1_TO_IO set grf to pmu_grf, the
later MCLK_OUT_SAI2_TO_IO and MCLK_OUT_SAI3_TO_IO entries find no
grf_type_sys entry in ctx->aux_grf_table and retain pmu_grf, so toggling
SAI2 or SAI3 MCLK output writes to offset 0x4 in the PMU GRF instead of the
system GRF.  Conversely, if the optional pmu_grf lookup or
rockchip_clk_add_grf() fails while ctx->grf is valid, grf_type_pmu0 is abse=
nt
from ctx->aux_grf_table and MCLK_OUT_SAI0_TO_IO and MCLK_OUT_SAI1_TO_IO
silently fall back to ctx->grf (the system GRF).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_93FC4A7191B=
1BAC63C4DE9C2674660AA7905@qq.com?part=3D2
