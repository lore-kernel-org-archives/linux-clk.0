Return-Path: <SRS0=x0k0=O4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B208C43387
	for <linux-clk@archiver.kernel.org>; Wed, 19 Dec 2018 15:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 09E9120643
	for <linux-clk@archiver.kernel.org>; Wed, 19 Dec 2018 15:27:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="fTHEl9fN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbeLSP1Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Dec 2018 10:27:24 -0500
Received: from mail-eopbgr20042.outbound.protection.outlook.com ([40.107.2.42]:20640
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728925AbeLSP1Y (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 19 Dec 2018 10:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAzfjeanNZNQKre5CFJXY7psJ+67/ip5z3GmQA0sWkU=;
 b=fTHEl9fNwIphniNGvlmYMa2RvVbGEQf9YwSkzzIorBxJ8TwLOmOKGENZkNtGqh49PxPmG73KQTtwjnozZ0Wd8q0tnNNr+FVa5iJX2Eb+Nt0KjqgI2szkXLLSYxwI0G/TEWUiJE2ynNnToavoiNX2sOXY0FPIP1zQmipJcdLDTIU=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5444.eurprd04.prod.outlook.com (20.178.113.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.22; Wed, 19 Dec 2018 15:27:20 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::9125:e806:7303:d8e6]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::9125:e806:7303:d8e6%6]) with mapi id 15.20.1425.024; Wed, 19 Dec 2018
 15:27:20 +0000
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
        Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH 5/5] dt-bindings: imx8-clock: add a53 and a72 clock id
Thread-Topic: [PATCH 5/5] dt-bindings: imx8-clock: add a53 and a72 clock id
Thread-Index: AQHUl69U1JQsty7wE0GJgtjEk9ghJA==
Date:   Wed, 19 Dec 2018 15:27:20 +0000
Message-ID: <1545232888-9302-6-git-send-email-aisheng.dong@nxp.com>
References: <1545232888-9302-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1545232888-9302-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0070.apcprd03.prod.outlook.com
 (2603:1096:203:52::34) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5444;6:n2ICwI/49+C+HgF3C2e/a+j5VpmuFdIAZowYvlnXzJ2R4s0meYqmY3ywjCq+VuSC7LmsjVH+rvzAJY4QF3gniRCOwOGAloSA4NSEWdwHgDOdWIP939jI8w5YE2Wfh9eehWKPJ+d6hB1oFlV4t/aS43AMzPC8lpoRU1ifcJJ7D732Y59/I1s4B9CTXFSG6uw8/Jw25b9G26ACPgbaa2s2RurLOIF2m6mNxgxX2GRIrx4t+trhrejNP8+vgEmMlqBGXVeL47qYYex6YDtqW5GhsbopOwHtxhOijzU/2SNidTQ+Kl+iMtT7muwWz2Oxj96oVGLd4BBH/ptBeBPhlU19E0Jk32EhQKsXRGrf+sq4xluOamF2VscomyebU6k1LqCm7FrAlmlA8RS6z15yAOUkiibF+pBesh9Y/94G9yZbMxetFKRSWDcDyLlNrJD27jUuApRUYBCPWaaM0mv9qJvb5Q==;5:WtA7A+LVF0hUz5EMNaOmzCPFcocIiz5Dp+4GwmtmibDH0bY4O4IZwE8lElyzFGQH0MKiMzjvyAg8tXN0oPFGh4AMEE1HTYvQ/K4Sb0Pso5CweOHNvjkgKkg8E2HwWJ8aeiPC5px6ZuMDcVXna5XQfa1tCtcttdVlHOPTYlwFNyg=;7:zOrIkHRIuzn0OUHbL4BFLTFz+fypnKDFvQmjRfdlRDQEMamrYacR1g3+2DXF7bu4QTgqgCy+220RmavrKFM51Y/DZlpJ0Gky9t5Js5mhS7XPzxk2TiS/+EOJaRemyfCI+ZwOk07MnNSMrgyKEkr+Yw==
x-ms-office365-filtering-correlation-id: e8728280-0032-4643-25de-08d665c6773b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5444;
x-ms-traffictypediagnostic: AM0PR04MB5444:
x-microsoft-antispam-prvs: <AM0PR04MB5444FBB10AFB144D3F98B50F80BE0@AM0PR04MB5444.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231475)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5444;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5444;
x-forefront-prvs: 0891BC3F3D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(346002)(376002)(396003)(39860400002)(189003)(199004)(256004)(52116002)(97736004)(11346002)(14444005)(50226002)(2616005)(2906002)(6436002)(2501003)(6486002)(5660300001)(6512007)(186003)(102836004)(6506007)(386003)(53936002)(26005)(76176011)(7736002)(305945005)(4326008)(6116002)(3846002)(25786009)(6916009)(14454004)(99286004)(68736007)(81166006)(81156014)(8676002)(66066001)(8936002)(476003)(316002)(446003)(36756003)(105586002)(106356001)(2351001)(86362001)(44832011)(71200400001)(71190400001)(486006)(478600001)(5640700003)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5444;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: abVjq3BvPa2J64zh69h9z6o/xB9nPlt1z+VDnCuWvKJrp5qJIO9ydAnDq9CotV0Hi/j3zLDSLw3uPXu2/EBF/+cr/MsRaan7sWu8P8pmnRzmO+3rQJn3dMQG7Uag6DA72gsaQOeswoIjZQzOz1u6WWGtQb2ekNPz3K6R4Mw5cyqbRaGgWB9IYhE8/5UbWn++B1/Mgz5g1pzRFVWSP89wzMNMkTN4ImSa0cojboJu71MJ+MIbn90mNkU6UqFL/ubEtcTkpcF/gm7AnwZAwg73VSQIe5YhX65fv8mMCLgYjLhesSUzPH33nSkxrUq+9LEo
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8728280-0032-4643-25de-08d665c6773b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 15:27:20.1861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5444
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a53 and a72 clock id, as there's still no users, we update
IMX_LSIO_MEM_CLK base to start from 6 to allow a53 and a72 clock
id to be continued with a35 clk.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 include/dt-bindings/clock/imx8-clock.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/imx8-clock.h b/include/dt-bindings/c=
lock/imx8-clock.h
index 4236818..2f1aa2f 100644
--- a/include/dt-bindings/clock/imx8-clock.h
+++ b/include/dt-bindings/clock/imx8-clock.h
@@ -13,10 +13,12 @@
=20
 /* CPU */
 #define IMX_A35_CLK					1
+#define IMX_A53_CLK					2
+#define IMX_A72_CLK					3
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

