Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:37337 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933106AbdK2PzP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Nov 2017 10:55:15 -0500
Date: Wed, 29 Nov 2017 16:55:13 +0100
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
Subject: Re: [PATCH v2 05/18] drm/sun4i: Force the mixer rate at 150MHz
Message-ID: <20171129155513.vf3i7lkticvucr3s@flea.lan>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
 <9630064.mDmGGWOQGt@jernej-laptop>
 <20171128085826.snmflonvbic5put3@flea.home>
 <2326800.o3FEWRaSfH@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="q46wa4n5scekor7b"
In-Reply-To: <2326800.o3FEWRaSfH@jernej-laptop>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--q46wa4n5scekor7b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2017 at 10:56:31PM +0100, Jernej =C5=A0krabec wrote:
> Hi!
>=20
> Dne torek, 28. november 2017 ob 09:58:26 CET je Maxime Ripard napisal(a):
> > On Mon, Nov 27, 2017 at 05:07:04PM +0100, Jernej =C5=A0krabec wrote:
> > > Hi Maxime,
> > >=20
> > > Dne ponedeljek, 27. november 2017 ob 16:41:29 CET je Maxime Ripard=20
> napisal(a):
> > > > It seems like the mixer can only run properly when clocked at 150MH=
z. In
> > > > order to have something more robust than simply a fire-and-forget
> > > > assigned-clocks-rate, let's put that in the code.
> > > >=20
> > > > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > > > ---
> > > >=20
> > > >  drivers/gpu/drm/sun4i/sun8i_mixer.c | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > b/drivers/gpu/drm/sun4i/sun8i_mixer.c index cb193c5f1686..c0cdccf77=
2a2
> > > > 100644
> > > > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > @@ -315,6 +315,13 @@ static int sun8i_mixer_bind(struct device *dev,
> > > > struct
> > > > device *master, }
> > > >=20
> > > >  	clk_prepare_enable(mixer->mod_clk);
> > > >=20
> > > > +	/*
> > > > +	 * It seems that we need to enforce that rate for whatever
> > > > +	 * reason for the mixer to be functional. Make sure it's the
> > > > +	 * case.
> > > > +	 */
> > > > +	clk_set_rate(mixer->mod_clk, 150000000);
> > > > +
> > >=20
> > > H3 mixer works at much higher rate and if we want to support tv out, =
it
> > > must be dividable by 432 MHz, so either 432 MHz or maybe even 864 MHz.
> > >=20
> > > We talked about that few months ago.
> > >=20
> > > I guess this should be read from mixer configuration structure.
> >=20
> > That works for me. Actually, I didn't need it at all for the LVDS
> > output on the A83t, the default seems to work just fine. Do you know
> > what it's related to? Maybe we can make that a bit more dynamic?
>=20
> There doesn't seem to be any rule to determine which frequency is best, e=
xcept=20
> on H3. Obviously, it must be high enough to process data for current=20
> resolution, which means 150 MHz should be just enough for 1920x1080@60Hz.=
 I=20
> guess we should just check BSP configuration and use same rate since AW=
=20
> engineers may know something we don't.

Yeah, that makes sense. And the fact that it's in the kernel allows us
to change for something smarter when we want (and if we need) to.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--q46wa4n5scekor7b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAloe2F4ACgkQ0rTAlCFN
r3S8pQ//SmNLII+a7hIG4jg5fhyeOAyY2Gq+dH+hthRZNvUQ47IFmO5Y6uMmO6pS
2ugcLuvrfh0dmU0Udez10PokTS8ki936eHEetRUP+An10B+FX4vvmvPSg+JXUO6B
AcykVRWnH1cYYYAcTimYlC2jV32sLaGbvm8hBcuBRVB7ZqVqE2Oot7PY+J2dLbNV
KeLzBQ9w8kCdcNZmFhCnfnEpvtYzTCGY4ZqwXwiQXcV1ELDftfjd+e/ZZy64/kVh
3DMIcYUlMxYd6NCrBi7Bvy/0NfLFUgxJxmQnCY0+L1/SpgRBYQwVPrZBVprchaZk
NQdY9hIT0gjAJTubNTHq9s8QVVpvPhzmhm8fQVSnz9fhPwy76UvMxnvGnG1CLs7x
C3RfsHG4plIrFkYWb3dwG4svM/4/qFxMRA5uYNm5RLRKY6bT22MXxTL0R5/MtGzw
8EUrOBNhGOwpMqHI8K16B1wphHv9htHEVaWnwJzNNZbJzWuLGefviI7LdMjsCkaJ
JUjYSecvr9eCqDdWH+fZEB6qhCHpgaB6noe3PpIFA+qYI9RnWEiC2rsjtEvu345C
kofZ/g0YTenYHnO1A2pFnmCWNCcGUqmEnR6Qs9Qg5aipTidoR+yhGUL+Ot8ZeMXU
8C6fv7O0PP6eLcX77fHJVBsK1gU+ARBRmERFdTkRPBQ6fu/utbE=
=dXSq
-----END PGP SIGNATURE-----

--q46wa4n5scekor7b--
