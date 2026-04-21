Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF46C1E2614;
	Tue, 21 Apr 2026 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787824; cv=none; b=A59pZHsS0sAA8XYLSOkol+R/E4EsGJDOHcG1Wgkbgb8qkNHyf9VoU32oNKKohLJ4BgsORdu3xqikeIOSATMf6KMc6gEZOTxhzNZR2mdI3H4SQk+3T0IujgKoLyUcx86CtEOeU7hA4bI6qLzzBYDJHzFh2nEngruKzer3koEvWaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787824; c=relaxed/simple;
	bh=HKDAuR6VKMBI5hFge6Fz+4gVNv9QS/R3uQXYS+OYaB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8sibMHOHC/T6H/RkuGHl4jA3FF8JC6EVkeqKF7KyOLxaHzkBRJd4GhFItDvd9XBdfUEcvKbzPpPD3/QJBIEg2yh/fhrS/63+y+2R/zqx1EcnN57sE0h9yY6SoasVeeOAV8DELkpJ/yvHGqw1gFOHxh2/hwBjVYQSWNs4EBG1A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NO9YBoWU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NO9YBoWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD88C2BCB0;
	Tue, 21 Apr 2026 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776787824;
	bh=HKDAuR6VKMBI5hFge6Fz+4gVNv9QS/R3uQXYS+OYaB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NO9YBoWUrThw41H0jixZKjYFMGpdq0LvsSKtUL/bAd8mptRTY0KlLZGQFAIjmEA9i
	 /9gm6jPf++KrxS/53s77SMKaVm4Mji39umPXXtJCMHCzyjXv5TAlpjjAukpdOiWlJ0
	 Ut3TVQGMYKL9A/iooRixKjzmu9JWPB3R4eG8L7KLSY8CoET2P2SXFbBtEuiDvllaXK
	 JymuOsmqfbJLOW0VFN2CUvD0uL04cWkszbMZEx0xJS7DTSt0LT+jw+JhehVm1WQ6iI
	 tmB+JsLZNE4V6UVBjWpnkMQoocz+T2zPm+e/13IxU6sYMEWV460AhL3u5tUkpfnrKO
	 Ztj+3S2uIRy9w==
Date: Tue, 21 Apr 2026 18:10:21 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Alexey Charkov <alchark@flipper.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Pavel Zhovner <pavel@flipper.net>, 
	Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH RFC 0/4] arm64: rockchip: The hunt for exact pixel clocks
 on RK3576
Message-ID: <20260421-quirky-tough-robin-817a1c@houat>
References: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
 <aeKtNf8CCAWduI-f@venus>
 <aeZOMnZfBcBHzR8c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ztvsum3prbyokpn3"
Content-Disposition: inline
In-Reply-To: <aeZOMnZfBcBHzR8c@redhat.com>


--ztvsum3prbyokpn3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 0/4] arm64: rockchip: The hunt for exact pixel clocks
 on RK3576
MIME-Version: 1.0

Hi Brian, Alexey,

On Mon, Apr 20, 2026 at 12:02:58PM -0400, Brian Masney wrote:
> On Sat, Apr 18, 2026 at 12:24:57AM +0200, Sebastian Reichel wrote:
> > On Fri, Apr 17, 2026 at 07:11:43PM +0400, Alexey Charkov wrote:
> > > Dear all,
> > >=20
> > > Need the help of the collective wisdom of the community.
> > >=20
> > > The problem I'm trying to solve is reliably obtaining the exact pixel
> > > clock for arbitrary display modes supported by the RK3576 SoC.
> > >=20
> > > Rockchip RK3576 has three display output processors VP0~VP2, each
> > > supporting different ranges of display modes, roughly as follows:
> > > - VP0: 4K 120Hz
> > > - VP1: 2.5k 60Hz
> > > - VP2: 1080p 60Hz

Do any of those have an additional multiplier or divider after the PLL?

I'm asking because 4k@120Hz is 1188MHz, and 1080p@60Hz is 148.5 (so 1188
/ 8). 2.5k @ 60 might be a bit more problematic, but my point is that
for HDMI/DP, most resolutions all have a pixel clock that are multiples
of 148.5MHz.

