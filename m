Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 19 Oct 2016 11:56:44 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH] clk: sunxi-ng: sun6i-a31: Force AHB1 clock to use PLL6
 as parent
Message-ID: <20161019095644.336urfguu6azmmy3@lukather>
References: <20161018054209.24546-1-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qwsz4vzhgwk3xruw"
In-Reply-To: <20161018054209.24546-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--qwsz4vzhgwk3xruw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2016 at 01:42:09PM +0800, Chen-Yu Tsai wrote:
> On the A31, the DMA engine only works if AHB1 is clocked from PLL6.
> In addition, the hstimer is clocked from AHB1, and if AHB1 is clocked
> from the CPU clock, and cpufreq is working, we get an unstable timer.
>=20
> Force the AHB1 clock to use PLL6 as its parent. Previously this was done
> in the device tree with the assigned-clocks and assigned-clocks-parent
> bindings. However with this new monolithic driver, the system critical
> clocks aren't exported through the device tree. The alternative is to
> force this setting in the driver before the clocks are registered.
>=20
> This is also done in newer versions of mainline U-boot. But people still
> using an older version, or even the vendor version, can still hit this
> issue. Hence the need to do it in the kernel as well.
>=20
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Reported-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qwsz4vzhgwk3xruw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYB0NcAAoJEBx+YmzsjxAgWYYP/3JlNWjbgbFgi8O3c+9J0r24
j/I0Qv7zKpVix0MHMx8D4CO1MqFMnyC0jSEqIW4ZVZTfRgFIRJBEjcLg5lIY66u/
6L7fpNqjjO7oPJC3Z7fGMVngG4DWiJQejtVeSpU+TB0poCWC7M87K7ugrJFxtJAx
BhZPYfAyJDvrzCbbcyZOzqkjnpD3T+IFHegUmWZOpvT0Pd+lwYM5ytwXf0/dOXSP
46MO5+fq7IyHvzaV8EjQqJadVF4zMCq8ZrMBUPbrhxJD5WW/fQuK/wid736Kji1O
SfVGy5+2X2+KgrdAa985Dr+j3Ww/g16PJ2FV/2JFz9haoemEzMTtYtdt27DCxZF9
ntuhF5JpW5Q4jAzFIO3moQyKwQiSsD8clomHWAfdlQ0BsvOu1o3M18/KQWHxkXiU
TKt/BmPTNXQ7PLCBqhpvU3zDGtZ0rCqwufhb2zvII13maJ0/8CmEepatpkIut1Df
Aaz2+9CngIqoxzmWTZOPNVqyK1+r2guC/0EsoZVSjb5tGk5O2Ab181f1/UfqyL4T
Gp0Fgij1neC1lAHYOOfCEqWsOMrliHRL+mFncBHuBwZjZ8/SC3VqH3EZ8mlkMPAz
aQVx8FRuy7IO/1h4WceiNeogS1fekQbwtXGBY0sAK9ESFTzbRq/3Ntd+JmvQUlDE
YPE4X1j/ktdrGHUEkE4s
=1ZqU
-----END PGP SIGNATURE-----

--qwsz4vzhgwk3xruw--
