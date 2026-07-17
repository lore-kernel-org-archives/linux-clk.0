Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022114.outbound.protection.outlook.com [40.107.75.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523A43C4552;
	Fri, 17 Jul 2026 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784281655; cv=fail; b=tCda3CA5fWMykod+ztWKBGv4hHDJUI+Esz42mnnxuSiub4urjwlOF0ux/TAl4PAgr5SrrOO/QBKzGvQSkc07mQTgoHk+P2lRVE0SaXbyIYWjBEIrpencufJ92Ai/f7oWbRpMuJX16whLwCWOtveHFN3RmmC5csY3KIR7kG+IpYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784281655; c=relaxed/simple;
	bh=0eIznBK9jFt2pLd4eU3+k5JS4wpt5MZV4XTbBKjTt+Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=guBHoBfoFZxfXiAoBQZGJ0QwAy6tp8OUTwdp84D49Iv8ziFk/v5XFA6ZoLVMHFIcZhiYwmpH5qev1tDbWW5Uzs5eNz6Nsw5BlsTuPDyMoxDBHsua7CXKF3MMg86i3cD7DGHc+jOLApnjJF0LMywZR+Xbv+8L0M1ZCcOPqazy2PY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZ52HsNO72XDUqijRb1sld1R2q1Qm94UMrpoQxsKz01pWcWCzBq+CV4kXvY7IdcOTePoyAXC/YvNnj5qes73W7Lc0RxAOY5hoD9KZHpe1Mz+f5fq+XVdnpHKrxPIodwFjrmj/3YSBhGY5Cv15auAXnLaYnCu7b3PVwqFmn7Au2XNm6ONKOFTuKMY0yaS0nZ8u0w4lch36kdFVkCtndTVXLNx5MNO0WYKVkii9/g1C2yG1mKfBz/sy9ICah65zSOedwW8JbfBfBwGVuxtR8yLhhIJLGCMJBb9WwbhbnJaywho0SaCtuMYRhF5z23GVl56gN/IYsvBsZ5j9ikLUd2YAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzSZ7MJUSzER/5jgryRueirtzjoPf1Y1jUn3cd3ju4w=;
 b=NBkkylGN7mtmyT65V7830KR0x5kJn2WMJvPSq4Hg1Lx0FPj0Zt5cWQLRuW8cMljGiVJfTok2aQ+slCLLIlNDtgaOtkTaCFz3hSMyirFnrcJsqrwRlf84lVBwhO1rgjcZP2KnGQxYI9OoPkyGEfOkW+F5acKpl+3QmZJm6UL8mhGUfH8PFSt2jqo2uVyRoEWtCjQcMhmifyolvagLa8yq6z/qQkSqRyihZ48qmM1ExmnyCNW/nuF9UEL9XzgVUHkGvnnxV+xS9077jlTkqArpcJmV5vC1eJ+zD3ok9+oAmbFkPdyq0NY+EXmyfsUcu6k90raL7HgbVs5qnlAoYwjXig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by SETPR06MB9118.apcprd06.prod.outlook.com (2603:1096:101:315::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Fri, 17 Jul
 2026 09:47:28 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 09:47:28 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Brian Masney <bmasney@redhat.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v9 2/4] clk: cix: add sky1 audss clock controller
Thread-Topic: [PATCH v9 2/4] clk: cix: add sky1 audss clock controller
Thread-Index: AQHdD5qxR8VCrIPVF02eRBIF0y1VMrZw3lWAgACePwA=
Date: Fri, 17 Jul 2026 09:47:28 +0000
Message-ID:
 <SEYPR06MB6226BD151ABBB192AEC53BA482C62@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260709120125.3997078-1-joakim.zhang@cixtech.com>
 <20260709120125.3997078-3-joakim.zhang@cixtech.com>
 <allvw2ZiiyX5SGIk@redhat.com>
In-Reply-To: <allvw2ZiiyX5SGIk@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|SETPR06MB9118:EE_
x-ms-office365-filtering-correlation-id: 8df0aae6-f509-4e42-3d5a-08dee3e86a09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|5023799004|56012099006|4143699003|6133799003|22082099003|18002099003|10067099003|38070700021;
x-microsoft-antispam-message-info:
 ZPAdRieETxeeZZCt472g5J2vRpOvpWUTk+rfA43sSxo2zCV95qghND9glymg6ot1dwiYd/UuKSyzck3TabTjSOSJSmwsvg+Vr6EeiqtihZQpLmROR6vnejcgzHWKw8eV5Q6V68xywUxp9Mm6SqzT3bSR4GskNGbZ42S5LODotWus4yrOKLnBdViSUgDAoFiGLwLTdoDVcUYyTyFdpb0krL8VxowPlrFg1P6BjWZFIdjEDpJeGqxEeo5bH1VGSHfbEPnO0hkTLgKD9T4MlPQJjdaTsyDD3OUoT5MYEq9dAU86aQhilS7xskW92SLreojbYwzhcFkAtRytT+5GVidcH/+pQrv6TKzbeUXY/OJhB0H6PYaM4MIIaIDh/668YuqU411w0rwIaGTUaHBOW4gRW3CtqdyuMZCpJzvmQ9KK/jCaAQRlyvv34Qqe5ArVvpdr0RAl1ssLgVIMq+65CGCW5G6KQx51gIUeu4q3CIp7cp0lMdd+l0DnS3Ch1tGR1sCfu/QycRZ7lUZjMv749vmgdTD33CBf7Wic+8XzEU1M+8W+DJSoc5b8jzwPLrz63jU902VteJ2Az1TOr5xkBs5BtRhmobi72lw9UeKkAr4e62Gxf9VIwjv7POt25Zct5SLChKeb38qgv5h7fAKP5k9MtsEabKy0yEAxEozYGbRO9uwun/5gTT+WNtmffOIRUA7DzQhEb7Rfquir2VfamKsbm4Qgiv+nDzVKzU7zfCG8eI0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(5023799004)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003)(10067099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5PnB4gShOCqfaLKCo7PKJMNc4C+91MJumL6mIH3QOFDYuSse/uZgTfZ954eE?=
 =?us-ascii?Q?4XHj/hSTazsSILMKBeNBfr+8hRfeiWR9kZ3wrwwibmTyr1DZQ5fXP3oNO6oW?=
 =?us-ascii?Q?10mW36J9BCSNzx3z0J7sZbDUXxUwGJsEiplGAyypLnrzYQ+p1t2uwpogbgFe?=
 =?us-ascii?Q?plZUWfqYPb7RMuqeSPHQULUrkERAbnY9PwJEBv7Cu2N+H2cPpv+7ptpLhxQb?=
 =?us-ascii?Q?InGCCiHeFstmIZQpAO4BmToypDfpyL+mI3TZJdpqiArc/snCyCLpFNyERG65?=
 =?us-ascii?Q?fKwRNHlwXB41KmKzhxiMIff73DfupROrbYZv9WPXGFpddEdA+gGW8uYcXVte?=
 =?us-ascii?Q?aZe0CYKDgpYkXbTbIpYd0swqTyOVU7/qfWSJTCcPGlSSmRqMwClqpvRBCqXt?=
 =?us-ascii?Q?Zt1PTOBsaR/VzzEpI4CMFYhB6L8QUOROIBuf5FErOORF64g1W/cNKULgjawg?=
 =?us-ascii?Q?czKt0JhRjS8jQTvU9j9ts89gR3ZmYE1c0yY32q8uCYMYxRxPh6ldX51fgwll?=
 =?us-ascii?Q?dFzykVxoOVsLbd0kCdKlwF97Bp5UO4dHRWIKzE1kvJWZ2uxh8CMhxNCv1JZl?=
 =?us-ascii?Q?fs4HdH5G5yYqAqZo8Fao18728wqurVanLZSv0AjkGU8BOqlHFzcYt76eE7jm?=
 =?us-ascii?Q?CrmetGc01Y4AB7+Vz0HT+FbDssbcH4Le174CyVDOkG7oz3KruWa2y7STS58x?=
 =?us-ascii?Q?ojEe+0PneESBWrBjVOPIYINoy6oMZE9vcxlgwYm4JbHXqoc7uQISJIpjs4xX?=
 =?us-ascii?Q?5+E38awZv9w43q+WtwcJGBP/ZAbUcTQpSqx21xEjuS8Fw8lh0QyUIYkCy/dl?=
 =?us-ascii?Q?fI05zMQMN59WaIW7vPPNjzuno3V8mhzzCAFlWAIyjEo4DygLqSTE7qjB70vm?=
 =?us-ascii?Q?2OC2kL2PObJQ7+MOH7NB3YItMW8uH/pLZtIivJNb17VvP7Q0awmTa/1ss595?=
 =?us-ascii?Q?GT2zWrbSCPFaa3x9ke4U/QJs97VSlG+iFUFpPMhH3XRnc9PDka7G2Vmd0qCs?=
 =?us-ascii?Q?r740L9B++8jUfDfSAVOMXd+0NK9rsKTekNWpHVPg0YZVwRvDSKXjItoIjhcx?=
 =?us-ascii?Q?k5H+WFGIDZB8UT/oZric5+qeqqubzrOsifBnI2fOfeAug/lIjkHCezSJyuK8?=
 =?us-ascii?Q?NqtPlM7lyXTGntuJi7+XrFw0nv6YQZvNoEN0xIquVBCUx66/0R1RIvLo0Q1v?=
 =?us-ascii?Q?sXjRbcVLIUiVnmRnwpzxeqWsf8f3h7l9CC26cdPdabggNla82/YcPBZqbebh?=
 =?us-ascii?Q?s8MCJcKDGlE+En2Yvz+VPYLKT1Nb7ljvbw4lbEglWne6CRQq9XyQ0K5s8QQh?=
 =?us-ascii?Q?WT9MpgvItj9PgjHhBoqGnChhag4WQL2s8N9PMDVDjyaJYouJqSH6CjpaQxwN?=
 =?us-ascii?Q?oJRA9AfpSRWk9D3sd5Nb2pbW+ByYrv9wQtsm2yiYs9sNxk6J9/hY6SC3soJD?=
 =?us-ascii?Q?Nz7BYNHHIZUqxs0avHdAQpVUy3pLgFcMZrXI+0YTrMX5ZNPxOps67Az+OFd3?=
 =?us-ascii?Q?MPXwCKMhGWNFl9WzbO+SV+tLHc0BYobPQSlXL8aaPmh/86r+6v358Pwp/bld?=
 =?us-ascii?Q?ppGxg1ANgK1LOh2p3vQgF35jzWM8W3QYQfz4TDPs+n8zRulIQlx0ORr2r4kw?=
 =?us-ascii?Q?eDjp8WtfRJJZbHFHRVxqLZlPGDuUPC99rDcYWlowowrBzzPpsef59kGhVdT1?=
 =?us-ascii?Q?gAABGmtyCq9VQtcNWh6soXgjy65YRx8zeTLXpb0e4kByNvglEFNMGcN8nd4w?=
 =?us-ascii?Q?Drm2Ci05Cw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6226.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df0aae6-f509-4e42-3d5a-08dee3e86a09
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 09:47:28.3584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v0u/0tEascUWBfvpzS4thPyUtN2zX3UUrlvN4PIti9zdEqVn5rrrRdMYTZSjP8pN9uBUFhp5vJkD4N6e5YWrAo0tB5iauJoxWmHXmcNZ2/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SETPR06MB9118


Hello Brian,

Thanks for your kindly review.

> -----Original Message-----
> From: Brian Masney <bmasney@redhat.com>
> Sent: Friday, July 17, 2026 7:57 AM
> To: Joakim Zhang <joakim.zhang@cixtech.com>
> Cc: mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; p.zabel@pengutronix.de; cix-kern=
el-
> upstream <cix-kernel-upstream@cixtech.com>; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v9 2/4] clk: cix: add sky1 audss clock controller