If you manage to get the PLL to the highest you need (1188MHz), and then
apply dividers, you don't need to change the PLL frequency anymore.

> > > Each one obviously needs a pixel clock. The required frequencies for =
the
> > > pixel clocks vary greatly depending on the display mode, and need to =
be
> > > matched within a tight tolerance, or else many displays will refuse to
> > > work. E.g. the preferred (maximum) display mode out of VP1 is particu=
larly
> > > awkward, because it requires a pixel clock of 248.88 MHz, which cannot
> > > be obtained using integer dividers from its default clock source (GPLL
> > > at 1188 MHz), and the nearest approximation is 237.6 MHz, which is we=
ll
> > > outside the tolerance of e.g. DP specification, resulting in a blank
> > > screen on most displays by default.
> > >=20
> > > The clock sources are of course configurable, in particular there are=
 muxes
> > > connected to each VP for selecting the source of the pixel clock:
> > > - Each VP can take the clock either from the (single!) HDMI PHY or fr=
om
> > >   its dedicated dclk_vpX_src mux
> > > - The dclk_vpX_src mux can select the clock from a number of system P=
LLs
> > >   (GPLL, CPLL, VPLL, BPLL, LPLL)
> > >=20
> > > While the system PLLs can be configured to output a wide range of
> > > frequencies, they are shared between many system components. E.g. on =
the
> > > current mainline kernel on one of my RK3576 boards I've got the follo=
wing:
> > > GPLL: 1188 MHz, enable count 20
> > > CPLL: 1000 MHz, enable count 17
> > > VPLL: 594 MHz, enable count 0 (yaay!)
> > > BPLL, LPLL: 816 MHz, enable count 0 (but these last ones don't have
> > >             predividers, so are less flexible)
> > >=20
> > > So ultimately there is exactly one free fractional PLL (VPLL) which c=
an be
> > > used to generate arbitrary pixel clocks, but we have up to three cons=
umers
> > > trying to drive different display modes from it (e.g. HDMI on VP0, DP=
 on
> > > VP1 and MIPI DSI on VP2). We also want to be able to adjust the PLL o=
utput
> > > frequency on the fly to satisfy the requirements of the selected disp=
lay
> > > mode.
> > >=20
> > > And this is where I'm stuck. Trying to satisfy the requirements of up=
 to
> > > three consumers while changing the PLL frequency on the fly sounds li=
ke
> > > a poorly tractable mathematical problem (is it 3-SAT?). We can take t=
he
> > > HDMI output out of the equation, because it can be driven from the HD=
MI
> > > PHY (which is capable of arbitrary rates) instead of the mux, but that
> > > makes the decision of which dclk source to use for a VP block depende=
nt on
> > > which downstream consumer is connected to it (HDMI vs. something else=
).
> >=20
> > It becomes more messy: The HDMI PHY cannot be used as clock source
> > for modes exceeding 4K@60Hz.
> >=20
> > > Even then we somehow need two devices to cooperate in picking a PLL
> > > frequency that satisfies the requirements of both of them, and change=
 to it
> > > without display corruption. I'm not even sure if the CCF has mechanis=
ms
> > > for that?..

It's not *just* the CCF though. You will disrupt the other, already
active display, which might affect the user because the screen will
blank, throw off the vblank timings and thus userspace, etc.

Brian's solution is great progress on that front already, but if you can
just save yourself the trouble, I'd advise you to do that instead :)

Maxime

--ztvsum3prbyokpn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaeehZgAKCRAnX84Zoj2+
drVDAYCpi1fbbCrj7/fukwguBw+orWqj+TZdDDch1wnLZurGU7hawtgbd28GdIza
YvEwTVEBgODCe1okmRECm4S0EQxaLei/ii/Opfn1eD7wHOutqGPIMgwTjOaw918u
mSbC0Y2DbA==
=HbxP
-----END PGP SIGNATURE-----

--ztvsum3prbyokpn3--
