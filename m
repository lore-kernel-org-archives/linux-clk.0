Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08ADC282C3
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 13:22:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 714A721855
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 13:22:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="eEU2sCxm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbfAXNWq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 08:22:46 -0500
Received: from mail-eopbgr60060.outbound.protection.outlook.com ([40.107.6.60]:19049
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727622AbfAXNWq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 24 Jan 2019 08:22:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8x9cfRGjfPu3Vbtwo6fMJQ5g1NRz+du9RGN+MvD1ElU=;
 b=eEU2sCxmtZKE7VvCwbMuySXrBEIAs9RAz4L3eWrKaTtvJedYq7j5CaQrml0wjT6yFeNhBMAH3GPX9WhKWHRO2NlJf45duJocI34jnAw/fYIMBooo0Y/YyUjk1XLsX/AgbTIYfJL1TYeE6zOaOepzL2fUhd1Qr9+taB0tbcUfKDM=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5443.eurprd04.prod.outlook.com (20.178.112.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.29; Thu, 24 Jan 2019 13:22:40 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5%5]) with mapi id 15.20.1558.016; Thu, 24 Jan 2019
 13:22:40 +0000
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
Subject: [PATCH V3 3/5] dt-bindings: clock: update CPU clock ID name
Thread-Topic: [PATCH V3 3/5] dt-bindings: clock: update CPU clock ID name
Thread-Index: AQHUs+fhfq3L0RgXGUm25sTWxq5Enw==
Date:   Thu, 24 Jan 2019 13:22:40 +0000
Message-ID: <1548335800-6438-4-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5443;6:ueB0z6Hqe7FcMQLE2PQIQ3h6CGhI1iHtekQwl1WPg/u4fJovwwnEWd3HbABkStVywTTmY1gbhLEtH03LB0YijkHIDWxhfw3n8gkYqYxeeIIhbcfQ9peGG3ptePz4YicIBW5xD3aw7qVd2R8BUoAC1KQT2OXuzWxYqW5cXj4AqIvCQl56wm+RNd269c9h8oIRtFYfnSXiA32L3VOXchOkJst4Fae6tuWlVUeqoDLu29mcqLHHZmqepiZ7iUM0oEjcQmD5i2q3kOHjD37wHKnKX/FLzVpcNJknKa/+QkFiC1BnrZ6xZOHxWzGAUXyT8MDYmQ1QY4++tFUF6cKGktIzGKOrJPMPXV2d3KVFiy08T6nZBRQPkYUr98kgx4GdSfoG0IKjAdWprY84M2TH1IDeCW27k6LtnOb/Z+WtZF4LPX1QGRgVDHI1bJtN1EDyUxbrWpMBZeJD0eFQQLRWLDX4rA==;5:Xaw85Pr+d2IQjXwGyaaaAYLijcWmMxpo5V1WgPEFaHnOiR1JeCV73az8cX9krX4xrU03B1vehfLPQrZY2dPBPC/g1C+Qp9E+eUZ51HyzE4s4ScBa5cxE7w40+M2ZpmtqYMqSJeCGC5U4PXMpjhykmcfZAWlKlYhTVEFG06fAZpfS7sRPxV2dTLFdo53Cj3mcW3qluw9IVdXpvAZyV4kesA==;7:uHBT09I/uVdcbfx/d4Iwtqi2duDSz1y8BXRPyDWjmGAH9niyv+gsE6jcz0MG+6VftCLCNBoYIdRf4w59aFtBr193hzuYiAcMocrArb9s2OwYNM8CF5t2Q5G/2OJlJ/fL44mKOGPE1AAPxKSLM3NSKw==
x-ms-office365-filtering-correlation-id: 1f22f3b3-e00f-4ab2-e8d0-08d681ff040c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5443;
x-ms-traffictypediagnostic: AM0PR04MB5443:
x-microsoft-antispam-prvs: <AM0PR04MB54431CDFC3599B22BA02F9E2809A0@AM0PR04MB5443.eurprd04.prod.outlook.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(50226002)(6916009)(5640700003)(6512007)(6116002)(66066001)(305945005)(15650500001)(7736002)(486006)(44832011)(97736004)(86362001)(99286004)(316002)(6486002)(68736007)(81156014)(106356001)(81166006)(6436002)(8676002)(8936002)(54906003)(476003)(2351001)(11346002)(446003)(2616005)(71200400001)(14454004)(102836004)(2501003)(2906002)(105586002)(36756003)(71190400001)(478600001)(4326008)(186003)(52116002)(256004)(3846002)(14444005)(53936002)(76176011)(26005)(25786009)(6506007)(386003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5443;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MbALupIqzCnHVq5Tb+ZydlspQGKZCbpCYLH3UAllyDNP1xJ04kli3d/lY4LJLlI5tvytF5gfQWRe7zEWHf3ew0V/nI9E4+L65fd28IsPAzPpKFCYppphiW8NyTXaOm+bQMeVEbBMgvfmYgFm3A6NWzObl9qrwpoq2RRZVYw575sLlq+oAKDRxVl0cRMK+y21m+M5O1b9lZFjLVDvWK/Yd9Yue+oyooC96azXk4FvNfWiwQOR6IhoyB5We+Q/dIQh4uoAQ5prJCp1zW4iMTLjW/9ckIemKKqdRqrek5tTmd1XTh0syeBYWy299e0dRSeLXl2SWRdbvyeziNTLtTQCZ0MiPaj6T4nCI2hQkXsILF3Or7rLuy90XSTqJrAer8rb/nB3gftpIenf1n+YJSl2fBDVZtpaDyYDufyal1StiLo=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f22f3b3-e00f-4ab2-e8d0-08d681ff040c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 13:22:36.9287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5443
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update the CPU clocks to CPU cluster clock.

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
 * change name to cpu cluster clock according to Rob's suggestion
v2->v3:
 * keep IMX_CLK_A35 to not break building as clk driver already uses it
---
 include/dt-bindings/clock/imx8-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/imx8-clock.h b/include/dt-bindings/c=
lock/imx8-clock.h
index 4236818..b149e63 100644
--- a/include/dt-bindings/clock/imx8-clock.h
+++ b/include/dt-bindings/clock/imx8-clock.h
@@ -13,6 +13,7 @@
=20
 /* CPU */
 #define IMX_A35_CLK					1
+#define IMX_CPU_CLUSTER_A35_CLK				1
=20
 /* LSIO SS */
 #define IMX_LSIO_MEM_CLK				2
--=20
2.7.4