[...]
> > diff --git a/drivers/clk/cix/clk-sky1-audss.c
> > b/drivers/clk/cix/clk-sky1-audss.c
> > new file mode 100644
> > index 000000000000..5f9133232eb1
> > --- /dev/null
> > +++ b/drivers/clk/cix/clk-sky1-audss.c
> > @@ -0,0 +1,1205 @@
> > +// SPDX-License-Identifier: GPL-2.0-only // Copyright 2026 Cix
> > +Technology Group Co., Ltd.
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
>=20
> You can drop this include since you are only using of_device_id. You will=
 get it
> via two different chains:
>=20
> <linux/platform_device.h>
>         -> <linux/device.h>
>         -> <linux/device/driver.h>
>         -> <linux/device-id/of.h>
>=20
>  linux/clk-provider.h -> linux/of.h -> linux/device-id/of.h
> (Pasted from a review on a different series a little bit ago.)
Fine, will drop of_device.h.


[...]
> > +/* register sky1 audio subsystem clocks */ static int
> > +sky1_audss_clk_probe(struct platform_device *pdev) {
> > +     const struct sky1_audss_clks_devtype_data *devtype_data;
> > +     struct sky1_audss_clks_priv *priv;
> > +     struct device *dev =3D &pdev->dev;
> > +     struct clk_hw **clk_table;
> > +     void __iomem *base;
> > +     int i, ret;
> > +
> > +     devtype_data =3D device_get_match_data(dev);
> > +     if (!devtype_data)
> > +             return -ENODEV;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     spin_lock_init(&priv->lock);
> > +
> > +     priv->clk_data =3D devm_kzalloc(dev,
> > +                                   struct_size(priv->clk_data, hws,
> SKY1_AUDSS_NUM_CLKS),
> > +                                   GFP_KERNEL);
> > +     if (!priv->clk_data)
> > +             return -ENOMEM;
> > +
> > +     priv->clk_data->num =3D SKY1_AUDSS_NUM_CLKS;
> > +     clk_table =3D priv->clk_data->hws;
> > +
> > +     base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(base))
> > +             return PTR_ERR(base);
> > +
> > +     priv->regmap_cru =3D devm_regmap_init_mmio(dev, base,
> &sky1_audss_regmap_config);
> > +     if (IS_ERR(priv->regmap_cru))
> > +             return dev_err_probe(dev, PTR_ERR(priv->regmap_cru),
> > +                                  "failed to initialize regmap\n");
> > +
> > +     priv->dev =3D dev;
> > +     priv->devtype_data =3D devtype_data;
> > +
> > +     priv->rst_noc =3D devm_reset_control_get_exclusive(dev, NULL);
> > +     if (IS_ERR(priv->rst_noc))
> > +             return dev_err_probe(dev, PTR_ERR(priv->rst_noc),
> > +                                  "failed to get audss noc reset");
> > +
> > +     reset_control_assert(priv->rst_noc);
> > +
> > +     reset_control_deassert(priv->rst_noc);
> > +
> > +     pm_runtime_get_noresume(dev);
> > +     pm_runtime_set_active(dev);
> > +     pm_runtime_enable(dev);
> > +
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     ret =3D sky1_audss_clks_get(priv);
> > +     if (ret)
> > +             goto err_pm;
> > +
> > +     ret =3D sky1_audss_clks_enable(priv);
> > +     if (ret) {
> > +             dev_err(dev, "failed to enable clocks\n");
> > +             goto err_pm;
> > +     }
> > +
> > +     ret =3D sky1_audss_clks_set_rate(priv);
> > +     if (ret) {
> > +             dev_err(dev, "failed to set clocks rate\n");
> > +             goto fail_clks_set;
>=20
> So starting here... Is there a double put below? I'll flag it below.
>=20
> > +     }
> > +
> > +     /* audio_clk4 clock fixed divider */
> > +     clk_table[CLK_AUD_CLK4_DIV2] =3D
> > +             devm_clk_hw_register_fixed_factor(dev,
> > +                                               "audio_clk4_div2",
> > +                                               "audio_clk4",
> > +                                               0,
> > +                                               1, 2);
> > +     if (IS_ERR(clk_table[CLK_AUD_CLK4_DIV2])) {
> > +             ret =3D PTR_ERR(clk_table[CLK_AUD_CLK4_DIV2]);
> > +             dev_err(dev, "failed to register clock %d, ret:%d\n",
> CLK_AUD_CLK4_DIV2, ret);
> > +             goto fail_fixed_clk;
> > +     }
> > +
> > +     clk_table[CLK_AUD_CLK4_DIV4] =3D
> > +             devm_clk_hw_register_fixed_factor(dev,
> > +                                               "audio_clk4_div4",
> > +                                               "audio_clk4",
> > +                                               0,
> > +                                               1, 4);
> > +     if (IS_ERR(clk_table[CLK_AUD_CLK4_DIV4])) {
> > +             ret =3D PTR_ERR(clk_table[CLK_AUD_CLK4_DIV4]);
> > +             dev_err(dev, "failed to register clock %d, ret:%d\n",
> CLK_AUD_CLK4_DIV4, ret);
> > +             goto fail_fixed_clk;
> > +     }
> > +
> > +     /* audio_clk5 clock fixed divider */
> > +     clk_table[CLK_AUD_CLK5_DIV2] =3D
> > +             devm_clk_hw_register_fixed_factor(dev,
> > +                                               "audio_clk5_div2",
> > +                                               "audio_clk5",
> > +                                               0,
> > +                                               1, 2);
> > +     if (IS_ERR(clk_table[CLK_AUD_CLK5_DIV2])) {
> > +             ret =3D PTR_ERR(clk_table[CLK_AUD_CLK5_DIV2]);
> > +             dev_err(dev, "failed to register clock %d, ret:%d\n",
> CLK_AUD_CLK5_DIV2, ret);
> > +             goto fail_fixed_clk;
> > +     }
> > +
> > +     for (i =3D 0; i < devtype_data->clk_cfg_size; i++) {
> > +             clk_table[devtype_data->clk_cfg[i].id] =3D
> > +                     sky1_audss_clk_register(dev,
> > +                                             devtype_data->clk_cfg[i].=
name,
> > +                                             devtype_data->clk_cfg[i].=
parent_names,
> > +                                             devtype_data->clk_cfg[i].=
num_parents,
> > +                                             priv->regmap_cru,
> > +                                             devtype_data->clk_cfg[i].=
mux_table,
> > +                                             devtype_data->clk_cfg[i].=
mux_cfg,
> > +                                             devtype_data->clk_cfg[i].=
div_cfg,
> > +                                             devtype_data->clk_cfg[i].=
gate_cfg,
> > +                                             devtype_data->clk_cfg[i].=
flags,
> > +                                             &priv->lock);
> > +             if (IS_ERR(clk_table[devtype_data->clk_cfg[i].id])) {
> > +                     ret =3D PTR_ERR(clk_table[devtype_data->clk_cfg[i=
].id]);
> > +                     dev_err(dev, "failed to register clock %d, ret:%d=
\n",
> > +                             devtype_data->clk_cfg[i].id, ret);
> > +                     goto fail_fixed_clk;
> > +             }
> > +     }
> > +
> > +     ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, p=
riv-
> >clk_data);
> > +     if (ret) {
> > +             dev_err(dev, "failed to add clock provider: %d\n", ret);
> > +             goto fail_register;
> > +     }
> > +
> > +     ret =3D sky1_audss_reset_controller_register(dev);
> > +     if (ret)
> > +             goto fail_register;
> > +
> > +     pm_runtime_put_sync(dev);
> > +
> > +     return 0;
> > +
> > +fail_register:
> > +fail_fixed_clk:
> > +fail_clks_set:
>=20
> Collapse these 3 labels into 1.
>=20
> > +     pm_runtime_put_sync(dev);
> > +err_pm:
> > +     pm_runtime_put_noidle(dev);
>=20
> So above where I flagged the 'goto fail_clks_set', is this a double put?
On the double-put concern: fail_* paths run put_sync() (usage 1->0) then fa=
ll through to put_noidle(). put_noidle() usesatomic_add_unless(..., -1, 0),=
 so it is a no-op when the counter is already 0. But it still seems rather =
