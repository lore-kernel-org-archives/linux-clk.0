Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 15 May 2016 21:04:15 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 12/16] clk: sunxi-ng: Add N-M-factor clock support
Message-ID: <20160515190415.GC27618@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
 <1462737711-10017-13-git-send-email-maxime.ripard@free-electrons.com>
 <20160509092421.a36252139fd6b00b2cd32f24@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
In-Reply-To: <20160509092421.a36252139fd6b00b2cd32f24@free.fr>
List-ID: <linux-clk.vger.kernel.org>


--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 09, 2016 at 09:24:21AM +0200, Jean-Francois Moine wrote:
> On Sun,  8 May 2016 22:01:47 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > Introduce support for clocks that multiply and divide using linear fact=
ors.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi-ng/Makefile |   1 +
> >  drivers/clk/sunxi-ng/ccu_nm.c | 103 ++++++++++++++++++++++++++++++++++=
++++++++
> >  drivers/clk/sunxi-ng/ccu_nm.h |  41 +++++++++++++++++
> >  3 files changed, 145 insertions(+)
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_nm.c
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_nm.h
> 	[snip]
> > diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_n=
m.c
> > new file mode 100644
> > index 000000000000..268637db137b
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu_nm.c
> > @@ -0,0 +1,103 @@
> 	[snip]
> > +static long ccu_nm_round_rate(struct clk_hw *hw, unsigned long rate,
> > +			      unsigned long *parent_rate)
> > +{
> > +	struct ccu_nm *nm =3D hw_to_ccu_nm(hw);
> > +	unsigned long n, m;
> > +
> > +	rational_best_approximation(rate, *parent_rate,
> > +				    nm->n.width, nm->m.width, &n, &m);
>=20
> Should be
> 			1 << nm->n.width, 1 << nm->m.width, &n, &m);
>=20
> > +
> > +	return *parent_rate * n / m;
> > +}
> > +
> > +static int ccu_nm_set_rate(struct clk_hw *hw, unsigned long rate,
> > +			   unsigned long parent_rate)
> > +{
> > +	struct ccu_nm *nm =3D hw_to_ccu_nm(hw);
> > +	unsigned long flags;
> > +	unsigned long n, m;
> > +	u32 reg;
> > +
> > +	rational_best_approximation(rate, parent_rate,
> > +				    nm->n.width, nm->m.width, &n, &m);
>=20
> Idem

Indeed, fixed.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXOMguAAoJEBx+YmzsjxAgjlMP/1a5rKAEmNU229/foVfakbWP
nIJLAjPULDrozATaVzq+EVBhN1iRQk/GuSn26FWSZU5UUy1gSqKEy7qq1u9kRaPo
RekLS6iQBPrzyz1f32Sj83YqRsMmU5AFuRa5mTmF2HowSvZO4ptfr8+So/vEz/0k
h61h5pTjbstdBLv1d9SQyMnBM1Tq7BeeL7pdWoiOc+zeH9dFthoXvS7z/3YQLuEC
AZ54CCPGr3JrfwdsmaLnleMke0kNSrH5OzyGZHLG/BwfVBgaMVmnGpbjQsVmXtFf
31LhysRYCJleGmmglylXdyyfW0XR5L78/X7K/sM+R7KDXJEQZIK3Wb9bBdXA6ScV
lL7UlGOYvkoDIxRldNDfXU59MlGkSdZ189PF2RJMEd5qX8dAIoGaTWbvkPxW6cro
AMEOBUzKZlkdl817LG80W5OD0FU1l2SiWGTOAVsxw1GU3pc7hdpHuW1ee2IpEk22
O+1Jm0aNsKcx8rs1YdrIHVXFTbpDtoT65SEy0b3Ds/apD52xc0jVU0IHBoqMG11d
5EoMoUWJ/CITwTbZe874BJNfdU5xcCdmpvjxHqF8yb72F9mEz9KbmG5NLYebSSfT
pz8rT44E4XdqPA8YtQ8A2EXta8o/axJGbqVsMACECKCJacNm+t6AfVr+BYtNL0Ri
u+ysWw+TJUxI6rupYQ3P
=gNDi
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--
