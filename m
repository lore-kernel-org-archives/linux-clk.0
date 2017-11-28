Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:45707 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751673AbdK1WAQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Nov 2017 17:00:16 -0500
Date: Tue, 28 Nov 2017 23:00:14 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        plaes@plaes.org, icenowy@aosc.io,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v2 11/18] drm/sun4i: Add A83T support
Message-ID: <20171128220014.w35rcliusubfdvoe@flea.home>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
 <2744508.m82qQEPny3@jernej-laptop>
 <20171128090223.mqp3v2t6koyu6hk4@flea.home>
 <2908242.WKit1ZIWoJ@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="p2xotp675tdanwch"
In-Reply-To: <2908242.WKit1ZIWoJ@jernej-laptop>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--p2xotp675tdanwch
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable



On Tue, Nov 28, 2017 at 04:48:55PM +0100, Jernej =C5=A0krabec wrote:
> > On Mon, Nov 27, 2017 at 05:01:49PM +0100, Jernej =C5=A0krabec wrote:
> > > Dne ponedeljek, 27. november 2017 ob 16:41:35 CET je Maxime Ripard=20
> napisal(a):
> > > > Add support for the A83T display pipeline.
> > > >=20
> > > > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > > > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > > > ---
> > > >=20
> > > >  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 3 =
+++
> > > >  drivers/gpu/drm/sun4i/sun4i_drv.c                             | 2 =
++
> > > >  drivers/gpu/drm/sun4i/sun4i_tcon.c                            | 5 =
+++++
> > > >  drivers/gpu/drm/sun4i/sun8i_mixer.c                           | 4 =
++++
> > > >  4 files changed, 14 insertions(+)
> > > >=20
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > > > b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt ind=
ex
> > > > d4259a4f5171..d6b52e5c48c0 100644
> > > > --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > > > +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > > >=20
> > > > @@ -93,6 +93,7 @@ Required properties:
> > > >     * allwinner,sun6i-a31s-tcon
> > > >     * allwinner,sun7i-a20-tcon
> > > >     * allwinner,sun8i-a33-tcon
> > > >=20
> > > > +   * allwinner,sun8i-a83t-tcon-lcd
> > > >=20
> > > >     * allwinner,sun8i-v3s-tcon
> > > >  =20
> > > >   - reg: base address and size of memory-mapped region
> > > >   - interrupts: interrupt associated to this IP
> > > >=20
> > > > @@ -224,6 +225,7 @@ supported.
> > > >=20
> > > >  Required properties:
> > > >    - compatible: value must be one of:
> > > > +    * allwinner,sun8i-a83t-de2-mixer
> > >=20
> > > What will be the name of the second mixer, once support for HDMI is a=
dded?
> > > Should we start directly with 0 and 1 postfix ?
> >=20
> > What are the differences exactly without the two mixers?
>=20
> Mixer properties:
> - mixer index (0 or 1), important for determining CCSC base (see my patch=
es)

Is that the only thing we need to determine?

> - number of VI planes (usually 1)

Usually or always?

> - number of UI planes (usually 1 or 3)

Same question.

> - writeback support (yes/no)
> - scale line buffer length (2048 or 4096)
> - smart backligth support (yes/no)
>=20
> channel properties (for both, VI and UI):
> - scaler support (yes/no, usually yes)
> - overlay count (seems to be always 4)
> - VEP support (yes/no)
>=20
> Those are properties found in BSP de_feat.c, so I guess that's enough to =
make=20
> any kind of decision in the code.
>=20
> Usually, but we can't count on that, first mixer has 1 VI and 3 UI planes=
 and=20
> second mixer has 1 VI and 1 UI plane.

Right. So that would be easy to support using a property as well. The
only difference would be the CSC base.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--p2xotp675tdanwch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlod3GkACgkQ0rTAlCFN
r3QbJw//Ua/0uSmn61/4S5wshtrd9LD1GdRuJkpZueBdqUIplRj5HcpWLG7BBnBu
wyOK/j9UE7M85fti3BrYLnISJh3OOE1dvu683TwblY2GYTg7WJatCpGZq/MNkmDX
Mu9QfQDDKvKWk4WCGn8zRK/bozhTrMvnFT/7YWODMEa/ommx7cw+R9zUOiCkdYsf
10jnRkP6DBMlOhOkGds1bPapTL+qn+e9dJxKHPNsp8jw9a9cBkUBsaUIuII10iTg
zNpFmIAqHcbnkH1Bq2rA/anm0wROaDTJ4HlvqPaPAvGvDhwK/aHCGDyH5DK8XeGh
kFJcb3rWR01dEUfCCXmdMocPT94tJeA+X0IFqRVdFnuAnsxFxDxc3Iq6emudyJ+V
MTkt6nsXU5CueU+6JgTS6Tl6P5Wv53wq6KXzNfjKBjUprpdkSvcDhACKdZcfealo
I84AwRr8IiCsiyfdbwOzjANZEkzvdtiaRdgDtejyR5AeIR7+oYJoCyb1Q8EwMzgn
46Y7YZMSmGSdEc06LwiX9FZBbKuhZ092lTP9HgFutFynDymDlGROBGkVlrXLGtnQ
UlvudmWLV4s2lpqFdE2r1VnNfFnJptCS6AkdzRQ9PAK3T8/XF4bClswGePnqOTzZ
HPIviU+PWuKKSVP194gOhEdeYiFeofnXCjTW5DUA1JTYM98pKHc=
=rYFk
-----END PGP SIGNATURE-----

--p2xotp675tdanwch--
