Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9371E521;
	Tue, 28 Jan 2025 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738056115; cv=none; b=nEDEIPog367aZGTnsuVoF0MZD5RE1mmx7UV8lt0VqGyYFCu8LA5IO7xydHzgnOpjJ1ZHpItCn5iXof6NCKrFMDQ3KrbDU1QCxsrrvsk24gQz2lFYGqa9X9q8Q2efYHSXoprUAJyjOYPxMCIZw+IzfPhbNQcTnGvxpB6D5uopfgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738056115; c=relaxed/simple;
	bh=AjNogne13c4qMiwZddfdCgFJisJ5oHihprr5OfKcQ60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rl/AHyK0cwHZ4B6hx6VinFClmZr6H5WS+nrFlC6asfVhxUieP7uwXqBO9s3LjZw0wK2DbNTOEAQvDEAZKZ+eqSV9Ec9k3M3rFclNf+qOENkL8PpYEh5o30LumcVqgxrAmbIPk/EJLhOSMu02qUrkOFSmDOiuyu13wRMOXbv4iiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBwdFfeu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBwdFfeu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6158C4CED3;
	Tue, 28 Jan 2025 09:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738056114;
	bh=AjNogne13c4qMiwZddfdCgFJisJ5oHihprr5OfKcQ60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JBwdFfeuQyX3ANNV4Jje98erGq9uD/7JZEEuT6hA0nUNhk0Ax+82Cb5zsxfMr4yHi
	 lkiZr/p1KLdffkM/c59zkhpj5xP/5VBY+5vgURcbBexoXsK+Fg78CRoKu2XxuPuyI8
	 otOtlA6rk62oU3ceRu3AJj9BsPhbp/UbxlFujFmklXhOuXfemWkrkluciGXQq9Rusb
	 G0Woo+q9x2a2sEYDMkM+UKYYGqRGbSzmrrwYmAqV/xgsPezbXxHqlc97d/n1047E8X
	 2jwGRYvWTehVr5E+4k3ul0DwLPLRgNtPdafOHMBHjYdwvVeUJWTVvkjV3iTJyKxczu
	 f5ljfmFiB6elg==
Date: Tue, 28 Jan 2025 10:21:51 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org, abelvesa@kernel.org, 
	peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	arnd@arndb.de, nfraprado@collabora.com, marex@denx.de
Subject: Re: [PATCH v7 0/7] Add ITE IT6263 LVDS to HDMI converter support
Message-ID: <64eaq2n3pfcxxxcw5n3cqpx3ie3vyqo6v6akc5g72anoazendf@5vrlafr3q676>
References: <20241114065759.3341908-1-victor.liu@nxp.com>
 <20241217-uppish-sapphire-dinosaur-4c40a2@houat>
 <aba80c42-1b48-426f-b29d-88bf18473602@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7kmjyo7mbnkjzcvj"
Content-Disposition: inline
In-Reply-To: <aba80c42-1b48-426f-b29d-88bf18473602@nxp.com>


--7kmjyo7mbnkjzcvj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 0/7] Add ITE IT6263 LVDS to HDMI converter support
MIME-Version: 1.0

