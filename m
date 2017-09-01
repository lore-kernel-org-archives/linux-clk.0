Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 1 Sep 2017 08:17:06 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] Allwinner clock changes for 4.14, take 3
Message-ID: <20170901061706.varrjekvcuymqzx2@flea>
References: <20170824083620.b5cq4qtyr3cqtpjx@flea.lan>
 <20170831175901.GF21656@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zusvhbl6z3c7gp76"
In-Reply-To: <20170831175901.GF21656@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--zusvhbl6z3c7gp76
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Thu, Aug 31, 2017 at 10:59:01AM -0700, Stephen Boyd wrote:
> On 08/24, Maxime Ripard wrote:
> > Hi,
> >=20
> > Here is a quite late PR, but this also something we've been waiting
> > for for quite some time already.
> >=20
> > These patches convert our last users of the old clock framework to the
> > new one. We still have some marginal users of the old clock drivers,
> > but they shouldn't prevent the fix for the orphans clocks we hold back
> > to work.
> >=20
>=20
> Great. Thanks. Pulled into clk-next.

Just so you know, since we haven't heard from you about this one, we
didn't send the DT bits. So the conversion of our DTs will happen in
4.15.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zusvhbl6z3c7gp76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZqPtiAAoJEBx+YmzsjxAgvowQALl82XgA/X+m/nK4aVlzJqAd
h6sxfRHVuE76WVH3hwzh/FmKvVpFlKfKsAikvh6ANiX3QiQ5MAHaysLWuCbtoCE1
oPfGpKuIyhVTvHuw3elV6QzwvKgC4h6VkHmBzjHz7PekPNDr6ldeBNbsLFiF0QXN
0qwAvnqT2dKBkgoxrzgztYD6xaimdYhY34xEG1+xM9CQKXlETTPvkkTe1jVVK6Wd
gQX0eEuOz5+q4Nv9o0BCUfvCZIPikBnTefMxiRnboyS+xQ0NdjOkJpJuoSeJEELr
mR9GuerqhGqOyKpTGUrfneb1xrrRcreDuZxPgxMrHbBLTAQrsU18f1W19cUwwY13
ZYzn8wU+sIBNO3dteD0Ws1izWm5x5IxMopn4U0vbk0Sny66tUX/xfsJJk68p1qFd
9ojT1PV/Sf10N+GxPcU6XZZl6Hw3i6Lwh/8jAkhF9xP4w1prnCYhGK/6MgAytreY
DTEBx5U+fRXMyjWjD0VZtepEQ4qQF3BHMUn30xsIPZN0GypqGJVSiT539wVEFoFE
jpNcUpvwDQTZHd9t+kNTqOXwzhE0Q5iGnxF/IlAqfH4yvVClqt7n5I1FQaHY2gnd
T8L630lWBRAm//zyn1ssl4lBXk8JyZ8ryEO57H5AihSOKqcqKnMKxeo8JTaCD+4Z
cVunpBka3slbKvX0siYA
=lNzN
-----END PGP SIGNATURE-----

--zusvhbl6z3c7gp76--
