Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460275;
	b=4ebOgmO14KGbs5kqBIcqjShWqpMjUkn+sXTjLu3uQ/qess81v8EbfsbUW2ih6peHUHrM
	 U1kJAm7x49w3jA6u3bUy1FeYgixiRLCC/wBDd4SNOI6EXk12A8CuquNAOD+ZsOct3FsQ+
	 ZPPZ1IzcjlLqZ5pPQxTfEl5AK/SXqnatVdhugOsaxM57vqXos9kJfW4+n3gBFQfkWn2tz
	 GECpaxmF7J7r4YuSqThWD+bm9OUf5bTtAxEwTRLl87elPU82PnSVzYHgjkOp9VQIhTq5O
	 K4wctqcr9AS2bWTvGaP9z1khgJp70cOSZentcaCGywtqhZvd14nRndjq6wLjD8DhA8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460275;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kSfjBnZBWfZq7XeQ/GDzjNOUZXZqg1ZujX6SW66Y9TM=;
	b=4DKiY0R1umsFhdwj1w1U2+rcDO2buYeekdx5fQLO5x4mB9sffUuEse9O3RLv2wKOWA+F
	 Y65150pNHpdmpewewc3DHArcOQ8dp7jwOxv3ZoPU0C0msEgwhYCrWkmE2JsEEFQP+xj3W
	 KxhryenA0CJ9PIc8pcYuyBNmLL79DuhGLCD4iGajlnTDEu1CGG6s/r4LTxZCGrxBidFDo
	 Hk8+cHdnbhV+yZn9heTlYngvRG5iCPgKU5+W3D0jT4JMOro+Yf4BKAh2Nm2PCLokVHWR6
	 Bb3rn61+6vVt/+5rV8p595/0k+sRdv7GAmCV2d9yd7c286JaIatOjhgOLvDIfYws1pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oc54pgyh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2596A606A321;
	Mon, 23 Nov 2026 18:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oc54pgyh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1501F000CF;
	Mon, 23 Nov 2026 18:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795460274;
	bh=kSfjBnZBWfZq7XeQ/GDzjNOUZXZqg1ZujX6SW66Y9TM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oc54pgyhN8UhE8Elvu4rABHWgXRqhAaWcPaEg5JFonh1d0Vk9n+W3FNQ88QJZkTn+
	 mqvpWw2RO5ESphd9XXcZBeaFLZYDBjxXw9uZk9O2G9o/GMJr/UBGo7Wvly9V1mIfr0
	 FpKzAYgWkKFec5JOKSwLERveHsxUSz5T9yX0TxHo+1ZCsynFu966KO5kgxHX3i4ACy
	 AW6ql9c7HLz542uwdJmnweRJ81Q4OzfWi2WcuQlR28tuWXAPYlllw95ysJMhrQF9HO
	 SRavGiCdYwvchdc4hTgIIb5IubEPjlZ6JP4E3YaG9OZEkNHwCQjnlLeFkTgcsOu0vR
	 96jTNxA93Z50g==
Message-ID: <sashiko-outbox-229891@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: gcc-glymur: Convert USB4 clocks to use
 phymux ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-topic-usb4_clks-v1-4-531ab5635c03@oss.qualcomm.com>
References: <20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com>
 <20261123-topic-usb4_clks-v1-4-531ab5635c03@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 18:57:54 +0000
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
- [High] clk: qcom: gcc-glymur: USB4 PHY RX branch clocks poll halt with
  phymux parent
- [Medium] clk: qcom: gcc-glymur:
  gcc_usb4_{0,1,2}_phy_p2rr2p_pipe_clk_src not converted
--

commit b685bd7088c460b8ed23d2168b56f940cdb682c3
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

clk: qcom: gcc-glymur: Convert USB4 clocks to use phymux ops

This commit converts gcc_usb4_{0,1,2}_phy_rx{0,1}_clk_src from
clk_regmap_mux with clk_regmap_mux_closest_ops to clk_regmap_phy_mux with
clk_regmap_phy_mux_ops.

> diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
> index 96d1c07348bcb..186c779e30846 100644
> --- a/drivers/clk/qcom/gcc-glymur.c
> +++ b/drivers/clk/qcom/gcc-glymur.c
[ ... ]
> @@ -1099,32 +1033,30 @@ static struct clk_regmap_mux gcc_usb4_0_phy_pcie_=
pipe_mux_clk_src =3D {
>  	},
>  };
> =20
> -static struct clk_regmap_mux gcc_usb4_0_phy_rx0_clk_src =3D {
> +static struct clk_regmap_phy_mux gcc_usb4_0_phy_rx0_clk_src =3D {
>  	.reg =3D 0x2b0c0,
> -	.shift =3D 0,
> -	.width =3D 2,
> -	.parent_map =3D gcc_parent_map_34,
>  	.clkr =3D {
>  		.hw.init =3D &(const struct clk_init_data) {
>  			.name =3D "gcc_usb4_0_phy_rx0_clk_src",
> -			.parent_data =3D gcc_parent_data_34,
> -			.num_parents =3D ARRAY_SIZE(gcc_parent_data_34),
> -			.ops =3D &clk_regmap_mux_closest_ops,
> +			.parent_data =3D &(const struct clk_parent_data){
> +				.index =3D DT_QUSB4PHY_0_GCC_USB4_RX0_CLK,
> +			},
> +			.num_parents =3D 1,
> +			.ops =3D &clk_regmap_phy_mux_ops,
>  		},
>  	},
>  };

[Severity: High]
Should the child branches gcc_usb4_{0,1,2}_phy_rx{0,1}_clk use
BRANCH_HALT_SKIP instead of BRANCH_HALT now that their parents use
clk_regmap_phy_mux_ops?

With clk_regmap_phy_mux_ops, phy_mux_enable() switches the parent mux from
BI_TCXO to the external PHY RX clock before enabling the child branch, and
clk_branch2_disable() disables the child branch before phy_mux_disable()
parks the mux back on BI_TCXO.  If the PHY is not actively driving the RX
clock when the branch is toggled, clk_branch_wait() will time out polling
CBCR_CLK_OFF, trigger a WARN, and fail with -EBUSY.

[Severity: Medium]
Should gcc_usb4_{0,1,2}_phy_p2rr2p_pipe_clk_src also be converted to
clk_regmap_phy_mux with clk_regmap_phy_mux_ops (as in
drivers/clk/qcom/gcc-x1e80100.c)?

Those three muxes have the same 2-bit phymux layout switching between
P_USB4_{0,1,2}_PHY_GCC_USB4_PCIE_PIPE_CLK (0) and P_BI_TCXO (2).  Because
qmp_combo_usb4_init() and qmp_combo_usb4_exit() only call
clk_prepare_enable() and clk_disable_unprepare() on qmp->p2rr2p_pipe_clk
without calling clk_set_parent(), leaving them on
clk_regmap_mux_closest_ops prevents the mux from switching between the PHY
pipe clock and BI_TCXO.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-topic-usb4=
_clks-v1-0-531ab5635c03@oss.qualcomm.com?part=3D4
