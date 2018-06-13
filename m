Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 13 Jun 2018 09:46:21 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: wens@csie.org, robh+dt@kernel.org, airlied@linux.ie,
        gustavo@padovan.org, maarten.lankhorst@linux.intel.com,
        seanpaul@chromium.org, mark.rutland@arm.com,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 14/27] drm/sun4i: Don't check for panel or bridge on
 TV TCONs
Message-ID: <20180613074621.5phumovcyymbkfbn@flea>
References: <20180612200036.21483-1-jernej.skrabec@siol.net>
 <20180612200036.21483-15-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="on6p3lb7ylr4gu64"
In-Reply-To: <20180612200036.21483-15-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--on6p3lb7ylr4gu64
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 12, 2018 at 10:00:23PM +0200, Jernej Skrabec wrote:
> TV TCONs are always connected to TV or HDMI encoder, so it doesn't make
> sense to check if panel or bridge is connected to them.
>=20
> Check if TCON has channel 0 and only then check for connected panel or
> bridges.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index b1205a7bc20f..c9ffa5381185 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -1189,13 +1189,19 @@ static const struct component_ops sun4i_tcon_ops =
=3D {
>  static int sun4i_tcon_probe(struct platform_device *pdev)
>  {
>  	struct device_node *node =3D pdev->dev.of_node;
> +	const struct sun4i_tcon_quirks *quirks;
>  	struct drm_bridge *bridge;
>  	struct drm_panel *panel;
>  	int ret;
> =20
> -	ret =3D drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
> -	if (ret =3D=3D -EPROBE_DEFER)
> -		return ret;
> +	quirks =3D of_device_get_match_data(&pdev->dev);

We should probably check ofr the pointer value before dereferencing it.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--on6p3lb7ylr4gu64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsgy8wACgkQ0rTAlCFN
r3TKsxAAiMdTHSYwfXld6lYjllJDZDxQke3ipIpcBxmX3te3cqIKX5GX25YtR6EK
M3XrUPsCgfGoVGnifxdC+Ew5CxKaPdGOrgYAHFtbBlPcI1/sX14eVqm628kRWa+Q
z6GPHG3c8w+ze97sOmJ/pgh30OV9Ugk4rO5/DLJvK65Yqz6JAvbr3wUVteFGM7tf
Qo5SLUPvtA0dbUa4IsmweBjkAcSRqJXtv+HS3UZB/1u4/skoIS+TRW2YuDwLfRgq
M14nEOMT/UpsLoG+N+OBksRAgNunN3YFbKWamml/2rJGBXYzhCqNuk3z1AElJb2b
1fSnahf2iR5Zg2vo4Mzvu+kNHgy7IOh3u5rUnhuQ0666gGFHTqUC7ZS/eHuFFF+C
SR2HcY9ct/wXan45S/h+OJmtciqXP95kVUZfTyzckdCpuQ9uZTCrx45cbpRRfggx
7NSqyUmw9E5U76ycqxQTFlCCJaY5dcaCHoP0+DPjrrs9lYicKlCVB8Um85bXaJbP
/RDrCmBR2+J4c/O5m3namnPbdTJS1nlM2/VakwVK8KF9/WZJT9c7yuk7UwXj8ZAS
w7slUbXq6JsGH1z03hrDe2NoPPsdfupRaM5jv04+QKpW8aVSPvDihXcqwR80/5hB
5VURE7lyKbgtf9So5TLG35HgiF3UYsKaQz9tWdyYg1zlOzTtYL4=
=7udD
-----END PGP SIGNATURE-----

--on6p3lb7ylr4gu64--
