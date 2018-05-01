Return-Path: <ore@pengutronix.de>
Date: Tue, 1 May 2018 08:03:30 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
	linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com,
	shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] clk: imx: add imx8qxp clock support
Message-ID: <20180501060330.l5j6rztqal2whgge@pengutronix.de>
References: <1524855403-15301-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2otwruyfhvai3ah3"
In-Reply-To: <1524855403-15301-1-git-send-email-aisheng.dong@nxp.com>
List-ID: <linux-clk.vger.kernel.org>


--2otwruyfhvai3ah3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

same functionality is actually needed on iMX7d and many other non NXP
socs.
IMO proper solution is to introduce generic clock proxy or some thing
like this on top of rpmsg/virtio=20

On Sat, Apr 28, 2018 at 02:56:31AM +0800, Dong Aisheng wrote:
> This patch series adds i.MX8QXP clock support which is based
> on the clock service provided by SCU firmware.
> It depends on SCU APIs patch set.
>=20
> Dong Aisheng (12):
>   clk: imx: add configuration option for mmio clks
>   clk: imx: scu: add scu clock common part
>   clk: imx: scu: add scu clock divider
>   clk: imx: scu: add scu clock gpr divider
>   clk: imx: scu: add scu clock gate
>   clk: imx: scu: add scu clock gpr gate
>   clk: imx: scu: add scu clock mux
>   clk: imx: scu: add scu clock gpr mux
>   clk: imx: add common imx_clk_hw_fixed functions
>   clk: imx: add imx_check_clk_hws helper function
>   dt-bindings: clock: add imx8qxp clock binding doc
>   clk: imx: add imx8qxp clk driver
>=20
>  .../devicetree/bindings/clock/imx8qxp-clk.txt      |  39 ++
>  arch/arm/mach-imx/Kconfig                          |  10 +
>  drivers/clk/Kconfig                                |   1 +
>  drivers/clk/imx/Kconfig                            |   7 +
>  drivers/clk/imx/Makefile                           |   4 +-
>  drivers/clk/imx/clk-common.h                       |  27 ++
>  drivers/clk/imx/scu/Kconfig                        |   5 +
>  drivers/clk/imx/scu/Makefile                       |  12 +
>  drivers/clk/imx/scu/clk-divider-gpr-scu.c          | 131 +++++++
>  drivers/clk/imx/scu/clk-divider-scu.c              | 129 +++++++
>  drivers/clk/imx/scu/clk-gate-gpr-scu.c             |  84 ++++
>  drivers/clk/imx/scu/clk-gate-scu.c                 | 193 ++++++++++
>  drivers/clk/imx/scu/clk-imx8qxp.c                  | 426 +++++++++++++++=
++++++
>  drivers/clk/imx/scu/clk-mux-gpr-scu.c              |  90 +++++
>  drivers/clk/imx/scu/clk-mux-scu.c                  |  89 +++++
>  drivers/clk/imx/scu/clk-scu.c                      |  25 ++
>  drivers/clk/imx/scu/clk-scu.h                      |  97 +++++
>  include/dt-bindings/clock/imx8qxp-clock.h          | 362 +++++++++++++++=
++
>  include/soc/imx/imx8qxp/lpcg.h                     | 186 +++++++++
>  19 files changed, 1916 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8qxp-clk.t=
xt
>  create mode 100644 drivers/clk/imx/Kconfig
>  create mode 100644 drivers/clk/imx/clk-common.h
>  create mode 100644 drivers/clk/imx/scu/Kconfig
>  create mode 100644 drivers/clk/imx/scu/Makefile
>  create mode 100644 drivers/clk/imx/scu/clk-divider-gpr-scu.c
>  create mode 100644 drivers/clk/imx/scu/clk-divider-scu.c
>  create mode 100644 drivers/clk/imx/scu/clk-gate-gpr-scu.c
>  create mode 100644 drivers/clk/imx/scu/clk-gate-scu.c
>  create mode 100644 drivers/clk/imx/scu/clk-imx8qxp.c
>  create mode 100644 drivers/clk/imx/scu/clk-mux-gpr-scu.c
>  create mode 100644 drivers/clk/imx/scu/clk-mux-scu.c
>  create mode 100644 drivers/clk/imx/scu/clk-scu.c
>  create mode 100644 drivers/clk/imx/scu/clk-scu.h
>  create mode 100644 include/dt-bindings/clock/imx8qxp-clock.h
>  create mode 100644 include/soc/imx/imx8qxp/lpcg.h
>=20
> --=20
> 2.7.4
>=20
>=20
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--2otwruyfhvai3ah3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlroAzEACgkQdQOiSHVI
77TvYQf+Kv657ptJ9dRY2wDpJHQSXk/eu4E8kRE5stg0danBfS2acE+eeSfIbrPv
Pz+U175twDC1SY0+IfuuvSPhE0DSxLoN/VzqgoNFJCElsRkSG4Kpk1lih0VGu/YJ
2NazEB0bGJqCWcmlgmp3UMvIShDoRyZGfhl2pCjD8jVvJmBSnWM27KZFkFzjb1ud
qsOm96r2l3WXoRbQHBsjt6v/ddfWWRhxYb3O3+lCJnNC99P0I6ZVI+V36xXtK2e5
jVgwSPW3xbfDdWbdm0h/BTFpCdY6ednquvBB5K6qU7UbtkpqT61Twlx6I2erFtye
plusjMSI65CcJRSs1vN0sr3bjO2azQ==
=iLX8
-----END PGP SIGNATURE-----

--2otwruyfhvai3ah3--
