Return-Path: <SRS0=4/Ea=P7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 029FDC282C0
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 08:18:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C75A421726
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 08:18:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="SPeWV7wo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbfAWISS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Jan 2019 03:18:18 -0500
Received: from mail-eopbgr80042.outbound.protection.outlook.com ([40.107.8.42]:31939
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726000AbfAWISS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 23 Jan 2019 03:18:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HGcAM/Kg0Rdv4gAysl/NX6pAtDiNHmURi5YyZD1Fqc=;
 b=SPeWV7wopRP/2ImXZ+2m80M3O4bi4fgDdQyEJbcb0A/gw+UViTdLVVAaGHCJ1Wdc+tUjKKnu5vs6Du+twhGSEDpu6SvVbJdARMMZn1Jr1+tI4fAKxUXCHCS8mScgl0oH6PU4QSyj9409ueaMeITE7hGscjxsVLHgRP0mPdEDQeA=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4868.eurprd04.prod.outlook.com (20.176.215.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.30; Wed, 23 Jan 2019 08:16:57 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5%5]) with mapi id 15.20.1558.016; Wed, 23 Jan 2019
 08:16:57 +0000
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
Subject: [PATCH V2 4/5] dt-bindings: imx8-clock: add a53 and a72 clock id
Thread-Topic: [PATCH V2 4/5] dt-bindings: imx8-clock: add a53 and a72 clock id
Thread-Index: AQHUsvQBv1nDvkcLuE+d8HosfCRNJw==
Date:   Wed, 23 Jan 2019 08:16:57 +0000
Message-ID: <1548231044-4344-5-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4868;6:SvsMfAv9GPjSreIW9PcWBKFeCIddbjvHHwIsj76bMZNKA/WN1O4kpgTs2MAmPmcO2gGZrnfiiviMZqOl2feAZTiSKvqL3ICwOzkY1745VCYt3FO7BaGUnwVrEpfsrVfrfJFfN4wjHE2D0WjxyVwiIxhfqLTKeA6BA5y0LdMQPrU6VQvej2zDWV7NjLh83ER6VnKiir9IcS/4ozzVjogCO7aA8hb1uNYKlaZ4FbPl7bexCfa10iBpzr7f+i4bRuEUOFltoJKUfbx3OIPGrIpZUhwvb/MN+QUGPzbFi4sUWuQoEjhiJQHGh+W2i2k8YmMTXMgxW/9zdym5RvXRRvE35bQ7wd4ptCNYkMrX6WrzdIQKu1hpkm4jwEN8IR8dofT2fNFVPHRY7B8elzJaE8Lf+ey5HqLfqPbUhblOJm83/BO2W0s+B4NvnNIDVFG3amg5ypw4W8GYPjEQ7+hmhGSmiw==;5:hiMsyc/c3LLfTUig/4QY/QSynou1OkcwG9ZPbUL2as0yWBJQhxPZjxTW+saUH8LlsGCbZX1CMZhf4N1LYAbXAk2eCASdl0pbazGW3ISJiyPuHMTBbhXxfx0aDHOlBV5dgO3oX3SgIKkCfRHPV5stgfaxhz6bY4aVGnPmB+EIeYodQ6MdIJsKRCJqfWqcH2TyovBlUNnOahXM8PeCGNDnBA==;7:bgR8rA5weuOb0X4uQAYmHNNhQBUlXywlVlnqlJmbrpRXwmss2cZs2lT1Vb/ArciBAKTLglgyyKyZf7sVpoTkRGeMYhOWTzYFZ40PKj8SXw3JEP/pLucFhW3s7/RbIEVpUz4ch8JMaSymuVK/CTMQyg==
x-ms-office365-filtering-correlation-id: 714e4175-acee-452a-06b5-08d6810b23e1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4868;
x-ms-traffictypediagnostic: AM0PR04MB4868:
x-microsoft-antispam-prvs: <AM0PR04MB4868C72F2DB03D7D920B117380990@AM0PR04MB4868.eurprd04.prod.outlook.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(39860400002)(396003)(366004)(376002)(189003)(199004)(86362001)(4326008)(14454004)(53936002)(6116002)(3846002)(7736002)(26005)(386003)(6486002)(6506007)(186003)(2616005)(71190400001)(76176011)(2501003)(6916009)(25786009)(2351001)(476003)(14444005)(52116002)(256004)(71200400001)(6512007)(2906002)(105586002)(99286004)(106356001)(486006)(50226002)(478600001)(11346002)(8936002)(316002)(102836004)(8676002)(5640700003)(6436002)(68736007)(44832011)(66066001)(54906003)(81156014)(81166006)(446003)(36756003)(97736004)(305945005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4868;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2qzU37yBegLjHmrUqQUv5IKF7a5gGBwg9HzE3NjM2X/T5hO6dsfgPboWijLmBTal2jCTwlmTbmdTWxrB7QBMb7P5GjsDOJhm19L8OlukQWYF/Bql2g3J/skKuF7gxAXzOl4yvraGnbHN0E46dYGKjAmXCjcw0ueL8wg8o6M6c7k/DGy6xY1Ax1FypjW+li/2w8knszq+6HDarkmZpx8P8hstEYk6d0vx0SaAZbMD3egvnJRJ8xCcHqbslj2x++3MzhsDFSiLKiGiuR0dg7FFPDuGhX7Lfm757/aXR1bYuMJTu9jFQ5T+Q9Oqeadk7Us9yOYWCu14Uh2lj7kJekm3c6RX/6BFSRSDYYDoVSY/RTuXMtDiEgSKlJYVq7a7VS8X5nM7YTJ21F3bN11EyfROgKLW9nkT/F0DNhs+5/h6PYY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714e4175-acee-452a-06b5-08d6810b23e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 08:16:53.0171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4868
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a53 and a72 clock id, as there's still no users, we update
IMX_LSIO_MEM_CLK base to start from 6 to allow a53 and a72 clock
id to be continued with a35 clk.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
v1->v2:
 * change cpu clock to cpu cluster clock per Rob's suggestion
---
 include/dt-bindings/clock/imx8-clock.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/imx8-clock.h b/include/dt-bindings/c=
lock/imx8-clock.h
index aa9b9a0..cb8aeea 100644
--- a/include/dt-bindings/clock/imx8-clock.h
+++ b/include/dt-bindings/clock/imx8-clock.h
@@ -13,10 +13,12 @@
=20
 /* CPU */
 #define IMX_CPU_CLUSTER_A35_CLK				1
+#define IMX_CPU_CLUSTER_A53_CLK				2
+#define IMX_CPU_CLUSTER_A72_CLK				3
=20
 /* LSIO SS */
-#define IMX_LSIO_MEM_CLK				2
-#define IMX_LSIO_BUS_CLK				3
+#define IMX_LSIO_MEM_CLK				6
+#define IMX_LSIO_BUS_CLK				7
 #define IMX_LSIO_PWM0_CLK				10
 #define IMX_LSIO_PWM1_CLK				11
 #define IMX_LSIO_PWM2_CLK				12
--=20
2.7.4

