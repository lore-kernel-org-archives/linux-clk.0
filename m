Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 26 Mar 2017 15:11:16 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/3] clk: sunxi-ng: use 1 as fallback for minimum
 multiplier
Message-ID: <20170326131116.ir6rkf7sh7jkyqod@lukather>
References: <20170324083307.18338-1-wens@csie.org>
 <20170324083307.18338-2-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="knyujehglo7qk4ib"
In-Reply-To: <20170324083307.18338-2-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--knyujehglo7qk4ib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2017 at 04:33:05PM +0800, Chen-Yu Tsai wrote:
> A zero multiplier does not make sense for clocks.
>=20
> Use 1 as the minimum when a multiplier minimum isn't specified.
>=20
> Fixes: 2beaa601c849 ("clk: sunxi-ng: Implement minimum for multipliers")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--knyujehglo7qk4ib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY1730AAoJEBx+YmzsjxAgoTcQAKidZbXOXsZnsYb2PqkSkJ1Q
mzexQJ0TiPl5KQH1PrP913w0uoEeX+Xpdj9QKKOh8tdmdJ7TvMVcm05OJh4Mf4xu
KDEdgWxR51zgLQ5UK341RYvVWCwSXFvPROd9wXXrosdVeEvlX0RJZ6CgQH4Vx51Q
jQZo5ku3tfj5qc2NZyqKUxZwgLwBpWE+T5WxLxLVK4SjQfLC8Yn9uviw1MdBA7Ln
gzjS3e/VyS40OEgZyCuz/nYJpC9VABpa7Rtl4mR7wcKCyK8sDs8DrcEANI/ZQ8o4
WXwoUyC5+K8Ri3Xo7nWfjkFk5WN3ZL2RxByg23feNo1rpnscGe3eykJW4CAZX9S9
doXUvxO624GZF9EkXe8so1d+9Zgm9lHmrj8nbufrhid7tQgbbW/MnfRE6Q7XHOFK
rf2HYIhCvbuPdVlMYG1uWyB94SGwQ46BYwIX6KRi8AopJ7sy1Iu7XBQqy0w3ySD8
Hkve9pQ/so8VJkV9pe4DsgohUb2I48t+kv9p7F63bnmyyVdD9gG4RE6ZYYprTz+m
zvgNjT4in1gFq8gPF60qMnLB7Cc+ZjBiVUG2MJ9HgdYoYy7cxv6qu91WmILbJPJp
h0TwrPncQVJPDE7HTl0vHIJgF9mxJLH8Nho/iib/w4TqB0+gJ1XTPRapggKsawBg
O7NgX9QESjxkJana9LgW
=JTma
-----END PGP SIGNATURE-----

--knyujehglo7qk4ib--
