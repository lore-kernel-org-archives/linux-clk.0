Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D674F442379;
	Fri,  4 Sep 2026 09:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514670; cv=pass; b=qVmcbP/GrDokuYqnWzH2MyWUwX9zVMwqWLd5RsI/nh/r8xazFvP952I/duGlYKSim7KTBNm+mt1f18WWqVN12RHh5spKwyY2y81cFkMRF20xIjp8wbvBOdbFdtVC70I4I6pw86uxgOkzhNMnnyO5WTkgB6aa9EU3+FvyUi0nTOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514670; c=relaxed/simple;
	bh=MgQjwyI9jczF/eZqWcxvPsM6DaWr4XMiOZj3q2PIeh8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hHHq/VtK0hwNskkZ5DTC0IKZN42yu1rpfOlxYZq4fYVjP9B9sLmzkQjLMGJVaqdpxMgoot7toVC22XL6ytVRpc3yFuT070IxQy0Vhw9gcCutmoCl+T+WySzpnsvNUMcivYxOuoCFSH7n/pBqA8IPdqrWfYPRlAkgfpNJNjk11NE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b=ElFKcqmA; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b="ElFKcqmA"
ARC-Seal: i=1; a=rsa-sha256; t=1788514637; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jscAkArNVy2prG9DkPLwU501QfbkBRYa5f8/ckH4UlC4axyv+VoTW/KTxD6EAi1SVq180WO1F/b4+tXTdlbp4wzJSRe6hFm3bc7iaZ8FvlvPBQqhFukYxZcOIOdnoUVpNLjX3WBBdnOmGbWbjQXtQV2zF1vnJXj/KwEUno+/RBw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788514637; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hL6oVjdAEtuQykmq5lZLXBAzADSoUMvDEx4ZZnY+K28=; 
	b=LN6+I6T8ehQV2BuVLiLvd8dAKFuGgxqdVS+LhHkaXRttpo7ZPrlFElXnWAItvrltkSfKeUR/2f+0gxPSLRw2UwdvCiJ8xrX2Kk7Ei6beLFptOjKs5UFxG9kHO2NqEu+bfEgLrf2BCegRbbEfU8uFszL8mTzmegVeNt8oWDNePj0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788514637;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=hL6oVjdAEtuQykmq5lZLXBAzADSoUMvDEx4ZZnY+K28=;
	b=ElFKcqmAjqO1OeCCnCiQV7phyy+jTl39SVid2bHyEu1R7Mv4RxlTS5mOGoZTNDN9
	1PyUIXq0xyYWS6dAgF7iYgDpxuYxHttVZEewBt8zv5fmU6o/DxmWlx62oCwRAbQ+Iv4
	fPttoE7yknpF5/I/MFzX1Hy5UXF6GM1Fvn3Pvi9E=
Received: by mx.zohomail.com with SMTPS id 1788514635226600.9423815163698;
	Fri, 4 Sep 2026 02:37:15 -0700 (PDT)
Message-ID: <0549545944646a8a02c251b06c81fe25dff6af32.camel@collabora.com>
Subject: Re: [PATCH v5 16/25] clk: mediatek: Add MT8189 apmixedsys clock
 support
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Edward-JW Yang	 <edward-jw.yang@mediatek.com>, Richard Cochran
 <richardcochran@gmail.com>,  Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Irving-CH Lin <irving-ch.lin@mediatek.com>
Date: Fri, 04 Sep 2026 11:37:08 +0200
In-Reply-To: <anCv0ga226obZg2g@redhat.com>
References: 
	<20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
	 <20260801-mt8189-clocks-system-base-v5-16-ac4410697cc2@collabora.com>
	 <anCv0ga226obZg2g@redhat.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

Hi Brian,

