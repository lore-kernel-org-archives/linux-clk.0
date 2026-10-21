Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590574;
	b=C5ck6qA4KUJG/pE8wXgZucfhaKfIDAg+bDSzyDZgz41GMK5FvgLNYrqusPmZDa+13dYc
	 QNViSjk+5C6tPtFCKFbYDqIk6OrnLvS3Gy1wUdLAI+BFHoxgDnuvGfLiaH5zoqea0YIND
	 o5RnO6ZsyM0kCP4GWSqtk44ybOdgAUa/Eh/qoMu5aclFjy42j/F30ne5OaCb6jlxKiJde
	 +UEIE364137ldHUZy56oamsZZhnFfCH3Lauri0JkqfV4PFeZZhNQQzMXGD+RwH8qjZhEN
	 wMRElDFtkvfZOa1D5sjV4xT/rFvqzxJKcWo31kVB4T6cp7vlA9m32US54UvAoHG81kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590574;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cUO2w6H/igzf42de8Iv7z7WkcOH4V+dwsw+vBmdaipY=;
	b=A9weE75nTYH2Gcw/6IV4sw3wrp6R7Y1oe1Ocar/WR472mZuv4TZNlfQYvw8TFY2b5cUZ
	 S0ooEauu4fyG487PrlEKQvbOhvgYunh3c9/VtdkhsVL/7jxY0bc8o/QStnQN/6QCe23Xf
	 7tFRBnHDTq39uvshGXx6LkvTZAdDofI6BDWwSy4i5xbSWk+98ccrpbhHfC5mL8LVSy4zm
	 wj95G/6ogxheeJI2Z5+tOBppTkMBnkDh5jqoGGvl5WHPCYq2E47nl5RCeRzT4mDwO6gPZ
	 HR8bUWW6fA6O0n/1yyWauKKqIKlxnz/YUzCnI9N5Vl6tBGVEDdbfMPq4+8ZFySG+lQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=duYihhOD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AE4606A31E;
	Wed, 21 Oct 2026 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=duYihhOD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D6A1F000C4;
	Wed, 21 Oct 2026 13:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792590573;
	bh=cUO2w6H/igzf42de8Iv7z7WkcOH4V+dwsw+vBmdaipY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=duYihhODzuw6KQBMSgt6f3leXx9jeNLiFTHeQQfiXpcJXC997QCa/qPWCmMgAjvsS
	 hYrUjI58SDK5cC0mjU+gFEItbqVt/N+NZP8vAT+1kYUdRjdiAsrTM7YApXdfKWqiEZ
	 koFCQB9nixJqeJSMSxDiwo+jCdQrQJiODzz9ai6Xg7flv/v5SUpknPVxQnw2Mp/ZK2
	 zJ/reI6qNhW2GOlpOof1q9vZzMFCPB6R8GJotS5LFe4N2iub0kY/peqNqDG8ew4yg2
	 XPVG7U/OhrbVTCJVsNOfwb5Dk1CKOnJtWc0Ho/X+K1t2Kr6862Y/a/Hn9WagHynU7B
	 iglzb3jusLQcg==
Message-ID: <sashiko-outbox-180327@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: imx8mp: Drop VIDEO_PLL1 assigned rate
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261021-ge-clk-lcm-v1-5-246cc35b5ffb@bootlin.com>
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
 <20261021-ge-clk-lcm-v1-5-246cc35b5ffb@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 13:49:32 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: imx8mp: assigned-clock-rates mismatch in helios-lvds=
 overlay
- [Medium] clk: imx8mp: bus composite helper used for IP slice in imx8mp_cl=
ocks_probe()
--

commit 540b176866f9d4811ba6779f199a55adb4dc8a78
Author: Miquel Raynal <miquel.raynal@bootlin.com>

arm64: dts: imx8mp: Drop VIDEO_PLL1 assigned rate

This commit removes the IMX8MP_VIDEO_PLL1 entry and its 1039.5 MHz rate from
assigned-clocks and assigned-clock-rates in the media_blk_ctrl node of
arch/arm64/boot/dts/freescale/imx8mp.dtsi, relying on common clock framework
rate negotiation instead.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 9b2b3a9bf9e80..2a02e80e60e7b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1988,16 +1988,14 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
>  						  <&clk IMX8MP_CLK_MEDIA_APB>,
>  						  <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
>  						  <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>,
> -						  <&clk IMX8MP_CLK_MEDIA_ISP>,
> -						  <&clk IMX8MP_VIDEO_PLL1>;
> +						  <&clk IMX8MP_CLK_MEDIA_ISP>;
>  				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>,
>  							 <&clk IMX8MP_SYS_PLL1_800M>,
>  							 <&clk IMX8MP_VIDEO_PLL1_OUT>,
>  							 <&clk IMX8MP_VIDEO_PLL1_OUT>,
>  							 <&clk IMX8MP_SYS_PLL2_500M>;
>  				assigned-clock-rates =3D <500000000>, <200000000>,
> -						       <0>, <0>, <500000000>,
> -						       <1039500000>;
> +						       <0>, <0>, <500000000>;

