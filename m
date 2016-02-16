Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 16 Feb 2016 10:33:45 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Chen-Yu Tsai <wens@csie.org>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <rob.herring@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
	Grant Likely <grant.likely@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>
Subject: Re: Allwinner A64 MMC support
Message-ID: <20160216093345.GJ4344@lukather>
References: <1455300000-18723-1-git-send-email-andre.przywara@arm.com>
 <56BE29A1.3060107@redhat.com>
 <56C1A590.6030500@arm.com>
 <56C1C7BB.1040602@redhat.com>
 <56C1D9C0.6020601@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6J7GEvtanOfV9oXA"
In-Reply-To: <56C1D9C0.6020601@arm.com>
List-ID: <linux-clk.vger.kernel.org>


--6J7GEvtanOfV9oXA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

On Mon, Feb 15, 2016 at 01:59:28PM +0000, Andre Przywara wrote:
> 2) The reset node is a allwinner,sun6i-a31-ahb1-reset, which does not
> get registered automatically, but by an explicit call from mach-sunxi/.
> I wonder why we do this (yes, I saw that comment, but still...) and if
> it would work with a normal MODULE_DEVICE_TABLE() declaration.

Because we need to access the reset controller at the time the timer
is probed, which is way before the device model is initilized, and the
"real" reset controller driver is probed.

I'm not really fond of the solution either, but there's no other
solution, if we set aside "rework the driver / device model so that it
initializes properly".

> There is and will be no equivalent to the mach- directory on arm64.

Then you cannot use the HS timer.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--6J7GEvtanOfV9oXA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWwuz5AAoJEBx+YmzsjxAgrEsQALS4hnb2da81VuSuMKXJpjk9
yaKKiQ6kwqkJ955Sk8M6wnsUZCBG8cIi3yFaUILUzO+DSULU3qgp9M88gkM/lVuQ
5O+XrSm29KDlYcvaZHrk3mRiEUem6mOTKmUdI/8Q6Z/ay/4qOaDaFXHqw8ZIxLMn
rtveRG1r2uuqF73Fi45S1+oWKR1SeR5CUL00/y9eK6vtiQWpE8QMCaAVHaEgRBUh
zpwln0943VSIdYxstbdBPbZ+GKUB5MSBNISBdhkEvcnf/fW9rPWhEqBPfNDnPl/3
2VwgevoarWD4XkjwVDJEVeRSiR0zxHplKair3ehaIzRzipcpcf1KOl0+njhY5Hf+
/GTiikwRy2MHrCxI3HgPxCokCX5ZekogrQ5C9MwkKcukONLbzCB7acw9O3NIaw5L
hRF3yLTwu0MkUuYIx8nbyvgbVLCidFlfTupcAn+V0GmGlEv8UWiyHfUFKPLgkKMX
faUzjyPvNsKbptDKstSrZn0tPPPchHSgjKb18h2GZ8HtNiRQLbu7oPcmmONZxPzW
DUkgNsr/wIqz/lFK2DfD1aVI1Q6trqcMVsujLP37jPrx0ANs5Zjhy+J20jQJDKvh
UWOHk+lxY5ZyMZ/Ky1jAMyE9I69xSTeHgLUuZcZ2Pwt0AYVJiRpjTs75SkYxmXwT
fPAwOyFoUGbqt7Zs98JO
=8CZ+
-----END PGP SIGNATURE-----

--6J7GEvtanOfV9oXA--
