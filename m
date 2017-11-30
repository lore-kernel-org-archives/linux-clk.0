Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:35969 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752481AbdK3PaE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Nov 2017 10:30:04 -0500
Date: Thu, 30 Nov 2017 16:30:02 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Priit Laes <plaes@plaes.org>, Icenowy Zheng <icenowy@aosc.io>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH v2 01/18] dt-bindings: panel: lvds: Document power-supply
 property
Message-ID: <20171130153002.3vuqenr72dippg27@flea.lan>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
 <583a46dd967456aac07fb29529f74d91a10bdfeb.1511797218.git-series.maxime.ripard@free-electrons.com>
 <CAL_Jsq+PHzDGE_RreBmVZV+sg3dh5OG2vWZU+eobxF514Fpo_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="72crcjtjbgotvxqt"
In-Reply-To: <CAL_Jsq+PHzDGE_RreBmVZV+sg3dh5OG2vWZU+eobxF514Fpo_w@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--72crcjtjbgotvxqt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Tue, Nov 28, 2017 at 11:48:47AM -0600, Rob Herring wrote:
> Please CC DT list.
>=20
> On Mon, Nov 27, 2017 at 9:41 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The power-supply property is used by a vast majority of panels, includi=
ng
> > panel-simple. Let's document it as a common property
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  Documentation/devicetree/bindings/display/panel/panel-common.txt | 6 +=
+++++
> >  Documentation/devicetree/bindings/display/panel/panel-lvds.txt   | 1 +
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-comm=
on.txt b/Documentation/devicetree/bindings/display/panel/panel-common.txt
> > index ec52c472c845..125ea68052af 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-common.txt
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-common.txt
> > @@ -78,6 +78,12 @@ used for panels that implement compatible control si=
gnals.
> >    while active. Active high reset signals can be supported by invertin=
g the
> >    GPIO specifier polarity flag.
> >
> > +Power
> > +-----
> > +
> > +- power-supply: many display panels need an additional power supply in
> > +  order to be fully powered-up. For such panels, power-supply contains
> > +  a phandle to the regulator powering the panel.
> >
> >  Backlight
> >  ---------
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds=
=2Etxt b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> > index b938269f841e..250850a2150b 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> > @@ -32,6 +32,7 @@ Optional properties:
> >  - label: See panel-common.txt.
> >  - gpios: See panel-common.txt.
> >  - backlight: See panel-common.txt.
> > +- power-supply: See panel-common.txt.
>=20
> simple-panel.txt should do the same.

I'll make simple-panel do that then

> Really, I'd like to see panel-common.txt and simple-panel.txt merged
> and simple-panel.txt removed altogether. But there are a lot of
> references back to simple-panel.txt. A given panel still needs to say
> what common properties it uses or doesn't use. Omitting a property
> like power-supply is ambiguous and can either mean "I only have 1
> supply" or "I haven't thought about supplies yet there are more than
> 1".

While I agree with you here, and in general, power-supply should be
mandatory, do you expect me to fix all the panel bindings as part of
this serie?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--72crcjtjbgotvxqt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlogI/cACgkQ0rTAlCFN
r3TNeA/+NAuFzUGbzPGk0SizgIDU3PrJ7YpgJaZ135bpz40NfMB0MxpSsDTbNTtk
YZVATvD2Lhv8hXpm960zIijiBJYAZHtUQLVyqg0m/oEnB657bZ2cZ6yqS1wAoypD
1HEfqPmtXGsPyxyTCkNmZM42dkcB5BEZ6SHNYGxHKs84JlO1Aww/SjFHf4rl0R5G
G58d/mALtayG1mv1cWy9iO7wy5XMOYhHCXQvCoalOL1/3XpZJst5tqY/++JvPHKa
1NoJVFtEU5citveugi40nI9M8u6eOVIRoW8DJwf8VUW4GX679R6nnAloMqaL3Noc
SZ5HISmZBVtN7qjghNbZSGvYbPLU1JueU5R5fkVsJZH1IKo66Gh8Z154nBcH7dRb
AVq+ROoi58PNGj8M8YyUrtT1EoFz3BcCszD2jmieFcQ7x0Q4t53IdBQbPmINp/qi
9fYTVyKe9zeCRzLXlcxd7RUOnj7GD0DVfKajjXmF8Jlm1PrIHMmRM5wnN2k0CvmF
QRH3Ffm/bVz+B6u7CpaUiRIouXcXPeWBiq9bvgtq75DlP/0UiSNY6wxubCFVPqKP
3tK3jCM2Fi9fuG40HefrgcNqV8IWI9nXkWYCCUXyhv79VI5ahgKfLL5napMhvBXY
2TgQo1CDQtQlUkwNzFpEro98chqRmpBw6LFygKyPBMnH8LQgq88=
=saCg
-----END PGP SIGNATURE-----

--72crcjtjbgotvxqt--
