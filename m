Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 19 Jan 2017 22:04:23 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 3/7] clk: sunxi-ng: Implement multiplier maximum
Message-ID: <20170119210423.5kjs3envfosjlsmr@lukather>
References: <cover.8762813dc78858261716126c700983d4aee00458.1484035021.git-series.maxime.ripard@free-electrons.com>
 <ab8ef79d63fc09c3eaa556d299832ec06e9869cf.1484035021.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v65K8zQvHbhwZ6b6VhO6egXVQN4agHQ1JT8rkHzNsAEUtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kzhsujnrm2whpi2q"
In-Reply-To: <CAGb2v65K8zQvHbhwZ6b6VhO6egXVQN4agHQ1JT8rkHzNsAEUtw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--kzhsujnrm2whpi2q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 16, 2017 at 01:58:18PM +0800, Chen-Yu Tsai wrote:
> On Tue, Jan 10, 2017 at 3:57 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu_mult.c |  4 ++--
> >  drivers/clk/sunxi-ng/ccu_mult.h | 10 ++++++----
> >  drivers/clk/sunxi-ng/ccu_nk.c   |  8 ++++----
> >  drivers/clk/sunxi-ng/ccu_nkm.c  |  8 ++++----
> >  drivers/clk/sunxi-ng/ccu_nkmp.c |  8 ++++----
> >  drivers/clk/sunxi-ng/ccu_nm.c   |  4 ++--
> >  6 files changed, 22 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu_mult.c b/drivers/clk/sunxi-ng/ccu=
_mult.c
> > index bf5e11c803f9..fccfe1e1961a 100644
> > --- a/drivers/clk/sunxi-ng/ccu_mult.c
> > +++ b/drivers/clk/sunxi-ng/ccu_mult.c
> > @@ -41,7 +41,7 @@ static unsigned long ccu_mult_round_rate(struct ccu_m=
ux_internal *mux,
> >         struct _ccu_mult _cm;
> >
> >         _cm.min =3D 1;
> > -       _cm.max =3D 1 << cm->mult.width;
> > +       _cm.max =3D cm->mult.max ?: 1 << cm->mult.width;
>=20
> Should you also factor in the offset when providing the default
> value for max? Otherwise you might end up with a value that is
> actually not progammable?
>=20
> Say if offset is 1, then max would be 1 << width.
> But if offset is 0, then max would have to be (1 << width) - 1,
> as (1 << width) is not valid.

Ah, yes, that's true. I'll fix it.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kzhsujnrm2whpi2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgSnTAAoJEBx+YmzsjxAgKwwP/A1IXv+HtMaI6Ml17zlJeA4U
KAPKe3B4Z67gRPFELCURqt26oSojdeFBkZo4QHj1RRLdmL2jKL0FqIjUv4j8+6Dp
HLH1b20Ans0Nze5+GsBrGV7+W/OZC7C7dya7ffURWfIl5WpxY3KHRxqlTfzvG/yG
U0wpTKoXT6RbugAwAmnEaekcG/XeEphGIGC4ZUxSFzLPMxs7kz+a/2AG/flfPcDS
PL+uu1Q+TsEz8q4hLpna1laB++gC4Qqce7jFyC75awwk4/zJbcyD6NLwK0BLU5Qw
F/CxOaSL07mEVUqAwEhphnN4RGuHeMHuCYM60t4nGAH/vCTpUeOE+hLOmsWT+CJ/
iNEwxsO76wAfEhsubtcOrUll4Qys6SMifwrlxOb61nKdugXwICWM31mHtYFpq5Xq
+4D7PwGiD27uPPLcPHHigf+ZEwhTVmaG5HwRENiMZwnkN6L+xa2H9bSq6Pm8CcHL
yb35ASOBqK5JsOcMyW+I7Ua8bqr+YRl7A+Ki1PAk351U13VcFV1pMDXThi1w51fg
U6ycmnsSJXUNh8DWVw3pkxueWVo3vnxXw3usPkzaaQgR0ahQxPobj/abCgWsg4b4
yHjyk5z6QAT6DoTpFZS4cLGzet9qGpj3P3khbKWhzEGD4qiQTCdZPPPMLCjpaX8S
yAbZyoiRxn1fgfrjahbs
=BHXo
-----END PGP SIGNATURE-----

--kzhsujnrm2whpi2q--
