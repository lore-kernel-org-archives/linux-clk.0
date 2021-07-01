Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984A6C11F67
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 18:20:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 839A46141F
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 18:20:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234026AbhGASXE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jul 2021 14:23:04 -0400
Received: from mail-eopbgr50044.outbound.protection.outlook.com ([40.107.5.44]:36422
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234013AbhGASXD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 1 Jul 2021 14:23:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsN0grxf0czI48T83ydl6E//r2PqmWujQMMNL+8azFlHSPD/5koourObFCcshaekh1M4nbBgTk6gGXI1coq+Gc74MXDc+I4MwLjcgC2N7TJcj07KAfgjuaGzNkV8xgV2+Ek/yN26ip/ytcWE8PJxcBLsvNEsG3zUabADcoW/OhbIYx+DjPd26dH5enr9yCnedx2tSqGGWA2kgpdhLwA/Flc5AKP8I1LaKzCFxkp5qR45RVYjt/aJm9CUJ7aGtI4kdMxDR845LTI6bVm68LEGT7hyZUcnqCXWZ+M44JjRSFYTqwkKi2N2aVv3hUBe1lhH/3eawLIDHf8CUStgqT9TZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoQj6GgYHYKaxdpi7eqrNAi/E6Qvynqb6Iursx5froY=;
 b=M60DBEdS1/F6PsHJ+mEWFzauIHHrnoHJ/W3fjFej8KxFii9y0cGRYz/g3B0UduiRk1jYKqtkVn0k47HjLm/vg9OGsmFnT7fbYfp30wUaaSfPpm4hdSFDfLsbIIeGAT4E7dtHQtpfJsfcQjVxIhjWH87WVytRrnP/0SoytLjVfG2BGic/cZRK1itOotX4RoCTJIfpZ/q47Iyk62iUMS3WktkjMUxk4dzziHU/HUpvjdNAak1d+ouuUJu6VQ0aaY0+tKWlh7IuJpYwXI56Di7t8gbmpoyiJxdzTrTJYfWxJz5UOetYvaXp4xPLcv6P1y8CiNHpjAu0Uma/8cKWFFlVTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoQj6GgYHYKaxdpi7eqrNAi/E6Qvynqb6Iursx5froY=;
 b=ga0zCjwaTvBOobYajl2bTY6al0dzZObWQn1pWEftRoPRzIcxt9HEI6QFhzMI9Kgp2KFHUr0+U/4CYgLn5xPrM0B3pmeMa4x637P4Cnejd1k4kgEQQZFWd5EVhccEzwPYYpPrISWfk5Fv6GwA885HZTOi5SdNaT6vBD+YTF6GyUA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB7PR03MB4618.eurprd03.prod.outlook.com (2603:10a6:10:18::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 18:20:29 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 18:20:29 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v4 2/3] clk: vc5: Use dev_err_probe
Date:   Thu,  1 Jul 2021 14:20:11 -0400
Message-Id: <20210701182012.3421679-2-sean.anderson@seco.com>
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
Received: from plantagenet.inhand.com (50.195.82.171) by MN2PR11CA0018.namprd11.prod.outlook.com (2603:10b6:208:23b::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend Transport; Thu, 1 Jul 2021 18:20:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a25229e-ac1d-4406-2985-08d93cbce815
X-MS-TrafficTypeDiagnostic: DB7PR03MB4618:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR03MB46184664FD22FAC2B7259DF196009@DB7PR03MB4618.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:293;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XKZgr2Qv9MvojaXVi1gYfHdE4K682PPJYr8OE3i1J5xtuzCNF+/ttuHIWcLmxZ9KyREP3KjQ4K0m362GcZ8MNlIKvSsqplt8WztCkmf/11VX/sUyhygsBj+HjoHrpy3jn7CsRIZndwlENWD/6cgvEzw+bM0vgbIyS/9b6Q8b2GHg0PeMxsqDSS6aEy1UTL5lE+LD4MH0eu5Hx5l4uMM+FPhRscEXHAtvNGR7XSXp1BroUodiT+t3ViIqDfAucoah26lU0uoeeRLFXDDhCST7w8wyFoLRX5yhMYj0EuPn2nVi1UaA29M+6TNqK4zuxlJPYmISWVn14phOeAu/r7P8XIGM9Eh8YlypEFPbmMEEVHWqR3ERCNbGyUzeCEh/N3ZteIk5EUQr2Yl23z8jcrL99Lbm5gmYT/Hpzn1yB+ctrX2ebG/pYKLfzYLH1z2yVjq5MtrYq5HVrUnJwk2261hV1TM/L+F6hO1dALYQmNFDjMxBE0RWiNSEiGfYOoNkz41LyddVaesGd096mKFRsdGZBbK6qOsJ4Q4PB8dI5VO+cQha96ZlmbUGLun3fcQKELvCsSXPOWnZuelknCeCg8eMODItF4Cca3qRLyvMb6O+5T2BVYW8uw1Lk/LPc3NAUiyx6NDFYqYSOZrsaNrWifutuGA/c7UHgJ3zJawmd+tqhbTUL1ykLsmtf9FKP6hw3bfyKj4t62gZ/FBAkAyqVYfVuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39840400004)(136003)(366004)(396003)(376002)(54906003)(6486002)(6666004)(316002)(8676002)(66556008)(38350700002)(83380400001)(956004)(6506007)(66476007)(186003)(26005)(66946007)(16526019)(2616005)(478600001)(38100700002)(4326008)(86362001)(2906002)(8936002)(1076003)(6916009)(5660300002)(6512007)(44832011)(52116002)(36756003)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bdn4to/2o7Yy32jWiYwbLprLb/K6zUivU1eT5sQ9oGmZhuON0hBBpDn959C7?=
 =?us-ascii?Q?UZB+MJIeOzL4cLf7uD6lyGFG1aJG1dsRuTckCpLAkE5X0j4C3tSCSCVbVrQu?=
 =?us-ascii?Q?FfgAPDiktqhIp7RuiKa9EjWXThksLaWRhmFkgmbsOTNWuxsbZWCM2brxWB+w?=
 =?us-ascii?Q?1It87MlR+ezPno0GtgYPUq8VfFK9oRT7uhEoCWPEId809Lkhe6uzWMSRBpRs?=
 =?us-ascii?Q?UXar+/OVGzuvevoGufCE5qfWvBPoBCC6O88suKfnJlr7Vq7TVOEXQ58+vVQ8?=
 =?us-ascii?Q?COM1sIsh0KqwIoUR/u2wOttbvsrwgZKuwBEbMt15r2J4F99J16BzRStcP7pe?=
 =?us-ascii?Q?X57r991F54PERp2wX5Xab9dxaJieghUwu+CiEYT8kf1BSYryYRZQjlTf1Q8Q?=
 =?us-ascii?Q?VDN+EsctNizZ8aT25jBl/0I/sNj250edsQrk69TDbYp9SWC7eZsC+MWlZhxa?=
 =?us-ascii?Q?kFTG9c4IVTf6QexiOpRIMTDiQmFtprEqMW8MBU99NII/pHtLYPEXAAS2Qqjh?=
 =?us-ascii?Q?T2CMF1s4sfO0uSwlXnrijpNR8SQbZddf7rh2zoxQEBeYlQQ8vz4OChJS/Uoq?=
 =?us-ascii?Q?pzHsOS3eXz1q+7biWrKqUIjkFvh9Q59eHiipgmQDVVpXccPd8kj7VLyrTGGX?=
 =?us-ascii?Q?lmkaVtk5oLLf7tcWWisCm4JKk7vf1Cqvef+gw+2MV03TgQtPvdHmI3wNEn58?=
 =?us-ascii?Q?0G3TOwkmbEMQ55Ja6hxcZZC9B5rcOEzImcNyp2eSSPrnLucL1aVq1vzRkwpe?=
 =?us-ascii?Q?YHZ4lsnRbQWayK2UuNmBASOdZzuaXGw6IZdaC0SwID8RcVzs8iQc+gZQrKmP?=
 =?us-ascii?Q?kpCYPZo47E+CtA2Ewmiq+AQu6eeVq/NvkI0G+wMh+8vH4Qep/lbMYgo2tMi9?=
 =?us-ascii?Q?+oRYllsB7ZkhDt46VuCPvc2j77e0tJgWYMFiNYeDFsx78PthKqIf2iCYHYmF?=
 =?us-ascii?Q?uNJqBvkQ4LVpR5XryfghiDNgx2PYtLFqWq4n2fLHNvFBBFKVYtwBqfXeiZmD?=
 =?us-ascii?Q?ztYetyabQErjP0PRwkST+OgegJF0Nb+kY9aEY982AnjeOVVqGdIoeLypXNvX?=
 =?us-ascii?Q?2/W1OWYm2prJkOgzpSjLTtIopzTIjKpwaeBJbzeqnE+E/ALQh6aPfKbLFopH?=
 =?us-ascii?Q?Lr6maY2gWi2XxFlIoNVYc/zmiDrLG4rJ1UtzIR6gNi89KlH3EzzLvjInh5gi?=
 =?us-ascii?Q?GX2nDhspoTkRrGDKsRlYqLO8XCp3U6/Cva+6Cp+pD7tECBAFwC/RFWQrsMZS?=
 =?us-ascii?Q?fe82gPMGt85O7uuIOK2nKTwuamraJPW/KK+hLe+h82qDtw4ullKa9fHqojI0?=
 =?us-ascii?Q?zBFZiflNTVGuuiveT1/Wf+Mx?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a25229e-ac1d-4406-2985-08d93cbce815
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 18:20:29.6394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEacw/gOTbtdyol+QVMO1sF9Bn37m892uEPUNjFiLTdpcv1jpNQMyqfwDDA0eZk5TZJDIQsaBjzlG3JQL+5E6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4618
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert uses of dev_err + return to dev_err_probe.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

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

