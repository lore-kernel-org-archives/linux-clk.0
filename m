Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 16 Feb 2017 18:55:53 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Bob Ham <rah@settrans.net>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, stable@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: sun6i: Fix enable bit offset for hdmi-ddc
 module clock
Message-ID: <20170216175553.epqbtjdazj76tjyu@lukather>
References: <20170214022332.13326-1-wens@csie.org>
 <1487110855.7145.46.camel@settrans.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zygr7x5jl6opgou7"
In-Reply-To: <1487110855.7145.46.camel@settrans.net>
List-ID: <linux-clk.vger.kernel.org>


--zygr7x5jl6opgou7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bob,

On Tue, Feb 14, 2017 at 10:20:55PM +0000, Bob Ham wrote:
> On Tue, 2017-02-14 at 10:23 +0800, Chen-Yu Tsai wrote:
> > The enable bit offset for the hdmi-ddc module clock is wrong. It is
> > pointing to the main hdmi module clock enable bit.
> >=20
> > Reported-by: Bob Ham <rah@settrans.net>
> > Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
> > Cc: stable@vger.kernel.org # 4.9.x-
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >=20
> > Hi Bob,
> >=20
> > Can you try this patch and see if it fixes your HDMI issue?
> > With the kernel running without "clk_ignore_unused" that is.
>=20
> Hi Chen-Yu,
>=20
> Unfortunately, that doesn't fix it; I get the same behaviour as without
> clk_ignore_unused.

can you apply that patch and give us your kernel boot logs?

Thanks!

------8<---------
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 820a939fb6bb..0a23b03ea393 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -773,7 +773,9 @@ static void clk_disable_unused_subtree(struct clk_core =
*core)
 	if (core->enable_count)
 		goto unlock_out;

-	if (core->flags & CLK_IGNORE_UNUSED)
+	printk("Ignoring %s\n", core->name);
+
+	if (true)
 		goto unlock_out;

 	/*
-------8<-------

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zygr7x5jl6opgou7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYpeepAAoJEBx+YmzsjxAgme4P/RaOPbZXll+5Pr9a5hw6gHva
SZc4MtQq3bblP1yS72txJxWpVvJP+b+Gj0IxBkQtWk60DNPS3eyKkW4nWYCYC9UY
0suv9ETB/lIUk5jyPueDhxGpWgibYVsCPxPOODBkebP8boxQAOi32Gd/02j5vLti
6wVyhQ1pB/2sWAJPvzJ/UCzd3LjiZGGSq4xRTTj/r3Ww/caZosEXbeuoF8+TzZ9T
/35ZtkNqSvaBfUXjYNoVXCh9q4mJha4DiBCE/fu/vs/YE/FBZx2Ayzy0I7a3y8ro
DuY1iBkWu56VelVBhHdgVHSeA+Qya+TE0dUEw7BBI7d5a/zYmLceGXESEhw8hB05
cL9lXz3v/P3UBLSjXcUWLFjTnZJZGhdvsLaK6ZVbmpGtPE6YonZSkU8BYkKteZza
y8ziAuReikMscdapQdO7vsrUNU0j8aME/ptP43vRFt1Zth7avo4MW0d+VLwP/jMC
waLzQk0E/z6xJUTJUHeFyg6oChOBlIo88InOdLW98HlxprJCotX1mQbNLvmI58I7
MvVWDXx3TUi0C733i97H0VALwvzyE+S8QwplGDFaM9z/y8IOPgWF4OQz7MR/B/wV
fc8cc9Nk+lWfN0uUpA4BsQDdLoppQkdzqpfUmqHEMenaEQbeGQK/aQCzeqmpBdmq
Ls+YkVPU2cAMJ0CwwvpH
=sdo4
-----END PGP SIGNATURE-----

--zygr7x5jl6opgou7--
