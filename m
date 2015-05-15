Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 15 May 2015 10:05:46 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 1/8] clk: sunxi: factors: Add m_start parameters
Message-ID: <20150515080546.GT4004@lukather>
References: <1430565879-28113-1-git-send-email-maxime.ripard@free-electrons.com>
 <1430565879-28113-2-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v669fsz_pA+B0r8efp0BMxY-D86qfLuGQCqK1POuu9PmxQ@mail.gmail.com>
 <20150515074314.GQ4004@lukather>
 <CAGb2v66jRX09k48ciR-bwMZRAioRpHKZ3D2+wVYWannjtF+G3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VZEZlOQeSr/zV9d3"
In-Reply-To: <CAGb2v66jRX09k48ciR-bwMZRAioRpHKZ3D2+wVYWannjtF+G3w@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--VZEZlOQeSr/zV9d3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2015 at 03:48:38PM +0800, Chen-Yu Tsai wrote:
> On Fri, May 15, 2015 at 3:43 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Thu, May 14, 2015 at 05:12:07PM +0800, Chen-Yu Tsai wrote:
> >> On Sat, May 2, 2015 at 7:24 PM, Maxime Ripard
> >> <maxime.ripard@free-electrons.com> wrote:
> >> > Some clocks start incrementing the m factor at 0. Add a parameter to=
 handle
> >> > it just like we did for the N factor.
> >> >
> >> > Since the behaviour until now was to assume that the m factor was st=
arting
> >> > at 1, we also need to fix the other users.
> >> >
> >> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> >> > ---
> >> >  drivers/clk/sunxi/clk-factors.c    | 11 ++++++++++-
> >> >  drivers/clk/sunxi/clk-factors.h    |  2 ++
> >> >  drivers/clk/sunxi/clk-mod0.c       |  2 ++
> >> >  drivers/clk/sunxi/clk-sun8i-mbus.c |  2 ++
> >> >  drivers/clk/sunxi/clk-sun9i-core.c |  6 ++++++
> >> >  drivers/clk/sunxi/clk-sunxi.c      | 10 ++++++++++
> >> >  6 files changed, 32 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk=
-factors.c
> >> > index 8c20190a3e9f..100a711c3e3d 100644
> >> > --- a/drivers/clk/sunxi/clk-factors.c
> >> > +++ b/drivers/clk/sunxi/clk-factors.c
> >> > @@ -56,15 +56,24 @@ static unsigned long clk_factors_recalc_rate(str=
uct clk_hw *hw,
> >> >         /* Get each individual factor if applicable */
> >> >         if (config->nwidth !=3D SUNXI_FACTORS_NOT_APPLICABLE)
> >> >                 n =3D FACTOR_GET(config->nshift, config->nwidth, reg=
);
> >> > +
> >> >         if (config->kwidth !=3D SUNXI_FACTORS_NOT_APPLICABLE)
> >> >                 k =3D FACTOR_GET(config->kshift, config->kwidth, reg=
);
> >> > +
> >> >         if (config->mwidth !=3D SUNXI_FACTORS_NOT_APPLICABLE)
> >> >                 m =3D FACTOR_GET(config->mshift, config->mwidth, reg=
);
> >> > +       else
> >> > +               /* Make sure we don't get a division by zero */
> >> > +               m =3D 1;
> >>
> >> What happens when mwidth is valid, m_start =3D 0, and m =3D 0?
> >
> > That's a very good question. A division by zero in the kernel, I'd
> > say.
> >
> > But I don't think we can end up in such a case today, and it's
> > somewhat expected that it will happen, and no clock have looked at can
> > actually end up in such a case.
>=20
> It's possible if the bootloader left the clock in an invalid state.
> How about just returning 0, indicating an invalid rate, early?

The value set in the register might be zero, but that will always
really mean 1, either through m_start or m_zero. That would be a bug
in the driver itself.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--VZEZlOQeSr/zV9d3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVVajaAAoJEBx+YmzsjxAg0+sP/0ZY9cedE5SkzErVoAcwA44t
YysXr8HNOk2gydCS7bAFTP2TFGYVisdoBk2IWOXy6oC91i0UCrNW0Mbm/M8PKHmQ
dkjkltF1gAmY+6tA82Wgwe7kmkaa1wEakDiI8GEZRME5eSK17EIcXkBhoBArDEvG
PrINQlTOOox80EJB9Wit+0GjV7GuPfCuQkgASjQM06B2MZXxCYw9I5Jddmvt1mnB
OyCn3TFp1iDP4pC9qmOQjVzkGgCSKqbKrbLta3QSQVhdWxpfyvqpKuAr/RcZirer
y97SB9J3XNKcw8SRf8qiWWIDtwVpeswwT4USxWoykrUuyv9LGH/KnP+Os/CYSTLu
oSSK4ecxNOD9PO0Bis4k0Lxrpo16xizUwNhorpZ1kF3n8w/9EoQzefjWrEg78+yR
mXZAYuWQPOYzwPG9a6aOE0karZHuf2MhGbH+VynArwk1V7Cn5RCc6AEz8ivMpMws
yMBhq2Wz6zoj/XYyd1THV++cp8sGv7KA2AUpL9Qv8HjZTfb52Ihgmbm759Oy/Pzf
PIypgYGqdrwREIY3f//IeeIPd3nFdZQ+84cijyUW88GueL3hLxbMz3+j13eFZQGz
brmcFfJeFC6mHtUiKd51JVYKmn6ASCAPk9iqFNbQ0ejmsU4l1c1T7kqFGWUuyOBx
ksxv76GLSI25KuXW9acy
=VQAW
-----END PGP SIGNATURE-----

--VZEZlOQeSr/zV9d3--
