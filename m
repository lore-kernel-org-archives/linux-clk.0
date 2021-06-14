Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79194C48BE6
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 15:54:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62C68613BF
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 15:54:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234187AbhFNP47 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jun 2021 11:56:59 -0400
Received: from mail-eopbgr80084.outbound.protection.outlook.com ([40.107.8.84]:2119
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234074AbhFNP47 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Jun 2021 11:56:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ncpl0YybPmDqMRzWNGjfsUmGzgrAcHPnOpe9NNWh0MTwhufhpwMCracNGM8PzIE5Q6c15kZwzLGQ6dA00VQPYR0mtC3wVIQ2ypmV1ThmdT0gdd/fdj6TjtGKDI5yCBGZ4ySxduT38h11I+GiVY2/uHrX5S3kWHqYntTrNHnjuCvtGpbZ321BIKJ1aGGf0iT2EEkvmhkBQCM2b2n7qfSKakBcYPm92eVIiwGxPMc1McvpbrshqgWgwg0/dclGp8DbNv8fMrL1DkhKreUcJjWXrM1CcCFH1WUBuSmLxY6PBv6tRoeeQd4I6QZ2SwEYIF/+K9SZTtdTaRfLn1LsepMUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Go9MMG9Q3fL9sx37+qyndOzWVGlCUhKvlBJXZ5GBrI=;
 b=do5STezeWnliA8HukTJhOrfkPIauy7WcQjbkfLbuEsxp0SNy8POkkd6ZZo7cXsnR7HJOvYa5RfZDQisgSmilS4+2u5DeaMNwicuMPO0amaBUgDFsxfITYuUC4rVlvITJX9oSUYpTpL/nHTatRkke6E3WiRWLHtyb3hYLBMVKigQ/03/ByK8t8ZP7bFY+MJYxQFfvGXrnOc//uLT4VwRnnhBvYgzX/GAqca7fhxLDOmf+Vhsr8ip9N6NrBZfFnqdKUmV6ZMSEKEZjEU8bmWpeU4YfK474Oe12KZ2MGPTjZ9YOB9rhzsNVDIto7TFdaPDNQulZlveE4/N236lXSKuNCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Go9MMG9Q3fL9sx37+qyndOzWVGlCUhKvlBJXZ5GBrI=;
 b=Hgb1Ddkg2sqhERb12CU+qh4VAylPKvHsBaTTIxVj3ZEMrbeA0tM3H+8FzyV5ERRoOhMx3WE3BsGNECM7K1LjLtmNNU7416GtA0lKKZR/77U/Rpam73PH5D0Gu9YDcxZu1A8DuopY+uRRcE++AVbVs1qx/CWp2oaPLkQIsLbQ4Mo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB8PR03MB6201.eurprd03.prod.outlook.com (2603:10a6:10:13f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 15:54:53 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 15:54:53 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v2 2/2] clk: vc5: Add properties for configuring SD/OE behavior
Date:   Mon, 14 Jun 2021 11:54:37 -0400
Message-Id: <20210614155437.3979771-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614155437.3979771-1-sean.anderson@seco.com>
References: <20210614155437.3979771-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: BL1PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::17) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by BL1PR13CA0102.namprd13.prod.outlook.com (2603:10b6:208:2b9::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend Transport; Mon, 14 Jun 2021 15:54:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3646ccd-5c3e-402d-679e-08d92f4cbfe8
X-MS-TrafficTypeDiagnostic: DB8PR03MB6201:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR03MB6201AAC3CAB85B738533CCC096319@DB8PR03MB6201.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g+gJmYkmXdwl4jG1hZBU0pKm4UBFWgNVaDvGx3IZJPER96K60x3pv4es4fkD3eEIp4PvNoSklisATtGSRh6uqAF4CYc2MDucKtiQtrU1g85XPzR+/QwfwHEmHenmmaBK0rAWVktiHBVAo5KhmraTB5/FSGYfwpte4KdTQ1euPTM7EhZY2/zdO4XHQ9QbMtj1Q1fGUh4AzzI/KZ5W9xcZY0wWQITnM+4kpVKEJGHiBBsZKbx1jNafWs2ZKVDvGwBZIC3SLSzZMK1KNKbvWg2vrqbg9014tlA4lwW3bi7aP9r91zJaF4mh/ncnhvkUQXVBi+H4DvumMAXwR8OaSrBM8+2ipfKFtxOO0+iltBVlmgPLqbJzrLDTQ3gH2zpGPheVonwuQqmX0YtVA1dRivtUecojoY4YTCJAs9HLFF8qEXCXfeLXysUzDBAKee6EoloOsd/bgLIC7PJSO1PwwmdbbQxoXOJevf1Y849ah8ezS0sJkRblKEgAaZmJGbLXgrNMw2o/j8D+8gFQQMSDCegg9vraQ8NJmp0S6CqGHtlWyUv5zyi5i+o0DPUiHlKOUe56Ml2JcGc9Sl/ejPo+4jlLUeIXaoTBpxcicCOB2toAbNQA/d3VvcwyscCR7pAaWY8q+PkbqqIuqQXJB1sr1bTulg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(498600001)(4326008)(83380400001)(36756003)(6916009)(6512007)(6486002)(956004)(44832011)(2616005)(8676002)(107886003)(8936002)(2906002)(186003)(38100700002)(52116002)(6506007)(5660300002)(1076003)(54906003)(6666004)(86362001)(38350700002)(16526019)(26005)(66476007)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FqHC0+vwRp/28pLKAKTTkwXsc0I6DPQ36BSHmWGeJInPpw9BlB9gWQ0kcXmY?=
 =?us-ascii?Q?lH8R+pwycJU6gA6iKiLpIqLpoeEOTCV3LeaHZN6nUrxx2wrtcd7CSBssxUyX?=
 =?us-ascii?Q?t+JwNG3Qb+8QIICcDTE1hNLErZCp3t03D6nYwFNG7bQ+0hy6z+6XApscRceX?=
 =?us-ascii?Q?yisIC2RG8QaPOak80OFacFGc0Qs0r2/HpClsc1STBV9s/xpfp/8dGTxvo8vC?=
 =?us-ascii?Q?08lVJC2DMehlUpPYcR/R2IXWZLqq2CCNNvRcBHSZ8zzTPB1ASJQwB6REElmi?=
 =?us-ascii?Q?yOHSU4EtybSOcubrFmofUmy+6NONwCshSPvt8F0B8Pc+G926PWylQh9jiHTC?=
 =?us-ascii?Q?QRfMQc+cYGSwo9vPrp+DwfJxbyLxbOh8EcDar6mZPhh+Cn+3cBNdJeCHecW4?=
 =?us-ascii?Q?j4RPncwZ8Diu3KosiR6HCZ1P2ckqJKSkV1hYvqLRr4CWi2mSstQYem9+Wjhq?=
 =?us-ascii?Q?6h306stHI9yZ8AvoR5vTLNHtmMDd/8TKC/4gwAGhhjRZIvh4WcOuucO2/F+X?=
 =?us-ascii?Q?RhzhqhpwYzfUS5liC0UB5VbOoQhL5oYk7N+zQgw6xeJQKqAzzYmOi5ArU3Tb?=
 =?us-ascii?Q?01BpS7M3ZjTxQhExSFZor1rAXLO7QBtJ2breR8urzwxn17uj4/EOiAajypNc?=
 =?us-ascii?Q?i8MqQDsc5CzFgaV4YVoLYq/UMOBPOzlBPaukkG75B+K50NVfTURZ2poBls58?=
 =?us-ascii?Q?v7xwlWl9ZqaQ0wKSxgIWauLJjeuf3bQjEtAlzJLj6mOcPH+HOGhW9Tx3j1B8?=
 =?us-ascii?Q?ETEl/HQBlWFpba9BlDm0wFwAsCOayjDbVCXwnDpHwXCN2qpaDUSqQJyq0o9f?=
 =?us-ascii?Q?DFGI51Wsvu2/PrUabKNbj9RrEZ8B0zvxUJr4XFuf400pii+7p91z6Xo0BLKe?=
 =?us-ascii?Q?YI3rZRYaYmBtPIzsijidqmtlAHSHVi/YwBfKybWUiNngc9kZMuMi84uK/kHf?=
 =?us-ascii?Q?VGWT6DCiGBdxN/LLiaq2vGF2VO4wGaqAWKHjz7n/s+ERvZkceAsszkDIPZ0S?=
 =?us-ascii?Q?8QzSvmrGRzDM5nyJT1kgrva/60qWG4uEFM4raMrFnuu44T2NWrlwNdtrUk/r?=
 =?us-ascii?Q?b+i7WEB7MnRCcpqoDWAG945u6c7guIqdY/x5FGd2UxHN9kfu6TLO/Hj4MvWZ?=
 =?us-ascii?Q?g7ch0nSaUGCGtKcvfOukFTCSctqdGzvTnYVv/vnpXrAbxWnAzF9VBDuRLPD+?=
 =?us-ascii?Q?vGsIow2L3B97HlOb7yLo+3dLTaauWUCZcaunXnb4R6g+RE7ggnrS3uHfNmgx?=
 =?us-ascii?Q?ouftvTagvTpNtto8C/q/pyb9laJFXSgTkKamTvZ7dHjh37rBOwgsKdlOfH4P?=
 =?us-ascii?Q?laL1EtweieZcrQ9yafyGHg/f?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3646ccd-5c3e-402d-679e-08d92f4cbfe8
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 15:54:53.5733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsJkgYr1SATb343K7Lr5CtyLtEqvYs4zKKBn3ON+N0yb3hyfF6bjdxZEoXV3sB5I7ZKXJfuWb8OmTqzXaUdr0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6201
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SD/OE pin may be configured to enable output when high or low, and
to shutdown the device when high. This behavior is controller by the SH
and SP bits of the Primary Source and Shutdown Register (and to a lesser
extent the OS and OE bits). By default, both bits are 0, but they may
need to be configured differently, depending on the external circuitry
controlling the SD/OE pin.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v2:
- Set SH as well as SP

 drivers/clk/clk-versaclock5.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 344cd6c61188..09a96d34bac7 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -886,6 +886,7 @@ static const struct of_device_id clk_vc5_of_match[];
 
 static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
+	bool oe_polarity, sd_enable;
 	struct vc5_driver_data *vc5;
 	struct clk_init_data init;
 	const char *parent_names[2];
@@ -914,6 +915,15 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return PTR_ERR(vc5->regmap);
 	}
 
+	oe_polarity = of_property_read_bool(client->dev.of_node,
+					    "idt,output-enable-active-high");
+	sd_enable = of_property_read_bool(client->dev.of_node,
+					  "idt,enable-shutdown");
+	regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN,
+			   VC5_PRIM_SRC_SHDN_SP | VC5_PRIM_SRC_SHDN_EN_GBL_SHDN,
+			   (oe_polarity ? VC5_PRIM_SRC_SHDN_SP : 0)
+			   | (sd_enable ? VC5_PRIM_SRC_SHDN_EN_GBL_SHDN : 0));
+
 	/* Register clock input mux */
 	memset(&init, 0, sizeof(init));
 
-- 
2.25.1