On Wed, Dec 18, 2024 at 02:02:18PM +0800, Liu Ying wrote:
> On 12/17/2024, Maxime Ripard wrote:
> > On Thu, Nov 14, 2024 at 02:57:52PM +0800, Liu Ying wrote:
> >> This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> >> i.MX8MP EVK.
> >>
> >> Since IT6263 DT binding and driver were picked up from v5 and landed
> >> in drm-misc, this patch series contains patches almost all i.MX8MP
> >> SoC/platform specific.
> >>
> >> Patch 1 is a preparation patch to allow display mode of an existing
> >> panel to pass the added mode validation logic in patch 3.
> >>
> >> Patch 2 is a preparation patch to drop CLK_SET_RATE_PARENT flag for
> >> media_disp{1,2}_pix clocks.  Patch 5 depends on patch 2.
> >>
> >> Patch 3 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
> >> the next non-panel bridge, that is the IT6263 in this case.
> >>
> >> Patch 4 adds mode validation logic to i.MX8MP LDB bridge driver against
> >> "ldb" clock so that it can filter out unsupported display modes read
> >> from EDID.
> >>
> >> Patch 5 adds mode validation logic to i.MX8MP LDB bridge driver against
> >> "pix" clock so that it can filter out display modes which are not
> >> supported by pixel clock tree.
> >>
> >> Patch 6 adds DT overlays to support NXP adapter cards[1][2] with IT6263
> >> populated.
> >>
> >> Patch 7 enables the IT6263 bridge driver in defconfig.
> >>
> >> Note that patch 3 and 4 depend on patch[3] in shawnguo/imx/fixes.
> >>
> >> Since this patch series is related to another one[4] authored by Marek,
> >> Maxime asked for a proper description[5] about the exact problem.
> >>
> >> Admittedly, it's a bit complicated.  Here, I'm trying to do so and exp=
lain
> >> a bit more.
> >>
> >> [ Description ]
> >> It's a clock problem about shared i.MX8MP video PLL between MIPI DSI a=
nd
> >> LVDS display pipelines.  The pipelines are driven by separate DRM driv=
er
> >> instances, hence there is no way to negotiate a dynamically changeable
> >> PLL rate to satisfy both of them.  The only solution is to assign a
> >> sensible/unchangeable clock rate for the PLL in DT.
> >>
> >> Admittedly, sys_pll3_out can be another clock source to derive pixel c=
lock
> >> for i.MX8MP MIPI DSI display pipeline if a particalur i.MX8MP platform
> >> doesn't use audio(sys_pll3_out is supposed to derive audio AXI clock r=
unning
> >> at nominal 600MHz).  However, for i.MX8MP platforms with audio feature=
s,
> >> the shared video PLL case has to be handled and it determines that the=
 above
> >> solution(unchangeable PLL rate assigned in DT) has to be used no matter
> >> sys_pll3_out is for display or audio, because the separate DRM driver
> >> instances really don't know if they are sharing the video PLL or not.
> >>
> >> [[ i.MX8MP Display Hardware ]]
> >> i.MX8MP SoC supports three display pipelines:
> >>
> >>  -----------------------------           ------------------------
> >> | imx8mp_media_disp_pix_sels  |         | imx8mp_media_ldb_sels  |
> >>  -----------------------------           ------------------------
> >> |  osc_24m (fixed 24MHz)      |         |  osc_24m (fixed 24MHz) |
> >> |*-video_pll1_out (video)     |         |  sys_pll2_333m (sys)   |
> >> |  audio_pll2_out (audio)     |         |  sys_pll2_100m (sys)   |
> >> |  audio_pll1_out (audio)     |         | -sys_pll1_800m (sys)   |
> >> | -sys_pll1_800m (sys)        |         | -sys_pll2_1000m (sys)  |
> >> | -sys_pll2_1000m (sys)       |         |  clk_ext2 (external)   |
> >> |  sys_pll3_out (audio ?)     |         |  audio_pll2_out (audio)|
> >> |  clk_ext4 (external)        |         |*-video_pll1_out (video)|
> >>  -----------------------------           ------------------------
> >>              ||                                     |
> >>  -----------------------------           ------------------------
> >> |   media_disp{1,2}_pix       |         |        media_ldb       |
> >>  ----------------------------- mux+div   ------------------------ mux+=
div
> >>              ||                                     |
> >>  -----------------------------           ------------------------
> >> | media_disp{1,2}_pix_root_clk|         |   media_ldb_root_clk   |
> >>  ----------------------------- gate      ------------------------ gate
> >>              ||                                     | (LVDS serial clo=
ck)
> >>              ||                                     V
> >> 	     || (Disp2 Pclk)  --------      ------------------
> >> 	     | ------------> | LCDIF2 | -> |       LDB        | -> panel/brid=
ge
> >> 	     |                --------      ------------------
> >> 	     |  (Disp1 Pclk)  --------      ------------------
> >> 	      -------------> | LCDIF1 | -> | Samsung MIPI DSI | -> panel/brid=
ge
> >> 	                      --------      ------------------
> >>                               --------      ------------------      --=
--------
> >>                              | LCDIF3 | -> | Synopsys HDMI TX | -> | H=
DMI PHY |
> >>                               --------      ------------------     |  =
   +    |
