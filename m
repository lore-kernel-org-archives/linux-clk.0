Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBB2C11F6B
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 18:20:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 563E56141F
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 18:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234047AbhGASXG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jul 2021 14:23:06 -0400
Received: from mail-eopbgr50044.outbound.protection.outlook.com ([40.107.5.44]:36422
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233194AbhGASXE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 1 Jul 2021 14:23:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYIFAsndC3iXY3zF/E9OWI5dLcIJamy7jZhOttCDBE40gEAQnPv2o+E3fjLhvbQ0mqjRltrb7E9Ck24j9pJmnr9sqs2PZXqwVzw1HvPr/S0DuH20l+/54FxClHJRu73ch5nFu/YIR7ONuYx4R/eOOAwUFpBwIVcLBrMuBjWTPGIVzvN2J7Tn1p5H5OAC19qKoRLmSVQZRKV9PFd8TMVoskhlU+PIJzr364jdLhr+yhK3FQcA7EjylJuyvtQFnK7lMQAmYLGEIWBLrM1OmyGLg4PPBe6I7r2XiISUulthEPubD7fTWSqpRb+dIqA/J64r6yqCz4djT/Sr19Kosc9P8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oEwWyS8CLlwG6WQj1iOYoHRuw1/79A/XULttDHVhRw=;
 b=RvvcUQC9enklUXhX2TDJRFjPAWJMeacZnpGG+VOugm4nvfYFXKRg84D7Xymvntx2/rrPntKS3HZMRoM4kqLKIpl1z5W1eN7EUjAKGnl++gn2U6QwqE7u74Y8NVIQORzxzR1ljuMzNbGJRQsdnSzPSMLEvXZglFTv5Fhg61Ae5bt7qV2txRuuGKsdEkx7ujLYLqIaukWHCttM2gQ/AcBmo0ovqiN+7b8yveQUEkOudLXh67Z+UCIIlzVUTEmxxhHH8kU69tLJiAOCpb/sH4eJjQ/a0UvgBKhM3Vs16jMNBEz/kWqMWDMb4drN1E/NNFrj12StI5SK1gywH5qGYZDcKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oEwWyS8CLlwG6WQj1iOYoHRuw1/79A/XULttDHVhRw=;
 b=fSVtx/JSF4mbL4aXrV+ZkI8WmD7V9pikCTGGXtUw86ke25+7Po57vaq4z7N+lC9Avsry7U97d/8FXeta9bYRAxc7u0xsDR82z7ZuDJElhIesJILCBrOLEv/JBosqHO5uegxrLRlpgNb5M3hAiZqeZ58/4KE9uPovBD/i666jlGY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB7PR03MB4618.eurprd03.prod.outlook.com (2603:10a6:10:18::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 18:20:31 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 18:20:31 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v4 3/3] clk: vc5: Add properties for configuring SD/OE behavior
Date:   Thu,  1 Jul 2021 14:20:12 -0400
Message-Id: <20210701182012.3421679-3-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701182012.3421679-1-sean.anderson@seco.com>
References: <20210701182012.3421679-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: MN2PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:208:23b::23) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by MN2PR11CA0018.namprd11.prod.outlook.com (2603:10b6:208:23b::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend Transport; Thu, 1 Jul 2021 18:20:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 771cd699-b76c-4a8f-12f8-08d93cbce8df
X-MS-TrafficTypeDiagnostic: DB7PR03MB4618:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR03MB4618F9741295AB2E8D84E32696009@DB7PR03MB4618.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSWEseODVZs7UHFJdBsPaYwJoUj3jEdPwytAXgwht7n5svcmVV2fw0Rnkyjr2RzHKqG4D6eETukd2tANIRqkG/dV/5LRve27Od++jhMkFhZLInO2NEC1AD8Lqu2TGIi8JVOD5QjG30gHGua/MitIRCL+a18yyAeWnd7d8Rd3/nOvP3wOKLgnKtT8iCYe4JzByksus8YkS1nfuKYVmRKxCb0b5x4pbfOWEfDURV8X8oBq6G0vAKtQC5poaeUeJ7kXG1Z+VtM4eyTYQwF5ImSnjscWz/UIo8EZvCpKI0n0B4hnvTooCVjlpmZoGZEOxNt35qsRMpqklF4ChXSlDatj6abcJo8BAsqY0EOHh9TqF+Og9TgehT68mOM6ft5mUz/wwXKI+dOZAWRTOC7HibkPK9D1uu6APcbdBtYTNXgwdTAOjdN53Qyx9lJSJOH1KmrufFjcjy4btS6FJi8JQ0ce/ulfaOpntJ7bpgifhsLQqUNw3QOVlSypJuf7+gANUz/ZlvIqBJ42IjcjifEfBg763k6rJUskwd5V19oYLAfWE0xKNdI79bQSeDH8IKs+9t+NUtZJhfix2bn86a/bWk/PBfBSjFYEu28CZFsHIFR+taWgH7cviPDDwdknMtrZOoertG0RVUJakQZV9bEtk02qUDYj6F8drgCYat4wL0yFlez4B1Qjz6sH+11woc9k5mMRpc5AWdmxEFL5YiK0D5Ts2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39840400004)(136003)(366004)(396003)(376002)(54906003)(6486002)(6666004)(316002)(8676002)(66556008)(38350700002)(83380400001)(956004)(6506007)(66476007)(186003)(26005)(66946007)(16526019)(2616005)(478600001)(38100700002)(4326008)(86362001)(2906002)(8936002)(1076003)(6916009)(5660300002)(6512007)(44832011)(52116002)(36756003)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nZS3VnRviVRP++2TDataZgNHAP5Qt7afTv2OYO2aaZW92GJ2/TnQrtB+Gd/r?=
 =?us-ascii?Q?2CcwdvXIjP0Y6yZjB5z5SjbxE+HvVun+hXfDhDEvDIg6c4U4hGBX3CVjjxm1?=
 =?us-ascii?Q?9Liu/vvYvnkfr0wu5R4npcsZ08y1J7KkxB5Wnx1gNmxL3+31UdHGdZ+QK8QF?=
 =?us-ascii?Q?tal2hguYHHljdFuwbDxT8Zwi9bouAGRwU7MtGLgO5gukuHVi6bV3bkLho+uR?=
 =?us-ascii?Q?RmjqIlPHggD3eM6YItHZMa2iKmKEovuY9TmcZlLoXtVdLRHm22u3SY1pt1QQ?=
 =?us-ascii?Q?neI/IXsayjnD1qJ4HVAoNhYuoMVlCkbvhY/VOBagNEjKCZMf8XLyyLo049DD?=
 =?us-ascii?Q?vGRHDlT4CiOqOBvE7rWAl50k4ddP3sbHiIB2tA/PvCWB/GViVGF0D1nnNEBO?=
 =?us-ascii?Q?tK3aKSz9vPJCF1PrGxf8spAqR9T6aC9J08/oSjI/lO5SzjkqapmnI/m2vbGF?=
 =?us-ascii?Q?QBCWSHxJrzl/xtcVRu/iSN1f+xbLhgHKlWecoPnb+reT/zhBo99ntUTFWVkO?=
 =?us-ascii?Q?yBz/PdNF2afUtU2F4+mYkx9THbHbuowyO2uFdRXXFBCZtvFYQVAv4+Rs5Zzt?=
 =?us-ascii?Q?pVTYKPJ3gQXINZZrA9Aq2W3L6GMKqUzSp07PEbrZi0TzuDt2k9ZAxBZcetWo?=
 =?us-ascii?Q?I8mDH6ryEAj8/aeQ6/ZFxdrek2Sj+T1lgvTThfVoO5NmemMbJPRlXn4A6ZCq?=
 =?us-ascii?Q?YNa/jHgxGZzSq9n1CekVd/uk9JMgSVhfaq1A9NN1uGOs7J+LcCSU9UBTawyJ?=
 =?us-ascii?Q?yb4PtZI6DtAMw6werlkGyPIOUhfw8NRCu5fT06DvRrD5ctL1MM7z9CcGZ64y?=
 =?us-ascii?Q?hoPSd47c5hjUQXxly/4/Or6AorYAFo1fra/k54lRfHJx1WVIp4hpqCHSQTQb?=
 =?us-ascii?Q?d9jWO3RqdxbLGPk791prJtSCjPcdY5cCw8vfL71CBPZ4NM8tnx5SBjrC1V6M?=
 =?us-ascii?Q?NopkuTRf7PYUmfZ1MOVfvt6pz1JkjmLuCkUIPIvrBm+jUl7olJxi7Yqo+qgF?=
 =?us-ascii?Q?CiFysGtK/mt9kBH3/IwDoRIP9KiBn1o4rpLBJx5uCfrWkcWmRMW1REBBGFi1?=
 =?us-ascii?Q?6JCPRTMy8EgbnnMMrrKfr8jXix23trCnLl7mvq+BTXoMxTQHm6t8ei5dZlG+?=
 =?us-ascii?Q?0AECTVuwnWIwA/YP1I3sKE+0AZ1xQIdKsjo6ZgqEs2I3UKfm8CRYNTjNO1hA?=
 =?us-ascii?Q?W1hZoKpnr4MG2jOCuFtFH0vze8irun6G254tOwLF6UdOW+R2fXXJXpLDbRMY?=
 =?us-ascii?Q?/s2MRaqq00/1TUYN1sJlA0gjMwOT/Oxd+2Bmbk3MbIYJnfYdx8iUHpQEdgw6?=
 =?us-ascii?Q?7XdCIyEr76XY4KEhvl3Ktk8X?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 771cd699-b76c-4a8f-12f8-08d93cbce8df
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 18:20:30.9746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KgcLswsbLgjXAcnw7omO/WhdWLK3es1aBzpsLFwHXyYTP25LnxeFBpdEjhICmtuID9YfvMg5+OSHKi7v2Fqvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4618
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