On Mon, 2026-08-03 at 11:12 -0400, Brian Masney wrote:
> On Sat, Aug 01, 2026 at 01:21:02PM +0200, Louis-Alexis Eyraud wrote:
> > Add support for the MT8189 apmixedsys clock controller, which
> > provides
> > PLLs generated from SoC 26m.
> >=20
> > Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> > Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> > Co-developed-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Louis-Alexis Eyraud
> > <louisalexis.eyraud@collabora.com>
> > ---
> > =C2=A0drivers/clk/mediatek/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 13 ++
> > =C2=A0drivers/clk/mediatek/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/clk/mediatek/clk-mt8189-apmixedsys.c | 203
> > +++++++++++++++++++++++++++
> > =C2=A03 files changed, 217 insertions(+)
> >=20
> > diff --git a/drivers/clk/mediatek/Kconfig
> > b/drivers/clk/mediatek/Kconfig
> > index 2c09fd729bab..f67dfb6cd019 100644
> > --- a/drivers/clk/mediatek/Kconfig
> > +++ b/drivers/clk/mediatek/Kconfig
> > @@ -815,6 +815,19 @@ config COMMON_CLK_MT8188_WPESYS
> > =C2=A0	help
> > =C2=A0	=C2=A0 This driver supports MediaTek MT8188 Warp Engine clocks.
> > =C2=A0
> > +config COMMON_CLK_MT8189
> > +	tristate "Clock driver for MediaTek MT8189"
> > +	depends on ARM64 || COMPILE_TEST
> > +	select COMMON_CLK_MEDIATEK
> > +	select COMMON_CLK_MEDIATEK_FHCTL
> > +	default ARCH_MEDIATEK
> > +	help
> > +	=C2=A0 Enable this option to support the clock management for
> > MediaTek MT8189 SoC. This
> > +	=C2=A0 includes handling of all primary clock functions and
> > features specific to the MT8189
> > +	=C2=A0 platform. Enabling this driver ensures that the system's
> > clock functionality aligns
> > +	=C2=A0 with the MediaTek MT8189 hardware capabilities,
> > providing efficient management of
> > +	=C2=A0 clock speeds and power consumption.
> > +
> > =C2=A0config COMMON_CLK_MT8192
> > =C2=A0	tristate "Clock driver for MediaTek MT8192"
> > =C2=A0	depends on ARM64 || COMPILE_TEST
> > diff --git a/drivers/clk/mediatek/Makefile
> > b/drivers/clk/mediatek/Makefile
> > index d8736a060dbd..66577ccb9b93 100644
> > --- a/drivers/clk/mediatek/Makefile
> > +++ b/drivers/clk/mediatek/Makefile
> > @@ -123,6 +123,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VDOSYS) +=3D clk-
> > mt8188-vdo0.o clk-mt8188-vdo1.o
> > =C2=A0obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) +=3D clk-mt8188-venc.o
> > =C2=A0obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) +=3D clk-mt8188-vpp0.o clk=
-
> > mt8188-vpp1.o
> > =C2=A0obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) +=3D clk-mt8188-wpe.o
> > +obj-$(CONFIG_COMMON_CLK_MT8189) +=3D clk-mt8189-apmixedsys.o
> > =C2=A0obj-$(CONFIG_COMMON_CLK_MT8192) +=3D clk-mt8192-apmixedsys.o clk-
> > mt8192.o
> > =C2=A0obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) +=3D clk-mt8192-aud.o
> > =C2=A0obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) +=3D clk-mt8192-cam.o
> > diff --git a/drivers/clk/mediatek/clk-mt8189-apmixedsys.c
> > b/drivers/clk/mediatek/clk-mt8189-apmixedsys.c
> > new file mode 100644
> > index 000000000000..a50a8979b849
> > --- /dev/null
> > +++ b/drivers/clk/mediatek/clk-mt8189-apmixedsys.c
> > @@ -0,0 +1,203 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2025-2026 MediaTek Inc.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Qiqi Wang <qiqi.wang@media=
tek.com>
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Irving-CH Lin <irving-ch.l=
in@mediatek.com>
> > + * Copyright (C) 2026 Collabora Ltd.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Louis-Alexis Eyraud
> > <louisalexis.eyraud@collabora.com>
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "clk-fhctl.h"
> > +#include "clk-mtk.h"
> > +#include "clk-pll.h"
> > +
> > +#include <dt-bindings/clock/mediatek,mt8189-clk.h>
> > +
> > +#define MT8189_PLL_FMAX		(3800UL * MHZ)
> > +#define MT8189_PLL_FMIN		(1500UL * MHZ)
> > +#define MT8189_PLLEN_OFS	0x70
> > +#define MT8189_PLLEN_SET_OFS	0x74
> > +#define MT8189_PLLEN_CLR_OFS	0x78
> > +#define MT8189_RSTBAR_OFS	0x80
> > +#define MT8189_RSTBAR_SET_OFS	0x84
> > +#define MT8189_RSTBAR_CLR_OFS	0x88
> > +#define MT8189_INTEGER_BITS	8
> > +
> > +#define PLL_SETCLR(_id, _name, _reg, _pwr_reg,
> > _en_setclr_bit,		\
> > +			_rstb_setclr_bit, _flags, _pd_reg,	\
> > +			_pd_shift, _tuner_reg, _tuner_en_reg,	\
> > +			_tuner_en_bit, _pcw_reg, _pcw_shift,	\
> > +			_pcwbits) {				\
> > +		.id =3D _id,					\
> > +		.name =3D _name,					\
> > +		.en_reg =3D MT8189_PLLEN_OFS,			\
> > +		.en_set_reg =3D MT8189_PLLEN_SET_OFS,		\
> > +		.en_clr_reg =3D MT8189_PLLEN_CLR_OFS,		\
> > +		.reg =3D _reg,					\
> > +		.pwr_reg =3D _pwr_reg,				\
> > +		.pll_en_bit =3D _en_setclr_bit,			\
> > +		.rst_bar_reg =3D MT8189_RSTBAR_OFS,		\
> > +		.rst_bar_set_reg =3D MT8189_RSTBAR_SET_OFS,	\
> > +		.rst_bar_clr_reg =3D MT8189_RSTBAR_CLR_OFS,	\
> > +		.rst_bar_mask =3D BIT(_rstb_setclr_bit),		\
> > +		.flags =3D _flags,				\
> > +		.fmax =3D MT8189_PLL_FMAX,			\
> > +		.fmin =3D MT8189_PLL_FMIN,			\
> > +		.pd_reg =3D _pd_reg,				\
> > +		.pd_shift =3D _pd_shift,				\
> > +		.tuner_reg =3D _tuner_reg,			\
> > +		.tuner_en_reg =3D _tuner_en_reg,			\
> > +		.tuner_en_bit =3D _tuner_en_bit,			\
> > +		.pcw_reg =3D _pcw_reg,				\
> > +		.pcw_shift =3D _pcw_shift,			\
> > +		.pcwbits =3D _pcwbits,				\
> > +		.pcwibits =3D MT8189_INTEGER_BITS,		\
> > +		.ops =3D &mtk_pll_setclr_ops,			\
> > +	}
> > +
> > +static const struct mtk_pll_data apmixed_plls[] =3D {
> > +	PLL_SETCLR(CLK_APMIXED_ARMPLL_LL, "armpll-ll", 0x204,
> > 0x210, 18,
> > +		=C2=A0=C2=A0 0, PLL_AO, 0x208, 24, 0, 0, 0, 0x208, 0, 22),
> > +	PLL_SETCLR(CLK_APMIXED_ARMPLL_BL, "armpll-bl", 0x214,
> > 0x220, 17,
> > +		=C2=A0=C2=A0 0, PLL_AO, 0x218, 24, 0, 0, 0, 0x218, 0, 22),
> > +	PLL_SETCLR(CLK_APMIXED_CCIPLL, "ccipll", 0x224, 0x230, 16,
> > +		=C2=A0=C2=A0 0, PLL_AO, 0x228, 24, 0, 0, 0, 0x228, 0, 22),
> > +	PLL_SETCLR(CLK_APMIXED_MAINPLL, "mainpll", 0x304, 0x310,
> > 15,
> > +		=C2=A0=C2=A0 2, HAVE_RST_BAR | PLL_AO,
> > +		=C2=A0=C2=A0 0x308, 24, 0, 0, 0, 0x308, 0, 22),
> > +	PLL_SETCLR(CLK_APMIXED_UNIVPLL, "univpll", 0x314, 0x320,
> > 14,
> > +		=C2=A0=C2=A0 1, HAVE_RST_BAR, 0x318, 24, 0, 0, 0, 0x318, 0,
> > 22),
> > +	PLL_SETCLR(CLK_APMIXED_MMPLL, "mmpll", 0x324, 0x330, 13,
> > +		=C2=A0=C2=A0 0, HAVE_RST_BAR, 0x328, 24, 0, 0, 0, 0x328, 0,
> > 22),
> > +	PLL_SETCLR(CLK_APMIXED_MFGPLL, "mfgpll", 0x504, 0x510, 7,
> > +		=C2=A0=C2=A0 0, 0, 0x508, 24, 0, 0, 0, 0x508, 0, 22),
> > +	PLL_SETCLR(CLK_APMIXED_APLL1, "apll1", 0x404, 0x414, 11,
> > +		=C2=A0=C2=A0 0, 0, 0x408, 24, 0x040, 0x00c, 0, 0x40c, 0,
> > 32),
> > +	PLL_SETCLR(CLK_APMIXED_APLL2, "apll2", 0x418, 0x428, 10,
> > +		=C2=A0=C2=A0 0, 0, 0x41c, 24, 0x044, 0x00c, 1, 0x420, 0,
> > 32),
> > +	PLL_SETCLR(CLK_APMIXED_EMIPLL, "emipll", 0x334, 0x340, 12,
> > +		=C2=A0=C2=A0 0, PLL_AO, 0x338, 24, 0, 0, 0, 0x338, 0, 22),
> > +	PLL_SETCLR(CLK_APMIXED_APUPLL2, "apupll2", 0x614, 0x620,
> > 2,
> > +		=C2=A0=C2=A0 0, 0, 0x618, 24, 0, 0, 0, 0x618, 0, 22),
> > +	PLL_SETCLR(CLK_APMIXED_APUPLL, "apupll", 0x604, 0x610, 3,
> > +		=C2=A0=C2=A0 0, 0, 0x608, 24, 0, 0, 0, 0x608, 0, 22),
> > +	PLL_SETCLR(CLK_APMIXED_TVDPLL1, "tvdpll1", 0x42c, 0x438,
> > 9,
> > +		=C2=A0=C2=A0 0, 0, 0x430, 24, 0, 0, 0, 0x430, 0, 22),
> > +	PLL_SETCLR(CLK_APMIXED_TVDPLL2, "tvdpll2", 0x43c,=C2=A0 0x448,
> > 8,
> > +		=C2=A0=C2=A0 0, 0, 0x440, 24, 0, 0, 0, 0x440, 0, 22),
> > +	PLL_SETCLR(CLK_APMIXED_ETHPLL, "ethpll", 0x514, 0x520, 6,
> > +		=C2=A0=C2=A0 0, 0, 0x518, 24, 0, 0, 0, 0x518, 0, 22),
> > +	PLL_SETCLR(CLK_APMIXED_MSDCPLL, "msdcpll", 0x524, 0x530,
> > 5,
> > +		=C2=A0=C2=A0 0, 0, 0x528, 24, 0, 0, 0, 0x528, 0, 22),
> > +	PLL_SETCLR(CLK_APMIXED_UFSPLL, "ufspll", 0x534, 0x540, 4,
> > +		=C2=A0=C2=A0 0, 0, 0x538, 24, 0, 0, 0, 0x538, 0, 22),
> > +};
> > +
> > +#define FH(_pllid, _fhid, _offset) {				\
> > +		.data =3D {					\
> > +			.pll_id =3D _pllid,			\
> > +			.fh_id =3D
> > _fhid,				\
> > +			.fh_ver =3D FHCTL_PLLFH_V2,		\
> > +			.fhx_offset =3D _offset,			\
> > +			.dds_mask =3D GENMASK(21, 0),		\
> > +			.slope0_value =3D 0x6003c97,		\
> > +			.slope1_value =3D 0x6003c97,		\
> > +			.sfstrx_en =3D BIT(2),			\
> > +			.frddsx_en =3D BIT(1),			\
> > +			.fhctlx_en =3D BIT(0),			\
> > +			.tgl_org =3D BIT(31),			\
> > +			.dvfs_tri =3D BIT(31),			\
> > +			.pcwchg =3D BIT(31),			\
> > +			.dt_val =3D 0x0,				\
> > +			.df_val =3D 0x9,				\
> > +			.updnlmt_shft =3D 16,			\
> > +			.msk_frddsx_dys =3D GENMASK(23, 20),	\
> > +			.msk_frddsx_dts =3D GENMASK(19, 16),	\
> > +			.ops =3D &mtk_pllfh_setclr_ops,		\
> > +		},						\
> > +	}
> > +
> > +static struct mtk_pllfh_data pllfhs[] =3D {
> > +	FH(CLK_APMIXED_ARMPLL_LL, 0, 0x003C),
> > +	FH(CLK_APMIXED_ARMPLL_BL, 1, 0x0050),
> > +	FH(CLK_APMIXED_CCIPLL, 2, 0x0064),
> > +	FH(CLK_APMIXED_MAINPLL, 3, 0x0078),
> > +	FH(CLK_APMIXED_MMPLL, 4, 0x008C),
> > +	FH(CLK_APMIXED_MFGPLL, 5, 0x00A0),
> > +	FH(CLK_APMIXED_EMIPLL, 6, 0x00B4),
> > +	FH(CLK_APMIXED_TVDPLL1, 7, 0x00C8),
> > +	FH(CLK_APMIXED_TVDPLL2, 8, 0x00DC),
> > +	FH(CLK_APMIXED_MSDCPLL, 9, 0x00F0),
> > +	FH(CLK_APMIXED_UFSPLL, 10, 0x0104),
> > +	FH(CLK_APMIXED_APUPLL, 11, 0x0118),
> > +	FH(CLK_APMIXED_APUPLL2, 12, 0x012c),
> > +};
> > +
> > +static const struct of_device_id of_match_clk_mt8189_apmixed[] =3D {
> > +	{ .compatible =3D "mediatek,mt8189-apmixedsys" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_apmixed);
> > +
> > +static int clk_mt8189_apmixed_probe(struct platform_device *pdev)
> > +{
> > +	const u8 *fhctl_node =3D "mediatek,mt8189-fhctl";
> > +	struct device_node *node =3D pdev->dev.of_node;
> > +	struct clk_hw_onecell_data *clk_data;
> > +	int r;
> > +
> > +	clk_data =3D mtk_alloc_clk_data(ARRAY_SIZE(apmixed_plls));
> > +	if (!clk_data)
> > +		return -ENOMEM;
> > +
> > +	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
>=20
> So I know this is how the existing drivers are written. This calls
> of_iomap(), and the iounmap is called by mtk_clk_unregister_pllfhs().
> I usually like to see things in pairs to make it easier to review
> where there's some register, and an unregister with the same name.
>=20
> Could the fhctl_parse_dt() call be moved into
> mtk_clk_register_pllfhs() ?
>=20
Thanks for the v5 patches review first.

It is indeed a good idea to move this function in
mtk_clk_register_pllfhs.=C2=A0The needed modifications are rather small
(only 5 calls in the existing mediatek clk drivers) and would make this
function private to clk-pllfh.c as well. It is also complementary to
the other cleanup series, that is reworking the probe functions of
apmixedsys drivers with pllfh support ([1]).

I'll add a new patch in v6 along the other fixes, and adapt this one.

[1]:
https://lore.kernel.org/linux-mediatek/20260803141659.559129-13-akkun11.ope=
n@gmail.com/

> Additionally fhctl_parse_dt() sets some state variables that are
> never
> cleared in the unregister:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 pllfh->state.fh_enable =3D 1;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 pllfh->state.ssc_rate =3D ssc_rate;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 pllfh->state.base =3D base;
>=20
> Just a quick glance though I think this is fine.
>=20
They are indeed never cleared.

Since they are stored in a static variable, it would be best to
clean them anyway, for instance in mtk_clk_cleanup_pllfhs function,
that used in both unregister and register (in error path) functions.

I'll also add a new patch in for that.

Regards,
Louis-Alexis

> Brian
>=20
