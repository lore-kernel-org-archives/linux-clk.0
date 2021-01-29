Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3302C433DB
	for <linux-clk@archiver.kernel.org>; Fri, 29 Jan 2021 04:10:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0E9564DFF
	for <linux-clk@archiver.kernel.org>; Fri, 29 Jan 2021 04:10:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbhA2EKj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Jan 2021 23:10:39 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:31563 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbhA2EKg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Jan 2021 23:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611893433; x=1643429433;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=SpSw0lHxfXII3pZI045Q+dZ4mEE5r0/N2blwHtUSXbU=;
  b=UArJgPnlQ/rqXkDUdck3q6zykl22w/T3TM5+nICVKowTbFGeHRGu4YxA
   OTYfs1feAvp+hIv0sviI6TsGtZWmBcmkrhCnX1ByRo2+NI4pjc9U3/O6S
   YbNSGw7b9IygxxA/Li/GpiVbInDHKa3JZeaje2u9Kin3yobY6mevXOour
   7EGkrcTAi00jBini1jAkxXWTfr0QzrVtGDJiMWK9ns756sYLsmBH4Z2It
   wkbJ5gU+UT/zl93SmAhXrXM28RwPCVWPUcD6JY3uBQ1I54LF6lunlvJD1
   NxoWSTls7IOrtgSad2bZPy+2y0hWoZfl/nFR///lXwTwNLie0YpMCKryR
   Q==;
IronPort-SDR: LxhoAnMi9gg/IRP4G6jD6Z+YtK/zS1CyFI5ZF1RzEiUP52K6h4M378E5OL76F/OvWzR7gyf56v
 Q4Xm6LGzevJ06sqf8mmxj0q9Mb+DeLsBM2n1Z7REyzjfY0xmsetDkr9rS1pX92bqXyRp5EMiI8
 a3ZE/Tckrkg4FZJRkLEGrXTc0MU76a6b7LVLlD856phc96GIr8s6L2n7CsbsYgNYpTKty7PPoh
 gHJicfu69cBbOB+GbG4GelqXp3HUvX6cfB4Aao8HFmDhlJDx0FM1iInpAZafz/zPEAYpm1iDse
 1p0=
X-IronPort-AV: E=Sophos;i="5.79,384,1602518400"; 
   d="scan'208";a="163050299"
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
  by ob1.hgst.iphmx.com with ESMTP; 29 Jan 2021 12:09:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnUlTNjuJ6fzlt3YkjABpj7m1Xtg9eOQ4Uddv94Dgg8H7852/kcZfnHsmvFfLGNdaZSHfm+EK8+ajo+w7Ai+3xpFgCcUWbjjo7wregyXm+v+9LGBHz0VMaiyFuwdQKjGYGGe+0gMltE8BXLYPnmwJHre5SF7+tpe5xapZsPi9pnsBFmFoA95+HweGKCn8WXjzU83Zr3IoRvJv2eHpruNygj3tC0IZy/UgfDdlU/BF9VXor1OULJAKV1dzqpQNvT2y5Rbj5F38iB42UfmaBzOCF4jKe7sbqk6zQM9GJyPkOC50BC05oyXZOdRfNOZUdUOsHdQqfI0drRqIbcwvpjD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIAI05ouxltl+z7cVgLsFr6Mxktj2I/ysJrU4cCHuDg=;
 b=BJTiEmXil7RkkhH5akEBOhCo4m4dD5YL6ZrgzWkn0ajOa51rBEQ1kAQiyU2sb9GOmFMftaDofLOpptij2jznFb6ayzfv7qoJgsFb6scwuJslB/uGZJXOTm2LPZmsz/BRZl8TquB1Rw48czzITP9kqrYuAoOPkZCHMgUMQGecRWevrZJnB9PkuWiZVZpfAp/bEOW6hiF4RtoUv4ApZQIYovMHpmF6xwjtsnI4tpukBsZN4d4UN7UKouflkFyZdY9wiVhgBUxSaEXGbZ3v6k1C6exBWfpBZ8jtBhEfbK19Wrsl+VBjFk1ZnoILVaVKiSefxhVsso3tofp13Ci6Z34BGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIAI05ouxltl+z7cVgLsFr6Mxktj2I/ysJrU4cCHuDg=;
 b=OP3Q1XBJSvQX346M7ydhH7HCeYs2b3cUNL7ufPfA53jUwzAgWHxPw6eZrhjwb0V3mfHNu1KYWv2wyjBLR0Q7FJpB37inc0gI81Di8eYt5T3zzRAPGCke5OMwUfXJJWNKcH5leRtIwAiwAZD/2aCNk9GWe1qpGHnPz524m+4J1Po=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6757.namprd04.prod.outlook.com (2603:10b6:610:98::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Fri, 29 Jan
 2021 04:09:24 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::c55b:77e5:fa05:3db0]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::c55b:77e5:fa05:3db0%6]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 04:09:24 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC:     Sean Anderson <seanga2@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v13 01/17] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v13 01/17] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW7T4M5lVOShVlf0aMYmOIexNLQQ==
Date:   Fri, 29 Jan 2021 04:09:24 +0000
Message-ID: <CH2PR04MB6522BC13D0525FDF148783EEE7B99@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20210118020244.103451-1-damien.lemoal@wdc.com>
 <20210118020244.103451-2-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:ac6f:3863:44b0:5059]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b7093237-32c3-4747-5d6f-08d8c40ba9f3
