Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CFD17C7CB
	for <linux-clk@vger.kernel.org>; Fri, 15 Nov 2024 17:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731690584; cv=none; b=HVk9Gtv3+5VvrpRUPO8Cq7tq9ObxEVnswMlSrtEHnmo0wCBmtc6AQtBQG3E3ZmQ1c44tQZC88R+Fr/WpkBSC7ENfGEhJ64bS74NUVEx+qdvUVNJNrw41hl6A5LsVjSobvbcnnHDYeYdW1Ddl7RrXW7BcUpREdwts/MC2DIdW9QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731690584; c=relaxed/simple;
	bh=pWPfvLeBGuX9cue0cHCm8fhQeuv5M3kL+xEL5g4KF68=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AnzL0MFMnh2a0xiLCew5e6pQnLClMQlJ8QlMhQMJgKUtcYoKvb7clX1U92HPsEbRoRF5vwtv57WURQqQbHjLzEZYzfRZLXBSP4OnVGUIRl5A/Ej0ETLaZxeWpktw7Z2+V70tqWUUB8Lf3cq53G+2k9g+ek8mYXQhiSDoBlzrygQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=omlKjeNt; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="omlKjeNt"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0222C0006;
	Fri, 15 Nov 2024 17:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731690579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xg68OIUwvNHiLxkLQIPJGYXs1ivUdnydtUmZWb6wdh8=;
	b=omlKjeNtEA26iMZm6ybnk557wfNobMAHIp1Olo4/+eqG+Hq4u+pXOaizJS0+Q+4Zs+SpKs
	uvNJouKmuOMPwSaVfBgyGVBAvJBhMOlNx0al+nZmhwpvVwMXvsa4wCmlI/KVh/zN70DMI7
	ofOp6BZEQqjRhw9knpfP+PLNmKHT0hwN80mgHK4iM2SPrV900sGi3RaIzvb8l+rubXuFuo
	+yJRuAbeNI81Fp0O5tDmZqfXQ1ziRt6eAZFuFN0Gx1TY+64yexXuBKnl28WohSdLu18Fo9
	8rYTRKMP349BfQnxzvgxkG+ZGqLCObLUEipcVRMCSLFT0Im/8WIipXJ4p4pgOg==
Date: Fri, 15 Nov 2024 18:09:36 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-clk@vger.kernel.org, Fabio
 Estevam <festevam@gmail.com>, "Lukas F . Hartmann" <lukas@mntmn.com>,
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Anson Huang <Anson.Huang@nxp.com>
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
Message-ID: <20241115180936.4ab56be3@booty>
In-Reply-To: <130fe140-e70d-4c45-aaab-e22762c58c88@denx.de>
References: <20240531202648.277078-1-marex@denx.de>
	<20241112234206.558d5d5e@booty>
	<79f21303-b0ba-45ed-a842-7e5364fd4efc@denx.de>
	<20241113120622.3501db73@booty>
	<130fe140-e70d-4c45-aaab-e22762c58c88@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Marek,

just a quick feedback about my latest discoveries.

On Wed, 13 Nov 2024 22:19:02 +0100
Marek Vasut <marex@denx.de> wrote:

> On 11/13/24 12:06 PM, Luca Ceresoli wrote:
> > Hi Marek, =20
>=20
> Hi,
>=20
> >>>> The media_disp[12]_pix clock supply LCDIFv3 pixel clock output. These
> >>>> clocks are usually the only downstream clock from Video PLL on i.MX8=
MP.
> >>>> Allow these clocks to reconfigure the Video PLL, as that results in
> >>>> accurate pixel clock. If the Video PLL is not reconfigured, the pixel
> >>>> clock accuracy is low.
> >>>>
> >>>> Signed-off-by: Marek Vasut <marex@denx.de> =20
> >>>
> >>> I'm afraid I just found this patch broke my previously working setup
> >>> with a panel connected on the LDB. =20
> >> Do you need a fix similar to this one?
> >>
> >> 4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1
> >> frequency to 506.8 MHz") =20
> >=20
> > So, 4fbb73416b10 is adding an assigned-clock-rates to hardcode rates,
> > especially the video_pll1 rate. =20
>=20
> Nope.
>=20
> See arch/arm64/boot/dts/freescale/imx8mp.dtsi
>=20
> 1891                         media_blk_ctrl: blk-ctrl@32ec0000 {
> ...
> 1951                                 assigned-clock-rates =3D <500000000>=
,=20
> <200000000>,
> 1952                                                        <0>, <0>,=20
> <500000000>,
> 1953                                                        <1039500000>;
>=20
> That imx8mp.dtsi preconfigures the Video PLL1 to some random clock=20
> frequency.
>=20
> Commit 4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1=
=20
> frequency to 506.8 MHz") configures the Video PLL1 to a frequency from=20
> which both your panel pixel clock and LDB serializer clock can be=20
> successfully divided down.
>=20
> Which panel do you use ?
>=20
> Try this -- Revert this patch, check /sys/kernel/debug/clk/clk_summary=20
> and compare it with (I assume) panel-simple.c entry for the panel you=20
> use, and notice the disp_pix clock are likely a bit off. That's because=20
> the lcdif driver did its best to divide those pixel clock down from=20
> 1039500000 set in imx8mp.dtsi .
>=20
> If you really want accurate pixel clock for your panel, you need similar=
=20
> change to 4fbb73416b10 and configure the Video PLL such that the=20
> accurate pixel clock can be derived from it. The Video PLL cannot be set=
=20
> to pixel clock, because the LDB serializer clock are either 7x the pixel=
=20
> clock, or 3.5x the pixel clock (for dual link LVDS), so the Video PLL=20
> has to be set to 7x or 3.5x pixel clock of the panel, then you should=20
> get accurate pixel clock and a working panel again.

I found that I'm having the same issue that has been discussed in some
related threads: the lcdif2 configures the video_pll1 to ~72 MHz, and
later LDB tries to set it to 7x that value, failing.

I would have guessed your "[PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB
serializer clock reconfigure parent rate" would have fixed it, and it
actually allwos the LDB to set a proper (7x) rate for video_pll1, but
then also the media_disp2 goes to the same rate. Apparently the
video_pll1 is not propagated to media_disp2. I haven't dug into this.

So this is not the bug I had suspected about video_pll1 rate
computation.

For now my workaround is to set the exact rate to video_pll1 via
assigned-clock-rates.

However this breaks the case of using both lcdif1 and lcdif2. For that
I have added a reparenting of media_disp1 to sys_pll3 and it looks like
working.

Would you mind keeping Miqu=C3=A8l and me in Cc in following discussions
about the imx8mp video clocks? We are also facing this topic and we are
happy to contribute.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
