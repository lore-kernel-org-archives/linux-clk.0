Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E152FC4338F
	for <linux-clk@archiver.kernel.org>; Fri, 23 Jul 2021 23:13:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1CAC60F25
	for <linux-clk@archiver.kernel.org>; Fri, 23 Jul 2021 23:13:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbhGWWcu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Jul 2021 18:32:50 -0400
Received: from mail-db8eur05on2083.outbound.protection.outlook.com ([40.107.20.83]:51072
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231954AbhGWWct (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Jul 2021 18:32:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/zk9xUHY99b19XdS9FXm79jNSxqZLfVqIsozDQ2g76FDgvLRMJAzL3VqohNhb6Nz6Z3XvWj6msRh+Iij7yoJEZ1mI/66c6ocyZV4P/9/B6R0H5e86wADKbZPvjVKwREV3GueZIR8YAHQ+Z/RO7JQCrHlhEcQaxxYDwpSmIWMuuzlZSjaBZE5vGO8mKleOJC9wFr3LpkmM2W6Cvf6Tfso/Bj/HzmPfSFOGNomIJl6TPcBbJDrfP76UEeI8TYEXRXgcWrnFtVj4FZMKGfmm9ZKmOWMZ2dA7L+65mSILzxW0DFJdeXsV4VzTUkavsVWn6uzRViohlQOaRzuGBgN6lnUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JK2nVz8yL1JNKob5c5s9SuUST/+bcVld7RdFnEIMdWA=;
 b=mf9bsTYDtYU94KVapcKLf7ICuPhR7JHfg6z6p2A6ErWULPz/Gw+RKYgm7mAzw27m9scBkvijVcTBgzlIMCPwKbSMLeG3JwDGhozGLSTM1PBnltgy3M/0rEX/Ih3DUrM7UNCvov4YHvsy1GhILz+Yf8E8qmcw24TZs5x9PS6bjY9V9aRW9/KpYGAODTAbQIhcxkY0iF+ceEFbsBV+4qnoOuRpSNTkmevi1KUXBygtTpG0UF2s+TiI47Nfgzq2lFxzKEdz66Wq5G4GaegzKl2BiM7Ve8dh+S2MYfvtRUAZ4Cu7uv26b1Qys2BBLr/RO5g29MrKDF/trzoOU8CnLz3J8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JK2nVz8yL1JNKob5c5s9SuUST/+bcVld7RdFnEIMdWA=;
 b=jmjycl1bLp5XzzliRXzzbXuKMS7SrKGcCH3PF8sQ7LqI/DpWYOACK87XDBtoLuh/VBB7lUsIpYqzrK8yuAG/8MBKchpq+eBNQ3HX2wg594cD6NExMLF2ID8HzfgPt81eFEMtixuirLUzPUYQ2gZXjil32mdjAs0Ord+uUrzj/8Q=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DBBPR03MB5365.eurprd03.prod.outlook.com (2603:10a6:10:f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Fri, 23 Jul
 2021 23:13:20 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1%7]) with mapi id 15.20.4352.025; Fri, 23 Jul 2021
 23:13:20 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Stephen Boyd <sboyd@kernel.org>, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v6 2/3] clk: vc5: Use dev_err_probe
