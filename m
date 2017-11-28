Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:54477 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750975AbdK1I7g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Nov 2017 03:59:36 -0500
Date: Tue, 28 Nov 2017 09:59:21 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Priit Laes <plaes@plaes.org>, Icenowy Zheng <icenowy@aosc.io>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH v2 11/18] drm/sun4i: Add A83T support
Message-ID: <20171128085921.gyvbpmvhwzvchjkf@flea.home>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
 <1c4f6b275597dec7d97b5c1d9f749ba27c0610f3.1511797218.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v67iWKJXE8oVEgTQcamaG-UKkunCLJbZWZyM3SPSHkU7BA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mwkojc2xmxvm4zgp"
In-Reply-To: <CAGb2v67iWKJXE8oVEgTQcamaG-UKkunCLJbZWZyM3SPSHkU7BA@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--mwkojc2xmxvm4zgp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 28, 2017 at 12:19:44AM +0800, Chen-Yu Tsai wrote:
> On Mon, Nov 27, 2017 at 11:41 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Add support for the A83T display pipeline.
> >
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 3 +++
>=20
> Rob mentioned that he'd like to see these multiple one-liners be
> in a separate patch.

I'll change that.

>=20
> >  drivers/gpu/drm/sun4i/sun4i_drv.c                             | 2 ++
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c                            | 5 +++++
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c                           | 4 ++++
> >  4 files changed, 14 insertions(+)
>=20
> Also not sure why you have two patches with the same subject.

Yeah, it's a rebase gone wrong... The second one was meant to be
folded into this one.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mwkojc2xmxvm4zgp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlodJWYACgkQ0rTAlCFN
r3QxNBAAhNF3jU5gA3jvH8KvUey7sAFsPKm27oKq5OfEb7jX849BiW9tDzPKchDd
8+9IGulyJ86I1EmlIHN4QfegoiMKHCQnlW0umyD7gz6gDbToDtAPg/q2DPVLwzwW
cTB2w2u76w0wjlK7yddmTKY/ElGLd2J3wuuoLuHyZS/RlB7CfUyHt6OX2YneA8zP
gBVlrt9kur8Gz4uHCnNrDO4siV4OhgLkt6Lc9JguDB2k/QwEQoh9o9mmVPCYw3Ka
r5cvwSBJhgap3x4RXCk+qJH3ZskCJkVbIYzDrILOXugcBJ/yuC/GG9ruarKa2xpb
wRjim9wq2D+46wHqxSlq6QPTlfgpYd8nWS7kyAwEu+KV7jgHjlLlkqHoASxNlAml
BZlzIBoeU0XUsuptpBttbVbJQawr+90OQ48yuKO6Qqi0VMDKIQ1Iwaa4msnR0/Br
JH/D+VFA0fZTEA7vDm1Vd4yRJdO+ZqjJ5lD5CMBEWLxwtrafK7/Yd+QIPcNJbqjp
4tLe8GPiT3td5kSrg1exdk9uFLjHA5+6ny+q0u/Kz8clfCtA7T4deAiFLKlM7mt/
KAC0E5gr6JIkT0t8oRqvXQzSND0qPzgOPurtGnErpON2+71KNF4YXlYlbapVSHXU
DubOxHljryDZQbQD2rSxE+kjGNe58rQFza4IYGL7QaZBM/jQLmw=
=LO6V
-----END PGP SIGNATURE-----

--mwkojc2xmxvm4zgp--
