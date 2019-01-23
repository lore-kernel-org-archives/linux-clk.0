Return-Path: <SRS0=4/Ea=P7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BDAC282C0
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 08:19:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6025F21726
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 08:19:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="XhkFyKKj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbfAWIT1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Jan 2019 03:19:27 -0500
Received: from mail-eopbgr10076.outbound.protection.outlook.com ([40.107.1.76]:46272
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726291AbfAWIT0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 23 Jan 2019 03:19:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6L/gqiRqpDsvYgqkfWzUGpkyNu/NgB6Hq2WTB5qyqQ=;
 b=XhkFyKKjRnMY9gPBT2/lzfVkLAHYx77YZhntX2vmwJy0Fvmi7tY3akRLUq+B9j9l+G7+Yni5WJNdNgnZM+XupV5O+tLWu5vZt4+zkcWR+mwKBjpqYwwHAwHf0YnlWoV42PnaRMrVqIr4CICTMIFm9NRrLkP8kyZmCvcz4hjhaR4=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5459.eurprd04.prod.outlook.com (20.178.115.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.30; Wed, 23 Jan 2019 08:19:22 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5%5]) with mapi id 15.20.1558.016; Wed, 23 Jan 2019
 08:19:22 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH V2 0/5] dt-binding: clk: prepare for imx8qm clock support
Thread-Topic: [PATCH V2 0/5] dt-binding: clk: prepare for imx8qm clock support
Thread-Index: AQHUsvP3nb0OibsUXkSix73UA+4SKqW8giZQ
Date:   Wed, 23 Jan 2019 08:19:22 +0000
Message-ID: <AM0PR04MB421169B58FFD6FD5B17D015080990@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1548231044-4344-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1548231044-4344-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5459;6:raSkNpNIzgzaBCUHmzndqZNVZn6giORObBsuXJKnG2RuBFbNYfUt3vV+kRK7NCC4w9ohQ3O4GHzfNTjZWqoSf7roTGIWi2kZaGrMgi+iEu0hIvxEc0/9UrZRUV6uRxeAv5/kelCndxYFiGt06zHhhbfVXiYOZQytJ2mjOkXAXYQwmiaYKfwMzHv4/fuudatCGN5MPpYwbdPk2iYBjSJISGsGqhW3/Eu4+7VrxOm56iMy8/bky0YD/9iA6I5VcnF6jr+BCKB+msCl5l0dh3O2A2atNOcqT6YVRz4zS8T85X+CmjkeT7ASSZRxTttAwV8m7y/tN89RHKxfXZsTJiVKCSk79urAA5BscFS7KtSSBMAU1gbVXWq6qLjLyP3KJiWja9qknDQQBUxFGNNwxEGL/5q7L8klugV5RL47RAPGnmky0C5h5UGjCQpwIFm9mJAn2JjGy39bxj3++HEX4HJTUA==;5:73qBvBfF8Vstn3kiq4cQzLtLC5A/go7/r9oXe+VKCarUfNsKBDXlm/fLCosnguvSLzkhRpE61fj9Ra+suvpx2SLN//i7Y4x+LhMiof6DLuzKvFSUGLUZZSkVbaAeJqPHsgd7Dgyr+H1lEUiUrLd6nzeaX1Jsle7I4irHrMZMvCo/6hE9d03dpErsEHu+rURjZJnyuKTJ8h91k3UbmYUqEw==;7:uhB+QMb3GJFNdbjpzBiCTia0/xe/uSJioymjC/E8wxMzMozZhJ5DMMmMruORH68ZFY0L0LeTqN+whtOn48prXHibwfvvOVtbO2j/nPtZbyYWd0dq+z3lq2uiyJIBsaeaOd5wMVaeRE8USZyaQETxPA==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 55858641-82d3-47f8-6b90-08d6810b7abe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5459;
x-ms-traffictypediagnostic: AM0PR04MB5459:
x-microsoft-antispam-prvs: <AM0PR04MB5459BE737D661D5B0C37BC7880990@AM0PR04MB5459.eurprd04.prod.outlook.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(366004)(136003)(396003)(189003)(199004)(8936002)(2906002)(66066001)(81156014)(55016002)(6246003)(25786009)(97736004)(33656002)(14454004)(316002)(74316002)(54906003)(44832011)(81166006)(478600001)(4326008)(110136005)(68736007)(99286004)(229853002)(76176011)(26005)(6436002)(86362001)(7736002)(2501003)(6506007)(7696005)(102836004)(53546011)(305945005)(106356001)(486006)(186003)(6116002)(256004)(14444005)(53936002)(9686003)(3846002)(11346002)(476003)(71200400001)(71190400001)(446003)(8676002)(105586002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5459;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lVgopSs8aoE8lqfjaB0JylnbLXv6Eh7onUFnAZm+hYMjKotV676zSvlbpNF6tOlY5dbiJf7G5SVgD/2FHg8Ds88U6Hlix1cPVD1L8AXxaLSCA2awmfcvAIM57rGVeXw8Jtcs2TD0J9dBctUaTPk4p7vr4gfWSYjglSJA6meYFriZ35CDeKMavCJhXQZ0d3gtk1gsWbqapDgHKpLGbdz+88YKwsWj+Zl9RT64X5i2a368wChv6eS8I3/bdJidColCgCrQs4ep8fxf7m5pkEGy+91BI2xcwYnSdBzyjPi1onaUcESqHI6omN0rGbrB7ITqAceE3Qi5kFKgF+x9ZXKQ4kuZ3Qtx/gmiGZV/G49uvH3wX2SBvNgDTolJDKIzN+Xi6sSR63r2HUZf2Ztp7LJNXzHghuGurIp44xPNc/fRuPE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55858641-82d3-47f8-6b90-08d6810b7abe
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 08:19:22.2206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5459
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> From: Aisheng Dong
> Sent: Wednesday, January 23, 2019 4:17 PM
> Subject: [PATCH V2 0/5] dt-binding: clk: prepare for imx8qm clock support
>=20
> After a bit more investigation on IMX8QM, it seemed SCU clock can be used=
 in
> a similar way as IMX8QXP. So update the binding and driver to be a bit ge=
neric
> for easily extension of IMX8QM support later.
>=20
> Dong Aisheng (5):
>   dt-bindings: fsl: scu: add fallback compatible string for clock
>   dt-bindings: fsl: scu: add imx8qm scu clock support

Hi Shawn,
Would you pick the first two patches for scu binding doc?

Rob & Stephen,
Please help review the left ones.

Regards
Dong Aisheng

>   dt-bindings: clock: update CPU clock ID name
>   dt-bindings: imx8-clock: add a53 and a72 clock id
>   clk: imx: scu: add fallback compatible string support
>=20
>  Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 7 +++++--
>  drivers/clk/imx/clk-imx8qxp.c                               | 1 +
>  include/dt-bindings/clock/imx8-clock.h                      | 8 +++++---
>  3 files changed, 11 insertions(+), 5 deletions(-)
>=20
> --
> 2.7.4