[Severity: Medium]
Does dropping <&clk IMX8MP_VIDEO_PLL1> from assigned-clocks on media_blk_ct=
rl
break arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtso?

In arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtso, the
overlay overrides assigned-clock-rates on &media_blk_ctrl with six entries
without overriding assigned-clocks:

&media_blk_ctrl {
	/*
	 * currently it is not possible to let display clocks configure
	 * automatically, so we need to set them manually
	 */
	assigned-clock-rates =3D <500000000>, <200000000>, <0>,
		/* IMX8MP_CLK_MEDIA_DISP2_PIX =3D pixelclk of lvds panel */
		<33260000>, <0>,
		/* IMX8MP_VIDEO_PLL1 =3D IMX8MP_CLK_MEDIA_LDB * 2 */
		<465640000>;
};

With <&clk IMX8MP_VIDEO_PLL1> removed from media_blk_ctrl in
arch/arm64/boot/dts/freescale/imx8mp.dtsi, the merged &media_blk_ctrl node =
in
imx8mp-aristainetos3-helios-lvds.dtb has five entries in assigned-clocks and
six entries in assigned-clock-rates, which fails device tree schema
validation.

At boot, when of_clk_set_defaults() -> __set_clk_rates() in
drivers/clk/clk-conf.c iterates over assigned-clock-rates on &media_blk_ctr=
l,
the sixth entry (465640000) is out of bounds for assigned-clocks:

drivers/clk/clk-conf.c:__set_clk_rates() {
	...
		if (rate) {
			rc =3D of_parse_phandle_with_args(node, "assigned-clocks",
					"#clock-cells",	index, &clkspec);
			if (rc < 0) {
				/* skip empty (null) phandles */
				if (rc =3D=3D -ENOENT)
					continue;
				else
					return rc;
			}
	...
}

Because of_parse_phandle_with_args() returns -ENOENT for the missing sixth
clock, __set_clk_rates() skips setting IMX8MP_VIDEO_PLL1 to 465640000 Hz,
leaving the display clock tree misconfigured on that board.

>  				#power-domain-cells =3D <1>;
> =20
>  				lvds_bridge: bridge@5c {

[Severity: Medium]
In the earlier commits in this series enabling rate negotiation on
IMX8MP_CLK_MEDIA_LDB in drivers/clk/imx/clk-imx8mp.c, should
imx8mp_clocks_probe() use imx8m_clk_hw_composite_flags() instead of
imx8m_clk_hw_composite_bus_flags()?

In drivers/clk/imx/clk-imx8mp.c, imx8mp_clocks_probe() registers
IMX8MP_CLK_MEDIA_LDB (at ccm_base + 0xbf00, in the peripheral clock root
slice range) with imx8m_clk_hw_composite_bus_flags():

drivers/clk/imx/clk-imx8mp.c:imx8mp_clocks_probe() {
	...
	hws[IMX8MP_CLK_MEDIA_LDB] =3D imx8m_clk_hw_composite_bus_flags("media_ldb"=
, imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT | CLK_V2_RA=
TE_NEGOTIATION);
	...
}

Passing imx8m_clk_hw_composite_bus_flags() sets IMX_COMPOSITE_BUS in
drivers/clk/imx/clk-composite-8m.c:__imx8m_clk_hw_composite():

drivers/clk/imx/clk-composite-8m.c:__imx8m_clk_hw_composite() {
	...
	} else if (composite_flags & IMX_COMPOSITE_BUS) {
		div->shift =3D PCG_PREDIV_SHIFT;
		div->width =3D PCG_PREDIV_WIDTH;
		divider_ops =3D &imx8m_clk_composite_divider_ops;
		mux_ops =3D &imx8m_clk_composite_mux_ops;
	} else {
		div->shift =3D PCG_PREDIV_SHIFT;
		div->width =3D PCG_PREDIV_WIDTH;
		divider_ops =3D &imx8m_clk_composite_divider_ops;
		mux_ops =3D &clk_mux_ops;
		if (!(composite_flags & IMX_COMPOSITE_FW_MANAGED))
			flags |=3D CLK_SET_PARENT_GATE;
	}
	...
}

Because IMX_COMPOSITE_BUS selects the bus slice branch, IMX8MP_CLK_MEDIA_LDB
uses imx8m_clk_composite_mux_ops instead of clk_mux_ops and drops
CLK_SET_PARENT_GATE, allowing clk_set_parent() while media_ldb is enabled.
Using imx8m_clk_hw_composite_flags() from drivers/clk/imx/clk.h would keep
the peripheral slice configuration while passing CLK_SET_RATE_PARENT |
CLK_V2_RATE_NEGOTIATION.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-ge-clk-lcm=
-v1-0-246cc35b5ffb@bootlin.com?part=3D5
