Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 4 Apr 2016 14:24:50 -0700
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh@kernel.org>, yassinjaffer@gmail.com,
	dev@linux-sunxi.org, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Reinder de Haan <patchesrdh@mveas.com>,
	Jens Kuske <jenskuske@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi: Add CSI (camera's Sensors Interface) module
 clock driver for sun[457]i
Message-ID: <20160404212450.GP4227@lukather>
References: <1458204222-31149-1-git-send-email-yassinjaffer@gmail.com>
 <1458204222-31149-2-git-send-email-yassinjaffer@gmail.com>
 <20160319235905.GA16539@rob-hp-laptop>
 <20160402011436.GA18567@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l3ej7W/Jb2pB3qL2"
In-Reply-To: <20160402011436.GA18567@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--l3ej7W/Jb2pB3qL2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen

On Fri, Apr 01, 2016 at 06:14:36PM -0700, Stephen Boyd wrote:
> On 03/19, Rob Herring wrote:
> > On Thu, Mar 17, 2016 at 07:43:42PM +1100, yassinjaffer@gmail.com wrote:
> > > From: Yassin Jaffer <yassinjaffer@gmail.com>
> > >=20
> > > This patch adds a composite clock type consisting of
> > > a clock gate, mux, configurable dividers, and a reset control.
> > >=20
> > > Signed-off-by: Yassin Jaffer <yassinjaffer@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/clock/sunxi.txt |   1 +
> >=20
> > I wish someone would just add all the sunxi clocks in one pass instead=
=20
> > of one by one.
> >=20
> > Acked-by: Rob Herring <robh@kernel.org>
>=20
> Me too!

I understand, but it's probably not going to happen. The clock tree is
massive, and obviously you have to multiply that by the number of SoCs
we have.

And to be honest, I don't really see the point of merging clock
drivers that have never been tested, and might be massively broken,
especially now that we have this ABI requirement for the DT, and we
can't adjust the binding when we actually start using that clock.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--l3ej7W/Jb2pB3qL2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXAtuiAAoJEBx+YmzsjxAguXQQALPz/C2eYgvsBZHnW3isuHrQ
Rqf006TV5j2tRV+Rjh26qMrCQMhAPAJJAT3PirSqZaGFzSK7c6U8E92XSIM3+jAf
/reHDaKF4WtJUDN5ZGuuAQXNN9pLmsQJQxWnHXibVHvS7LEdG7Ytjft8vPFIAVgE
oHl9TOEtsM+oB/1FbAv3Zcz8Lm6tHDF84A5zcjyAYoB7e26cAR/rvwmB0jP7y9iT
+NpM+ddUnvH3zS/tBt1BoZ0ASfXjV1vqEWmOvxGFRSl0RtXL7P63hz6BjbS1AjHk
toi5sYPmesCy4y/9oFfLrFdr9zg0EcvnHSztfjfzqNVgltuNYWpqM5xOfQS4gwdc
E8gU7zs3K/1KINSZkvtAAeNasg5UhF24CiNaVejl5zTJVd6BuDJ02Cnk7aSLtM/h
bnsRQudw2TP+/FVnO4Hvfhzov8yqkOJYhO4Q9H1aOCvVxMih3O9KbZd6W11bgV3r
chv6OqnOZn5gPTGZZUHzmn2xpIHYuk1hCXpiZumRthk2JVH8H1EKto7mlgAgtirq
N/ASFPlzv1muE5KW9Yy7nKGxDxmC/TGhvf1LiuYU6WSDu3fLfI/TFkpwcU21UMnD
vAri50c/XZ+voBQqug250eqNMPX8HzLzealLr+vz+0A9QvieJMrh6Qzf/K4+XFh5
uRSMs6I3FGppyNmrMODY
=OTS+
-----END PGP SIGNATURE-----

--l3ej7W/Jb2pB3qL2--
