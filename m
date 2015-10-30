Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Fri, 30 Oct 2015 18:32:30 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
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
Message-ID: <20151030173230.GC17183@ulmo.nvidia.com>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-8-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
In-Reply-To: <1446214865-3972-8-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 03:20:53PM +0100, Maxime Ripard wrote:
> Add support for the Olimex LCD-OLinuXino-4.3TS panel to the DRM simple
> panel driver.
>=20
> It is a 480x272 panel connected through a 24-bits RGB interface.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

I don't see a patch adding the DT binding documentation for this panel.

Also, the olimex vendor prefix isn't defined.

> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index f97b73ec4713..3a9ecb64d1e6 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1096,6 +1096,29 @@ static const struct panel_desc shelly_sca07010_bfn=
_lnn =3D {
>  	.bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
>  };
> =20
> +static const struct drm_display_mode olimex_lcd_olinuxino_43ts_mode =3D {
> +	.clock =3D 9000,
> +	.hdisplay =3D 480,
> +	.hsync_start =3D 480 + 5,
> +	.hsync_end =3D 480 + 5 + 30,
> +	.htotal =3D 480 + 5 + 30 + 10,
> +	.vdisplay =3D 272,
> +	.vsync_start =3D 272 + 8,
> +	.vsync_end =3D 272 + 8 + 5,
> +	.vtotal =3D 272 + 8 + 5 + 3,
> +	.vrefresh =3D 60,
> +};
> +
> +static const struct panel_desc olimex_lcd_olinuxino_43ts =3D {
> +	.modes =3D &olimex_lcd_olinuxino_43ts_mode,
> +	.num_modes =3D 1,
> +	.size =3D {
> +		.width =3D 105,
> +		.height =3D 67,
> +	},
> +	.bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
> +};
> +

These mode and panel descriptors are all sorted alphabetically (by
vendor, by model), please keep it so.

>  static const struct of_device_id platform_of_match[] =3D {
>  	{
>  		.compatible =3D "ampire,am800480r3tmqwa1h",
> @@ -1191,6 +1214,9 @@ static const struct of_device_id platform_of_match[=
] =3D {
>  		.compatible =3D "shelly,sca07010-bfn-lnn",
>  		.data =3D &shelly_sca07010_bfn_lnn,
>  	}, {
> +		.compatible =3D "olimex,lcd-olinuxino-43-ts",
> +		.data =3D &olimex_lcd_olinuxino_43ts,
> +	}, {
>  		/* sentinel */
>  	}

Here as well.

Thierry

--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWM6muAAoJEN0jrNd/PrOhl1YQAL7mPUDdTuZHYXCAzRhDmZAH
IDnjKlZ2A1Oi28MoRupWpCvP86QLEVPC3tWErEkaulPQ3+aOK2xq4l8OZ2Vy3LlR
hTqenraBXqfMTTuQKPIKc9sKnG/shIv7toGoPgfdm60o3BRf5mMxvxM9zTNdJLY3
6eFvNZiQtvbxi7r/bJ3X+PMakgu9mNSfnVjNYYIAIB5wn7XvnwywVbJqiqlOHJwp
w8JjnJe44GEF57DWaQi5i5lkhvnycf9Udz1w1B8IMmcwg5gf2WRt97c4wiEZXmI9
8qX3IY+i+DP91BCahR8iqvnkok4PPPUX03qzbCgAFwKqCvAn1KlbI3qWMlLK5QKT
/JjpG0qtXiej/cIORmoWI9UoM/ufF0n6cmioOatpd03V3w755yqfGPnYPIYRv2Uh
HFwNSv6PEsoAB7biQzSIPGAjMaLFax8koLZOwxQnoZ6CSIN7KgNBtDYOKfyJtrou
02LiK84zY9q97Tpp0fpkL4GLmnqhlXt3XkbDmyHyal8p8CsBR6kEiMUgGfT6xKav
FExWfUaS6FO/ysVi/zecJa/llOZZDmZQNQduNy8xyj3D2CfZym9AQkq+Rdj9/PTP
elQbIlxaOKAf5hIG9woRHSiVm+PpwOtp0FAWWuMrvyj3IktF583pYd/FOcst1RNz
Vc9eBIyFqXJfIhAl7/2u
=t+CY
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--
