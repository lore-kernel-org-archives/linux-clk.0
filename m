Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638481;
	b=4vmBnxuLeljGOHkwMJOucJhqtOJKcAuFZ4uIZWQOWy1ckr2SQSWWAJ/WtBz3SGIO/IT0
	 /C+ECcVOViv1K2wtpwY+mYQdy4ITQg5Ld833m5zmET5dhVDpmESD3HEVqWfh/kJj6LnR/
	 AcHT/Fz6buhqcSKt01XWiaipXlI3VlR5q4kCRl5n244lu91Y5bHCWBZIdPGct2cARfLc8
	 oXMObFpL7kyDB0l6VnhMKpwWcHx9htWJa1A/YEznrvb+P5TjFAITzcBBsBwhzGy7eiO8k
	 SF3pmcJLtWhdirmSPssQ82Mi1tnzjP8DBNF3VRyJsbJ95IiV9SJWV3Cy3oG2jPCk8Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638481;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4HY163TzF+6S9HpTSrCmsZ8TjdMQQ/SNXL77ezblEqI=;
	b=S8bzzj/g+z4nDYBmDBZw8ZGL+0bIdpU8seORHF1itA62lUp3D3SLrzgUSOdj7XsoYzR5
	 pilxmAa1lPtFUa28bIiZ8FUGR3+EIN8zkyEbnvZbO7H/iwyiKxonGeyYb+8P3h7wXpqI7
	 Paox5wPGiXdjSfOuGzmzKbQ3X/TLTaZEu1bENF7QrwCKdEpFbP2AWSIdQ9wvNQG5sdIO9
	 Cc2e8qEJ5iDbKl9wxetAPTs8pwbp2yIk6hTdJiZnGn7likqRXu0T/x5LKkCEB1eKd2PGu
	 4389PjPZeUNsm9h+xh147CCY+azdGeNSjHiACjOvWYdVo9Lle1VRwssuMsKWx1WyrXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PdmW+Bgq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32771606A321;
	Wed, 25 Nov 2026 20:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PdmW+Bgq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0871F000CA;
	Wed, 25 Nov 2026 20:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795638480;
	bh=4HY163TzF+6S9HpTSrCmsZ8TjdMQQ/SNXL77ezblEqI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PdmW+BgqL6O1VjoCezkC3rMbdDResXYHaijZdhf3wpFUl3h+TYC1piOcC3sfkiwxR
	 zsb3V47icKE3xhIHtUaxeZ8mAITWMLlI5FKEG1iS4sz7+fj/u8lswdYoiDTqB9AL94
	 JvNqJkYYjI+mT6YWwQN8XRZUS4xQc4tGErL8spsyEDfePw2VpbmVDVWrcH531jU6om
	 IA+ynQOeJzNnxCwpAoP1Aqrll5cCXQL/LWTwawEjEp1fFPi/AvdPrlCGrmdqVrsVnC
	 9/zimyh9OweHcJhbKTDGWc+f//bH1zhUBlc4Rd7mHvLjeP9SIUJUUwFycLRqn0qYpE
	 IzEPmI9re8blA==
Message-ID: <sashiko-outbox-234134@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add TC9564
 clock node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125202141.1288493-4-elder@riscstar.com>
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-4-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 20:28:00 +0000
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
- [High] arm64: dts: qcom: clock-25000000 under pcie@0,0 shifts tc9563
  port indexing
--

commit c4e2dd0c5c7aea169ea475dfdf59cb2e475d33be
Author: Alex Elder <elder@kernel.org>

arm64: dts: qcom: qcs6490-rb3gen2: add TC9564 clock node

This commit adds a devicetree node for the Toshiba TC9564 clock and reset
controller along with a 25 MHz fixed-clock node supplying it.

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/bo=
ot/dts/qcom/qcs6490-rb3gen2.dts
> index 682bcbc0b466b..b327f64885ef2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -890,6 +890,13 @@ pcie@0,0 {
>  		pinctrl-0 =3D <&tc9563_resx_n>;
>  		pinctrl-names =3D "default";
> =20
> +		tc9564_xo_board: clock-25000000 {
> +			compatible =3D "fixed-clock";
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <25000000>;
> +			clock-output-names =3D "tc9564_xo_board";
> +		};
> +
>  		pcie1_switch0_dsp1: pcie@1,0 {
>  			reg =3D <0x20800 0x0 0x0 0x0 0x0>;
>  			#address-cells =3D <3>;

[Severity: High]
Does placing clock-25000000 as the first child of pcie@0,0 shift the
downstream port indexing in the tc9563 power control driver?

Both tc9563_pwrctrl_probe() and tc9563_pwrctrl_parse_reset_line() map the
direct children of the pci1179,0623 node positionally to TC9563_DSP1,
TC9563_DSP2, and TC9563_VDSP:

drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c:tc9563_pwrctrl_probe() {
	...
	port =3D TC9563_USP;
	for_each_child_of_node_scoped(node, child) {
		if (++port >=3D TC9563_MAX)
			break;

		ret =3D tc9563_pwrctrl_parse_device_dt(child, &tc9563->cfg[port]);
	...
}

With clock-25000000 ahead of pcie@1,0, pcie@2,0, and pcie@3,0, the driver
treats clock-25000000 as TC9563_DSP1, shifts pcie@1,0 and pcie@2,0 into
TC9563_DSP2 and TC9563_VDSP (misassociating per-port settings, reset
GPIOs, and the integrated Ethernet endpoint), and stops before reaching
pcie@3,0.  It also violates Documentation/devicetree/bindings/pci/toshiba,t=
c9563.yaml,
which only permits pcie@[1-2],0 and pcie@[3],0 child nodes.  Should
tc9564_xo_board live under the root /clocks node instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125202141.1288=
493-1-elder@riscstar.com?part=3D3
