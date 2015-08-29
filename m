Return-Path: <maxime.ripard@free-electrons.com>
Date: Sat, 29 Aug 2015 05:55:57 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, lee.jones@linaro.org, s.hauer@pengutronix.de,
	geert@linux-m68k.org
Subject: Re: [PATCH RFC RFT 0/3] clk: detect per-user enable imbalances and
 implement hand-off
Message-ID: <20150829035557.GX29389@lukather>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <20150818154552.GI2547@lukather>
 <20150818164356.31346.80341@quantum>
 <20150820151510.GD30520@lukather>
 <20150825215051.31346.56261@quantum>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3ioKt2kN+IccB5F4"
In-Reply-To: <20150825215051.31346.56261@quantum>
List-ID: <linux-clk.vger.kernel.org>


--3ioKt2kN+IccB5F4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Tue, Aug 25, 2015 at 02:50:51PM -0700, Michael Turquette wrote:
> Quoting Maxime Ripard (2015-08-20 08:15:10)
> > On Tue, Aug 18, 2015 at 09:43:56AM -0700, Michael Turquette wrote:
> > > Quoting Maxime Ripard (2015-08-18 08:45:52)
> > > > Hi Mike,
> > > >=20
> > > > On Fri, Aug 07, 2015 at 12:09:27PM -0700, Michael Turquette wrote:
> > > > > All of the other kitchen sink stuff (DT binding, passing the flag=
 back
> > > > > to the framework when the clock consumer driver calls clk_put) wa=
s left
> > > > > out because I do not see a real use case for it. If one can demon=
strate
> > > > > a real use case (and not a hypothetical one) then this patch seri=
es can
> > > > > be expanded further.
> > > >=20
> > > > I think there is a very trivial use case for passing back the
> > > > reference to the framework, if during the probed, we have something
> > > > like:
> > > >=20
> > > > clk =3D clk_get()
> > > > clk_prepare_enable(clk)
> > > > foo_framework_register()
> > > >=20
> > > > if foo_framework_register fails, the sensible thing to do would be =
to
> > > > call clk_disable_unprepare. If the clock was a critical clock, you
> > > > just gated it.
> > >=20
> > > Hmm, a good point. Creating the "pass the reference back" call is not
> > > hard technically. But how to keep from abusing it? E.g. I do not want
> > > that call to become an alternative to correct use of clk_enable.
> > >=20
> > > Maybe I'll need a Coccinelle script or just some regular sed to
> > > occasionally search for new users of this api and audit them?
> > >=20
> > > I was hoping to not add any new consumer api at all :-/
> >=20
> > I don't think there's any abuse that can be done with the current API,
> > nor do I think you need to have new functions either.
> >=20
> > If the clock is critical, when the customer calls
> > clk_unprepare_disable on it, simply take back the reference you gave
> > in the framework, and you're done. Or am I missing something?
>=20
> Maybe I am the one missing something? My goal was to allow the consumer
> driver to gate the critical clock. So we need clk_disable_unused to
> actually disable the clock for that to work.

Yeah, but I guess the consumer driver clock gating is not the default
mode of operations.

Under normal circumstances, it should just always leave the clock
enabled, all the time.

> I think you are suggesting that clk_disable_unused should *not* disable
> the clock if it is critical. Can you confirm that?

By default, yes.

Now, we also have the knowledgeable driver case wanting to force the
clock gating. I think it's an orthogonal issue, we might have the same
use case for non-critical clocks, and since it's hard to get that done
with the current API, and that we don't really know what a
knowledgeable driver will look like at this point, maybe we can just
delay this entirely until we actually have one in front of us?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--3ioKt2kN+IccB5F4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV4S1NAAoJEBx+YmzsjxAgd5YP/RWXRB5ych94KgHPpF4sHsWa
ZhMW6BGvoB+o2S4EkpgpxyoKfR9BtFCZeu7BLUVOFhDIm9MPfdrQ8qbgOkDAqAVl
q6vq7l008OEAq+3mVWe4/88X7AXp7MdpoSl3AgGAiZj1nSXNSbrFXjdMqt3xWOYP
K1LZAgBoM0WmLJY3eMR+EwrmLQTunviUPxX57KUuMTPZVON9sjGM90EAw83DCSiL
TJ4UwjBtAJddCRybGaGLUQznhKcH4gnV0j3sD/4o3xkI/ZnYRKfIYKU5lf2FsIA/
n7a2ZVs5nBKc8zEg0eJq5DDtTFgekJ4+JRmkdlL5cqwHOfn7Uz8ZLnqYXS+SV71L
vMxgZs8aCSP9LLOAl+apC/rc+oeMoyHXOspWyZ27H6DsChEed17wBZs3NTcd8Q9/
q4letGqHhtdNwSk0PjQxkwo+DynkCaGgGra7U+TkChv/Y25fyQKAQHEZuqRM1AZS
v6ZG9XCnto3OaMAWMuRMvzykokTn+HC/ler3MvqnNeAWzVfoGihFC+/ruEhasvrH
2LaJXTAeszJs8jB7+FfoVBksGKGFSNvMgQv1eW93pigPcOx35EYX5zMop+XQXzXZ
jza1ZZK7E6rc8rEExA9gG45t2MHq8s4ZRHjtW6QrjM3lBSidgewjjKU6e+A9K/n/
z9hZ/fZdNB5u1ChjHa0N
=nsGU
-----END PGP SIGNATURE-----

--3ioKt2kN+IccB5F4--
