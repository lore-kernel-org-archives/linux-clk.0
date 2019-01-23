Return-Path: <SRS0=4/Ea=P7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99599C282C0
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 11:17:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 681E620870
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 11:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="gjEvAeR8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfAWLRP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Jan 2019 06:17:15 -0500
Received: from mail-eopbgr60076.outbound.protection.outlook.com ([40.107.6.76]:58880
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726359AbfAWLRO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 23 Jan 2019 06:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4tdytffGcxslRl5rX9yst+JBf4iEA778GSGKFKXXsY=;
 b=gjEvAeR8rpVBj24Il6UI+Nz8yTBi2tz3q/7ycFazEQ8SBSrO+MEngtnLwuOL3O9vlOnr82t/7+czrzlYBXAi6cKNiugToqlWbnE3UVkByW/BL9lEyE00XD2LqiTTCDUm3pk9VKPi9ATzHBPsFbRDyxp/Ob2n7NsC9tgmyibBo4o=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5044.eurprd04.prod.outlook.com (20.177.40.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.27; Wed, 23 Jan 2019 11:17:09 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5%5]) with mapi id 15.20.1558.016; Wed, 23 Jan 2019
 11:17:09 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH V2 3/5] dt-bindings: clock: update CPU clock ID name
Thread-Topic: [PATCH V2 3/5] dt-bindings: clock: update CPU clock ID name
Thread-Index: AQHUsvP/O+Vf7Z/SeUispxSFpbwAC6W8tBog
Date:   Wed, 23 Jan 2019 11:17:09 +0000
Message-ID: <AM0PR04MB4211EAC52F0744EB516717EE80990@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1548231044-4344-1-git-send-email-aisheng.dong@nxp.com>
 <1548231044-4344-4-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1548231044-4344-4-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5044;6:NP+XnlVAlxkFkfZzFXJ4NTL8jEHohOClYeEKQszUbi2W54ythy+CvsiIeMkd6bTIDoMioTTGCz2DWpJNYsX6T8GpDWAP/I+IiNxJNpclrT8x0s1g5+KPdI8zdeogRCXrcTf8yLvHMHzqWhd2HV9QGZlpTM39he+0hi+OW/ojdz5TA73GHyeSonmXy3a+kJ/PZEVql2mkjeRcMQTCGKqdAEsD1Bn2GKX3kj3oMm49unGzz388z1k6NHVUY3yr5p1c1iJViHGptbaj/vR3ubIXYpZlvGCgsUBfBAcVukC0fco37+QpuiNDEdYdHVNH+cOsHgOEx8j4GJWEQS6o2+zz2xq6dUghU6UIwi3odD4XU2l+HrAWEwLm4LTmst8hXUw481xG/RSMTrlf3r0HJWXHka8sFM6++8K6QN2OIbkw1tCAe5Kcn/yAXAh7REd20eMZEZCLD1TZi24R0k6MeagQ9g==;5:0uvZnQtVUasqsf6GEJNjpuG9LGXXcb0SzwinD/YxUywrOmFfwR3mAuzpEIPfXnmuXd8qFkFHJk0Bj1yzkPhWfhuioV8loG8T/DWl3SnBtIHPMRJj2PFFXxIW756wO32CoVVTtNXh+60GmwCzBfYn3EgBgtnF99spuuKbS5vuwDoibfLvdLta6qZ9In63JtH6KXGTpDigTEKJsiQS3qjQzA==;7:/9HLGHIA2IcRuXiGtFV0nbzwlqxv6jr1l1VWeIz8guXZRQOXk98CE9STC+GE0XZezuEa5WqTQYnfyY4Y16oPRvKc4tMz808qjms/7sxJbaD92YWRlUWDsCPlkB1FJFWk7rRmY3YcLplpMNkGzL+/4Q==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 48ec3339-cc10-4a4d-3f25-08d6812450c1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5044;
x-ms-traffictypediagnostic: AM0PR04MB5044:
x-microsoft-antispam-prvs: <AM0PR04MB5044E23DC8BF952C0A64DB2280990@AM0PR04MB5044.eurprd04.prod.outlook.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(13464003)(53936002)(53546011)(256004)(229853002)(106356001)(6506007)(14454004)(102836004)(2351001)(86362001)(97736004)(26005)(76176011)(14444005)(2906002)(6436002)(81156014)(7736002)(305945005)(105586002)(81166006)(8676002)(8936002)(99286004)(9686003)(7696005)(71190400001)(71200400001)(66066001)(478600001)(316002)(74316002)(68736007)(486006)(3846002)(6246003)(44832011)(55016002)(476003)(446003)(11346002)(4326008)(25786009)(2501003)(54906003)(6916009)(5640700003)(33656002)(6116002)(15650500001)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5044;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AiwT/3ehutMA9RF2fRWrJKgb+VfIwZMhKIMtsMm1qvJWeIMphlfuyegG3IXN6bFituJcThVriOlixN1FPaRSW12ZgOvYm7vEdkRbqlD/MNQNcrENHtf8LsX1//7YC70gyCRgUuGAv3wvCLoHoYZECLm6Dk7tCWG9KVpotPInil0RflP8dY+vBEYl3qxzafEGPSBA5NIl9iS0tXpbQ2Qza0T0LWC2jEvzf0n+JZiEYOXKVkr4CkARoG9ASyPjXNam8ZgbRGwfXF4FS4mbagymKDxZ5NNT0rxTu+hl40da/lNM1QSExHbJa2L01ajt/85WtGrVCUwZDZBH0yLheTwUyc3+Y9YQue6kx4x7C3OPAT+dmaOCBwpithPSj6hRxu4UkHxVTHfL0F3JVOK+afeBbkBatnlV0SOiTH92KtH+r6Q=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ec3339-cc10-4a4d-3f25-08d6812450c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 11:17:09.2000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5044
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> -----Original Message-----
> From: Aisheng Dong
> Sent: Wednesday, January 23, 2019 4:17 PM
> To: linux-clk@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org; sboyd@kernel.org;
> mturquette@baylibre.com; shawnguo@kernel.org; Fabio Estevam
> <fabio.estevam@nxp.com>; dl-linux-imx <linux-imx@nxp.com>;
> kernel@pengutronix.de; robh+dt@kernel.org; devicetree@vger.kernel.org;
> Aisheng Dong <aisheng.dong@nxp.com>
> Subject: [PATCH V2 3/5] dt-bindings: clock: update CPU clock ID name
>=20
> Update the CPU clocks to CPU cluster clock.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  include/dt-bindings/clock/imx8-clock.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/dt-bindings/clock/imx8-clock.h
> b/include/dt-bindings/clock/imx8-clock.h
> index 4236818..aa9b9a0 100644
> --- a/include/dt-bindings/clock/imx8-clock.h
> +++ b/include/dt-bindings/clock/imx8-clock.h
> @@ -12,7 +12,7 @@
>  #define IMX_CLK_DUMMY				0
>=20
>  /* CPU */
> -#define IMX_A35_CLK					1

Sorry this one breaks the building as clock driver already use IMX_A35_CLK.
Will update and resend.

Regards
Dong Aisheng

> +#define IMX_CPU_CLUSTER_A35_CLK				1
>=20
>  /* LSIO SS */
>  #define IMX_LSIO_MEM_CLK				2
> --
> 2.7.4

