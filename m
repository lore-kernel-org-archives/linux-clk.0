Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA16C4338F
	for <linux-clk@archiver.kernel.org>; Thu, 22 Jul 2021 19:09:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7BE760C41
	for <linux-clk@archiver.kernel.org>; Thu, 22 Jul 2021 19:09:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhGVS27 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Jul 2021 14:28:59 -0400
Received: from mail-eopbgr10042.outbound.protection.outlook.com ([40.107.1.42]:30817
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229897AbhGVS26 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 22 Jul 2021 14:28:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThU+BoogwRDaU7vCWL55QIOencCyXRx/XVDXWZtBmDKiB7zvFjkEYTlsDny3uwXEsE6AVA97cSstNEN8EDjQreCPHF8L29l6X9vTG6zR+3sDm6OA2f+K7LVvn2NkjWwcDsNvf/ELWXNB2JJRz16KczaNdjy4+Kw+1D748JYYC+ZChAOfhpGIwRzbe1rborJHqlNHYmJtA7+BRpdb3zPOkbqht2Jq6T/ofRhxzDmcyth2uA9jp9F28l3WVbXM2Pb3qUheXIi3cRMP4MwnAleCieXTlpXUChVPKPdtsdLMhoYkllXZsiWjUbR7YFt6XoXlmY1WmRafH6z00QeCDDgxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+lEYoNVLOtkRis+YaW2MKXMAgY+TdQZPzYD39aq1G8=;
 b=Nrw/y6jgAZWf1dhy7mS/7Ou3xGpbxxUhlZH9/XjeSXmb0rqFhTY7kdQg3/VmYYFXZOdDOaBFVJD6whkPBBqmoMhr6z6Cepw06FICAtLz/q4EwjPhdAgBbLc8wAkThFuCYL//swfDlgNfuAmkyYPSdqfAJMDfmq6ZiMYH10jXdPe06okTBRAdms0nVChzd/p/vnYEWSKvmHYnSqj/743IEqJ0lwhlT2K1mUnPVdQG6lb+yUkT8PJMQGRDEhe8MtPWBJkJZjODUIF4z/rUnZkGilnq3P4PdJUKDTylDyveqNLBUd90A/K/6sfhl9tH90mD2mdGVoDWjEK6Ub4Px1vHTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+lEYoNVLOtkRis+YaW2MKXMAgY+TdQZPzYD39aq1G8=;
 b=tPGCrQTn4NH/QgdExlmc25m4GQ9F88wyrFRIqhKYtada4gNP6kkyjYT1EH3DI2NqEyl6QwahmoemU2QJ+OK8T4/Ezkpwb01zIwxG0BtdBN/X9Bd57KMf6z5l3hibwAeZ9A7iyLgvvv5uSITSpiBWoGX5IxhvO/jPIS/27XWQ3RA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB3PR0302MB3387.eurprd03.prod.outlook.com (2603:10a6:8:c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Thu, 22 Jul
 2021 19:09:30 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1%7]) with mapi id 15.20.4352.025; Thu, 22 Jul 2021
 19:09:30 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Stephen Boyd <sboyd@kernel.org>, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 2/3] clk: vc5: Use dev_err_probe
