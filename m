Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:37844 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753161AbdK1PqW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Nov 2017 10:46:22 -0500
Date: Tue, 28 Nov 2017 16:46:10 +0100
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
Subject: Re: [PATCH v2 00/18] drm/sun4i: Add A83t LVDS support
Message-ID: <20171128154610.62mnmaqkvaxksggy@flea.home>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
 <2681268.ePd4u43rOS@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i663vzhvtvlyqyzr"
In-Reply-To: <2681268.ePd4u43rOS@jernej-laptop>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--i663vzhvtvlyqyzr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jernej,

On Mon, Nov 27, 2017 at 05:20:52PM +0100, Jernej =C5=A0krabec wrote:
> Hi,
>=20
> Dne ponedeljek, 27. november 2017 ob 16:41:24 CET je Maxime Ripard napisa=
l(a):
> > Hi,
> >=20
> > Here is an attempt at supporting the LVDS output in our DRM driver. This
> > has been tested on the A83T (with DE2), but since everything is basical=
ly
> > in the TCON, it should also be usable on the older SoCs with minor
> > modifications.
> >=20
> > This was the occasion to refactor a bunch of things. The most notable o=
nes
> > would be the documentation, and split of the UI layers in the mixer cod=
e,
>=20
> I'm just about to send my series of patches which would add full support =
for=20
> UI and VI planes (multi planes, HW scaling, all color formats). It would =
clash=20
> with your patches 6, 7 and 8.
>=20
> Preview of my work as a single patch can be seen here:
> https://github.com/jernejsk/linux-1/commit/
> 8fdef3b510b567bfe81c87b0c3e73ddcf4f5b711
>=20
> How would you like to handle that? Some changes are similar, but I don't =
see a=20
> point rebasing my patches atop of yours.
>=20
> Since I'm almost done, I will just send them and we can discuss them then.

Yeah, I had a quick look at it and it doesn't look like it conflicts
too much. I'll have a closer look as soon as I can, but I guess we can
just go in parallel and whoever hits first wins.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--i663vzhvtvlyqyzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlodhL8ACgkQ0rTAlCFN
r3TUeg/8C6Qm+SuJ7QPqIl+VN/EUKP6v70ZJbdBl6pEXh9yxuXiPTkXhOerAVJXJ
mZPL4iVXN+bItp0Gda1dah5lgC6k3mrTZubluP9tUsEtuklBDD5oHx5nD8cEtnNX
wrU/LbZS59T6unDNlTzHWIEXshcKrX+BHnZp//8qUw9jlfL6aSKcrM4cmEbpc2Tr
O3ka8OT3U+JBEIPGLxYc1G3P3FgEaCU4Bglqa6DUmN0P7B5puBahu2MVATVGNeBQ
h1WXpYEAf+G0whBPCatZkCIVX/XutifuiAKLBiGURcbNa/S1TDZKGEVoFp1sWE3E
VGp64nwSEVJo3fMxyukl/4EVopHbu9t0QDtpNWxg2JLczBwQRv13qKDW6pI5q/Hf
GZC0hhL1XUcTIrW3d0J30ipdrDQjfY4frfKV6mlyv0Mc4/ixsATTj39vkGGZ22ft
oL1vyQUBU3aRmvKoFZ1djsvr9g9iHySRzg2hbfNvU81yviYxjQehBCToVQzgmm9z
yLZcIbtV/3G5t2Ap3JXuu/TKrFsznsNciKQcns5MRJZidPIwhinVwmOSsN95juap
g77jOQR+0okB91m+jZxY7eX0gMhU+0uq4xk9BiYqD/rbrEfRrM3b0IYrK7pVghDM
FRW2Ab89qu8Vc9QOhI7ZT5LLK5xIyffDz7JgC3PDS4BPSLQIKhw=
=W068
-----END PGP SIGNATURE-----

--i663vzhvtvlyqyzr--
