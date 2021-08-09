Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90588C432BE
	for <linux-clk@archiver.kernel.org>; Mon,  9 Aug 2021 22:38:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75B2960EB5
	for <linux-clk@archiver.kernel.org>; Mon,  9 Aug 2021 22:38:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236800AbhHIWjD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Aug 2021 18:39:03 -0400
Received: from mail-eopbgr80059.outbound.protection.outlook.com ([40.107.8.59]:29414
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236798AbhHIWjC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Aug 2021 18:39:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmLSzNia37xajwZuKiCCvlmR+IiiW+xWdV2Gewy7AKNwn4n7iTq2q7imgjoxPyKE3Vv0uEVH5rbJPbNLh6ApDstYC1DDttqmt4rQ924tZmK1Bd10+lqAvanRUVvIUD8dGEdqznMDRJqYwS6p04miuYZ5eBCQA5jS6HR085a/GkZv1oFGkePz0O+TAJFLwvM2RgqTVh1KbD65qCZYUWDNfRjzOLw/nhCfvlDbWn53CtULCTN1DdAyCF7LNNfn1XcJF8C+pSM0rTl/ZvfDmkOiFO8voXFtRbVtdjWqvGAV3i/el7dWrnoCQ+gbW9Y7cQ1x/wKKBDuYOiqjppfHv71sMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JK2nVz8yL1JNKob5c5s9SuUST/+bcVld7RdFnEIMdWA=;
 b=hjBRFL4vmw0H8JVDFDc21/9iuEhIqoBs413cro404eZXfTAxdH/wJJnseRPvZMG1mDbYgEIC36gHCwsY+gl4GrKUAOBpnaNoTSVrqOVamKSIqLBo0jB7h6+B3ww4lNI+CxpjU6UBf+qD+R9K1lqBjBLO7eZD6Xd5bWaGoYAaGk3G9VHXqbuWbcVt0CeHmbB1ZWWPbrKo84VpsfHugEQAEYv2II1tzxs7E2lUBCfM5/frCbwJTvvKe1f3xsUTsI8pJTXrbnjiZ3ytYxNdq/McE2OcnuUL91h7eMCYCwXwguSVB/gkgeG/ezbs508T3zO+ZiMB1T+WskcjAqhDTY5Kaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JK2nVz8yL1JNKob5c5s9SuUST/+bcVld7RdFnEIMdWA=;
 b=BMCfgRMAZ+GCHgCY9STNxGPyzvbCRFTkKCaDNVoMj4Cw8bL+d1qTDyA3A+h+KZ9LSPmziO+N0meIPI8aEzdH97CgnlavZC+zcYPnD6VafuV3XknFJEczmDmBfZ/KNgWEp1wUzCmoFcrqLBSGQNuPBkOQ9MTW4ox90Q7dAMnUWEA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DBAPR03MB6390.eurprd03.prod.outlook.com (2603:10a6:10:17f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Mon, 9 Aug
 2021 22:38:33 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1%7]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 22:38:33 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Adam Ford <aford173@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v7 2/3] clk: vc5: Use dev_err_probe
