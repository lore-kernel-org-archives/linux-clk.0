Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:51044 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1167511AbdDXJFh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Apr 2017 05:05:37 -0400
Date: Mon, 24 Apr 2017 11:05:00 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v5 05/11] drm/sun4i: abstract a engine type
Message-ID: <20170424090500.i3k6u7pcahc7m3hv@lukather>
References: <20170423103754.50012-1-icenowy@aosc.io>
 <20170423103754.50012-6-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l72qyua2fb6rcfpc"
In-Reply-To: <20170423103754.50012-6-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--l72qyua2fb6rcfpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks a lot for that work.

On Sun, Apr 23, 2017 at 06:37:48PM +0800, Icenowy Zheng wrote:
> As we are going to add support for the Allwinner DE2 engine in sun4i-drm
> driver, we will finally have two types of display engines -- the DE1
> backend and the DE2 mixer. They both do some display blending and feed
> graphics data to TCON, so I choose to call them both "engine" here.
>=20
> Abstract the engine type to a new struct with an ops struct, which contai=
ns
> functions that should be called outside the engine-specified code (in
> TCON, CRTC or TV Encoder code).
>=20
> A dedicated Kconfig option is also added to control whether
> sun4i-backend-specified code (sun4i_backend.c and sun4i_layer.c) should
> be built. As we removed the codes in CRTC code that directly call the
> layer code, we can now extract the layer part and combine it with the
> backend part into a new module, sun4i-backend.ko.

While the code itself is good now, the patch mixes a few things that
would be better to be split in separate patches. I think it would be
better if you had patches organized like this:
  - Abstract the engine type by create the sunxi_engine structure and
    fixing all the callers.
  - Move the layers and backend files in the same module, and remove
    the now useless EXPORT_SYMBOLS.
  - Create a Kconfig option.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--l72qyua2fb6rcfpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY/b+3AAoJEBx+YmzsjxAgULoP/06R177supUGM2LG9k4VrKaf
dqqCEwhX9H4/hY+XOer2WFniGxLutsxNV0joH6ZK7/UFyOTejbd0mz1YS48bvhoC
9eYl9u8SPa24Oc2r+3VDHGef0YhXDgZf4HoqKeppLXjh9NtezsbAyKYSGsSc7rBk
jHdfOQKSasDurO+WIcP1ysMjMkXFtaynYLnMSi4i4aGR1lWXlk7phqaMqxBSpmxX
Ws1BiNuH/ID3Qyn9Ca9MZTy8YDg1Yi5N567kDmdBJHjxq9Nyh4zHythheDUebUXl
kIp8pkbqGrtwPakWQtN/bRtzCnoZdZsbAlr9KpTsW+2Sz+KtZiowOixggFgrio2l
UXJX9nLpwb0J/TMPuD22t6nz/qQYLhIOsX/UR5EBYc4L+Yieb7k8z7nCsLzy8wp8
b0832zi35iwoUt91YW3PtSKFz/M7qf2g8HnFhF6ewigsE3HDUHYOse56AmsvlaNm
/Ftr7uzUHwVA4iteEk5IhH+L8kv/ASjALHTYZDXXwB8P2anQ/gNLUaj9DroExPpM
RXa4r0TmgNyR2XqAy1CXOsreBNfQsXaJBf9ckaF5SmDj5foUari+cMLlyCJ0w52m
qu+jWrhUfkYs5GWaETc3ADb4oGXLJi3QrPS4IoOS3Iy2K/0sKhx3nDjnXhuE/6wE
JdDqp6jP7QLH8u9leOrA
=D/AO
-----END PGP SIGNATURE-----

--l72qyua2fb6rcfpc--
