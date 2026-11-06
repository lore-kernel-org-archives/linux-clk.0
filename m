Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955080;
	b=wUWjFani3cLXoGfdKIYqAkIMcVJD6/15ey+X3HDwIP5smwSezPTaw0Ad6bU08UP7i3vP
	 qTmNmTVlL2sn/4yG5eNp6Ea1rkkTNfziegbbAH4RANnlyO7vR8ExcY0l7wsYCQgw09DGl
	 ogAjWQIqDys4tPcypb2Gb97A6GPK2KLahgc1oDMfI5tx3zGug4dkRwGYy5F0DXJhEBOa9
	 RD+667TdRw799Vsz7s6xT+fIKKmlD/e14oJfr4kBH6hrTxJd5SKkTTlyD0wdhTuD1XBqK
	 XpkQUSW7xWo/UTuZTCIBTtGQ8mtQujeB1ZWw8AOYKWrdZLKCtv1vSEuE8uYi/93RCKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955080;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZPrMxi71NV9gjGGF2lBGP+8nq9DMZ0NgKsrzGDmzMVo=;
	b=3m8lQ1FVHveoRo5ygfItiUmZJd16aTQhcrUOBVPfy6sqL22l+nFBBiQAuhYruJB8QX4P
	 +oo3djCtOvF8D8fb6/lp7wSjqFxn//rhP/mPXKBeOM4s2cIdbX3KDHhxSU8Ccb38cnzoh
	 FWBkPtm9TmDN0wYlt0s7Gm9LvXicRnVmhSZE68ZL6BE4lrQ0+g7RqW1PhI8m7Azbd4QBw
	 upYB9OGSUkb4swpdJp0VLIPUCX/GatcLUzKW5gx7gFC/aBD4eYP9GLTSw+gwrJX50xwsz
	 qkcMoZq/ITWJ9pYcX+TqjAr2zcUPT39OZkIjuPQTT3R/uL5uZf4TiX3t7qsDkjDwNMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfsoaVgX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7648A606A329;
	Fri,  6 Nov 2026 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfsoaVgX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004E11F0089F;
	Fri,  6 Nov 2026 08:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793955080;
	bh=ZPrMxi71NV9gjGGF2lBGP+8nq9DMZ0NgKsrzGDmzMVo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lfsoaVgXm+zjdv8bk+icyZunADPHDj9zgn/y/eBZBkqG+CbludKkCD+kbdiKfzkWJ
	 thHjsfR3WXEJgAmps0KhQ6k8u8ldnwkLWaI/A3kd0JFldwVXiPA+6JmZhSgvker/82
	 j9/Wg0sC5xMLnvUyuX0hkNACLlei75o8lBXylWo073UCwqPMV9Hwo7VgNXyeeTsjxU
	 WqHufSzNdv09ALHlSGt0ZUG/hxKOMJybt78MxZpZddj7hlKi3YEjihxl/u6AXcI858
	 gXaVm8+7PBRsQfD1DpmnmxZbzBE/e18R7qJnc1ba9MqGub/MK200ChaKO6lOL07MhQ
	 Ua2JxCqWZsjGA==
Message-ID: <sashiko-outbox-201090@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] clk: amlogic: Add S7 PLL clock controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Carlo Caione" <ccaione@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106-upstream-s7-clk-v1-5-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-5-7d501d62621f@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:51:19 +0000
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
- [Medium] clk: meson: s7-pll: HDMIPLL_CTRL1 initialized after
  s7_hdmi_pll_div0p5 rate
--

commit 6a51c26cbe37d4a7e3b2407e903405378e1e348b
Author: Carlo Caione <ccaione@baylibre.com>

clk: amlogic: Add S7 PLL clock controller driver

This commit adds the PLL clock controller driver for the Amlogic S7 SoC,
providing the fixed PLL and its dividers, the GP0, HIFI0 and HIFI1 PLLs,
and the HDMI PLL.

> diff --git a/drivers/clk/meson/s7-pll.c b/drivers/clk/meson/s7-pll.c
> new file mode 100644
> index 0000000000000..2aa253a5f2111
> --- /dev/null
> +++ b/drivers/clk/meson/s7-pll.c

[ ... ]

