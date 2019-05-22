Return-Path: <SRS0=a4ME=TW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12E8C193F2
	for <linux-clk@archiver.kernel.org>; Wed, 22 May 2019 09:48:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7191217D9
	for <linux-clk@archiver.kernel.org>; Wed, 22 May 2019 09:48:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="aDZ/tMTa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbfEVJsd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 May 2019 05:48:33 -0400
Received: from mail-eopbgr50055.outbound.protection.outlook.com ([40.107.5.55]:31565
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728406AbfEVJsd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 22 May 2019 05:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3Ankhj9EJdg1ZMGRvEjD7R5QXzgFsBdb7yjnhYqRLA=;
 b=aDZ/tMTaHBhMywHHOLrNPkONFKEnHP6mnG/AbavfPmaUM1jajRuNVWS9wiz2VqlOvTfQ4m7ds8GnAuviYQleQX6N1iJ8CP9CoM/NRilKJTgu5crG35FDfoGu+BcoMfZECN3mYKhSKZIowPaSy9ZdI8+EjN1Obx7Kllm2esIuba8=
Received: from AM0PR04MB6434.eurprd04.prod.outlook.com (20.179.252.215) by
 AM0PR04MB6834.eurprd04.prod.outlook.com (52.132.212.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.20; Wed, 22 May 2019 09:48:29 +0000
Received: from AM0PR04MB6434.eurprd04.prod.outlook.com
 ([fe80::19be:75a:9fe:7cec]) by AM0PR04MB6434.eurprd04.prod.outlook.com
 ([fe80::19be:75a:9fe:7cec%7]) with mapi id 15.20.1922.016; Wed, 22 May 2019
 09:48:29 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 1/2] dt-bindings: clock: imx8m: Add GIC clock
Thread-Topic: [PATCH v2 1/2] dt-bindings: clock: imx8m: Add GIC clock
Thread-Index: AQHVEIOCdPABTKnx/0WPjkRa3FQJxQ==
Date:   Wed, 22 May 2019 09:48:29 +0000
Message-ID: <0f33e08a534e4560d9e96f4ba6af728a0aa00168.1558518323.git.leonard.crestez@nxp.com>
References: <cover.1558518323.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1558518323.git.leonard.crestez@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [89.37.124.34]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: LO2P265CA0441.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::21) To AM0PR04MB6434.eurprd04.prod.outlook.com
 (2603:10a6:208:16c::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98d01d96-71be-4c91-6090-08d6de9aa4fd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB6834;
x-ms-traffictypediagnostic: AM0PR04MB6834:
x-microsoft-antispam-prvs: <AM0PR04MB68345BADE9EB4CF6D39D0E91EE000@AM0PR04MB6834.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(189003)(199004)(66066001)(26005)(50226002)(186003)(6506007)(118296001)(86362001)(102836004)(386003)(8676002)(498600001)(81166006)(81156014)(6436002)(99286004)(6486002)(8936002)(14454004)(44832011)(76176011)(446003)(64756008)(11346002)(66446008)(3846002)(6116002)(73956011)(66946007)(256004)(52116002)(486006)(66556008)(66476007)(476003)(2616005)(71190400001)(71200400001)(305945005)(25786009)(54906003)(68736007)(36756003)(53936002)(2906002)(4326008)(6512007)(110136005)(5660300002)(7736002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6834;H:AM0PR04MB6434.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hkualzKQ7zWqzLR9dxoJJj9UHFQ3/UkGZlbyrofYKENbURY60o2PsmriypchRUAKJ0asM+8UI8Q4Numo1+btQcJbkzLZRXny/ncR7GEZtG3gvMkORGom34V8qYxkZc/u30hdjUv4sK5y/lugmEHbZacUBnwJiKsGZIy298qXmGPE9Xa7W6iMml60Y1DT/KTsS/j/4kN6nHcxDtgyVfhw7EQqqrUcnIfjWZLRcy56hOaYToHYPVyQPDWXMKUiU/i9olfofUCGQuy85fIshWsjM46YRVFQSfFvEUcf/vlyPbdyFQzhxDmLe0hIFL7ll6KoA4+3TluhiLv+KQCzaY2GZHrqCRPIdavnFx0sCqpFslAElWRP3oGaSffBKch9eB+/pHjlpJwDm08oy/qW9KW5+Bx7dagGsILuKwDeSQ3jSq4=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <20577B92AAF36A4A861764A4729D41B8@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d01d96-71be-4c91-6090-08d6de9aa4fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 09:48:29.6301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6834
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This should be defined in the clock tree so that parents are not
shutdown by accident

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 include/dt-bindings/clock/imx8mm-clock.h | 4 +++-
 include/dt-bindings/clock/imx8mq-clock.h | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings=
/clock/imx8mm-clock.h
index fe47798f95df..5e8e32d18816 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -243,8 +243,10 @@
 #define IMX8MM_CLK_GPIO2_ROOT			224
 #define IMX8MM_CLK_GPIO3_ROOT			225
 #define IMX8MM_CLK_GPIO4_ROOT			226
 #define IMX8MM_CLK_GPIO5_ROOT			227
=20
-#define IMX8MM_CLK_END				228
+#define IMX8MM_CLK_GIC				228
+
+#define IMX8MM_CLK_END				229
=20
 #endif
diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindings=
/clock/imx8mq-clock.h
index 6677e920dc2d..7900a219f5fa 100644
--- a/include/dt-bindings/clock/imx8mq-clock.h
+++ b/include/dt-bindings/clock/imx8mq-clock.h
@@ -398,7 +398,9 @@
 #define IMX8MQ_CLK_GPIO2_ROOT			260
 #define IMX8MQ_CLK_GPIO3_ROOT			261
 #define IMX8MQ_CLK_GPIO4_ROOT			262
 #define IMX8MQ_CLK_GPIO5_ROOT			263
=20
-#define IMX8MQ_CLK_END				264
+#define IMX8MQ_CLK_GIC				264
+
+#define IMX8MQ_CLK_END				265
 #endif /* __DT_BINDINGS_CLOCK_IMX8MQ_H */
--=20
2.17.1

