Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 11 Feb 2016 10:53:15 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4] clk: sunxi: Refactor A31 PLL6 so that it can be reused
Message-ID: <20160211095315.GJ31506@lukather>
References: <1454358000-13594-1-git-send-email-maxime.ripard@free-electrons.com>
 <20160204120507.GC4270@lukather>
 <20160204162545.f806fcb64a826d2c3313985b@free.fr>
 <20160210125333.GC31506@lukather>
 <20160210180420.0968c2018bf5fbe54a28a505@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dyTp/pkqtoagvozp"
In-Reply-To: <20160210180420.0968c2018bf5fbe54a28a505@free.fr>
List-ID: <linux-clk.vger.kernel.org>


--dyTp/pkqtoagvozp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 10, 2016 at 06:04:20PM +0100, Jean-Francois Moine wrote:
> On Wed, 10 Feb 2016 13:53:33 +0100
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > > I don't agree:
> > > - you changed the DTs of many SoCs without any valid reason,
> >=20
> > I did give you a significant number of reasons [1]. The fact that you
> > chose to ignore them is up to you.
>=20
> Sorry, I don't see any reason for changing the DT definition of the pll6.
> The clock is named "pll6" with "#clock-cells =3D <1>;" in all DTs,
> and it works as it is.
> If you want an other clock as "pll8", with the same HW description,
> you must add new code for this clock.

That's not how it works. If an hardware block is strictly identical,
then it should use the same compatible.

The PLL8 is exactly the same one than PLL6, therefore it should use
the same compatible.

> > Except that it doesn't match the hardware and that the parenthood
> > relationship is inversed. The pll6 output is 24 MHz * n * k / 2, as
> > seen in any datasheet that uses it. Your clock driver doesn't
> > represent that fact.
>=20
> The datasheet says that the pll6x2 output is 24 MHz * n * k, then, if
> I remember correctly my lessons at primary school, defining pll6 as
> (pll6x2 / 2) gives 24 MHz * n * k / 2 as the pll6 output. No?

Or, you could keep the same parenting relationship that we had and use
a simpler model. Ever heard of Occam's razor (and quite literally for
once)?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--dyTp/pkqtoagvozp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWvFoLAAoJEBx+YmzsjxAgTicP/i1eFmCj/A/aBiGF+1Ma3JkG
/DL8kjmH9tPsUY1l/EuhEBbNIQmwUDTvLrecNQClGJhOzK7g9hitGFx6X96+UXqu
v52KrxmfKGkS908/WG3t/X87q962fn1nZmJ8ggz5zrsDndibz7jPeWn1ifJBQPuj
XDyf70t4y6yLaJsUtpMNrJ+OT+QDzJQa8+T1/JduKWGO5zK9DfiIM4iBuHqgfTHS
2F1UCYInFoxyENxT8Gw63z4R+ZGvYQYsrN+GiUQh5FQ4ZTd0JuAjd6Ijsa9wLndQ
z6rQK14aSWnN+6HBOvtZDbR6f6LEYdr31nlX6AsrIHdd+/l2vGlyHEM1Zv+TxAk4
Pcu4VzWwd9Z9DQCxfJb6ZLMn/fsZ5IcMFA0d5MLZbSAZ89nNGTPst/j3KfzBP56O
vaYPTzN6dEI/xNA3PzwQzV1TPwn02mpB6E5ZkFL/bVWRc/+D/pUVyK+sErCgMFod
AFDp5o2XuTnq5dTBs+AAzi37wkq0IF7dVcle7A/rWM1Do2YQDVjlobz5edit2kxM
rneULzkY/QqtnujGvyNsjIDvUyQ22SfHTJ58SOJAg3ywb1s9BdHfu5BHFuLLiuk9
ld2an2GgIfg/uiWcxmdZcuedD1g5iAGWesGdngWJi4a7PS6VCkMyGDdFs+poTg7b
xN2KNgAgzzId4s8+A87A
=5MFu
-----END PGP SIGNATURE-----

--dyTp/pkqtoagvozp--
