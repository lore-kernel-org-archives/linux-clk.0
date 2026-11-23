Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394982;
	b=cEw+z7XmHcsGP09qWo4pL310TUeN5DdBI8zZc6yhavi4wz07ZCQx5Gd+/PKM+HYiUSuj
	 oKbtM3Waqh8jmpgsQr0if4l3TXeWuCYXbsTgrep5xpBHNs4OQA7JPCt2jsdhK+tDDMRBk
	 dZ6SwwqmJ+ILPCyrNQc/lGFAKkVOdDKQpxBBjldjadhNlhPvHs2Hg/2RXGYWMxc3PxJg4
	 Srcatm/2smFdEpX4pEJbQTVBOFZVjna+tVAUdMMV7NAq8biidaW1R2C6lufngYqSC5wTl
	 JJ2G6Su9K0lP22PyktKUfyYlHDOrz+h0HYRU5fTX8O8niezP7hViMO/3VG1nZms5q8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394982;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dBNSkOvXBZR3CJPdDxhio9zzIZk3YmEPw+7Nrxa4TV0=;
	b=y5gbbkIkI2mx3pFN6UW3rpokBXsWs+RNXZ3ibu4XOSQwMDjzlc0Y+EVZ9qTg3Vtumvcn
	 /V5puGLcZt53H/1OzwjB1Ka4/g5OnDIJiMGaSbixpGacGQ0S20h0KH1qkn0Boh8I+4DFy
	 pBLJKX6v4uKx/2bV06TILnGulcZhNPO33JTX3p6CRYHkUxkp//Z7YgzAmPAlxsTvdud7h
	 dKZLXhBAyeUt34j9XSSZSSSkautyFMM2caafWYfnilJ7Ob2BSdOlIbJasj/xLmTgiu0rh
	 mV7dseEkVpYbFg1QZeXKi3DOFpqiX4sQxt91a+IqGxKB9xOINbdsZq3RmOlv6ryl1Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lxVsU9NT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B624C606A31E;
	Mon, 23 Nov 2026 00:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lxVsU9NT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118381F000C6;
	Mon, 23 Nov 2026 00:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795394982;
	bh=dBNSkOvXBZR3CJPdDxhio9zzIZk3YmEPw+7Nrxa4TV0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lxVsU9NTVqhAJXB7sKU3Wyu5gvbntVlcQ/xlCt8WjtvExMXALM0L/XL2wIwJ34gsA
	 zu4SjMwB4UfwOjxpqFk2pwf+6ex+wMGxMfZkSZv8NCCAO9EiLLL0wG9kQwFOi4dNFt
	 eRbKtdhXowY0wsZTjgwWix5KPn8WdrWKboSNoMiWaRgq3Hh0VADvn0ftj6ikcRt5ye
	 lij2bvBlsg0UFO6YQxT5oYAKVGl6jxO9IoAoqABQUXGS2mENPz2cll2Z78FMru56nL
	 KLpTzFe/Z94rkWZpvBiT/QB4FCmxo7xbbtvEhZyWVGvYIVgutgvxSK6jLzYWnlHzTG
	 Gz0H78iBE8aLQ==
Message-ID: <sashiko-outbox-228491@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] clk: rockchip: rk3506: Register the SAI MCLK
 output gates
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xiangyu Zhu" <1194781887@qq.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <tencent_4C9312830F80807EB3C015E9A2653587B906@qq.com>
References: <cover.1795394137.git.1194781887@qq.com>
 <tencent_4C9312830F80807EB3C015E9A2653587B906@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 00:49:41 +0000
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
- [Medium] clk: rockchip: rk3506: missing system GRF lookup in
  rk3506_clk_init()
--

commit a7ec6ea6b886d5202ab753e0b478970ccba36fb0
Author: Xiangyu Zhu <1194781887@qq.com>

clk: rockchip: rk3506: Register the SAI MCLK output gates

This commit registers the four RK3506 SAI MCLK output gates in the system
and PMU GRFs, looking up the PMU GRF syscon by compatible and registering
the SAI0 and SAI1 gates when it is present.

> diff --git a/drivers/clk/rockchip/clk-rk3506.c b/drivers/clk/rockchip/clk=
-rk3506.c
> index dd59bd60382ef..956d5e9238b9c 100644
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
>  	COMPOSITE(MCLK_SAI4_SRC, "mclk_sai4_src", mclk_sai_asrc_parents_p, 0,
>  			RK3506_CLKSEL_CON(53), 8, 4, MFLAGS, 0, 8, DFLAGS,
>  			RK3506_CLKGATE_CON(18), 9, GFLAGS),
[ ... ]
> @@ -804,6 +818,15 @@ static void __init rk3506_clk_init(struct device_nod=
e *np)
>  		return;
>  	}
> =20
> +	pmu_grf =3D syscon_regmap_lookup_by_compatible("rockchip,rk3506-pmu-grf=
");
> +	if (IS_ERR(pmu_grf)) {
> +		pr_warn("%s: could not get PMU GRF syscon\n", __func__);
> +	} else if (rockchip_clk_add_grf(ctx, pmu_grf, grf_type_pmu0)) {
> +		pr_warn("%s: could not add PMU GRF\n", __func__);
> +	} else {
> +		have_pmu_grf =3D true;
> +	}
> +

[Severity: Medium]
Does registering MCLK_OUT_SAI2_TO_IO and MCLK_OUT_SAI3_TO_IO fail with
-EOPNOTSUPP on a binding-compliant device tree?

The commit message notes that the CRU already has the system GRF via its
"rockchip,grf" phandle, which rockchip_clk_init_base() uses to populate
ctx->grf.  However,
Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml does not
define "rockchip,grf" and sets "additionalProperties: false", so ctx->grf
is ERR_PTR(-ENODEV).  Because rk3506_clk_init() does not look up
"rockchip,rk3506-grf" or register grf_type_sys via rockchip_clk_add_grf(),
rockchip_clk_register_branches() falls back to ctx->grf and
rockchip_clk_register_gate_grf() fails for both SAI2 and SAI3 gates.

Should rk3506_clk_init() also look up "rockchip,rk3506-grf" by compatible
and register grf_type_sys (and if the SAI2/SAI3 gates are moved to a
separate conditional branch table, include that table when computing
clk_nr_clks since MCLK_OUT_SAI3_TO_IO has the highest clock ID)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_452BA245FE6=
A7C7308A5121F5281E9E6A807@qq.com?part=3D3
