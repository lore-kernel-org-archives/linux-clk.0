Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 2 Nov 2017 10:04:05 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Quentin Schulz <quentin.schulz@free-electrons.com>, Kevin Hilman <khilman@baylibre.com>, Peter De Schrijver" <pdeschrijver@nvidia.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v4 00/10] clk: implement clock rate protection mechanism
Message-ID: <20171102090405.wletgjwzbtkmljc3@flea>
References: <20170924200030.6227-1-jbrunet@baylibre.com>
 <150899576543.90597.13810909942564444110@resonance>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lzsxec2waq3gdp3d"
In-Reply-To: <150899576543.90597.13810909942564444110@resonance>
List-ID: <linux-clk.vger.kernel.org>


--lzsxec2waq3gdp3d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Thu, Oct 26, 2017 at 07:29:25AM +0200, Michael Turquette wrote:
> Quoting Jerome Brunet (2017-09-24 22:00:20)
> > This Patchset is related the RFC [0] and the discussion around
> > CLK_SET_RATE_GATE available here [1]
>=20
> + Maxime & ChenYu
>=20
> Have you tested this latest version? If it works for you as expected,
> please feel free to add your Tested-by's.

We were not in Cc on this one (obviously) and I'm not subscribed to
linux-clk, is there a git branch available somewhere so we can test?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lzsxec2waq3gdp3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ+t+FAAoJEBx+YmzsjxAgVcMQAKlRu/mGPSSK6KVC8JgVusKx
GGiEwLb0R+RykgRIBHgJb8yNWEWahTZ4dVn4YbRcxifF2XcOBEqlbjDrxEVsWiHK
mvt8LGJDZIOdXyE09w5/1XsofbDRhQebku5kuPH5q/Apk1HoLVskiOmpo2hR08A9
FB4M67eDdD+X5B0buSYQPzvNois971lODSsU9nbdGvsvMGrVORqnqc9B3b4/7Eu4
f/koEIwPYgOBHq75yCrvyDeO5lNlCIdfRi7g+AUb6qsoFPiJLpvMf6xyKEUVAeZ1
dIxnCA7Rj/4de8ARqygcqkU4FIEydWuyuC0FvxE80/6ApJKxAnGftemIVMT34g/I
7JTBnEss1lCR0+odYD3iYJJerju5Hvf4zCAI8Kx/fm1LVR5p+TQQuwGL4dMrZVB8
PFeVbee3CP5xBpy5jKX5BBYhvbG++ItQ6QTTeGWJrKjFDYbzf7Pt6hstx3A+xYv5
YiwtRu9R2P2B0gM8+jWTt0KpOajqREn2xEqdzsg3GU6TvG4WjkH1t6wvuaF/Rscu
TXBFn7fx/vBfWqbTyQ1Sf/1bLK1SHyOLiYISJ6cAeTp5cC9+Pk9o9o0+Ph5bDhgn
FlBAxPwizcBF0zTRH1J0HgowcmTduUUX/sUgrHAsdou22OBOhiZDxYS2LkCCKNbo
E9eeDHETTD2TD7W1umHw
=pCNr
-----END PGP SIGNATURE-----

--lzsxec2waq3gdp3d--
