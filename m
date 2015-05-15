Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 15 May 2015 09:43:14 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 1/8] clk: sunxi: factors: Add m_start parameters
Message-ID: <20150515074314.GQ4004@lukather>
References: <1430565879-28113-1-git-send-email-maxime.ripard@free-electrons.com>
 <1430565879-28113-2-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v669fsz_pA+B0r8efp0BMxY-D86qfLuGQCqK1POuu9PmxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WZLuFERxa6Y0cbOt"
In-Reply-To: <CAGb2v669fsz_pA+B0r8efp0BMxY-D86qfLuGQCqK1POuu9PmxQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--WZLuFERxa6Y0cbOt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2015 at 05:12:07PM +0800, Chen-Yu Tsai wrote:
> On Sat, May 2, 2015 at 7:24 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Some clocks start incrementing the m factor at 0. Add a parameter to ha=
ndle
> > it just like we did for the N factor.
> >
> > Since the behaviour until now was to assume that the m factor was start=
ing
> > at 1, we also need to fix the other users.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi/clk-factors.c    | 11 ++++++++++-
> >  drivers/clk/sunxi/clk-factors.h    |  2 ++
> >  drivers/clk/sunxi/clk-mod0.c       |  2 ++
> >  drivers/clk/sunxi/clk-sun8i-mbus.c |  2 ++
> >  drivers/clk/sunxi/clk-sun9i-core.c |  6 ++++++
> >  drivers/clk/sunxi/clk-sunxi.c      | 10 ++++++++++
> >  6 files changed, 32 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-fa=
ctors.c
> > index 8c20190a3e9f..100a711c3e3d 100644
> > --- a/drivers/clk/sunxi/clk-factors.c
> > +++ b/drivers/clk/sunxi/clk-factors.c
> > @@ -56,15 +56,24 @@ static unsigned long clk_factors_recalc_rate(struct=
 clk_hw *hw,
> >         /* Get each individual factor if applicable */
> >         if (config->nwidth !=3D SUNXI_FACTORS_NOT_APPLICABLE)
> >                 n =3D FACTOR_GET(config->nshift, config->nwidth, reg);
> > +
> >         if (config->kwidth !=3D SUNXI_FACTORS_NOT_APPLICABLE)
> >                 k =3D FACTOR_GET(config->kshift, config->kwidth, reg);
> > +
> >         if (config->mwidth !=3D SUNXI_FACTORS_NOT_APPLICABLE)
> >                 m =3D FACTOR_GET(config->mshift, config->mwidth, reg);
> > +       else
> > +               /* Make sure we don't get a division by zero */
> > +               m =3D 1;
>=20
> What happens when mwidth is valid, m_start =3D 0, and m =3D 0?

That's a very good question. A division by zero in the kernel, I'd
say.

But I don't think we can end up in such a case today, and it's
somewhat expected that it will happen, and no clock have looked at can
actually end up in such a case.

> Other than that, this one looks good.

Thanks!

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--WZLuFERxa6Y0cbOt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVVaOSAAoJEBx+YmzsjxAg8gkP/0xlyPIm6ha2yc3iahAhLuoQ
SvFW+QTKaIJ6s8SgyXAh30nQPR6D5Fep5m2m570Erc4aegmbk3RMJQI6jSVHg12Z
xFptMG5+oZrJDQPguzy6SHeo7zaooOOW4897jT/6aI6Re1yPHgYWPML3uob2GOry
CxoCEwPDq78hM+jSa2TyNHtNx1kyCme9pPtMPidHUcLGlv592XsIeeE2OaIPiODQ
uekP2/oJUl6K82gr7flFn68Uy8+NEgxd/B5skw8ppm6Z40/7dEBo/KUuMoZt5nkt
EvLSvwnebauL79MLx3ZJIlsM2ZYYwpuT5ZHt1fYflsUaqGb9KT7G2hzjexgHwNPB
Esn6MJ0zamgsSYnkupR4SFkrVnczbs0XywEEIvwfXCa7ONDEsn6unortzebJo4lc
bVbFFE0oTwgcTVmGOcpQfd3QNZ2YsU0+1bSl6E1lJ2Y51QjR+Agr5yw8xy7bx4al
ZUns9BJPwWrc2s0vyONG93nlD84uvDwu3nCN7y/+afSy7DkBqOkgoddU30Ei5ZIe
Urc7eEyIE3JrBhZTbM5vJcYRynfCvuDd4TOjG0EXpMOP1/Ron8SzjMIh48640tE8
TcuJ2TmzELkgS9AGSRtmtPcoWeOu6J58CGI6eLmWRunolCPI8J4CE+NYga6TyQaO
pgeQ2A1guPKuCrQLy6R/
=VYwb
-----END PGP SIGNATURE-----

--WZLuFERxa6Y0cbOt--
