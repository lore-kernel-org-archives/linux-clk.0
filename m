Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 9 Sep 2016 16:54:07 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Allwinner clock fixes for 4.8
Message-ID: <20160909145407.GF8881@lukather>
References: <20160907193335.GA4283@lukather>
 <b03d92eb-ac69-506d-d05a-e28bca5ca284@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Mjqg7Yu+0hL22rav"
In-Reply-To: <b03d92eb-ac69-506d-d05a-e28bca5ca284@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--Mjqg7Yu+0hL22rav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Thu, Sep 08, 2016 at 12:56:53PM -0700, Stephen Boyd wrote:
> On 09/07/2016 12:33 PM, Maxime Ripard wrote:
> > Hi Mike, Stephen,
> >
> > Please pull the following tag for the 4.8 release.
> >
> > Thanks!
> > Maxime
> >
> > The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a=
7cfc:
> >
> >   Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)
> >
> > are available in the git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tag=
s/sunxi-clk-fixes-for-4.8
> >
> > for you to fetch changes up to 6654674cb7b5953ac04fc9d7f5f511676ae97e29:
> >
> >   clk: sunxi-ng: Fix wrong reset register offsets (2016-08-29 08:38:55 =
+0200)
> >
> > ----------------------------------------------------------------
> > Clock Fixes for the Allwinner SoCs, 4.8 Edition
> >
> > The usual bunch of fixes to the our clock drivers, mostly targetted to =
the
> > brand new sunxi-ng drivers.
>=20
> Pulled, thanks. But,

Thanks!

> >
> > ----------------------------------------------------------------
> > Chen-Yu Tsai (2):
> >       clk: sunxi-ng: Fix inverted test condition in ccu_helper_wait_for=
_lock
>=20
> we already had this one in clk-fixes. Git figured it out of course.

Hmmm, sorry, it was probably a mistake from when I got back from
vacation.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--Mjqg7Yu+0hL22rav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0s0PAAoJEBx+YmzsjxAgBAwP/0/JNenAFmW0wqefVVsNwi5L
G5I+SpZzWGph3EXR4XHNLA2NYbT9ZpldDGFcjl/fxoWbnl8DSxqPqx7bKu+lSBk6
O0d34XfwrHjQ5yLcY9cH2vCUpOfP+9ywVxKIV0l65PY/Ea4vd8N1tJfVs0IdfoGs
H/Andrxo2ZK5ge6EUeNII9Y2/qrjPSACIAFNhNDcPzi/OPH3Yd4vKMGkox8Lbuyd
2PaATn23qBETdcXLdbPdV48/C1WZq1wkU7wYc8Rpi42LKoB3N0WHQTpM3S3Ka87c
7kMFHThSmbFyLhY1KvaQltlNVYIjHHLiW/9/yWysVeNvSTFXeJFTCEXV+7KzZEON
0/Uc4bXxxyjHJWx8JOjeqOIVceq3IHtbtNss412wKUsnBBM8kx/A4NiZ3u3L0KX3
ZIus0vnCIDjX2wNrJkDCrlRTDUUBZr2lJTBusXifSv0JplWfzYzF+KofOz6hewxf
RncqbP3bczZKkyj1BlO/PfWsIhXSB9llaLDSv2DLkrRUv1zLdl+fV7RXhIlFF/yQ
YyVXPoIWazXflfBo+4fuOTASV3ibXwg7a6nyozaEEvg8oaYaF2+5t+Ztj2FM5uJB
kYa2JLRfh/AdN0GJXnX1aS52No2uNJR6Ra01Gmc/6Pxx41HQT64cDm3veiyIsjRT
49kBftdaP2N24m3vmD5m
=1iTG
-----END PGP SIGNATURE-----

--Mjqg7Yu+0hL22rav--
