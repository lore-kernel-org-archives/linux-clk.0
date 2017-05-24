Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Wed, 24 May 2017 10:14:40 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [RFC PATCH 03/11] drm: sun4i: ignore swapped mixer<->tcon
 connection for DE2
Message-ID: <20170524081440.cbtjvvmj5okrri6z@flea.home>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <20170517164354.16399-4-icenowy@aosc.io>
 <20170519175753.sygqnwopk7tuv35n@flea.home>
 <ECF29F56-DF18-4E3C-9C85-B29F89BD4228@aosc.io>
MIME-Version: 1.0
In-Reply-To: <ECF29F56-DF18-4E3C-9C85-B29F89BD4228@aosc.io>
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
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0040142617598942738=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============0040142617598942738==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e5thkkexn64ono33"
Content-Disposition: inline


--e5thkkexn64ono33
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 20, 2017 at 02:00:22AM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B45=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
1:57:53, Maxime Ripard <maxime.ripard@free-electrons.com> =E5=86=99=E5=88=
=B0:
> >On Thu, May 18, 2017 at 12:43:46AM +0800, Icenowy Zheng wrote:
> >> Some SoC's DE2 has two mixers. Defaultly the mixer0 is connected to
> >> tcon0 and mixer1 is connected to tcon1; however by setting a bit
> >> the connection can be swapped.
> >>=20
> >> As we now hardcode the default connection, ignore the bonus endpoint
> >for
> >> the mixer's output and the TCON's input, as they stands for the
> >swapped
> >> connection.
> >>=20
> >> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> >> ---
> >>  drivers/gpu/drm/sun4i/sun4i_drv.c  | 27 ++++++++++++++++++++++++++
> >>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 39
> >+++++++++++++++++++++++++++++---------
> >>  drivers/gpu/drm/sun4i/sun4i_tcon.h |  2 ++
> >>  3 files changed, 59 insertions(+), 9 deletions(-)
> >>=20
> >> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c
> >b/drivers/gpu/drm/sun4i/sun4i_drv.c
> >> index 1dd1948025d2..29bf1325ded6 100644
> >> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> >> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> >> @@ -173,6 +173,13 @@ static bool sun4i_drv_node_is_frontend(struct
> >device_node *node)
> >>  		of_device_is_compatible(node,
> >"allwinner,sun8i-a33-display-frontend");
> >>  }
> >> =20
> >> +static bool sun4i_drv_node_is_swappable_de2_mixer(struct device_node
> >*node)
> >> +{
> >> +	/* The V3s has only one mixer-tcon pair, so it's not listed here.
> >*/
> >> +	return of_device_is_compatible(node,
> >"allwinner,sun8i-h3-de2-mixer0") ||
> >> +		of_device_is_compatible(node, "allwinner,sun8i-h3-de2-mixer1");
> >> +}
> >> +
> >>  static bool sun4i_drv_node_is_tcon(struct device_node *node)
> >>  {
> >>  	return of_device_is_compatible(node, "allwinner,sun5i-a13-tcon") ||
> >> @@ -249,6 +256,26 @@ static int sun4i_drv_add_endpoints(struct device
> >*dev,
> >>  			}
> >>  		}
> >> =20
> >> +		/*
> >> +		 * The second endpoint of the output of a swappable DE2 mixer
> >> +		 * is the TCON after connection swapping.
> >> +		 * Ignore it now, as we now hardcode mixer0->tcon0,
> >> +		 * mixer1->tcon1 connection.
> >> +		 */
> >> +		if (sun4i_drv_node_is_swappable_de2_mixer(node)) {
> >> +			struct of_endpoint endpoint;
> >> +
> >> +			if (of_graph_parse_endpoint(ep, &endpoint)) {
> >> +				DRM_DEBUG_DRIVER("Couldn't parse endpoint\n");
> >> +				continue;
> >> +			}
> >> +
> >> +			if (endpoint.id) {
> >> +				DRM_DEBUG_DRIVER("Endpoint is an unused connection for DE2
> >mixer... skipping\n");
> >> +				continue;
> >> +			}
> >> +		}
> >> +
> >>  		/* Walk down our tree */
> >>  		count +=3D sun4i_drv_add_endpoints(dev, match, remote);
> >> =20
> >> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> >b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> >> index f44a37a5993d..89a215ff2370 100644
> >> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> >> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> >> @@ -425,7 +425,8 @@ static int sun4i_tcon_init_regmap(struct device
> >*dev,
> >>   * requested via the get_id function of the engine.
> >>   */
> >>  static struct sunxi_engine *sun4i_tcon_find_engine(struct sun4i_drv
> >*drv,
> >> -						   struct device_node *node)
> >> +						   struct device_node *node,
> >> +						   bool skip_bonus_ep)
> >>  {
> >>  	struct device_node *port, *ep, *remote;
> >>  	struct sunxi_engine *engine;
> >> @@ -439,6 +440,20 @@ static struct sunxi_engine
> >*sun4i_tcon_find_engine(struct sun4i_drv *drv,
> >>  		if (!remote)
> >>  			continue;
> >> =20
> >> +		if (skip_bonus_ep) {
> >> +			struct of_endpoint endpoint;
> >> +
> >> +			if (of_graph_parse_endpoint(ep, &endpoint)) {
> >> +				DRM_DEBUG_DRIVER("Couldn't parse endpoint\n");
> >> +				continue;
> >> +			}
> >> +
> >> +			if (endpoint.id) {
> >> +				DRM_DEBUG_DRIVER("Skipping bonus mixer->TCON connection when
> >searching engine\n");
> >> +				continue;
> >> +			}
> >> +		}
> >> +
> >
> >You don't list the mixers in the tcon's output, why do you need that
> >exactly?
>=20
> Mixers are TCONs' input, not output...

Then why are they even parsed? The whole parsing logic in the driver
only searches for output nodes.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--e5thkkexn64ono33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZJUDwAAoJEBx+YmzsjxAglUoQAJJMTCOux8PxVCVWZUxITyTz
L64WW8jwV3wMoh5c5tcyYCa2zDKBipi3rCNE+B9MZD+9RORdY4cWbmSybPztOdmx
6fobaneuXeXF1M1i6zV7BeX2RAA+S/xb2xz46mM3i53uCaaE3RJ6A4Mt07BgYyeA
u+R1qriy+0RBcEgZMROI4/gciTTB6A+na/WgLJNc1ULe945btcv6vTEns4+Nkwmr
L5+fmnwiLFzgOjWe7NKxixZy0eyO3Ojntqqs4WnGdtHmc0fQhPx5LXYKdld8VGbS
d5bLTeklmteXSQeXMLkM4hbBZliVdK3sLOlqhJ6cKx39iFusArsMTBsj60FddJAu
QkV4r2XHEV2miTodTgSJ5O6bBJRcRj3H3y67U5aZeFThMxOPGKg7a+nAPuPsOeeE
aHTljHenDx39clTqmkPKzuD4Z9o9bOV9IoTQp37DWWrvkFyzTGVVsYDAI09J6Tev
8H0gtikP0M/KDno0OdDhRPTqfLK4z6tEhi83vdOtlNmfXLAJF6Ez/jUTAfrbBN2h
lnmsnCT1abwid29jHCT/GxkwZKAg4jdkn/eNsA4uHk5dLeQhBCD2Up8D7dqgiPdc
+qpdATD7DEuvA+ui4kOCVvegYeS1HrhFFSfH8kiUm6G5LlNh7j3VD8d4XesjdXEL
liyPvah0rIPZyb75x8ir
=KCW6
-----END PGP SIGNATURE-----

--e5thkkexn64ono33--


--===============0040142617598942738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0040142617598942738==--
