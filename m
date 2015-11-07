Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 6 Nov 2015 16:44:36 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
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
Subject: Re: [PATCH 07/19] drm/panel: simple: Add timings for the Olimex
 LCD-OLinuXino-4.3TS
Message-ID: <20151107004436.GS6114@lukather>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-8-git-send-email-maxime.ripard@free-electrons.com>
 <20151030173230.GC17183@ulmo.nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u2qWrZzts+9rBanj"
In-Reply-To: <20151030173230.GC17183@ulmo.nvidia.com>
List-ID: <linux-clk.vger.kernel.org>


--u2qWrZzts+9rBanj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

On Fri, Oct 30, 2015 at 06:32:30PM +0100, Thierry Reding wrote:
> On Fri, Oct 30, 2015 at 03:20:53PM +0100, Maxime Ripard wrote:
> > Add support for the Olimex LCD-OLinuXino-4.3TS panel to the DRM simple
> > panel driver.
> >=20
> > It is a 480x272 panel connected through a 24-bits RGB interface.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
>=20
> I don't see a patch adding the DT binding documentation for this panel.
>=20
> Also, the olimex vendor prefix isn't defined.
>=20
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pan=
el/panel-simple.c
> > index f97b73ec4713..3a9ecb64d1e6 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -1096,6 +1096,29 @@ static const struct panel_desc shelly_sca07010_b=
fn_lnn =3D {
> >  	.bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
> >  };
> > =20
> > +static const struct drm_display_mode olimex_lcd_olinuxino_43ts_mode =
=3D {
> > +	.clock =3D 9000,
> > +	.hdisplay =3D 480,
> > +	.hsync_start =3D 480 + 5,
> > +	.hsync_end =3D 480 + 5 + 30,
> > +	.htotal =3D 480 + 5 + 30 + 10,
> > +	.vdisplay =3D 272,
> > +	.vsync_start =3D 272 + 8,
> > +	.vsync_end =3D 272 + 8 + 5,
> > +	.vtotal =3D 272 + 8 + 5 + 3,
> > +	.vrefresh =3D 60,
> > +};
> > +
> > +static const struct panel_desc olimex_lcd_olinuxino_43ts =3D {
> > +	.modes =3D &olimex_lcd_olinuxino_43ts_mode,
> > +	.num_modes =3D 1,
> > +	.size =3D {
> > +		.width =3D 105,
> > +		.height =3D 67,
> > +	},
> > +	.bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
> > +};
> > +
>=20
> These mode and panel descriptors are all sorted alphabetically (by
> vendor, by model), please keep it so.
>=20
> >  static const struct of_device_id platform_of_match[] =3D {
> >  	{
> >  		.compatible =3D "ampire,am800480r3tmqwa1h",
> > @@ -1191,6 +1214,9 @@ static const struct of_device_id platform_of_matc=
h[] =3D {
> >  		.compatible =3D "shelly,sca07010-bfn-lnn",
> >  		.data =3D &shelly_sca07010_bfn_lnn,
> >  	}, {
> > +		.compatible =3D "olimex,lcd-olinuxino-43-ts",
> > +		.data =3D &olimex_lcd_olinuxino_43ts,
> > +	}, {
> >  		/* sentinel */
> >  	}
>=20
> Here as well.

Thanks for your feedback, consider it fixed.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--u2qWrZzts+9rBanj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWPUl0AAoJEBx+YmzsjxAgaDUQAJubJMmrh/I2cTTzgcrF/bKC
XpbhUKbR9Coo2DL8WT17UvRtcDJqZ8MM6GhBGCBMAoLF5f4Ge+xY/gxH1kEro55y
Q57DaEVmk35v7U8YvMYVniezZ6DzvAhfPzKTvmUKlE9zP/PnBEzehwi86cPDx2UY
dFTwKBFFEuACq/SSc0cjW+dVoj7+xvYk/6/rYwkfetCSyqzRyaGFyyQgnnTQ1J/L
pnykpG9gfXXI9fFif48sYrQ5rnFzAyJ6uYJTqtWPCxq8NIAugQ2qDFSEDBHPeS6y
20ZC/MTBiDEjbhCJUfCrb7K/uEwuNtbGZrro/SDNiHz9Wjc79/Ydq4Ozprs+6k79
zBk0mQdm/AEX4/lPNXZrn5M9OZUC6G5L0B8t7MuaI0h5dimacl1HBYiUumz4C+bh
vx07nuYYr1/nXZ3ZSUFrf4ypxByL8XO8+DZ/FN7Z0Dx+AKSEZhLJAxI3nUgMmBQF
XFO+tIQG4yNo/wqUnjhdWyPOUiLuNJ2qq7MDx/2OQcY/O70KUlQtse0UHKnwgkul
KK+YFvbvmjNUzF8Wmo02i3vProE4Eq2Ug1tCROSEqtd5/yVfy0j+6R1vw2v1utBk
3rJs75vCZNKek/9qmgVgklAygn4cMo6qzIgvODv/CxNenelTugdsYb51RMWnJSH+
cYcusg3d935reUEo7Djp
=JC3y
-----END PGP SIGNATURE-----

--u2qWrZzts+9rBanj--
