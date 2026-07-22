Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23827284880;
	Wed, 22 Jul 2026 07:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704641; cv=none; b=ddMI8ZIXqRKKqaak8DEB5Mnd8xTe1xLvYhm9y5mCX2DTvbSuJ8hvu9H7/0iI+KKS3yyFluUz06nP4dYAw3ZUzRrDhR47WcqaoPocsuO3nI6Ef5BU7LuP9QcwGwCv1qgFCuRU3bwtj2V6u1LHq7z+IywUG3l0PaCCjVMDBLVx2zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704641; c=relaxed/simple;
	bh=xrVy6DYCXskwvVksVtSYjcqWf3KKH1hMYCbNjKzQzSA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cy0hCgwPGM6lsId5N50qYbjHoKQ4BGjrmmGqWfl4y1k4ELFz745N1CXNwIclGjdwfya7kWy/McUVs0c7TLFsAVo9TUmFA4JWa+VwuIhr8TwB+tL6+gtNF9KychsSwGkLBsSD25s7988X194SumkcKzuQrcGNczzCp4NXOEfm2X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9D683201C37;
	Wed, 22 Jul 2026 09:17:14 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wmRCc-000hPy-1p;
	Wed, 22 Jul 2026 09:17:14 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wmRCc-0000000046P-1xuT;
	Wed, 22 Jul 2026 09:17:14 +0200
Message-ID: <657f11ab535867200177684529b86a406e13cd48.camel@pengutronix.de>
Subject: Re: [PATCH v10 03/11] reset: realtek: Add RTD1625 reset controller
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
 bmasney@redhat.com
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Date: Wed, 22 Jul 2026 09:17:14 +0200
In-Reply-To: <20260713155630.3054636-4-eleanor.lin@realtek.com>
References: <20260713155630.3054636-1-eleanor.lin@realtek.com>
	 <20260713155630.3054636-4-eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mo, 2026-07-13 at 23:56 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
