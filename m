Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Sat, 29 Aug 2015 05:49:49 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, s.hauer@pengutronix.de, geert@linux-m68k.org
Subject: Re: [PATCH RFC RFT 0/3] clk: detect per-user enable imbalances and
 implement hand-off
Message-ID: <20150829034949.GW29389@lukather>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <20150818154552.GI2547@lukather>
 <20150818164356.31346.80341@quantum>
 <20150820151510.GD30520@lukather>
 <20150825215051.31346.56261@quantum>
 <20150826065423.GR19409@x1>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9I0HVnGRacHebCDW"
In-Reply-To: <20150826065423.GR19409@x1>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--9I0HVnGRacHebCDW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2015 at 07:54:23AM +0100, Lee Jones wrote:
> On Tue, 25 Aug 2015, Michael Turquette wrote:
>=20
> > Quoting Maxime Ripard (2015-08-20 08:15:10)
> > > On Tue, Aug 18, 2015 at 09:43:56AM -0700, Michael Turquette wrote:
> > > > Quoting Maxime Ripard (2015-08-18 08:45:52)
> > > > > Hi Mike,
> > > > >=20
> > > > > On Fri, Aug 07, 2015 at 12:09:27PM -0700, Michael Turquette wrote:
> > > > > > All of the other kitchen sink stuff (DT binding, passing the fl=
ag back
> > > > > > to the framework when the clock consumer driver calls clk_put) =
was left
> > > > > > out because I do not see a real use case for it. If one can dem=
onstrate
> > > > > > a real use case (and not a hypothetical one) then this patch se=
ries can
> > > > > > be expanded further.
> > > > >=20
> > > > > I think there is a very trivial use case for passing back the
> > > > > reference to the framework, if during the probed, we have somethi=
ng
> > > > > like:
> > > > >=20
> > > > > clk =3D clk_get()
> > > > > clk_prepare_enable(clk)
> > > > > foo_framework_register()
> > > > >=20
> > > > > if foo_framework_register fails, the sensible thing to do would b=
e to
> > > > > call clk_disable_unprepare. If the clock was a critical clock, you
> > > > > just gated it.
> > > >=20
> > > > Hmm, a good point. Creating the "pass the reference back" call is n=
ot
> > > > hard technically. But how to keep from abusing it? E.g. I do not wa=
nt
> > > > that call to become an alternative to correct use of clk_enable.
> > > >=20
> > > > Maybe I'll need a Coccinelle script or just some regular sed to
> > > > occasionally search for new users of this api and audit them?
> > > >=20
> > > > I was hoping to not add any new consumer api at all :-/
> > >=20
> > > I don't think there's any abuse that can be done with the current API,
> > > nor do I think you need to have new functions either.
> > >=20
> > > If the clock is critical, when the customer calls
> > > clk_unprepare_disable on it, simply take back the reference you gave
> > > in the framework, and you're done. Or am I missing something?
> >=20
> > Maybe I am the one missing something? My goal was to allow the consumer
> > driver to gate the critical clock. So we need clk_disable_unused to
> > actually disable the clock for that to work.
> >=20
> > I think you are suggesting that clk_disable_unused should *not* disable
> > the clock if it is critical. Can you confirm that?
>=20
> My take is that a critical clock should only be disabled when a
> knowledgeable driver wants to gate it for a specific purpose [probably
> using clk_disable()].  Once the aforementioned driver no longer has a
> use for the clock [whether that happens with clk_unprepare_disable()
> or clk_put() ...] the clock should be ungated and be provided with
> critical status once more.

Agreed.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--9I0HVnGRacHebCDW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV4SvdAAoJEBx+YmzsjxAgoxMQAJw82kRs47N40mbVej3Xx3+V
yV11v9yYQYL7rOp8PINkcrr9tG+3h/SUHe4sbtfe95Bmrw+0GL64EnoTtPrwF/+r
bnBFUn+qsnp9RSp04vKeMqY/zEbCpTedhWbogl2kvI7UmLYteJ5cBJzhieUcl5o3
+oINgoKnmM2u0ALXVbS/Ewl7pgZ7e7F0TSkv2B8FqZDHNhXg06PskX3qsr+vxoxH
ZTHli0uUdvtTgVqJw3zYicABUCsu3hyiIeV4wjoJhT+7FhCp/0igqGBD1/WR+oYb
1Dawdt4APhOj8WZMrTUMN2I7RFUqfi+bNkLuJviwCgo/UG8cTHTjDkM3+XAVrq8A
bILyneOyWRD5IYI+qnBg6PP939MINIm45H2wBnA7VFn+orwwAT57EsX6yLT/hLtH
MEVEQ/rW9Bc+9E55Ae/Acv6JX9U0EK7GmkWXDs7Y+pbhrMy6Ah5HBK7SPCDuFEZd
+C/1MR5mkQP0+2ab4vnQM+4eruRBwdWBBEO8Bfop/ElULP17vvBR1GVaJYLibTQh
l9jJ7Ym7cC3Q8LBT3quERRmICxaLliF5Xev1xnZurJiuffgESzQs99yR5lKfOXmU
g7vQ+gKixWUqQEK8gXOUqM8mVCpgkCt7AILdEQBnw+2bkryja8eD1eGu7l8nswLu
wW27mDjODiBDv/rTAvps
=z9kQ
-----END PGP SIGNATURE-----

--9I0HVnGRacHebCDW--
