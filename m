Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 7 Dec 2015 09:59:55 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Emilio Lopez <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH resend 3/6] ARM: dts: sun4i: Add DRAM gates
Message-ID: <20151207085955.GB27957@lukather>
References: <1449321407-4531-1-git-send-email-wens@csie.org>
 <1449321407-4531-4-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
In-Reply-To: <1449321407-4531-4-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 05, 2015 at 09:16:44PM +0800, Chen-Yu Tsai wrote:
> The DRAM gates controls direct memory access for some peripherals.
> These peripherals include the display pipeline, so add the required
> gates to the simplefb nodes as well.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWZUqLAAoJEBx+YmzsjxAgutMP/23tJLgv6/fq6VFspfcuZNb6
KkXtjcwPUKsN12MZwcfzPIvGEIuruJR8u1Y6umsBUCfbKOi5QmRnRXOX8geX6UAs
/eOsrzWTa9Jo65zUyp1VvoQ3LunyuAuirsvmxIVyWWenL2BcyILd39eL3TeWR+no
XLR0CCRkBAZaO34B88Jtawwp3gvGtBBFR9dMuP6yTTu1oB//a7p81YoslZuXA9ey
O2WTBrsLJU35qiwRzrDI1OZXSCztEcRiD60XT1RaPTPV8NjZeoWyXlHz9cNNuyLI
DxLVPkt+w+8gTsknhE8gXWphxahQsFJML1Z6qdGtcIk8J3qgfTmmxcvv6tOjga3U
PZfCRoicPuJYQk/+taSXAyHPJWsFvaMkyZev55WEM8dT0AgeThwv7VanvRyhSZOs
czHdv1sCk7xzrCy9z9UkBcuQ4gybbqxCsX3Bbh5WnxV4eliEg9g+LVHWif9FKlXb
AJhHbqlJ5n5+ZN5j9eZxcCR/Do6NcbI7sU7on0TX+ned/CbN5ByRIswkdt5AO1LL
PlNBI7+MbhpO80/TzrGhnzsynRPBulq7ZI+m83+4ckRpgZcOAmtXu+hmWodFoIyB
4IlqGx9sP0PLgRvma++m8Y8iLii9Dslau1XzZDlKpCTOd8R2GOLWLcMEjUIX3GJp
Ulg1okHh3UkyX0IXJgs4
=nh4g
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
