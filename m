Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992C5C282C3
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 13:22:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 69EA021855
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 13:22:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="a7j+AODH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbfAXNWl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 08:22:41 -0500
Received: from mail-eopbgr60067.outbound.protection.outlook.com ([40.107.6.67]:42880
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727622AbfAXNWk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 24 Jan 2019 08:22:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ys6mu1Ibz5SI6qFInUSDmmjwhAHT2+USmTN32C3cG2o=;
 b=a7j+AODHjSLbfR9tHcHX5SOfWVeD5ywaqsz5mACgUVT7PB4P52kyvdav2Vtvu3egnH0GfP1OJMJbiQiwKRvx5ZMRA3cSTkupEIVXzSuAW0tl3m2melWzZr5n5Sdlzj2u4ZPbzX+M1c75e3bdF15gCUcQOTzQD7eT+6D7boG8k2E=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB6290.eurprd04.prod.outlook.com (20.179.35.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.17; Thu, 24 Jan 2019 13:22:36 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5%5]) with mapi id 15.20.1558.016; Thu, 24 Jan 2019
 13:22:36 +0000
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
Subject: [PATCH V3 2/5] dt-bindings: fsl: scu: add imx8qm scu clock support
Thread-Topic: [PATCH V3 2/5] dt-bindings: fsl: scu: add imx8qm scu clock
 support
Thread-Index: AQHUs+ffHdBhiC9Ai0WQGG7Cay5QWA==
Date:   Thu, 24 Jan 2019 13:22:36 +0000
Message-ID: <1548335800-6438-3-git-send-email-aisheng.dong@nxp.com>
References: <1548335800-6438-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1548335800-6438-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0041.apcprd03.prod.outlook.com
 (2603:1096:203:2f::29) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB6290;6:Lv5L09umfxdXKWm8RuzqMmkehnUCPFupxOW1cz1KbOp/KpBM2OYDGeiZU8Jb/mdjpeX3oDb/7PMqsYwaUg0hI+B4Z9xbptbBm3rp7EacNCv0szHklEqbhofakUoJfGJ1YlvEs7oU1+OVeXuSu3Tck2XCnmA1CFtD0E4ZZQvgJlR8aXshBFOdnnPjdAjawiFT8+yPAlJ7hvBTsFmHb4LwDkIX8tSKn0rpiX6VOqtXyBOZsGRm+K2EeYk8im7y/xz0NHBmsweixiPyLU+8T8C1tVhc1iLqQfLXLju7pzogu6PhMHGB9sxyELBrGSbinb8aLvpHhw51yZ2UrhC06GRP5vXY5maV5dTSdLR1Y03kdFq+PM6GUDQN+u4a5DkrucRzLExjvXldVFu4pJNijlvvllatbr+bXlg/xxp+VsfFCu/+lTAk/5bPMzSQU6ZjDNkPWflB3Lg9Y9Xg7FS04pCw7w==;5:yzc8OYi+F6YgU+hGRc4D+JUAno5t47v7WpKj4qYNxm0vrgwdpunxgSZKmsV33j28xE3p84xsYAynuHAJ05KnaxkMV9lIAGJj8W6YMhU245cZvjuXqyQiBWtGMpP/VPCLJH1gwKvexhjABlo8+fKtUIjXj4HDQOHyVtwpixP5ROTVDJqujwrGHEkEF8qw/q/RifewMJIatV8/aCIAQZlC3A==;7:vxfMJqsXVtDp6XLp75hbHO0uqMth+QoiJARfi3OJCfNj0pAs16OklQ4Nbx0mTV2uBy7lZ/6ey4yLMulwIsM+4qCk19v1apOIJ10qpg5nQAnakohnfUrZnXNepCdN4CWv4mjEldwsfCWalrBNfQmSVQ==
x-ms-office365-filtering-correlation-id: 6451c386-9ce2-473a-8b5e-08d681ff0186
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB6290;
x-ms-traffictypediagnostic: AM0PR04MB6290:
x-microsoft-antispam-prvs: <AM0PR04MB6290505AB3DC87025233AEAB809A0@AM0PR04MB6290.eurprd04.prod.outlook.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(346002)(366004)(39860400002)(396003)(189003)(199004)(446003)(2616005)(476003)(2351001)(97736004)(478600001)(68736007)(256004)(6916009)(25786009)(11346002)(71190400001)(71200400001)(14454004)(4326008)(99286004)(3846002)(6436002)(44832011)(105586002)(76176011)(52116002)(6116002)(81156014)(8676002)(81166006)(6486002)(53936002)(8936002)(2906002)(86362001)(50226002)(186003)(26005)(2501003)(305945005)(66066001)(7736002)(54906003)(102836004)(486006)(6506007)(6512007)(316002)(106356001)(386003)(5640700003)(36756003)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6290;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cP/BzxGim9zkZlz3g+YrgZPKLs5vRDs3bz0xZNmcFt6Je2g6H5n6Hmi2thMSMzzGwMVN2xsHh0f8BzpXOsjK8pLh8YlePMvsc+wsdB9uk9V6Kf0tVfpvZHQ3O4ghnZd5jx+Xn96ZIYF6R6z2tgjUMjzV/vPRQtcoi/7AlLCtpClcOgLrlnlwsSicz06tO4RnpVrQk3eCNcnjMFznYnRmpwfUlk2IRwGvL6aiKAQR5zALJRBQFocgVTw7CzOPxqs1Oeq2EKOHQ9u5fg7iyr5UbG92nr2OvWiLEA/AwMQSsS2lV/euF5EkmZBBxF/vcyZi749yzpIgtvwAuewiYpY/r2bPdcb+MUKwej9CcBLYNe4nm85GZr7kZxKsUgkJuJBdX2sfzDgsDr2wXslh/BtZ3k1VrQtWayhQTRRhgWyqi0M=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6451c386-9ce2-473a-8b5e-08d681ff0186
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 13:22:32.6927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6290
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add imx8qm scu clock support

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/=
Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index 6b4e24a..72d481c 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -75,6 +75,7 @@ This binding uses the common clock binding[1].
=20
 Required properties:
 - compatible:		Should be one of:
+			  "fsl,imx8qm-clock"
 			  "fsl,imx8qxp-clock"
 			followed by "fsl,scu-clk"
 - #clock-cells:		Should be 1. Contains the Clock ID value.
--=20
2.7.4

