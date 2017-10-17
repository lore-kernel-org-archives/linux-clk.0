Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:42275 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752540AbdJQOiI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Oct 2017 10:38:08 -0400
Date: Tue, 17 Oct 2017 16:38:06 +0200
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
        Quentin Schulz <quentin.schulz@free-electrons.com>,
        Mylene Josserand <mylene.josserand@free-electrons.com>
Subject: Re: [PATCH 05/23] drm/sun4i: tcon: Don't rely on encoders to enable
 the TCON
Message-ID: <20171017143806.yrloimhpzioo7sk6@flea.lan>
References: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
 <90b4396e19b3eca61b2ebfdae0672074b88ad74d.1508231063.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v66AAVv+mMcEyiF36OteyYxr82kt78XXR5p0HkymJFF3Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="m6g7l7rk5ke7irz3"
In-Reply-To: <CAGb2v66AAVv+mMcEyiF36OteyYxr82kt78XXR5p0HkymJFF3Tw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--m6g7l7rk5ke7irz3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 05:28:42PM +0800, Chen-Yu Tsai wrote:
> On Tue, Oct 17, 2017 at 5:06 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > So far, we've required all the TCON-connected encoders to call the TCON
> > enable and disable functions.
> >
> > This was made this way because in the RGB/LVDS case, the TCON is the CR=
TC
> > and the encoder. However, in all the other cases (HDMI, TV, DSI, etc.),=
 we
> > have another encoder down the road that needs to be programmed.
> >
> > We also needed to know which channel the encoder is connected to, which=
 is
> > encoder-specific.
> >
> > The CRTC's enable and disable callbacks can work just fine for our use
> > case, and we can get the channel to use just by looking at the type of
> > encoder, since that is fixed. Implement those callbacks, which will
> > remove some of the encoder boilerplate.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--m6g7l7rk5ke7irz3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ5hXOAAoJEBx+YmzsjxAgvqsP/jWzuoTfv1CJrnboTtkOwyFU
b7/cMVb6IyGgK6TDI/vTmjS0kbTBve2yedfWV8V3HBX1/5rb/lshucblHYuEiJ99
SJHv6nEIAunBPnJ2VytzVBRlrFoJuMnMJASu6uBDVkZaTHxqTkzAtOTWea9BJa1x
dMXRHKNHuSgn0/y1cGlIrhEeIQoOBuhrSv10gxmGoRPwSzjq+okUvY1qgT//U073
R9Atgs9KDZDtAI96suV4/pPCIzOYWtN6Ge0QvmVzC3IGj1ivBUcXrbAq0XMdf46E
NWiCgIp2DkxxVo/D4mLt8AfJEqhWLse2kUvihak53+GOs/CqlC8BpCCXWyWxXKOA
I53jhtaWcAlRUZBNB1FbMpdmQoJn2tqwVAE6CjzXGDZzbzR0h4cph82RiFoRU6gW
qnZyDtgrU15fuIWoSXpI5qIyZkeW64ktMPz9c1wp01/nVdOj2o4R+yDr3obrF8zj
iGW878rA9VzTSeeKeW3dg9hXKt+tM+N1dpWrYXfx19Pl1zxBOPRfpPsY6wGjALtd
gGilRAxjCNRN6D30mLrIlDayrFjxQOqTzQ2AE4+j5kkHOB/5r4VIGqbBOC/naoCp
mv+ltdRF20BBwAAiL7op4q9c7CX8cARsn3Eh3LORpPm2HoLYmLVK1mUy+8ujbBm/
b1fZ3QQqBguPl3kA1Ach
=scAW
-----END PGP SIGNATURE-----

--m6g7l7rk5ke7irz3--
