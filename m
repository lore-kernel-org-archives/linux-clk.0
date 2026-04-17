Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A993C36BCCA;
	Fri, 17 Apr 2026 07:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411983; cv=none; b=Oxkzg5GIUwNlmTca3+OWpcHyit/VWA500jK5w+K7+Q8B0B7SyDIVdUywocZE3PkDZlQwfIvYAD/OBWcoOmuXeTUvxthN9fWzOdZNwo3CjEKNsbnUq/JQEZHBV9CQDqAaK2h3ttuTYQcAC3q5fS7TujeFDb9ICRlzS9obFxb1YtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411983; c=relaxed/simple;
	bh=SuDZB1k+Ya+urLN7UyfPUuifosdbXSlCDXPeBP/qPVo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jOtgmQQlU2+l9uggCBAH5QcioTCziou7Orx3ECHwq7dQT3dYLD9ohzrRgtzxeiOZMiWJb2GCu5DANtKs7otvH2SsGs6JQXAb9OMGDZthjKEGhuvhb67ypj7POTjyTzL8IDBAv50xOSD6WYD2A/DhLDSCeIb3M+cCGSigtU86dQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=MMIifCz8; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="MMIifCz8"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63H7jnV633464891, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1776411949; bh=BYbv53LE8/LhMGLZZozxK2INqCGiYtH4XKtdiuLZJPQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=MMIifCz81wM57VwrsvswbuK0z/4MdMW/mw7DNEp9T+L5dk38xISJS5hD0CL1aievc
	 8B94pZDjoKLmi4nmG0xGJGA9izN5MFwSeTAd7xips7pS/fO+Eadf4FCF2D0cHnV/hK
	 NaUfAvZWTmR0w5gv4/d2T6oLP4o5hdm+WzRbvBXh8pBKm0v+hnQDHpZ/Sk5IcJLwmi
	 /uCL+Bj9i6yH98f0RYYrRo5kgFrF7ZiZvakzznHwzQjK8tZFl2Hr18vhQmtvky/ifT
	 dWYq2VeDlOViRvN1u2cxniZ0JdKfwhNVDTJ0P8sC1bmr0prn8Nnnp3Ru1xMvbI1li8
	 i5O9vgs08w9kQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63H7jnV633464891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Apr 2026 15:45:49 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 17 Apr 2026 15:45:49 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 17 Apr 2026 15:45:48 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 17 Apr 2026 15:45:48 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <bmasney@redhat.com>
CC: <afaerber@suse.com>, <conor+dt@kernel.org>, <cy.huang@realtek.com>,
        <cylee12@realtek.com>, <devicetree@vger.kernel.org>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>,
        <jyanchou@realtek.com>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-realtek-soc@lists.infradead.org>, <mturquette@baylibre.com>,
        <p.zabel@pengutronix.de>, <robh@kernel.org>, <sboyd@kernel.org>,
        <stanley_chang@realtek.com>
Subject: Re: [PATCH v6 08/10] clk: realtek: Add RTD1625-CRT clock controller driver
Date: Fri, 17 Apr 2026 15:45:48 +0800
Message-ID: <20260417074548.1605550-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <ac_bsflBlSGf9M-h@redhat.com>
References: <ac_bsflBlSGf9M-h@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi Brian,

> Hi Yu-Chun,
> 

(snip)