Changes in v4:
- Use dev_err_probe over dev_err
- Put new variables on their own line

Changes in v3:
- Default to not changing SH or SP unless there is a property affecting
  them.

Changes in v2:
- Set SH as well as SP

 drivers/clk/clk-versaclock5.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index bfbb51191c8d..1fab4d7259a7 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -886,6 +886,8 @@ static const struct of_device_id clk_vc5_of_match[];
 
 static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
+	bool oe_high, oe_low, sh_enable, sh_disable;
+	unsigned int sp_mask, sh_mask, sp_val, sh_val;
 	struct vc5_driver_data *vc5;
 	struct clk_init_data init;
 	const char *parent_names[2];
@@ -913,6 +915,25 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
+	sp_mask = (oe_high || oe_low) ? VC5_PRIM_SRC_SHDN_SP : 0;
+	sh_mask = (sh_enable || sh_disable) ? VC5_PRIM_SRC_SHDN_EN_GBL_SHDN : 0;
+	sp_val = oe_high ? VC5_PRIM_SRC_SHDN_SP : 0;
+	sh_val = sh_enable ? VC5_PRIM_SRC_SHDN_EN_GBL_SHDN : 0;
+	regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN, sp_mask | sh_mask,
+			   sp_val | sh_val);
+
 	/* Register clock input mux */
 	memset(&init, 0, sizeof(init));
 
-- 
2.25.1

