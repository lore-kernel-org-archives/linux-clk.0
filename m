Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A334C4320E
	for <linux-clk@archiver.kernel.org>; Mon,  9 Aug 2021 22:38:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5264560F8F
	for <linux-clk@archiver.kernel.org>; Mon,  9 Aug 2021 22:38:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236227AbhHIWjE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Aug 2021 18:39:04 -0400
Received: from mail-eopbgr80059.outbound.protection.outlook.com ([40.107.8.59]:29414
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236797AbhHIWjD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Aug 2021 18:39:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiyZI7q4xrIDHM9SyRHx3RWoLLAlEpcpvOfjCc6OORJwjEqRtNocHe8Lsj/U1p4TUWWK+2jkjiZFhNiT7vRoG0l3NQAR+Al2sRGorPqqOTyZJGKwxlYSHbfjPO3IeCXmelwnDQ8DbQ7gL0/wdR4F08HYUc26Jm6UR+xRjQSA+GLMXo5/rPFh4yEeTBGrhWmTKJ2SFKeem/OdkdOvl46qBwjg/sgwTqTKXN/Bg1loyWbAQs/g/2SzTqzfTEE5FX4y6whIaoA6gUWG7V6rqJ8EQrwqhsK63HD3fItk6pdbOD/304gSEavFKVlCyLtXP5o0dCsu4DmCrCQ9draA/NZ3+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qX8Qf3LE/5ug0Xz446LD3gIfimM0xwjhAPyCSZaiLv4=;
 b=TAlAi4nLOaFOFGSO7BDKx3PepwDY0N4LjNqo2K4g8r+vq0Rhc7ZxFWCG2HICG1hIyRHA4c8dFrXKILAvKs4ykis3RfM3YYgNCE1xrGr+YgjrCtfUTX08HjoaHpgtPs8MrMUnB+ORwUoRsB2Td8IjNB9flZZN9Wo9V+kcqtqfFMNXcrbIph14EEWgy6U45ylTtQc0iIA6krMHy57d3lMLDwiF3tImMH8ObdV2Me0i4n2PR7rAN/YP85y9N5nYFfMxZk0FyLkKa6268YB3dIQgflXcwB+Dvmp+FDPB0Ap04pW64dMdmJnNkdeOk7x+oGR8RSFtxo+71/wAR2XOjkh8ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qX8Qf3LE/5ug0Xz446LD3gIfimM0xwjhAPyCSZaiLv4=;
 b=57TeLwJ2IfHdRyGJldrYwIyUe2nR5xfAJjnu7aH2FbyeeFbPMTSehbft07o5k4CHLeMCtJAYMciwZvPiozraUsYbFZso4ay6DfDvfhH6ple7YuYq8baaILCpe7QeYw9OQgbGgLZ1N9H7m9SSKivduXp7yODAVvZ5kEju8XYaVkY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DBAPR03MB6390.eurprd03.prod.outlook.com (2603:10a6:10:17f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Mon, 9 Aug
 2021 22:38:34 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1%7]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 22:38:34 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Adam Ford <aford173@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v7 3/3] clk: vc5: Add properties for configuring SD/OE behavior
