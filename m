Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 7 Oct 2015 12:04:57 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Emilio Lopez <emilio@elopez.com.ar>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 1/5] clk: Add a basic multiplier clock
Message-ID: <20151007110457.GF2278@lukather>
References: <1443512353-28073-1-git-send-email-maxime.ripard@free-electrons.com>
 <1443512353-28073-2-git-send-email-maxime.ripard@free-electrons.com>
 <20151002204308.GY12338@codeaurora.org>
 <20151005101932.GH2696@lukather>
 <20151005180929.GB12338@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yH1ZJFh+qWm+VodA"
In-Reply-To: <20151005180929.GB12338@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--yH1ZJFh+qWm+VodA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2015 at 11:09:29AM -0700, Stephen Boyd wrote:
> On 10/05, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Fri, Oct 02, 2015 at 01:43:08PM -0700, Stephen Boyd wrote:
> > > On 09/29, Maxime Ripard wrote:
> > > > +
> > > > +	if (!val && mult->flags & CLK_MULTIPLIER_ZERO_BYPASS)
> > > > +		val =3D 1;
> > > > +=09
> > > > +	return parent_rate * val;
> > > > +}
> > > > +
> > > > +static bool __is_best_rate(unsigned long rate, unsigned long new,
> > > > +			   unsigned long best, unsigned long flags)
> > > > +{
> > > > +	if (flags & CLK_MULTIPLIER_ROUND_CLOSEST)
> > >=20
> > > Is the only difference in this function vs the divider one that
> > > flag? Maybe we should make this function generic to the framework
> > > and pass a flag indicating closest or not.
> >=20
> > Actually, the logic is also reversed.
> >=20
> > The divider driver will always try to find some rate that is higher
> > than the one we already have, without going above than the one
> > requested.
> >=20
> > Here, we're tring to be lower than the best rate, without going below
> > the requested rate.
>=20
> So then a tri-state flag that indicates, closest, less than,
> greater than?

Still, the computation itself is different, and the only consolidation
we could possibly do is by not duplicating the ROUND_CLOSEST. We would
end up with two different code pathes in the same function, which I
feel would make it unnecessarily complex.

>=20
> >=20
> > >=20
> > > > +	unsigned long val;
> > > > +
> > > > +	if (mult->lock)
> > > > +		spin_lock_irqsave(mult->lock, flags);
> > >=20
> > > This needs the same "trick" that we did in the generic clock
> > > types to avoid sparse warnings.
> >=20
> > The __acquire call ?
>=20
> Yes.

Ok.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--yH1ZJFh+qWm+VodA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWFPxZAAoJEBx+YmzsjxAgi8kP/3VzKbAU6CZxPJc66iDXU54R
KT5IkqfSh2LugvdRV0mei5P07OaWM/1yTB7ffQbIzmAtKZYr8jKGQSoZMTK4zM0o
1sZt6/7b2EnkkmwHnsyWm4d/QATluYgzLtTm2Zu75b1OGctzjVuLuoG2oGGhjBdu
TtpUXtdZeWw940n1PyqYINIEYCG1GN9q0udvbvXrPMq69RE6Udpt6FsVDCAVcCCP
SciRPYdSHnfmoxeiiiiqlofyIwGut7bj4h0RlYYGbpsu/SRgySbQSq2sxBeIbQX2
2YVoBvrPS423qgSePJSZQ5/nQRZ+MWFGFsQQXtZ/Ele+bqGJhQ8+xDQWCeHOFnlO
tXKd/PYwi+wFDik+mLuJ01OTewdsCJIEx6iSyeW7GII+HNkTAMYJJtnSrehnyRkm
atzkNyUBHjT8xjbHzVLQ82LHHHYEAf2nrd5Skn+6rPihG15/RejOwNq/Tx1IPBtl
YzGTPONbC349WhHtwLFOROMyi9eD9eElW1dAAT5rMAAsDm5fWvc394sAZoRZ2U9y
l94UGAS8BVAybNBvPfpXRsiKexzozkMms1d2CJP123ve9XA7aFGoKZAGTZYfQs7G
4c0oiQOD7OHwvyerrCkg3ta9hY1vp8j8rVogg71WbU1/X3fHgBYfJuT7JLKDdpeT
+VId66MDusXvp8VVLEDu
=K3GR
-----END PGP SIGNATURE-----

--yH1ZJFh+qWm+VodA--
