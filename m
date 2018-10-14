Return-Path: <SRS0=5HZW=M2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AD3C71122
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 426BC20835
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="PDZi8nMc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 426BC20835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbeJNPsW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Oct 2018 11:48:22 -0400
Received: from mail-eopbgr50049.outbound.protection.outlook.com ([40.107.5.49]:46820
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726237AbeJNPsW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 14 Oct 2018 11:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loz0Z/N3roS0TihzCcdrmtKvjWwD/MpAGAQO11Qzph8=;
 b=PDZi8nMcWMl2+3Aqwsm6/jpVipiek7+Wji/RLEr4BP3psHzRT3dowaG2fvMN1W79x61sOCNLA5NBiaJfcKAf2/7qODV/YJ7XgF+gtvJCKmzj2yzpL72pnTCQ2WWNYLthA0T27ATli/jqC8AMRMVLdrbgcNR8+A8T/1D/Dk01yBk=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4724.eurprd04.prod.outlook.com (20.176.214.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.21; Sun, 14 Oct 2018 08:08:09 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.027; Sun, 14 Oct 2018
 08:08:09 +0000
From:   "A.s. Dong" <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>
Subject: [PATCH V4 09/11] clk: imx: add common imx_clk_hw_fixed functions
Thread-Topic: [PATCH V4 09/11] clk: imx: add common imx_clk_hw_fixed functions
Thread-Index: AQHUY5ULf0uevZVM/0aIt+GcK5Mi4g==
Date:   Sun, 14 Oct 2018 08:08:09 +0000
Message-ID: <1539504194-28289-10-git-send-email-aisheng.dong@nxp.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0056.apcprd03.prod.outlook.com
 (2603:1096:203:52::20) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4724;6:1qJNHsmwtTXfzKdHKZR58sViMPJysKpd0wcuOO0Pt1Bry8S1rSQNDIDV3IKoa/Y9dKDmU30WLSIIcxhxLWXrDW4GDNQCiVQ/2UkyiBQdpLPEb2apLHGNfhSwr1aXJBPdq8ZEZY89X9wy4nDREVusePKNhs/EI3ULPFrOq6q5F8ustbwlLeHUmaKK6UhKo4uLVfMjYgZF45LxY3AV9TYd3BhOwsGiGs1A2pOG33G3JKg8znpb1oCg+21XJWafEL1ZPq+ve6z3elMspRY7FAQTSSdv8WzKgW+p7riFc3S5Yw8REd5c562TYmBmb3QJemFwNdL6YWPFfCBMmWJmS9OIZH6iGyAIqf1GV0/4p2qdUqGWGR6SUF2mC74APOFWQan7rqePSe/9rR9kMkFlA0BhFwDVikZB53avFQI2jcagj/+y/Xv2C1gZImNrIbpHvLI7L9edBQ76aobgD1GFNPg7sw==;5:fOxu7dOVvwayf/vejno+FVUCsDyOTwOUeaIDGxkEY5pv5qKejkBgLRWV09vH4cVY2VVwwczHvVgW8E9dewEizMh/ZHPTkPVbP8JlSlKvV/to7YWLD6vifcZzQ93EDZAxs3+ysC7fD4P/gTUgfVCEBZzAWVtJ+b9dmCfGIUn5Fek=;7:V+JPygsfrMbwInqwnXSxLBe6OxvFT0V3p/L5jeaMf+45sHeD+onjzTn3V3tmm3LWgACLknBcjcW+xfjzemNcnr4EHzjml/sTGCODsbcSB5gD0i4WFlo5n+g0LTe/59caAyvm9IrWzS9c27Q4w/IgEeM/e4aS2X5O+f0R7EN+R/URNj9xSj9gyY8i1q0SLc3ygGj7+u3N2yA1wy0F1J8QZmXP+9NdJyl42SDxOczAIsVtDLwQ74Fs2rJEkKSBPjV1
x-ms-office365-filtering-correlation-id: 7a8323fb-04a5-4734-f6c0-08d631ac2de8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4724;
x-ms-traffictypediagnostic: AM0PR04MB4724:
x-microsoft-antispam-prvs: <AM0PR04MB4724CF443CC0730475F3BBA480FC0@AM0PR04MB4724.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(944501410)(52105095)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051);SRVR:AM0PR04MB4724;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4724;
x-forefront-prvs: 08252193F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39850400004)(366004)(136003)(396003)(376002)(199004)(189003)(25786009)(50226002)(54906003)(486006)(5660300001)(476003)(5250100002)(14454004)(2616005)(2501003)(3846002)(86362001)(6116002)(105586002)(316002)(186003)(478600001)(2900100001)(106356001)(14444005)(97736004)(2351001)(256004)(4326008)(102836004)(81156014)(6512007)(52116002)(81166006)(99286004)(7736002)(5640700003)(36756003)(71200400001)(6436002)(71190400001)(6506007)(66066001)(6916009)(8676002)(76176011)(26005)(53936002)(2906002)(8936002)(305945005)(446003)(68736007)(386003)(6486002)(11346002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4724;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Ecz9VN3m011FMPtW4oNadZ1s9TyGNTNITm0qnhV77dkOVT7KXhnjfzzC0OfrESjcrfgzsVpcG8n70U30MXKjGJhBC3GyGE2UJmMJYRUtcbcmiP9AKnqcWKZBjWoIa667Fc6yV4cDOBeu+I34BYDdcwb69Wy5ouKhORU2IQtiHAYZynXvEmFDy060arjpkOxlz13mgx0dU0tqmwfV6xD1wAEtoAdNInIjZNggPLsHSFeXtSVtpKvTCPvaOdXu5lqhhHO1GVEgd/DaPsrTSEkoiykD55er7UH1tyX5NF1jNNyL1yHwxsfLpwiANU25YqRkMSGJo8FcdRxPfvPZVOfD3tqQJ2XcFcdXhaAYaRnYqSg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8323fb-04a5-4734-f6c0-08d631ac2de8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2018 08:08:09.6383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4724
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This may be used by both mmio and scu clks. So let's put it
into a common file.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-common.h  | 16 ++++++++++++++++
 drivers/clk/imx/scu/clk-scu.h |  2 ++
 2 files changed, 18 insertions(+)
 create mode 100644 drivers/clk/imx/clk-common.h

diff --git a/drivers/clk/imx/clk-common.h b/drivers/clk/imx/clk-common.h
new file mode 100644
index 0000000..e3634a5
--- /dev/null
+++ b/drivers/clk/imx/clk-common.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2018 NXP
+ */
+
+#ifndef __IMX_CLK_COMMON_H
+#define __IMX_CLK_COMMON_H
+
+#include <linux/clk-provider.h>
+
+static inline struct clk_hw *imx_clk_hw_fixed(const char *name, int rate)
+{
+	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
+}
+
+#endif /* __IMX_CLK_COMMON_H */
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
index 8cc58e4..4eeb252 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -11,6 +11,8 @@
 #include <linux/firmware/imx/sci.h>
 #include <linux/spinlock.h>
=20
+#include "../clk-common.h"
+
 extern spinlock_t imx_ccm_lock;
 extern struct imx_sc_ipc *ccm_ipc_handle;
=20
--=20
2.7.4

