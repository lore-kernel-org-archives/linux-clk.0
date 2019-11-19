Return-Path: <SRS0=V3Jc=ZL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E29C432C0
	for <linux-clk@archiver.kernel.org>; Tue, 19 Nov 2019 09:11:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 919B8222D3
	for <linux-clk@archiver.kernel.org>; Tue, 19 Nov 2019 09:11:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="R6mqcjdZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbfKSJLs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Nov 2019 04:11:48 -0500
Received: from mail-eopbgr50074.outbound.protection.outlook.com ([40.107.5.74]:55527
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726637AbfKSJLr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 19 Nov 2019 04:11:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlQQLcDKh48e/DdebqAi/Q7dqNG5LBoBIdJOIHHR5rEKWp2cGANINAzBqdO9LnWRSe3It/RITjT2hRNvqSypi/WjF+SO0Gl45EWUbDzLxN6RrRG+IvXHh481dXBHPdRv4wYm0f8qX3/nXl9iclDOOsczA1mRtbmYIVYZ034hRlMSAVI9HS0Z5VtAVOT6Sg70bNgOVrdA2oLTsIaoHZqduNkTo2oVX+/iJxj4FDx6C/iGOBK+AFo2ecRemeXw4EvrGGPsy7AQUI+VMAVVGXjeNUwZX4dUVBeeRIoFrL8GOLzpAQvBZeEezcbwHT0yKKQ9ctJWy5AvCwqQWjptSM1uEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpaFl9w4m/Php7AJCDZQxBPHFFi2zzhn8NZfW715PnI=;
 b=Kxt/Dz9DZ/+sb1xMu+qNQarO16zoYYagqiF7SXplL97jqHNg5U2uSG9+b726huzTHl5SgUyCjmwa4epkkbe+k0HqjOs5U/5awf9V/0hAGliyXC+xuF9cOsCIiXwHj/0V1ciYk8u/8F+rGmcBamGaseAGT/5qSnuvYFkR3d7uxCj8mx5h0nL2Ps+rhwjS8P9W87zcbeKYZBTwhtLn5/jEpVCPOl8A7vAcNVJ+i45zbCFdEhdehNSyfzrwZcqwNW9JM2kf8NjLpcT5ueuYgZGOZiV9fdQPoK8CUCwhS+r1VX6wfYPaxFkvalT2Ild67ENF8JJTawqo7x/K6/sBo0mZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpaFl9w4m/Php7AJCDZQxBPHFFi2zzhn8NZfW715PnI=;
 b=R6mqcjdZMgF/oMB0LSR7Skp9UjwS1wYm4it6ctSq9z8r7MW5TrhsjpWUFStN11FGIGi9dv7K/+jE4+9NoROHQJjJ46jLp+O897KSp2QNWLUUKiViG/63vR6Q1v47Mo8g9uxjqgjC+p4lee3CvHVyO2Rwftu64PJMQjC4LHCVCoc=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB4259.eurprd04.prod.outlook.com (52.134.126.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.27; Tue, 19 Nov 2019 09:11:02 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2451.031; Tue, 19 Nov 2019
 09:11:02 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Leonard Crestez <leonard.crestez@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH] clk: imx8m: Suppress bind attrs
Thread-Topic: [PATCH] clk: imx8m: Suppress bind attrs
Thread-Index: AQHVnl98iiuO4KwxREKP88Qyifoa5aeSNa4g
Date:   Tue, 19 Nov 2019 09:11:01 +0000
Message-ID: <AM0PR04MB448144625FD1BE6177E35B55884C0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <9f2ac65bab203a943de947465d6534980585e144.1574116045.git.leonard.crestez@nxp.com>
In-Reply-To: <9f2ac65bab203a943de947465d6534980585e144.1574116045.git.leonard.crestez@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e5844e3b-bf88-4a81-1c01-08d76cd0663a
x-ms-traffictypediagnostic: AM0PR04MB4259:|AM0PR04MB4259:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB4259A9405983FEB8788D0C7F884C0@AM0PR04MB4259.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(199004)(189003)(256004)(186003)(446003)(99286004)(14454004)(305945005)(76116006)(11346002)(71190400001)(71200400001)(102836004)(81156014)(66946007)(26005)(86362001)(7736002)(5660300002)(81166006)(8676002)(478600001)(229853002)(66446008)(476003)(66476007)(66556008)(64756008)(6506007)(7696005)(25786009)(486006)(55016002)(33656002)(9686003)(52536014)(54906003)(76176011)(2906002)(6116002)(6246003)(316002)(74316002)(4326008)(110136005)(3846002)(66066001)(6436002)(8936002)(44832011)(32563001)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4259;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7dUBu/c7poyio9T+fPYl4oN+0dsur6V23xwXfZdjAVpleCEAExntEG4d1Jd6lEKYht2bVarceEKSFiyeQw82RnFFAcDW8fdmuYGSojn1wyZIAcaHTXcPUD15MjeeF5WxaWyUDYlRFONgTI+0Y4/Kvb0/HpKUw5eKGAF+lsMmf6NUl5xFQsycxzO7XVOJWaSjUfPEltGFsM89sErrYbN6quPbxiJFfKHvSwj+4e+Gn65HJ5hsnS2aVh/HN10GZyh1gTA7eSXU174XswnUtgov1nGeStnNiqQds0M3T/lZm+8f8caxpJC+AKAIbOzKxJiZ7jwr78hvI6r02Uzz0/xpotM4lsGqbT+Odox/TOQjmEl1b9BwI53oGLuyKf618yV5a6xkZS6yONTpo0CGh0GVeE//X2nTt91p2sJ7UGte0EDeu300VGzPkg6AsBfED7sL
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5844e3b-bf88-4a81-1c01-08d76cd0663a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 09:11:01.8887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nxjIFwagMig+JJHGblg829R1BTVr0tkyTPN2KSPCuPAkLeqhY2IuTWcZukIEGQm2SL9aswO0YeQ5UW7eBR299w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4259
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> Subject: [PATCH] clk: imx8m: Suppress bind attrs
>=20
> The clock drivers on imx8m series are registered as platform devices and =
this
> opens the possibility of reloading the driver at runtime:
>=20
> This doesn't actually work: clocks are never removed and attempting to bi=
nd
> again results in registration errors and a crash.
>=20
> Fix this by explicitly suppressing bind attrs like several other drivers.
>=20
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

>=20
> ---
> No cc: stable because because there are likely many other opportunities t=
o
> crash the system by echoing random stuff in sysfs as root.
>=20
>  drivers/clk/imx/clk-imx8mm.c | 1 +
>  drivers/clk/imx/clk-imx8mn.c | 1 +
>  drivers/clk/imx/clk-imx8mq.c | 1 +
>  3 files changed, 3 insertions(+)
>=20
> diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
> index 9246e89bb5fd..3cb75ad4270d 100644
> --- a/drivers/clk/imx/clk-imx8mm.c
> +++ b/drivers/clk/imx/clk-imx8mm.c
> @@ -619,9 +619,10 @@ MODULE_DEVICE_TABLE(of,
> imx8mm_clk_of_match);
>=20
>  static struct platform_driver imx8mm_clk_driver =3D {
>  	.probe =3D imx8mm_clocks_probe,
>  	.driver =3D {
>  		.name =3D "imx8mm-ccm",
> +		.suppress_bind_attrs =3D true,
>  		.of_match_table =3D of_match_ptr(imx8mm_clk_of_match),
>  	},
>  };
>  module_platform_driver(imx8mm_clk_driver);
> diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
> index 4749beab9fc8..d16530430ac2 100644
> --- a/drivers/clk/imx/clk-imx8mn.c
> +++ b/drivers/clk/imx/clk-imx8mn.c
> @@ -576,9 +576,10 @@ MODULE_DEVICE_TABLE(of,
> imx8mn_clk_of_match);
>=20
>  static struct platform_driver imx8mn_clk_driver =3D {
>  	.probe =3D imx8mn_clocks_probe,
>  	.driver =3D {
>  		.name =3D "imx8mn-ccm",
> +		.suppress_bind_attrs =3D true,
>  		.of_match_table =3D of_match_ptr(imx8mn_clk_of_match),
>  	},
>  };
>  module_platform_driver(imx8mn_clk_driver);
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> index c8ab86fcba7c..0e0f69e881bd 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -611,9 +611,10 @@ MODULE_DEVICE_TABLE(of,
> imx8mq_clk_of_match);
>=20
>  static struct platform_driver imx8mq_clk_driver =3D {
>  	.probe =3D imx8mq_clocks_probe,
>  	.driver =3D {
>  		.name =3D "imx8mq-ccm",
> +		.suppress_bind_attrs =3D true,
>  		.of_match_table =3D of_match_ptr(imx8mq_clk_of_match),
>  	},
>  };
>  module_platform_driver(imx8mq_clk_driver);
> --
> 2.17.1