> +static const struct reg_sequence s7_hdmi_pll_init_regs[] =3D {
> +	{ .reg =3D HDMIPLL_CTRL0,	.def =3D 0x00881000 },
> +	{ .reg =3D HDMIPLL_CTRL1,	.def =3D 0x2c6011cc },
> +	{ .reg =3D HDMIPLL_CTRL2,	.def =3D 0x86801000 },
> +	{ .reg =3D HDMIPLL_CTRL3,	.def =3D 0x00000000 },
> +};
> +
> +static const struct clk_div_table s7_hdmi_pll_div0p5_table[] =3D {
> +	{ .val =3D 0, .div =3D 1 },
> +	{ .val =3D 1, .div =3D 2 },
> +	{ /* sentinel */ }
> +};
> +
> +static struct clk_regmap s7_hdmi_pll_div0p5 =3D {
> +	.data =3D &(struct clk_regmap_div_data) {
> +		.offset =3D HDMIPLL_CTRL1,
> +		.shift =3D 19,
> +		.width =3D 1,
> +		.table =3D s7_hdmi_pll_div0p5_table,
> +		.flags =3D CLK_DIVIDER_READ_ONLY,
> +	},
> +	.hw.init =3D &(struct clk_init_data) {
> +		.name =3D "hdmi_pll_div0p5",
> +		.ops =3D &clk_regmap_divider_ro_ops,
> +		.parent_data =3D &(const struct clk_parent_data) {
> +			.fw_name =3D "hdmi",
> +		},
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap s7_hdmi_pll_vco =3D {
> +	.data =3D &(struct meson_clk_pll_data) {
> +		.en =3D {
> +			.reg_off =3D HDMIPLL_CTRL0,
> +			.shift   =3D 28,
> +			.width   =3D 1,
> +		},
> +		.m =3D {
> +			.reg_off =3D HDMIPLL_CTRL0,
> +			.shift   =3D 0,
> +			.width   =3D 9,
> +		},
> +		.frac =3D {
> +			.reg_off =3D HDMIPLL_CTRL3,
> +			.shift   =3D 0,
> +			.width   =3D 17,
> +		},
> +		.l =3D {
> +			.reg_off =3D HDMIPLL_STS,
> +			.shift   =3D 31,
> +			.width   =3D 1,
> +		},
> +		.rst =3D {
> +			.reg_off =3D HDMIPLL_CTRL0,
> +			.shift   =3D 29,
> +			.width   =3D 1,
> +		},
> +		.range =3D &s7_hdmi_pll_mult_range,
> +		.init_regs =3D s7_hdmi_pll_init_regs,
> +		.init_count =3D ARRAY_SIZE(s7_hdmi_pll_init_regs),
> +		.flags =3D CLK_MESON_PLL_RST_ACTIVE_LOW |
> +			 CLK_MESON_PLL_NOINIT_ENABLED,
> +	},
> +	.hw.init =3D &(struct clk_init_data) {
> +		.name =3D "hdmi_pll_vco",
> +		.ops =3D &meson_clk_pll_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&s7_hdmi_pll_div0p5.hw
> +		},
> +		.num_parents =3D 1,
> +	},
> +};

[ ... ]

> +static struct clk_hw *s7_pll_hws[] =3D {

[ ... ]

> +	[CLKID_HDMI_PLL_DIV0P5]		=3D &s7_hdmi_pll_div0p5.hw,
> +	[CLKID_HDMI_PLL_VCO]		=3D &s7_hdmi_pll_vco.hw,

[Severity: Medium]
Can s7_hdmi_pll_div0p5 cache a stale divide-by-2 rate before
s7_hdmi_pll_vco initializes HDMIPLL_CTRL1?

meson_clkc_init() registers s7_pll_hws[] in index order, so
s7_hdmi_pll_div0p5 reads HDMIPLL_CTRL1 bit 19 and caches its rate before
s7_hdmi_pll_vco runs meson_clk_pll_init() and writes
s7_hdmi_pll_init_regs (which clears HDMIPLL_CTRL1 bit 19 to 0 when the
PLL is not already enabled by firmware). Because s7_hdmi_pll_div0p5 uses
clk_regmap_divider_ro_ops without CLK_GET_RATE_NOCACHE, its cached rate
is never updated after HDMIPLL_CTRL1 is overwritten, which would leave
s7_hdmi_pll_vco and all downstream HDMI PLL clocks calculating rates off
by a factor of 2 if bit 19 was set prior to initialization.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-upstream-s=
7-clk-v1-0-7d501d62621f@baylibre.com?part=3D5
