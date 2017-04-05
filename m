Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:59737 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753183AbdDEIKA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Apr 2017 04:10:00 -0400
Date: Wed, 5 Apr 2017 10:09:58 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Sean Paul <seanpaul@chromium.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-clk <linux-clk@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [linux-sunxi] Re: [PATCH v3 04/11] drm/sun4i: abstract the layer
 type
Message-ID: <20170405080958.lrqoled7df5ugtur@lukather>
References: <20170405052325.98B958A2E94@relay.mailchannels.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="t3dovqbrjqdziyjs"
In-Reply-To: <20170405052325.98B958A2E94@relay.mailchannels.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--t3dovqbrjqdziyjs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2017 at 01:23:15PM +0800, Icenowy Zheng wrote:
>=20
> 2017=E5=B9=B44=E6=9C=885=E6=97=A5 10:27=E4=BA=8E Chen-Yu Tsai <wens@csie.=
org>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, Apr 5, 2017 at 3:53 AM, Icenowy Zheng <icenowy@aosc.io> wrote:=
=20
> > >=20
> > >=20
> > > =E5=9C=A8 2017=E5=B9=B404=E6=9C=8805=E6=97=A5 03:28, Sean Paul =E5=86=
=99=E9=81=93:=20
> > >>=20
> > >> On Thu, Mar 30, 2017 at 03:46:06AM +0800, Icenowy Zheng wrote:=20
> > >>>=20
> > >>> As we are going to add support for the Allwinner DE2 Mixer in sun4i=
-drm=20
> > >>> driver, we will finally have two types of layer.=20
> > >>>=20
> > >>> Abstract the layer type to void * and a ops struct, which contains =
the=20
> > >>> only function used by crtc -- get the drm_plane struct of the layer=
=2E=20
> > >>>=20
> > >>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>=20
> > >>> ---=20
> > >>> Refactored patch in v3.=20
> > >>>=20
> > >>>=C2=A0 drivers/gpu/drm/sun4i/sun4i_crtc.c=C2=A0 | 19 +++++++++++----=
----=20
> > >>>=C2=A0 drivers/gpu/drm/sun4i/sun4i_crtc.h=C2=A0 |=C2=A0 3 ++-=20
> > >>>=C2=A0 drivers/gpu/drm/sun4i/sun4i_layer.c | 19 ++++++++++++++++++-=
=20
> > >>>=C2=A0 drivers/gpu/drm/sun4i/sun4i_layer.h |=C2=A0 2 +-=20
> > >>>=C2=A0 drivers/gpu/drm/sun4i/sunxi_layer.h | 17 +++++++++++++++++=20
> > >>>=C2=A0 5 files changed, 49 insertions(+), 11 deletions(-)=20
> > >>>=C2=A0 create mode 100644 drivers/gpu/drm/sun4i/sunxi_layer.h=20
> > >>>=20
> > >>> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c=20
> > >>> b/drivers/gpu/drm/sun4i/sun4i_crtc.c=20
> > >>> index 3c876c3a356a..33854ee7f636 100644=20
> > >>> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c=20
> > >>> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c=20
> > >>> @@ -29,6 +29,7 @@=20
> > >>>=C2=A0 #include "sun4i_crtc.h"=20
> > >>>=C2=A0 #include "sun4i_drv.h"=20
> > >>>=C2=A0 #include "sun4i_layer.h"=20
> > >>> +#include "sunxi_layer.h"=20
> > >>>=C2=A0 #include "sun4i_tcon.h"=20
> > >>>=20
> > >>>=C2=A0 static void sun4i_crtc_atomic_begin(struct drm_crtc *crtc,=20
> > >>> @@ -149,7 +150,7 @@ struct sun4i_crtc *sun4i_crtc_init(struct drm_d=
evice=20
> > >>> *drm,=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scrtc->tcon =3D tco=
n;=20
> > >>>=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Create our layer=
s */=20
> > >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scrtc->layers =3D sun4i_layer=
s_init(drm, scrtc->backend);=20
> > >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scrtc->layers =3D (void **)su=
n4i_layers_init(drm, scrtc);=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(scrtc->l=
ayers)) {=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(drm->dev, "Couldn't create the plane=
s\n");=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;=20
> > >>> @@ -157,14 +158,15 @@ struct sun4i_crtc *sun4i_crtc_init(struct=20
> > >>> drm_device *drm,=20
> > >>>=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* find primary and=
 cursor planes for drm_crtc_init_with_planes=20
> > >>> */=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; scrtc=
->layers[i]; i++) {=20
> > >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct sun4i_layer *layer =3D scrtc->layers[i];=20
> > >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 void *layer =3D scrtc->layers[i];=20
> > >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct drm_plane *plane =3D=20
> > >>> scrtc->layer_ops->get_plane(layer);=20
> > >>>=20
> > >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 switch (layer->plane.type) {=20
> > >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 switch (plane->type) {=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_PLANE_TYPE_PRIMARY:=20
> > >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 primary =
=3D &layer->plane;=20
> > >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 primary =
=3D plane;=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DRM_PLANE_TYPE_CURSOR:=20
> > >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cursor =
=3D &layer->plane;=20
> > >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cursor =
=3D plane;=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;=20
> > >>> @@ -190,10 +192,11 @@ struct sun4i_crtc *sun4i_crtc_init(struct=20
> > >>> drm_device *drm,=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Set possible_crt=
cs to this crtc for overlay planes */=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; scrtc=
->layers[i]; i++) {=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t possible_crtcs =3D=20
> > >>> BIT(drm_crtc_index(&scrtc->crtc));=20
> > >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct sun4i_layer *layer =3D scrtc->layers[i];=20
> > >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 void *layer =3D scrtc->layers[i];=20
> > >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct drm_plane *plane =3D=20
> > >>> scrtc->layer_ops->get_plane(layer);=20
> > >>>=20
> > >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (layer->plane.type =3D=3D DRM_PLANE_TYPE_OVERLAY)=20
> > >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 layer->p=
lane.possible_crtcs =3D possible_crtcs;=20
> > >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY)=20
> > >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 plane->p=
ossible_crtcs =3D possible_crtcs;=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }=20
> > >>>=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return scrtc;=20
> > >>> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.h=20
> > >>> b/drivers/gpu/drm/sun4i/sun4i_crtc.h=20
> > >>> index 230cb8f0d601..a4036ee44cf8 100644=20
> > >>> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.h=20
> > >>> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.h=20
> > >>> @@ -19,7 +19,8 @@ struct sun4i_crtc {=20
> > >>>=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sun4i_backen=
d=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *backen=
d;=20
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sun4i_tcon=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 *tcon;=20
> > >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sun4i_layer=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 **lay=
ers;=20
> > >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 **layers;=
=20
> > >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct sunxi_layer_ops=
=C2=A0=C2=A0=C2=A0 *layer_ops;=20
> > >>=20
> > >>=20
> > >> I think you should probably take a different approach to abstract th=
e=20
> > >> layer=20
> > >> type. How about creating=20
> > >>=20
> > >> struct sunxi_layer {=20
> > >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_plane pla=
ne;=20
> > >> }=20
> > >>=20
> > >> base and then subclassing that for sun4i and sun8i? By doing this yo=
u can=20
> > >> avoid=20
> > >> the nasty casting and you can also get rid of the get_plane() hook a=
nd=20
> > >> layer_ops.=20
> > >=20
> > >=20
> > > For the situation that using ** things are easily to get weird.=20
> >
> > That code could be reworked, by initializing the layers directly within=
=20
> > the crtc init code. If you look at rockchip's drm driver, you'll see=20
> > they do this. There is a good reason to do it this way, as you need=20
> > to first create the primary and cursor layers, pass them in when you=20
> > create the crtc, then initialize any additional layers with the=20
> > possible_crtcs bitmap.=20
>=20
> But furthurly maybe more layers will be created for DE2 mixer, and
> may even depends on mixer type (On A83T/H3/A64/H5 mixer1 has fewer
> channel than mixer0).

You'll always have one primary and one cursor plane, no matter how
much planes you support.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--t3dovqbrjqdziyjs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY5KZWAAoJEBx+YmzsjxAgCPIP/36WTMRsXB92DEqwe3tZKdVI
asaz9lcb9tCH/X0PiwpiYBsvLg2VwTzm/x3xcXc1b7A1g/qZZORPI9ZkI902Kl4m
EL5HL8HHIjRZ7dobzr728JV4o7aZtwz2rwXfvI2SkZxDoCFhE8zUx9HcFkRcaYQR
xEpEnzBM5IOExcQqcY517cnd0whe4CNYYCbKmdbYKyhRSSp7Q3VnygppU1G5HE3Y
nKKIjrEfyi3MbZfR1x4XTo3CUi6oVSq+vRVMuJX7WwkpM1ZMg4gmcFjkXG8guyJ0
/AB7JFll9hdXjJreq7dc4FayE/HzRfCbUf0HcR5P14LQ5eOd/1T+0ygxtOYvoK7X
BhCAO4HcZk7TKE7CqGCXVTJP1p7hbOyLzRoOgMDU/OJWa/l0VStofyFVLFyfGf6X
ytiR9ko5ctgAtDgUXKFRe1l1bvyvIAHxRan++qd/IjHUFXgRDQayFZ/0ofdKILM1
DO9PJhzwt6R7FkixYU814WMsEpyZjyXLKubw5dvkOolfBAc0RpJ3NSpTiccyxQ9E
SB0umW3sQ36JZJhvSyhb+PnEj9v26O4Vjqk0EG0xJ1efUEWt3KWt7QkWZTpfzZZN
4nw1ozWYrojenEwBxyDcJiNjMKT8px/MUWp/wKL1O2l6ZdHKBKgN4D9H/m2bshWt
BgbDYd9hXb3GmNPXIbk9
=9DSD
-----END PGP SIGNATURE-----

--t3dovqbrjqdziyjs--
