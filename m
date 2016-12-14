Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 14 Dec 2016 10:21:03 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jorik Jonker <jorik@kippendief.biz>,
	Hans de Goede <hdegoede@redhat.com>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/6] clk: sunxi-ng: set the parent rate when adjustin
 CPUX clock on A33
Message-ID: <20161214092103.xgs62aqkjgsseuqe@lukather>
References: <20161213152252.53749-1-icenowy@aosc.xyz>
 <20161213152252.53749-3-icenowy@aosc.xyz>
 <20161213154451.y4wcrqhtcc5sqli7@lukather>
 <306991481662454@web33j.yandex.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sfzsb5mtjcbmr5cc"
In-Reply-To: <306991481662454@web33j.yandex.ru>
List-ID: <linux-clk.vger.kernel.org>


--sfzsb5mtjcbmr5cc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2016 at 04:54:14AM +0800, Icenowy Zheng wrote:
>=20
>=20
> 13.12.2016, 23:44, "Maxime Ripard" <maxime.ripard@free-electrons.com>:
> > On Tue, Dec 13, 2016 at 11:22:48PM +0800, Icenowy Zheng wrote:
> >> =A0The CPUX clock on A33, which is for the Cortex-A7 cores, is designe=
d to
> >> =A0be changeable by changing the rate of PLL_CPUX.
> >>
> >> =A0Add CLK_SET_RATE_PARENT flag to this clock.
> >>
> >> =A0Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> >
> > Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Excuse me, have you merged this patch?

Yes, sorry, that's what I meant :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--sfzsb5mtjcbmr5cc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYUQ77AAoJEBx+YmzsjxAgakUP/0xMv4PmjX7sHI3SlARHq1eK
3bSh0G9j2y0nZT0mSARmRfrePshM/wGKUMQVxIZZPyU0HZKnX0m4957FzFknjatZ
U+YsMZ9YY/slRqi59GxN49Hmhy196i7comD8o9gJgs5XsGSWlRxFXxL3XcilVrW7
xtLaPiyjwSrhkyAjtJEuPNXFc6gweW1U7vjYQZvcqsPmk0YfhWEFu+WY6VIF4hID
Q+hTTS1nopkfSbp/OE/B9SGZsv7g/kdJfWy2RWIDCUsxnPIe+yHpW31YzI/lOL3W
R/gdTmALMpOVcyjtyJ/a0yGi7TIaZXjcQzBL5UkW8ioioMJmXeFmvhINf7V/fjV1
PZSNES8miFafdejBFoUC8T40R3VzJN02v5chQMCHMsUd83nM5Ys4w5+r7avo83/E
mCIwNaliokvWG2FUtKDg90y/nuCMSgX+Hk+4J0CFLi3A+lLug3ZJPofuRKGVX4WP
NK47jt2zgbSjEUIUUx2y4pIvERZ00J4CgNf6Cnn0eYWi+8jG9D6dK7gamM1gYq7O
AsETRi2rYOjcfsjhxqLq+yuDrTXHF4rzu1rEmgInyF/NUhdb7ICvJSweklaP0m8z
PxtQ9zX8LKmlXRh91vhOuXolLo/NTHJPgjOghjr03+PoJMNUrB8DN68DVJ/1hut+
cfGxAM9CH0iY/yOBcNkM
=DKB7
-----END PGP SIGNATURE-----

--sfzsb5mtjcbmr5cc--
