Return-Path: <linux-kernel-owner@vger.kernel.org>
Reply-To: monstr@monstr.eu
Subject: Re: [PATCH] clk: zynq: remove redundant $(CONFIG_ARCH_ZYNQ) in
 Makefile
References: <1437982602-26886-1-git-send-email-yamada.masahiro@socionext.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
	linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michal Simek <michal.simek@xilinx.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	=?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <55B5EA0F.8000404@monstr.eu>
Date: Mon, 27 Jul 2015 10:21:35 +0200
MIME-Version: 1.0
In-Reply-To: <1437982602-26886-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="GwXtDStMJAIfJK7Vk31Ucp3Qb3vKQlfOo"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GwXtDStMJAIfJK7Vk31Ucp3Qb3vKQlfOo
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 07/27/2015 09:36 AM, Masahiro Yamada wrote:
> Kbuild descends into drivers/clk/zynq/ only when CONFIG_ARCH_ZYNQ
> is enabled.  (see drivers/clk/Makefile)
>=20
> $(CONFIG_ARCH_ZYNQ) in drivers/clk/zynq/Makefile always evaluates
> to 'y'.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
>  drivers/clk/zynq/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/zynq/Makefile b/drivers/clk/zynq/Makefile
> index 156d923..0afc2e7 100644
> --- a/drivers/clk/zynq/Makefile
> +++ b/drivers/clk/zynq/Makefile
> @@ -1,3 +1,3 @@
>  # Zynq clock specific Makefile
> =20
> -obj-$(CONFIG_ARCH_ZYNQ)	+=3D clkc.o pll.o
> +obj-y	+=3D clkc.o pll.o
>=20

Applied to zynq/soc branch and will go to mainline via arm-soc.
Let me know if someone else wants to take it via different tree.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--GwXtDStMJAIfJK7Vk31Ucp3Qb3vKQlfOo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iEYEARECAAYFAlW16g8ACgkQykllyylKDCGr0wCcC2ftyW8518s4jNnci5YBmo1m
O0cAn0pWoV/diRLE87eChSo8Ot8Tim0T
=T8kI
-----END PGP SIGNATURE-----

--GwXtDStMJAIfJK7Vk31Ucp3Qb3vKQlfOo--
