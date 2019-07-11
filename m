Return-Path: <SRS0=Aryr=VI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C83C74A4D
	for <linux-clk@archiver.kernel.org>; Thu, 11 Jul 2019 08:16:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76CF820872
	for <linux-clk@archiver.kernel.org>; Thu, 11 Jul 2019 08:16:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="cpDSBpez"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728026AbfGKIQZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Jul 2019 04:16:25 -0400
Received: from mail-eopbgr140070.outbound.protection.outlook.com ([40.107.14.70]:14951
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728025AbfGKIQZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Jul 2019 04:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAtwIlaEJjJDWCMvDTb9xG6RijqKv02nfGHpDLgRpB4=;
 b=cpDSBpezBY+fFOkdY0KVCPqDeFn36x0pmcweHYDNh4W/Z+ti9ZLVBpez4m9QwfJHUdBDY0Wiu/a9DOloxEY1A9iDU1X8IldQZzqBEfk5ltZU8mjEH2J2is2cp90MGx/GF1s1ZvtnH7wR8I9z9e2ZkLtcjQs9Rv0pPvT2z3yN9Yo=
Received: from AM0PR04MB5779.eurprd04.prod.outlook.com (20.178.202.151) by
 AM0PR04MB4626.eurprd04.prod.outlook.com (52.135.151.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Thu, 11 Jul 2019 08:16:18 +0000
Received: from AM0PR04MB5779.eurprd04.prod.outlook.com
 ([fe80::a126:d121:200:367]) by AM0PR04MB5779.eurprd04.prod.outlook.com
 ([fe80::a126:d121:200:367%7]) with mapi id 15.20.2052.022; Thu, 11 Jul 2019
 08:16:18 +0000
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Peter Chen <peter.chen@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
        "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>,
        "ccaione@baylibre.com" <ccaione@baylibre.com>,
        "angus@akkea.ca" <angus@akkea.ca>,
        "agx@sigxcpu.org" <agx@sigxcpu.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 1/2] clk: imx8mq: set correct parent for usb ctrl clocks
Thread-Topic: [PATCH 1/2] clk: imx8mq: set correct parent for usb ctrl clocks
Thread-Index: AQHVNxKgU0jGAW0qWEiPnJoqcZgGhabFE62A
Date:   Thu, 11 Jul 2019 08:16:18 +0000
Message-ID: <20190711081617.iruwo4fuiwfbie4k@fsr-ub1664-175>
References: <20190710111917.6615-1-jun.li@nxp.com>
In-Reply-To: <20190710111917.6615-1-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abel.vesa@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65213cf6-62af-4a58-91a8-08d705d80d20
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4626;
x-ms-traffictypediagnostic: AM0PR04MB4626:
x-microsoft-antispam-prvs: <AM0PR04MB46268666D48546150F7F4FB5F6F30@AM0PR04MB4626.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(136003)(376002)(39860400002)(366004)(396003)(346002)(189003)(199004)(186003)(256004)(26005)(6246003)(478600001)(7736002)(305945005)(1076003)(71190400001)(86362001)(68736007)(71200400001)(5660300002)(66066001)(91956017)(66946007)(76116006)(64756008)(66476007)(66556008)(66446008)(102836004)(6506007)(53546011)(11346002)(476003)(44832011)(446003)(33716001)(6862004)(2906002)(54906003)(25786009)(316002)(6486002)(4326008)(76176011)(6116002)(3846002)(8936002)(14454004)(9686003)(6512007)(229853002)(81156014)(99286004)(8676002)(81166006)(53936002)(6436002)(486006)(7416002)(6636002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4626;H:AM0PR04MB5779.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: U6swmqQa8WUc0TSwqZU7tiFrzxk6Gdb4JsuLqeOsIsvCr6dQtzA89BTP12INMhREkMSuXsjCD684hVXJdX1ZXj2EUjj2u/B3pDeRe0+BsKjevZ0XArqMR7lnX0fWG8ckKapxlyYtL3yIXMCZbQIGS6wfPQSbC69b1MbRQEuXKR33k1oNz0PpgT6ryKSCBer7rwbZjrQzL0uyD6mpgrW4+55jzLNknCitTE3VkdWMDYTDJ8In2yYFLPaqDGzD6prDNgRv1G/1d8UdBZbVWuMWXno8LOo5x1v0geBqqzItNm2p+itqbCzWjgcej9IIK+ChC/USYVJjihZWc0JLia3edeStLf8FJmtwl9AMcPR3+m6hzJ42muTL1hbkZjHjigZAc/EuTRFFKDV5CnRoLNn+uSt7qWFXxf6JcnXzDQANvYg=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <490811C2CED56246ACFCE4B5184CA7D8@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65213cf6-62af-4a58-91a8-08d705d80d20
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 08:16:18.4949
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: abel.vesa@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4626
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19-07-10 19:19:16, jun.li@nxp.com wrote:
> From: Li Jun <jun.li@nxp.com>
>=20
> Per latest imx8mq datasheet of CCM, the parent of usb1_ctrl_root_clk
> and usb2_ctrl_root_clk is usb_bus.
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>

For the entire series.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-imx8mq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> index d407a07..c7d1546 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -523,8 +523,8 @@ static int imx8mq_clocks_probe(struct platform_device=
 *pdev)
>  	clks[IMX8MQ_CLK_UART2_ROOT] =3D imx_clk_gate4("uart2_root_clk", "uart2"=
, base + 0x44a0, 0);
>  	clks[IMX8MQ_CLK_UART3_ROOT] =3D imx_clk_gate4("uart3_root_clk", "uart3"=
, base + 0x44b0, 0);
>  	clks[IMX8MQ_CLK_UART4_ROOT] =3D imx_clk_gate4("uart4_root_clk", "uart4"=
, base + 0x44c0, 0);
> -	clks[IMX8MQ_CLK_USB1_CTRL_ROOT] =3D imx_clk_gate4("usb1_ctrl_root_clk",=
 "usb_core_ref", base + 0x44d0, 0);
> -	clks[IMX8MQ_CLK_USB2_CTRL_ROOT] =3D imx_clk_gate4("usb2_ctrl_root_clk",=
 "usb_core_ref", base + 0x44e0, 0);
> +	clks[IMX8MQ_CLK_USB1_CTRL_ROOT] =3D imx_clk_gate4("usb1_ctrl_root_clk",=
 "usb_bus", base + 0x44d0, 0);
> +	clks[IMX8MQ_CLK_USB2_CTRL_ROOT] =3D imx_clk_gate4("usb2_ctrl_root_clk",=
 "usb_bus", base + 0x44e0, 0);
>  	clks[IMX8MQ_CLK_USB1_PHY_ROOT] =3D imx_clk_gate4("usb1_phy_root_clk", "=
usb_phy_ref", base + 0x44f0, 0);
>  	clks[IMX8MQ_CLK_USB2_PHY_ROOT] =3D imx_clk_gate4("usb2_phy_root_clk", "=
usb_phy_ref", base + 0x4500, 0);
>  	clks[IMX8MQ_CLK_USDHC1_ROOT] =3D imx_clk_gate4("usdhc1_root_clk", "usdh=
c1", base + 0x4510, 0);
> --=20
> 2.7.4
> =