x-ms-traffictypediagnostic: CH2PR04MB6757:
x-microsoft-antispam-prvs: <CH2PR04MB6757E1549A2F1E08E2748DD2E7B99@CH2PR04MB6757.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s+vnzYm2lkg9p+1IY9IH52uHlNLZLKh7DNFDbomSOYn0BraxPMRdrxF7gG0icpocuFfTex749XIee2xdIoej0RggbxZKnm0F762nUFyy8+/gCH3bMrxUoY/XaNFr5zCLUncU8mA0eLp5fzanQ4a1Dc7wLeNAQKt18vRHTXJ1E79EI1G7hZ+qHrvELhV1jwj0GXFk8zFyKmwc5bs6TjJy/Fltm63TdBL19UVKd0NN9OZqoNPbSiEJ/jLqYu1RSpKqlWHhWcyJ0BwssegSByGe5RpFzwTAgJMJfnaVNXa4pZwnTGZmrfcK74jslRLe7cdGqsQryjubI/hDoQfrXzGOWE5uR/3Q5k7/HfW+cWPhMzySS61BrZjQCgU/k+JGUZvxXIGhwR8aJCFNJVwwHKM5RZMJwEuC7SBC9tUFuVsHYQoIOKyc44jkPjpFovd4usgqPi/seixHTZMUVSLCB4oqu3d98G6u3IqqfHsOYTQaphYEDQrX+tsvyLrLZt37CDVCU6niftoTHHXa8EBLFz64dA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(110136005)(478600001)(53546011)(8936002)(30864003)(8676002)(83380400001)(71200400001)(33656002)(66946007)(9686003)(66556008)(66446008)(86362001)(2906002)(7696005)(6506007)(4326008)(55016002)(66476007)(54906003)(91956017)(5660300002)(186003)(76116006)(52536014)(316002)(64756008)(579004)(559001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ujrRn+zaR4eskytC+wBRcXiC3ncX+hRK6FJ8zzi0T4WLSylltl0zYBAC6ejl?=
 =?us-ascii?Q?h0F+pPrvCKZSoRpJ3EITPxMPahxbqVsKSK0/bRH2JZwU3EhnyUUSNIfONG9n?=
 =?us-ascii?Q?bSboOw7ELB5Ww5kxU4MWrsMg1JMgh+TJ21Dy94RTOVrMP6tfHLKvKOBe0fwE?=
 =?us-ascii?Q?T2px9i6ad0rROKl6FOPx80/V2hD2gWNAvsmAyZv0+jSSv96XCpnlkvaSK0Mo?=
 =?us-ascii?Q?mAbeVIXxQAD8eMEiHmyeL+bK3fwIwZHcC1jG/X40twHDEHGbU1U6xO4k/DjM?=
 =?us-ascii?Q?FHGJYGom5F4TXyKoeZ8Bkmn0Fc78oVyUQK/qJkPHlBtsX9p4bbM0W+HzFmZi?=
 =?us-ascii?Q?WAoSw21JkhcDhhvs621OGFKSRArJK6H/hkbLnHjeUo8jTOpKjX01lVtQsfdR?=
 =?us-ascii?Q?GWETywUbiTZSQAsrlorIJTf47DCKHTmv386rkHR04FA59wE4hJs/e7O+mvu9?=
 =?us-ascii?Q?TiL94B4RxtIZtEP+xzsVxI6hQ04flU292YaBaRDcn2ApZcnQhQ319ymE8WLc?=
 =?us-ascii?Q?ptNs9yaLFkx7hAAi3NifV91Hy0QKic0Y7QRdSpc72mjdc+YIHmGHJTFXt0on?=
 =?us-ascii?Q?b3fik0GrYvAL0uC3xLFHj7S6RMCskRnYT6hzuwIGbdLfcnvG5NdD+eIFQ1fG?=
 =?us-ascii?Q?hqFbXhwgdbQQ6YNBAJijHJ8YD9aCLXxF7r0/L4a8nh1rtRd/BNO3mEoF89hT?=
 =?us-ascii?Q?FDZKbb4mVaHf74EMbILyqXGzkCvi/aOL0Wj0me/MBa0woaxwSiYsvmxZXC7p?=
 =?us-ascii?Q?t7eOOjEbzcrzCAi8UlqpXbXt6Cb7AnpUg15Ls3t7DwiPCZQXNuuJtXj161UE?=
 =?us-ascii?Q?7YH2QK4UDq16lSqRibfVztayJcmh/UItIGY0kg/KFEPcx/hsAFQ5onN2HpR2?=
 =?us-ascii?Q?qwbLLWoZlkAl5HsS0ONYPC0ZJ2YkUBmqXzfPuRIf8KXjlTIFK90nVfDg9M62?=
 =?us-ascii?Q?oF+tVunRWCvFMlL8Z7XjXdxCJX02Aq9Lr5xCmJi0fNi6Qk43xh53wsf62Xqf?=
 =?us-ascii?Q?TcJ9ZcD6a5jqK5tbNAyHBOzjgeWay+5XgZNl5hGH87QwU6vZvtteEDV0u4jA?=
 =?us-ascii?Q?7K6BRmjYVmVLwojLAZyxdxrRpO893x6njym2kvgy/CEDMybn7lYhaeN8EDha?=
 =?us-ascii?Q?MYd6voaJZF0fsjFpkAz3qrBe4T23u+omjw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7093237-32c3-4747-5d6f-08d8c40ba9f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2021 04:09:24.6474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eii+6O3T9cJJPRXqJxtBtjbvbBn1oUcMKwNk7fy1dByYGBF+Ki6BQFliGw532R/9qDmDebWOIM9+kx3l30Cj8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6757
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2021/01/18 11:03, Damien Le Moal wrote:=0A=
> Add a clock provider driver for the Canaan Kendryte K210 RISC-V SoC.=0A=
> This new driver with the compatible string "canaan,k210-clk" implements=
=0A=
> support for the full clock structure of the K210 SoC. Since it is=0A=
> required for the correct operation of the SoC, this driver is=0A=
> selected by default for compilation when the SOC_CANAAN option is=0A=
> selected.=0A=
> =0A=
> With this change, the k210-sysctl driver is turned into a simple=0A=
> platform driver which enables its power bus clock and triggers=0A=
> populating its child nodes. The sysctl driver retains the SOC early=0A=
> initialization code, but the implementation now relies on the new=0A=
> function k210_clk_early_init() provided by the new clk-k210 driver.=0A=
> =0A=
> The clock structure implemented and many of the coding ideas for the=0A=
> driver come from the work by Sean Anderson on the K210 support for the=0A=
> U-Boot project.=0A=
=0A=
Hi Stephen,=0A=
=0A=
Could you please review this patch ? I really would like this series queued=
 up=0A=
for 5.12 so that the K210 support is finally completed. And this patch is=
=0A=
mandatory for this to happen.=0A=
=0A=
Thanks !=0A=
=0A=
> =0A=
> Cc: Stephen Boyd <sboyd@kernel.org>=0A=
> Cc: Michael Turquette <mturquette@baylibre.com>=0A=
> Cc: linux-clk@vger.kernel.org=0A=
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>=0A=
> ---=0A=
>  MAINTAINERS                      |    1 +=0A=
>  drivers/clk/Kconfig              |    8 +=0A=
>  drivers/clk/Makefile             |    1 +=0A=
>  drivers/clk/clk-k210.c           | 1012 ++++++++++++++++++++++++++++++=
=0A=
>  drivers/soc/canaan/Kconfig       |   18 +-=0A=
>  drivers/soc/canaan/Makefile      |    2 +-=0A=
>  drivers/soc/canaan/k210-sysctl.c |  205 ++----=0A=
>  include/soc/canaan/k210-sysctl.h |    2 +=0A=
>  8 files changed, 1071 insertions(+), 178 deletions(-)=0A=
>  create mode 100644 drivers/clk/clk-k210.c=0A=
> =0A=
> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
> index d56f32b0140b..d5559d325088 100644=0A=
> --- a/MAINTAINERS=0A=
> +++ b/MAINTAINERS=0A=
> @@ -3870,6 +3870,7 @@ CANAAN/KENDRYTE K210 SOC SYSTEM CONTROLLER DRIVER=
=0A=
>  M:	Damien Le Moal <damien.lemoal@wdc.com>=0A=
>  L:	linux-riscv@lists.infradead.org=0A=
>  S:	Maintained=0A=
> +F:	Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml=0A=
>  F:	drivers/soc/canaan/=0A=
>  F:	include/soc/canaan/=0A=
>  =0A=
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig=0A=
> index 85856cff506c..cb971f6632e2 100644=0A=
> --- a/drivers/clk/Kconfig=0A=
> +++ b/drivers/clk/Kconfig=0A=
> @@ -368,6 +368,14 @@ config COMMON_CLK_FIXED_MMIO=0A=
>  	help=0A=
>  	  Support for Memory Mapped IO Fixed clocks=0A=
>  =0A=
> +config COMMON_CLK_K210=0A=
> +	bool "Clock driver for the Canaan Kendryte K210 SoC"=0A=
> +	depends on COMMON_CLK && OF=0A=
> +	depends on RISCV && SOC_CANAAN=0A=
> +	default SOC_CANAAN=0A=
> +	help=0A=
> +	  Support for the Canaan Kendryte K210 RISC-V SoC clocks.=0A=
> +=0A=
>  source "drivers/clk/actions/Kconfig"=0A=
>  source "drivers/clk/analogbits/Kconfig"=0A=
>  source "drivers/clk/baikal-t1/Kconfig"=0A=
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile=0A=
> index dbdc590e7de3..5f8f9f135df5 100644=0A=
> --- a/drivers/clk/Makefile=0A=
> +++ b/drivers/clk/Makefile=0A=
> @@ -37,6 +37,7 @@ obj-$(CONFIG_COMMON_CLK_ASPEED)		+=3D clk-aspeed.o=0A=
>  obj-$(CONFIG_MACH_ASPEED_G6)		+=3D clk-ast2600.o=0A=
>  obj-$(CONFIG_ARCH_HIGHBANK)		+=3D clk-highbank.o=0A=
>  obj-$(CONFIG_CLK_HSDK)			+=3D clk-hsdk-pll.o=0A=
> +obj-$(CONFIG_COMMON_CLK_K210)		+=3D clk-k210.o=0A=
>  obj-$(CONFIG_COMMON_CLK_LOCHNAGAR)	+=3D clk-lochnagar.o=0A=
>  obj-$(CONFIG_COMMON_CLK_MAX77686)	+=3D clk-max77686.o=0A=
>  obj-$(CONFIG_COMMON_CLK_MAX9485)	+=3D clk-max9485.o=0A=
> diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c=0A=
> new file mode 100644=0A=
> index 000000000000..429db4904ad6=0A=
> --- /dev/null=0A=
> +++ b/drivers/clk/clk-k210.c=0A=
> @@ -0,0 +1,1012 @@=0A=
> +// SPDX-License-Identifier: GPL-2.0-or-later=0A=
> +/*=0A=
> + * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>=0A=
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.=0A=
> + */=0A=
> +#define pr_fmt(fmt)     "k210-clk: " fmt=0A=
> +=0A=
> +#include <linux/io.h>=0A=
> +#include <linux/slab.h>=0A=
> +#include <linux/spinlock.h>=0A=
> +#include <linux/platform_device.h>=0A=
> +#include <linux/of.h>=0A=
> +#include <linux/of_clk.h>=0A=
> +#include <linux/of_platform.h>=0A=
> +#include <linux/of_address.h>=0A=
> +#include <linux/clk-provider.h>=0A=
> +#include <linux/bitfield.h>=0A=
> +#include <linux/delay.h>=0A=
> +#include <asm/soc.h>=0A=
> +#include <soc/canaan/k210-sysctl.h>=0A=
> +=0A=
> +#include <dt-bindings/clock/k210-clk.h>=0A=
> +=0A=
> +/*=0A=
> + * Clocks parameters.=0A=
> + */=0A=
> +struct k210_sysclk;=0A=
> +=0A=
> +struct k210_clk {=0A=
> +	int id;=0A=
> +	struct k210_sysclk *ksc;=0A=
> +	struct clk_hw hw;=0A=
> +};=0A=
> +=0A=
> +struct k210_clk_cfg {=0A=
> +	const char *name;=0A=
> +	u8 gate_reg;=0A=
> +	u8 gate_bit;=0A=
> +	u8 div_reg;=0A=
> +	u8 div_shift;=0A=
> +	u8 div_width;=0A=
> +	u8 div_type;=0A=
> +	u8 mux_reg;=0A=
> +	u8 mux_bit;=0A=
> +};=0A=
> +=0A=
> +enum k210_clk_div_type {=0A=
> +	K210_DIV_NONE,=0A=
> +	K210_DIV_ONE_BASED,=0A=
> +	K210_DIV_DOUBLE_ONE_BASED,=0A=
> +	K210_DIV_POWER_OF_TWO,=0A=
> +};=0A=
> +=0A=
> +#define K210_GATE(_reg, _bit)	\=0A=
> +	.gate_reg =3D (_reg),	\=0A=
> +	.gate_bit =3D (_bit)=0A=
> +#define K210_DIV(_reg, _shift, _width, _type)	\=0A=
> +	.div_reg =3D (_reg),			\=0A=
> +	.div_shift =3D (_shift),			\=0A=
> +	.div_width =3D (_width),			\=0A=
> +	.div_type =3D (_type)=0A=
> +#define K210_MUX(_reg, _bit)	\=0A=
> +	.mux_reg =3D (_reg),	\=0A=
> +	.mux_bit =3D (_bit)=0A=
> +=0A=
> +static struct k210_clk_cfg k210_clk_cfgs[K210_NUM_CLKS] =3D {=0A=
> +=0A=
> +	/* Gated clocks, no mux, no divider */=0A=
> +	[K210_CLK_CPU] =3D {=0A=
> +		.name =3D "cpu",=0A=
> +		K210_GATE(K210_SYSCTL_EN_CENT, 0)=0A=
> +	},=0A=
> +	[K210_CLK_DMA] =3D {=0A=
> +		.name =3D "dma",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 1)=0A=
> +	},=0A=
> +	[K210_CLK_FFT] =3D {=0A=
> +		.name =3D "fft",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 4)=0A=
> +	},=0A=
> +	[K210_CLK_GPIO] =3D {=0A=
> +		.name =3D "gpio",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 5)=0A=
> +	},=0A=
> +	[K210_CLK_UART1] =3D {=0A=
> +		.name =3D "uart1",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 16)=0A=
> +	},=0A=
> +	[K210_CLK_UART2] =3D {=0A=
> +		.name =3D "uart2",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 17)=0A=
> +	},=0A=
> +	[K210_CLK_UART3] =3D {=0A=
> +		.name =3D "uart3",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 18)=0A=
> +	},=0A=
> +	[K210_CLK_FPIOA] =3D {=0A=
> +		.name =3D "fpioa",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 20)=0A=
> +	},=0A=
> +	[K210_CLK_SHA] =3D {=0A=
> +		.name =3D "sha",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 26)=0A=
> +	},=0A=
> +	[K210_CLK_AES] =3D {=0A=
> +		.name =3D "aes",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 19)=0A=
> +	},=0A=
> +	[K210_CLK_OTP] =3D {=0A=
> +		.name =3D "otp",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 27)=0A=
> +	},=0A=
> +	[K210_CLK_RTC] =3D {=0A=
> +		.name =3D "rtc",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 29)=0A=
> +	},=0A=
> +=0A=
> +	/* Gated divider clocks */=0A=
> +	[K210_CLK_SRAM0] =3D {=0A=
> +		.name =3D "sram0",=0A=
> +		K210_GATE(K210_SYSCTL_EN_CENT, 1),=0A=
> +		K210_DIV(K210_SYSCTL_THR0, 0, 4, K210_DIV_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_SRAM1] =3D {=0A=
> +		.name =3D "sram1",=0A=
> +		K210_GATE(K210_SYSCTL_EN_CENT, 2),=0A=
> +		K210_DIV(K210_SYSCTL_THR0, 4, 4, K210_DIV_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_ROM] =3D {=0A=
> +		.name =3D "rom",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 0),=0A=
> +		K210_DIV(K210_SYSCTL_THR0, 16, 4, K210_DIV_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_DVP] =3D {=0A=
> +		.name =3D "dvp",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 3),=0A=
> +		K210_DIV(K210_SYSCTL_THR0, 12, 4, K210_DIV_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_APB0] =3D {=0A=
> +		.name =3D "apb0",=0A=
> +		K210_GATE(K210_SYSCTL_EN_CENT, 3),=0A=
> +		K210_DIV(K210_SYSCTL_SEL0, 3, 3, K210_DIV_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_APB1] =3D {=0A=
> +		.name =3D "apb1",=0A=
> +		K210_GATE(K210_SYSCTL_EN_CENT, 4),=0A=
> +		K210_DIV(K210_SYSCTL_SEL0, 6, 3, K210_DIV_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_APB2] =3D {=0A=
> +		.name =3D "apb2",=0A=
> +		K210_GATE(K210_SYSCTL_EN_CENT, 5),=0A=
> +		K210_DIV(K210_SYSCTL_SEL0, 9, 3, K210_DIV_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_AI] =3D {=0A=
> +		.name =3D "ai",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 2),=0A=
> +		K210_DIV(K210_SYSCTL_THR0, 8, 4, K210_DIV_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_SPI0] =3D {=0A=
> +		.name =3D "spi0",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 6),=0A=
> +		K210_DIV(K210_SYSCTL_THR1, 0, 8, K210_DIV_DOUBLE_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_SPI1] =3D {=0A=
> +		.name =3D "spi1",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 7),=0A=
> +		K210_DIV(K210_SYSCTL_THR1, 8, 8, K210_DIV_DOUBLE_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_SPI2] =3D {=0A=
> +		.name =3D "spi2",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 8),=0A=
> +		K210_DIV(K210_SYSCTL_THR1, 16, 8, K210_DIV_DOUBLE_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_I2C0] =3D {=0A=
> +		.name =3D "i2c0",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 13),=0A=
> +		K210_DIV(K210_SYSCTL_THR5, 8, 8, K210_DIV_DOUBLE_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_I2C1] =3D {=0A=
> +		.name =3D "i2c1",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 14),=0A=
> +		K210_DIV(K210_SYSCTL_THR5, 16, 8, K210_DIV_DOUBLE_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_I2C2] =3D {=0A=
> +		.name =3D "i2c2",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 15),=0A=
> +		K210_DIV(K210_SYSCTL_THR5, 24, 8, K210_DIV_DOUBLE_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_WDT0] =3D {=0A=
> +		.name =3D "wdt0",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 24),=0A=
> +		K210_DIV(K210_SYSCTL_THR6, 0, 8, K210_DIV_DOUBLE_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_WDT1] =3D {=0A=
> +		.name =3D "wdt1",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 25),=0A=
> +		K210_DIV(K210_SYSCTL_THR6, 8, 8, K210_DIV_DOUBLE_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_I2S0] =3D {=0A=
> +		.name =3D "i2s0",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 10),=0A=
> +		K210_DIV(K210_SYSCTL_THR3, 0, 16, K210_DIV_DOUBLE_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_I2S1] =3D {=0A=
> +		.name =3D "i2s1",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 11),=0A=
> +		K210_DIV(K210_SYSCTL_THR3, 16, 16, K210_DIV_DOUBLE_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_I2S2] =3D {=0A=
> +		.name =3D "i2s2",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 12),=0A=
> +		K210_DIV(K210_SYSCTL_THR4, 0, 16, K210_DIV_DOUBLE_ONE_BASED)=0A=
> +	},=0A=
> +=0A=
> +	/* Divider clocks, no gate, no mux */=0A=
> +	[K210_CLK_I2S0_M] =3D {=0A=
> +		.name =3D "i2s0_m",=0A=
> +		K210_DIV(K210_SYSCTL_THR4, 16, 8, K210_DIV_DOUBLE_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_I2S1_M] =3D {=0A=
> +		.name =3D "i2s1_m",=0A=
> +		K210_DIV(K210_SYSCTL_THR4, 24, 8, K210_DIV_DOUBLE_ONE_BASED)=0A=
> +	},=0A=
> +	[K210_CLK_I2S2_M] =3D {=0A=
> +		.name =3D "i2s2_m",=0A=
> +		K210_DIV(K210_SYSCTL_THR4, 0, 8, K210_DIV_DOUBLE_ONE_BASED)=0A=
> +	},=0A=
> +=0A=
> +	/* Muxed gated divider clocks */=0A=
> +	[K210_CLK_SPI3] =3D {=0A=
> +		.name =3D "spi3",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 9),=0A=
> +		K210_DIV(K210_SYSCTL_THR1, 24, 8, K210_DIV_DOUBLE_ONE_BASED),=0A=
> +		K210_MUX(K210_SYSCTL_SEL0, 12)=0A=
> +	},=0A=
> +	[K210_CLK_TIMER0] =3D {=0A=
> +		.name =3D "timer0",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 21),=0A=
> +		K210_DIV(K210_SYSCTL_THR2,  0, 8, K210_DIV_DOUBLE_ONE_BASED),=0A=
> +		K210_MUX(K210_SYSCTL_SEL0, 13)=0A=
> +	},=0A=
> +	[K210_CLK_TIMER1] =3D {=0A=
> +		.name =3D "timer1",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 22),=0A=
> +		K210_DIV(K210_SYSCTL_THR2, 8, 8, K210_DIV_DOUBLE_ONE_BASED),=0A=
> +		K210_MUX(K210_SYSCTL_SEL0, 14)=0A=
> +	},=0A=
> +	[K210_CLK_TIMER2] =3D {=0A=
> +		.name =3D "timer2",=0A=
> +		K210_GATE(K210_SYSCTL_EN_PERI, 23),=0A=
> +		K210_DIV(K210_SYSCTL_THR2, 16, 8, K210_DIV_DOUBLE_ONE_BASED),=0A=
> +		K210_MUX(K210_SYSCTL_SEL0, 15)=0A=
> +	},=0A=
> +};=0A=
> +=0A=
> +/*=0A=
> + * PLL control register bits.=0A=
> + */=0A=
> +#define K210_PLL_CLKR		GENMASK(3, 0)=0A=
> +#define K210_PLL_CLKF		GENMASK(9, 4)=0A=
> +#define K210_PLL_CLKOD		GENMASK(13, 10)=0A=
> +#define K210_PLL_BWADJ		GENMASK(19, 14)=0A=
> +#define K210_PLL_RESET		(1 << 20)=0A=
> +#define K210_PLL_PWRD		(1 << 21)=0A=
> +#define K210_PLL_INTFB		(1 << 22)=0A=
> +#define K210_PLL_BYPASS		(1 << 23)=0A=
> +#define K210_PLL_TEST		(1 << 24)=0A=
> +#define K210_PLL_EN		(1 << 25)=0A=
> +#define K210_PLL_SEL		GENMASK(27, 26) /* PLL2 only */=0A=
> +=0A=
> +/*=0A=
> + * PLL lock register bits.=0A=
> + */=0A=
> +#define K210_PLL_LOCK		0=0A=
> +#define K210_PLL_CLEAR_SLIP	2=0A=
> +#define K210_PLL_TEST_OUT	3=0A=
> +=0A=
> +/*=0A=
> + * Clock selector register bits.=0A=
> + */=0A=
> +#define K210_ACLK_SEL		BIT(0)=0A=
> +#define K210_ACLK_DIV		GENMASK(2, 1)=0A=
> +=0A=
> +/*=0A=
> + * PLLs.=0A=
> + */=0A=
> +enum k210_pll_id {=0A=
> +	K210_PLL0, K210_PLL1, K210_PLL2, K210_PLL_NUM=0A=
> +};=0A=
> +=0A=
> +struct k210_pll {=0A=
> +	enum k210_pll_id id;=0A=
> +	struct k210_sysclk *ksc;=0A=
> +	void __iomem *base;=0A=
> +	void __iomem *reg;=0A=
> +	void __iomem *lock;=0A=
> +	u8 lock_shift;=0A=
> +	u8 lock_width;=0A=
> +	struct clk_hw hw;=0A=
> +};=0A=
> +#define to_k210_pll(_hw)	container_of(_hw, struct k210_pll, hw)=0A=
> +=0A=
> +/*=0A=
> + * PLLs configuration: by default PLL0 runs at 780 MHz and PLL1 at 299 M=
Hz.=0A=
> + * The first 2 SRAM banks depend on ACLK/CPU clock which is by default P=
LL0=0A=
> + * rate divided by 2. Set PLL1 to 390 MHz so that the third SRAM bank ha=
s the=0A=
> + * same clock as the first 2.=0A=
> + */=0A=
> +struct k210_pll_cfg {=0A=
> +	u32 reg;=0A=
> +	u8 lock_shift;=0A=
> +	u8 lock_width;=0A=
> +	u32 r;=0A=
> +	u32 f;=0A=
> +	u32 od;=0A=
> +	u32 bwadj;=0A=
> +};=0A=
> +=0A=
> +static struct k210_pll_cfg k210_plls_cfg[] =3D {=0A=
> +	{ K210_SYSCTL_PLL0,  0, 2, 0, 59, 1, 59 }, /* 780 MHz */=0A=
> +	{ K210_SYSCTL_PLL1,  8, 1, 0, 59, 3, 59 }, /* 390 MHz */=0A=
> +	{ K210_SYSCTL_PLL2, 16, 1, 0, 22, 1, 22 }, /* 299 MHz */=0A=
> +};=0A=
> +=0A=
> +/**=0A=
> + * struct k210_sysclk - sysclk driver data=0A=
> + * @node: device node=0A=
> + * @regs: system controller registers start address=0A=
> + * @clk_lock: clock setting spinlock=0A=
> + * @plls: SoC PLLs descriptors=0A=
> + * @aclk: ACLK clock=0A=
> + * @clks: All other clocks=0A=
> + */=0A=
> +struct k210_sysclk {=0A=
> +	struct device_node		*node;=0A=
> +	void __iomem			*regs;=0A=
> +	spinlock_t			clk_lock;=0A=
> +	struct k210_pll			plls[K210_PLL_NUM];=0A=
> +	struct clk_hw			aclk;=0A=
> +	struct k210_clk			clks[K210_NUM_CLKS];=0A=
> +};=0A=
> +=0A=
> +#define to_k210_sysclk(_hw)	container_of(_hw, struct k210_sysclk, aclk)=
=0A=
> +=0A=
> +/*=0A=
> + * Set ACLK parent selector: 0 for IN0, 1 for PLL0.=0A=
> + */=0A=
> +static void k210_aclk_set_selector(void __iomem *regs, u8 sel)=0A=
> +{=0A=
> +	u32 reg =3D readl(regs + K210_SYSCTL_SEL0);=0A=
> +=0A=
> +	if (sel)=0A=
> +		reg |=3D K210_ACLK_SEL;=0A=
> +	else=0A=
> +		reg &=3D K210_ACLK_SEL;=0A=
> +	writel(reg, regs + K210_SYSCTL_SEL0);=0A=
> +}=0A=
> +=0A=
> +static void k210_init_pll(void __iomem *regs, enum k210_pll_id pllid,=0A=
> +			  struct k210_pll *pll)=0A=
> +{=0A=
> +	pll->id =3D pllid;=0A=
> +	pll->reg =3D regs + k210_plls_cfg[pllid].reg;=0A=
> +	pll->lock =3D regs + K210_SYSCTL_PLL_LOCK;=0A=
> +	pll->lock_shift =3D k210_plls_cfg[pllid].lock_shift;=0A=
> +	pll->lock_width =3D k210_plls_cfg[pllid].lock_width;=0A=
> +}=0A=
> +=0A=
> +static void k210_pll_wait_for_lock(struct k210_pll *pll)=0A=
> +{=0A=
> +	u32 reg, mask =3D GENMASK(pll->lock_shift + pll->lock_width - 1,=0A=
> +				pll->lock_shift);=0A=
> +=0A=
> +	while (true) {=0A=
> +		reg =3D readl(pll->lock);=0A=
> +		if ((reg & mask) =3D=3D mask)=0A=
> +			break;=0A=
> +=0A=
> +		reg |=3D BIT(pll->lock_shift + K210_PLL_CLEAR_SLIP);=0A=
> +		writel(reg, pll->lock);=0A=
> +	}=0A=
> +}=0A=
> +=0A=
> +static bool k210_pll_hw_is_enabled(struct k210_pll *pll)=0A=
> +{=0A=
> +	u32 reg =3D readl(pll->reg);=0A=
> +	u32 mask =3D K210_PLL_PWRD | K210_PLL_EN;=0A=
> +=0A=
> +	if (reg & K210_PLL_RESET)=0A=
> +		return false;=0A=
> +=0A=
> +	return (reg & mask) =3D=3D mask;=0A=
> +}=0A=
> +=0A=
> +static void k210_pll_enable_hw(void __iomem *regs, struct k210_pll *pll)=
=0A=
> +{=0A=
> +	struct k210_pll_cfg *pll_cfg =3D &k210_plls_cfg[pll->id];=0A=
> +	u32 reg;=0A=
> +=0A=
> +	if (k210_pll_hw_is_enabled(pll))=0A=
> +		return;=0A=
> +=0A=
> +	/*=0A=
> +	 * For PLL0, we need to re-parent ACLK to IN0 to keep the CPU cores and=
=0A=
> +	 * SRAM running.=0A=
> +	 */=0A=
> +	if (pll->id =3D=3D K210_PLL0)=0A=
> +		k210_aclk_set_selector(regs, 0);=0A=
> +=0A=
> +	/* Set PLL factors */=0A=
> +	reg =3D readl(pll->reg);=0A=
> +	reg &=3D ~GENMASK(19, 0);=0A=
> +	reg |=3D FIELD_PREP(K210_PLL_CLKR, pll_cfg->r);=0A=
> +	reg |=3D FIELD_PREP(K210_PLL_CLKF, pll_cfg->f);=0A=
> +	reg |=3D FIELD_PREP(K210_PLL_CLKOD, pll_cfg->od);=0A=
> +	reg |=3D FIELD_PREP(K210_PLL_BWADJ, pll_cfg->bwadj);=0A=
> +	reg |=3D K210_PLL_PWRD;=0A=
> +	writel(reg, pll->reg);=0A=
> +=0A=
> +	/*=0A=
> +	 * Reset the PLL: ensure reset is low before asserting it.=0A=
> +	 * The magic NOPs come from the Kendryte reference SDK.=0A=
> +	 */=0A=
> +	reg &=3D ~K210_PLL_RESET;=0A=
> +	writel(reg, pll->reg);=0A=
> +	reg |=3D K210_PLL_RESET;=0A=
> +	writel(reg, pll->reg);=0A=
> +	nop();=0A=
> +	nop();=0A=
> +	reg &=3D ~K210_PLL_RESET;=0A=
> +	writel(reg, pll->reg);=0A=
> +=0A=
> +	k210_pll_wait_for_lock(pll);=0A=
> +=0A=
> +	reg &=3D ~K210_PLL_BYPASS;=0A=
> +	reg |=3D K210_PLL_EN;=0A=
> +	writel(reg, pll->reg);=0A=
> +=0A=
> +	if (pll->id =3D=3D K210_PLL0)=0A=
> +		k210_aclk_set_selector(regs, 1);=0A=
> +}=0A=
> +=0A=
> +static int k210_pll_enable(struct clk_hw *hw)=0A=
> +{=0A=
> +	struct k210_pll *pll =3D to_k210_pll(hw);=0A=
> +	struct k210_sysclk *ksc =3D pll->ksc;=0A=
> +	unsigned long flags;=0A=
> +=0A=
> +	spin_lock_irqsave(&ksc->clk_lock, flags);=0A=
> +=0A=
> +	k210_pll_enable_hw(ksc->regs, pll);=0A=
> +=0A=
> +	spin_unlock_irqrestore(&ksc->clk_lock, flags);=0A=
> +=0A=
> +	return 0;=0A=
> +}=0A=
> +=0A=
> +static void k210_pll_disable(struct clk_hw *hw)=0A=
> +{=0A=
> +	struct k210_pll *pll =3D to_k210_pll(hw);=0A=
> +	struct k210_sysclk *ksc =3D pll->ksc;=0A=
> +	unsigned long flags;=0A=
> +	u32 reg;=0A=
> +=0A=
> +	/*=0A=
> +	 * Bypassing before powering off is important so child clocks do not=0A=
> +	 * stop working. This is especially important for pll0, the indirect=0A=
> +	 * parent of the cpu clock.=0A=
> +	 */=0A=
> +	spin_lock_irqsave(&ksc->clk_lock, flags);=0A=
> +	reg =3D readl(pll->reg);=0A=
> +	reg |=3D K210_PLL_BYPASS;=0A=
> +	writel(reg, pll->reg);=0A=
> +=0A=
> +	reg &=3D ~K210_PLL_PWRD;=0A=
> +	reg &=3D ~K210_PLL_EN;=0A=
> +	writel(reg, pll->reg);=0A=
> +	spin_unlock_irqrestore(&ksc->clk_lock, flags);=0A=
> +}=0A=
> +=0A=
> +static int k210_pll_is_enabled(struct clk_hw *hw)=0A=
> +{=0A=
> +	return k210_pll_hw_is_enabled(to_k210_pll(hw));=0A=
> +}=0A=
> +=0A=
> +static unsigned long k210_pll_get_rate(struct clk_hw *hw,=0A=
> +				       unsigned long parent_rate)=0A=
> +{=0A=
> +	struct k210_pll *pll =3D to_k210_pll(hw);=0A=
> +	u32 reg =3D readl(pll->reg);=0A=
> +	u32 r, f, od;=0A=
> +=0A=
> +	if (reg & K210_PLL_BYPASS)=0A=
> +		return parent_rate;=0A=
> +=0A=
> +	if (!(reg & K210_PLL_PWRD))=0A=
> +		return 0;=0A=
> +=0A=
> +	r =3D FIELD_GET(K210_PLL_CLKR, reg) + 1;=0A=
> +	f =3D FIELD_GET(K210_PLL_CLKF, reg) + 1;=0A=
> +	od =3D FIELD_GET(K210_PLL_CLKOD, reg) + 1;=0A=
> +=0A=
> +	return (u64)parent_rate * f / (r * od);=0A=
> +}=0A=
> +=0A=
> +static const struct clk_ops k210_pll_ops =3D {=0A=
> +	.enable		=3D k210_pll_enable,=0A=
> +	.disable	=3D k210_pll_disable,=0A=
> +	.is_enabled	=3D k210_pll_is_enabled,=0A=
> +	.recalc_rate	=3D k210_pll_get_rate,=0A=
> +};=0A=
> +=0A=
> +static int k210_pll2_set_parent(struct clk_hw *hw, u8 index)=0A=
> +{=0A=
> +	struct k210_pll *pll =3D to_k210_pll(hw);=0A=
> +	struct k210_sysclk *ksc =3D pll->ksc;=0A=
> +	unsigned long flags;=0A=
> +	u32 reg;=0A=
> +=0A=
> +	spin_lock_irqsave(&ksc->clk_lock, flags);=0A=
> +=0A=
> +	reg =3D readl(pll->reg);=0A=
> +	reg &=3D ~K210_PLL_SEL;=0A=
> +	reg |=3D FIELD_PREP(K210_PLL_SEL, index);=0A=
> +	writel(reg, pll->reg);=0A=
> +=0A=
> +	spin_unlock_irqrestore(&ksc->clk_lock, flags);=0A=
> +=0A=
> +	return 0;=0A=
> +}=0A=
> +=0A=
> +static u8 k210_pll2_get_parent(struct clk_hw *hw)=0A=
> +{=0A=
> +	struct k210_pll *pll =3D to_k210_pll(hw);=0A=
> +	u32 reg =3D readl(pll->reg);=0A=
> +=0A=
> +	return FIELD_GET(K210_PLL_SEL, reg);=0A=
> +}=0A=
> +=0A=
> +static const struct clk_ops k210_pll2_ops =3D {=0A=
> +	.enable		=3D k210_pll_enable,=0A=
> +	.disable	=3D k210_pll_disable,=0A=
> +	.is_enabled	=3D k210_pll_is_enabled,=0A=
> +	.recalc_rate	=3D k210_pll_get_rate,=0A=
> +	.set_parent	=3D k210_pll2_set_parent,=0A=
> +	.get_parent	=3D k210_pll2_get_parent,=0A=
> +};=0A=
> +=0A=
> +static int k210_register_pll(struct k210_sysclk *ksc, const char *in0,=
=0A=
> +			     enum k210_pll_id pllid, const char *name,=0A=
> +			     int num_parents, const struct clk_ops *ops)=0A=
> +{=0A=
> +	struct k210_pll *pll =3D &ksc->plls[pllid];=0A=
> +	struct clk_init_data init =3D {};=0A=
> +	const struct clk_parent_data parent_data[] =3D {=0A=
> +		{ .name =3D in0 },=0A=
> +		{ .hw =3D &ksc->plls[K210_PLL0].hw },=0A=
> +		{ .hw =3D &ksc->plls[K210_PLL1].hw },=0A=
> +	};=0A=
> +=0A=
> +	init.name =3D name;=0A=
> +	init.parent_data =3D parent_data;=0A=
> +	init.num_parents =3D num_parents;=0A=
> +	init.ops =3D ops;=0A=
> +=0A=
> +	pll->hw.init =3D &init;=0A=
> +	pll->ksc =3D ksc;=0A=
> +=0A=
> +	return clk_hw_register(NULL, &pll->hw);=0A=
> +}=0A=
> +=0A=
> +static int k210_register_plls(struct k210_sysclk *ksc, const char *in0)=
=0A=
> +{=0A=
> +	int i, ret;=0A=
> +=0A=
> +	for (i =3D 0; i < K210_PLL_NUM; i++)=0A=
> +		k210_init_pll(ksc->regs, i, &ksc->plls[i]);=0A=
> +=0A=
> +	/* PLL0 and PLL1 only have IN0 as parent */=0A=
> +	ret =3D k210_register_pll(ksc, in0, K210_PLL0, "pll0", 1, &k210_pll_ops=
);=0A=
> +	if (ret) {=0A=
> +		pr_err("%pOFP: register PLL0 failed\n", ksc->node);=0A=
> +		return ret;=0A=
> +	}=0A=
> +	ret =3D k210_register_pll(ksc, in0, K210_PLL1, "pll1", 1, &k210_pll_ops=
);=0A=
> +	if (ret) {=0A=
> +		pr_err("%pOFP: register PLL1 failed\n", ksc->node);=0A=
> +		return ret;=0A=
> +	}=0A=
> +=0A=
> +	/* PLL2 has IN0, PLL0 and PLL1 as parents */=0A=
> +	ret =3D k210_register_pll(ksc, in0, K210_PLL2, "pll2", 3, &k210_pll2_op=
s);=0A=
> +	if (ret) {=0A=
> +		pr_err("%pOFP: register PLL2 failed\n", ksc->node);=0A=
> +		return ret;=0A=
> +	}=0A=
> +=0A=
> +	return 0;=0A=
> +}=0A=
> +=0A=
> +static int k210_aclk_set_parent(struct clk_hw *hw, u8 index)=0A=
> +{=0A=
> +	struct k210_sysclk *ksc =3D to_k210_sysclk(hw);=0A=
> +	unsigned long flags;=0A=
> +=0A=
> +	spin_lock_irqsave(&ksc->clk_lock, flags);=0A=
> +=0A=
> +	k210_aclk_set_selector(ksc->regs, index);=0A=
> +=0A=
> +	spin_unlock_irqrestore(&ksc->clk_lock, flags);=0A=
> +=0A=
> +	return 0;=0A=
> +}=0A=
> +=0A=
> +static u8 k210_aclk_get_parent(struct clk_hw *hw)=0A=
> +{=0A=
> +	struct k210_sysclk *ksc =3D to_k210_sysclk(hw);=0A=
> +	u32 sel;=0A=
> +=0A=
> +	sel =3D readl(ksc->regs + K210_SYSCTL_SEL0) & K210_ACLK_SEL;=0A=
> +=0A=
> +	return sel ? 1 : 0;=0A=
> +}=0A=
> +=0A=
> +static unsigned long k210_aclk_get_rate(struct clk_hw *hw,=0A=
> +					unsigned long parent_rate)=0A=
> +{=0A=
> +	struct k210_sysclk *ksc =3D to_k210_sysclk(hw);=0A=
> +	u32 reg =3D readl(ksc->regs + K210_SYSCTL_SEL0);=0A=
> +	unsigned int shift;=0A=
> +=0A=
> +	if (!(reg & 0x1))=0A=
> +		return parent_rate;=0A=
> +=0A=
> +	shift =3D FIELD_GET(K210_ACLK_DIV, reg);=0A=
> +=0A=
> +	return parent_rate / (2UL << shift);=0A=
> +}=0A=
> +=0A=
> +static const struct clk_ops k210_aclk_ops =3D {=0A=
> +	.set_parent	=3D k210_aclk_set_parent,=0A=
> +	.get_parent	=3D k210_aclk_get_parent,=0A=
> +	.recalc_rate	=3D k210_aclk_get_rate,=0A=
> +};=0A=
> +=0A=
> +/*=0A=
> + * ACLK has IN0 and PLL0 as parents.=0A=
> + */=0A=
> +static int k210_register_aclk(struct k210_sysclk *ksc, const char *in0)=
=0A=
> +{=0A=
> +	struct clk_init_data init =3D {};=0A=
> +	const struct clk_parent_data parent_data[] =3D {=0A=
> +		{ .name =3D in0 },=0A=
> +		{ .hw =3D &ksc->plls[K210_PLL0].hw },=0A=
> +	};=0A=
> +	int ret;=0A=
> +=0A=
> +	init.name =3D "aclk";=0A=
> +	init.parent_data =3D parent_data;=0A=
> +	init.num_parents =3D 2;=0A=
> +	init.ops =3D &k210_aclk_ops;=0A=
> +	ksc->aclk.init =3D &init;=0A=
> +=0A=
> +	ret =3D clk_hw_register(NULL, &ksc->aclk);=0A=
> +	if (ret) {=0A=
> +		pr_err("%pOFP: register aclk failed\n", ksc->node);=0A=
> +		return ret;=0A=
> +	}=0A=
> +=0A=
> +	return 0;=0A=
> +}=0A=
> +=0A=
> +#define to_k210_clk(_hw)	container_of(_hw, struct k210_clk, hw)=0A=
> +=0A=
> +static int k210_clk_enable(struct clk_hw *hw)=0A=
> +{=0A=
> +	struct k210_clk *kclk =3D to_k210_clk(hw);=0A=
> +	struct k210_sysclk *ksc =3D kclk->ksc;=0A=
> +	struct k210_clk_cfg *cfg =3D &k210_clk_cfgs[kclk->id];=0A=
> +	unsigned long flags;=0A=
> +	u32 reg;=0A=
> +=0A=
> +	if (!cfg->gate_reg)=0A=
> +		return 0;=0A=
> +=0A=
> +	spin_lock_irqsave(&ksc->clk_lock, flags);=0A=
> +	reg =3D readl(ksc->regs + cfg->gate_reg);=0A=
> +	reg |=3D BIT(cfg->gate_bit);=0A=
> +	writel(reg, ksc->regs + cfg->gate_reg);=0A=
> +	spin_unlock_irqrestore(&ksc->clk_lock, flags);=0A=
> +=0A=
> +	return 0;=0A=
> +}=0A=
> +=0A=
> +static void k210_clk_disable(struct clk_hw *hw)=0A=
> +{=0A=
> +	struct k210_clk *kclk =3D to_k210_clk(hw);=0A=
> +	struct k210_sysclk *ksc =3D kclk->ksc;=0A=
> +	struct k210_clk_cfg *cfg =3D &k210_clk_cfgs[kclk->id];=0A=
> +	unsigned long flags;=0A=
> +	u32 reg;=0A=
> +=0A=
> +	if (!cfg->gate_reg)=0A=
> +		return;=0A=
> +=0A=
> +	spin_lock_irqsave(&ksc->clk_lock, flags);=0A=
> +	reg =3D readl(ksc->regs + cfg->gate_reg);=0A=
> +	reg &=3D ~BIT(cfg->gate_bit);=0A=
> +	writel(reg, ksc->regs + cfg->gate_reg);=0A=
> +	spin_unlock_irqrestore(&ksc->clk_lock, flags);=0A=
> +}=0A=
> +=0A=
> +static int k210_clk_set_parent(struct clk_hw *hw, u8 index)=0A=
> +{=0A=
> +	struct k210_clk *kclk =3D to_k210_clk(hw);=0A=
> +	struct k210_sysclk *ksc =3D kclk->ksc;=0A=
> +	struct k210_clk_cfg *cfg =3D &k210_clk_cfgs[kclk->id];=0A=
> +	unsigned long flags;=0A=
> +	u32 reg;=0A=
> +=0A=
> +	spin_lock_irqsave(&ksc->clk_lock, flags);=0A=
> +	reg =3D readl(ksc->regs + cfg->mux_reg);=0A=
> +	if (index)=0A=
> +		reg |=3D BIT(cfg->mux_bit);=0A=
> +	else=0A=
> +		reg &=3D ~BIT(cfg->mux_bit);=0A=
> +	spin_unlock_irqrestore(&ksc->clk_lock, flags);=0A=
> +=0A=
> +	return 0;=0A=
> +}=0A=
> +=0A=
> +static u8 k210_clk_get_parent(struct clk_hw *hw)=0A=
> +{=0A=
> +	struct k210_clk *kclk =3D to_k210_clk(hw);=0A=
> +	struct k210_sysclk *ksc =3D kclk->ksc;=0A=
> +	struct k210_clk_cfg *cfg =3D &k210_clk_cfgs[kclk->id];=0A=
> +	unsigned long flags;=0A=
> +	u32 reg, idx;=0A=
> +=0A=
> +	spin_lock_irqsave(&ksc->clk_lock, flags);=0A=
> +	reg =3D readl(ksc->regs + cfg->mux_reg);=0A=
> +	idx =3D (reg & BIT(cfg->mux_bit)) ? 1 : 0;=0A=
> +	spin_unlock_irqrestore(&ksc->clk_lock, flags);=0A=
> +=0A=
> +	return idx;=0A=
> +}=0A=
> +=0A=
> +static unsigned long k210_clk_get_rate(struct clk_hw *hw,=0A=
> +				       unsigned long parent_rate)=0A=
> +{=0A=
> +	struct k210_clk *kclk =3D to_k210_clk(hw);=0A=
> +	struct k210_sysclk *ksc =3D kclk->ksc;=0A=
> +	struct k210_clk_cfg *cfg =3D &k210_clk_cfgs[kclk->id];=0A=
> +	u32 reg, div_val;=0A=
> +=0A=
> +	if (!cfg->div_reg)=0A=
> +		return parent_rate;=0A=
> +=0A=
> +	reg =3D readl(ksc->regs + cfg->div_reg);=0A=
> +	div_val =3D (reg >> cfg->div_shift) & GENMASK(cfg->div_width - 1, 0);=
=0A=
> +=0A=
> +	switch (cfg->div_type) {=0A=
> +	case K210_DIV_ONE_BASED:=0A=
> +		return parent_rate / (div_val + 1);=0A=
> +	case K210_DIV_DOUBLE_ONE_BASED:=0A=
> +		return parent_rate / ((div_val + 1) * 2);=0A=
> +	case K210_DIV_POWER_OF_TWO:=0A=
> +		return parent_rate / (2UL << div_val);=0A=
> +	case K210_DIV_NONE:=0A=
> +	default:=0A=
> +		return 0;=0A=
> +	}=0A=
> +}=0A=
> +=0A=
> +static const struct clk_ops k210_clk_mux_ops =3D {=0A=
> +	.enable		=3D k210_clk_enable,=0A=
> +	.disable	=3D k210_clk_disable,=0A=
> +	.set_parent	=3D k210_clk_set_parent,=0A=
> +	.get_parent	=3D k210_clk_get_parent,=0A=
> +	.recalc_rate	=3D k210_clk_get_rate,=0A=
> +};=0A=
> +=0A=
> +static const struct clk_ops k210_clk_ops =3D {=0A=
> +	.enable		=3D k210_clk_enable,=0A=
> +	.disable	=3D k210_clk_disable,=0A=
> +	.recalc_rate	=3D k210_clk_get_rate,=0A=
> +};=0A=
> +=0A=
> +static void k210_register_clk(struct k210_sysclk *ksc, int id,=0A=
> +			      const struct clk_parent_data *parent_data,=0A=
> +			      int num_parents, unsigned long flags)=0A=
> +{=0A=
> +	struct k210_clk *kclk =3D &ksc->clks[id];=0A=
> +	struct clk_init_data init =3D {};=0A=
> +	int ret;=0A=
> +=0A=
> +	init.name =3D k210_clk_cfgs[id].name;=0A=
> +	init.flags =3D flags;=0A=
> +	init.parent_data =3D parent_data;=0A=
> +	init.num_parents =3D num_parents;=0A=
> +	if (num_parents > 1)=0A=
> +		init.ops =3D &k210_clk_mux_ops;=0A=
> +	else=0A=
> +		init.ops =3D &k210_clk_ops;=0A=
> +=0A=
> +	kclk->id =3D id;=0A=
> +	kclk->ksc =3D ksc;=0A=
> +	kclk->hw.init =3D &init;=0A=
> +=0A=
> +	ret =3D clk_hw_register(NULL, &kclk->hw);=0A=
> +	if (ret) {=0A=
> +		pr_err("%pOFP: register clock %s failed\n",=0A=
> +		       ksc->node, k210_clk_cfgs[id].name);=0A=
> +		kclk->id =3D -1;=0A=
> +	}=0A=
> +}=0A=
> +=0A=
> +/*=0A=
> + * All muxed clocks have IN0 and PLL0 as parents.=0A=
> + */=0A=
> +static inline void k210_register_mux_clk(struct k210_sysclk *ksc,=0A=
> +					 const char *in0, int id)=0A=
> +{=0A=
> +	const struct clk_parent_data parent_data[2] =3D {=0A=
> +		{ .name =3D in0 },=0A=
> +		{ .hw =3D &ksc->plls[K210_PLL0].hw },=0A=
> +	};=0A=
> +=0A=
> +	k210_register_clk(ksc, id, parent_data, 2, 0);=0A=
> +}=0A=
> +=0A=
> +static inline void k210_register_in0_child(struct k210_sysclk *ksc,=0A=
> +					   const char *in0, int id)=0A=
> +{=0A=
> +	const struct clk_parent_data parent_data =3D {=0A=
> +		.name =3D in0,=0A=
> +	};=0A=
> +=0A=
> +	k210_register_clk(ksc, id, &parent_data, 1, 0);=0A=
> +}=0A=
> +=0A=
> +static inline void k210_register_pll_child(struct k210_sysclk *ksc, int =
id,=0A=
> +					   enum k210_pll_id pllid,=0A=
> +					   unsigned long flags)=0A=
> +{=0A=
> +	const struct clk_parent_data parent_data =3D {=0A=
> +		.hw =3D &ksc->plls[pllid].hw,=0A=
> +	};=0A=
> +=0A=
> +	k210_register_clk(ksc, id, &parent_data, 1, flags);=0A=
> +}=0A=
> +=0A=
> +static inline void k210_register_aclk_child(struct k210_sysclk *ksc, int=
 id,=0A=
> +					    unsigned long flags)=0A=
> +{=0A=
> +	const struct clk_parent_data parent_data =3D {=0A=
> +		.hw =3D &ksc->aclk,=0A=
> +	};=0A=
> +=0A=
> +	k210_register_clk(ksc, id, &parent_data, 1, flags);=0A=
> +}=0A=
> +=0A=
> +static inline void k210_register_clk_child(struct k210_sysclk *ksc, int =
id,=0A=
> +					   int parent_id)=0A=
> +{=0A=
> +	const struct clk_parent_data parent_data =3D {=0A=
> +		.hw =3D &ksc->clks[parent_id].hw,=0A=
> +	};=0A=
> +=0A=
> +	k210_register_clk(ksc, id, &parent_data, 1, 0);=0A=
> +}=0A=
> +=0A=
> +static struct clk_hw *k210_clk_hw_onecell_get(struct of_phandle_args *cl=
kspec,=0A=
> +					      void *data)=0A=
> +{=0A=
> +	struct k210_sysclk *ksc =3D data;=0A=
> +	unsigned int idx =3D clkspec->args[0];=0A=
> +=0A=
> +	if (idx >=3D K210_NUM_CLKS)=0A=
> +		return ERR_PTR(-EINVAL);=0A=
> +=0A=
> +	return &ksc->clks[idx].hw;=0A=
> +}=0A=
> +=0A=
> +static void __init k210_clk_init(struct device_node *np)=0A=
> +{=0A=
> +	struct device_node *sysctl_np;=0A=
> +	struct k210_sysclk *ksc;=0A=
> +	const char *in0;=0A=
> +	int i, ret;=0A=
> +=0A=
> +	ksc =3D kzalloc(sizeof(*ksc), GFP_KERNEL);=0A=
> +	if (!ksc)=0A=
> +		return;=0A=
> +=0A=
> +	ksc->node =3D np;=0A=
> +	spin_lock_init(&ksc->clk_lock);=0A=
> +	sysctl_np =3D of_get_parent(np);=0A=
> +	ksc->regs =3D of_iomap(sysctl_np, 0);=0A=
> +	of_node_put(sysctl_np);=0A=
> +	if (!ksc->regs) {=0A=
> +		pr_err("%pOFP: failed to map registers\n", np);=0A=
> +		return;=0A=
> +	}=0A=
> +=0A=
> +	in0 =3D of_clk_get_parent_name(np, 0);=0A=
> +	if (!in0) {=0A=
> +		pr_err("%pOFP: undefined fixed-rate oscillator clock\n", np);=0A=
> +		return;=0A=
> +	}=0A=
> +=0A=
> +	ret =3D k210_register_plls(ksc, in0);=0A=
> +	if (ret)=0A=
> +		return;=0A=
> +=0A=
> +	ret =3D k210_register_aclk(ksc, in0);=0A=
> +	if (ret)=0A=
> +		return;=0A=
> +=0A=
> +	/*=0A=
> +	 * Critical clocks: there are no consumers of the SRAM clocks,=0A=
> +	 * including the AI clock for the third SRAM bank. The CPU clock=0A=
> +	 * is only referenced by the uarths serial device and so would be=0A=
> +	 * disabled if the serial console is disabled to switch to another=0A=
> +	 * console. Mark all these clocks as critical so that they are never=0A=
> +	 * disabled by the core clock management.=0A=
> +	 */=0A=
> +	k210_register_aclk_child(ksc, K210_CLK_CPU, CLK_IS_CRITICAL);=0A=
> +	k210_register_aclk_child(ksc, K210_CLK_SRAM0, CLK_IS_CRITICAL);=0A=
> +	k210_register_aclk_child(ksc, K210_CLK_SRAM1, CLK_IS_CRITICAL);=0A=
> +	k210_register_pll_child(ksc, K210_CLK_AI, K210_PLL1, CLK_IS_CRITICAL);=
=0A=
> +=0A=
> +	/* Clocks with aclk as source */=0A=
> +	k210_register_aclk_child(ksc, K210_CLK_DMA, 0);=0A=
> +	k210_register_aclk_child(ksc, K210_CLK_FFT, 0);=0A=
> +	k210_register_aclk_child(ksc, K210_CLK_ROM, 0);=0A=
> +	k210_register_aclk_child(ksc, K210_CLK_DVP, 0);=0A=
> +	k210_register_aclk_child(ksc, K210_CLK_APB0, 0);=0A=
> +	k210_register_aclk_child(ksc, K210_CLK_APB1, 0);=0A=
> +	k210_register_aclk_child(ksc, K210_CLK_APB2, 0);=0A=
> +=0A=
> +	/* Clocks with PLL0 as source */=0A=
> +	k210_register_pll_child(ksc, K210_CLK_SPI0, K210_PLL0, 0);=0A=
> +	k210_register_pll_child(ksc, K210_CLK_SPI1, K210_PLL0, 0);=0A=
> +	k210_register_pll_child(ksc, K210_CLK_SPI2, K210_PLL0, 0);=0A=
> +	k210_register_pll_child(ksc, K210_CLK_I2C0, K210_PLL0, 0);=0A=
> +	k210_register_pll_child(ksc, K210_CLK_I2C1, K210_PLL0, 0);=0A=
> +	k210_register_pll_child(ksc, K210_CLK_I2C2, K210_PLL0, 0);=0A=
> +=0A=
> +	/* Clocks with PLL2 as source */=0A=
> +	k210_register_pll_child(ksc, K210_CLK_I2S0, K210_PLL2, 0);=0A=
> +	k210_register_pll_child(ksc, K210_CLK_I2S1, K210_PLL2, 0);=0A=
> +	k210_register_pll_child(ksc, K210_CLK_I2S2, K210_PLL2, 0);=0A=
> +	k210_register_pll_child(ksc, K210_CLK_I2S0_M, K210_PLL2, 0);=0A=
> +	k210_register_pll_child(ksc, K210_CLK_I2S1_M, K210_PLL2, 0);=0A=
> +	k210_register_pll_child(ksc, K210_CLK_I2S2_M, K210_PLL2, 0);=0A=
> +=0A=
> +	/* Clocks with IN0 as source */=0A=
> +	k210_register_in0_child(ksc, in0, K210_CLK_WDT0);=0A=
> +	k210_register_in0_child(ksc, in0, K210_CLK_WDT1);=0A=
> +	k210_register_in0_child(ksc, in0, K210_CLK_RTC);=0A=
> +=0A=
> +	/* Clocks with APB0 as source */=0A=
> +	k210_register_clk_child(ksc, K210_CLK_GPIO, K210_CLK_APB0);=0A=
> +	k210_register_clk_child(ksc, K210_CLK_UART1, K210_CLK_APB0);=0A=
> +	k210_register_clk_child(ksc, K210_CLK_UART2, K210_CLK_APB0);=0A=
> +	k210_register_clk_child(ksc, K210_CLK_UART3, K210_CLK_APB0);=0A=
> +	k210_register_clk_child(ksc, K210_CLK_FPIOA, K210_CLK_APB0);=0A=
> +	k210_register_clk_child(ksc, K210_CLK_SHA, K210_CLK_APB0);=0A=
> +=0A=
> +	/* Clocks with APB1 as source */=0A=
> +	k210_register_clk_child(ksc, K210_CLK_AES, K210_CLK_APB1);=0A=
> +	k210_register_clk_child(ksc, K210_CLK_OTP, K210_CLK_APB1);=0A=
> +=0A=
> +	/* Mux clocks with in0 or pll0 as source */=0A=
> +	k210_register_mux_clk(ksc, in0, K210_CLK_SPI3);=0A=
> +	k210_register_mux_clk(ksc, in0, K210_CLK_TIMER0);=0A=
> +	k210_register_mux_clk(ksc, in0, K210_CLK_TIMER1);=0A=
> +	k210_register_mux_clk(ksc, in0, K210_CLK_TIMER2);=0A=
> +=0A=
> +	/* Check for registration errors */=0A=
> +	for (i =3D 0; i < K210_NUM_CLKS; i++) {=0A=
> +		if (ksc->clks[i].id !=3D i)=0A=
> +			return;=0A=
> +	}=0A=
> +=0A=
> +	ret =3D of_clk_add_hw_provider(np, k210_clk_hw_onecell_get, ksc);=0A=
> +	if (ret) {=0A=
> +		pr_err("%pOFP: add clock provider failed %d\n", np, ret);=0A=
> +		return;=0A=
> +	}=0A=
> +=0A=
> +	pr_info("%pOFP: CPU running at %lu MHz\n",=0A=
> +		np, clk_hw_get_rate(&ksc->clks[K210_CLK_CPU].hw) / 1000000);=0A=
> +}=0A=
> +=0A=
> +CLK_OF_DECLARE(k210_clk, "canaan,k210-clk", k210_clk_init);=0A=
> +=0A=
> +/*=0A=
> + * Enable PLL1 to be able to use the AI SRAM.=0A=
> + */=0A=
> +void __init k210_clk_early_init(void __iomem *regs)=0A=
> +{=0A=
> +	struct k210_pll pll1;=0A=
> +=0A=
> +	/* Make sure ACLK selector is set to PLL0 */=0A=
> +	k210_aclk_set_selector(regs, 1);=0A=
> +=0A=
> +	/* Startup PLL1 to enable the aisram bank for general memory use */=0A=
> +	k210_init_pll(regs, K210_PLL1, &pll1);=0A=
> +	k210_pll_enable_hw(regs, &pll1);=0A=
> +}=0A=
> diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig=0A=
> index 5232d13f07e5..8179b69518b4 100644=0A=
> --- a/drivers/soc/canaan/Kconfig=0A=
> +++ b/drivers/soc/canaan/Kconfig=0A=
> @@ -1,14 +1,12 @@=0A=
>  # SPDX-License-Identifier: GPL-2.0=0A=
>  =0A=
> -if SOC_CANAAN=0A=
> -=0A=
> -config K210_SYSCTL=0A=
> +config SOC_K210_SYSCTL=0A=
>  	bool "Canaan Kendryte K210 SoC system controller"=0A=
> -	default y=0A=
> -	depends on RISCV=0A=
> +	depends on RISCV && SOC_CANAAN && OF=0A=
> +	default SOC_CANAAN=0A=
> +        select PM=0A=
> +        select SIMPLE_PM_BUS=0A=
> +        select SYSCON=0A=
> +        select MFD_SYSCON=0A=
>  	help=0A=
> -	  Enables controlling the K210 various clocks and to enable=0A=
> -	  general purpose use of the extra 2MB of SRAM normally=0A=
> -	  reserved for the AI engine.=0A=
> -=0A=
> -endif=0A=
> +	  Canaan Kendryte K210 SoC system controller driver.=0A=
> diff --git a/drivers/soc/canaan/Makefile b/drivers/soc/canaan/Makefile=0A=
> index 002d9ce95c0d..570280ad7967 100644=0A=
> --- a/drivers/soc/canaan/Makefile=0A=
> +++ b/drivers/soc/canaan/Makefile=0A=
> @@ -1,3 +1,3 @@=0A=
>  # SPDX-License-Identifier: GPL-2.0=0A=
>  =0A=
> -obj-$(CONFIG_K210_SYSCTL)	+=3D k210-sysctl.o=0A=
> +obj-$(CONFIG_SOC_K210_SYSCTL)	+=3D k210-sysctl.o=0A=
> diff --git a/drivers/soc/canaan/k210-sysctl.c b/drivers/soc/canaan/k210-s=
ysctl.c=0A=
> index 60b474c33d45..27a346c406bc 100644=0A=
> --- a/drivers/soc/canaan/k210-sysctl.c=0A=
> +++ b/drivers/soc/canaan/k210-sysctl.c=0A=
> @@ -3,165 +3,45 @@=0A=
>   * Copyright (c) 2019 Christoph Hellwig.=0A=
>   * Copyright (c) 2019 Western Digital Corporation or its affiliates.=0A=
>   */=0A=
> -#include <linux/types.h>=0A=
>  #include <linux/io.h>=0A=
> -#include <linux/of.h>=0A=
>  #include <linux/platform_device.h>=0A=
> -#include <linux/clk-provider.h>=0A=
> -#include <linux/clkdev.h>=0A=
> -#include <linux/bitfield.h>=0A=
> +#include <linux/of_platform.h>=0A=
> +#include <linux/clk.h>=0A=
>  #include <asm/soc.h>=0A=
>  =0A=
>  #include <soc/canaan/k210-sysctl.h>=0A=
>  =0A=
> -#define K210_SYSCTL_CLK0_FREQ		26000000UL=0A=
> -=0A=
> -/* Registers base address */=0A=
> -#define K210_SYSCTL_SYSCTL_BASE_ADDR	0x50440000ULL=0A=
> -=0A=
> -/* Register bits */=0A=
> -/* K210_SYSCTL_PLL1: clkr: 4bits, clkf1: 6bits, clkod: 4bits, bwadj: 4bi=
ts */=0A=
> -#define PLL_RESET		(1 << 20)=0A=
> -#define PLL_PWR			(1 << 21)=0A=
> -#define PLL_BYPASS		(1 << 23)=0A=
> -#define PLL_OUT_EN		(1 << 25)=0A=
> -/* K210_SYSCTL_PLL_LOCK */=0A=
> -#define PLL1_LOCK1		(1 << 8)=0A=
> -#define PLL1_LOCK2		(1 << 9)=0A=
> -#define PLL1_SLIP_CLEAR		(1 << 10)=0A=
> -/* K210_SYSCTL_SEL0 */=0A=
> -#define CLKSEL_ACLK		(1 << 0)=0A=
> -/* K210_SYSCTL_CLKEN_CENT */=0A=
> -#define CLKEN_CPU		(1 << 0)=0A=
> -#define CLKEN_SRAM0		(1 << 1)=0A=
> -#define CLKEN_SRAM1		(1 << 2)=0A=
> -/* K210_SYSCTL_EN_PERI */=0A=
> -#define CLKEN_ROM		(1 << 0)=0A=
> -#define CLKEN_TIMER0		(1 << 21)=0A=
> -#define CLKEN_RTC		(1 << 29)=0A=
> -=0A=
> -struct k210_sysctl {=0A=
> -	void __iomem		*regs;=0A=
> -	struct clk_hw		hw;=0A=
> -};=0A=
> -=0A=
> -static void k210_set_bits(u32 val, void __iomem *reg)=0A=
> -{=0A=
> -	writel(readl(reg) | val, reg);=0A=
> -}=0A=
> -=0A=
> -static void k210_clear_bits(u32 val, void __iomem *reg)=0A=
> -{=0A=
> -	writel(readl(reg) & ~val, reg);=0A=
> -}=0A=
> -=0A=
> -static void k210_pll1_enable(void __iomem *regs)=0A=
> -{=0A=
> -	u32 val;=0A=
> -=0A=
> -	val =3D readl(regs + K210_SYSCTL_PLL1);=0A=
> -	val &=3D ~GENMASK(19, 0);				/* clkr1 =3D 0 */=0A=
> -	val |=3D FIELD_PREP(GENMASK(9, 4), 0x3B);		/* clkf1 =3D 59 */=0A=
> -	val |=3D FIELD_PREP(GENMASK(13, 10), 0x3);	/* clkod1 =3D 3 */=0A=
> -	val |=3D FIELD_PREP(GENMASK(19, 14), 0x3B);	/* bwadj1 =3D 59 */=0A=
> -	writel(val, regs + K210_SYSCTL_PLL1);=0A=
> -=0A=
> -	k210_clear_bits(PLL_BYPASS, regs + K210_SYSCTL_PLL1);=0A=
> -	k210_set_bits(PLL_PWR, regs + K210_SYSCTL_PLL1);=0A=
> -=0A=
> -	/*=0A=
> -	 * Reset the pll. The magic NOPs come from the Kendryte reference SDK.=
=0A=
> -	 */=0A=
> -	k210_clear_bits(PLL_RESET, regs + K210_SYSCTL_PLL1);=0A=
> -	k210_set_bits(PLL_RESET, regs + K210_SYSCTL_PLL1);=0A=
> -	nop();=0A=
> -	nop();=0A=
> -	k210_clear_bits(PLL_RESET, regs + K210_SYSCTL_PLL1);=0A=
> -=0A=
> -	for (;;) {=0A=
> -		val =3D readl(regs + K210_SYSCTL_PLL_LOCK);=0A=
> -		if (val & PLL1_LOCK2)=0A=
> -			break;=0A=
> -		writel(val | PLL1_SLIP_CLEAR, regs + K210_SYSCTL_PLL_LOCK);=0A=
> -	}=0A=
> -=0A=
> -	k210_set_bits(PLL_OUT_EN, regs + K210_SYSCTL_PLL1);=0A=
> -}=0A=
> -=0A=
> -static unsigned long k210_sysctl_clk_recalc_rate(struct clk_hw *hw,=0A=
> -		unsigned long parent_rate)=0A=
> -{=0A=
> -	struct k210_sysctl *s =3D container_of(hw, struct k210_sysctl, hw);=0A=
> -	u32 clksel0, pll0;=0A=
> -	u64 pll0_freq, clkr0, clkf0, clkod0;=0A=
> -=0A=
> -	/*=0A=
> -	 * If the clock selector is not set, use the base frequency.=0A=
> -	 * Otherwise, use PLL0 frequency with a frequency divisor.=0A=
> -	 */=0A=
> -	clksel0 =3D readl(s->regs + K210_SYSCTL_SEL0);=0A=
> -	if (!(clksel0 & CLKSEL_ACLK))=0A=
> -		return K210_SYSCTL_CLK0_FREQ;=0A=
> -=0A=
> -	/*=0A=
> -	 * Get PLL0 frequency:=0A=
> -	 * freq =3D base frequency * clkf0 / (clkr0 * clkod0)=0A=
> -	 */=0A=
> -	pll0 =3D readl(s->regs + K210_SYSCTL_PLL0);=0A=
> -	clkr0 =3D 1 + FIELD_GET(GENMASK(3, 0), pll0);=0A=
> -	clkf0 =3D 1 + FIELD_GET(GENMASK(9, 4), pll0);=0A=
> -	clkod0 =3D 1 + FIELD_GET(GENMASK(13, 10), pll0);=0A=
> -	pll0_freq =3D clkf0 * K210_SYSCTL_CLK0_FREQ / (clkr0 * clkod0);=0A=
> -=0A=
> -	/* Get the frequency divisor from the clock selector */=0A=
> -	return pll0_freq / (2ULL << FIELD_GET(0x00000006, clksel0));=0A=
> -}=0A=
> -=0A=
> -static const struct clk_ops k210_sysctl_clk_ops =3D {=0A=
> -	.recalc_rate	=3D k210_sysctl_clk_recalc_rate,=0A=
> -};=0A=
> -=0A=
> -static const struct clk_init_data k210_clk_init_data =3D {=0A=
> -	.name		=3D "k210-sysctl-pll1",=0A=
> -	.ops		=3D &k210_sysctl_clk_ops,=0A=
> -};=0A=
> -=0A=
>  static int k210_sysctl_probe(struct platform_device *pdev)=0A=
>  {=0A=
> -	struct k210_sysctl *s;=0A=
> -	int error;=0A=
> -=0A=
> -	pr_info("Kendryte K210 SoC sysctl\n");=0A=
> -=0A=
> -	s =3D devm_kzalloc(&pdev->dev, sizeof(*s), GFP_KERNEL);=0A=
> -	if (!s)=0A=
> -		return -ENOMEM;=0A=
> -=0A=
> -	s->regs =3D devm_ioremap_resource(&pdev->dev,=0A=
> -			platform_get_resource(pdev, IORESOURCE_MEM, 0));=0A=
> -	if (IS_ERR(s->regs))=0A=
> -		return PTR_ERR(s->regs);=0A=
> -=0A=
> -	s->hw.init =3D &k210_clk_init_data;=0A=
> -	error =3D devm_clk_hw_register(&pdev->dev, &s->hw);=0A=
> -	if (error) {=0A=
> -		dev_err(&pdev->dev, "failed to register clk");=0A=
> -		return error;=0A=
> +	struct device *dev =3D &pdev->dev;=0A=
> +	struct clk *pclk;=0A=
> +	int ret;=0A=
> +=0A=
> +	dev_info(dev, "K210 system controller\n");=0A=
> +=0A=
> +	/* Get power bus clock */=0A=
> +	pclk =3D devm_clk_get(dev, NULL);=0A=
> +	if (IS_ERR(pclk))=0A=
> +		return dev_err_probe(dev, PTR_ERR(pclk),=0A=
> +				     "Get bus clock failed\n");=0A=
> +=0A=
> +	ret =3D clk_prepare_enable(pclk);=0A=
> +	if (ret) {=0A=
> +		dev_err(dev, "Enable bus clock failed\n");=0A=
> +		return ret;=0A=
>  	}=0A=
>  =0A=
> -	error =3D devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get,=
=0A=
> -					    &s->hw);=0A=
> -	if (error) {=0A=
> -		dev_err(&pdev->dev, "adding clk provider failed\n");=0A=
> -		return error;=0A=
> -	}=0A=
> +	/* Populate children */=0A=
> +	ret =3D devm_of_platform_populate(dev);=0A=
> +	if (ret)=0A=
> +		dev_err(dev, "Populate platform failed %d\n", ret);=0A=
>  =0A=
> -	return 0;=0A=
> +	return ret;=0A=
>  }=0A=
>  =0A=
>  static const struct of_device_id k210_sysctl_of_match[] =3D {=0A=
> -	{ .compatible =3D "kendryte,k210-sysctl", },=0A=
> -	{}=0A=
> +	{ .compatible =3D "canaan,k210-sysctl", },=0A=
> +	{ /* sentinel */ },=0A=
>  };=0A=
>  =0A=
>  static struct platform_driver k210_sysctl_driver =3D {=0A=
> @@ -171,12 +51,13 @@ static struct platform_driver k210_sysctl_driver =3D=
 {=0A=
>  	},=0A=
>  	.probe			=3D k210_sysctl_probe,=0A=
>  };=0A=
> +builtin_platform_driver(k210_sysctl_driver);=0A=
>  =0A=
> -static int __init k210_sysctl_init(void)=0A=
> -{=0A=
> -	return platform_driver_register(&k210_sysctl_driver);=0A=
> -}=0A=
> -core_initcall(k210_sysctl_init);=0A=
> +/*=0A=
> + * System controller registers base address and size.=0A=
> + */=0A=
> +#define K210_SYSCTL_BASE_ADDR	0x50440000ULL=0A=
> +#define K210_SYSCTL_BASE_SIZE	0x1000=0A=
>  =0A=
>  /*=0A=
>   * This needs to be called very early during initialization, given that=
=0A=
> @@ -184,24 +65,14 @@ core_initcall(k210_sysctl_init);=0A=
>   */=0A=
>  static void __init k210_soc_early_init(const void *fdt)=0A=
>  {=0A=
> -	void __iomem *regs;=0A=
> -=0A=
> -	regs =3D ioremap(K210_SYSCTL_SYSCTL_BASE_ADDR, 0x1000);=0A=
> -	if (!regs)=0A=
> -		panic("K210 sysctl ioremap");=0A=
> -=0A=
> -	/* Enable PLL1 to make the KPU SRAM useable */=0A=
> -	k210_pll1_enable(regs);=0A=
> -=0A=
> -	k210_set_bits(PLL_OUT_EN, regs + K210_SYSCTL_PLL0);=0A=
> +	void __iomem *sysctl_base;=0A=
>  =0A=
> -	k210_set_bits(CLKEN_CPU | CLKEN_SRAM0 | CLKEN_SRAM1,=0A=
> -		      regs + K210_SYSCTL_EN_CENT);=0A=
> -	k210_set_bits(CLKEN_ROM | CLKEN_TIMER0 | CLKEN_RTC,=0A=
> -		      regs + K210_SYSCTL_EN_PERI);=0A=
> +	sysctl_base =3D ioremap(K210_SYSCTL_BASE_ADDR, K210_SYSCTL_BASE_SIZE);=
=0A=
> +	if (!sysctl_base)=0A=
> +		panic("k210-sysctl: ioremap failed");=0A=
>  =0A=
> -	k210_set_bits(CLKSEL_ACLK, regs + K210_SYSCTL_SEL0);=0A=
> +	k210_clk_early_init(sysctl_base);=0A=
>  =0A=
> -	iounmap(regs);=0A=
> +	iounmap(sysctl_base);=0A=
>  }=0A=
> -SOC_EARLY_INIT_DECLARE(generic_k210, "kendryte,k210", k210_soc_early_ini=
t);=0A=
> +SOC_EARLY_INIT_DECLARE(k210_soc, "canaan,kendryte-k210", k210_soc_early_=
init);=0A=
> diff --git a/include/soc/canaan/k210-sysctl.h b/include/soc/canaan/k210-s=
ysctl.h=0A=
> index 2e037db68f35..0c2b2c2dabca 100644=0A=
> --- a/include/soc/canaan/k210-sysctl.h=0A=
> +++ b/include/soc/canaan/k210-sysctl.h=0A=
> @@ -38,4 +38,6 @@=0A=
>  #define K210_SYSCTL_DMA_SEL1	0x68 /* DMA handshake selector 1 */=0A=
>  #define K210_SYSCTL_POWER_SEL	0x6C /* IO Power Mode Select controller */=
=0A=
>  =0A=
> +void k210_clk_early_init(void __iomem *regs);=0A=
> +=0A=
>  #endif=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
