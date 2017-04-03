Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Mon, 3 Apr 2017 10:14:23 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v3 04/11] drm/sun4i: abstract the layer type
Message-ID: <20170403081423.p6x4ytfoga2krygv@lukather>
References: <20170329194613.55548-1-icenowy@aosc.io>
 <20170329194613.55548-5-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20170329194613.55548-5-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2775394161494510316=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============2775394161494510316==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a42ymen556qrghv6"
Content-Disposition: inline


--a42ymen556qrghv6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 30, 2017 at 03:46:06AM +0800, Icenowy Zheng wrote:
> As we are going to add support for the Allwinner DE2 Mixer in sun4i-drm
> driver, we will finally have two types of layer.
>=20
> Abstract the layer type to void * and a ops struct, which contains the
> only function used by crtc -- get the drm_plane struct of the layer.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Refactored patch in v3.
>=20
>  drivers/gpu/drm/sun4i/sun4i_crtc.c  | 19 +++++++++++--------
>  drivers/gpu/drm/sun4i/sun4i_crtc.h  |  3 ++-
>  drivers/gpu/drm/sun4i/sun4i_layer.c | 19 ++++++++++++++++++-
>  drivers/gpu/drm/sun4i/sun4i_layer.h |  2 +-
>  drivers/gpu/drm/sun4i/sunxi_layer.h | 17 +++++++++++++++++
>  5 files changed, 49 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/gpu/drm/sun4i/sunxi_layer.h
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/s=
un4i_crtc.c
> index 3c876c3a356a..33854ee7f636 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
> @@ -29,6 +29,7 @@
>  #include "sun4i_crtc.h"
>  #include "sun4i_drv.h"
>  #include "sun4i_layer.h"
> +#include "sunxi_layer.h"
>  #include "sun4i_tcon.h"
> =20
>  static void sun4i_crtc_atomic_begin(struct drm_crtc *crtc,
> @@ -149,7 +150,7 @@ struct sun4i_crtc *sun4i_crtc_init(struct drm_device =
*drm,
>  	scrtc->tcon =3D tcon;
> =20
>  	/* Create our layers */
> -	scrtc->layers =3D sun4i_layers_init(drm, scrtc->backend);
> +	scrtc->layers =3D (void **)sun4i_layers_init(drm, scrtc);
>  	if (IS_ERR(scrtc->layers)) {
>  		dev_err(drm->dev, "Couldn't create the planes\n");
>  		return NULL;
> @@ -157,14 +158,15 @@ struct sun4i_crtc *sun4i_crtc_init(struct drm_devic=
e *drm,
> =20
>  	/* find primary and cursor planes for drm_crtc_init_with_planes */
>  	for (i =3D 0; scrtc->layers[i]; i++) {
> -		struct sun4i_layer *layer =3D scrtc->layers[i];
> +		void *layer =3D scrtc->layers[i];
> +		struct drm_plane *plane =3D scrtc->layer_ops->get_plane(layer);
> =20
> -		switch (layer->plane.type) {
> +		switch (plane->type) {
>  		case DRM_PLANE_TYPE_PRIMARY:
> -			primary =3D &layer->plane;
> +			primary =3D plane;
>  			break;
>  		case DRM_PLANE_TYPE_CURSOR:
> -			cursor =3D &layer->plane;
> +			cursor =3D plane;
>  			break;
>  		default:
>  			break;
> @@ -190,10 +192,11 @@ struct sun4i_crtc *sun4i_crtc_init(struct drm_devic=
e *drm,
>  	/* Set possible_crtcs to this crtc for overlay planes */
>  	for (i =3D 0; scrtc->layers[i]; i++) {
>  		uint32_t possible_crtcs =3D BIT(drm_crtc_index(&scrtc->crtc));
> -		struct sun4i_layer *layer =3D scrtc->layers[i];
> +		void *layer =3D scrtc->layers[i];
> +		struct drm_plane *plane =3D scrtc->layer_ops->get_plane(layer);
> =20
> -		if (layer->plane.type =3D=3D DRM_PLANE_TYPE_OVERLAY)
> -			layer->plane.possible_crtcs =3D possible_crtcs;
> +		if (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY)
> +			plane->possible_crtcs =3D possible_crtcs;

I think the logic should be reversed here, the CRTC shouldn't care
(much) about the layers at all.

We should modify sun4i_crtc_init to get the argument it needs (primary
and cursor planes for example) through its parameters, and have the
caller (which iirc is sun4i_drv) call it with the right parameters
depending on whether you're using DE or DE2.

If we're doing that, I don't think we even need the pointer to the
array of layers in struct sun4i_crtc, which will make it easier to
deal with.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--a42ymen556qrghv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY4gRbAAoJEBx+YmzsjxAgNXMQAI8KcMZ/7LR1UiKCSfaWSjQi
1z740tEmEv1PbkBUPtiBT+3hAm8DDc6EtHIaCNc+ovVidSR4ka7T6gYZ2UF50Z6m
EZ021rVJc9ZCw3DhYPSz7ZhlRFnRMWa2YNBXCOXZtW44t/We1lvLhPkPWs2v4U/3
ksSd8csCfCXFm5CUgwFpU6IUy6w5Aj2hcTfp6w/RkIzCWPsEODkj6gad8G7AOEXA
a/HUeBzc59NNhcjE3JZkoO+XXc9XnwX3tbK83w84q36VUl8V8fKO2fA42imVIavj
0eqf8vdXB0QvfhOMCT4flMATujrqYtgLnTmkaq9D976TTlwf2llsEuW9PLUvE92v
jX7lULkl0+aFSu+zSYZAqh5FfM30noTfUuInYA4BoYqcHKYGC7OZm6EDpr/HpTRt
fPPoEW75amwLkdfF7N+4GPc3TrgqDiP4/1vt31NHsuU8ByhdwokhWJu2615Wpvvv
OjyCOlYzmxKcTy8sX2Dfi9OoTQ5yGTlXpFVAHc7zpLWjtkQmQJX8PY3DJC+DT6GT
NpEPyPuz8Fs+neNLYgEOvqHbHz7vhK6CeWLnybx8/1D2FlQbLJKqhLmPXz3ZlFoQ
n/LHuQICwPtheRXDBbOs0SsiUaE4ICe2jf0jKw8zd91TJ9fn+Wm3StoCg2XksnZG
cJiK3V7dMlMwBvVhJ/tz
=Gfbe
-----END PGP SIGNATURE-----

--a42ymen556qrghv6--


--===============2775394161494510316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2775394161494510316==--
