Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022113.outbound.protection.outlook.com [40.107.75.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0F542314F;
	Thu,  4 Jun 2026 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574097; cv=fail; b=ExIaKSaSdC9HoZL/+5r2waj8MeFHAFdf2K58gOv9jKWVKoW71rjSodMKd8UHXaZNDdVi/cJou9Jpernra/nwtB5yueK26tmE402A1e+5SxDl130Nomo38a+ODAx6gibjnKeLQkSZigG7Us5rIV5f7de4dnVDz8z2oDqBMbPungI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574097; c=relaxed/simple;
	bh=qci22qJSrxrhksQdMBEPH10O6/eRxGp1txAKLvi7HD4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XsZpy+l+DbEIX1bM91yveIukPu671U/znt5DQoEUgrfawin+m7cc6QOytUI2mV1a7bWWDlIX20GhfZ1Be/ZIgIAd1TekzVo8zuTWqsk82aXHtApEaQNpX5U+L/CkN9X/Jm9kLwlkuxbP2UbCoErMsJ3dU4ybWv1gDxkV2DeXUNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mu06NKgXFSaY9yTkGJHw8UO4EdOIwAsUaVRDAdBJiqbf2RyOJv4ou5hxcaqkwoLNlsdefZ64vmVn+YqaxI1raLmMZ+likVyf0Y/7FNkXEUQvihNVqhGW5e27uvvqiscHk6tmlQZGz+YOAPB+VawJqYuIOYfJ9mTFPdYQr2xwo+DQIkAtv0mmN3oRexy5kyjySBwvfgiScpMImsaf2U14eFzUHKt48i3JsmFyowKNTaw+/0ZrpJRmYwx65xwP2LLFt6DpB9JOelntvyCqiGh4dbFh4yJDJtlxQYagBeyF5mvteJdrTzxgXwt1XUrlTkBW882YdrMjhQZNCn4ExYrgHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxNnjI8hZTVvZLfJqeSwH8p8h7myAgwFCM5bbkkvGMU=;
 b=jz4bQ3EDeEfqBHaMypujPXU1B0VlPPsaAu4W93EOTsvoL1P1UlS6lv/P3oR5gJX5ns4oczXXcRB631MRnn8Ls5F6nKIVZqxv+Ny22HOTE+z7qMowuj2Rb3IMyOIWqAV7391Z0TGqod9xZJ++pEMP/VAR1M7S41N4oJnrwO2cccqdESEGdyv5pzGtuV7EP3DvvHP1wZMuX7TmYq+VXXb/Pi232uoWmfzgE5JDXirg3lqCudSn9vdxgUl3C18ldJPLJBeOHUp1SGDQrmfE/Du0d6zRRCjT96Nlt9gckD5mA9v1kyxkqf4Vgck2tifTZofIfcZb5gtwGo+zt5z1Q6EIrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from KL1PR06MB6236.apcprd06.prod.outlook.com (2603:1096:820:d7::11)
 by OSNPR06MB8494.apcprd06.prod.outlook.com (2603:1096:604:495::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 11:54:51 +0000
Received: from KL1PR06MB6236.apcprd06.prod.outlook.com
 ([fe80::2c9b:c257:fe54:16e7]) by KL1PR06MB6236.apcprd06.prod.outlook.com
 ([fe80::2c9b:c257:fe54:16e7%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 11:54:51 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Brian Masney <bmasney@redhat.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [PATCH v1 3/7] clk: cix: add sky1 audss clock controller
Thread-Topic: [PATCH v1 3/7] clk: cix: add sky1 audss clock controller
Thread-Index: AQHc79pidj8Z5Rge80W3iVo2ZjXzM7Yp+GyAgARW57A=
Date: Thu, 4 Jun 2026 11:54:50 +0000
Message-ID:
 <KL1PR06MB6236433BEAB4263A628FE91782102@KL1PR06MB6236.apcprd06.prod.outlook.com>
References: <20260530021642.64059-1-joakim.zhang@cixtech.com>
 <20260530021642.64059-4-joakim.zhang@cixtech.com>
 <ah3BP-Xxg5IaQRHU@redhat.com>
In-Reply-To: <ah3BP-Xxg5IaQRHU@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR06MB6236:EE_|OSNPR06MB8494:EE_
x-ms-office365-filtering-correlation-id: 394e980a-d56f-4c87-0d9c-08dec230158f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|22082099003|18002099003|3023799007|56012099006|5023799004|4143699003;
x-microsoft-antispam-message-info:
 sWgutDUYpk+pfpyDLTGufLTJlscqB6OXNvQh2dDh/Gc53NiKajlItbOFXplecv4+ahaXOJVYwBqwfo1A2FbMlc/YeOvTMNQ2tKd1asweRxqgvaewKfDKcWkpR0nIfJMIfB72oM0WwN4M/FN+yGgNMtVwkC5jdXiu+LYjvzioVXH12nHiywqG4K7+ZJ/GbbV6t6ATjTJOEluH7BOaVRRsOLauwAbgoOIoF9tpHaam++EAOvjaej41444MywQBqo6AvJeEcJUQMkqtymKCjOTIht06+zubVfyKr7xWnAd4hIEwscGRU84Hq4GN5eI3TbcDCp2E8vehc0pHXHcyJCFkezR5mCtQ1ssMSUT+3AkDUcFJi83DfM22iZDwsO4uYOHePnCgQqNnO7F43KiKrCxngIaUkEV4GB3AnkXoCW4F2IVenv8gr/4wJTuYUIqd/yvPLAl+mxwnMORxSvTtRzL872l4sLbpWcJsOdEJBZTy24/YVO7F1dfF3Rh0fUjtrQjqmdTaEHPRVxN13toA61Rl9C6qYjK0eDNaZVCW0u565DByrwJXYFLsCZWlx/VHLsmDdb+E1r1AHrUkz8mp1+IwgdkXac3gLKOxCIGXyPYkT8Ij9t8zlLxl5A8dY63SKZK/K6jMaWXD+PG2iQvlpRJ6A/gNa8aMUznNwzpGxLA1crMTNR0GyfchHB5NZLG7hm1ej0T2uwU4TzkSHg7myjkSUtDKSP6WM6ffc2HIiSTSMQ4RKBDU3HoLu8YMRuY/d0LD
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6236.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(18002099003)(3023799007)(56012099006)(5023799004)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YpO6AqBUYmWo4tLKbKI9F3lxp+AWYLuo0+DbEEQpmWQwfc12KgAPXFT21dVT?=
 =?us-ascii?Q?02x97Lb7CYeB8xf59yMhARd8PznBBJxRDtpvr6HD9fs1bpjv7E8s3j8wCLPK?=
 =?us-ascii?Q?SHg/rNBXslbGoZjSfQWKsAGQLFIqRPOCxFVoWepX0dzrnr2gXWZfgCKiin0D?=
 =?us-ascii?Q?rHJkq2GxsnR9YGWPTitvFysZZikvleoOh4sXA3rrGhqi+alSJmh8brpViMtU?=
 =?us-ascii?Q?DxumdY2nU3E1xejyjO65W3wfOyiKSLPxo1GuQaH8Gv/kCeFT3ifl4cs3INaB?=
 =?us-ascii?Q?uImg3QSahXH7i6TCUToIZF2bGdHC1c58sGQETtbt6QaP6OteQJ3qsvNoMV9s?=
 =?us-ascii?Q?gzqSoa8+MzbR0Q5xnJhRIruJGcIRJbhMcGoqTt9E9FkLVe5R5VIM1GZqQW9T?=
 =?us-ascii?Q?jzIBrbD7RgYJPrXEeLE0zgvSD8tVX6FhFqG9UlPA/gw0Qnn+BIsQLbhT/9q/?=
 =?us-ascii?Q?4CC2FsQadR8ZyA7Pf6EP6nSm9XGNn0K+3iGm2XJ3x3pS2iXCrDqROW+kqDsW?=
 =?us-ascii?Q?qIdWe0hI0jdnn6RvzUw9RPDyApJf9b/a3rOQJsrjzdY3B3I+ONgHpL55S7lA?=
 =?us-ascii?Q?qKEDbSNlSvxoDS5oKPGMtvMeewcF9SIiPKa4XG/9R9b2LeOYmQQ2M8rJERn4?=
 =?us-ascii?Q?NTqPtX1zyfjWPjs50LPdUZTrzfFHxnxrmc+hQj8snz/uwy8vATvyU7udAvty?=
 =?us-ascii?Q?2jP3LKuC7XzD8p7smx+Klef0tqT6fDxCo6DmnLsl87cYDJaWPZFqM0QUk6wT?=
 =?us-ascii?Q?dgEyySjuApVJB1agxRmI3AxiVt54dQBKGofT0f4vEtVuj9EtP+lndSaMo6xs?=
 =?us-ascii?Q?DAozKYhZHQWSRF0GP01ghLsPvtSbA2/kO1em2ufTdZA6hvqDTIgLcUr957l/?=
 =?us-ascii?Q?CleaqfdxFtcDNY7agAt4gsFhK09K+lHUJNR1aoPrlfpe5mYiitfvwhvYVF9/?=
 =?us-ascii?Q?zwTrJj2eY0aa0y8kOmEV5ZSVJZXOc+quoB2brsCqTmD8hp7W3yMMoPPYbiy4?=
 =?us-ascii?Q?IvnrTHsV1y43tvaS+ShCc9JRpSI32A9meP1iRBF1nIvLWCKknAU2Q0P0YDn8?=
 =?us-ascii?Q?cnFv2gNY+4i1AfaJlantLclLF9NkE7yhtuAzWgM+EIjY3/9NzXdoUv6vwPyD?=
 =?us-ascii?Q?iRhYlKBLZK6/3D221J2+LEhS1qBwRwgy98fzwlXp6nqztzt1vKIsm2za2EzE?=
 =?us-ascii?Q?RdItrZdrrIiliw3x2G49gP75foxoLqgeZv46Cv8abq4+QcAa7SycFVRa9x8C?=
 =?us-ascii?Q?IWY9HCCqKC/NVKSFSJnoXi+ptTAR7gt+NNqaOXd1jN9Y4IaKJ1uxs1tqTO7c?=
 =?us-ascii?Q?1D6695j8breyq9Owd33bfq9Wb1i2MxyASrJOsbhT6zIhly7oYgNE3o6I48Km?=
 =?us-ascii?Q?UW6c1Xjl22OmAP/y0O3cSlIcjvpyya4aei5I9tRed7UV77gK4N3jvUitFIqw?=
 =?us-ascii?Q?O7VKGG9MbPpeNTMRoJOWn0N/yQuoHdZ2ERt+vWdZSrRI/0T1e97J4pbDejrU?=
 =?us-ascii?Q?jqpCmTWeXPP74SCv4g/E44cFK/XsfmfnyN8RJwtCMFzxw8TjnbaU9vJyJpDk?=
 =?us-ascii?Q?kApLidxDglaKKJIdRYlTAjgGN2FwUBLLfSbbsTMhEDIlcDdid+eqz0rivqvz?=
 =?us-ascii?Q?oRp4VFM0H7VO00HKl+RUvlTYP3IWsucblBteV6Tlc3EpO0m4t+gx4BqOVWat?=
 =?us-ascii?Q?Zn7QbAvjVPRbGxG/KOGeX9k6u7LK+6WD3GgkIkGIgpPT39GT3N5NskfAeUW0?=
 =?us-ascii?Q?257Y+WL41w=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6236.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 394e980a-d56f-4c87-0d9c-08dec230158f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 11:54:50.7845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bac3zyNDRg8w/tAyRLYQVzx4eGE1q6fwkiBbEeIQojIEX1sD/F/5WRUcWIvta2yW368GuYQJPJZPf7AIiASoJuGFp7D9WSNK8lxp0in9s60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8494


Hi Brian,


> -----Original Message-----
> From: Brian Masney <bmasney@redhat.com>
> Sent: Tuesday, June 2, 2026 1:29 AM
> To: Joakim Zhang <joakim.zhang@cixtech.com>
> Cc: mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; p.zabel@pengutronix.de;
> lgirdwood@gmail.com; broonie@kernel.org; cix-kernel-upstream <cix-kernel-
> upstream@cixtech.com>; linux-clk@vger.kernel.org; linux-
> sound@vger.kernel.org
> Subject: Re: [PATCH v1 3/7] clk: cix: add sky1 audss clock controller
>=20
> [You don't often get email from bmasney@redhat.com. Learn why this is
> important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> EXTERNAL EMAIL
>=20
> Hi Joakim,
>=20
> On Sat, May 30, 2026 at 10:16:38AM +0800, joakim.zhang@cixtech.com wrote:
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> >
> > Add clock controller driver for the Cix Sky1 audio subsystem (AUDSS).
> > The driver controls mux, divider and gate clocks in the audio CRU via
> > the parent syscon regmap and registers clock outputs for audio IPs.
> >
> > Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> > ---
> >  drivers/clk/Kconfig              |    1 +
> >  drivers/clk/Makefile             |    1 +
> >  drivers/clk/cix/Kconfig          |   17 +
> >  drivers/clk/cix/Makefile         |    3 +
> >  drivers/clk/cix/clk-sky1-audss.c | 1123
> > ++++++++++++++++++++++++++++++
> >  5 files changed, 1145 insertions(+)
> >  create mode 100644 drivers/clk/cix/Kconfig  create mode 100644
> > drivers/clk/cix/Makefile  create mode 100644
> > drivers/clk/cix/clk-sky1-audss.c
> >
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig index
> > b2efbe9f6acb..ead41e45c0f6 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -503,6 +503,7 @@ source "drivers/clk/actions/Kconfig"
> >  source "drivers/clk/analogbits/Kconfig"
> >  source "drivers/clk/aspeed/Kconfig"
> >  source "drivers/clk/bcm/Kconfig"
> > +source "drivers/clk/cix/Kconfig"
> >  source "drivers/clk/eswin/Kconfig"
> >  source "drivers/clk/hisilicon/Kconfig"
> >  source "drivers/clk/imgtec/Kconfig"
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile index
> > a3e2862ebd7e..9135ea6e5a8f 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -118,6 +118,7 @@ obj-$(CONFIG_ARCH_ARTPEC)         +=3D axis/
> >  obj-$(CONFIG_ARC_PLAT_AXS10X)                +=3D axs10x/
> >  obj-y                                        +=3D bcm/
> >  obj-$(CONFIG_ARCH_BERLIN)            +=3D berlin/
> > +obj-y                                        +=3D cix/
> >  obj-$(CONFIG_ARCH_DAVINCI)           +=3D davinci/
> >  obj-$(CONFIG_COMMON_CLK_ESWIN)               +=3D eswin/
> >  obj-$(CONFIG_ARCH_HISI)                      +=3D hisilicon/
> > diff --git a/drivers/clk/cix/Kconfig b/drivers/clk/cix/Kconfig new
> > file mode 100644 index 000000000000..d248f109c051
> > --- /dev/null
> > +++ b/drivers/clk/cix/Kconfig
> > @@ -0,0 +1,17 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +# Audio subsystem clock support for Cixtech SoC family menu "Clock
> > +support for Cixtech audss"
> > +
> > +comment "Clock options for Cixtech audss:"
>=20
> This comment is redundant with the menu name, and can be dropped.
OK

> > +
> > +config CLK_SKY1_AUDSS
> > +     tristate "Cixtech Sky1 Audio Subsystem Clock Driver"
> > +     depends on ARCH_CIX || COMPILE_TEST
>=20
> depends on MFD_SYSCON since syscon_node_to_regmap() is used below.
OK

> > +     select REGMAP_MMIO
> > +     select RESET_CONTROLLER
> > +     help
> > +       Support for the Audio Subsystem clock controller present on
> > +       Cixtech Sky1 SoC. This driver provides mux, divider and gate
> > +       clocks for DSP, I2S, HDA and related blocks in the audio
> > +       subsystem. Say M or Y here if you want to build this driver.
> > +endmenu
> > diff --git a/drivers/clk/cix/Makefile b/drivers/clk/cix/Makefile new
> > file mode 100644 index 000000000000..bc612f1d08b2
> > --- /dev/null
> > +++ b/drivers/clk/cix/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +obj-$(CONFIG_CLK_SKY1_AUDSS) +=3D clk-sky1-audss.o
> > diff --git a/drivers/clk/cix/clk-sky1-audss.c
> > b/drivers/clk/cix/clk-sky1-audss.c
> > new file mode 100644
> > index 000000000000..ab6ec7338ebe
> > --- /dev/null
> > +++ b/drivers/clk/cix/clk-sky1-audss.c
> > @@ -0,0 +1,1123 @@
> > +// SPDX-License-Identifier: GPL-2.0-only // Copyright 2026 Cix
> > +Technology Group Co., Ltd.
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/delay.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset.h>
> > +
> > +#include <dt-bindings/clock/sky1-audss.h>
> > +
> > +#define INFO_HIFI0                           0x00
> > +#define INFO_CLK_GATE                                0x10
> > +#define INFO_CLK_DIV                         0x14
> > +#define INFO_CLK_MUX                         0x18
> > +#define INFO_MCLK                            0x70
> > +
> > +#define SKY1_AUDSS_CLK_PARENTS_CNT           6
> > +#define AUDSS_CLK_PARENTS_MAX
> SKY1_AUDSS_CLK_PARENTS_CNT
>=20
> Can this second one be dropped?
Since I would extend this driver for our another SoC which not announced ye=
t,  clk parents change to 4.

> > +
> > +static u32 sky1_reg_save[][2] =3D {
> > +     { INFO_HIFI0,  0 },
> > +     { INFO_CLK_GATE,  0 },
> > +     { INFO_CLK_DIV, 0 },
> > +     { INFO_CLK_MUX, 0 },
> > +     { INFO_MCLK, 0 },
> > +};
>=20
> Should this be moved into struct sky1_audss_clks_priv?
This also different for our another SoC, prefer to add to struct sky1_audss=
_clks_devtype_data, as the soc specific data.

> > +
> > +static const char *sky1_audss_clk_names[SKY1_AUDSS_CLK_PARENTS_CNT]
> =3D {
> > +     "audio_clk0", "audio_clk1", "audio_clk2",
> > +     "audio_clk3", "audio_clk4", "audio_clk5", };
> > +
> > +static const u32 sky1_clk_rate_default[SKY1_AUDSS_CLK_PARENTS_CNT] =3D=
 {
> > +     294912000,
> > +     344064000,
> > +     270950400,
> > +     316108800,
> > +     800000000,
> > +     48000000,
> > +};
> > +
> > +static DEFINE_SPINLOCK(lock);
> > +static struct clk_hw_onecell_data *clk_data;
>=20
> Move both of these into struct sky1_audss_clks_priv.
OK

> > +
> > +static const char * const dsp_clk_parent[] =3D {
> > +     "audio_clk4"
> > +};
> > +
> > +static const char * const dsp_bclk_parent[] =3D {
> > +     "audio_clk4_div2"
> > +};
> > +
> > +static const char * const dsp_pbclk_parent[] =3D {
> > +     "audio_clk4_div4"
> > +};
> > +
> > +static const char * const sram_axi_parent[] =3D {
> > +     "audio_clk4_div2"
> > +};
> > +
> > +static const char * const hda_sys_parent[] =3D {
> > +     "audio_clk4_div2"
> > +};
> > +
> > +static const char * const hda_hda_parent[] =3D {
> > +     "audio_clk5"
> > +};
> > +
> > +static const char * const dmac_axi_parent[] =3D {
> > +     "audio_clk4_div2"
> > +};
> > +
> > +static const char * const wdg_apb_parent[] =3D {
> > +     "audio_clk5_div2"
> > +};
> > +
> > +static const char * const wdg_wdg_parent[] =3D {
> > +     "audio_clk5_div2"
> > +};
> > +
> > +static const char * const timer_apb_parent[] =3D {
> > +     "audio_clk4_div4"
> > +};
> > +
> > +static const char * const timer_timer_parent[] =3D {
> > +     "audio_clk5_div2"
> > +};
> > +
> > +static const char * const mailbox_apb_parent[] =3D {
> > +     "audio_clk4_div4"
> > +};
> > +
> > +static const char * const i2s_apb_parent[] =3D {
> > +     "audio_clk4_div4"
> > +};
> > +
> > +static const char * const i2s0_parents[] =3D {
> > +     "audio_clk0", "audio_clk2"
> > +};
> > +
> > +static const char * const i2s1_parents[] =3D {
> > +     "audio_clk0", "audio_clk2"
> > +};
> > +
> > +static const char * const i2s2_parents[] =3D {
> > +     "audio_clk0", "audio_clk2"
> > +};
> > +
> > +static const char * const i2s3_parents[] =3D {
> > +     "audio_clk0", "audio_clk1", "audio_clk2", "audio_clk3"
> > +};
> > +
> > +static const char * const i2s4_parents[] =3D {
> > +     "audio_clk0", "audio_clk1", "audio_clk2", "audio_clk3"
> > +};
> > +
> > +static const char * const i2s5_parents[] =3D {
> > +     "audio_clk0", "audio_clk2"
> > +};
> > +
> > +static const char * const i2s6_parents[] =3D {
> > +     "audio_clk0", "audio_clk2"
> > +};
> > +
> > +static const char * const i2s7_parents[] =3D {
> > +     "audio_clk0", "audio_clk2"
> > +};
> > +
> > +static const char * const i2s8_parents[] =3D {
> > +     "audio_clk0", "audio_clk2"
> > +};
> > +
> > +static const char * const i2s9_parents[] =3D {
> > +     "audio_clk0", "audio_clk2"
> > +};
> > +
> > +static const char * const mclk_parents[] =3D {
> > +     "audio_clk0", "audio_clk2"
> > +};
> > +
> > +/*
> > + * audss composite clock definition
> > + */
> > +struct muxdiv_cfg {
> > +     int offset;
> > +     u8 shift;
> > +     u8 width;
> > +     u8 flags;
> > +};
> > +
> > +struct gate_cfg {
> > +     int offset;
> > +     u8 shift;
> > +     u8 flags;
> > +};
> > +
> > +struct composite_clk_cfg {
> > +     u32 id;
> > +     const char *name;
> > +     const char * const *parent_names;
>=20
> Can the name also be const char * const * like the parent_names?
OK

> > +     int num_parents;
> > +     struct muxdiv_cfg *mux_cfg;
> > +     struct muxdiv_cfg *div_cfg;
> > +     struct gate_cfg *gate_cfg;
> > +     unsigned long flags;
> > +};
> > +
> > +#define CFG(_id,\
> > +         _name,\
> > +         _parent_names,\
> > +         _mux_offset, _mux_shift, _mux_width, _mux_flags,\
> > +         _div_offset, _div_shift, _div_width, _div_flags,\
> > +         _gate_offset, _gate_shift, _gate_flags,\
> > +         _flags)\
> > +{\
> > +     .id =3D _id,\
> > +     .name =3D _name,\
> > +     .parent_names =3D _parent_names,\
> > +     .num_parents =3D ARRAY_SIZE(_parent_names),\
> > +     .mux_cfg =3D &(struct muxdiv_cfg) { _mux_offset, _mux_shift, _mux=
_width,
> _mux_flags },\
> > +     .div_cfg =3D &(struct muxdiv_cfg) { _div_offset, _div_shift, _div=
_width,
> _div_flags },\
> > +     .gate_cfg =3D &(struct gate_cfg) { _gate_offset, _gate_shift, _ga=
te_flags },\
> > +     .flags =3D _flags,\
> > +}
> > +
> > +static const struct composite_clk_cfg sky1_audss_clks[] =3D {
> > +     /* dsp */
> > +     CFG(CLK_DSP_CLK,
> > +         "audss_dsp_clk",
> > +         dsp_clk_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         INFO_HIFI0, 0, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_DSP_BCLK,
> > +         "audss_dsp_bclk",
> > +         dsp_bclk_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         -1, 0, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_DSP_PBCLK,
> > +         "audss_dsp_pbclk",
> > +         dsp_pbclk_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         -1, 0, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     /* sram */
> > +     CFG(CLK_SRAM_AXI,
> > +         "audss_sram_axi",
> > +         sram_axi_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         INFO_CLK_GATE, 16, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     /* hda */
> > +     CFG(CLK_HDA_SYS,
> > +         "audss_hda_sys",
> > +         hda_sys_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         INFO_CLK_GATE, 14, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_HDA_HDA,
> > +         "audss_hda_hda",
> > +         hda_hda_parent,
> > +         -1, 0, 0, 0,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_GATE, 14, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     /* dmac */
> > +     CFG(CLK_DMAC_AXI,
> > +         "audss_dmac_axi",
> > +         dmac_axi_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         INFO_CLK_GATE, 15, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     /* wdg */
> > +     CFG(CLK_WDG_APB,
> > +         "audss_wdg_apb",
> > +         wdg_apb_parent,
> > +         -1, 0, 0, 0,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_GATE, 10, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_WDG_WDG,
> > +         "audss_wdg_wdg",
> > +         wdg_wdg_parent,
> > +         -1, 0, 0, 0,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_GATE, 10, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     /* timer */
> > +     CFG(CLK_TIMER_APB,
> > +         "audss_timer_apb",
> > +         timer_apb_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         INFO_CLK_GATE, 11, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_TIMER_TIMER,
> > +         "audss_timer_timer",
> > +         timer_timer_parent,
> > +         -1, 0, 0, 0,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_GATE, 11, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     /* mailbox: mb0(ap->dsp), mb1(dsp->ap) */
> > +     CFG(CLK_MB_0_APB,
> > +         "audss_mb_0_apb",
> > +         mailbox_apb_parent,
> > +         -1, 0, 0, 0,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_GATE, 12, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_MB_1_APB,
> > +         "audss_mb_1_apb",
> > +         mailbox_apb_parent,
> > +         -1, 0, 0, 0,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_GATE, 13, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     /* i2s */
> > +     CFG(CLK_I2S0_APB,
> > +         "audss_i2s0_apb",
> > +         i2s_apb_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         INFO_CLK_GATE, 0, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S1_APB,
> > +         "audss_i2s1_apb",
> > +         i2s_apb_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         INFO_CLK_GATE, 1, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S2_APB,
> > +         "audss_i2s2_apb",
> > +         i2s_apb_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         INFO_CLK_GATE, 2, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S3_APB,
> > +         "audss_i2s3_apb",
> > +         i2s_apb_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         INFO_CLK_GATE, 3, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S4_APB,
> > +         "audss_i2s4_apb",
> > +         i2s_apb_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         INFO_CLK_GATE, 4, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S5_APB,
> > +         "audss_i2s5_apb",
> > +         i2s_apb_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         INFO_CLK_GATE, 5, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S6_APB,
> > +         "audss_i2s6_apb",
> > +         i2s_apb_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         INFO_CLK_GATE, 6, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S7_APB,
> > +         "audss_i2s7_apb",
> > +         i2s_apb_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         INFO_CLK_GATE, 7, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S8_APB,
> > +         "audss_i2s8_apb",
> > +         i2s_apb_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         INFO_CLK_GATE, 8, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S9_APB,
> > +         "audss_i2s9_apb",
> > +         i2s_apb_parent,
> > +         -1, 0, 0, 0,
> > +         INFO_CLK_DIV, 0, 2, 0,
> > +         INFO_CLK_GATE, 9, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S0,
> > +         "audss_i2s0",
> > +         i2s0_parents,
> > +         INFO_CLK_MUX, 0, 2, 0,
> > +         INFO_CLK_DIV, 2, 2, 0,
> > +         INFO_CLK_GATE, 0, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S1,
> > +         "audss_i2s1",
> > +         i2s1_parents,
> > +         INFO_CLK_MUX, 2, 2, 0,
> > +         INFO_CLK_DIV, 4, 2, 0,
> > +         INFO_CLK_GATE, 1, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S2,
> > +         "audss_i2s2",
> > +         i2s2_parents,
> > +         INFO_CLK_MUX, 4, 2, 0,
> > +         INFO_CLK_DIV, 6, 2, 0,
> > +         INFO_CLK_GATE, 2, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S3,
> > +         "audss_i2s3",
> > +         i2s3_parents,
> > +         INFO_CLK_MUX, 6, 2, 0,
> > +         INFO_CLK_DIV, 8, 2, 0,
> > +         INFO_CLK_GATE, 3, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S4,
> > +         "audss_i2s4",
> > +         i2s4_parents,
> > +         INFO_CLK_MUX, 8, 2, 0,
> > +         INFO_CLK_DIV, 10, 2, 0,
> > +         INFO_CLK_GATE, 4, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S5,
> > +         "audss_i2s5",
> > +         i2s5_parents,
> > +         INFO_CLK_MUX, 10, 2, 0,
> > +         INFO_CLK_DIV, 12, 2, 0,
> > +         INFO_CLK_GATE, 5, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S6,
> > +         "audss_i2s6",
> > +         i2s6_parents,
> > +         INFO_CLK_MUX, 12, 2, 0,
> > +         INFO_CLK_DIV, 14, 2, 0,
> > +         INFO_CLK_GATE, 6, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S7,
> > +         "audss_i2s7",
> > +         i2s7_parents,
> > +         INFO_CLK_MUX, 14, 2, 0,
> > +         INFO_CLK_DIV, 16, 2, 0,
> > +         INFO_CLK_GATE, 7, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S8,
> > +         "audss_i2s8",
> > +         i2s8_parents,
> > +         INFO_CLK_MUX, 16, 2, 0,
> > +         INFO_CLK_DIV, 18, 2, 0,
> > +         INFO_CLK_GATE, 8, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_I2S9,
> > +         "audss_i2s9",
> > +         i2s9_parents,
> > +         INFO_CLK_MUX, 18, 2, 0,
> > +         INFO_CLK_DIV, 20, 2, 0,
> > +         INFO_CLK_GATE, 9, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     /* mclk */
> > +     CFG(CLK_MCLK0,
> > +         "audss_mclk0",
> > +         mclk_parents,
> > +         INFO_MCLK, 5, 1, 0,
> > +         -1, 0, 0, 0,
> > +         INFO_MCLK, 0, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_MCLK1,
> > +         "audss_mclk1",
> > +         mclk_parents,
> > +         INFO_MCLK, 6, 1, 0,
> > +         -1, 0, 0, 0,
> > +         INFO_MCLK, 1, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_MCLK2,
> > +         "audss_mclk2",
> > +         mclk_parents,
> > +         INFO_MCLK, 7, 1, 0,
> > +         -1, 0, 0, 0,
> > +         INFO_MCLK, 2, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_MCLK3,
> > +         "audss_mclk3",
> > +         mclk_parents,
> > +         INFO_MCLK, 8, 1, 0,
> > +         -1, 0, 0, 0,
> > +         INFO_MCLK, 3, 0,
> > +         CLK_GET_RATE_NOCACHE),
> > +     CFG(CLK_MCLK4,
> > +         "audss_mclk4",
> > +         mclk_parents,
> > +         INFO_MCLK, 9, 1, 0,
> > +         -1, 0, 0, 0,
> > +         INFO_MCLK, 4, 0,
> > +         CLK_GET_RATE_NOCACHE),
>=20
> Why is CLK_GET_RATE_NOCACHE enabled for all of these clocks?
Yes, this should not be set for all these clocks.

> > +};
> > +
> > +struct sky1_audss_clks_devtype_data {
> > +     u32 (*reg_save)[2];
> > +     size_t reg_save_size;
> > +     const char **clk_names;
>=20
> const char * const *clk_names ?
OK

> > +     size_t clk_num;
> > +     const u32 *clk_rate_default;
> > +     const struct composite_clk_cfg *clk_cfg;
> > +     size_t clk_cfg_size;
> > +};
> > +
> > +struct sky1_audss_clks_priv {
> > +     struct device *dev;
> > +     struct regmap *regmap_cru;
> > +     struct clk *clks[AUDSS_CLK_PARENTS_MAX];
> > +     struct reset_control *rst_noc;
> > +     const struct sky1_audss_clks_devtype_data *devtype_data; };
> > +
> > +/*
> > + * clk_ops for audss clock mux/divicer/gate
>=20
> divider
OK

> > + */
> > +struct sky1_clk_divider {
> > +     struct clk_divider div;
> > +     struct regmap *regmap;
> > +     int offset;
> > +};
> > +
> > +struct sky1_clk_gate {
> > +     struct clk_gate gate;
> > +     struct regmap *regmap;
> > +     int offset;
> > +};
> > +
> > +struct sky1_clk_mux {
> > +     struct clk_mux mux;
> > +     struct regmap *regmap;
> > +     int offset;
> > +};
> > +
> > +static inline struct sky1_clk_mux *to_sky1_clk_mux(struct clk_mux
> > +*mux) {
> > +     return container_of(mux, struct sky1_clk_mux, mux); }
> > +
> > +static u8 sky1_audss_clk_mux_get_parent(struct clk_hw *hw) {
> > +     struct clk_mux *mux =3D to_clk_mux(hw);
> > +     struct sky1_clk_mux *sky1_mux =3D to_sky1_clk_mux(mux);
> > +     u32 val;
> > +
> > +     regmap_read(sky1_mux->regmap, sky1_mux->offset, &val);
> > +     val =3D val >> mux->shift;
> > +     val &=3D mux->mask;
> > +
> > +     return clk_mux_val_to_index(hw, mux->table, mux->flags, val); }
> > +
> > +static int sky1_audss_clk_mux_set_parent(struct clk_hw *hw, u8 index)
> > +{
> > +     struct clk_mux *mux =3D to_clk_mux(hw);
> > +     struct sky1_clk_mux *sky1_mux =3D to_sky1_clk_mux(mux);
> > +     u32 val =3D clk_mux_index_to_val(mux->table, mux->flags, index);
>=20
> Reverse Christmas tree order. Swap these two lines. The mux needs to stay=
 first
> due to dependency.
OK

> > +     unsigned long flags =3D 0;
> > +     u32 reg;
> > +
> > +     if (mux->lock)
> > +             spin_lock_irqsave(mux->lock, flags);
> > +     else
> > +             __acquire(mux->lock);
> > +
> > +     if (mux->flags & CLK_MUX_HIWORD_MASK) {
> > +             reg =3D mux->mask << (mux->shift + 16);
> > +     } else {
> > +             regmap_read(sky1_mux->regmap, sky1_mux->offset, &reg);
> > +             reg &=3D ~(mux->mask << mux->shift);
> > +     }
> > +     val =3D val << mux->shift;
> > +     reg |=3D val;
> > +     regmap_write(sky1_mux->regmap, sky1_mux->offset, reg);
> > +
> > +     if (mux->lock)
> > +             spin_unlock_irqrestore(mux->lock, flags);
> > +     else
> > +             __release(mux->lock);
> > +
> > +     return 0;
> > +}
> > +
> > +static int sky1_audss_clk_mux_determine_rate(struct clk_hw *hw,
> > +                                          struct clk_rate_request
> > +*req) {
> > +     struct clk_mux *mux =3D to_clk_mux(hw);
> > +
> > +     return clk_mux_determine_rate_flags(hw, req, mux->flags); }
> > +
> > +static const struct clk_ops sky1_audss_clk_mux_ops =3D {
> > +     .get_parent =3D sky1_audss_clk_mux_get_parent,
> > +     .set_parent =3D sky1_audss_clk_mux_set_parent,
> > +     .determine_rate =3D sky1_audss_clk_mux_determine_rate,
> > +};
> > +
> > +static inline struct sky1_clk_divider *to_sky1_clk_divider(struct
> > +clk_divider *div) {
> > +     return container_of(div, struct sky1_clk_divider, div); }
> > +
> > +static unsigned long sky1_audss_clk_divider_recalc_rate(struct clk_hw =
*hw,
> > +                                                     unsigned long
> > +parent_rate) {
> > +     struct clk_divider *divider =3D to_clk_divider(hw);
> > +     struct sky1_clk_divider *sky1_div =3D to_sky1_clk_divider(divider=
);
> > +     unsigned int val;
> > +
> > +     regmap_read(sky1_div->regmap, sky1_div->offset, &val);
> > +     val =3D val >> divider->shift;
> > +     val &=3D clk_div_mask(divider->width);
> > +
> > +     return divider_recalc_rate(hw, parent_rate, val, divider->table,
> > +                                divider->flags, divider->width); }
> > +
> > +static int sky1_audss_clk_divider_determine_rate(struct clk_hw *hw,
> > +                                              struct clk_rate_request
> > +*req) {
> > +     struct clk_divider *divider =3D to_clk_divider(hw);
> > +     struct sky1_clk_divider *sky1_div =3D
> > +to_sky1_clk_divider(divider);
> > +
> > +     /* if read only, just return current value */
> > +     if (divider->flags & CLK_DIVIDER_READ_ONLY) {
> > +             u32 val;
> > +
> > +             regmap_read(sky1_div->regmap, sky1_div->offset, &val);
> > +             val =3D val >> divider->shift;
> > +             val &=3D clk_div_mask(divider->width);
> > +
> > +             return divider_ro_determine_rate(hw, req, divider->table,
> > +                                              divider->width,
> > +                                              divider->flags, val);
> > +     }
> > +
> > +     return divider_determine_rate(hw, req, divider->table, divider->w=
idth,
> > +                                   divider->flags); }
> > +
> > +static int sky1_audss_clk_divider_set_rate(struct clk_hw *hw,
> > +                                        unsigned long rate,
> > +                                        unsigned long parent_rate) {
> > +     struct clk_divider *divider =3D to_clk_divider(hw);
> > +     struct sky1_clk_divider *sky1_div =3D to_sky1_clk_divider(divider=
);
> > +     int value;
> > +     unsigned long flags =3D 0;
> > +     u32 val;
> > +
> > +     value =3D divider_get_val(rate, parent_rate, divider->table,
> > +                             divider->width, divider->flags);
> > +     if (value < 0)
> > +             return value;
> > +
> > +     if (divider->lock)
> > +             spin_lock_irqsave(divider->lock, flags);
> > +     else
> > +             __acquire(divider->lock);
> > +
> > +     if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
> > +             val =3D clk_div_mask(divider->width) << (divider->shift +=
 16);
> > +     } else {
> > +             regmap_read(sky1_div->regmap, sky1_div->offset, &val);
> > +             val &=3D ~(clk_div_mask(divider->width) << divider->shift=
);
> > +     }
> > +     val |=3D (u32)value << divider->shift;
> > +     regmap_write(sky1_div->regmap, sky1_div->offset, val);
> > +
> > +     if (divider->lock)
> > +             spin_unlock_irqrestore(divider->lock, flags);
> > +     else
> > +             __release(divider->lock);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct clk_ops sky1_audss_clk_divider_ops =3D {
> > +     .recalc_rate =3D sky1_audss_clk_divider_recalc_rate,
> > +     .determine_rate =3D sky1_audss_clk_divider_determine_rate,
> > +     .set_rate =3D sky1_audss_clk_divider_set_rate, };
> > +
> > +static inline struct sky1_clk_gate *to_sky1_clk_gate(struct clk_gate
> > +*gate) {
> > +     return container_of(gate, struct sky1_clk_gate, gate); }
> > +
> > +static void sky1_audss_clk_gate_endisable(struct clk_hw *hw, int
> > +enable) {
> > +     struct clk_gate *gate =3D to_clk_gate(hw);
> > +     struct sky1_clk_gate *sky1_gate =3D to_sky1_clk_gate(gate);
> > +     int set =3D gate->flags & CLK_GATE_SET_TO_DISABLE ? 1 : 0;
> > +     unsigned long flags;
>=20
> unsigned long flags =3D 0;
OK

> > +     u32 reg;
> > +
> > +     set ^=3D enable;
> > +
> > +     if (gate->lock)
> > +             spin_lock_irqsave(gate->lock, flags);
> > +     else
> > +             __acquire(gate->lock);
> > +
> > +     if (gate->flags & CLK_GATE_HIWORD_MASK) {
> > +             reg =3D BIT(gate->bit_idx + 16);
> > +             if (set)
> > +                     reg |=3D BIT(gate->bit_idx);
> > +     } else {
> > +             regmap_read(sky1_gate->regmap, sky1_gate->offset, &reg);
> > +
> > +             if (set)
> > +                     reg |=3D BIT(gate->bit_idx);
> > +             else
> > +                     reg &=3D ~BIT(gate->bit_idx);
> > +     }
> > +
> > +     regmap_write(sky1_gate->regmap, sky1_gate->offset, reg);
> > +
> > +     if (gate->lock)
> > +             spin_unlock_irqrestore(gate->lock, flags);
> > +     else
> > +             __release(gate->lock);
> > +}
> > +
> > +static int sky1_audss_clk_gate_enable(struct clk_hw *hw) {
> > +     sky1_audss_clk_gate_endisable(hw, 1);
> > +
> > +     return 0;
> > +}
> > +
> > +static void sky1_audss_clk_gate_disable(struct clk_hw *hw) {
> > +     sky1_audss_clk_gate_endisable(hw, 0); }
> > +
> > +static int sky1_audss_clk_gate_is_enabled(struct clk_hw *hw) {
> > +     u32 reg;
> > +     struct clk_gate *gate =3D to_clk_gate(hw);
> > +     struct sky1_clk_gate *sky1_gate =3D to_sky1_clk_gate(gate);
> > +
> > +     regmap_read(sky1_gate->regmap, sky1_gate->offset, &reg);
> > +
> > +     /* if a set bit disables this clk, flip it before masking */
> > +     if (gate->flags & CLK_GATE_SET_TO_DISABLE)
> > +             reg ^=3D BIT(gate->bit_idx);
> > +
> > +     reg &=3D BIT(gate->bit_idx);
> > +
> > +     return reg ? 1 : 0;
>=20
> return !!reg;
OK

> > +}
> > +
> > +static const struct clk_ops sky1_audss_clk_gate_ops =3D {
> > +     .enable =3D sky1_audss_clk_gate_enable,
> > +     .disable =3D sky1_audss_clk_gate_disable,
> > +     .is_enabled =3D sky1_audss_clk_gate_is_enabled, };
> > +
> > +static struct clk_hw *sky1_audss_clk_register(struct device *dev,
> > +                                           const char *name,
> > +                                           const char * const *parent_=
names,
> > +                                           int num_parents,
> > +                                           struct regmap *regmap,
> > +                                           struct muxdiv_cfg *mux_cfg,
> > +                                           struct muxdiv_cfg *div_cfg,
> > +                                           struct gate_cfg *gate_cfg,
> > +                                           unsigned long flags,
> > +                                           spinlock_t *lock) {
> > +     const struct clk_ops *sky1_mux_ops =3D NULL;
> > +     const struct clk_ops *sky1_div_ops =3D NULL;
> > +     const struct clk_ops *sky1_gate_ops =3D NULL;
> > +     struct clk_hw *hw =3D ERR_PTR(-ENOMEM);
> > +     struct sky1_clk_divider *sky1_div =3D NULL;
> > +     struct sky1_clk_gate *sky1_gate =3D NULL;
> > +     struct sky1_clk_mux *sky1_mux =3D NULL;
> > +
> > +     if (mux_cfg->offset >=3D 0) {
> > +             sky1_mux =3D devm_kzalloc(dev, sizeof(*sky1_mux), GFP_KER=
NEL);
> > +             if (!sky1_mux)
> > +                     return ERR_PTR(-ENOMEM);
> > +
> > +             sky1_mux->mux.reg =3D NULL;
> > +             sky1_mux->mux.shift =3D mux_cfg->shift;
> > +             sky1_mux->mux.mask =3D BIT(mux_cfg->width) - 1;
> > +             sky1_mux->mux.flags =3D mux_cfg->flags;
> > +             sky1_mux->mux.lock =3D lock;
> > +             sky1_mux_ops =3D &sky1_audss_clk_mux_ops;
> > +             sky1_mux->regmap =3D regmap;
> > +             sky1_mux->offset =3D mux_cfg->offset;
> > +     }
> > +
> > +     if (div_cfg->offset >=3D 0) {
> > +             sky1_div =3D devm_kzalloc(dev, sizeof(*sky1_div), GFP_KER=
NEL);
> > +             if (!sky1_div)
> > +                     return ERR_PTR(-ENOMEM);
> > +
> > +             sky1_div->div.reg =3D NULL;
> > +             sky1_div->div.shift =3D div_cfg->shift;
> > +             sky1_div->div.width =3D div_cfg->width;
> > +             sky1_div->div.flags =3D div_cfg->flags |
> CLK_DIVIDER_POWER_OF_TWO;
> > +             sky1_div->div.lock =3D lock;
> > +             sky1_div_ops =3D &sky1_audss_clk_divider_ops;
> > +             sky1_div->regmap =3D regmap;
> > +             sky1_div->offset =3D div_cfg->offset;
> > +     }
> > +
> > +     if (gate_cfg->offset >=3D 0) {
> > +             sky1_gate =3D devm_kzalloc(dev, sizeof(*sky1_gate), GFP_K=
ERNEL);
> > +             if (!sky1_gate)
> > +                     return ERR_PTR(-ENOMEM);
> > +
> > +             sky1_gate->gate.reg =3D NULL;
> > +             sky1_gate->gate.bit_idx =3D gate_cfg->shift;
> > +             sky1_gate->gate.flags =3D gate_cfg->flags;
> > +             sky1_gate->gate.lock =3D lock;
> > +             sky1_gate_ops =3D &sky1_audss_clk_gate_ops;
> > +             sky1_gate->regmap =3D regmap;
> > +             sky1_gate->offset =3D gate_cfg->offset;
> > +     }
> > +
> > +     hw =3D clk_hw_register_composite(dev, name, parent_names,
> num_parents,
> > +                                    sky1_mux ? &sky1_mux->mux.hw : NUL=
L,
> sky1_mux_ops,
> > +                                    sky1_div ? &sky1_div->div.hw : NUL=
L, sky1_div_ops,
> > +                                    sky1_gate ? &sky1_gate->gate.hw : =
NULL,
> sky1_gate_ops,
> > +                                    flags);
> > +     if (IS_ERR(hw)) {
> > +             dev_err(dev, "register %s clock failed with err =3D %ld\n=
",
> > +                     name, PTR_ERR(hw));
> > +             return ERR_CAST(hw);
>=20
> return hw;
OK

> > +     }
> > +
> > +     return hw;
> > +}
> > +
> > +static int sky1_audss_clks_get(struct sky1_audss_clks_priv *priv) {
> > +     const struct sky1_audss_clks_devtype_data *devtype_data =3D priv-
> >devtype_data;
> > +     int i;
> > +
> > +     for (i =3D 0; i < devtype_data->clk_num; i++) {
> > +             priv->clks[i] =3D devm_clk_get(priv->dev, devtype_data-
> >clk_names[i]);
> > +             if (IS_ERR(priv->clks[i]))
> > +                     return dev_err_probe(priv->dev, PTR_ERR(priv->clk=
s[i]),
> > +                                          "failed to get clock %s", de=
vtype_data-
> >clk_names[i]);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int sky1_audss_clks_enable(struct sky1_audss_clks_priv *priv)
> > +{
> > +     const struct sky1_audss_clks_devtype_data *devtype_data =3D priv-
> >devtype_data;
> > +     int i, err;
> > +
> > +     for (i =3D 0; i < devtype_data->clk_num; i++) {
> > +             err =3D clk_prepare_enable(priv->clks[i]);
> > +             if (err) {
> > +                     dev_err(priv->dev, "failed to enable clock %s\n",
> > +                             devtype_data->clk_names[i]);
> > +                     goto err_clks;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +
> > +err_clks:
> > +     while (--i >=3D 0)
> > +             clk_disable_unprepare(priv->clks[i]);
> > +
> > +     return err;
> > +}
> > +
> > +static void sky1_audss_clks_disable(struct sky1_audss_clks_priv
> > +*priv) {
> > +     const struct sky1_audss_clks_devtype_data *devtype_data =3D priv-
> >devtype_data;
> > +     int i;
> > +
> > +     for (i =3D 0; i < devtype_data->clk_num; i++)
> > +             clk_disable_unprepare(priv->clks[i]);
> > +}
> > +
> > +static int sky1_audss_clks_set_rate(struct sky1_audss_clks_priv
> > +*priv) {
> > +     const struct sky1_audss_clks_devtype_data *devtype_data =3D priv-
> >devtype_data;
> > +     int i, err;
> > +
> > +     for (i =3D 0; i < devtype_data->clk_num; i++) {
> > +             err =3D clk_set_rate(priv->clks[i], devtype_data->clk_rat=
e_default[i]);
> > +             if (err) {
> > +                     dev_err(priv->dev, "failed to set clock rate %s\n=
",
> > +                             devtype_data->clk_names[i]);
> > +                     return err;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +/* register sky1 audio subsystem clocks */ static int
> > +sky1_audss_clk_probe(struct platform_device *pdev) {
> > +     const struct sky1_audss_clks_devtype_data *devtype_data;
> > +     struct sky1_audss_clks_priv *priv;
> > +     struct device_node *parent_np;
> > +     struct device *dev =3D &pdev->dev;
> > +     struct reset_control *rst_noc;
> > +     struct clk_hw **clk_table;
> > +     struct regmap *regmap_cru;
> > +     int i, ret;
> > +
> > +     parent_np =3D of_get_parent(pdev->dev.of_node);
> > +     regmap_cru =3D syscon_node_to_regmap(parent_np);
> > +     of_node_put(parent_np);
> > +     if (IS_ERR(regmap_cru))
> > +             return dev_err_probe(dev, PTR_ERR(regmap_cru),
> > +                                  "unable to get audss cru regmap");
> > +
> > +     devtype_data =3D of_device_get_match_data(dev);
>=20
> device_get_match_data() is more generic.
OK

> > +     if (!devtype_data)
> > +             return -ENODEV;
> > +
> > +     clk_data =3D devm_kzalloc(&pdev->dev,
> > +                             struct_size(clk_data, hws, AUDSS_MAX_CLKS=
),
> > +                             GFP_KERNEL);
> > +     if (!clk_data)
> > +             return -ENOMEM;
> > +
> > +     clk_data->num =3D AUDSS_MAX_CLKS;
> > +     clk_table =3D clk_data->hws;
> > +
> > +     priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->dev =3D dev;
> > +     priv->regmap_cru =3D regmap_cru;
> > +     priv->devtype_data =3D devtype_data;
> > +
> > +     ret =3D sky1_audss_clks_get(priv);
> > +     if (ret)
> > +             return ret;
> > +
> > +     rst_noc =3D devm_reset_control_get(dev, NULL);
> > +     if (IS_ERR(rst_noc))
> > +             return dev_err_probe(dev, PTR_ERR(rst_noc),
> > +                                  "failed to get noc reset");
> > +     priv->rst_noc =3D rst_noc;
> > +
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     /*
> > +      * Enable runtime PM here to allow the clock core using runtime P=
M
> > +      * for the registered clocks.
> > +      */
> > +     pm_runtime_get_noresume(dev);
> > +     pm_runtime_set_active(dev);
> > +     pm_runtime_enable(dev);
> > +
> > +     ret =3D sky1_audss_clks_enable(priv);
> > +     if (ret) {
> > +             dev_err(dev, "failed to enable clocks\n");
> > +             goto fail_clks_enable;
>=20
> pm_runtime_get_noresume() is acquired above but not released below in thi=
s
> case.
Yes, you are right.

> > +     }
> > +
> > +     ret =3D sky1_audss_clks_set_rate(priv);
> > +     if (ret) {
> > +             dev_err(dev, "failed to set clocks rate\n");
> > +             goto fail_clks_set;
> > +     }
> > +
> > +     /* assert reset */
> > +     reset_control_assert(rst_noc);
> > +     usleep_range(1, 2);
> > +
> > +     /* deassert reset */
> > +     reset_control_deassert(rst_noc);
> > +
> > +     /* audio_clk4 clock fixed divider */
> > +     clk_table[CLK_AUD_CLK4_DIV2] =3D
> > +             devm_clk_hw_register_fixed_factor(dev,
> > +                                               "audio_clk4_div2",
> > +                                               "audio_clk4",
> > +                                               CLK_GET_RATE_NOCACHE,
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
> > +                                               CLK_GET_RATE_NOCACHE,
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
> > +                                               CLK_GET_RATE_NOCACHE,
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
> > +                                             regmap_cru,
> > +                                             devtype_data->clk_cfg[i].=
mux_cfg,
> > +                                             devtype_data->clk_cfg[i].=
div_cfg,
> > +                                             devtype_data->clk_cfg[i].=
gate_cfg,
> > +                                             devtype_data->clk_cfg[i].=
flags,
> > +                                             &lock);
> > +             if (IS_ERR(clk_table[devtype_data->clk_cfg[i].id])) {
> > +                     ret =3D PTR_ERR(clk_table[devtype_data->clk_cfg[i=
].id]);
> > +                     dev_err(dev, "failed to register clock %d, ret:%d=
\n",
> > +                             devtype_data->clk_cfg[i].id, ret);
> > +                     goto fail_array_clk;
> > +             }
> > +     }
> > +
> > +     ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> clk_data);
> > +     if (ret) {
> > +             dev_err(dev, "failed to add clock provider: %d\n", ret);
> > +             goto fail_register;
> > +     }
> > +
> > +     pm_runtime_put_sync(dev);
> > +
> > +     return 0;
> > +
> > +fail_register:
> > +fail_array_clk:
> > +     while (i--)
> > +
> > +clk_hw_unregister_composite(clk_table[devtype_data->clk_cfg[i].id]);
> > +fail_fixed_clk:
> > +fail_clks_set:
> > +     pm_runtime_put_sync(dev);
> > +fail_clks_enable:
> > +     pm_runtime_disable(dev);
> > +     return ret;
> > +}
> > +
> > +static void sky1_audss_clk_remove(struct platform_device *pdev) {
> > +     struct device *dev =3D &pdev->dev;
> > +     struct sky1_audss_clks_priv *priv =3D dev_get_drvdata(dev);
> > +     const struct sky1_audss_clks_devtype_data *devtype_data =3D priv-
> >devtype_data;
> > +     int i =3D 0;
> > +
> > +     for (i =3D 0; i < devtype_data->clk_cfg_size; i++)
> > +
> > + clk_hw_unregister_composite(clk_data->hws[devtype_data->clk_cfg[i].i
> > + d]);
> > +
> > +     if (!pm_runtime_status_suspended(dev))
> > +             pm_runtime_force_suspend(dev);
> > +
> > +     pm_runtime_disable(dev);
> > +}
> > +
> > +static int __maybe_unused sky1_audss_clk_runtime_suspend(struct
> > +device *dev) {
> > +     struct sky1_audss_clks_priv *priv =3D dev_get_drvdata(dev);
> > +     const struct sky1_audss_clks_devtype_data *devtype_data =3D priv-
> >devtype_data;
> > +     int i;
> > +
> > +     for (i =3D 0; i < devtype_data->reg_save_size; i++)
> > +             regmap_read(priv->regmap_cru,
> > +                         devtype_data->reg_save[i][0],
> > + &devtype_data->reg_save[i][1]);
> > +
> > +     sky1_audss_clks_disable(priv);
>=20
> Where's the locking?
Will add the lock.

> > +
> > +     return 0;
> > +}
> > +
> > +static int __maybe_unused sky1_audss_clk_runtime_resume(struct device
> > +*dev) {
> > +     struct sky1_audss_clks_priv *priv =3D dev_get_drvdata(dev);
> > +     const struct sky1_audss_clks_devtype_data *devtype_data =3D priv-
> >devtype_data;
> > +     int i, ret;
> > +
> > +     ret =3D sky1_audss_clks_enable(priv);
> > +     if (ret) {
> > +             dev_err(dev, "failed to enable clocks\n");
> > +             return ret;
> > +     }
> > +
> > +     reset_control_deassert(priv->rst_noc);
> > +
> > +     for (i =3D 0; i < priv->devtype_data->reg_save_size; i++)
> > +             regmap_write(priv->regmap_cru,
> > +                          devtype_data->reg_save[i][0],
> > + devtype_data->reg_save[i][1]);
>=20
> Where's the locking?
Will add the lock.

Thanks for you kindly review, I will fix most of the issues and send out th=
e v2 after sanity test.

Joakim
