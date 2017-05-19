Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Fri, 19 May 2017 19:47:29 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [RFC PATCH 02/11] drm: sun4i: add support for H3 mixers
Message-ID: <20170519174729.q5qk2vqlibzx3zrv@flea.home>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <20170517164354.16399-3-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20170517164354.16399-3-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Icenowy Zheng <icenowy@aosc.xyz>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8009321250339008674=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============8009321250339008674==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f2htxhdcagrftz33"
Content-Disposition: inline


--f2htxhdcagrftz33
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2017 at 12:43:45AM +0800, Icenowy Zheng wrote:
> From: Icenowy Zheng <icenowy@aosc.xyz>
>=20
> Allwinner H3 SoC has two mixers, one has 1 VI channel and 3 UI channels,
> and the other has 1 VI and 1 UI.
>=20
> Add support for these two variants.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index cb193c5f1686..d658a3a8159a 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -390,11 +390,29 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer=
_cfg =3D {
>  	.ui_num =3D 1,
>  };
> =20
> +static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg =3D {
> +	.vi_num =3D 1,
> +	.ui_num =3D 3,
> +};
> +
> +static const struct sun8i_mixer_cfg sun8i_h3_mixer1_cfg =3D {
> +	.vi_num =3D 1,
> +	.ui_num =3D 1,
> +};
> +
>  static const struct of_device_id sun8i_mixer_of_table[] =3D {
>  	{
>  		.compatible =3D "allwinner,sun8i-v3s-de2-mixer",
>  		.data =3D &sun8i_v3s_mixer_cfg,
>  	},
> +	{
> +		.compatible =3D "allwinner,sun8i-h3-de2-mixer0",
> +		.data =3D &sun8i_h3_mixer0_cfg
> +	},
> +	{
> +		.compatible =3D "allwinner,sun8i-h3-de2-mixer1",
> +		.data =3D &sun8i_h3_mixer1_cfg
> +	},

So the only difference between the two is the number of ui planes?

Why not create a property to give the number then, instead of a
compatible?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--f2htxhdcagrftz33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZHy+xAAoJEBx+YmzsjxAgpYAQAIHckqt0yEEt/ubflinJKhZQ
uZCU3nWJNTyCfAPPjgsqivyEAsu8DJD5/k9dBcZns/9mdqD+KStAon7aspGSuoxq
urt+7mvptBGNQPeByXT+C99oGOSJ8VsCv3MS1q10uDpfzB1VpdqfUI84xAU+piVf
UuiQyshmwS8Nb7a9YR4QsYcTx9XLgUDWOj/q0s2QlVp9VWF7Xo4keRiLeZbtjQtj
TCt/Ph7R86qZ2KH8N7A4LdKdRUTpyCaWl7Uengc+grVhg4wuHZRTyV9iFwmakJ+K
GW4WE6TWvLRtljIrtB1jLHCmbnPiBrfD/xV+xScwZ/1Ng51d1mqHMyQMnud6qMQL
gcIICikbrquy/MbNoz/s/f8beXRKVtkoNhRfIuaqTF1b0PdcNV0UgO/HY8EJOq0u
24EupSafqjSsNTAl5c/+L/W/wNjg3dDSsoAnvPFrHZvPvYkzYA3VM4BLrrUyKPcJ
37e5N5yh6IrFp5MnCvFh/CJNvsXHz4kfuTvFHYzs7hU3esvEstRh0YJua5DsrJRk
fEewoJb+I+wbr6+usBu12AEG9OMQa92e5FHoY66yY2oYb21/o2C7PzjPtnWZn1v3
ubxfAUsJiCsm1KtMNFbZ7IHevE6RDhcYAtM6MmdEBhkzYKZplNLbFz7iIvJCDvqs
wSkwXRoj5/g7O2sCXcPA
=XhaW
-----END PGP SIGNATURE-----

--f2htxhdcagrftz33--


--===============8009321250339008674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8009321250339008674==--
