Return-Path: <SRS0=xK8l=PT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44240C43444
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jan 2019 11:56:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0902C206B6
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jan 2019 11:56:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Nhi5kcgY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731280AbfAKL4A (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jan 2019 06:56:00 -0500
Received: from mail-eopbgr20064.outbound.protection.outlook.com ([40.107.2.64]:57488
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729237AbfAKL4A (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 11 Jan 2019 06:56:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvChuRwk1T3WH0IZydd5m0qOvbed2iqMx8njoq2D8Qg=;
 b=Nhi5kcgYRwW0HKJf9Zf9EurxrG91B2fLJMvMzLIfSP4ymozdkfxepoohX5iLkxeYo4UiSnxMwU64K9zZjJfn2EHV0b7tfh7TCPZ0QqFVeso8slRmDgYHfuWvtMDuvDyOZtAHJ7TUH+moR3oN04rr5kponKfaXsB0FbdTuRmFlGM=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4659.eurprd04.prod.outlook.com (52.135.149.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.7; Fri, 11 Jan 2019 11:55:56 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5%5]) with mapi id 15.20.1516.016; Fri, 11 Jan 2019
 11:55:56 +0000
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
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH RESEND v1 1/4] dt-bindings: fsl: scu: add fallback compatible
 string for clock
Thread-Topic: [PATCH RESEND v1 1/4] dt-bindings: fsl: scu: add fallback
 compatible string for clock
Thread-Index: AQHUqaScouu+rHXVuEW5bMOSXvrk/g==
Date:   Fri, 11 Jan 2019 11:55:56 +0000
Message-ID: <1547207400-28307-2-git-send-email-aisheng.dong@nxp.com>
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0063.apcprd03.prod.outlook.com
 (2603:1096:203:52::27) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4659;6:/OztD89ox2kzO3ZcQSdALTBMKOC59352+0ayoI51q7Yb1w1ic/mSOt3KR3PZzEfN4FWCwLlZ79TPA85of94bP+fBahrrCKtYjbOVQccZy5KtASGlBPk7CQSKpl3q9s1vC3y1yvUmulLOnfqtAXUqvwRjs35oxErBzIp72Z2XABpm+lbZSF0lZyl5sfPZ+LXfDL2d7sNCb+OI8bS7uXHML+7gYvePBuu5c4qgORM4ZLG/RPzt4eCHTarKjxPlUBI5S1GtFAEhjRWK+iKjswpa1Jr41f4XwwyIycyt9AAd/3GUGiRGb/4441XlURVsdH1SHxioLgQNCsH3T91GKSUDQgf1FYNFn6OJDVFcMeOyTlA8weGCpVozJItV8HYABiSyY+GkSum10p1jEginGA1DNMDwsIj5qX0UJuKo+fsYqQL8gs3WpBrlrqJmxwGQ9SbAP6tJHEZSBm2r6Khynd71ww==;5:GtkoA43BbTLCcVcwqrQ1SO/a0nnEC1IvCHCB39+6E388rwHsVkQnDqPphrqYYdv2hDxovJ2DpwKtoN4l4AUfQQUKyER3g+oqrwNJEP1GvBppftj1KQoJxIS1Mlm763XDjxaS0l9GwLa4/Cze+gTn35uPR4+DXKDO4AqB9Q1CsTZ230eWggbQVtYx5zKXQYbPA2VJ7hJh/UdaKBgiVu+C9Q==;7:jXaIHM9h+mzIFG+eCAFSRC+EIEvlWZjuc00FLZXCY9a/5W9DClAb21ho9Zket4x7EnhBaRx/QxVZv3H5rsEzgK4tlgB/HBL+R8zRaUdVuOjUwg1PLo4XkOVkFp6KcU3JejPuco8n1hrGnsHiZ7As3w==
x-ms-office365-filtering-correlation-id: 431fc9ea-ba6e-4096-c6ac-08d677bbbeeb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600109)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4659;
x-ms-traffictypediagnostic: AM0PR04MB4659:
x-microsoft-antispam-prvs: <AM0PR04MB4659D3381C1919720F8CB42080850@AM0PR04MB4659.eurprd04.prod.outlook.com>
x-forefront-prvs: 09144DB0F7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(366004)(199004)(189003)(478600001)(316002)(2351001)(54906003)(14454004)(68736007)(186003)(105586002)(106356001)(86362001)(4326008)(71190400001)(71200400001)(6486002)(76176011)(52116002)(53936002)(5640700003)(25786009)(6436002)(2501003)(6512007)(5660300001)(97736004)(44832011)(256004)(99286004)(102836004)(6916009)(217873002)(26005)(6506007)(6346003)(386003)(11346002)(305945005)(7736002)(36756003)(50226002)(2616005)(486006)(66066001)(2906002)(476003)(446003)(6116002)(3846002)(81166006)(81156014)(8676002)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4659;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FdHuVlgagPrpZ16iOYbsD3BZ4XaBMsKTZe8ehF0+p7NMUNfarVZO72OyrM7tHPuxwkWgVokPwsFao9BGXC975xHLOSf0qHY32z5y563t19C0E3n1aan/kzCWEIKHN786DQZnY82BZ1D7Hdcjvyt41qJFjOELlIOpCUNUIvglBceTyo7BZL9QmQvbg5ZBb6iU2vH3cum4tJ4+pbtywtfQdLpLPz9G4wU6V34ZOVSgDrKDazedaAf/czgF/orI0gAvMl9nIVomuhQqmFImvAhoi4B8A4OCGqHHBzucfIvQxGhMbpk/dTD3Xf03mIkCeCG3btlELm2OPfyGvHvjQXxGNz56CrEpO6s5Y/Nt4CjXQXNLkwEilR227DjCJGtg2W43MGJpCwfWey704AG8bGpItwNc1S4vYCKI7cikemICrI4=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 431fc9ea-ba6e-4096-c6ac-08d677bbbeeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2019 11:55:52.9991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4659
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
Let's add a "fsl,scu-clk" fallback compatible string to allow other
SoCs to reuse the common part.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/=
Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index 27784b6..5ec6dca 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -70,7 +70,9 @@ Clock bindings based on SCU Message Protocol
 This binding uses the common clock binding[1].
=20
 Required properties:
-- compatible:		Should be "fsl,imx8qxp-clock".
+- compatible:		Should be one of:
+			  "fsl,imx8qxp-clock"
+			followed by "fsl,scu-clk"
 - #clock-cells:		Should be 1. Contains the Clock ID value.
 - clocks:		List of clock specifiers, must contain an entry for
 			each required entry in clock-names
@@ -137,7 +139,7 @@ firmware {
 			  &lsio_mu1 1 3>;
=20
 		clk: clk {
-			compatible =3D "fsl,imx8qxp-clk";
+			compatible =3D "fsl,imx8qxp-clk", "fsl,scu-clk";
 			#clock-cells =3D <1>;
 		};
=20
--=20
2.7.4

