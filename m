Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 3 May 2017 22:34:02 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 3/8] clk: sunxi-ng: Add class of phase clocks
 supporting MMC new timing modes
Message-ID: <20170503203402.5mwhx5wjniav24nd@lukather>
References: <20170503031658.29299-1-wens@csie.org>
 <20170503031658.29299-4-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rgbzhspct3f4eex6"
In-Reply-To: <20170503031658.29299-4-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--rgbzhspct3f4eex6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 03, 2017 at 11:16:53AM +0800, Chen-Yu Tsai wrote:
> The MMC clocks on newer SoCs, such as the A83T and H3, support the
> "new timing mode". Under this mode, the output of the clock is divided
> by 2, and the clock delays no longer apply.
>=20
> Due to how the clock tree is modeled and setup, we need to model
> this function in two places, the master mmc clock and the two
> child phase clocks. In the mmc clock, we can easily model the
> mode bit as an extra variable post-divider. In the phase clocks,
> we check the bit and return -ENOTSUPP if the bit is set, signaling
> that the phase clocks are not to be used.
>=20
> This patch introduces a class of phase clocks that checks the
> timing mode bit.

We've been over this quite some times already...

How do you retrieve the mode used in the clock so that you can also
switch the MMC driver in the new mode?

And do you prevent that from happening on the DT we already have that
use the old clock drivers that do not support this new timing at all?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rgbzhspct3f4eex6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZCj6xAAoJEBx+YmzsjxAggYkQAITfD4bC+tjWt3hnsPGBMjto
GtTqh0lbTvhie+euT2smQeLwazK7sdFZSFRwC1saEPLaxyAxeeYHk051SRAyX+z7
s/BUh/rFXbpCHk9mfOVIa3V+i6ZZ01mT3HEwEftrGdspKo2epA9GAzKXBSSeJMVr
u0x1hr+HpPB6GgcQN14/t0jnTjyF+yLu5AGN6bDfQBcKsYax+Xi0thYInjQwWJrl
hnrvJKUK7vijowIKVZ3ll1f+VXVfT3BgBsRjWASeCv2ifHTf3Jjm7666eQOAzRVE
gS1bFTXAypDSesqiGniTeEXvrS9H1NLatWUpVjkXM4dJM9xJNhStNg1LmeaCJW2b
YIStLccZcCi8Iuu+cVfH01p/oWeLYmBknEQqRTEjGUae+aU7Rq5ZctZBq4I7pA84
w/xIf+bESgMrRZhzst27HIMe6VTYbVKHunrn+YyLUIcjWsxsD5yk9UcHbgQ2v+No
qxa1bJJK57akb+EyeMi5F+WUWQ0sYGKsjhEetNygwnS4KNFEmcRsfp4bYze9JuOd
8wUZXglIaCUrD+PHrHbMhW65NQkpg5qIMPAF8+xfuE7ALbux9Z3k3h6rijte6VPe
U1TFxZXBJLsaCul+BzoPtwhPDFJHhOWy1Ipfg6/G2e5XtY8qw34yf0vYKKS8/bEi
JrQwaSoxFyvQgAUUnIGo
=JULM
-----END PGP SIGNATURE-----

--rgbzhspct3f4eex6--
