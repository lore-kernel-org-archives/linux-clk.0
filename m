Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 20 Oct 2016 19:26:21 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v4 2/9] clk: sunxi-ng: Remove the use of rational
 computations
Message-ID: <20161020172621.yzkhjwlfdxfmj3fy@lukather>
References: <cover.024e1b023e41efe548dc6a004f7a946408d5c9a2.1476196031.git-series.maxime.ripard@free-electrons.com>
 <50a2c9fe665c794dc97f524cacb63dc83d3efaa2.1476196031.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v65=xM3HpV05zt+q2vshX49MGkB88s7cfpwVYASodK11Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3xf3kggepyhnhpb3"
In-Reply-To: <CAGb2v65=xM3HpV05zt+q2vshX49MGkB88s7cfpwVYASodK11Nw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--3xf3kggepyhnhpb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2016 at 10:30:36PM +0800, Chen-Yu Tsai wrote:
> On Tue, Oct 11, 2016 at 10:28 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > While the rational library works great, it doesn't really allow us to a=
dd
> > more constraints, like the minimum.
> >
> > Remove that in order to be able to deal with the constraints we'll need.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi-ng/Kconfig    |  3 +--
> >  drivers/clk/sunxi-ng/ccu_nkm.c  | 31 +++++++++-----------
> >  drivers/clk/sunxi-ng/ccu_nkmp.c | 45 +++++++++++++---------------
> >  drivers/clk/sunxi-ng/ccu_nm.c   | 54 +++++++++++++++++++++++++---------
> >  4 files changed, 78 insertions(+), 55 deletions(-)
> >
>=20
> [...]
>=20
> > diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu=
_nkmp.c
> > index 9769dee99511..4b457d8cce11 100644
> > --- a/drivers/clk/sunxi-ng/ccu_nkmp.c
> > +++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
> > @@ -9,16 +9,15 @@
> >   */
> >
> >  #include <linux/clk-provider.h>
> > -#include <linux/rational.h>
> >
> >  #include "ccu_gate.h"
> >  #include "ccu_nkmp.h"
> >
> >  struct _ccu_nkmp {
> > -       unsigned long   n, max_n;
> > -       unsigned long   k, max_k;
> > -       unsigned long   m, max_m;
> > -       unsigned long   p, max_p;
> > +       unsigned long   n, min_n, max_n;
> > +       unsigned long   k, min_k, max_k;
> > +       unsigned long   m, min_m, max_m;
> > +       unsigned long   p, min_p, max_p;
>=20
> Wrong patch? Otherwise,
>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Indeed, fixed and applied.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3xf3kggepyhnhpb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCP49AAoJEBx+YmzsjxAgfPwP+QEVkcbvx1fC3IgtF+kOKP7k
9HsbLl8NS2YL2ydMomQcmf1Dc5EmIWfcxPddFlX+rSyBCB7fp3WOGoREC0nA/n13
7TOlWqfIx7TYtvYx+fjVo6VtpsB/q7OEYQ7Np+i68t4L71KsmQPeY7icHCSUEgFd
DA+hQsINOTE4A6TXa/8K/3YPVpLrykAK2rdhvaB0j1fKIWUWMzGpNJgp2Ty3WZ/q
nTZ6R+AOaa+/bMR4qROvADTO+lK61AnuxiU9qNJmeuiEbBH8z8wQVOx8qlJb0/QI
KcRKfIP4uanD4ij/FCSgwIqEqu1NefgsJSpyWwrWj3JRXnxKZuqxZiV6SZwD86dS
886fX5oTDCe0LuFU4/r8V/bryQXztOqq451vbSRSM2FTi3JXxy+Ka7sq72Hj8qiQ
j9NuXyEsgNAoDTZtk0O0XFMDfexgucd4iWH94HuDSkflUnwfM+tahTx60fii1v0j
EHRniyC9iIyHawudMYAdLZMRvbNsdQRsHxxwqljgnu1ba2aAb3STad+cRzk0HIIy
71UW/76xhBB7/tVU/07hIhSBUGo+85poimKwT94pmPo0t/PTT4WaJlHcclwpTKBn
lKlXAvqMVavmDvZAPRw40+RvQvYiJLZXTM1SGhJhlHxZtPAv5OVFpKB87Z1EwPrY
oBjf0xCRMGCuFZDo0ts/
=UhTp
-----END PGP SIGNATURE-----

--3xf3kggepyhnhpb3--
