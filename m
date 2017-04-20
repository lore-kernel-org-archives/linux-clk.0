Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:36407 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968193AbdDTIhT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Apr 2017 04:37:19 -0400
Date: Thu, 20 Apr 2017 10:37:07 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: devicetree@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 06/11] drm/sun4i: add support for Allwinner DE2 mixers
Message-ID: <20170420083707.wdtrdlxpvocpzc7g@lukather>
References: <20170416120849.54542-1-icenowy@aosc.io>
 <20170416120849.54542-7-icenowy@aosc.io>
 <20170418090047.7i2k6dtoqxfdqwwy@lukather>
 <88F5FAC9-1873-4C76-9AB9-FF361C07664E@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qhz3kxodf4smqjbf"
In-Reply-To: <88F5FAC9-1873-4C76-9AB9-FF361C07664E@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--qhz3kxodf4smqjbf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2017 at 06:47:56PM +0800, Icenowy Zheng wrote:
> >> +	/* Get the physical address of the buffer in memory */
> >> +	gem =3D drm_fb_cma_get_gem_obj(fb, 0);
> >> +
> >> +	DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->paddr);
> >> +
> >> +	/* Compute the start of the displayed memory */
> >> +	bpp =3D fb->format->cpp[0];
> >> +	paddr =3D gem->paddr + fb->offsets[0];
> >> +	paddr +=3D (state->src_x >> 16) * bpp;
> >> +	paddr +=3D (state->src_y >> 16) * fb->pitches[0];
> >> +
> >> +	DRM_DEBUG_DRIVER("Setting buffer address to %pad\n", &paddr);
> >> +
> >> +	paddr_u32 =3D (uint32_t) paddr;
> >
> >How does that work on 64-bits systems ?
>=20
> The hardware is not designed to work on 64-bit systems.
>=20
> Even 64-bit A64/H5 has also 3GiB memory limit.

That's a fragile assumption.

> The address cell in mixer hardware is also only 32-bit.
>=20
> So we should just keep the force conversion here. If we then really
> met 4GiB-capable AW SoC without changing DE2, I think we should have
> other way to limit CMA pool inside 4GiB.

The register name looks like this is only the lower 32 bits that you
can set here, and that there is another register for the upper 32 bits
of that address somewhere.

In that case, please use the lower_32_bits and upper_32_bits helper,
and don't cast it that way.

If it isn't the case, you should set the DMA mask (through
dma_set_mask) so that we only allocate memory that can be accessed by
this device.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qhz3kxodf4smqjbf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY+HMrAAoJEBx+YmzsjxAgNhcP/i6kDvdBvYwSp8+8393Hia9r
Z/eXYRnvCRS73Vnr4XL8Tct5QqoLoQI9Ijf887V+wILIZuA3wfsMHFygERdrUwk/
gbfBaxVEt83JM2x5uhhAoG/7AApumdDJv9gRXsHhq6c4ph8ksMDjSE8AKIjInZgs
hd530fc91ZRJPwRN6L7hvSRqkr5dwgLV/QCnP4eAUU6YPRbWBdqmzebmcokrInej
iNGoyJGw+te8fyzxkryLxdKy8qA+bx8+FX/xWFWSmXZXgrjl4U9GCsxUrpbCjVfd
QPnUS8lqCd9VdkLESlgTWHzmizwqGnqjWGFEwyPu/jkFKhio9+8cXzWrn9yRd1v4
WpUHf8dlC/2OxSIDIuGwsFgFj8TdlejQVvmlq/QL51Dw+uXtjFO0mIWhVhIIz4ZQ
3HZZRRrfcFZif71CW4Jro5YqHhy+iKRoSngwDRaUk7Q9eV5EW20JI7KomF5tYImI
tBYugjI5S2/hLgR7zfnDrTIdAMrKTCM8hAoFyNM9Ny/mPR1EEOIDV6aravGgcKAo
ezw9g+16XlTGvL3uee3tVjKJPcPqr9Y9bhqF/rxEWWIYBXvprKxW7mLzF+gvctaJ
3O4wr7RmbIs3jaJGjKL4Bvzdq610eH6rH05Ffd2rWT+d7SaBphoM7jSdyj/HC8Uc
eJ6Y4CukR8Xgq86oHM/J
=t6IY
-----END PGP SIGNATURE-----

--qhz3kxodf4smqjbf--