Date:   Thu, 22 Jul 2021 15:09:17 -0400
Message-Id: <20210722190918.95737-2-sean.anderson@seco.com>
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
Received: from plantagenet.inhand.com (50.195.82.171) by BL0PR02CA0060.namprd02.prod.outlook.com (2603:10b6:207:3d::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 19:09:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb6454a8-2325-4f25-9230-08d94d443b89
X-MS-TrafficTypeDiagnostic: DB3PR0302MB3387:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0302MB3387B3505FECDBD65A466F2196E49@DB3PR0302MB3387.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: plj3wPvilwZnJRwXepsuCbQ3RK6MiC+4UwJDSbDaQcM0INyyhbKsQB9lqSS4CE4psiDY+r6bzh2DUSbqi2hvT/ztKe2pgwzkG+4b4+VeH/RDcsJ6wJqdbmT3xFYejOlNIdDXrwKpViDNGMLY5G9m3gyLIrreww9B1lV89LAvlze7x5ASfI/ed7/DBuE09eWgsmh4TbLlSqehbaywhjrApF1xoW5h0+0zEPrmb/JzSAV7T2Y8F0N4IyIFv+MaOMReAgGZbxoh3d23Fcy/P0K4Wcc/waEDSdfjxiBFyi4GXtK3QAPbrauU65VvMQw1tUhxJTpJO2Mwa848VicNFG9mOMymUBpolMU/BHpTUVj8G3+VoxypCSqQSc2RLsQGoF8fHO5/UnsNpZ2Hw//mPi7EsE3Reuho6ygkKOa589o9BQieJhuWNmcTu989R6jUCHLkkZbWy6iigrQ7W8T4bjgBbw6crKZGN2yi4fDjGS/L7dWgRUyveqBtU8mSjTN2h5uY1Abnm6bXpLvnlLf79yn/lzIQXD0HNHx+LAXG4WhHD75Iq4zaSIkRaNOehJz+wYyxmk1DrdOb/v5zz4GcwIsnSUm9qrNGND4wvuS/S0p/1ypmrQHz1BHqS8PsJp9rHWoBRaIaYmHtJ48EUe2cTzVNJhZoL5fn0RgEVkzmmAdDy/s9QEW4jQ8a5vRQWKMBbwGFc5BeJFooN8igoFt9pYLn6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(38350700002)(38100700002)(316002)(6512007)(5660300002)(66946007)(4326008)(956004)(36756003)(2906002)(6486002)(2616005)(52116002)(508600001)(44832011)(6506007)(6666004)(86362001)(26005)(186003)(1076003)(66476007)(6916009)(54906003)(8676002)(66556008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F2EZCIOY4qcyAGagC2qtx/I/S0q6xTiqDW7WxWOy/ZPTeODGElaoaCJ1ZcFW?=
 =?us-ascii?Q?RTMPUXP01jyDgyCIe8VY+xvCWt1pMptF37iiBzDmcDTr62N4F6+IirWq+Gmk?=
 =?us-ascii?Q?OSgciwzpY7akHmms+VZGI0VX36gNUio7RsBfzw0wuKUFSsRfim6DWBvrk11h?=
 =?us-ascii?Q?nou4/Tf6ELlpKkVru3XUFPdhCmyi97T3OhhEN8TaneWcS75YKMd0RxWZvaMK?=
 =?us-ascii?Q?Eu76VtFjefcnLPD07vHNy87SFy6HzXS4u6yg0DAfG+ObrxK9WkKmmTpxGDXs?=
 =?us-ascii?Q?BBBj0GFuPWWdFAfE/12NXFmNgPTcV4Y4GfzZ5ZsV3TjdAqsVnQmjg8uPIsOS?=
 =?us-ascii?Q?SK0tSq4F69jN6GHnveeusX8C5MHgmN63ye1bS0I93DVPvFQcUoZtmdX9U3Ei?=
 =?us-ascii?Q?E4sX98+nrGChZm3muVRkk2cZV/q1UPbTB96vCM5Otf8SYBITulZwJP6FD2kq?=
 =?us-ascii?Q?jH5qW4lT63s4nRdEcxliCj52dfBAZUqqGbgrvdncWMjDULhQMp9HddA9rwbM?=
 =?us-ascii?Q?NG7Xrln16rRd/dav7/DYzLr31Lotr7v18bErmnDUreHZ4f+VraOE0A/jXOrR?=
 =?us-ascii?Q?yqZFi6F63WV6OABgWrUXPHZouSjYNHMPVBkKAkL5z4Ht9vkurCbE8QgBo1+O?=
 =?us-ascii?Q?+aHBaogBYWYmItM1KriRKmthKcJneFS1HFJDOHEvJKbn72EsQXLzkaye9hfo?=
 =?us-ascii?Q?acdtYJvwd+TdurvqFpql9eshikJ7M5rj3lpbQ3enhODqutOnT2Tqc/i0cD1V?=
 =?us-ascii?Q?zm/YsvGS5PQfi3hYGPvtezN1lInD/2hEU82smTDPZSadwAC/kia2SD6tYAGN?=
 =?us-ascii?Q?i4d6KIcnecvxNBgk562mMGqJHIZ4nLzeIDPfAvWTL63EbVs583DjaMDMljFF?=
 =?us-ascii?Q?XufdMwx1Ux0vN4AhvcNetizovzBWDsVAZioV5WrgTAYAfzEK1yOgMW2EfpIx?=
 =?us-ascii?Q?YxbVBLy588a1eu96wTMUiBLamMINQhx+x08a9qkoC0wf2MdT4gQQSKDBlnP6?=
 =?us-ascii?Q?6Z2CxyAtS9zEAP9GnKRLa9usjwOyjkW90lJI2XH9MxvVl6Liywq4+hAyqMSo?=
 =?us-ascii?Q?oCWLBkHNUIqrJZ+hYfW0K+X4d1EfVMK9H8OLoScFNxy5jeA66NggZNSoWqq2?=
 =?us-ascii?Q?pJbx04ZH0iuXiJ5vlRTN6AFcquX0QEzQSSZ3nvPoCVPncySFbvCGGJ6p4y4H?=
 =?us-ascii?Q?R4G/bgE/Y0itNir57lh2lg59bRoVZGJq8jDMQkHt2I36hfVt/v9pwteik4xV?=
 =?us-ascii?Q?+sohDaXL+MlqiN5RYD2DxBNApkGxvIaPB3YdqXwzNGDv94ZDwy9C9mguykSA?=
 =?us-ascii?Q?UZbLKJCwgaoS28YgFHTGfG7q?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6454a8-2325-4f25-9230-08d94d443b89
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 19:09:30.2751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSwdwvGjFJw+Brqk/HTRHS/kcRGmL69sJE1svUqEOcNUZM+J0BrChoYbE2mpdl0mgdhS7wEh2cxMdH4TKITaQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB3387
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert uses of dev_err (+ return) to dev_err_probe.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
---

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

