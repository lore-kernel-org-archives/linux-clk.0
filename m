Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86615C282C5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 13:22:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5900321855
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 13:22:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="vFozD2Uw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbfAXNWg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 08:22:36 -0500
Received: from mail-eopbgr60080.outbound.protection.outlook.com ([40.107.6.80]:64480
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727622AbfAXNWg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 24 Jan 2019 08:22:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my6PkXqEDL51lPUB4QH1PsIQooA6ziS1Wj4ZvbZdUnM=;
 b=vFozD2UwgruSEVLBnyFli7/0F4XYSZUgu8PvKxVPDDHYf40/rNqMIvDZ6bZEuBLDsDAJUUx6KjcQzaGpB68dgXL9lgvEVxTjd3qGp6s6Y7KsxgrcK7H4z15jCODUTpLruxwd5hSsb11DGJTJwM6eepM+zYHwOJ2f9CCuhPLwLoM=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB6290.eurprd04.prod.outlook.com (20.179.35.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.17; Thu, 24 Jan 2019 13:22:32 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5%5]) with mapi id 15.20.1558.016; Thu, 24 Jan 2019
 13:22:32 +0000
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
Subject: [PATCH V3 1/5] dt-bindings: fsl: scu: add fallback compatible string
 for clock
Thread-Topic: [PATCH V3 1/5] dt-bindings: fsl: scu: add fallback compatible
 string for clock
Thread-Index: AQHUs+fcsApJE9oumkOI4l392Tw7Qg==
Date:   Thu, 24 Jan 2019 13:22:32 +0000
Message-ID: <1548335800-6438-2-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB6290;6:uGlo4SRK4BwnJjncAfOOi8QOlXpxC88TegRjKnlVHUFcKvBsldVUHD2eH58hjY3ZXpg62vQf/e76P7qUgWRY5PcB8I+J/AIUynvYnv+02SJCAcYvkB1umjJT3FAaN/KyX419mF+MLppYpVAqnB6cVLfmT3wHOewt/RUGWHx8DAiAtrpQRL7VEJ6e8m3lhDlYSG1h67h42VlsmuRpAcfqJIgIly4k9HaAvLCJArLnrM6u+uUO9gryMhQ0vg7RAlzl6btKRaRPHeUzdsUPRNdae5xw9J2A9NW1l1kXmHN9ZqoduAkORbVYsm+4sE4304AS+uC5Qt+U5HWS96D3+W+16vsC8d0bXzH1NM13gxHjYdvXFIMZUKJtwOsC4emsxg+Ib+JE2u+b1Ojkagt8OKCHOJuthQsczrkmYEVnJcPS8AOOV91bS//7fMzWR4MLagqPdFTd9CflpLISDAQlo5NOBg==;5:ZQ4kTYABAzEN4p8O99j7NAPACyMF5Evdi917zvuEVUsXyq/+g5+RHhQNlfPPsBGT2EJCAYIfF7tsEaYi3PU88NvX2vuYq4bdnvcGyv37NklSUW/gxkE2/4aDnFsqciZoB5btRcW4xBMAYPrl3YlLwvjO8k6AjIBwh96GNPowFi4jjIpuC/hpttkU9FIVTSqrqJP/UVA/+lKhDVvDj//A6g==;7:dyOFOU73lZYYMZGsWMZGTgyCqGGoy5OcY9KtWHezg3UyYCY2ZOgfnSoX7ybuEEO/wQz28U8gMo4DBtr6sfHcyGa49pSW4c78DTjfa0MFo4ZQHGZMDW5ib/dv/iOXYy02SAWbWrwjdrfz047Xju/w8g==
x-ms-office365-filtering-correlation-id: 625240e9-9279-4977-b81a-08d681feff1e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB6290;
x-ms-traffictypediagnostic: AM0PR04MB6290:
x-microsoft-antispam-prvs: <AM0PR04MB6290C836D9F4A286DFFA9D57809A0@AM0PR04MB6290.eurprd04.prod.outlook.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(346002)(366004)(39860400002)(396003)(189003)(199004)(446003)(2616005)(476003)(2351001)(97736004)(478600001)(68736007)(256004)(6916009)(25786009)(11346002)(71190400001)(71200400001)(14454004)(4326008)(99286004)(3846002)(6436002)(44832011)(105586002)(76176011)(52116002)(6116002)(81156014)(8676002)(81166006)(6486002)(53936002)(8936002)(2906002)(86362001)(50226002)(186003)(26005)(2501003)(305945005)(66066001)(7736002)(54906003)(102836004)(486006)(6506007)(6512007)(316002)(106356001)(386003)(5640700003)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6290;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RXJ5RInNZtdNIwudtBdg2ct47MZxJ5soHqNVCfQ7sw0ZzYmC/2QZ0GovpzIdbtDH2z6dhNwVyxnEjc90kHsmZen1uyB7y/oFUBNrVUFFLKkfCDpKi777MhnzQn74/H2EE6MvImqvHvy4cWGf5Aj0mqJr6YxJfT6OWZWErltm+QHThWqaxUymRqLAg0WbEC/5dhMpZY7A228psWVHHrAm7VMxcNL9YGvfJAi2LNIHdD2eZfbPVCT8O6uDsm0dA0W9sept016bMsG8pxdv5lEaRvQVfXDKb3OVns1EuhZfJVQ9Hfm+e1x3Ad38zB6Bk4Qn+XVew4kmNCPWsFXPFPpzuLA6riCamIX888n1C583QmnvIZPK1b12VH4GCqLpt1iCBZRSeGWY/Ceu2edgcXjvnyA8y1MK6fZw+VWnCFnagVk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 625240e9-9279-4977-b81a-08d681feff1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 13:22:28.6508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6290
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

