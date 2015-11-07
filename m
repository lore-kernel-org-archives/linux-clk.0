Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 6 Nov 2015 16:35:10 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jonathan Liu <net147@gmail.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-sunxi@googlegroups.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Wynter Woods <wynter@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [linux-sunxi] [PATCH 11/19] drm: sun4i: Add composite output
Message-ID: <20151107003510.GR6114@lukather>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-12-git-send-email-maxime.ripard@free-electrons.com>
 <CANwerB0tva90mj7Anits0gfecQuLcDZ-BEctc0VNAY+Oq0dLbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dUQzTuC3g77BtMOt"
In-Reply-To: <CANwerB0tva90mj7Anits0gfecQuLcDZ-BEctc0VNAY+Oq0dLbA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--dUQzTuC3g77BtMOt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2015 at 01:53:20PM +1100, Jonathan Liu wrote:
> > +       ret =3D sun4i_tv_init(drm);
> > +       if (ret) {
> > +               dev_err(drm->dev, "Couldn't create our RGB output\n");
>=20
> RGB should be composite. Seems like a copy-paste error.

Good catch. Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--dUQzTuC3g77BtMOt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWPUc+AAoJEBx+YmzsjxAg2ngP/RPn1VMn5f5NHBCyQ04J/CU9
ZDQ2BQ7cYDZT0JTk6VdkbMmJbiwkTB8+z7YZeEZhi4gorHwk+NGLrYSZyvIHcZlC
PjAsh93S7F77jFkmm//fkRcZ7NpWH6oivgtV3gR3/ueGdobfQfPg5vhVbRru6gWc
INxnvanFIMOJtHjjzRLsedZp5N/5JrJOAcEc1v66Nated1Ms0KtP+rS0aM8Q4yJ5
SOaIVo9Cb5BPlKMjPLoYcvkf0lNkqzRxPbFnyyx9XjbFr4ZO5W0ydgkrvmYxDjHS
PT1UjPbBEuB3hzhSfD3kKMEqepdW7/na+SGJk/Z3cz9Ew6I1VyrPv0Z6tscrCLYC
MZ8vEeLNHi1Ia40yQ9TV9ZhwZKs+k2vYJ1u6F1TxT5H36xVeXP48wO3qUOG70Gq5
UZoltj4dCjcpvrJFJSRGWI/Lr7ulHys7/gVXud0uz6ObEGuAFgLdeFt5ixbAYoYi
ZX1FeuWGSH7jXCAbF7BQE+cYO7sLkmA5N12mGhp95+0RZnN81S2b2PP7HVycOpcr
3JCoOchQZTLWNNw4VM05hyI60IGzp1VrTy5MckDAokVRPaNwSD4itVocX7bwKczZ
KkDJ5E6xqhei9RXSzo+BVIIdG2Ab/TYpqenzfhXuHVOo0Fw0AU+NY5Sal2a4vRRg
1ly7qmUCs984Ql8H6Otj
=Sf+z
-----END PGP SIGNATURE-----

--dUQzTuC3g77BtMOt--
