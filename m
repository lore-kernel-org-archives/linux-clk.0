Return-Path: <SRS0=4/Ea=P7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37123C282C0
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 08:17:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0529521726
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 08:17:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="K6EBjYH4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbfAWIR5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Jan 2019 03:17:57 -0500
Received: from mail-eopbgr140059.outbound.protection.outlook.com ([40.107.14.59]:24264
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726313AbfAWIR5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 23 Jan 2019 03:17:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my6PkXqEDL51lPUB4QH1PsIQooA6ziS1Wj4ZvbZdUnM=;
 b=K6EBjYH46kXNJv+Ara6Yhkr7flG0Fo1+Po095FO0SfI6hanGeBG7ktgkZ6f5IEORAXyPzgUZA8Np7yOiMTZGRb+vbxXylB+GSYfsacgkLXWpFfSazv6eoYtIcpmLONaDH8CYFcBajiIMNYBJtWFBYugPovdhI8D7xN9bQUKY2aM=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4482.eurprd04.prod.outlook.com (52.135.148.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.30; Wed, 23 Jan 2019 08:16:44 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5%5]) with mapi id 15.20.1558.016; Wed, 23 Jan 2019
 08:16:44 +0000
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
Subject: [PATCH V2 1/5] dt-bindings: fsl: scu: add fallback compatible string
 for clock
Thread-Topic: [PATCH V2 1/5] dt-bindings: fsl: scu: add fallback compatible
 string for clock
Thread-Index: AQHUsvP5vkju9pZWG0y0vnLUJ2sC7A==
Date:   Wed, 23 Jan 2019 08:16:43 +0000
Message-ID: <1548231044-4344-2-git-send-email-aisheng.dong@nxp.com>
References: <1548231044-4344-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1548231044-4344-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR0302CA0020.apcprd03.prod.outlook.com
 (2603:1096:202::30) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4482;6:7NgtfLy45HsZbDr+x2jEdj6rOrtCcmiCmRM43+2zSIzrx6eki1q5gu1Ny8yw71iTJ+NMZrb41DWgibL+YTj+Xb7WCEUHl4Bxf23LQS4TJY4JpituKUv7YAgdLotLKoVRLvr/5fcMWaQk/I8sFBImrADKiM277KlHPkYhBoxLcXWc4QF4qJrL4/tNc1ZN8lOQjEgtLQq8W7t2X4qKwiW//evJKM+kdfGTF/BYCXJBeno9LieXgYW3LwG8XwwOi2ZoI9VE6ZDsgA9XT8ED3EWtPGK+1u+0hFLSsL9dLoIpxBIeSKO7jWlPlkHK/mAp3Bk/QGs+9OiP9FWvHzGxmM/GP/e/8rATW6I7WyIUuaOS5/eObp4xiovgmrH+VVDiF3TQaGWHnPJQY2CWiqtBsqSPOjhWHBukWPNZFqxWIaKUQvl1ZADFr/8blt7C2hohWzexAk+2MhfsVOHuTLBiVaJJPw==;5:KXZ7NALBSfUh5vLd3rkbfWqQvSsihSeIgmt3Z2QyouvSuz+G+5OPQ1xnZZWEkNMB0Bsq2WbsCpd0xGU6nK9vxlPgCtm4BaZNkYAMeyOzITaj4cxgIboXwWJH2AezU55lyHbvmuBV5hHaTvFi41W7Mz5IbyhWPNWNyUS613hBAA8G90PldpCEW+0V1RIXuhn6JMyH68/tyBbbJDUG5Y3vbw==;7:Sy6TdyHt08vaq6WFf/qdpWC9DHx2l/Ml3nEBDHuioBv4dApCMkc19ZPklCT4zmEaze6Z0XODi7ukVp5Y9rmHbj1wqBBeittEu81CvkTknrOkknXTayAtvvPmOQZgdidEdgWWavGVtbtTfHxobSA83A==
x-ms-office365-filtering-correlation-id: 76582ca3-7188-4cf2-3573-08d6810b1c35
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4482;
x-ms-traffictypediagnostic: AM0PR04MB4482:
x-microsoft-antispam-prvs: <AM0PR04MB4482C60FAFD90417FD2F426980990@AM0PR04MB4482.eurprd04.prod.outlook.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(39860400002)(346002)(376002)(396003)(366004)(189003)(199004)(8936002)(2501003)(50226002)(86362001)(81166006)(81156014)(8676002)(305945005)(7736002)(478600001)(14454004)(66066001)(25786009)(4326008)(97736004)(6916009)(6512007)(53936002)(106356001)(6116002)(3846002)(386003)(6506007)(105586002)(2351001)(26005)(102836004)(54906003)(68736007)(256004)(99286004)(446003)(2616005)(6346003)(76176011)(71200400001)(71190400001)(52116002)(6436002)(476003)(6486002)(316002)(44832011)(2906002)(486006)(11346002)(36756003)(5640700003)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4482;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lhMr/XSPUFLZrQQLrVaoLpXgS/gBlM0G3ys0LebYWl5stLvxEvPNBBgr8KtioIgVbQED/Z7JYDS4EtqUrnrlvNGfKKmqrGVFaP3H7elOD2hXRyjcThXEQYGziOH89njOiyuU7qcWiAUyRede9YLTkSrRiceIZJj9dzUx3PJVPHXnY/izcUGUYQ5PqZdRT/yMHGO06QL8ufiDVVEIgjClKEwAHY9EC6pVXIEFakaAV/0A0HsC1rmxEu8J83lta4w8IMGjAGwuomEH6Ar0w4YrJIAe9ZjXEVWhAnxjtGFbiu87D49YQ92q/SjLq06bI21AEe6VpBOUH8C/hLMm+2mZD4wv4TDiCAG8fnQZXlgAfIYHEzmJGEhvin80UpWVKVLYU/2hsQoHY4ZovP89FkSyFZq4t1Z1CUt8ODiVTNnS/TU=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76582ca3-7188-4cf2-3573-08d6810b1c35
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 08:16:39.8979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4482
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
Let's add a "fsl,scu-clk" fallback compatible string to allow other
SoCs to reuse the common part.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/=
Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index fd2bed2..6b4e24a 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -74,7 +74,9 @@ Clock bindings based on SCU Message Protocol
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
@@ -141,7 +143,7 @@ firmware {
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