> > +
> > +static const struct reg_sequence pll_acpu_seq_power_off[] = {
> > +	{RTD1625_REG_PLL_ACPU2,         0x4},
> > +};
> > +
> > +static const struct reg_sequence pll_acpu_seq_pre_set_freq[] = {
> > +	{RTD1625_REG_PLL_SSC_DIG_ACPU0, 0x4},
> > +};
> > +
> > +static const struct reg_sequence pll_acpu_seq_post_set_freq[] = {
> > +	{RTD1625_REG_PLL_SSC_DIG_ACPU0, 0x5},
> > +};
> > +
> > +static struct clk_pll pll_acpu = {
>
> static const?
>

The clock object should not be declared as const.

> > +	.clkr.hw.init = CLK_HW_INIT("pll_acpu", "osc27m", &rtk_clk_pll_ops, CLK_GET_RATE_NOCACHE),
> > +	.seq_power_on          = pll_acpu_seq_power_on,
> > +	.num_seq_power_on      = ARRAY_SIZE(pll_acpu_seq_power_on),
> > +	.seq_power_off         = pll_acpu_seq_power_off,
> > +	.num_seq_power_off     = ARRAY_SIZE(pll_acpu_seq_power_off),
> > +	.seq_pre_set_freq      = pll_acpu_seq_pre_set_freq,
> > +	.num_seq_pre_set_freq  = ARRAY_SIZE(pll_acpu_seq_pre_set_freq),
> > +	.seq_post_set_freq     = pll_acpu_seq_post_set_freq,
> > +	.num_seq_post_set_freq = ARRAY_SIZE(pll_acpu_seq_post_set_freq),
> > +	.freq_reg              = RTD1625_REG_PLL_SSC_DIG_ACPU1,
> > +	.freq_tbl              = acpu_tbl,
> > +	.freq_mask             = FREQ_NF_MASK,
> > +	.freq_ready_reg        = RTD1625_REG_PLL_SSC_DIG_ACPU_DBG2,
> > +	.freq_ready_mask       = BIT(20),
> > +	.freq_ready_val        = BIT(20),
> > +	.power_reg             = RTD1625_REG_PLL_ACPU2,
> > +	.power_mask            = 0x7,
> > +	.power_val_on          = 0x3,
> > +};

(snip)

