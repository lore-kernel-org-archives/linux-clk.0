Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 19 Aug 2015 11:13:58 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jim Quinlan <jim2101024@gmail.com>,
	"Stephen Boyd <sboyd@codeaurora.org>, Emilio Lopez <emilio@elopez.com.ar>, Hans de Goede <hdegoede@redhat.com>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/7] clk: Add a basic factor clock
Message-ID: <20150819091358.GB30520@lukather>
References: <1432241646-9511-1-git-send-email-maxime.ripard@free-electrons.com>
 <1432241646-9511-2-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v64rqRC24wPWz5xYZv=w2QAtsCb-pd76Qynkb5NBCptXhQ@mail.gmail.com>
 <20150523074930.GI8557@lukather>
 <20150724000001.642.84690@quantum>
 <20150724065017.GJ2373@lukather>
 <20150724182619.642.11590@quantum>
 <20150725073925.GK2564@lukather>
 <20150811213041.31346.58562@quantum>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
In-Reply-To: <20150811213041.31346.58562@quantum>
List-ID: <linux-clk.vger.kernel.org>


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2015 at 02:30:41PM -0700, Michael Turquette wrote:
> > > The real problem with these basic clock types is that they are an
> > > abstraction layer at the wrong level. Each clock type implements both
> > > the policy of a given clock, as well as the machine-specific details.
> > > For example clk-divider.c has made some assumptions in the past about
> > > rounding the rate, or how to calculate the best divider; this is a
> > > matter of policy and is useful on its own. But additionally that same
> > > policy is glued to a specific implementation: memory-mapped register
> > > controls for a clock divider.
> > >=20
> > > The I/O accessor stuff needs to be addressed at some point.  Currently
> > > the basic clock types assume specific patterns of access to
> > > memory-mapped clock registers. There are lots of other clock controls
> > > out there that talk to firmware, or over i2c, or whatever. The amount=
 of
> > > code that has to be copy/pasted for each different type of access is
> > > 100%; i.e. we do not have abstractions at the right level such as
> > > .get_best_div(struct clk_hw *hw, unsigned long rate).
> > >=20
> > > What I would like to see in time is a re-usable layer for clock policy
> > > (e.g. common rules for how dividers or multipliers should behave), and
> > > then have that sit on top of the machine-specific callbacks that
> > > directly touch the hardware, such as the .get_best_div callback above.
> >=20
> > Can't that be solved by moving to regmap using Matthias' patches, or
> > at least the IO method abstraction?
>=20
> I need to look at those patches again, but I do not think they address
> the problem I described above: abstraction at the wrong level (or more
> specifically, combining two abstract layers into one).

Well, maybe I'm missing something, but you end up with this patch with
the clock driver allocating the regmap, and passing it to the generic
part of the clock framework, that will only do regmap calls and not
care anymore about what kind of accesses it is (the point of regmap
being the abstraction).

Isn't it what you were looking for?

> I'll have more bandwidth to look at this problem after the next merge
> window. The clk framework is slowly be rewritten in bits and pieces here
> on the list (shh don't tell anybody) and this is on my radar and
> Stephen's.

Ok, i'll resend it after the merge window then.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV1EjWAAoJEBx+YmzsjxAgJHAP/3qLQkzEs2XAOrt1EChVY/wo
NF+G/B3SgiPNfKl5Q0nwfrqvCjTHwrSsBsPRjWsT6UUKmWMvTWtye9S8omGXapm3
ecGsv/YlqKC6VsaV+VOoz5J0NlIZOC9ZMsA/HngiCiMtwFIpK31eimTTkItYVwrB
APk/48h/hDTX7p5YCPRrnDO1b0h2AIY28K3yjqbnZxN0wrd8kFHe99QUzqZpeOVC
tjN79Dmd9MoxZYzR8O+FM2bS8eN0rCuMP9JykWYNLN49xAc0dfxdwcoFI26XC7ja
JuAfiNvT9JVGEHZ2DIKUCcSzvjqSgtfcax/eQYkvRPsGa/t8sfSQmXI9XNxQTvXe
C+24OCSpuYnjR2WkZD1+taFN+6WXUtOWXLLtpXqpH1fNXUsdvsh9RppBPGI+TNBk
MbBlf89hWFkdeNzhuNgf8LQQWGgy1Yk94lK3G38Rk+ybowGd98vsF9eRFG20QUbO
EUOblCwrvmQgSq+RZHn++4qIf5jmpILgSzvjtak9joqAUGT0Oa0xPvEXDpXBC183
usFdAUbLKMUD8OXLuwgLo8eEgzFmGe2yelQo3NDJ3kHG3HasvjnJZmBNOjq8lqUr
nlF5JMYN7qEQzWHzynGMWQYHju6z9eQ7o1W1Z/GEiYsl129j6GHWth9rb0CznrMg
Z0yjvNXvSnhOysUPrGn+
=g1bt
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