strange, I will refine the sequence to avoid it.


> > +     pm_runtime_disable(dev);
> > +     return ret;
> > +}
> > +
> > +static void sky1_audss_clk_remove(struct platform_device *pdev) {
> > +     struct device *dev =3D &pdev->dev;
> > +
> > +     if (!pm_runtime_status_suspended(dev))
> > +             pm_runtime_force_suspend(dev);
> > +
> > +     pm_runtime_disable(dev);
>=20
> I am fairly certain that remove() is called before the devm handlers are
> invoked. The clocks will be shutdown, but there's a window where they are=
 still
> visible to consumers. I think you should use
> devm_add_action_or_reset() so that the cleanup is called in the expected =
order.
Agreed. remove() runs before devres_release_all(), so force_suspend() tears=
 down the hardware while the OF clock provider is still visible. I'll move =
the runtime PM cleanup into a devm_add_action_or_reset() registered before =
the clocks/provider, and drop it from remove().

> > +}
> > +
> > +static int __maybe_unused sky1_audss_clk_runtime_suspend(struct
> > +device *dev) {
> > +     struct sky1_audss_clks_priv *priv =3D dev_get_drvdata(dev);
> > +     const struct sky1_audss_clks_devtype_data *devtype_data =3D priv-
> >devtype_data;
> > +     unsigned long flags;
> > +     int i;
> > +
> > +     spin_lock_irqsave(&priv->lock, flags);
> > +     for (i =3D 0; i < devtype_data->reg_save_size; i++)
> > +             regmap_read(priv->regmap_cru,
> > +                         devtype_data->reg_save[i][0], &devtype_data-
> >reg_save[i][1]);
> > +     spin_unlock_irqrestore(&priv->lock, flags);
> > +
> > +     sky1_audss_clks_disable(priv);
> > +
> > +     return reset_control_assert(priv->rst_noc);
> > +}
> > +
> > +static int __maybe_unused sky1_audss_clk_runtime_resume(struct device
> > +*dev) {
> > +     struct sky1_audss_clks_priv *priv =3D dev_get_drvdata(dev);
> > +     const struct sky1_audss_clks_devtype_data *devtype_data =3D priv-
> >devtype_data;
> > +     unsigned long flags;
> > +     int i, ret;
> > +
> > +     ret =3D reset_control_deassert(priv->rst_noc);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D sky1_audss_clks_enable(priv);
> > +     if (ret) {
> > +             dev_err(dev, "failed to enable clocks\n");
> > +             reset_control_assert(priv->rst_noc);
> > +             return ret;
> > +     }
> > +
> > +     spin_lock_irqsave(&priv->lock, flags);
> > +     for (i =3D 0; i < devtype_data->reg_save_size; i++)
> > +             regmap_write(priv->regmap_cru,
> > +                          devtype_data->reg_save[i][0],
> > + devtype_data->reg_save[i][1]);
>=20
> Does it matter what order the registers are written on resume?
No, it doesn't matter.

I will send the v10 soon.

Thanks,
Joakim

