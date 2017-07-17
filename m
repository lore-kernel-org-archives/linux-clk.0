Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 17 Jul 2017 10:54:49 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Priit Laes <plaes@plaes.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	Jonathan Liu <net147@gmail.com>
Subject: Re: [PATCH v6 2/6] clk: sunxi-ng: Add sun4i/sun7i CCU driver
Message-ID: <20170717085449.runn4azmedh2kgwy@flea>
References: <cover.ba2aaaa405a7ec685034e34926b8855fd6c9ab86.1500043741.git-series.plaes@plaes.org>
 <f03e50040dc2d3dc3edd6be071510feeb953161d.1500043741.git-series.plaes@plaes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sjgiboxosfyvjiw2"
In-Reply-To: <f03e50040dc2d3dc3edd6be071510feeb953161d.1500043741.git-series.plaes@plaes.org>
List-ID: <linux-clk.vger.kernel.org>


--sjgiboxosfyvjiw2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 14, 2017 at 05:49:24PM +0300, Priit Laes wrote:
> Introduce a clock controller driver for sun4i A10 and sun7i A20
> series SoCs.
>=20
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  drivers/clk/sunxi-ng/Kconfig              |   13 +-
>  drivers/clk/sunxi-ng/Makefile             |    1 +-
>  drivers/clk/sunxi-ng/ccu-sun4i-a10.c      | 1454 ++++++++++++++++++++++-
>  drivers/clk/sunxi-ng/ccu-sun4i-a10.h      |   61 +-
>  include/dt-bindings/clock/sun4i-a10-ccu.h |  200 +++-
>  include/dt-bindings/clock/sun7i-a20-ccu.h |   53 +-
>  include/dt-bindings/reset/sun4i-a10-ccu.h |   69 +-
>  7 files changed, 1851 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun4i-a10.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun4i-a10.h
>  create mode 100644 include/dt-bindings/clock/sun4i-a10-ccu.h
>  create mode 100644 include/dt-bindings/clock/sun7i-a20-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun4i-a10-ccu.h
>=20
> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
> index 7342928..1b5cea9 100644
> --- a/drivers/clk/sunxi-ng/Kconfig
> +++ b/drivers/clk/sunxi-ng/Kconfig
> @@ -11,6 +11,19 @@ config SUN50I_A64_CCU
>  	default ARM64 && ARCH_SUNXI
>  	depends on (ARM64 && ARCH_SUNXI) || COMPILE_TEST
> =20
> +config SUNXI_A10_CCU
> +	bool "Support for the Allwinner A10/A20 CCU"
> +	select SUNXI_CCU_DIV
> +	select SUNXI_CCU_MULT
> +	select SUNXI_CCU_NK
> +	select SUNXI_CCU_NKM
> +	select SUNXI_CCU_NM
> +	select SUNXI_CCU_MP
> +	select SUNXI_CCU_PHASE
> +	default MACH_SUN4I
> +	default MACH_SUN7I
> +	depends on MACH_SUN4I || MACH_SUN7I || COMPILE_TEST

I'm a bit late on this one, but I agree with Olliver, it should be
called SUN4I_A10. This is what we do for all the other symbols (and it
should be ordered as such).

> +
>  config SUN5I_CCU
>  	bool "Support for the Allwinner sun5i family CCM"
>  	default MACH_SUN5I
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
> index 0c45fa5..01e958c 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -21,6 +21,7 @@ lib-$(CONFIG_SUNXI_CCU)		+=3D ccu_mp.o
>  obj-$(CONFIG_SUN50I_A64_CCU)	+=3D ccu-sun50i-a64.o
>  obj-$(CONFIG_SUN5I_CCU)		+=3D ccu-sun5i.o
>  obj-$(CONFIG_SUN6I_A31_CCU)	+=3D ccu-sun6i-a31.o
> +obj-$(CONFIG_SUNXI_A10_CCU)	+=3D ccu-sun4i-a10.o

The ordering is wrong here too.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--sjgiboxosfyvjiw2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbHtZAAoJEBx+YmzsjxAgyxYQAKwnTPBdXUUn/NBuimajqmXf
SjcNVD7NOsuk6WKWlsrZXnjTnexfxdlIHyfiTj2dF+4uxZdsihpLQ5lnwput8afF
esaF9MTqHvTfLrjUgnyZn3Qm6AqpOR93FZ+67YH3Ybj7GAaBX/50H5GrtNtHjXs+
V7mz+aiMT+2QcgUS5kMAZ5WTYL3o9lsVe8aN4HeCLB83flntUTaX8yipKEm7kz2k
cPca4KouGHkf7G9wm+N7jK+e0PKQg4goixE2hud+2he/qOFws/hsg9mn0pIhrWZg
uYY4O+/4BQkaOX6qNhn3hj+kmsa8ulb4BfMEW+4DrAb+ASzO07dhQ9/KVv32Okms
wbN1888Ha34kfhCnyGbRrmRWFDI6RNYmMiioBrO5LH4W6rn/6/bk+HVK8FJ51pAq
6/qPMiPtZfJNaMlRgGo1ip1hGAj9ulwh+e3Ea0hF4lfIhEpXzjuzjIzxob+Qi+Lf
sOMmRIzsUFQZ7yPL1KjLnvq9osHaMsoYIwtrw3LR3uZPUV6J4K2grw1h+e95SHSm
TNXXmyKgg8ds3BG9HdFMmVICA/SITjxGzaUfwLG3c8qfEx3LOhYR/EUHkdYBXg2+
hOUWROtE2HYTLBa9aFbMxizY2GJrkTz2Mjoa76CeAqYg6nNKjF2zKS1sIMb75vTg
GCYZ0SFB+/g+XMCSxGiF
=GB0P
-----END PGP SIGNATURE-----

--sjgiboxosfyvjiw2--
