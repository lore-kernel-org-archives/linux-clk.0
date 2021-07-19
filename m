Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB75EC636C9
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:24:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95C1061182
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:24:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhGSF1n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jul 2021 01:27:43 -0400
Received: from mail-am6eur05on2075.outbound.protection.outlook.com ([40.107.22.75]:8321
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232748AbhGSF1m (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Jul 2021 01:27:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oi1/hFGYrz9NwegrLWYAVga1K3g9t9Fl+9PVV9DVvJNDYvENL1a+GiWIm5qhgETw7zRyk6whvQf1gHpDEZb92TalXHXsGtK4cclBrRyGPIw8GMo2qh69Z0bjZHOKRl7Aq+gNeWHEJyBhaQ9SNOD429ebojRzVSUgWh5O9CQj7RDGpviI7be6IIexrX2sUiwpU2daOcZVwCB+tKyKqL0VUvvWVoeNTijKW3zgie67xkwdcqbx1Ea/9K2ijd8DwwrmyX4f9pF3t4Tmc7Xha3t8Az48x2gl1ykwPd8X2ApLW7uD/Tl7m4bRV91t3cIe4X5T7myBLYzrqViprAkjMZ9sOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNx+eJJ5YyTFTlBRMuPwcHUNvMrYkDFjH3NtHH7f5Ck=;
 b=Q6Ec6w4pyxiz/e3Mo3BiKKowL8MoTbbepFOq47OTeewyn0gUXjiwb1kdO7YYG5Ogci62vNOAYE586tCxCCKOM4BIYHszYXCDva43gkSZOsWaBUcHhIhygiw5qlex8zBFhlndcA6hpbLJO62ho8CqTXZyMJ3kRh4JRR6CBbzJx53v7+mmpIFEwDNZcs9Gb/bgDZuu4lyobMNNiUBNJqi6dGSsFIK9wZBARJabCOwMmi7XDQdtp3DKYu5ow/FDl030JnGBvxq26W1ejAsPD3XCoPvJEgzp5VR22yhHku2hSUoc3AZ3kUYlNA3vLMskbElrfhNct7panuslwksB0mzt+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNx+eJJ5YyTFTlBRMuPwcHUNvMrYkDFjH3NtHH7f5Ck=;
 b=RDKI0+l42EgtEmKLwB2WJVP9SXC7WiaQUb/vZpr9s3ACSKNYoAXxMUdk8TuY9eZYIo2+uvaael/4yN6jJYsw9LqDxZltrKZZUPzdkEecXns3e9yai9FotH5eAK/qH29SF3MmffGk3ftxHySoZ6nnSI7zUA8YpHAOxeQ5H/7xT1g=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB7PR04MB5244.eurprd04.prod.outlook.com (2603:10a6:10:21::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 05:24:42 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d%9]) with mapi id 15.20.4331.031; Mon, 19 Jul 2021
 05:24:42 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        abel.vesa@nxp.com, s.hauer@pengutronix.de, p.zabel@pengutronix.de
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 4/9] clk: imx: disable i.mx7ulp composite clock during initialization
Date:   Mon, 19 Jul 2021 13:34:25 +0800
Message-Id: <20210719053430.1442505-5-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210719053430.1442505-1-ping.bai@nxp.com>
References: <20210719053430.1442505-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0126.apcprd06.prod.outlook.com
 (2603:1096:1:1d::28) To DBBPR04MB7930.eurprd04.prod.outlook.com
 (2603:10a6:10:1ea::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR06CA0126.apcprd06.prod.outlook.com (2603:1096:1:1d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 05:24:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a32fa38-262c-4ef0-3908-08d94a7582f3
X-MS-TrafficTypeDiagnostic: DB7PR04MB5244:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5244C9FCA16BB46E192F186F87E19@DB7PR04MB5244.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RRHd217K8T1lti51cbwsqlkz3eq7URVtEs71dZLJ/uTTzE5UQyUsOGPsKFAkOOu1B4GsuNWrln8xhQDV53DbtBwkKbXTSfgo4Gm3OLc4Z/6NKvaaN0jid8+aEHdxTW2ywtnaPBlFPPF5ltwOuoOTM+Ms/TMxxpUYh1H1TkPa+hC7ItLOnCokYY5GX5IRFgzu2bVRTr3BKGoaaAfiTwJpb36JA8IhyEflRck0TwYv8C24xu2j0sMZxhh52XGLcZg759UiuOOGs9yw5mNS1vt6wF3LqIj4NROBRUf04TqDL2oKABRfGCcEoK8qtDY5YCQkU+ahlx3E1cHTVAV47PIYM0d3gNa3pvkpr3xL1KFUoz5S/5wal2ez8jWPy5RJ73rtb24o7pC2sulJ7Ojm3IHEQotNqumZdd/QlkQRFmgnaHvY8xYMJLwDjEpQqZaSr/riOUte5cBrnofz9H4VEobg65DuDEyr2JL2Bw1OWsrQ8xi2CGm2sXL38MY4W1lp6z43CW+kRkO+16FmMUjNN0xV77f6EdY7TOhHAM461/lzuYggiMSAgRDTC+BAzhtw99/9p23qVp6XrumpFEtixl1UPSvP05VW6l5EB5xKq5OqHDXpbjsXZUvxPX0q0R+EM1apBiUDTT7iVg3K6u8JPuBl81rJew92EB7ozuDrURXryTjIBsGgmJmrP2EdyHv325ar2q5/cF+F+CE5pB90sWCSXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(478600001)(83380400001)(6512007)(38350700002)(38100700002)(6506007)(956004)(36756003)(2906002)(4326008)(1076003)(316002)(5660300002)(2616005)(6486002)(52116002)(86362001)(26005)(66476007)(186003)(66556008)(8676002)(66946007)(8936002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LmLqqEJXk9tFw2/CW7tTWTV/mTv6CQ2rBI6g0HBZh4aOz+p283KyRPr9EwDo?=
 =?us-ascii?Q?VFJxADo1VR6QqJYCjyOgMyuIWG5ZNt/n9Y9T95NnX1AwngG+JAmGZnQVH77/?=
 =?us-ascii?Q?WoLbZJZ3iKfmlgOigz0B2ZtjdOtT19NY0bp+taUTq8RLNPYoAf6FVWNABjis?=
 =?us-ascii?Q?ESrcbkH2j4uQDWrevbdMhrnHT0OiqmRvrFn4bpU5YlDklbxKTIggiMINdIEi?=
 =?us-ascii?Q?cr7jZymqD/Me18YY8UtIdNkjv3keyfEHgsOL1pftb0cy6WU0cgGj4V0CRV9y?=
 =?us-ascii?Q?hPHdPbyoxbaKjuYVxgD+ymeJd2aUkQpxEkPAgLDwejJKoypmB3qg5HiFLXW/?=
 =?us-ascii?Q?Eq3qbeAgpFiBGqQr4zzxSkiPQjZeciW1hRFVtV83B/GjixId9rsVWevB7azO?=
 =?us-ascii?Q?3/lv04/cHM7Wlv1hqrH099D7Z3UDMxoC8K+cHaq//FEYt3r92IRgd02x3Xf0?=
 =?us-ascii?Q?r5ck7qsoX6Xp0WwIK6nujz0DY5Q4843LY1MG95tl/b1u3r+XD0h2Ab3Qbnoe?=
 =?us-ascii?Q?K7QHgVNPsYbNtvvdbQ50Wc6sRY4vqWmVawu2+bh99iSbt/Ut+OIWfmEgMsFt?=
 =?us-ascii?Q?9CXT4D4XvY0FDlm7nwpx4d2nMGdmH9MFVinehF1232SlKTZ3+pkCEWDJ4HbV?=
 =?us-ascii?Q?WMETqGxV8t7TyOD+nWhwsytDnkaZP6PlZDqUFZSxBsNqvRb7EzYSpOlthTRd?=
 =?us-ascii?Q?QKMAM268AuDfW2/wklO5yDdQydyIPfv3GuOivwI1kBPO0Pk8wQ8wB+N5gLBu?=
 =?us-ascii?Q?jY1WRfi/50kh1XVHdx1SN5kwYz69aYb04jT0X9dhCuhL8z9POk49YNhqxaZi?=
 =?us-ascii?Q?S2TNVYJNS6mA3R8B+kzeuo5mpeYkyBd5xXCUjWykxcgOlSnmpmve64VaN4QK?=
 =?us-ascii?Q?nfv1LXv/NnTXdteDcU+W3G9McPt4ofNqzBA8RYh3qTLZJ9pXuTIq24UU8qzo?=
 =?us-ascii?Q?c4r7cyOjpCNOXl0SJ4nkSorBJSmeerwHCFxduuwPfjyoMjoCGydNUDX6wL46?=
 =?us-ascii?Q?B4S2C3YNqymuLjaKxEPV4XYjTcSO7ySEM/mrhhevjDuWIb+3i66l61bTmABy?=
 =?us-ascii?Q?Zyw64U3XruBxPwDASgxicLV7Bt+R37nuMo8Kp3icQvBRMtZGw29sUoxDGYYt?=
 =?us-ascii?Q?f1ZJ3lgfPgpEuksr4WVb1hlgVTza7XUeR8SZ9Tvpp7P7LZ8maMnZAkqDzyBk?=
 =?us-ascii?Q?Tq59cscrsBmLwUYBjmrf3QzgFDb6alQZNGE73vnjQ5boEJ7WMWfOXAtDQjyo?=
 =?us-ascii?Q?Pc8B9A9zg3Z1D2rllB4J6gU6OXrV/1re07mU3alzLT62IcJMsQyFy5HZOhd7?=
 =?us-ascii?Q?9v2O1YSI9ZPFuWi3RmcpjkXT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a32fa38-262c-4ef0-3908-08d94a7582f3
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 05:24:41.9995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ofv3rcq0kHSYJ13dU9Y6E2Tj27VypT+5BD1zxLmWqPovy/ziNXl6hMMGfTy2d3Em/TnGKMO86MQsLazPnVUq3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5244
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

i.MX7ULP peripheral clock ONLY allow parent/rate to be changed
with clock gated, however, during clock tree initialization, the
peripheral clock could be enabled by bootloader, but the prepare
count in clock tree is still zero, so clock core driver will allow
parent/rate changed even with CLK_SET_RATE_GATE/CLK_SET_PARENT_GATE
set, but the change will fail due to HW NOT allow parent/rate change
with clock enabled. It will cause clock HW status mismatch with
clock tree info and lead to function issue. Below is an example:

usdhc0's pcc clock value is 0xC5000000 during kernel boot up, it
means usdhc0 clock is enabled, its parent is APLL_PFD1. In DT file,
the usdhc0 clock settings are as below:

assigned-clocks = <&pcc2 IMX7ULP_CLK_USDHC0>;
assigned-clock-parents = <&scg1 IMX7ULP_CLK_NIC1_DIV>;

when kernel boot up, the clock tree info is as below, but the usdhc0
PCC register is still 0xC5000000, which means its parent is still
from APLL_PFD1, which is incorrect and cause usdhc0 NOT work.

nic1_clk       2        2        0   176000000          0     0  50000
    usdhc0       0        0        0   176000000          0     0  50000

After making sure the peripheral clock is disabled during clock tree
initialization, the usdhc0 is working, and this change is necessary
for all i.MX7ULP peripheral clocks.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/clk/imx/clk-composite-7ulp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/imx/clk-composite-7ulp.c b/drivers/clk/imx/clk-composite-7ulp.c
index 9298bca7a62a..ba48445a0007 100644
--- a/drivers/clk/imx/clk-composite-7ulp.c
+++ b/drivers/clk/imx/clk-composite-7ulp.c
@@ -8,6 +8,7 @@
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
+#include <linux/io.h>
 #include <linux/slab.h>
 
 #include "clk.h"
@@ -72,6 +73,7 @@ static struct clk_hw *imx_ulp_clk_hw_composite(const char *name,
 	struct clk_gate *gate = NULL;
 	struct clk_mux *mux = NULL;
 	struct clk_hw *hw;
+	u32 val;
 
 	if (mux_present) {
 		mux = kzalloc(sizeof(*mux), GFP_KERNEL);
@@ -110,6 +112,18 @@ static struct clk_hw *imx_ulp_clk_hw_composite(const char *name,
 		gate_hw = &gate->hw;
 		gate->reg = reg;
 		gate->bit_idx = PCG_CGC_SHIFT;
+		/*
+		 * make sure clock is gated during clock tree initialization,
+		 * the HW ONLY allow clock parent/rate changed with clock gated,
+		 * during clock tree initialization, clocks could be enabled
+		 * by bootloader, so the HW status will mismatch with clock tree
+		 * prepare count, then clock core driver will allow parent/rate
+		 * change since the prepare count is zero, but HW actually
+		 * prevent the parent/rate change due to the clock is enabled.
+		 */
+		val = readl_relaxed(reg);
+		val &= ~(1 << PCG_CGC_SHIFT);
+		writel_relaxed(val, reg);
 	}
 
 	hw = clk_hw_register_composite(NULL, name, parent_names, num_parents,
-- 
2.26.2

