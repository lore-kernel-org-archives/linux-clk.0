Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 15 May 2017 11:24:53 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v7 04/13] drm/sun4i: return only planes for layers created
Message-ID: <20170515092453.uv5j3avcktgx4no5@flea.home>
References: <20170514163045.40366-1-icenowy@aosc.io>
 <20170514163045.40366-5-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ees4ru5q7pb5d7yx"
In-Reply-To: <20170514163045.40366-5-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--ees4ru5q7pb5d7yx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2017 at 12:30:36AM +0800, Icenowy Zheng wrote:
> As we are going to add support for the Allwinner DE2 Mixer in sun4i-drm
> driver, we will finally have two types of layers.
>=20
> Each layer is bound to a drm_plane that is CRTC-specific, so we create
> them when initializing CRTC (calling sun4i_layers_init, which will be
> generalized in next patch). The drm_plane's will be used when creating
> CRTC, but the CRTC initialization code do not care other properties of
> the layer, so we let the sun4i_layers_init function return drm_plane's
> only.
>=20
> As we have no need to trace the layers after the CRTC is properly
> created, we drop the layers pointer in sun4i_crtc struct.
>=20
> Doing this uncouples the CRTC code from the type of layer (the
> sun4i_layers_init function name is still hardcoded and will be changed
> in the next patch), so that we can finally gain support for the
> mixer in DE2, which has different layers.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ees4ru5q7pb5d7yx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZGXPlAAoJEBx+YmzsjxAgWQYP/1qGdEJ2ks/Wd37b6/0SMW+X
hZ0You4P3HzoKtBshjlXuyZtll66GZ4g0B8Ia2iG6F+GRgnOkRQFcdLj6z7VBSue
EyUnJfFh3fwr+f7H8ki5NrlH8zv3E07SUFRadzsvZdSyV1DUzrCoNgPw/cGXtB8Q
XVnVaia3zyW32GXDaTcKyAbyuwUJmno5xJiaYIcoH9jGhUzI+ybQmzEWnliQBPYp
qW3rXndbRmO9r1OUXBOEsxF2JEUU8cLN7CAo6wWKP4efXEvDrEaVkp9XDTKTW4uZ
rj9FDHaNR8zZDo+VFOVsOHP/Uugavc6UGYw8paenUO5E6qpwLLzYQyUXmZt1tQ7j
WeDdTysPVvYC+/h5eM6KqU7hbf11WdQQ1Y3I18K+Tupawu6ifSPx4NkHfOxTMzqP
sk0nL3cA8nZj71qrj/ikLYrJrZW6ss3FsBaqhnNeXOY7V/ex/f5ojigbYfie5sdT
van+9RLFMsFY/x339JffYrrkkarGzZhfRPViR0MpH2JN3aIU8YGHBdl/2KHck+b6
Y3SGcV6rkSyvA2r/udfDa296GGmU3Yhtf6M5j/xexfpsTTkxbKo3xIEzOo4XXTQl
O8PuGcKJyteNYK/osRNH+lFK287DlB01VaFWv1YfKtCkY24e6tzH9Jd66qntRpES
31z9ceUZP6KDaaZwGpnX
=9Bwv
-----END PGP SIGNATURE-----

--ees4ru5q7pb5d7yx--
