Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 18 Aug 2015 17:45:52 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, lee.jones@linaro.org, s.hauer@pengutronix.de,
	geert@linux-m68k.org
Subject: Re: [PATCH RFC RFT 0/3] clk: detect per-user enable imbalances and
 implement hand-off
Message-ID: <20150818154552.GI2547@lukather>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uJWb33pM2TcUAXIl"
In-Reply-To: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>


--uJWb33pM2TcUAXIl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Fri, Aug 07, 2015 at 12:09:27PM -0700, Michael Turquette wrote:
> All of the other kitchen sink stuff (DT binding, passing the flag back
> to the framework when the clock consumer driver calls clk_put) was left
> out because I do not see a real use case for it. If one can demonstrate
> a real use case (and not a hypothetical one) then this patch series can
> be expanded further.

I think there is a very trivial use case for passing back the
reference to the framework, if during the probed, we have something
like:

clk =3D clk_get()
clk_prepare_enable(clk)
foo_framework_register()

if foo_framework_register fails, the sensible thing to do would be to
call clk_disable_unprepare. If the clock was a critical clock, you
just gated it.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--uJWb33pM2TcUAXIl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV01MwAAoJEBx+YmzsjxAgQE4P/2fNeQ0Akev1jO3hqvoMldcl
yBs8qykDvtGPS7acROolH6qywVAaR/2Ke49ZkFBIhpuw0NAUy5wj635MJbNHWsOM
T+iyM3lTE0BvMA8z7v4DlMnDMcW7/eKJPGPMjCi0XjPZ+XQ6eVxfvcYKs6fVkLYd
GdK9quXvQ989S+In1v+bPaOdLBreINI7P5EFZu8CRxvM64cFFRC5fENV4mJeC1Ht
8vY6Z/fH8Ru5zIMLO8bX2NCiH1gQDg1zlUDHbgZdmCQI6LlbJChiVotQ+wyGaDIv
/RuhS+B0gsk+MutENY+0Cpo6vfJhQ1DoGPix5n9kZzo4mH2AXdoI9TjI59z3duSB
f3BNvgtGFO9YueL7V2l7Yb+mt01dRarXCf7Huqz/9qndZFczdrWbUf391E4c871P
NnHtrwCBbyRpZ0WQLlvbqRKB77e2D+FWqMANuxdcDzLt3NxVRiSj1ZP38VG/60OP
0uhC0P1H4wKnrpFNS2GHRuYwT1fMXrT9ZTo9OZQ14DXNNj8O5xQ499cQ/f6AiYyc
blxNWYCTMku4+3HVbS6TVoUEUCvq0bBvMXCfkwsus8WdveslwsjElFI5IcK/CCUb
Xr4EPdV9abkuNe4bZxjxHU28uyCGUYGau/vKvdWJLoALxBrO8huuuCG/nWNzof0I
nmf2LY+fXN+bru+e3zeq
=Sas1
-----END PGP SIGNATURE-----

--uJWb33pM2TcUAXIl--