>=20
> Add support for the CRT (Clock, Reset, and Test) and ISO (Isolation)domai=
n
> reset controller on the Realtek RTD1625 SoC.
>=20
> The reset controller shares the same register space with the CRT and ISO
> clock controller. To handle this shared register space, the reset driver =
is
> implemented as an auxiliary driver. It will be instantiated and probed vi=
a
> the auxiliary bus by the RTD1625-CRT and RTD1625-ISO clock controller dri=
ver.
>=20
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v10:
> - Merge 'reset-rtd1625-crt' and 'reset-rtd1625-iso' into a single module
> ---
>  drivers/reset/realtek/Kconfig         |  11 ++
>  drivers/reset/realtek/Makefile        |   1 +
>  drivers/reset/realtek/reset-rtd1625.c | 262 ++++++++++++++++++++++++++
>  3 files changed, 274 insertions(+)
>  create mode 100644 drivers/reset/realtek/reset-rtd1625.c
>=20
[...]
> diff --git a/drivers/reset/realtek/reset-rtd1625.c b/drivers/reset/realte=
k/reset-rtd1625.c
> new file mode 100644
> index 000000000000..aaff6dd1c8a6
> --- /dev/null
> +++ b/drivers/reset/realtek/reset-rtd1625.c
> @@ -0,0 +1,262 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Realtek Semiconductor Corporation
> + */
> +
> +#include <dt-bindings/reset/realtek,rtd1625.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/array_size.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/slab.h>
> +#include "reset-rtk-common.h"
> +
> +struct rtd1625_reset_info {
> +	const struct rtk_reset_desc *descs;
> +	unsigned int nr_resets;
> +};
> +
> +static const struct rtk_reset_desc rtd1625_crt_reset_descs[] =3D {
> +	/* Bank 0: offset 0x0 */
> +	[RTD1625_CRT_RSTN_MISC]         =3D { .ofs =3D 0x0, .bit =3D 0,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DIP]          =3D { .ofs =3D 0x0, .bit =3D 2,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_GSPI]         =3D { .ofs =3D 0x0, .bit =3D 4,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SDS]          =3D { .ofs =3D 0x0, .bit =3D 6,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SDS_REG]      =3D { .ofs =3D 0x0, .bit =3D 8,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SDS_PHY]      =3D { .ofs =3D 0x0, .bit =3D 10, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_GPU2D]        =3D { .ofs =3D 0x0, .bit =3D 12, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DC_PHY]       =3D { .ofs =3D 0x0, .bit =3D 22, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DCPHY_CRT]    =3D { .ofs =3D 0x0, .bit =3D 24, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_LSADC]        =3D { .ofs =3D 0x0, .bit =3D 26, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SE]           =3D { .ofs =3D 0x0, .bit =3D 28, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DLA]          =3D { .ofs =3D 0x0, .bit =3D 30, .write=
_en =3D 1 },
> +	/* Bank 1: offset 0x4 */
> +	[RTD1625_CRT_RSTN_JPEG]         =3D { .ofs =3D 0x4, .bit =3D 0,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SD]           =3D { .ofs =3D 0x4, .bit =3D 2,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SDIO]         =3D { .ofs =3D 0x4, .bit =3D 6,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCR_CNT]      =3D { .ofs =3D 0x4, .bit =3D 8,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE0_STITCH] =3D { .ofs =3D 0x4, .bit =3D 10, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE0_PHY]    =3D { .ofs =3D 0x4, .bit =3D 12, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE0]        =3D { .ofs =3D 0x4, .bit =3D 14, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE0_CORE]   =3D { .ofs =3D 0x4, .bit =3D 16, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE0_POWER]  =3D { .ofs =3D 0x4, .bit =3D 18, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE0_NONSTICH] =3D { .ofs =3D 0x4, .bit =3D 20, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE0_PHY_MDIO] =3D { .ofs =3D 0x4, .bit =3D 22, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE0_SGMII_MDIO] =3D { .ofs =3D 0x4, .bit =3D 24, .w=
rite_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VO2]          =3D { .ofs =3D 0x4, .bit =3D 28, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MISC_SC0]     =3D { .ofs =3D 0x4, .bit =3D 30, .write=
_en =3D 1 },
> +	/* Bank 2: offset 0x8 */
> +	[RTD1625_CRT_RSTN_MD]           =3D { .ofs =3D 0x8, .bit =3D 4,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_LVDS1]        =3D { .ofs =3D 0x8, .bit =3D 6,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_LVDS2]        =3D { .ofs =3D 0x8, .bit =3D 8,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MISC_SC1]     =3D { .ofs =3D 0x8, .bit =3D 10, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_I2C_3]        =3D { .ofs =3D 0x8, .bit =3D 12, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_FAN]          =3D { .ofs =3D 0x8, .bit =3D 14, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_TVE]          =3D { .ofs =3D 0x8, .bit =3D 16, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_AIO]          =3D { .ofs =3D 0x8, .bit =3D 18, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VO]           =3D { .ofs =3D 0x8, .bit =3D 20, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MIPI_CSI]     =3D { .ofs =3D 0x8, .bit =3D 22, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_HDMIRX]       =3D { .ofs =3D 0x8, .bit =3D 24, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_HDMIRX_WRAP]  =3D { .ofs =3D 0x8, .bit =3D 26, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_HDMI]         =3D { .ofs =3D 0x8, .bit =3D 28, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DISP]         =3D { .ofs =3D 0x8, .bit =3D 30, .write=
_en =3D 1 },
> +	/* Bank 3: offset 0xc */
> +	[RTD1625_CRT_RSTN_SATA_PHY_POW1] =3D { .ofs =3D 0xc, .bit =3D 0,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SATA_PHY_POW0] =3D { .ofs =3D 0xc, .bit =3D 2,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SATA_MDIO1]   =3D { .ofs =3D 0xc, .bit =3D 4,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SATA_MDIO0]   =3D { .ofs =3D 0xc, .bit =3D 6,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SATA_WRAP]    =3D { .ofs =3D 0xc, .bit =3D 8,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SATA_MAC_P1]  =3D { .ofs =3D 0xc, .bit =3D 10, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SATA_MAC_P0]  =3D { .ofs =3D 0xc, .bit =3D 12, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SATA_MAC_COM] =3D { .ofs =3D 0xc, .bit =3D 14, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE1_STITCH] =3D { .ofs =3D 0xc, .bit =3D 16, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE1_PHY]     =3D { .ofs =3D 0xc, .bit =3D 18, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE1]         =3D { .ofs =3D 0xc, .bit =3D 20, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE1_CORE]   =3D { .ofs =3D 0xc, .bit =3D 22, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE1_POWER]  =3D { .ofs =3D 0xc, .bit =3D 24, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE1_NONSTICH] =3D { .ofs =3D 0xc, .bit =3D 26, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE1_PHY_MDIO] =3D { .ofs =3D 0xc, .bit =3D 28, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_HDMITOP]      =3D { .ofs =3D 0xc, .bit =3D 30, .write=
_en =3D 1 },
> +	/* Bank 4: offset 0x68 */
> +	[RTD1625_CRT_RSTN_I2C_4]        =3D { .ofs =3D 0x68, .bit =3D 2,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_I2C_5]        =3D { .ofs =3D 0x68, .bit =3D 4,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_TSIO]         =3D { .ofs =3D 0x68, .bit =3D 6,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VI]           =3D { .ofs =3D 0x68, .bit =3D 8,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_EDP]          =3D { .ofs =3D 0x68, .bit =3D 10, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VE1_MMU]      =3D { .ofs =3D 0x68, .bit =3D 12, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VE1_MMU_FUNC] =3D { .ofs =3D 0x68, .bit =3D 14, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_HSE_MMU]      =3D { .ofs =3D 0x68, .bit =3D 16, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_HSE_MMU_FUNC] =3D { .ofs =3D 0x68, .bit =3D 18, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MDLM2M]       =3D { .ofs =3D 0x68, .bit =3D 20, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_ISO_GSPI]     =3D { .ofs =3D 0x68, .bit =3D 22, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SOFT_NPU]     =3D { .ofs =3D 0x68, .bit =3D 24, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SPI2EMMC]     =3D { .ofs =3D 0x68, .bit =3D 26, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_EARC]         =3D { .ofs =3D 0x68, .bit =3D 28, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VE1]          =3D { .ofs =3D 0x68, .bit =3D 30, .writ=
e_en =3D 1 },
> +	/* Bank 5: offset 0x90 */
> +	[RTD1625_CRT_RSTN_PCIE2_STITCH]  =3D { .ofs =3D 0x90, .bit =3D 0,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE2_PHY]    =3D { .ofs =3D 0x90, .bit =3D 2,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE2]        =3D { .ofs =3D 0x90, .bit =3D 4,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE2_CORE]   =3D { .ofs =3D 0x90, .bit =3D 6,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE2_POWER]  =3D { .ofs =3D 0x90, .bit =3D 8,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE2_NONSTICH] =3D { .ofs =3D 0x90, .bit =3D 10, .wr=
ite_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE2_PHY_MDIO] =3D { .ofs =3D 0x90, .bit =3D 12, .wr=
ite_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DCPHY_UMCTL2] =3D { .ofs =3D 0x90, .bit =3D 14, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MIPI_DSI]     =3D { .ofs =3D 0x90, .bit =3D 16, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_HIFM]         =3D { .ofs =3D 0x90, .bit =3D 18, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_NSRAM]        =3D { .ofs =3D 0x90, .bit =3D 20, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_AUCPU0_REG]   =3D { .ofs =3D 0x90, .bit =3D 22, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MDL_GENPW]    =3D { .ofs =3D 0x90, .bit =3D 24, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MDL_CHIP]     =3D { .ofs =3D 0x90, .bit =3D 26, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MDL_IP]       =3D { .ofs =3D 0x90, .bit =3D 28, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_TEST_MUX]     =3D { .ofs =3D 0x90, .bit =3D 30, .writ=
e_en =3D 1 },
> +	/* Bank 6: offset 0xb8 */
> +	[RTD1625_CRT_RSTN_ISO_BIST]     =3D { .ofs =3D 0xb8, .bit =3D 0,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MAIN_BIST]    =3D { .ofs =3D 0xb8, .bit =3D 2,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MAIN2_BIST]   =3D { .ofs =3D 0xb8, .bit =3D 4,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VE1_BIST]     =3D { .ofs =3D 0xb8, .bit =3D 6,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VE2_BIST]     =3D { .ofs =3D 0xb8, .bit =3D 8,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DCPHY_BIST]   =3D { .ofs =3D 0xb8, .bit =3D 10, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_GPU_BIST]     =3D { .ofs =3D 0xb8, .bit =3D 12, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DISP_BIST]    =3D { .ofs =3D 0xb8, .bit =3D 14, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_NPU_BIST]     =3D { .ofs =3D 0xb8, .bit =3D 16, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_CAS_BIST]     =3D { .ofs =3D 0xb8, .bit =3D 18, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VE4_BIST]     =3D { .ofs =3D 0xb8, .bit =3D 20, .writ=
e_en =3D 1 },
> +	/* Bank 7: offset 0x454 (DUMMY0, no write_en) */
> +	[RTD1625_CRT_RSTN_EMMC]         =3D { .ofs =3D 0x454, .bit =3D 0 },
> +	/* Bank 8: offset 0x458 (DUMMY1, no write_en) */
> +	[RTD1625_CRT_RSTN_GPU]          =3D { .ofs =3D 0x458, .bit =3D 0 },
> +	/* Bank 9: offset 0x464 (DUMMY4, no write_en) */
> +	[RTD1625_CRT_RSTN_VE2]          =3D { .ofs =3D 0x464, .bit =3D 0 },
> +	/* Bank 10: offset 0x880 */
> +	[RTD1625_CRT_RSTN_UR1]          =3D { .ofs =3D 0x880, .bit =3D 0,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR2]          =3D { .ofs =3D 0x880, .bit =3D 2,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR3]          =3D { .ofs =3D 0x880, .bit =3D 4,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR4]          =3D { .ofs =3D 0x880, .bit =3D 6,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR5]          =3D { .ofs =3D 0x880, .bit =3D 8,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR6]          =3D { .ofs =3D 0x880, .bit =3D 10, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR7]          =3D { .ofs =3D 0x880, .bit =3D 12, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR8]          =3D { .ofs =3D 0x880, .bit =3D 14, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR9]          =3D { .ofs =3D 0x880, .bit =3D 16, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR_TOP]       =3D { .ofs =3D 0x880, .bit =3D 18, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_I2C_7]        =3D { .ofs =3D 0x880, .bit =3D 28, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_I2C_6]        =3D { .ofs =3D 0x880, .bit =3D 30, .wri=
te_en =3D 1 },
> +	/* Bank 11: offset 0x890 */
> +	[RTD1625_CRT_RSTN_SPI0]         =3D { .ofs =3D 0x890, .bit =3D 0,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SPI1]         =3D { .ofs =3D 0x890, .bit =3D 2,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SPI2]         =3D { .ofs =3D 0x890, .bit =3D 4,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_LSADC0]       =3D { .ofs =3D 0x890, .bit =3D 16, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_LSADC1]       =3D { .ofs =3D 0x890, .bit =3D 18, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_ISOMIS_DMA]   =3D { .ofs =3D 0x890, .bit =3D 20, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_AUDIO_ADC]    =3D { .ofs =3D 0x890, .bit =3D 22, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DPTX]         =3D { .ofs =3D 0x890, .bit =3D 24, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_AUCPU1_REG]   =3D { .ofs =3D 0x890, .bit =3D 26, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_EDPTX]        =3D { .ofs =3D 0x890, .bit =3D 28, .wri=
te_en =3D 1 },
> +};
> +
> +static const struct rtd1625_reset_info rtd1625_crt_info =3D {
> +	.descs =3D rtd1625_crt_reset_descs,
> +	.nr_resets =3D ARRAY_SIZE(rtd1625_crt_reset_descs),
> +};
> +
> +static const struct rtk_reset_desc rtd1625_iso_reset_descs[] =3D {
> +	[RTD1625_ISO_RSTN_VFD]                 =3D { .ofs =3D 0x88, .bit =3D 0 =
},
> +	[RTD1625_ISO_RSTN_CEC0]                =3D { .ofs =3D 0x88, .bit =3D 2 =
},
> +	[RTD1625_ISO_RSTN_CEC1]                =3D { .ofs =3D 0x88, .bit =3D 3 =
},
> +	[RTD1625_ISO_RSTN_CBUSTX]              =3D { .ofs =3D 0x88, .bit =3D 5 =
},
> +	[RTD1625_ISO_RSTN_CBUSRX]              =3D { .ofs =3D 0x88, .bit =3D 6 =
},
> +	[RTD1625_ISO_RSTN_USB3_PHY2_XTAL_POW]  =3D { .ofs =3D 0x88, .bit =3D 7 =
},
> +	[RTD1625_ISO_RSTN_UR0]                 =3D { .ofs =3D 0x88, .bit =3D 8 =
},
> +	[RTD1625_ISO_RSTN_GMAC]                =3D { .ofs =3D 0x88, .bit =3D 9 =
},
> +	[RTD1625_ISO_RSTN_GPHY]                =3D { .ofs =3D 0x88, .bit =3D 10=
 },
> +	[RTD1625_ISO_RSTN_I2C_0]               =3D { .ofs =3D 0x88, .bit =3D 11=
 },
> +	[RTD1625_ISO_RSTN_I2C_1]               =3D { .ofs =3D 0x88, .bit =3D 12=
 },
> +	[RTD1625_ISO_RSTN_CBUS]                =3D { .ofs =3D 0x88, .bit =3D 13=
 },
> +	[RTD1625_ISO_RSTN_USB_DRD]             =3D { .ofs =3D 0x88, .bit =3D 14=
 },
> +	[RTD1625_ISO_RSTN_USB_HOST]            =3D { .ofs =3D 0x88, .bit =3D 15=
 },
> +	[RTD1625_ISO_RSTN_USB_PHY_0]           =3D { .ofs =3D 0x88, .bit =3D 16=
 },
> +	[RTD1625_ISO_RSTN_USB_PHY_1]           =3D { .ofs =3D 0x88, .bit =3D 17=
 },
> +	[RTD1625_ISO_RSTN_USB_PHY_2]           =3D { .ofs =3D 0x88, .bit =3D 18=
 },
> +	[RTD1625_ISO_RSTN_USB]                 =3D { .ofs =3D 0x88, .bit =3D 19=
 },
> +	[RTD1625_ISO_RSTN_TYPE_C]              =3D { .ofs =3D 0x88, .bit =3D 20=
 },
> +	[RTD1625_ISO_RSTN_USB_U3_HOST]         =3D { .ofs =3D 0x88, .bit =3D 21=
 },
> +	[RTD1625_ISO_RSTN_USB3_PHY0_POW]       =3D { .ofs =3D 0x88, .bit =3D 22=
 },
> +	[RTD1625_ISO_RSTN_USB3_P0_MDIO]        =3D { .ofs =3D 0x88, .bit =3D 23=
 },
> +	[RTD1625_ISO_RSTN_USB3_PHY1_POW]       =3D { .ofs =3D 0x88, .bit =3D 24=
 },
> +	[RTD1625_ISO_RSTN_USB3_P1_MDIO]        =3D { .ofs =3D 0x88, .bit =3D 25=
 },
> +	[RTD1625_ISO_RSTN_VTC]                 =3D { .ofs =3D 0x88, .bit =3D 26=
 },
> +	[RTD1625_ISO_RSTN_USB3_PHY2_POW]       =3D { .ofs =3D 0x88, .bit =3D 27=
 },
> +	[RTD1625_ISO_RSTN_USB3_P2_MDIO]        =3D { .ofs =3D 0x88, .bit =3D 28=
 },
> +	[RTD1625_ISO_RSTN_USB_PHY_3]           =3D { .ofs =3D 0x88, .bit =3D 29=
 },
> +	[RTD1625_ISO_RSTN_USB_PHY_4]           =3D { .ofs =3D 0x88, .bit =3D 30=
 },
> +};
> +
> +static const struct rtd1625_reset_info rtd1625_iso_info =3D {
> +	.descs =3D rtd1625_iso_reset_descs,
> +	.nr_resets =3D ARRAY_SIZE(rtd1625_iso_reset_descs),
> +};
> +
> +static const struct rtk_reset_desc rtd1625_iso_s_reset_descs[] =3D {
> +	[RTD1625_ISO_S_RSTN_ISOM_MIS] =3D { .ofs =3D 0x310, .bit =3D 0, .write_=
en =3D 1 },
> +	[RTD1625_ISO_S_RSTN_GPIOM]    =3D { .ofs =3D 0x310, .bit =3D 2, .write_=
en =3D 1 },
> +	[RTD1625_ISO_S_RSTN_TIMER7]   =3D { .ofs =3D 0x310, .bit =3D 4, .write_=
en =3D 1 },
> +	[RTD1625_ISO_S_RSTN_IRDA]     =3D { .ofs =3D 0x310, .bit =3D 6, .write_=
en =3D 1 },
> +	[RTD1625_ISO_S_RSTN_UR10]     =3D { .ofs =3D 0x310, .bit =3D 8, .write_=
en =3D 1 },
> +};
> +
> +static const struct rtd1625_reset_info rtd1625_iso_s_info =3D {
> +	.descs =3D rtd1625_iso_s_reset_descs,
> +	.nr_resets =3D ARRAY_SIZE(rtd1625_iso_s_reset_descs),
> +};
> +
> +static int rtd1625_reset_probe(struct auxiliary_device *adev,
> +			       const struct auxiliary_device_id *id)
> +{
> +	const struct rtd1625_reset_info *info;
> +	struct device *dev =3D &adev->dev;
> +	struct rtk_reset_data *data;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	info =3D (const struct rtd1625_reset_info *)id->driver_data;
> +
> +	data->descs           =3D  info->descs;

Superfluous whitespace.         ^

> +	data->regmap          =3D dev_get_platdata(dev);
> +	data->rcdev.owner     =3D THIS_MODULE;
> +	data->rcdev.nr_resets =3D info->nr_resets;
> +	data->rcdev.ops       =3D &rtk_reset_ops;
> +	data->rcdev.dev       =3D dev;
> +	data->rcdev.of_node   =3D dev->parent->of_node;

Just use dev->of_node here.
auxiliary_device_create() already uses device_set_of_node_from_dev() to
inherit the node from the parent device.


Otherwise,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
