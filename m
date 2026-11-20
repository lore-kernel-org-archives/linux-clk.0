Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197521;
	b=urgkykWCsRS2HTtWkCYhXQ2lbPzd4caXlB8GP3BYiKZgipHVMVXjaS0/nEP+CS9uwMgN
	 96S7sQ92uWOwMqM5BfZ6ZzwXY5DUL4u7RwWR6UTfoMHSX75l0+XqPx3MtovWK5nJqFS7p
	 sfRivlF2LF0DQTfk+gS/bWg1ejHHnI1ZMkB+TD2rOVZgdU12jNeQPseD/CdBDdrXBTZyP
	 DXOjJanDwJO2Ts1u3TKqyR22uYgcLH/kw1pINtbJF0ol6y/uMRWCgQHZ60BfopdY24V0H
	 lLO826mgbkltGXmvgqTw4uA6y0ECSc3MGKzD0Jzh/18g19vrMn6EyAufj2rvQWEBOpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197521;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=p7HHkcxRFMtz3gtfISt9NfR1hbheu36AT1vsomKxQRM=;
	b=xpCk5SmLEQtN4Njbj7mdhMq2p9eWGskvBTlu45RR7nWPbMDKNMSg73QX2LyOcvcNUYqR
	 hjYgj4r+zWV57hOZLuvi8Qq8GulRrAAQDII5EJU/RYdof9Uxqh2S22Jo1mFy8/56mjmIv
	 35z3rdhfNgKH5QkHoqQENX9MfyfhPP/tUAN+5SgSSOLZVbDPKivZ9/mDMJEOKfnaAVYw4
	 GZzbMFbSMxrnLCMmlV1p9ia6G5+n2yQ4695W30V9Gg74+7IB+BLkQ2dhwf2r4DYOMfaK9
	 AohAS6+ItgbgPHjZDkOydrT4nESJZ3Qhy1ruwgnv+2ncpnYKllNvYR8Bb5XFAi1T6AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L0sRAwk2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17B9606A332;
	Fri, 20 Nov 2026 17:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L0sRAwk2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E751F000C6;
	Fri, 20 Nov 2026 17:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795197521;
	bh=p7HHkcxRFMtz3gtfISt9NfR1hbheu36AT1vsomKxQRM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L0sRAwk2hOGww7pqk7pYew5cZRIPtG+fiTAhh3m2/rpr8U0p6Nnym+Rg40v3etXG6
	 6/wme20a5fmBUMuvjPPGBVlveharabeOTwVVz1zkzIL1Kl3bbzc/pZ/HNqnt7mkBTK
	 8WeYzG+Qr29EXxHPgRCrghKCiPOqc0+t6BSEpmtYwXM5fuKIpw5qogEFlsdH3WopT0
	 XERW8S5y3GVYZf0T1BiIgQ3KflK1lEMFmoAIT+tWjt5BB0G+KyI2x96QiEfzWrh7tI
	 gcrDRlooA6pyUt3KjaSOhaOQ6CiRM8y6pF8vv/g1b1p395ILNrgyct0xAHdnIU5GOI
	 75LiV/tlllvTw==
Message-ID: <sashiko-outbox-225763@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] ARM: dts: renesas: r9a06g032: Add resets to mii
 converter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hendry" <khendry@reliablecontrols.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261119-rzn1-miic-resets-v1-6-feee2bb28bb4@reliablecontrols.com>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-6-feee2bb28bb4@reliablecontrols.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 17:58:40 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] ARM: dts: renesas: r9a06g032: 1-based reset IDs mismatch
  0-based reset table
- [High] clk: renesas: r9a06g032: missing rcdev member in struct
  r9a06g032_priv
- [Medium] clk: renesas: r9a06g032: inverted polarity in
  r9a06g032_reset() and status
- [Medium] clk: renesas: r9a06g032: dangling sysctrl_priv on reset
  register error
--

commit 37a9aace6321173b9dddf5f8ccba42dd97dee222
Author: Kyle Hendry <khendry@reliablecontrols.com>

ARM: dts: renesas: r9a06g032: Add resets to mii converter

This commit adds the rst_ts and rst_miic reset references from the sysctrl
node to the eth_miic node in the r9a06g032 device tree.

> diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts=
/renesas/r9a06g032.dtsi
> index f2bf087f7ad2e..0a538d9221254 100644
> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -463,6 +463,9 @@ eth_miic: eth-miic@44030000 {
>  				 <&sysctrl R9A06G032_CLK_RMII_REF>,
>  				 <&sysctrl R9A06G032_HCLK_SWITCH_RG>;
>  			clock-names =3D "mii_ref", "rgmii_ref", "rmii_ref", "hclk";
> +			resets =3D <&sysctrl R9A06G032_RST_TS>,
> +				 <&sysctrl R9A06G032_RST_MIIC>;
> +			reset-names =3D "rst_ts", "rst_miic";
>  			power-domains =3D <&sysctrl>;
>  			status =3D "disabled";
> =20

[Severity: High]
Are R9A06G032_RST_TS and R9A06G032_RST_MIIC off by one relative to
r9a06g032_resets[]?

Commit "dt-bindings: clock: r9a06g032-sysctrl: Document reset cells"
defines R9A06G032_RST_TS as 1 and R9A06G032_RST_MIIC as 2, while commit
"clk: renesas: r9a06g032: Add reset controller" registers a 2-element
r9a06g032_resets[] array (indices 0 and 1) using the default 0-based
fwnode_reset_simple_xlate():

drivers/clk/renesas/r9a06g032-clocks.c:
	static const struct regbit r9a06g032_resets[] =3D {
		RB(0x188, 3),
		RB(0x188, 4),
	};

When miic_probe() requests these resets, rst_ts (1) targets index 1
(RB(0x188, 4), the MII converter reset) instead of index 0 (RB(0x188, 3),
the timestamp reset), and rst_miic (2) fails translation with -EINVAL
because 2 >=3D nr_resets.

[Severity: High]
Does commit "clk: renesas: r9a06g032: Add reset controller" fail to
compile because struct r9a06g032_priv has no rcdev member?

Both rcdev_to_priv() and r9a06g032_clocks_probe() access clocks->rcdev to
register the sysctrl reset controller referenced here, but struct
r9a06g032_priv only defines data, lock, and reg.

[Severity: Medium]
In the sysctrl reset provider added by commit "clk: renesas: r9a06g032:
Add reset controller", are the reset polarity and status inverted in
r9a06g032_reset() and r9a06g032_reset_status()?

drivers/clk/renesas/r9a06g032-clocks.c:r9a06g032_reset() {
	r9a06g032_reset_set(rcdev, "reset", true, id);
	udelay(5);
	return r9a06g032_reset_set(rcdev, NULL, false, id);
}

The reset bits in PWRCTRL_SWITCHCTRL are active-low (r9a06g032_reset_assert=
()
passes false and r9a06g032_reset_deassert() passes true).  Calling
r9a06g032_reset() deasserts the line and then asserts it, leaving the
peripheral held in reset.  Likewise, r9a06g032_reset_status() returns
clk_rdesc_get() directly, which returns 1 when deasserted and 0 when
asserted, opposite to the reset_control_status() contract.

[Severity: Medium]
In commit "clk: renesas: r9a06g032: Add reset controller", what happens if
devm_reset_controller_register() fails at the end of
r9a06g032_clocks_probe()?

drivers/clk/renesas/r9a06g032-clocks.c:r9a06g032_clocks_probe() {
	...
	sysctrl_priv =3D clocks;

	error =3D of_platform_populate(np, NULL, NULL, dev);
	if (error)
		dev_err(dev, "Failed to populate children (%d)\n", error);

	clocks->rcdev.ops =3D &r9a06g032_reset_ops;
	clocks->rcdev.of_node =3D np;
	clocks->rcdev.of_reset_n_cells =3D 1;
	clocks->rcdev.nr_resets =3D ARRAY_SIZE(r9a06g032_resets);
	error =3D  devm_reset_controller_register(dev, &clocks->rcdev);
	if (error)
		return error;
	...
}

Returning an error after r9a06g032_add_clk_domain(), sysctrl_priv
assignment, and of_platform_populate() leaves global sysctrl_priv and the
registered OF genpd provider pointing to devm-freed memory, and leaves
populated child platform devices behind.  Also, calling
of_platform_populate() before devm_reset_controller_register() means child
devices probing during populate cannot look up the reset controller yet.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-rzn1-miic-=
resets-v1-0-feee2bb28bb4@reliablecontrols.com?part=3D6