> >>                                  ^                                 |  =
  PLL   |
> >>                                  |                                  --=
--------
> >>                                  | (Disp3 pclk)                       =
  | |
> >>                                   ------------------------------------=
--  |
> >>                                                                       =
    V
> >>                                                                     pa=
nel/bridge
> >>
> >> * video_pll1_out is supposed to be used by video outputs.
> >>
> >> - LCDIF2 + LDB can only use the *same* video_pll1_out, sys_pll1_800m or
> >>   sys_pll2_1000m.
> >>
> >> [[ i.MX8MP Display Drivers ]]
> >> LCDIF: drivers/gpu/drm/mxsfb/lcdif_*.c
> >> Three LCDIFv3 display controllers are driven by three imx-lcdif DRM in=
stances
> >> separately.
> >>
> >> LDB: drivers/gpu/drm/bridge/fsl-ldb.c
> >>
> >> Samsung MIPI DSI: drivers/gpu/drm/bridge/samsung-dsim.c
> >>
> >> Synopsys HDMI TX: drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> >>
> >> [[ Problem - Shared Video PLL Between Samsung MIPI DSI and LDB ]]
> >> osc_24m, audio_pll*, sys_pll* and clk_ext* are not for video outputs,
> >> because:
> >> a. Aparently, osc_24m runs at fixed 24MHz which is too low for most di=
splays.
> >> b. Audio subsystem may consume all audio_pll*.
> >> c. sys_pll* are system clocks which are supposed to run at fixed typic=
al
> >>    rates, e.g., sys_pll2_1000m runs at 1000MHz.
> >> d. sys_pll3_out is supposed to derive audio AXI clock running at nomin=
al
> >>    600MHz(i.MX8MP data sheet specifies the rate), see NXP downstream k=
ernel:
> >>    https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/=
dts/freescale/imx8mp-evk-ndm.dts#L19
> >>    https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/=
dts/freescale/imx8mp-ddr4-evk.dts#L25
> >=20
> > Is there any downside to using any of these clocks, aside from the fact
> > that their rate must not change?
>=20
> osc_24m and sys_pll* don't support spread spectrum while audio_pll* and
> video_pll1_out support it. Other than that, I don't see any downside to
> use any of these clocks, if their clock rates happen to meet the clock
> rate requirements of the MIPI DSI and LDB display pipelines.
>=20
> >=20
> > Also, if they can't change their rate, why do they have
> > CLK_SET_RATE_PARENT (sys_pll* in particular) ?
>=20
> If media_disp{1,2}_pix and media_ldb clocks have no CLK_SET_RATE_PARENT,
> it doesn't mattter whether their parent clocks(these clocks) have it or n=
ot.
> Note that patch 2 drops CLK_SET_RATE_PARENT for media_disp{1,2}_pix clock=
s.
>=20
> Anyway, why have sys_pll* clocks got CLK_SET_RATE_PARENT? The reason I can
> think of is that it makes some potential i.MX8MP platforms possible to set
> the sys_pll* rates with the parent clock rates(sys_pll1/2/3) updated
> accordingly, e.g., if sys_pll2_1000m is the only active child of sys_pll2=
_out,
> sys_pll2_1000m's rate can be assigned to 800MHz(not typical 1000MHz) in D=
T.
> Or, maybe, the sys_pll* rates can be assigned to some particular values to
> support nominal/overdrive modes of various i.MX8MP clock roots(some are
> derived from the sys_pll* clocks).
>=20
> >=20
> >> e. clk_ext* are external clocks without known capabilities.
> >>
> >> So, the only eligible video_pll1_out is supposed to be shared between =
LDB
> >> and Samsung MIPI DSI in the two separate display pipelines if sys_pll3=
_out
> >> is already used to derive the audio AXI clock.
> >>
> >> With the shared video_pll1_out, drivers for the two display pipelines =
cannot
> >> change the PLL clock rate in runtime, since the pipelines are driven b=
y two
> >> DRM driver instances.
> >=20
> > What is the typicall frequency on those pipelines? Could setting the PLL
>=20
> For MIPI DSI to HDMI(ADV7535) and LVDS to HDMI(IT6263), the typical pixel
> rates are 148.5MHz(1080p60Hz) and 74.25MHz(720p60Hz) and the typical LDB
> clock rate is 519.75MHz.
>=20
> For MIPI DSI panel and LVDS panel, there no typical pixel rates. It depen=
ds
> on individual panels. However, it's possible to override panel's pixel cl=
ock
> rate in DT to use a fixed PLL clock rate if the pixel clock rate deviation
> is still acceptable by the panel.
>=20
> > high enough that any frequency required by any of these pipelines can be
> > accomodated through a divider work?
>=20
> Yes, that's why media_blk_ctrl node in imx8mp.dtsi assigns video_pll1 clo=
ck
> rate to 1.0395GHz. That rate supports the typical 148.5MHz and 74.25MHz
> pixel clock rates. With this patch series applied, i.MX8MP EVK would use
> this fixed 1.0395GHz video_pll1 clock to drive both MIPI DSI to HDMI and
> LVDS to HDMI simultaneously.
>=20
> >=20
> > Something like you run the PLL at 594MHz, and then most HDMI frequencies
> > can be reached by a 1, 2 or 4 divider.
>=20
> PLL running at 594MHz does support the typical pixel clock rates for MIPI
> DSI to HDMI, but not for LVDS to HDMI due to the 7x(single-LVDS link) or
> 3.5x(dual-LVDS link) folder between LDB clock rate and pixel clock rate.
> PLL running at 1.0395GHz is the one chosen to support both MIPI DSI to
> HDMI and LVDS to HDMI, e.g., with dual-LVDS link, 148.5MHz pixel clock ra=
te
> =3D 1.0395GHz / 7 and 519.75MHz LDB clock rate(148.5MHz * 3.5) =3D 1.0395=
GHz / 2.
>=20
> >=20
> >> [[ Solution ]]
> >> Assign the PLL clock source(s) and the PLL clock rate(s) in DT.  Disal=
low
> >> display drivers to change the PLL clock source(s) or rate(s) in runtime
> >> including LCDIF driver and bridge drivers.  With sensible PLL clock ra=
te(s),
> >> typical display modes like 1920x1080@60 can be supported if external H=
DMI
> >> bridges are connected, and panel display modes can be too.  Also the u=
nneeded
> >> CLK_SET_RATE_PARENT flag can be dropped for media_disp{1,2}_pix clocks.
> >> If needed, bridge drivers just call clk_round_rate() to validate clock=
s so
> >> that unsupported display modes can be filtered out.  Although the
> >> unchangeable PLL clock rate disallows more potential display modes, the
> >> solution works for single/dual/triple display pipelines(OFC, hardware =
designers
> >> should pick panel/bridge display devices carefully first by considerin=
g clock
> >> resources).
> >=20
> > I think it's a reasonable idea, if not for the hardcode-it it DT stuff.
> > If we can manage to have a fixed setup work ok for all display use
> > cases, why would it be in DT? The clock driver seems like a much better
> > choice to me.
>=20
> Different i.MX8MP platforms may have different display devices(panel(s)
> and/or bridge(s)). It's flexible to allow each platform to assign the PLL
> rate(s) in DT. It doesn't look doable with clock driver, does it?

Why not? Plenty of platforms are doing it. If anything, it's more
flexible to deal with it in the clock driver, because then you don't
have to filter out modes that aren't compatible with the frequency that
got assigned in the DT.

Also, it's more robust since that frequency isn't guaranteed to be
constant across the system life.

Maxime

--7kmjyo7mbnkjzcvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5ihrgAKCRAnX84Zoj2+
dnSLAYDt6cWcr36B59F3FD29h+8EhJFZdQYolvJ7EnbMmgpcvvyE+/jFQvdZDB98
KGeKET0BgPuI14uRS6azReXJHElsJi4ivmgc+xYGykxLt6yA7fTYJlBo9mxtbI4E
Hpqm546xvg==
=UCgp
-----END PGP SIGNATURE-----

--7kmjyo7mbnkjzcvj--
