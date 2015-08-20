Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 20 Aug 2015 17:39:22 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, lee.jones@linaro.org, s.hauer@pengutronix.de,
	geert@linux-m68k.org
Subject: Re: [PATCH RFC RFT 3/3] clk: introduce CLK_ENABLE_HAND_OFF flag
Message-ID: <20150820153922.GE30520@lukather>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <1438974570-20812-4-git-send-email-mturquette@baylibre.com>
 <20150818155854.GK2547@lukather>
 <20150818163931.31346.78267@quantum>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AKuaMbydVAlrc5ow"
In-Reply-To: <20150818163931.31346.78267@quantum>
List-ID: <linux-clk.vger.kernel.org>


--AKuaMbydVAlrc5ow
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2015 at 09:39:31AM -0700, Michael Turquette wrote:
> > In my mind, the fact that we hand off the clock reference is a direct
> > result to the clock being critical (or whatever name we want to call
> > it). The hand off is a side effect, but the real information we want
> > to carry is that it should not be gated.
>=20
> I chose the "hand-off" name because I want to set an expectation to
> users of this feature. That expectation is that some day they will have
> a Linux device driver that claims and manages this "critical clock".
> Clearly this is not always the case. Many clocks using this feature will
> never have a driver that "owns" them.
>=20
> But I wanted to avoid any kind of "always on" or "easy hack to avoid
> writing proper driver code" naming convention that encourages bad
> behavior down the line.
>=20
> Also, the hand-off thing is sort of a big deal. If driver writers only
> thought of this as an "alway on" mechanism then subtle bugs might creep
> in where drivers are getting and disabling a clock that the author
> incorrectly thought would always be enabled. So I'd like the name to
> reflect that somehow.
>=20
> As always I am open to suggestions.

For the record, I think always-on would be just as bad, since it has
the same issue of describing the behaviour instead of describing what
the clock is.

I would think critical is better, and if you feel there's some
unexpected behaviour, we can always add some comment / documentation
for that (heresy, I know ;))

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--AKuaMbydVAlrc5ow
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV1fSqAAoJEBx+YmzsjxAgPR4QAIGJMet5N1jPPOFuyIOKjb9n
Dn8tnJZfXHmxD0Ub3ZaV0zS9lrrDyt1ewqPB/yDjLSlXVcsUPVLW4VpmArMA6vl+
gsRVLZQP/7kjr/SouLdnXSflsbmTN3I5ZkYXWS1cj6RCgtI1KG5MnhaZ52R6xkh2
+zGq/LiHjgCgjlaxD6gPw6mnoj2d8kMzv6Nris/Lv9NNNzNFWBpA0gCP3+Vgs9YZ
q0Lqw2QyHZGSaoRH6RCwcnhIPI1L2/qiL5ShRNOg2Mq8FOsAP6Iuy4uPVBv8NWKG
Tx+6s0URaAwL5mYcSSom78/mCxMQ4UdIbPtQ1GecQRwOh8nPDnz+KyKqOWkOlgz2
veOkRhT/51gPU53u9oprX0WkRYVAY23PtSTuS9Zef6PttRz6dI0C5Zw8cLKQX3xO
urRw4vbiD+oK4r0qzhY1VGWuqBTDbEl58+tWPYtbpL3IE6OF4VB+tJsify74f/H4
eY4tC5PuEe6zaQOm7ac8k1ShwmmQ7bFjEkVIrI0W9pgFuHXsJ5qHHVFXxhSmchup
8oeQ/Vw85svKJEwBnw1Q66no5ss1HcmQK6VxxipAg+ick3JFnBLFbOwhBNFvGNMU
o+HF31Enw7mlYAkzKJv0gzPQrPCC7QIE7JGA72Cam14cfjl9u5WHMw7cbOR1ySCr
povg1AWz5S/P/lpVlpXC
=ttVF
-----END PGP SIGNATURE-----

--AKuaMbydVAlrc5ow--
