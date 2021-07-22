Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD16C432BE
	for <linux-clk@archiver.kernel.org>; Thu, 22 Jul 2021 19:09:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14D2E60C41
	for <linux-clk@archiver.kernel.org>; Thu, 22 Jul 2021 19:09:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhGVS3D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Jul 2021 14:29:03 -0400
Received: from mail-eopbgr10042.outbound.protection.outlook.com ([40.107.1.42]:30817
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230103AbhGVS3C (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 22 Jul 2021 14:29:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqkrGT5LwXVZd3cCQDuy2ZH2inNqpXGq2VLPeHF+d53XtEs3+99v1EZec+vjf2s1HYN2zIZs4w1/wgqxBXkZV+RXgOzV8RqWiQhokGXzT15RFM8fL0d6GJWZ58919SpgzJqrL1HIzab63SgvT0+QNVLmTNWKt3axSq5e4IbKOqJkORzV3GqfnKHtwna0I040R1ahohXVYPPjjhE6gXkpBD5Ue0cfSN+f1BIo+fvuUbWPsnnMvnnw2v0RvkdIOdwxaboncRruYsuUd39qgDsCMlYGnnN9Is0pJq/tHZk7RXWIOuW0SdMVVpirbdlKKUtYDR3wzakKa7tuwbZFwjAkrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsPa5P7wi0R0hH/UbO3CYM6gqVtJVeGZAOHEwRl8ICE=;
 b=jbdt2v2MrIFk4KSQkMWxm8RyYQYn5pKh90MLlrSUNL/C7rJlvf8n+vP2wraIYTxOb0Ah+GBRtBm4nBMGXfvw0rKg2xCNNgPIHmZ2JnyCboo5wwWWRFHE856aAPZNfL0gecnMCglvjIlzWApJYe0hWKG+GeAvlUvQfcSAuiIACULmpzSxwm58W93Q3Qzkldu7ZeYT8jEfRgBxB01wJ1yXHFZZT58kb4MSOSA+t72sra0uXs1HODHLXjZQq9+72H0eoao8HgthE8wVbvSLsHcExTKNAPM63kSbsI4jYFEE/ub/31/xPb6IgmH04nZgRVDEmAj7vFcNX/4Li+GAtcE3wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsPa5P7wi0R0hH/UbO3CYM6gqVtJVeGZAOHEwRl8ICE=;
 b=sNdbTsYvRcVMqHehNhouXfdX1c72D67MDpBBA/iJiDFKPA+lQ+oV6XgCS8MJPh1nvyn4uGKMJ76v0T6Q9px9PjfQztjkpMhZo55R5DlWLI+Q6lEFA/viaBDGYjseQ2K0mH9x5e40JvxHFPemjo91SaZbCtAQzM3LbtG8/eOV+gU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB3PR0302MB3387.eurprd03.prod.outlook.com (2603:10a6:8:c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Thu, 22 Jul
 2021 19:09:31 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1%7]) with mapi id 15.20.4352.025; Thu, 22 Jul 2021
 19:09:31 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Stephen Boyd <sboyd@kernel.org>, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 3/3] clk: vc5: Add properties for configuring SD/OE behavior