Date:   Mon,  9 Aug 2021 18:38:13 -0400
Message-Id: <20210809223813.3766204-3-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809223813.3766204-1-sean.anderson@seco.com>
References: <20210809223813.3766204-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:208:329::21) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by BLAPR03CA0076.namprd03.prod.outlook.com (2603:10b6:208:329::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend Transport; Mon, 9 Aug 2021 22:38:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: faa37efd-4447-42b3-4cdf-08d95b866be7
X-MS-TrafficTypeDiagnostic: DBAPR03MB6390:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR03MB6390CFC9601909B508F9291C96F69@DBAPR03MB6390.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9B9lIbgKZdvBgXzX6/VLBWofQxZf5MpvQORJvHtHA93dWJBEk6XWmqH7KkxAlWUEl3ECB3SxC1f9ix3JpUmywXjh9sw/+t9NlwC6GW01gKXgvTFqJvoasE0yZd1ehOOvkpq4PkpepDJv5xca4RCoqwzaCYThI8+6QYwLndYK4McRh36pb/WxX9MF9G0H6WviUKJ0lnZtB7OZuK5Gn1FU0re5vW5VgWxtN/y3r1ykEm0hevfut+ERELAoEJFz8tg0y04a/R2UKwaAavndqlpJcGHYvoIABRPJveoE8zc23TWQjqHsh32uUgKe/uCecHdfyPgvSw4ZdSb4coS+r/aG9/VkjFOG/nO5wyEr0PqPe0QaFT7AN44x7Qyn4mvauwSdBe70Yyepv9XyucI5RaLAXRjRzW8/tuJcttKs7cxjARDclD7jfDpC/nLIhbcCfacQj44ThKSCQMbfnu2450MZZqwgJNEJCQSE/0DfSBnddN/fH4VTZMbcp4STSy0MFXJCZjUAsKhMAk/RGUbL7NP2Gwbf/RvImKVqFCeF/Hv/XYhicYzKVm5xCCKdg9BkAxGc38i+tyyZHscsphBPRTFuGT1LUMaUG5e0asXxnT9HfinDEm2977oHKE/V1SbdfZVYX7x4zIDw8gMq3lYW1FCqqbCOzz5fxGxa5KG5BpK/T7DE0tc3nkb2uz5ZEd5EwCxRjcpDR4uMZwzE/BBBY7lFaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(396003)(376002)(39830400003)(38100700002)(8676002)(38350700002)(1076003)(44832011)(66946007)(54906003)(316002)(66476007)(83380400001)(66556008)(107886003)(26005)(5660300002)(8936002)(478600001)(6506007)(6512007)(6486002)(36756003)(52116002)(186003)(86362001)(6666004)(4326008)(956004)(2906002)(6916009)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8X1PEP6X8gvd8b2F0JGaRToZNSEmmPIkQJVG8RT5q0QnO582loCV0iy42d3N?=
 =?us-ascii?Q?U8heWXfsisWC4WQJN1hqE+nk21m2d0Q6L5pFW2nk8HSEWzYGpSNtVmJTgdB6?=
 =?us-ascii?Q?cr/uT1Ch0AMKrF+9Xdzb7i9JIDtLa66DjkHxNzXgydEJILJKxn9OCWdUbfar?=
 =?us-ascii?Q?9DrZpb8vj1m2sZ5o8z0IhEogYrA5fMp3dVKRXIa/kG0OECeFcmt02WcIQc33?=
 =?us-ascii?Q?LYbNd1MtBIiSPoH9dn+fZjwEUV8ohGzfQFNFq/j4Wim8cQe3TDuamkX3pZtE?=
 =?us-ascii?Q?IMR/xS0q8aLkOACm/UXk412S5+DvTowJjrQLBvWXyMdxFrh5UrtI2kRJoLPo?=
 =?us-ascii?Q?23mgpx3TizLWEhURgLVVLG74tZIoe56rZqEGbz3x3HSwyZ9JIsCtKMnkFSvg?=
 =?us-ascii?Q?QqxeaPsIjABWgvK5iPAqTcAYVqWf3+PDZSjCPtlQ4ByiRM8imB2jIQwRuWyx?=
 =?us-ascii?Q?oxrqla9889NMEeILGyFa/WomBj8SbiRvbm8KeJMTZQm5uZc7OTlbjnvvhI7l?=
 =?us-ascii?Q?AZXzPQbBLyCnq/e52di8VPDe9YNsCEPiuPml3SUpxxt3Fpb8oEsBJYPrlTdD?=
 =?us-ascii?Q?1GCyEdbnu5FTW7ykP6IAzBqaWTepb+Ej8lDGTiyXHGJ5HK14v9BLO62y9u1Y?=
 =?us-ascii?Q?pmcEzrHQXNnLBmMGnPreqDcnXYc3SluingzP8L4k89Rur/G9Hh53cdqLrRob?=
 =?us-ascii?Q?FfLFAZikTE33Q/gZMaH23Cy+gAomcVpgNgxrH8dWoQMcye/WtdVGXQlrWgtx?=
 =?us-ascii?Q?tSJKTZDxmzifMArUfGkrM5AfomlA0uScJ63ATvRA92hjM/iMwS2xXVV8Qewm?=
 =?us-ascii?Q?Fk+ufc+mjqIhWrixcq9ayx1FqiaSqAs82SOzj80EpFpcCXnFXcwmjDNLImj1?=
 =?us-ascii?Q?9KqS1QU5YUFYjDHq+/TVkJ+4Ah3garGB6wKldnqCadB7YR45V3fsNJzBQDFI?=
 =?us-ascii?Q?YFOvEANa2jIbgLoi6qFR3vjTuLt73XfcB1rGfqkB8UzcpxXQnAn7XhyGwo3q?=
 =?us-ascii?Q?cu3dRpjMS/Ocfd+/kMxmZqG8gYpqdUD65FxD7ED6MTKQeYVRhj2T+ostmmWZ?=
 =?us-ascii?Q?jitNXLwYrbl86wRnENJbIsemu6ckfLji/7vUZP3qozJV7JfU30wHfPhO5TW8?=
 =?us-ascii?Q?lEABzVOd1RCYetDx17VZHsmmKz8FO9YsjcSW3UAlbgqEgXwyIHqf3H8dGPap?=
 =?us-ascii?Q?w6blEOFaCGlYf2xxsjNgnfRhvKmcwUSB7I1Z9sI2sUEEEdVEtCDeKhXmHG1r?=
 =?us-ascii?Q?OH5t0WSq5/jOQ6A/eiwIib5fm0o2LuvCcm1VhxHvb0zsnLBlfFP5J/WPbKZB?=
 =?us-ascii?Q?RVanLrrV1sVYEUkz78uSb+ux?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa37efd-4447-42b3-4cdf-08d95b866be7
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 22:38:34.4731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+xh7q2fP/t6RUeBeV9+3PTRB5WkQQcPRm1u+qyweZMyyISBPOigZlb1VyeABUIZTJOjy8utdKJ6td6+uMAXqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6390
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
---

Changes in v7:
- Fix failing when ret=0

Changes in v6:
- Use tri-state properties
- Drop Reviewed-bys

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
index bfbb51191c8d..9ee486c03eea 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -886,6 +886,7 @@ static const struct of_device_id clk_vc5_of_match[];
 
 static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
+	unsigned int oe, sd, src_mask = 0, src_val = 0;
 	struct vc5_driver_data *vc5;
 	struct clk_init_data init;
 	const char *parent_names[2];
@@ -913,6 +914,29 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return dev_err_probe(&client->dev, PTR_ERR(vc5->regmap),
 				     "failed to allocate register map\n");
 
+	ret = of_property_read_u32(client->dev.of_node, "idt,shutdown", &sd);
+	if (!ret) {
+		src_mask |= VC5_PRIM_SRC_SHDN_EN_GBL_SHDN;
+		if (sd)
+			src_val |= VC5_PRIM_SRC_SHDN_EN_GBL_SHDN;
+	} else if (ret != -EINVAL) {
+		return dev_err_probe(&client->dev, ret,
+				     "could not read idt,shutdown\n");
+	}
+
+	ret = of_property_read_u32(client->dev.of_node,
+				   "idt,output-enable-active", &oe);
+	if (!ret) {
+		src_mask |= VC5_PRIM_SRC_SHDN_SP;
+		if (oe)
+			src_val |= VC5_PRIM_SRC_SHDN_SP;
+	} else if (ret != -EINVAL) {
+		return dev_err_probe(&client->dev, ret,
+				     "could not read idt,output-enable-active\n");
+	}
+
+	regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN, src_mask, src_val);
+
 	/* Register clock input mux */
 	memset(&init, 0, sizeof(init));
 
-- 
2.25.1

