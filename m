Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 23 May 2016 19:01:29 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 07/16] clk: sunxi-ng: Add phase clock support
Message-ID: <20160523170129.GB27618@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
 <1462737711-10017-8-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v661dvdPKj9DWL7LWGgiDCEk7G-a_7jv5gb+KBMoWbR8Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HFNNDGBA8bk+zEXz"
In-Reply-To: <CAGb2v661dvdPKj9DWL7LWGgiDCEk7G-a_7jv5gb+KBMoWbR8Lg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--HFNNDGBA8bk+zEXz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, May 22, 2016 at 12:43:48AM +0800, Chen-Yu Tsai wrote:
> > +static int ccu_phase_set_phase(struct clk_hw *hw, int degrees)
> > +{
> > +       struct ccu_phase *phase =3D hw_to_ccu_phase(hw);
> > +       struct clk_hw *parent, *pparent;
> > +       unsigned int parent_rate, pparent_rate;
>=20
> grandparent(_rate) would be easier to understand.

Ack.

>=20
> > +       unsigned long flags;
> > +       u32 reg;
> > +       u8 delay;
> > +
> > +       /* Get our parent clock, it's the one that can adjust its rate =
*/
> > +       parent =3D clk_hw_get_parent(hw);
> > +       if (!parent)
> > +               return -EINVAL;
> > +
> > +       /* And its rate */
> > +       parent_rate =3D clk_hw_get_rate(parent);
> > +       if (!parent_rate)
> > +               return -EINVAL;
> > +
> > +       /* Now, get our parent's parent (most likely some PLL) */
> > +       pparent =3D clk_hw_get_parent(parent);
> > +       if (!pparent)
> > +               return -EINVAL;
> > +
> > +       /* And its rate */
> > +       pparent_rate =3D clk_hw_get_rate(pparent);
> > +       if (!pparent_rate)
> > +               return -EINVAL;
> > +
> > +       if (degrees !=3D 180) {
> > +               u16 step, parent_div;
> > +
> > +               /* Get our parent divider */
> > +               parent_div =3D pparent_rate / parent_rate;
> > +
> > +               /*
> > +                * We can only outphase the clocks by multiple of the
> > +                * PLL's period.
> > +                *
> > +                * Since our parent clock is only a divider, and the
> > +                * formula to get the outphasing in degrees is deg =3D
> > +                * 360 * delta / period
> > +                *
> > +                * If we simplify this formula, we can see that the
> > +                * only thing that we're concerned about is the number
> > +                * of period we want to outphase our clock from, and
> > +                * the divider set by our parent clock.
> > +                */
> > +               step =3D DIV_ROUND_CLOSEST(360, parent_div);
> > +               delay =3D DIV_ROUND_CLOSEST(degrees, step);
>=20
> Doesn't this mean some delay values are impossible to set?
>=20
> For instance, for PLL =3D 600 MHz and this clock =3D 50 MHz, div would be=
 12,
> and a step would be 30 degrees. This means we can't ask for a delay of 6,
> which is 180 degrees.
>=20
> For PLL =3D 600 MHz, clock =3D 100 MHz, div would be 6, and a step is 60
> degrees. Therefor we can't ask for a delay of 3.

You don't ask for a delay, you ask for an outphasing in degrees. In
the hardware, in the register 0 means an outphasing of 180 degrees
(and this has been confirmed by Allwinner a while back). In the two
cases you point out, we would have two ways of achieving the same
thing, we prefer one over another, but I don't see how it's
problematic.

It's also a direct copy of the current code we have, which didn't
raise any objection, or had any known bugs.

> > +struct ccu_phase {
> > +       u8                      shift;
> > +       u8                      width;
>=20
> Not sure why you used struct ccu_factor in the divider table clock,
> but separate fields directly in ccu_phase here.

Because this is not meant for the same thing. ccu_factor is probably
going to go away anyway because of the dividers consolidation.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--HFNNDGBA8bk+zEXz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXQzdoAAoJEBx+YmzsjxAgYwYP+wY8eoANeU4BRi/wLKMRDtNB
LmCqwhBF+3lJbrro37EApEUrUR7t4sJY13XhBGqY14D/A3ax8PRjng/7Atvt57rX
5YNiBBUHjnpXZnJZivKTpXFC9Q6Q0kgYzBYqtiIvrFCMZkeomEbXaNraXtFBwHg1
Uny4ULBMymZFMC46ycNeDmBUdKdlc6EXgL5HcSFU8i/d/NRd45DXp2q4AYci0iTq
w50xUgPX0lAg1zSd85tnfPkOULlWN7y0y+1sFtrvmrGGAVkP1yTsOHC7Udii8bk2
R0EAd6jpMhmUD5qkFrw3/tI95YmcOWJzZmC0vx9BvY9JKo+p9yL1+xKTveLYTL8R
XVnM0exr70pIFZ7AhCYSk8/2L7/6ltqursrb/gYEMZRNIxQcl/M5dyH0hsHHbK61
GlQusN3S3NMaGMQMSd0g5vx6tA9PT+6RBztv82zWyrcxURXIOSOQ7HfpN1v64e5U
SvcMU//XNR2y4IIEh/CdYmqRx1VR4jrts7rjlwRr5HkCQPDvnF29q3BiMuSeRMD6
GLxcsnhKCbWIkRXTaA/wOozoys9ECrw36gk6SAEeXuxjq333Hsq59exEGC3yCONv
85IaMzaBOABKKqTqLNO+EZOLPdXbr9cRiZv6PB4HfWJIxmNLauGiYQks+ogQE30V
s2xOn4ttZh4rgR0nzcEV
=FteC
-----END PGP SIGNATURE-----

--HFNNDGBA8bk+zEXz--
