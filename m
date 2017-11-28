Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:54413 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751451AbdK1I6h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Nov 2017 03:58:37 -0500
Date: Tue, 28 Nov 2017 09:58:26 +0100
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
Message-ID: <20171128085826.snmflonvbic5put3@flea.home>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
 <55becb3a86a0a28ccca3f7c831ac6f6cf4854390.1511797218.git-series.maxime.ripard@free-electrons.com>
 <9630064.mDmGGWOQGt@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dm4xrv4axb7s2nlf"
In-Reply-To: <9630064.mDmGGWOQGt@jernej-laptop>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--dm4xrv4axb7s2nlf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2017 at 05:07:04PM +0100, Jernej =C5=A0krabec wrote:
> Hi Maxime,
>=20
> Dne ponedeljek, 27. november 2017 ob 16:41:29 CET je Maxime Ripard napisa=
l(a):
> > It seems like the mixer can only run properly when clocked at 150MHz. In
> > order to have something more robust than simply a fire-and-forget
> > assigned-clocks-rate, let's put that in the code.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > b/drivers/gpu/drm/sun4i/sun8i_mixer.c index cb193c5f1686..c0cdccf772a2
> > 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > @@ -315,6 +315,13 @@ static int sun8i_mixer_bind(struct device *dev, st=
ruct
> > device *master, }
> >  	clk_prepare_enable(mixer->mod_clk);
> >=20
> > +	/*
> > +	 * It seems that we need to enforce that rate for whatever
> > +	 * reason for the mixer to be functional. Make sure it's the
> > +	 * case.
> > +	 */
> > +	clk_set_rate(mixer->mod_clk, 150000000);
> > +
>=20
> H3 mixer works at much higher rate and if we want to support tv out, it m=
ust=20
> be dividable by 432 MHz, so either 432 MHz or maybe even 864 MHz.
>=20
> We talked about that few months ago.
>=20
> I guess this should be read from mixer configuration structure.

That works for me. Actually, I didn't need it at all for the LVDS
output on the A83t, the default seems to work just fine. Do you know
what it's related to? Maybe we can make that a bit more dynamic?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--dm4xrv4axb7s2nlf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlodJS4ACgkQ0rTAlCFN
r3QVpg/+NSiU86h7OwRCC06cV/N8ia6pAAG6daB20GEZusP4kYE7rKTdk8rU0c6i
AN1V2XE16E7GKOz24duRuH0jgAvsxgd9OBHyLTTUqNpdWjcpE6h1sc14sg6aVKxc
o55XWFa6KHD+m9V7kBQtuVSmawrWbgfcNz+w2PqKSKBg+df+ckRrrK1wupy2sNLp
ruNW0m5M03d4X50lVgi3i6IIdsxdlms1ZyATJxWGn2mImBcsUMgvUUn12xPbCJDJ
60a5jeeIPDAGrWmutbMWBKNa633aY2B4AJWqsSbQZJuhYgTVoYWzhjg5ft4CMCXe
N1nQwsy6rY3szTWxqIukcFJfJ8VnZe0CpV/Cweco7OAqqlW74LAxcxlMXLy2XS7J
Z13hUftAEG7Z3H43vhIMIwmIM18++BjrkNnskGEHR00cWyMvE+tSrPPRAWqbWH52
ninWLDILy4+HrCZc8z3Mu+FqvrgdT6dzSZ7RLUIE6Y9IWqIZnk8i+5aVQ87hgwtJ
XazgaDZ9Np79wtDJV15gwS6yoTW+SkaEUNETzlHNBtbTf6LWsTXN8WAJAjQEhnUm
OmuhYX3xw6x9TJKq7zuMfbvlGZLCtsIL4enAdhamED4t5W+otmFMFssWoxxZ6003
Op5FE47Q7b/9Z1/+wqVrL84VSkmYksiWNVWVHrs7QIX9Hkc4jCU=
=xxwe
-----END PGP SIGNATURE-----

--dm4xrv4axb7s2nlf--
