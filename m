Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 2 Feb 2016 14:27:18 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 1/5] clk: sunxi: Make clocks setup functions return their
 clock
Message-ID: <20160202132718.GU4652@lukather>
References: <1454402834-6385-1-git-send-email-maxime.ripard@free-electrons.com>
 <1454402834-6385-2-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v66CyhkM0vabbede43eAaf7WVg0Lm8w_OUKwqHnFO182uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ImSVV91IQg5ga+3z"
In-Reply-To: <CAGb2v66CyhkM0vabbede43eAaf7WVg0Lm8w_OUKwqHnFO182uw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--ImSVV91IQg5ga+3z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 02, 2016 at 06:35:29PM +0800, Chen-Yu Tsai wrote:
> On Tue, Feb 2, 2016 at 4:47 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The clocks registration code in clk-sunxi was most of the time not
> > returning the struct clk (or struct clk array) that was registered,
> > preventing the users of such functions to manipulate it, for example to
> > protect it.
> >
> > Make them return it so that we can start using it.
>=20
> Should they return error codes as well? So the CLK_OF_DECLARE setup funct=
ions
> can report errors. Or make these helper functions report errors directly?

CLK_OF_DECLARE doesn't handle any kind of error, as the setup function
must return void, and the error printing should rather be in the
common functions in order to avoid duplicating it everywhere, so I'm
not sure. Or did you had something else in mind?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ImSVV91IQg5ga+3z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsK62AAoJEBx+YmzsjxAgzK8P/1e9U9N8FVQRWBwkQDvUN7Rw
tdReFfpZUateZREysT7nlGz9QVOi5DY2dLFoesJvlozJPqPbHyvoqjDwMEqi7mhu
mLH8NwM/ALvYTZW3vrgloSwOKBIrz8Rn4CMPYFv3EvwLA9f/1G/MWkCu4iGIl1F+
dr5v2tDB/tUX0aQGEkoE9UcYbqeJmhMU8yNVBO4ypmBcjmbyp5oIvOpQKzOkNBG5
4NPPqKwHOdBh7dNfcHvljst6DUBMJdS2Y7RBtDg1l0PZ7hpedEMfbS5IuveSfIIQ
lUBfShSYmpv0yphOLj9tNw5sScLY2S+pVbSg9pmFrv6C+d/RUANx7YAKObvbjvgG
EYIlV26TyJqxz24O3D9vO7eEC5uhuNurYipMNxyxw4r4ncxOicn6W51P8xeBtl0+
0JKu5RNDWOsw+IXalo3+3cSt2GVnf0U+g8dta4O0I6TqFDGfqumz9d/4UaAilp/3
7wDefVRhCi6nTuJJGhSBO9ruxcVHb1P/6xYFJpOgsWPgNCRDZZH+4q43WtkRo4dc
pxEFzZBNwwpdV5C4Hag80mFVKpQQ2nDNeqtUW4h6p8jIKlre2OdnNnRO3mMouibp
K3G2n/0eBf2jDBUeLcCb9qHUxJw3jXql8b4OOzw1maS+FMuw3iJx5pfvD3uJoLTr
hZzp6sgZ5QrdMyH//2FQ
=EVOp
-----END PGP SIGNATURE-----

--ImSVV91IQg5ga+3z--
