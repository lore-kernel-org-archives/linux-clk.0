Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:44676 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751753AbdFMHlk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2017 03:41:40 -0400
Date: Tue, 13 Jun 2017 09:41:28 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [linux-sunxi] Re: [PATCH v2 01/11] dt-bindings: update the
 binding for Allwinner H3 TVE support
Message-ID: <20170613074128.q4mhf46gogn6jhvl@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-2-icenowy@aosc.io>
 <20170607084544.kgclybyxxttfk3ko@flea.lan>
 <092D4797-0034-4C39-A30A-92CFAB23AAF8@aosc.io>
 <20170609164915.enap3epreg5vr2gy@flea.home>
 <53E8FC74-8AC0-461A-B875-812EE4A3267E@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="w5ohdwsyzrw47olh"
In-Reply-To: <53E8FC74-8AC0-461A-B875-812EE4A3267E@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--w5ohdwsyzrw47olh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 10, 2017 at 12:51:02AM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B46=E6=9C=8810=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
12:49:15, Maxime Ripard <maxime.ripard@free-electrons.com> =E5=86=99=E5=88=
=B0:
> >On Wed, Jun 07, 2017 at 04:48:50PM +0800, Icenowy Zheng wrote:
> >> >> @@ -189,6 +211,8 @@ supported.
> >> >>  Required properties:
> >> >>    - compatible: value must be one of:
> >> >>      * allwinner,sun8i-v3s-de2-mixer
> >> >> +    * allwinner,sun8i-h3-de2-mixer0
> >> >> +    * allwinner,sun8i-h3-de2-mixer1
> >> >
> >> >Again, please explain why we need to have different compatibles
> >> >here. If it's only about the number of planes, this should be dealt
> >> >with a property, not a compatible.
> >>=20
> >> Only mixer0 has "VEP" and write-back support, at least on H3.
> >
> >What is that VEP? writeback support can also be expressed by a
> >property.
>=20
> I don't know what VEP is...

Ok. Let's forget about it at the moment then, especially if it's
optional, we can add support for it later.

> But we are really facing different cores, like sun50i-a64-mmc
> and sun50i-a64-emmc.

Not really. The eMMC and MMC controllers are *very* different. They
behave (slightly) differently, the eMMC controller has more signals
(8-bit bus, data strobe), can run at a higher frequency. You cannot
have exactly the same driver (or rather code path) to handle
both. Therefore the need for some other compatible.

This is not the case for the mixer here. The thing that differs
between instances is not behaviour but data. And we provide most of
the data through DT.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--w5ohdwsyzrw47olh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZP5coAAoJEBx+YmzsjxAg/PUQAIq24iosJhBWfqs/Wpe0q/cS
+Fvx2UK4lPd3NzfbM0JWBS+lhkz8W7aNmVIhIBh0Cf2/gAnDnIRYzHB0p3GeVfLQ
JLwyfmdXRysr3mZ6p2N6MtAuUpHDA6CIaByxFVGGO5plzjk73ZoORlJtMfawqyyU
Iu6vfQ6gXoThDrVoFJyYcRXk7HnYB2X4oZzaBn3MgYL8+pk9mGPyqboKoHgBCTag
pl4QetGGDm025Xh3iP1ojCwI0dQrIY91qUh/pFYwZrhCzS0zYRlVRhSKy/BQKG9/
hPt0ARnB0O8nV39OQyPvLu7QLSiBMqtPXtBD7q9w9/QrWXs4EVAberpxopcg1VCH
kPZiP22oOVIMYhVgG+MJv2IyHdOZ2LyjF+xezLDSgOZk/sOiY+0sA8b7E06ph7xQ
zo/RTXCBLyah9QKoxdhMhHCcBapx341HrLD8U/6JMZcdaWhwCUXVnElVKgpmwhNF
Kx4Ais9lPCiWxURRNrPItkPaerEZzEa9Pn8BeyWefXDIAno3k1yFykc9VmM79j0f
6XaibWk30p3n6J/nXQJnYyUgi8r/KrLecVEfAWXJatGwzX0a3YJp5Q7H79YFvSlI
V6mC+iCLVkjHTgD3qwvlYySVi7tXdIcoqN68VBpGmIvuX9L8AB8Hv3qXeX0MJ4sx
CXIPFBBqPGN7LwcUeGE+
=8PjL
-----END PGP SIGNATURE-----

--w5ohdwsyzrw47olh--