Date:   Mon,  9 Aug 2021 18:38:12 -0400
Message-Id: <20210809223813.3766204-2-sean.anderson@seco.com>
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
Received: from plantagenet.inhand.com (50.195.82.171) by BLAPR03CA0076.namprd03.prod.outlook.com (2603:10b6:208:329::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend Transport; Mon, 9 Aug 2021 22:38:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6beb759f-476d-4d5b-07e3-08d95b866b23
X-MS-TrafficTypeDiagnostic: DBAPR03MB6390:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR03MB6390438288C6373887F1A7C496F69@DBAPR03MB6390.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vdcBJj0nANKh/QcGxkt8Y46D4jrmyWntjbdoDYeDnz6Zzt2Xyos3lnoVAHFLsZoL+jCwGf7cH67yTagf2ySD/9LspfgmfbDM/gIS5YZqsu/hj81ZZMLKL6ZNYkwBKfmrMBU5Z4nEbaVKYDLFxg96LfYAgMv08ZHvLmwBVt6bnEcdP+HQFl+IlpcYERXItvd8jigvYOvFwqxVE76UfUJj+Suo5sYlGJQ31meAtX8CW7VWI/9DDnE9mf6R6bIILje0FUmy6DlLpUp4+OeYIh3r3VTcLAC0LQIoH+kTizalgMOtldvluBtMga/OLUAwDqEYOJ3QXmg3GjYTBt+ABvFkYmgwVsjVObHKDUNcqCC4OfS+wVX1tonvHNEya/waGA4URekkkeH3umQ3jJSBv5g57PkWWBa9ejM8QAmDMl3xF1E83q7BA7MXxOhm0GYoN1CdOOR4k6rH/9GoHDiCIv+1/9Kz1W0KwNdmUzodme8E4oVyOVRjpgqlj9F0hmIDC/OSs2znAq7p8QdM2rr5i59DmbHaAfdYzi0koUhmhAM+2r7NiJRN2GF7k8zvkf+RNR10ifmJ4wMt5+3eTJKmptOzJRLzTsUn6ndXWcBQuCJSwcTFpzu2pFvg1v3K14fAXywzN8CNReBPypfaL1tRbJvbhIJzbnF4dbKVaZJzXqbKseXt71qeY2UYoG8eoJ099LAei4W8ut0E38qyxv3Od1+c+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(396003)(376002)(39830400003)(38100700002)(8676002)(38350700002)(1076003)(44832011)(66946007)(54906003)(316002)(66476007)(83380400001)(66556008)(26005)(5660300002)(8936002)(478600001)(6506007)(6512007)(6486002)(36756003)(52116002)(186003)(86362001)(6666004)(4326008)(956004)(2906002)(6916009)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kLVNo5U+4EwIsKe863/evQsbCAd4lNcqo3rJLiNv7Vn9dZY0iFIbFb0wFQzR?=
 =?us-ascii?Q?+wlXV5SA/LbRio7JaCBlQ6jBGVLxJrYd2GD+T28HQVHJ8cSnAcbSdoU1msUB?=
 =?us-ascii?Q?gGWx94kSVtKyWArmQ5jxnIjXOO9e+YDr5HvsAVy9MrveFDkZvf+oSw3Zrydw?=
 =?us-ascii?Q?ndq+5wInOS5MPu+hkv22kPQem5+IPtYyYh2MX19pU4sWPF/Geu6pxLL2YeZp?=
 =?us-ascii?Q?9KqYMC7Rb8Esj6bxBdh8JQXi4w0ahhP/0cpLVxyY8pMRjly5rbUwiaUuamnB?=
 =?us-ascii?Q?LyOWy29ikw+RIrJEQ+jJEMeShL5X8ESVhRHtRa2SUy0g1Mnvad6d0zA4v0us?=
 =?us-ascii?Q?SprSFBP1QftU7NfyOnJmWLqXv74vaKAhcsqHY5JIlNf4JttKYp68J36TLD7z?=
 =?us-ascii?Q?MeNPgrzhfuIE7U5EI19SPOdHMqqGi4GvEmW1venKiOP8a22qlDF7KVrwUfyH?=
 =?us-ascii?Q?zPKYk78JfNgTeyUOSeK+txTzo7TtnXTQK9oM5LsICHvgsd1AMGVD+bVbMdKg?=
 =?us-ascii?Q?yibJED+Ofh7LHT9c7F8DdKHO3BASRlhpUz2VnZZ258+4H9bQmMJvIpd8clgA?=
 =?us-ascii?Q?C0K7bJA1lJtGemKOTGhwXVMkwsCBNPARkkZetTCVP2FA8KgPdZA9HGLBW2kH?=
 =?us-ascii?Q?cfBleTiAR0cscR5RD4EncEb5urZV4OKNhx/qKSYttZJmTRAFJB2bR/Q201ta?=
 =?us-ascii?Q?HgsthhkRKRcPr5jzxoNwNJ6EmS3A4dA9WV+Utq1exHuNtMzVOW3hmf1VtJEU?=
 =?us-ascii?Q?u35shDkiruVBaZiwdaziZBFxcI3dfU9OvqFlG8oov5hH0B+tdQex7op8kaPN?=
 =?us-ascii?Q?MLtse6lN5WhFi9N4N6zUnK6O7rw1A0FLMmHWJEC59lvoLMsUrIiWYq3yzA6I?=
 =?us-ascii?Q?mxdyO5UgGzkd9uicBs2HZ3FtgAlDYbEdizsyTdFnfKnvV9ZzbCGsmP9sZELu?=
 =?us-ascii?Q?lv+aY7tL5sam/dQ/wzF3lPD9g4OJi1+oJ4oScG3hyFqvW/N6pI/GH2yBmRXk?=
 =?us-ascii?Q?gak2kJyZuJLQ8IVVIpYW4/6LIbsKeCW6BuBAK5DWyGX8opFFGEO36TNCuudR?=
 =?us-ascii?Q?f3MdfTosL0I5a/LnJqCdoUZSldzMoVNTYBsy8g772N2dMsgpYkibIwg8nR1H?=
 =?us-ascii?Q?f2jk61FIkB9U9Vqtlj93Yv8UPhUcg697ly8aVe9cdIOMVv+K+oXJoI0p8Oyu?=
 =?us-ascii?Q?h65S1gyghehoidhvBa98WBSIZ04LPvDek2IJOd9oPPWflh3qih0hUgQu0yCb?=
 =?us-ascii?Q?fS851Ow4vebqMO48OxBsoVVSfpWVeEZLOBVSebXua/11bk4B0Mok39jzLuLz?=
 =?us-ascii?Q?/U68hy0+gXHG7sS5geQatL0+?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6beb759f-476d-4d5b-07e3-08d95b866b23
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 22:38:33.1828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xH7wld4M8CI5eQv+n/xXaQIEjm7RFZNTWDpln/jmvJ2l8w1uRhmzPryn4qQTAHO1X/vpPLvGt1VlushQiZwieQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6390
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

