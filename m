Return-Path: <SRS0=4/Ea=P7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2313EC282C0
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 08:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5BEB21726
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 08:17:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="sksD1Jfy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfAWIRD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Jan 2019 03:17:03 -0500
Received: from mail-eopbgr50058.outbound.protection.outlook.com ([40.107.5.58]:23168
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726191AbfAWIRD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 23 Jan 2019 03:17:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ys6mu1Ibz5SI6qFInUSDmmjwhAHT2+USmTN32C3cG2o=;
 b=sksD1Jfyr3dn6VYJAX59BeoBbm331ySF7bMK/Obno9Jg2rZLXHlZ0Hb46DT8oI4dscVpaJiiwTfdCI1AY8HNYNv6iw7u02tEqukbcf/sCUoyMFEnTvyuRJWrbL89pnqtjf/Cc9yITr2Z+blBWU72SyRPiFRFXioizDl2ZaBVDrI=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5027.eurprd04.prod.outlook.com (20.177.40.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.29; Wed, 23 Jan 2019 08:16:48 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5%5]) with mapi id 15.20.1558.016; Wed, 23 Jan 2019
 08:16:48 +0000
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
Subject: [PATCH V2 2/5] dt-bindings: fsl: scu: add imx8qm scu clock support
Thread-Topic: [PATCH V2 2/5] dt-bindings: fsl: scu: add imx8qm scu clock
 support
Thread-Index: AQHUsvP8X/dhlMUaA0qet1jV/9hRHg==
Date:   Wed, 23 Jan 2019 08:16:48 +0000
Message-ID: <1548231044-4344-3-git-send-email-aisheng.dong@nxp.com>
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
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5027;6:KPxnFgE7cVQhx6DaL0DoGXwZbjxCxAoG0QwU5TG57CuWik9j5KgK9Hm8UQBSm8hrQ+bAWbvS+qDSJoVRTVv/EqaPj2mQ4TLgp5gA/EEmBrXagws6jgAVZE6ypvyehn8MHDd8KtXej2v2AWISmnNzGkGwEZ0IioYG9tlH52mkjIpTiuFL9TcEqfoixYljkY2TebDrEAA26aPUi2mH0QrnxzIinWbxUWoMEE6UQx6w5SpLnkv38h1JGjWfLyGCn9KhbfETvuoDLj/7ZVrAdbSnstCrs1zMzRWn9t51ZnV+02paM5576DMtezDYg6Qu0Jv5/MVB1Cq9Gmc/ujlTT8DQ8q0TmLgODLPMaw/9t4D+auWI3lGQGUoH3Agte1lOlPK3WPMm/Ub+095FGkBE/P2s/n3fXKg+YSqS4jDoO8XbEyHjH/QO5EsUnx+A8hKZCnQzxzSHJlKoUKM+DwYQVR5Wmw==;5:pQMRP7q4ebqA/zOXEyyB1A7+8N56ZVu/Hdj76bPXFQAryiEWDE0UV6n00slxY6g+QIvWgvUjUfAJVQd8hRpdSWza7BS6LzrWQyjqd9+02Of5chS/dKnGqH4vX685P8zsxsyKX2RddFi+qrakBut2W9Mqsgblsfc+i/2mCobQfgwwS95JHXt1xm9HHWz17RIIC9Fyoz32f5S+hiMaSXVwkg==;7:4jVYsc6Zzi8elva84xbjwgi+yJAdTfeTzl1BaKH9d84yp0omJOcPlfOJ6e0LwjAH5Qk84OC3ChNN9XKNAbx4NzD1kq+prurl8bUby0SwtXAUX9FRHNqDJ+eBdcso3QlOZsNStBLbEBPWeYBQkbpY9Q==
x-ms-office365-filtering-correlation-id: 3e2742fc-435f-4b89-cbea-08d6810b1eb1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5027;
x-ms-traffictypediagnostic: AM0PR04MB5027:
x-microsoft-antispam-prvs: <AM0PR04MB50272902FEF92DD4C6C93B3E80990@AM0PR04MB5027.eurprd04.prod.outlook.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(366004)(136003)(39860400002)(396003)(189003)(199004)(478600001)(8936002)(50226002)(11346002)(106356001)(105586002)(2906002)(486006)(99286004)(97736004)(44832011)(68736007)(36756003)(305945005)(54906003)(446003)(81166006)(81156014)(66066001)(102836004)(316002)(5640700003)(6436002)(8676002)(26005)(7736002)(186003)(2616005)(386003)(6506007)(6486002)(86362001)(4326008)(3846002)(6116002)(53936002)(14454004)(52116002)(71200400001)(256004)(6512007)(76176011)(2501003)(71190400001)(4744005)(25786009)(6916009)(476003)(2351001)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5027;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ohxa50whz/2G5qAA7vXGfjbQk9SG6Rwy8Sr/l3My2VAtUl7g9vvLWT0u97RHa6lBa9mBeyJ1dbAW/FvEE5CZbI0IiINd9Jnkqp1FUATZaL+/JWiuR5+qwaDyJBtyHzbBFRYfUD/5Mr4QSwtisd2yVZZYfIK5peBAt99OHibPoIaJt6MYP9IYz0tNFR1V5AXG72OLF6oyObcaH/DyXtTPrQL/Wkth6upEHqGg+pdEiu0iX+Swq4zGUfd2RsDjT2QwJaySEzEt0J1vsN/PC28lU2YUECUfUiqdRBt7gXmPvAUVS7RGBiMZYWiDK6HEqPvL/lNv9pauiWk48gYHjzG/hBURabRFCfDScBFvEPaJwi9ploWISw+Y4UlbGzH24mdtMnrMREqCKEIFbYaAZtUtFdStwuE3LfTRsDrMZ8ecWfk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2742fc-435f-4b89-cbea-08d6810b1eb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 08:16:44.3090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5027
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