Date:   Fri, 23 Jul 2021 19:13:05 -0400
Message-Id: <20210723231306.674310-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210723231306.674310-1-sean.anderson@seco.com>
References: <20210723231306.674310-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:91::15) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by BL0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:91::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend Transport; Fri, 23 Jul 2021 23:13:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97699eb4-a5b7-49f7-6ff4-08d94e2f75f9
X-MS-TrafficTypeDiagnostic: DBBPR03MB5365:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR03MB5365E5273F3C62155FEAFE7596E59@DBBPR03MB5365.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m3ugr0312L/hDz5GcylTEeHgdlDb8/ye4IhKPBfY0PmhERhEJ6J97c9uz3eYSmGNMLrWMXsGGAc/+weydxPny3MqyRPxX4XF+uGh6IgaIWv9Fe3RPtTXtjE7DIQPgWn0txNbRdTjO6++3BAiRSefaBzLUlZQufA63XE3MzOIRntKmug26ZckAaj9CvtewhnSr0YeFsPDjU/arWnlGTGSd9vp+c4FyUeYxf+1/Kjm9hpcnUQXS+sRvx/kSEKiZhBxQv7pjJD77GxlbkEe3G19bjYcUGKBbXI64e7bi9QhYZC/3QgmY3rWiX85LtLvT6Z7tr0tH8kZkVvvbqXO8SboqE7JUXVrMqpshxVUbJETRzT/fv2GKNLV04+ANSgRlOOmNSmaKslYIoDGd7wjy/JtGctNzpfAYdImG4WgGBMy4uo3fMspjK7KSU+rU1ejS4QxddB7qd2tGbCWrZhrzfvJzbBl/MCF+5HTwqdDSe6Jvb+9nDxerZ+LAtGbtl6McSgD/S1w0UfjOxj6ZcCCjfp6W0gYfCLpKSGp7U4HLmxqlWUvIn8ukkrhPGF4xW4bmmr1/y1BFQTyFZ9q7RFyBj/dTdd8hr/qFt1Uhj9Dq2Qe2uj8Tye92EeD2m/piC6fjTd9cdIV/IJuCXKsS3f+ktgOKStSctH5Mw+RVuBGzK8OMnFr5B+1zYQwpoqMmGP5jOn0iw6CVh2AIMKe3shf2b3srQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(39840400004)(396003)(376002)(66556008)(66476007)(66946007)(38100700002)(38350700002)(52116002)(36756003)(5660300002)(956004)(54906003)(6506007)(44832011)(26005)(6916009)(316002)(2616005)(4326008)(6486002)(478600001)(186003)(8936002)(8676002)(86362001)(6666004)(2906002)(6512007)(83380400001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?laqp3GrYms6RYHAPK3WWWVtURRqAZRhA1d05Bl1fG0Fgk0rAWG49hkoO8kTa?=
 =?us-ascii?Q?P0quGdGzbxiCqCaOdtZQhjlAZvOUKzbhVH02QKo8A7Zyk36XSb7nRsgEzZGx?=
 =?us-ascii?Q?TpzE8HVCcU8N7Kv6VvTp6EbtM8b0ihhu80FL26GPqk7ZZbC6OJVHrLvGOplx?=
 =?us-ascii?Q?vXi4g8Zwf9VEkVHJ1qA5Jc57FxONXsR7/DBy98+8akfbPFZvWEi/e9nC+XYi?=
 =?us-ascii?Q?HlPJHPbhIYpLfykI4eT+UkHpN5Ji2c9XYiz1iYM9Rjt/b4duBr1n4UZYXuuK?=
 =?us-ascii?Q?+hVEFPs97PhoMXTrxm94R82bj19ZPvfxKLx83snfUxwXOz9y5gz6EIuVJwaS?=
 =?us-ascii?Q?Ba2iYUWbEqz16V7YtOQ2NC9piGs7JCo+uxngjdoiPyldx/gkp4h3JpmFE/mv?=
 =?us-ascii?Q?+H90vO25IXiJsJMUXQO8Pxk/22U9+9gmFNqqRLv2/BCj42aSkETGUirDOLMw?=
 =?us-ascii?Q?szIdeY1Kg6NtUXjQL8eHYOAZiIa5Dbnx0gsaw4H79H2Y1Aa0gZorFVSwxp0x?=
 =?us-ascii?Q?qeUlXNCuOPditUfWSCErrmsO014ROOcsb7i/wDSVI3gBaRdcoVo0jgytPf7+?=
 =?us-ascii?Q?dcIvf84Isyr5NTd2Ft/568F5PlYWcdPYQF3qWTRyTBDrdPEFTv1T1+FLRAAD?=
 =?us-ascii?Q?LL1MawkF0RzI6YFcbC1hd+Pe20YyDKS3kliXu0w/EkKUiWkCBEjEL7NJ4fTK?=
 =?us-ascii?Q?jpl6l/2Bzde+GsSBgosPF4YA1O8cyyXB3slx0SWwj2fe+Bw3ECt0w1J48d4P?=
 =?us-ascii?Q?Zy3OYeuqNHcy6nOdesJclkYm0O2FYN3RAgZ5rqBFV4kbbIJU6rHw5dmz0/zE?=
 =?us-ascii?Q?4E88hTTQ8TaCmMlMOfEugUOx170ihEfmfDvLvB2n3F79vTDaHu2ADe/QeOVJ?=
 =?us-ascii?Q?B1dSS6lTiXUenmuoumCtWGn2IrOv5ZSlJ6DN3No/rRZKxKt1oIOvMhWqCv3i?=
 =?us-ascii?Q?wqLN5h22wUMOxfPnDCPhBNfJFzdyqTXR1bsgWe9N9mPmCeCnJvrYBiUYc85r?=
 =?us-ascii?Q?kZBefrQq4aTqUF9bqEZ9yMkLDfzPXMhC0buPYPwAfSbJ2zl/V92oXi9+vWfD?=
 =?us-ascii?Q?MmssY1uBEfzuML7zsD1OrGQAjwQP8bnDpMK4IVuA7oKAyZTdmzyKbM7lH7I2?=
 =?us-ascii?Q?5rmupqAq7Q6M8d8axQ8ibvzNSn0BbRVs8yy1tWqxwClMIplTgA3mMvU/j34d?=
 =?us-ascii?Q?d56Jk/nEWmQ8nAkUCh7x0rxJYEeb5AZr+d/HL3hcRW2n8QTEgN1E+ncpyaUH?=
 =?us-ascii?Q?sAwTKhVB4dTpSo7WSq5FA2AVkii1tX4kKlMa9s4JZFsYlamI0DwYDX5R0DCP?=
 =?us-ascii?Q?V4eMxrxwPOa3YPY9kS3o9QZe?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97699eb4-a5b7-49f7-6ff4-08d94e2f75f9
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 23:13:20.0526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sg7hFAWKc5voe/O776AvMxTPE+GJQjgM6TlZAZ5zkzeyQesDPUfx1NhMe5O7T+rzZcdst2waV395oclJMXYIFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB5365
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert uses of dev_err (+ return) to dev_err_probe.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
---

(no changes since v5)

Changes in v5:
- Note in commit message that not all dev_errs converted return the
  result of dev_err_probe

Changes in v4:
- New

 drivers/clk/clk-versaclock5.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 344cd6c61188..bfbb51191c8d 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -909,10 +909,9 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return -EPROBE_DEFER;
 
 	vc5->regmap = devm_regmap_init_i2c(client, &vc5_regmap_config);
-	if (IS_ERR(vc5->regmap)) {
-		dev_err(&client->dev, "failed to allocate register map\n");
-		return PTR_ERR(vc5->regmap);
-	}
+	if (IS_ERR(vc5->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(vc5->regmap),
+				     "failed to allocate register map\n");
 
 	/* Register clock input mux */
 	memset(&init, 0, sizeof(init));
@@ -936,10 +935,9 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		    __clk_get_name(vc5->pin_clkin);
 	}
 
-	if (!init.num_parents) {
-		dev_err(&client->dev, "no input clock specified!\n");
-		return -EINVAL;
-	}
+	if (!init.num_parents)
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "no input clock specified!\n");
 
 	/* Configure Optional Loading Capacitance for external XTAL */
 	if (!(vc5->chip_info->flags & VC5_HAS_INTERNAL_XTAL)) {
@@ -1078,14 +1076,16 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	ret = of_clk_add_hw_provider(client->dev.of_node, vc5_of_clk_get, vc5);
 	if (ret) {
-		dev_err(&client->dev, "unable to add clk provider\n");
+		dev_err_probe(&client->dev, ret,
+			      "unable to add clk provider\n");
 		goto err_clk;
 	}
 
 	return 0;
 
 err_clk_register:
-	dev_err(&client->dev, "unable to register %s\n", init.name);
+	dev_err_probe(&client->dev, ret,
+		      "unable to register %s\n", init.name);
 	kfree(init.name); /* clock framework made a copy of the name */
 err_clk:
 	if (vc5->chip_info->flags & VC5_HAS_INTERNAL_XTAL)
-- 
2.25.1

