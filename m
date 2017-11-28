Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:37872 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753422AbdK1PrI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Nov 2017 10:47:08 -0500
Date: Tue, 28 Nov 2017 16:46:57 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        plaes@plaes.org,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v2 11/18] drm/sun4i: Add A83T support
Message-ID: <20171128154657.cibnwdptkq36lj4l@flea.home>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
 <1c4f6b275597dec7d97b5c1d9f749ba27c0610f3.1511797218.git-series.maxime.ripard@free-electrons.com>
 <2744508.m82qQEPny3@jernej-laptop>
 <20171128090223.mqp3v2t6koyu6hk4@flea.home>
 <2edae31575bbdb5abe989ad3b9d403a7@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5t5adat7xcbbjrmg"
In-Reply-To: <2edae31575bbdb5abe989ad3b9d403a7@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--5t5adat7xcbbjrmg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2017 at 07:50:19PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2017-11-28 17:02=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > Hi,
> >=20
> > On Mon, Nov 27, 2017 at 05:01:49PM +0100, Jernej =C5=A0krabec wrote:
> > > Dne ponedeljek, 27. november 2017 ob 16:41:35 CET je Maxime Ripard
> > > napisal(a):
> > > > Add support for the A83T display pipeline.
> > > >
> > > > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > > > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 3 =
+++
> > > >  drivers/gpu/drm/sun4i/sun4i_drv.c                             | 2 =
++
> > > >  drivers/gpu/drm/sun4i/sun4i_tcon.c                            | 5 =
+++++
> > > >  drivers/gpu/drm/sun4i/sun8i_mixer.c                           | 4 =
++++
> > > >  4 files changed, 14 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-=
drm.txt
> > > > b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt ind=
ex
> > > > d4259a4f5171..d6b52e5c48c0 100644
> > > > --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > > > +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > > > @@ -93,6 +93,7 @@ Required properties:
> > > >     * allwinner,sun6i-a31s-tcon
> > > >     * allwinner,sun7i-a20-tcon
> > > >     * allwinner,sun8i-a33-tcon
> > > > +   * allwinner,sun8i-a83t-tcon-lcd
> > > >     * allwinner,sun8i-v3s-tcon
> > > >   - reg: base address and size of memory-mapped region
> > > >   - interrupts: interrupt associated to this IP
> > > > @@ -224,6 +225,7 @@ supported.
> > > >
> > > >  Required properties:
> > > >    - compatible: value must be one of:
> > > > +    * allwinner,sun8i-a83t-de2-mixer
> > >=20
> > > What will be the name of the second mixer, once support for HDMI is
> > > added?
> > > Should we start directly with 0 and 1 postfix ?
> >=20
> > What are the differences exactly without the two mixers?
> >=20
> > I was hoping to be able to cover them all using properties, indices
> > are usually pretty badly received in compatibles.
>=20
> 1. VEP is only available on the VI channel in mixer0. (VEP may mean
> Video Enhance Processor)
> 2. Smart Backlight is only available in mixer0's on SoCs with LCD.
> 3. Writeback function is only available in mixer0.

Then yeah, we can totally support that using properties.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--5t5adat7xcbbjrmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlodhO0ACgkQ0rTAlCFN
r3SzQQ//dHHdJ3B0kfBBIKxukoFvkcqSLlTvzpfNx1i93qIWzAwfyCT5rb4WJ7xY
Fyqs30722eIJ6cLtHnlPV3el1Km8WB1jKoJYIPDbOCPixJz1PHvCy/F5DBsiIC2M
mycx1ad5PqPMeQwy4w9lnqMHxJBHZbjnhUA422oc3W7t5zhX5xNxqwFLfQQ1gh+B
6q66sBrEYe6X0VF7c3RHtXK3ZADCJwH8BjZOH6TkhA+J8PJ/6hpjjTfR39o0CtUD
Imh2VFaqAaR8lc9w/klyCRz3FI6WDT9UkNc6OtLmnWtRsFoMP3rGihpUeShiOjSC
pbRNnWXMtumS0U+DIrSrD5GQ67Z/stAp3uPH+dRVRlSJko2dCJo62Z+sEJotjZCM
pBIh9lJk83aXgoVw/nkAScE0ARpivVmY8JnGkc0yJSgMyBC/4sj/JmsPaRsjfs9N
8J8QFnzYCn6lVaqLkmFQKTucZX4yGgPFl/xX60S8RGOA/ONdOW53xX7H3hcMhE4Q
rMMzrkPd8yu/+dK0gd/YIsS+F7zjNED4srPaaYva0hFL4NBMmD2ZMGDLjQeyOKFP
HEOGspLIj1nlMscryMJ+kK7YnUTfomy27hVmUPV76kaBP3kvZs5SPbq8LtoJJ9hX
eMYSlCZP44KHRbpUbNatsamQBE9pBQyRTegWkO2q6KsNzn5wJG8=
=jq6u
-----END PGP SIGNATURE-----

--5t5adat7xcbbjrmg--