> > +
> > +static const struct reg_sequence pll_ve1_seq_post_set_freq[] = {
> > +	{RTD1625_REG_PLL_SSC_DIG_VE1_0, 0x5},
> > +};
> > +
> > +static struct clk_pll pll_ve1 = {
> 
> Same here about static const, plus some others below?
>

No. The clock object cannot be const.

(snip)

> > +static const struct of_device_id rtd1625_crt_match[] = {
> > +	{.compatible = "realtek,rtd1625-crt-clk", .data = &rtd1625_crt_desc,},
> > +	{/* sentinel */}
>
> Add a space around the comment like so:
>
> { /* sentinel */ }
>

Ack.

>
> > +};
> > +
> > +static struct platform_driver rtd1625_crt_driver = {
> > +	.probe = rtd1625_crt_probe,
> > +	.driver = {
> > +		.name = "rtk-rtd1625-crt-clk",
> > +		.of_match_table = rtd1625_crt_match,
> > +	},
> > +};
> > +
> > +static int __init rtd1625_crt_init(void)
> > +{
> > +	return platform_driver_register(&rtd1625_crt_driver);
> > +}
> > +subsys_initcall(rtd1625_crt_init);
> > +
> > +MODULE_DESCRIPTION("Reatek RTD1625 CRT Controller Driver");
>
>s/Reatek/Realtex/
>

Will fix it.

> > +MODULE_AUTHOR("Cheng-Yu Lee <cylee12@realtek.com>");
> > +MODULE_LICENSE("GPL");
> > +MODULE_IMPORT_NS("REALTEK_CLK");
> > diff --git a/drivers/reset/realtek/Kconfig b/drivers/reset/realtek/Kconfig
> > index 99a14d355803..a44c7834191c 100644
> > --- a/drivers/reset/realtek/Kconfig
> > +++ b/drivers/reset/realtek/Kconfig
> > @@ -1,3 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  config RESET_RTK_COMMON
> >  	bool
> > +	select AUXILIARY_BUS
> > +	default COMMON_CLK_RTD1625
> > diff --git a/drivers/reset/realtek/Makefile b/drivers/reset/realtek/Makefile
> > index b59a3f7f2453..8ca1fa939f10 100644
> > --- a/drivers/reset/realtek/Makefile
> > +++ b/drivers/reset/realtek/Makefile
> > @@ -1,2 +1,2 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > -obj-$(CONFIG_RESET_RTK_COMMON) += common.o
> > +obj-$(CONFIG_RESET_RTK_COMMON) += common.o reset-rtd1625-crt.o
>
>CONFIG_RESET_RTK_COMMON is supposed to be common, right? If so, the
> SoC-specific driver shouldn't be included here.
>

This Makefile will change to

obj-$(CONFIG_RESET_RTK_COMMON) += common.o
obj-$(CONFIG_RESET_RTD1625) += reset-rtd1625-crt.o

> > diff --git a/drivers/reset/realtek/reset-rtd1625-crt.c b/drivers/reset/realtek/reset-rtd1625-crt.c
> > new file mode 100644
> > index 000000000000..ebb15bb68885
> > --- /dev/null
> > +++ b/drivers/reset/realtek/reset-rtd1625-crt.c
> > @@ -0,0 +1,186 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2026 Realtek Semiconductor Corporation
> > + */
> > +
> > +#include <dt-bindings/reset/realtek,rtd1625.h>
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/device.h>
> > +#include <linux/errno.h>
> > +#include <linux/slab.h>
> > +#include "common.h"
> > +
> > +#define RTD1625_CRT_RSTN_MAX	123
> > +
> > +static struct rtk_reset_desc rtd1625_crt_reset_descs[] = {
> > +	/* Bank 0: offset 0x0 */
> > +	[RTD1625_CRT_RSTN_MISC]         = { .ofs = 0x0, .bit = 0,  .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_DIP]          = { .ofs = 0x0, .bit = 2,  .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_GSPI]         = { .ofs = 0x0, .bit = 4,  .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_SDS]          = { .ofs = 0x0, .bit = 6,  .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_SDS_REG]      = { .ofs = 0x0, .bit = 8,  .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_SDS_PHY]      = { .ofs = 0x0, .bit = 10, .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_GPU2D]        = { .ofs = 0x0, .bit = 12, .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_DC_PHY]       = { .ofs = 0x0, .bit = 22, .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_DCPHY_CRT]    = { .ofs = 0x0, .bit = 24, .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_LSADC]        = { .ofs = 0x0, .bit = 26, .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_SE]           = { .ofs = 0x0, .bit = 28, .write_en = 1 },
> > +	[RTD1625_CRT_RSTN_DLA]          = { .ofs = 0x0, .bit = 30, .write_en = 1 },
>
> Sashiko reports:
> https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com
>
>    Can this cause undefined behavior during reset mask computation?
>    
>    Several reset array entries set .bit = 30 and .write_en = 1. In
>    rtk_reset_assert() and rtk_reset_deassert(), if the bitmask is computed as
>    0x3 << desc->bit, 0x3 is a signed 32-bit integer literal. Left-shifting it by
>    30 results in 0xC0000000, which exceeds the maximum positive value for a
>    signed 32-bit integer.
>
>    Modifying the sign bit via left-shift on a signed type invokes undefined
>    behavior in C. Would an unsigned literal (e.g., 0x3U << desc->bit) be needed
>    to safely construct the mask?

Agreed, Will make it 0x3U.

(snip)

> > +
> > +static int rtd1625_crt_reset_probe(struct auxiliary_device *adev,
> > +				   const struct auxiliary_device_id *id)
> > +{
> > +	struct device *dev = &adev->dev;
> > +	struct rtk_reset_data *data;
> > +
> > +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	data->descs           = rtd1625_crt_reset_descs;
> > +	data->rcdev.nr_resets = RTD1625_CRT_RSTN_MAX;
> > +	return rtk_reset_controller_add(dev, data);
>
> Sashiko reports:
> https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com
>
>    Will the reset controller driver unconditionally fail to probe with -ENODEV
>    due to an incompatible regmap acquisition method?
>
>    The rtk_reset_controller_add() helper attempts to retrieve the shared regmap
>    from the parent clock device using dev_get_regmap(parent, NULL). However, the
>    parent clock driver (rtk_clk_probe()) acquires its regmap via
>    device_node_to_regmap().
>
>    This syscon helper creates the regmap but does not associate it with the
>    parent struct device via devres. Because the regmap is absent from the
>    parent's devres list, dev_get_regmap() will always return NULL, causing the
>    reset driver probe to fail unconditionally and leaving dependent peripherals
>    without reset control.
>
> Brian
>

Thanks for identifying this issue. I've fixed the regmap passing mechanism:

Changes:
1. 'rtk_reset_controller_register()' in clk/realtek/common.c passes the
regmap as platform data via 'devm_auxiliary_device_create()'
2. 'rtk_reset_controller_add()' in reset/realtek/common.c retrieves it
using 'dev_get_platdata()' instead of 'dev_get_regmap()'

This ensures the reset controller can access the shared regmap regardless
of how the parent clock driver acquired it

Best Regards,
Yu-Chun
