Return-Path: <SRS0=nz6M=OH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F39DC43441
	for <linux-clk@archiver.kernel.org>; Wed, 28 Nov 2018 17:18:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6D69206B6
	for <linux-clk@archiver.kernel.org>; Wed, 28 Nov 2018 17:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="HmUZNWF1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6D69206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbeK2EVO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Nov 2018 23:21:14 -0500
Received: from mail-eopbgr80077.outbound.protection.outlook.com ([40.107.8.77]:39520
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728775AbeK2EVN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 28 Nov 2018 23:21:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MNW0aTFaDTEtOBPKaCdm/kiDasRiIt11kU7753kJzg=;
 b=HmUZNWF18j36HehI1iT2S4sNB9oqUypO5vj9nsCIjTc9Qr16pOSRpntwTu6ZqgM13eMhw+7Jm7J75DVUzqWJTs7cd4DA/HKuAXUm1fjbzUolBj3gBuk3kMqQUtZ0ncCRAarx4vCgLlJ8HRyKzSnlJo/rkadmqCwUK3k46/7dMl8=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5156.eurprd04.prod.outlook.com (20.177.40.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1361.16; Wed, 28 Nov 2018 17:18:47 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1361.019; Wed, 28 Nov 2018
 17:18:47 +0000
From:   Aisheng DONG <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH V8 0/7] clk: imx: add imx8qxp clock support
Thread-Topic: [PATCH V8 0/7] clk: imx: add imx8qxp clock support
Thread-Index: AQHUgaQ07UOrlEn65UOyxxVfjCE+w6VleWoQ
Date:   Wed, 28 Nov 2018 17:18:47 +0000
Message-ID: <AM0PR04MB42110579601320F59219CB9E80D10@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [101.93.238.110]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5156;6:dFMnkSbLP8DCH25pdX1Al1cAZ3la78JylvAeg9zIi8Qs8nJashVs+oNpYSILu0MFMsYkwjHpXPivaS2eaWCcGS0SgmRW2vWNGdlaf/Aob+OI0rG+lWyGNMwCq7Pux2nLl0CB7Ozi1nuxwN7sVxCQmbXDJM2posdUt8k4R2jrdRGG9aLv5kxQ82/NnEy19B/LwIc++XuJev7VE8FGrHU+iHhgX6FlCUOvO3JbJttGBDiYtHUfchcvyViJh+03Vx0Faccmdsf+DKVd0QEXSmmG3voMeEt/uuWofvKzF/eu5NdzWUhhODayi2TV1jCTkh7nsGf23sDY17EmvWGFyooi7w5JEB0Azl1fz8x64/ntgNTZwlA89pSzgvUmtBaVEvpXRPmOw342akxzxG1IhOXk3PGUw+fqWTfXPg7/o8aSYTe2ovGqdMphUDO5nH2PG+8AFrurLI1VzTfFeYDgPuLuMA==;5:W3J/daTdAM19Y3ZdSpWWA3lTEpz88HBljj7vdYRT9FBbQytUiOc2+ztuvMp9Qxog1jLJE3qIecXUPfUtjmKoEcPKbrkojvdaTmnBrgcO9dIDF9C5rph6By//NxovBGNfpPOlbVzA6UqaueV+7xNhP6cSPo42S9pfnSTCFDDJQ40=;7:GrUvoG7V1Dc+PVh0FeDl9+fIlgdaZnLHdsNA1BBR1HDfaQsmVPM0QF8fLDLMDP4efEaKRBsCKrn3FzvYrzLoM2x1mbY3wTAKGbkiK8Ii30gFsvnTFIHkTg8VaebMr9YebBqT+YyyDzwqp4CKdBHYaw==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 17b14089-8770-4563-938c-08d655558eef
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5156;
x-ms-traffictypediagnostic: AM0PR04MB5156:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-microsoft-antispam-prvs: <AM0PR04MB5156E378D187FE93CDB631F680D10@AM0PR04MB5156.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(3231443)(999002)(944501436)(52105112)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5156;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5156;
x-forefront-prvs: 0870212862
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(136003)(39860400002)(396003)(346002)(189003)(199004)(54534003)(13464003)(105586002)(97736004)(4326008)(106356001)(2501003)(99286004)(486006)(33656002)(9686003)(6246003)(25786009)(86362001)(2906002)(6436002)(316002)(54906003)(110136005)(14444005)(53936002)(66066001)(81156014)(6116002)(81166006)(7696005)(3846002)(476003)(5660300001)(229853002)(8936002)(256004)(71200400001)(76176011)(71190400001)(446003)(102836004)(53546011)(6506007)(14454004)(26005)(74316002)(186003)(11346002)(305945005)(7736002)(68736007)(55016002)(478600001)(8676002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5156;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 2qhNxwRR1SyvP7Qa/SxcusBE9FWDPoWt1pfioLvsPItTclK8lGgApfvRaK9+utsQFWwEKWdoDRqMBJJ0NGTjmPVhvoasP666S5eJ6zViz4hl99O7VnDmR9cvkEwtRhxyjt4nW6kbOl84syVwgfi8qyjl/OALWIsC4TQY/FUFihaHAoCgznEHBcjmTCJHXHtOwW6/qUDWIeN4jjiTEzyTonMOJtmMAXx4qZVHsvyeyKSRMLHYcjXCxBLK+oqBXng+XSsWVHWk6ROgMtboB8W7PCgCXy2nkQ42lEqbgrNumMHLHyHcBVVLi3mgB4UNEsI/hSvHjFgdiopPl3XyqOiS1MFD0++msFoApgYQ3LY4wrY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b14089-8770-4563-938c-08d655558eef
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2018 17:18:47.7259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5156
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Gently Ping...

> -----Original Message-----
> From: Aisheng DONG
> Sent: Wednesday, November 21, 2018 10:12 PM
> To: linux-clk@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org; sboyd@kernel.org;
> mturquette@baylibre.com; shawnguo@kernel.org; Fabio Estevam
> <fabio.estevam@nxp.com>; dl-linux-imx <linux-imx@nxp.com>;
> kernel@pengutronix.de; Aisheng DONG <aisheng.dong@nxp.com>
> Subject: [PATCH V8 0/7] clk: imx: add imx8qxp clock support
>=20
> This patch series adds i.MX8QXP clock support which is based on the clock
> service provided by SCU firmware.
>=20
> Note: It depends on SCU driver which has already been merged by Shawn.
> So this patch series could go through Shawn's tree as well.
>=20
> ChangeLog:
> v7->v8:
>  * add more kernel doc for lpcg and scu clock structures
>  * remove one unneccessry reg checking
> v6->v7:
>  * use struct_size()
>  * remove MODULE_ macros
>  * add more kernel docs/code comments
>  * other small improvements
>  * update reviewed-by tags
>  * add the missing PATCH 1 in V6
> v5->v6:
>  * simply the driver a lot by re-orgnizing the driver into a few clock ty=
pes:
>    scu clock (merge scu divider/gate/mux) and scu gpr lock which accessin=
g is
>    through SCU protocol and LPCG clock which is directly accessible by CP=
U.
>  * LPCG clock is separate from SCU clock, gpr clock is still not used
>    and will be added later.
>  * remove old year license as the code is totally rewritten
>  * scu mux support will be added later as it's also still not used.
> v4->v5:
>  Address all Stephen and Sascha's review comments, see details in each pa=
tch
> v3->v4:
>  * scu headfile path update
>  * no functionality change
> v2->v3:
>  * structures/enums name update with imx_sc prefix
>  * no functionality change
> v1->v2:
>  * structure and enums name update
>  * api usage update due to api change
>  * no functionality change
>=20
> Dong Aisheng (7):
>   clk: imx: add configuration option for mmio clks
>   clk: imx: add scu clock common part
>   dt-bindings: clock: imx8qxp: add SCU clock IDs
>   clk: imx: add imx8qxp clk driver
>   dt-bindings: clock: add imx8qxp lpcg clock binding
>   clk: imx: add lpcg clock support
>   clk: imx: add imx8qxp lpcg driver
>=20
>  .../devicetree/bindings/clock/imx8qxp-lpcg.txt     |  51 ++++
>  arch/arm/mach-imx/Kconfig                          |  11 +
>  drivers/clk/Kconfig                                |   1 +
>  drivers/clk/imx/Kconfig                            |   9 +
>  drivers/clk/imx/Makefile                           |   8 +-
>  drivers/clk/imx/clk-imx8qxp-lpcg.c                 | 216
> +++++++++++++++
>  drivers/clk/imx/clk-imx8qxp-lpcg.h                 | 102 ++++++++
>  drivers/clk/imx/clk-imx8qxp.c                      | 153 +++++++++++
>  drivers/clk/imx/clk-lpcg-scu.c                     | 113 ++++++++
>  drivers/clk/imx/clk-scu.c                          | 267
> +++++++++++++++++++
>  drivers/clk/imx/clk-scu.h                          |  24 ++
>  include/dt-bindings/clock/imx8qxp-clock.h          | 289
> +++++++++++++++++++++
>  12 files changed, 1243 insertions(+), 1 deletion(-)  create mode 100644
> Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
>  create mode 100644 drivers/clk/imx/Kconfig  create mode 100644
> drivers/clk/imx/clk-imx8qxp-lpcg.c
>  create mode 100644 drivers/clk/imx/clk-imx8qxp-lpcg.h
>  create mode 100644 drivers/clk/imx/clk-imx8qxp.c  create mode 100644
> drivers/clk/imx/clk-lpcg-scu.c  create mode 100644 drivers/clk/imx/clk-sc=
u.c
> create mode 100644 drivers/clk/imx/clk-scu.h  create mode 100644
> include/dt-bindings/clock/imx8qxp-clock.h
>=20
> --
> 2.7.4

