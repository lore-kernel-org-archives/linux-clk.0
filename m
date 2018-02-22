Return-Path: <boris.brezillon@bootlin.com>
Date: Thu, 22 Feb 2018 13:38:24 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: linux-kernel@vger.kernel.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Marek Vasut
 <marek.vasut@gmail.com>, David Airlie <airlied@linux.ie>, Richard
 Weinberger <richard@nod.at>, Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] Update Boris Brezillon email address
Message-ID: <20180222133824.6494645f@bbrezillon>
In-Reply-To: <20180216104449.15546-1-boris.brezillon@bootlin.com>
References: <20180216104449.15546-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, 16 Feb 2018 11:44:49 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Free Electrons is now Bootlin.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Note that I'm planning to take this patch through the MTD tree.

Applied to the nand/next branch of the MTD tree.

> ---
>  .mailmap    |  7 ++++---
>  MAINTAINERS | 10 +++++-----
>  2 files changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/.mailmap b/.mailmap
> index e18cab73e209..50c1d6bf36b2 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -33,9 +33,10 @@ Axel Lin <axel.lin@gmail.com>
>  Ben Gardner <bgardner@wabtec.com>
>  Ben M Cahill <ben.m.cahill@intel.com>
>  Bj=C3=B6rn Steinbrink <B.Steinbrink@gmx.de>
> -Boris Brezillon <boris.brezillon@free-electrons.com>
> -Boris Brezillon <boris.brezillon@free-electrons.com> <b.brezillon.dev@gm=
ail.com>
> -Boris Brezillon <boris.brezillon@free-electrons.com> <b.brezillon@overki=
z.com>
> +Boris Brezillon <boris.brezillon@bootlin.com>
> +Boris Brezillon <boris.brezillon@bootlin.com> <boris.brezillon@free-elec=
trons.com>
> +Boris Brezillon <boris.brezillon@bootlin.com> <b.brezillon.dev@gmail.com>
> +Boris Brezillon <boris.brezillon@bootlin.com> <b.brezillon@overkiz.com>
>  Brian Avery <b.avery@hp.com>
>  Brian King <brking@us.ibm.com>
>  Christoph Hellwig <hch@lst.de>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 34b2e9ed6d3d..38fcbabbc55b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1232,7 +1232,7 @@ F:	arch/arm/boot/dts/aspeed-*
>  F:	drivers/*/*aspeed*
> =20
>  ARM/ATMEL AT91 Clock Support
> -M:	Boris Brezillon <boris.brezillon@free-electrons.com>
> +M:	Boris Brezillon <boris.brezillon@bootlin.com>
>  S:	Maintained
>  F:	drivers/clk/at91
> =20
> @@ -4644,7 +4644,7 @@ F:	Documentation/gpu/meson.rst
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> =20
>  DRM DRIVERS FOR ATMEL HLCDC
> -M:	Boris Brezillon <boris.brezillon@free-electrons.com>
> +M:	Boris Brezillon <boris.brezillon@bootlin.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  F:	drivers/gpu/drm/atmel-hlcdc/
> @@ -8412,7 +8412,7 @@ F:	include/uapi/drm/armada_drm.h
>  F:	Documentation/devicetree/bindings/display/armada/
> =20
>  MARVELL CRYPTO DRIVER
> -M:	Boris Brezillon <boris.brezillon@free-electrons.com>
> +M:	Boris Brezillon <boris.brezillon@bootlin.com>
>  M:	Arnaud Ebalard <arno@natisbad.org>
>  F:	drivers/crypto/marvell/
>  S:	Maintained
> @@ -9034,7 +9034,7 @@ F:	mm/
>  MEMORY TECHNOLOGY DEVICES (MTD)
>  M:	David Woodhouse <dwmw2@infradead.org>
>  M:	Brian Norris <computersforpeace@gmail.com>
> -M:	Boris Brezillon <boris.brezillon@free-electrons.com>
> +M:	Boris Brezillon <boris.brezillon@bootlin.com>
>  M:	Marek Vasut <marek.vasut@gmail.com>
>  M:	Richard Weinberger <richard@nod.at>
>  M:	Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> @@ -9452,7 +9452,7 @@ S:	Supported
>  F:	drivers/net/ethernet/myricom/myri10ge/
> =20
>  NAND FLASH SUBSYSTEM
> -M:	Boris Brezillon <boris.brezillon@free-electrons.com>
> +M:	Boris Brezillon <boris.brezillon@bootlin.com>
>  R:	Richard Weinberger <richard@nod.at>
>  L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/



--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