Date:   Thu, 22 Jul 2021 15:09:18 -0400
Message-Id: <20210722190918.95737-3-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722190918.95737-1-sean.anderson@seco.com>
References: <20210722190918.95737-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:207:3d::37) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by BL0PR02CA0060.namprd02.prod.outlook.com (2603:10b6:207:3d::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 19:09:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad5a353b-518a-4711-ac7c-08d94d443c46
X-MS-TrafficTypeDiagnostic: DB3PR0302MB3387:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0302MB33873D665F2A6CD6A56F222E96E49@DB3PR0302MB3387.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RTApTcO/r6Y8EBXBJUsy9B0CXOlDAa4fMQa8i0ywXj+fr2Ei+8aOxzsQhqLVx3YKDtaE3AFWX3zGq7L6Oxi4Ni3BNtRKDuScc99yPAPGqY2NniWGc6G8ZEQtJgsoOzeEBx3nvtWDp/mdj6qVuwNwAlAbhTFdhThy4JVjt89Lbrm3haH9ovyWr7YHmMOnNKZanDi0emEWjnIBXrJT65ZNevthuVFCyDAqJWcBnebrO9MttV+6bJt+8pGA8k0cSOImWnQeupatZhKI1qkS84Mz+qrG5AmiRdoyAkyevYEnXHBA/7w+2bjY/kxpoJslAmdUhEJki4RBbjwGkXUb0Q11JPYQmG4+4J/o+oI04aWscr+Kpgstm9jQQymh3LbaEg03gc1h7T2aouk8JPOWAxOA/vo3i8xRFefeBqjQH41Oaf1RDDCFwHzmgGXRLZnQrWym62k6sR7SaYRS+P0O7ftB3Y1BgfiBb7o5EqFDyKI3jmnS5kpU16GwIMz+QAibDFW38dEP6p7jy0JTM8/mBtzrMTrfzn268aw5qXb/Qmg9+GZTAxGnZ/q2GZRsFewHCILcvumYEs0uGMlGM6WKFaTdE8NhDW8fYGibFKN04ZRhKysVp8IUX7ro6XNwO04IeAcBGrN9gDTxkxnuLZ6rtW7FoDzoQ1O3s9tXsyDqzLhIRp6s1tyKmH/4ANLLtyE8qRbaTOUbDyc+M9U+R94Nyav9NA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(38350700002)(38100700002)(316002)(6512007)(5660300002)(66946007)(4326008)(956004)(36756003)(2906002)(6486002)(2616005)(52116002)(508600001)(44832011)(6506007)(6666004)(86362001)(26005)(186003)(1076003)(66476007)(6916009)(54906003)(8676002)(66556008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oXavbNr2wdeHsE0FYAy9bb5cdZOqPIyUJFDpE6zHK+8Uv7oMSP7Ew5VQWQ2V?=
 =?us-ascii?Q?UfVkJqB5SRP4evQGRm0pI+c0ANUmnpwjUhRh14HUc44ntZSoznUkWNUfid6z?=
 =?us-ascii?Q?pvMDlc+AGDxX0IE6j96IQSMN9ihNSuKW5AsNydHx0ScQL9GZ/IYG3h+NtBSH?=
 =?us-ascii?Q?w7jWhe2cWOp+pXHfQGwWLxt4cFL2UvQVBngMku/mbvsXxPZTeGqecje64+YX?=
 =?us-ascii?Q?NHCxEBW2Cqn3s+kQh+wMwJuJjEv7iPdWGTI4T+5fl1Z1tSFZSoAvng9J0KDn?=
 =?us-ascii?Q?B09K2+9LVfEYP8nrxfJad5KDfRfPYDiNZoVfEFIVtyq1HjLheweph5dFB4ct?=
 =?us-ascii?Q?BOWep9xnjGo2/NTuXb4uURp0DDGuAPCOK6tV6rqfr1LfRNvSK6ywLklrmpuW?=
 =?us-ascii?Q?YwB6v6Op97+G5cf7OQLOqmNeCjWY2y/GivBdPWnRhHAvCo8iSuMIJlRAr7T2?=
 =?us-ascii?Q?A/HcEswjjImdSWXrAZKSRbai9shOmsVKWvnZf35akvPODLxUXaRXYhw8ysnv?=
 =?us-ascii?Q?Sax5Xoow8FcjPgbQ3bix1iRgvG2v91m2LPHHcMlHYGhAIvDyNI8dJaIzdAEL?=
 =?us-ascii?Q?i21qdCkOXX+Nw0BU8NQPKYbz35kq/Ym/qvI6uDdCVEyxpvus1m6CPN23AMf+?=
 =?us-ascii?Q?49xcPQ5mbef4SAptPCqmp7RARDtaKon9NWWcHKnHBhpjlAXFQtf97sM2ALNG?=
 =?us-ascii?Q?ZQwqYJAievPQKfROGZUxWuFrRNySrWLTCqyRYLtMjk7mDEkJVdEcUOM3T145?=
 =?us-ascii?Q?e1VLez4+MVyVmx0zx6jT34j8bx35MEc+ICStHrokgTbCzH+nAQeNHzEMVu03?=
 =?us-ascii?Q?Cix07vkBl2Vjpmq613UtzU+S9THnvtxuXeMunvydTO4Scl/+C+e4mqNtFMk6?=
 =?us-ascii?Q?8ZY/Pz6JV3zqv9JAfZZYdd1NNmGHcndcIRBB59evEBn01BCHmeygn7oB+PcW?=
 =?us-ascii?Q?1ngxGu/nW0J11ENcu9MYLSfXq/Pu0ZWJ4rMR4nvc18ibCtX67EbsUUKv3l/Q?=
 =?us-ascii?Q?0BeACPAnwoMsEuDrHbg/PV0C9CyArz6cV7o1sY844pORfPfaVZYaq5Li446u?=
 =?us-ascii?Q?umS5zuh+YP2saTGW9edG5Elv8nAzA+si3J1WxX2pJ0G/o/Nj46EqtvteRiNT?=
 =?us-ascii?Q?6hfUDMcJvrzLkAwf/5hk56hZYTWLJ1Rw8+ArbPAXdgPGjrWaOohzuL2XNtRa?=
 =?us-ascii?Q?oArUEVgoPHKC3NNkuVgKZnPfnwaSif1wkTD37YsDY5gm9r7w+XAhykjax19j?=
 =?us-ascii?Q?3BevFxkjhkHW/MLVTOm1dC1e2kUtKqVNsvg8SHkl8I2Hio3/Vk2GUYgsvISM?=
 =?us-ascii?Q?KPYBGACgUyIreZqFn5QqJQQg?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5a353b-518a-4711-ac7c-08d94d443c46
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 19:09:31.5324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUzBlOTWp0oX24yRENYcwspLOyTd2uqTZmJn3FnbUsYaccSqAu72+diapBZ3MAX3l7iYq9BEiZTqzNio1jemFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB3387
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SD/OE pin may be configured to enable output when high or low, and
to shutdown the device when high. This behavior is controller by the SH
and SP bits of the Primary Source and Shutdown Register (and to a lesser
extent the OS and OE bits). By default, both bits are 0 (unless set by
OTP memory), but they may need to be configured differently, depending
on the external circuitry controlling the SD/OE pin.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
---

Changes in v5:
- Use if (...) mask |= ...; instead of mask = ... ? ... : 0;

Changes in v4:
- Use dev_err_probe over dev_err
- Put new variables on their own line

Changes in v3:
- Default to not changing SH or SP unless there is a property affecting
  them.

Changes in v2:
- Set SH as well as SP

 drivers/clk/clk-versaclock5.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index bfbb51191c8d..eaeb1117fc85 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -886,6 +886,8 @@ static const struct of_device_id clk_vc5_of_match[];
 
 static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
+	bool oe_high, oe_low, sh_enable, sh_disable;
+	unsigned int src_mask = 0, src_val = 0;
 	struct vc5_driver_data *vc5;
 	struct clk_init_data init;
 	const char *parent_names[2];
@@ -913,6 +915,28 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return dev_err_probe(&client->dev, PTR_ERR(vc5->regmap),
 				     "failed to allocate register map\n");
 
+	oe_high = of_property_read_bool(client->dev.of_node,
+					"idt,output-enable-active-high");
+	oe_low = of_property_read_bool(client->dev.of_node,
+					"idt,output-enable-active-low");
+	sh_enable = of_property_read_bool(client->dev.of_node,
+					  "idt,enable-shutdown");
+	sh_disable = of_property_read_bool(client->dev.of_node,
+					   "idt,disable-shutdown");
+	if ((oe_high && oe_low) || (sh_enable && sh_disable))
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "conflicting properties for SD/OE pin\n");
+
+	if (oe_high || oe_low)
+		src_mask |= VC5_PRIM_SRC_SHDN_SP;
+	if (sh_enable || sh_disable)
+		src_mask |= VC5_PRIM_SRC_SHDN_EN_GBL_SHDN;
+	if (oe_high)
+		src_val |= VC5_PRIM_SRC_SHDN_SP;
+	if (sh_enable)
+		src_val |= VC5_PRIM_SRC_SHDN_EN_GBL_SHDN;
+	regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN, src_mask, src_val);
+
 	/* Register clock input mux */
 	memset(&init, 0, sizeof(init));
 
-- 
2.25.1

