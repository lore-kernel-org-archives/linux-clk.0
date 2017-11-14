Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 14 Nov 2017 10:04:25 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,  Linus Walleij <linus.walleij@linaro.org>, Quentin Schulz  <quentin.schulz@free-electrons.com>, Kevin Hilman  <khilman@baylibre.com>, Peter De Schrijver" <pdeschrijver@nvidia.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v4 00/10] clk: implement clock rate protection mechanism
Message-ID: <20171114090425.blmrlpfwsvbviysc@flea.lan>
References: <20170924200030.6227-1-jbrunet@baylibre.com>
 <150899576543.90597.13810909942564444110@resonance>
 <20171102090405.wletgjwzbtkmljc3@flea>
 <1509615364.24591.23.camel@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yf75mfbivi6gsp3u"
In-Reply-To: <1509615364.24591.23.camel@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>


--yf75mfbivi6gsp3u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jerome,

Sorry for the delay.

On Thu, Nov 02, 2017 at 10:36:04AM +0100, Jerome Brunet wrote:
> On Thu, 2017-11-02 at 10:04 +0100, Maxime Ripard wrote:
> > Hi Mike,
> >=20
> > On Thu, Oct 26, 2017 at 07:29:25AM +0200, Michael Turquette wrote:
> > > Quoting Jerome Brunet (2017-09-24 22:00:20)
> > > > This Patchset is related the RFC [0] and the discussion around
> > > > CLK_SET_RATE_GATE available here [1]
> > >=20
> > > + Maxime & ChenYu
> > >=20
> > > Have you tested this latest version? If it works for you as expected,
> > > please feel free to add your Tested-by's.
> >=20
> > We were not in Cc on this one (obviously) and I'm not subscribed to
> > linux-clk, is there a git branch available somewhere so we can test?
>=20
> Here it is:
> https://github.com/jeromebrunet/linux/commits/amlogic/wip/clk-lock
>=20
> Happy testing !

I just tested your current branch (133a1f17e38d) and it works just
fine.

Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--yf75mfbivi6gsp3u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJaCrGZAAoJEBx+YmzsjxAgZGwQAIaKL7oxWakwpiQh1WCgbRQJ
pJeyXH5fjtdRNbNH3C22JGKutQvI7RvPp+Syh3zpje2fwykfcSNio8kFByEUnnFx
TbdBOwobM/YJgqx1CPc4Xc4RxRreya5Konmhul+HsBjOeX0Li2ZTDxV6W0TNo6Sg
m3PaSst0QXvP0KzrctvridkZ0jSiuaJUKb6pl7hM50GimuMQv05QjXEzRRj5lUpI
q5qGes+82kRHbco7zsZl2xnfuj1cFm9I26/vZkZeOhhoT6Lko8Siq61rxWKBxLct
mRkQNDIW/3WFNm0goGfYizLR8c0G3leVFKgNot3nqVUjOX2DSOT5K2iIQZoFzwe4
qzT0bDmJqDk9b6AJDPlTgDWQMUuU2qwYgKjHlRuFFJT+ZdmxpNwejZ8UeSAPenCF
/6k9UqBZbrNbsOgHTFkekww1cJEBXd4prP032AQLjkJznHV1no7L2OsBzmRRKPkk
beZ4TSUI/sHiRAS8cLAwqi3pQ41uGY138qSrlBm44AVhc23yEr9qOCM+jwdF5wcf
Lv6lpoXfK1jfV/3Wlpk1XdZTiSQ1wJ8/E/0mentgS7wu9dZ0jwkoN1oip47FpeaL
FgM1LB+4a4gGWh5MNqL1zWfBspiSTlFdVClNJxkyU/YeYfBMGJk/2F3d1ADM+E5E
tqeBnzUscfAcyjrh7dND
=lTay
-----END PGP SIGNATURE-----

--yf75mfbivi6gsp3u--
