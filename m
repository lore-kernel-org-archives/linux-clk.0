Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 1 Oct 2015 21:56:53 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, lee.jones@linaro.org, s.hauer@pengutronix.de,
	geert@linux-m68k.org
Subject: Re: [PATCH RFC RFT 0/3] clk: detect per-user enable imbalances and
 implement hand-off
Message-ID: <20151001195653.GL7104@lukather>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <20150818154552.GI2547@lukather>
 <20150818164356.31346.80341@quantum>
 <20150820151510.GD30520@lukather>
 <20150825215051.31346.56261@quantum>
 <20150829035557.GX29389@lukather>
 <20150930123649.3201.75689@quantum>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aNVUg3Xo9UgCa1D+"
In-Reply-To: <20150930123649.3201.75689@quantum>
List-ID: <linux-clk.vger.kernel.org>


--aNVUg3Xo9UgCa1D+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2015 at 05:36:49AM -0700, Michael Turquette wrote:
> Quoting Maxime Ripard (2015-08-28 20:55:57)
> > Hi Mike,
> >=20
> > On Tue, Aug 25, 2015 at 02:50:51PM -0700, Michael Turquette wrote:
> > > Quoting Maxime Ripard (2015-08-20 08:15:10)
> > > > On Tue, Aug 18, 2015 at 09:43:56AM -0700, Michael Turquette wrote:
> > > > > Quoting Maxime Ripard (2015-08-18 08:45:52)
> > > > > > Hi Mike,
> > > > > >=20
> > > > > > On Fri, Aug 07, 2015 at 12:09:27PM -0700, Michael Turquette wro=
te:
> > > > > > > All of the other kitchen sink stuff (DT binding, passing the =
flag back
> > > > > > > to the framework when the clock consumer driver calls clk_put=
) was left
> > > > > > > out because I do not see a real use case for it. If one can d=
emonstrate
> > > > > > > a real use case (and not a hypothetical one) then this patch =
series can
> > > > > > > be expanded further.
> > > > > >=20
> > > > > > I think there is a very trivial use case for passing back the
> > > > > > reference to the framework, if during the probed, we have somet=
hing
> > > > > > like:
> > > > > >=20
> > > > > > clk =3D clk_get()
> > > > > > clk_prepare_enable(clk)
> > > > > > foo_framework_register()
> > > > > >=20
> > > > > > if foo_framework_register fails, the sensible thing to do would=
 be to
> > > > > > call clk_disable_unprepare. If the clock was a critical clock, =
you
> > > > > > just gated it.
> > > > >=20
> > > > > Hmm, a good point. Creating the "pass the reference back" call is=
 not
> > > > > hard technically. But how to keep from abusing it? E.g. I do not =
want
> > > > > that call to become an alternative to correct use of clk_enable.
> > > > >=20
> > > > > Maybe I'll need a Coccinelle script or just some regular sed to
> > > > > occasionally search for new users of this api and audit them?
> > > > >=20
> > > > > I was hoping to not add any new consumer api at all :-/
> > > >=20
> > > > I don't think there's any abuse that can be done with the current A=
PI,
> > > > nor do I think you need to have new functions either.
> > > >=20
> > > > If the clock is critical, when the customer calls
> > > > clk_unprepare_disable on it, simply take back the reference you gave
> > > > in the framework, and you're done. Or am I missing something?
> > >=20
> > > Maybe I am the one missing something? My goal was to allow the consum=
er
> > > driver to gate the critical clock. So we need clk_disable_unused to
> > > actually disable the clock for that to work.
> >=20
> > Yeah, but I guess the consumer driver clock gating is not the default
> > mode of operations.
> >=20
> > Under normal circumstances, it should just always leave the clock
> > enabled, all the time.
> >=20
> > > I think you are suggesting that clk_disable_unused should *not* disab=
le
> > > the clock if it is critical. Can you confirm that?
> >=20
> > By default, yes.
> >=20
> > Now, we also have the knowledgeable driver case wanting to force the
> > clock gating. I think it's an orthogonal issue, we might have the same
> > use case for non-critical clocks, and since it's hard to get that done
> > with the current API, and that we don't really know what a
> > knowledgeable driver will look like at this point, maybe we can just
> > delay this entirely until we actually have one in front of us?
>=20
> Yes. I discussed this face to face with Lee last week at Linaro Connect.
> I proposed the following:
>=20
> 1) support an always-on clk, which is enabled by the framework at
> registration-time and can never be claimed and gated
>=20
> 2) support a hand-off clk, which is enabled by the framework at
> registration-time and whose reference counts are handed off to the first
> driver to get, prepare and enable this clk
>=20
> 3) forget about knowledgeable drivers because nobody needs this (yet)
>=20
> Lee was happy with this. Does it sound OK to you?

Yep, it sounds good!

See you in Dublin,

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--aNVUg3Xo9UgCa1D+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDZAFAAoJEBx+YmzsjxAg4HYP/1tcc1vBLSt1SybONKZicrpU
NzJmIkQbfO+jwW/F5iwlZh+njbMlCMKrmjfNnj63uv9FHe+YB3nOdYrTd1P8+82M
5ZNKGavjDCL/oQzJODIVt5gyL6fwFUXMuY+3T2AUgDS41Uy0okn644NycfDobXb9
Qj1bpvWfk8fb4IMq+T61xDKEPMc2RmITgFTKO5hfy51RKYXVw78IKIWL+JXC0aHG
ThqybBkrWQ/MRBWcrUt5dDUFlpHrVRp4tL7+/QfRTJHzyUxWKnJYibAN/+tfQV2z
7/hx9QMJpN+DkDQeCl4uYT886xaSUpiP256LwDDtnKdTtS84lR7cE2MdmfRZG3DY
p/ZXa1OpW6nRmJndQuynBAsOOeqKJ9cGhMg9PsTbFpTViH2MFKT37uZ9VYIZ5q1p
H4/aLZoPSIQLXg6ZH0NqkM1+98eC8mKxQdtvvuIBneqiyW2cwG1c3boHNc/ediZZ
ScDfPCqyvB5get5jURS6OdlJkpOeAKJYXtbn/fI+zWGLU7JYihrPRL5iAIxzmc85
5c/7qh2VSxHJ+qCgwmUI9ik/RkD0GjulWDTSNh3FvAuTKQtTO4pWTg+bs1cr5gEJ
+0cwonO/uaHprEPXfck39dnxR0Ptbpq106jW3ST+izI6cHJL0zDiP9gpVsO3qOKf
OYW3Ix9fbvIioPqnwKHF
=bwMr
-----END PGP SIGNATURE-----

--aNVUg3Xo9UgCa1D+--
