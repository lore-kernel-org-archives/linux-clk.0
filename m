Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Wed, 13 Jun 2018 15:17:52 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: Make vic03 a child of pll_c3
Message-ID: <20180613131752.GA17445@ulmo>
References: <20180611081853.31474-1-thierry.reding@gmail.com>
 <20180611082244.GA31882@ulmo>
 <20180612154025.GW27696@tbergstrom-lnx.Nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
In-Reply-To: <20180612154025.GW27696@tbergstrom-lnx.Nvidia.com>
List-ID: <linux-clk.vger.kernel.org>


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 12, 2018 at 06:40:25PM +0300, Peter De Schrijver wrote:
> On Mon, Jun 11, 2018 at 10:22:44AM +0200, Thierry Reding wrote:
> > On Mon, Jun 11, 2018 at 10:18:53AM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >=20
> > > By default, the vic03 clock is a child of pll_m but that runs at 924 =
MHz
> > > which is too fast for VIC. Make vic03 a child of pll_c3 by default so=
 it
> > > will run at a supported frequency.
> > >=20
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  drivers/clk/tegra/clk-tegra124.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk=
-tegra124.c
> > > index 0c69c7970950..f5048f82c0b9 100644
> > > --- a/drivers/clk/tegra/clk-tegra124.c
> > > +++ b/drivers/clk/tegra/clk-tegra124.c
> > > @@ -1290,6 +1290,7 @@ static struct tegra_clk_init_table common_init_=
table[] __initdata =3D {
> > >  	{ TEGRA124_CLK_MSELECT, TEGRA124_CLK_CLK_MAX, 0, 1 },
> > >  	{ TEGRA124_CLK_CSITE, TEGRA124_CLK_CLK_MAX, 0, 1 },
> > >  	{ TEGRA124_CLK_TSENSOR, TEGRA124_CLK_CLK_M, 400000, 0 },
> > > +	{ TEGRA124_CLK_VIC03, TEGRA124_CLK_PLL_C3, 0, 0 },
> > >  	/* must be the last entry */
> > >  	{ TEGRA124_CLK_CLK_MAX, TEGRA124_CLK_CLK_MAX, 0, 0 },
> > >  };
> >=20
> > Adding Peter for visibility.
>=20
> I think we should consider using the Assigned clock parents and rate feat=
ure
> of the DT clock binding.

I'm sure we could do that, but it'd also be completely inconsistent with
what we've done so far. These init tables effectively do the same thing
as the assigned parents and rate bindings, only they predate them and we
have done it this way essentially forever.

I think there's some benefit in moving to the new bindings, but perhaps
it'd make more sense to do it for Tegra186 and later because we don't
have any of these initialization tables there yet and we don't even have
a custom driver like this.

Thierry

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlshGX0ACgkQ3SOs138+
s6FFgQ//QEbajano7jhIxKDUKb6c2qGWVmQzBMNIeai/8114T4slymX1sdwb5LKb
TtIPiGDG+1Ag0Anik4zgRaE+kA7fgY+p3wSN5GklMWe5TisPwW6qgMFm7iV3biIY
xBqHcpwZ70fC6lUASyXCOkifE5nP1GoETPSI7FFuDRJWembHUBQN9Q+Z1y9rkh0H
e1kO50f2LpV8pFOT8m8XGAEy2+9kYE42hqLuIAlBjIHQZ+sx+RWvoWJgJNVLSWsB
4Jk3HpTpLkXYrXdibCYltUbdrAPl7GhZ3IwwY+0rbYZCFUJL1+Y9HKYd4u531A38
/SFPnfZJE9pmQGILGbyk+e9OuKLEY+zwpXhmsUpsvXH3NmD3LKjEAByr5lp9ulmW
EGhWz1ERYHGz2OLpYLXL+EAhfRyj7u38QwoTjTKGXOqffeAQU7jTt1kM6/oS6Uas
/ycVYms7Q0BRbXCr82HYxxDLQNBXceklv5NmqEtoi9tVe/FJZ5kuuKcb8VxcdLst
e0UPBmKqS9hQk469IwkOCWd6SReFWPKtIom5bsPAF4oykZd+UZ73dLxXR4qkyJ/V
VUydplQ9I5Dj1OWpBUZBTTm5sias6egbzLdK388L23I4kgKOR1wKciD4g3tU+G86
Bkh0U3luVR6EIZV26viFKGLVzuiDyZeqKw9lwQ331ZmjgfIzpdE=
=AlbF
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
