Return-Path: <SRS0=aw6K=MH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB155C43382
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7BA9B206B5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="SZ6P22hN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BA9B206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbeIYXIU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Sep 2018 19:08:20 -0400
Received: from mail-eopbgr70075.outbound.protection.outlook.com ([40.107.7.75]:45688
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726322AbeIYXIU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Sep 2018 19:08:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEfScXKk89RCcKo+i8Hh2Gf9qME/mFEbiQOPYHd3khs=;
 b=SZ6P22hN6rlkp+mT1XgNQSIb+L9BpAnVi7ltWopGee660SNzz157jWTvgHA4fWRWTVOKUS7Oh8RvrFv+OePdX0qWWMFcpPyZhwY1o6PuCRr2xOgcnyNqpBecMyi002+8RTw1stzB+LBo8Y5MVfl9cXEpk6bg7lDieBYNSR3FKhQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 AM0PR04MB4211.eurprd04.prod.outlook.com (2603:10a6:208:66::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.22; Tue, 25 Sep 2018 16:59:16 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V2 05/11] clk: imx: scu: add scu clock gate
Date:   Wed, 26 Sep 2018 00:43:51 +0800
Message-Id: <1537893837-31172-6-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537893837-31172-1-git-send-email-aisheng.dong@nxp.com>
References: <1537893837-31172-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK0PR03CA0033.apcprd03.prod.outlook.com
 (2603:1096:203:2f::21) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15903eee-b864-401b-4e7d-08d623083c59
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4211;
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;3:dFb8A9jM4RPWIwK+q1f8FKL0fE/ip0Vl25RV6azdcwkF9Iv1Frq60vGyJ+xIrFT9tVIKmZVCcwivqEq3zEgY7BCWf0ymRMqurJKEgAo89dnUD5WAGQTgWRNPzU8AW0KpjiNccx6DhSAF5XZMrUCMhDTlfNrRg/Px9qsexl5d2miCH1qv23f555zaJWdpTbLbdJh5RoTUUZtGCPrNr4CnPi4UoT1Rk2I89kbhEFkj4yIFNQ8+qzqPMOBb3+BQdee2;25:zi6Ylzpi/L/62wQcQFPToZxWCMFclPLbvTXAxs5jpudKBCgNkDl7dxS2vW7q0R1/xXkc1UpYHdkWUeT5NZHZIXbhjYGb2RJxlRZ27t9xYZqPfTnIi67sI8eCfeiSYW6BVZUnoE0u9vXgv/E7hVrGUAjNUtpAmOB0OkumOF4MhZ2WfPrUknkN7k4Zo11fP8O6TmnOy+6XOmODdVJAmqZby4UbTLwoEPJcUhaXux7z9HwKOcbp6uviKW8bRwod3si7RPJQvelOUPYeFpEnseZSR3x0sMDZLqrYG/3c3juKuX0iGIQ60yC3o0dN0FO46zJ38Fhc/xBKqbwQEAG1egftHQ==;31:Xgycd80/Crx1plXDHaRjWF4Q/H+YEjv7oqSNbJI9qaUQmGvJ6hld8WaOkxiawZue0096cwGSC8XYU3FwOXKtG8AsoEVeCYsDmmFJd1IOzqXdrc+/MJxrzOlPryzYefKWOyxE4HEdliaBcrVGFYZ3Yo8czZniX4eZDk+GNZnawjjtlLgju7iqA4Y0UrHgjscXGCxRwMMuiC69XCLs/y59SteMC2FsGRH5bLmbxeiwV24=
X-MS-TrafficTypeDiagnostic: AM0PR04MB4211:
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;20:CRZYGqkvdHxDvnOwWlLRx0hd+MYdZFcrj8QXN44jYHcoTR25+9SNGoqXlAYvoVf7NGrIngfSXBmJhzbi638hq/U+GCuI95fkpHvcsnBig9vkV9nedKaAuGLo+FtE5d9QAPudawe19iYwDZfgqmCcGp9B/ewQRaGn4tebhcsUAqjJ/i1fd9kNPd5HM9wbX1PJDzdKElVAyp7HicTlCrP3F+NDPaGW1DAj/gIbWEuHm/63Som1uWGLBtBULUjZ6VsW6D458kSyD4dNgWf4qgShSoJ+4sEbf14kWGYD/qRL+i54hfVTKjHK/iQwVIhNFBeH///QrLrsXRU0ZbaHtZpjGHyg2GhmlALZlcd2R3Rv/nX8OfsZiln7zUYHwhZF89yc08yILS3wn/XlRXyQzwx5Pr/ZuLzoD5mPlEUJ4Y7RkNFH3kmiZAGLXkPSgvHX5aXRzNSeErU5aO7EKu3hZFhe/MLYjNCNKFd1O/z6zFSsVeeLiA4vpEnPeYTt0rKRPV0d;4:3MjnW+LdzQcSPxMv4PxhIC9R0nklaN/T6Lt2kd01vS4BCKicY5jcBfrQKTeF4S4Rc7uwsF8sQNrVKp91q0atn+Fh5fOjmlsRpRt5dU5EXOPyudIoz+YLGuVkdyo58P8mkVV5rCQO4KVFpXYvy6Iv0WF7AYeZa++B7IE3WkA4BKDQir4cYLwLunHnX2ZNdPCyYrLW7Ub6bJS5QIm8bBpQ419TtEE/SnNsJVgU+11zIfU9SFQAypyqPD4g8G9bDPHhFJN2VHN0Xgm5N53cm39VVJ+Q6lYDJsa3A8gznn1u0sfNVHMgOBBi//eOViHgHlft
X-Microsoft-Antispam-PRVS: <AM0PR04MB421172CE6B67D096C86EE2CF80160@AM0PR04MB4211.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(149066)(150027)(6041310)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051);SRVR:AM0PR04MB4211;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4211;
X-Forefront-PRVS: 08062C429B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(54534003)(199004)(189003)(478600001)(6486002)(11346002)(446003)(53936002)(6512007)(68736007)(2906002)(48376002)(6116002)(316002)(3846002)(34290500001)(14444005)(106356001)(186003)(16526019)(2361001)(2351001)(26005)(305945005)(7736002)(486006)(36756003)(66066001)(4326008)(47776003)(25786009)(105586002)(6916009)(6666003)(50226002)(97736004)(81156014)(8676002)(16586007)(5660300001)(956004)(52116002)(386003)(86362001)(2616005)(476003)(76176011)(51416003)(6506007)(8936002)(50466002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4211;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM0PR04MB4211;23:vUfZC+0MrgDkTiPK70URQo2yVW06netSrEQl95kar?=
 =?us-ascii?Q?ZQjANHN4f1oShrsHqrv5BgP4nlerXFok+OBFP5PZGqIgImHohijPdB166ZeL?=
 =?us-ascii?Q?0eul8z+s8Pbb1TCKfBSjSJxb3yhG4COk9Tb0ZQvHaH3N9cjN3+QX5ZuEaMzR?=
 =?us-ascii?Q?sVrjXcf4SLkBWxDvdsNCfP4cYSC+XbzccL//U6UeO16rw5iMZH5r+/DbFEq2?=
 =?us-ascii?Q?4ZvLrZa8fLju3+KZP5Ts4jUqu0dlKhDL/B/N7Guwsn+qAr0oivxlZVcfdDOT?=
 =?us-ascii?Q?HkN/5nahaRKUknywcO7BjiwDa0iGWINM/apepJyhzIFngdO2NxEwfd9B3bcA?=
 =?us-ascii?Q?1Wb5J7bC8PhJ1dMBqAxDO8VM8zUWMnITFh3h92/qUea4ECciMSSwo5WGOKmL?=
 =?us-ascii?Q?act4R/hgr6obbWVrinx/KD8nRz4oMWb+qJFKd4PgTdgzCUi/0tmcPFWoiPn7?=
 =?us-ascii?Q?WyTLzpfThc3j4MRb8cUvk1lEPgI7crkCk7ts1qUAOXRz9CzCbKh/vJX1cx4D?=
 =?us-ascii?Q?bdhv8as+TaPY3t5aPWSHZAqdI3To9b/IHpaXmwgn4fcUksPZEabpd6wpSIt/?=
 =?us-ascii?Q?3umb48nwJeQiFbFLd6Djhxd5d3UGI3OkgLwaMeadXTPyzCWRU21lNpUShk7F?=
 =?us-ascii?Q?2hVLKFUB5jbC0s2cTP9cKsocOlLZKgBDVdpLB/an3EfhTLHSJQRiqLd+whgq?=
 =?us-ascii?Q?uYaC/4Wlpo08JhiV/Pz5VXhQt7HmTclTSqUI91Nmbj2nhFKdPNd3eiveSFC4?=
 =?us-ascii?Q?NLEusK+WdDBYHGLgdTTjGuBgjG3S4PT7y8xuGMkB7mQS0p1k+0BMKIHegEdD?=
 =?us-ascii?Q?lBzHvvS1VqJB1/mQewIrUuFqwNvD8tviC8NXgaCs+441Xb/5Q1bDLGffjmJK?=
 =?us-ascii?Q?VMM6Q6V4DGck8vYIL/DMvRejkCR30mUDMxT8yqjsXs14VQTZzcBjhrzDbOeN?=
 =?us-ascii?Q?2LP3UYrkPEP12TfIdcp9Ydl//rU0RbLVS9TQf9lve8o6AL5THdselTmpnHVb?=
 =?us-ascii?Q?Hw7TQAJKzXTqgNWTJogLSvN07gFsyoJts51S5430DGx/zPuSfZBBMJ49x7tP?=
 =?us-ascii?Q?Q/QdOtVJXTyBQicmj870qCPuFkNuacoWPgBFwkLDV/KYulAnZDUD2vEVW/gV?=
 =?us-ascii?Q?RHO1p6Yf7cQs9SgkKgJciVmoPgcDv2hgYnRtm7/QBQgkKDqMb2MnrW0dTYLu?=
 =?us-ascii?Q?oI73tXeg5THlf1Ifpkux2/omRBggAVFhgbJj8YoVCo0FxRFYOoyxa86OiPcj?=
 =?us-ascii?Q?mDytUSPI7aaw/dyXfb7nvxy7dcRLEDPJkDdAaAq?=
X-Microsoft-Antispam-Message-Info: up+aGy96pry7hd5To23n1Te5q6KOs9XQG8PEthsuhLVGI/DcxGcLV17rBjumeaQOxFcbd5Op0O2B+2MaCkV1vCflRWWFWsU8xVcHyv0+NzfaBLdxNXvfY/wq8yXTsZZdJQwFFra6ep1rsF5Wp11TRClbpj6Xi6t8K11NMIBYwqKuCcpkxMPA+j3kRZuDhxrYcml5+D/3JKWt8LzlfGs+jjY3H65TGQQgBqE2FuIoCuW0OmxYAWBWK6ZPVib8GGsbBhVO4UP3ZI1HVxM5eH6OkDHvFhTHGrj6UyhispgnynhgnSVkHQ55iYGbVTTcjyc7MkpQcHKPkMJuXH2p9tKLpi32c7qQ7yRZHOkxFL5Riz8=
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;6:nXOqvDYu+SxXVSYiY81mM+vuuEHG9nzo9w11vAGZQBqqIFXJwVkM6gwIN3YGvRXjbvf69XzQsUMz/zODqZOE2ru+XkGHFscLlqaOcwraBn4e+Wu7DPYkhpwUi24NSyuaXGLvBfpGB1EgCM9O4S+OptbaiaQ0qvQnqC8fcGxZe4/ZZD5ldeTLRRjAG0SaywLnYVh4HKtrZtABJHv1GoXbIk/f+egxgp8qyCkS2LTcLpRI4cQImOZf2008KsoZaQO7qqZ0af5izjAcjQItwnasXnFLXxiaQTYs2/8OI7gOOzbp6mIAuCmHMJ1lIcCM4tF23ABN/HQ688/ms46A8dliQgBXkj/N+1Q/GJCsQpuu3Ou97g2yVWvSNU8/5NuISnOl88+ncn5lo5+qs3IIWuDaavzp1LdUJRx47GHoElLMVNe6iEpLqeAusDfy8zUyl+e/Wl+/IMK5oPf0HkqH+mWexA==;5:D5pd8H7rarDM76hxfpJ3elI+TM16e5ebc0+INQ3Qycpz6awRLnnW6Mt/6tbAsE+LQql7Yp/Kx17YShvyB0Gxysa7OJioG+NolbwK+A0uMoB48PUK0ikZOH1Vm2J2Fcu42HnZNr7wumL7KsziSzimUE66VYEtMac3wPT6MMMh5DE=;7:LNvyyQwH68NhEXac2tOal7OP5YQ843ffj3QwQB1zQ9ehp0iho+evI3jo05DxIUUDtrUPj3Qpd5FxuNKJxLSFmWVAPH5k87Amye0KKo2L5dRXqAB9kCsBhQ0s8W2Sq1kyEn0QhbtPxLzHLDKgxdlk00sOhbrcSEtFZ3jTVPhXXEH0C3FG6PxoUl3NEhmEwNGxOmqRD+hMWPZmgDtSAd5NDZ5o0lJseJF/CcS6NuoxPRhsRGf981hypq6QGMg/tASq
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2018 16:59:16.9325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15903eee-b864-401b-4e7d-08d623083c59
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4211
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180925164351.RK-bCZKeK9_8KF2WFSaiwnmFP_1OEE_92vCY_DpnfAs@z>

Add scu based clock gate.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
    v1->v2:
     * move SCU clock API implementation into driver
---
 drivers/clk/imx/scu/Makefile       |   3 +-
 drivers/clk/imx/scu/clk-gate-scu.c | 230 +++++++++++++++++++++++++++++++++++++
 drivers/clk/imx/scu/clk-scu.h      |  23 ++++
 3 files changed, 255 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/scu/clk-gate-scu.c

diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
index 9e7f4aa..2abed17 100644
--- a/drivers/clk/imx/scu/Makefile
+++ b/drivers/clk/imx/scu/Makefile
@@ -3,4 +3,5 @@
 obj-$(CONFIG_MXC_CLK_SCU) += \
 	clk-scu.o \
 	clk-divider-scu.o \
-	clk-divider-gpr-scu.o
+	clk-divider-gpr-scu.o \
+	clk-gate-scu.o
diff --git a/drivers/clk/imx/scu/clk-gate-scu.c b/drivers/clk/imx/scu/clk-gate-scu.c
new file mode 100644
index 0000000..6edcf29
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-gate-scu.c
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017~2018 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <soc/imx/scu/sci.h>
+
+#include "clk-scu.h"
+
+/*
+ * basic gatable clock which can gate and ungate it's output
+ *
+ * Traits of this clock:
+ * prepare - clk_(un)prepare only ensures parent is (un)prepared
+ * enable - clk_enable and clk_disable are functional & control gating
+ * rate - inherits rate from parent.  No clk_set_rate support
+ * parent - fixed parent.  No clk_set_parent support
+ */
+
+#define CLK_GATE_SCU_LPCG_MASK		0x3
+#define CLK_GATE_SCU_LPCG_HW_SEL	BIT(0)
+#define CLK_GATE_SCU_LPCG_SW_SEL	BIT(1)
+
+struct clk_gate_scu {
+	struct clk_hw	hw;
+	void __iomem	*reg;
+	u8		bit_idx;
+	bool		hw_gate;
+	sc_rsrc_t	rsrc_id;
+	uint8_t		clk_type;
+};
+
+#define to_clk_gate_scu(_hw) container_of(_hw, struct clk_gate_scu, hw)
+
+/* SCU Clock Protocol definitions */
+struct imx_sc_msg_req_clock_enable {
+	struct sc_rpc_msg hdr;
+	u16 resource;
+	u8 clk;
+	u8 enable;
+	u8 autog;
+} __packed;
+
+/* Write to the LPCG bits. */
+static int clk_gate_scu_enable(struct clk_hw *hw)
+{
+	struct clk_gate_scu *gate = to_clk_gate_scu(hw);
+	u32 reg;
+
+	if (gate->reg) {
+		reg = readl(gate->reg);
+		reg &= ~(CLK_GATE_SCU_LPCG_MASK << gate->bit_idx);
+		if (gate->hw_gate)
+			reg |= (CLK_GATE_SCU_LPCG_HW_SEL |
+				CLK_GATE_SCU_LPCG_SW_SEL) << gate->bit_idx;
+		else
+			reg |= (CLK_GATE_SCU_LPCG_SW_SEL << gate->bit_idx);
+		writel(reg, gate->reg);
+	}
+
+	return 0;
+}
+
+static void clk_gate_scu_disable(struct clk_hw *hw)
+{
+	struct clk_gate_scu *gate = to_clk_gate_scu(hw);
+	u32 reg;
+
+	if (gate->reg) {
+		reg = readl(gate->reg);
+		reg &= ~(CLK_GATE_SCU_LPCG_MASK << gate->bit_idx);
+		writel(reg, gate->reg);
+	}
+}
+
+static sc_err_t sc_pm_clock_enable(struct sc_ipc *ipc, sc_rsrc_t resource,
+				   uint8_t clk, bool enable, bool autog)
+{
+       struct imx_sc_msg_req_clock_enable msg;
+       struct sc_rpc_msg *hdr = &msg.hdr;
+       int ret;
+
+       hdr->ver = SC_RPC_VERSION;
+       hdr->svc = (uint8_t)SC_RPC_SVC_PM;
+       hdr->func = (uint8_t)PM_FUNC_CLOCK_ENABLE;
+       hdr->size = 3;
+
+       msg.resource = resource;
+       msg.clk = clk;
+       msg.enable = (uint8_t)enable;
+       msg.autog = (uint8_t)autog;
+
+       ret = imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+       if (ret)
+               return ret;
+
+       return (sc_err_t)hdr->func;
+}
+
+static int clk_gate_scu_prepare(struct clk_hw *hw)
+{
+	struct clk_gate_scu *gate = to_clk_gate_scu(hw);
+	sc_err_t sci_err;
+
+	/* Enable the clock at the DSC slice level */
+	sci_err = sc_pm_clock_enable(ccm_ipc_handle, gate->rsrc_id,
+				     gate->clk_type, true, gate->hw_gate);
+
+	if (sci_err)
+		pr_err("%s: %s: clk prepare failed %d\n",
+			__func__, clk_hw_get_name(hw), sci_err);
+
+	return sci_err;
+}
+
+static void clk_gate_scu_unprepare(struct clk_hw *hw)
+{
+	struct clk_gate_scu *gate = to_clk_gate_scu(hw);
+	sc_err_t sci_err;
+
+	sci_err = sc_pm_clock_enable(ccm_ipc_handle, gate->rsrc_id,
+				     gate->clk_type, false, false);
+	if (sci_err)
+		pr_err("%s: %s: clk unprepare failed %d\n",
+			__func__, clk_hw_get_name(hw), sci_err);
+}
+
+static const struct clk_ops clk_gate_scu_ops = {
+	.prepare = clk_gate_scu_prepare,
+	.unprepare = clk_gate_scu_unprepare,
+	.enable = clk_gate_scu_enable,
+	.disable = clk_gate_scu_disable,
+};
+
+struct clk_hw *clk_register_gate_scu(const char *name, const char *parent_name,
+				     unsigned long flags, sc_rsrc_t rsrc_id,
+				     uint8_t clk_type, void __iomem *reg,
+				     u8 bit_idx, bool hw_gate)
+{
+	struct clk_gate_scu *gate;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	gate->rsrc_id = rsrc_id;
+	gate->clk_type = clk_type;
+	if (reg) {
+		gate->reg = ioremap((phys_addr_t)reg, SZ_64K);
+		if (!gate->reg) {
+			kfree(gate);
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
+	gate->bit_idx = bit_idx;
+	gate->hw_gate = hw_gate;
+
+	init.name = name;
+	init.ops = &clk_gate_scu_ops;
+	init.flags = flags;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.num_parents = parent_name ? 1 : 0;
+
+	gate->hw.init = &init;
+
+	hw = &gate->hw;
+	ret = clk_hw_register(NULL, hw);
+	if (ret) {
+		iounmap(gate->reg);
+		kfree(gate);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
+
+static const struct clk_ops clk_gate2_scu_ops = {
+	.enable = clk_gate_scu_enable,
+	.disable = clk_gate_scu_disable,
+};
+
+struct clk_hw *clk_register_gate2_scu(const char *name, const char *parent_name,
+				      unsigned long flags, void __iomem *reg,
+				      u8 bit_idx, bool hw_gate)
+{
+	struct clk_gate_scu *gate;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	gate->reg = ioremap((phys_addr_t)reg, SZ_64K);
+	if (!gate->reg) {
+		kfree(gate);
+		return ERR_PTR(-ENOMEM);
+	}
+	gate->bit_idx = bit_idx;
+	gate->hw_gate = hw_gate;
+
+	init.name = name;
+	init.ops = &clk_gate2_scu_ops;
+	init.flags = flags;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.num_parents = parent_name ? 1 : 0;
+
+	gate->hw.init = &init;
+
+	hw = &gate->hw;
+	ret = clk_hw_register(NULL, hw);
+	if (ret) {
+		iounmap(gate->reg);
+		kfree(gate);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
index 97d8bdc..99e45ae 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -36,4 +36,27 @@ static inline struct clk_hw *imx_clk_divider2_scu(const char *name,
 struct clk_hw *imx_clk_divider_gpr_scu(const char *name, const char *parent_name,
 				sc_rsrc_t rsrc_id, sc_ctrl_t gpr_id);
 
+struct clk_hw *clk_register_gate_scu(const char *name, const char *parent_name,
+				unsigned long flags, sc_rsrc_t rsrc_id,
+				uint8_t clk_type, void __iomem *reg,
+				u8 bit_idx, bool hw_gate);
+
+struct clk_hw *clk_register_gate2_scu(const char *name, const char *parent_name,
+				unsigned long flags, void __iomem *reg,
+				u8 bit_idx, bool hw_gate);
+
+static inline struct clk_hw *imx_clk_gate_scu(const char *name, const char *parent,
+				sc_rsrc_t rsrc_id, uint8_t clk_type,
+				void __iomem *reg, u8 bit_idx, bool hw_gate)
+{
+	return clk_register_gate_scu(name, parent, CLK_SET_RATE_PARENT,
+				     rsrc_id, clk_type, reg, bit_idx, hw_gate);
+}
+
+static inline struct clk_hw *imx_clk_gate2_scu(const char *name, const char *parent,
+				void __iomem *reg, u8 bit_idx, bool hw_gate)
+{
+	return clk_register_gate2_scu(name, parent, 0, reg, bit_idx, hw_gate);
+}
+
 #endif
-- 
2.7.4

