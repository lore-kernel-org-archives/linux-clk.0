Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A356C07E94
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51CDF61417
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbhFDJMp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 05:12:45 -0400
Received: from mail-eopbgr60076.outbound.protection.outlook.com ([40.107.6.76]:7918
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229973AbhFDJMp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Jun 2021 05:12:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPl662iipW5HaZLn7Gw4bJimOfJHrOWLCsX3hPDEk2zJIvhFEwebMAMwNfF4zIv3BSDx6XnDhLiEQUOYkZDdHnjeqP/FVVplNyDYbaOgLXK36ym4wz7jf9JQGEq2QdozdHb6j1mU6MJ1QcARc1EDuhyvGz0YpMQ/pWfacCk+FqeYePDNurtwbz814QKxIbBXXaHZDQQD9SHqWB/RXuAusjIKFQDWDnkNzirjPkm4sxJHDRnZT0BKdYwN+vLM1etoUsi+A+QDLZPGX0hEVPcN5Ex47G/gK7r7FXnquYXiw3Ljisu+aQwFz6KMhRIX3HwywxFW+yCtRlxlXm+QaIHn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQ3lvKQfEazHxjeYRd2ZL67Y0XcJzoGs+8Inu0WLdBU=;
 b=bOlXOhykFN3Z5dkO8qK2aV+qm/mAndZpvEr+pvaxL+ZrSxJc0a8ZBgvXXydTEpzfN9JoeAmNXMEfTuCY7KxR5SHL9Ux8zgBm3YekS5gV1mGYq2AWBYu9lpf/7KAzpqrpUEfvOz6BLlkvryt0IPr7cg8FPjr74su4IvyEzoQK4hOorBI++vezwzLwsVlB3QL3uI9Kv4sBct7Iuh4GYQphuzvyM/NWKzyqRAiT8753YbjuE21kRtSQYK6MRBqSA5Sb90/sG9KChbXrI0B0o0UQ52wNwvGyBbiwF/BoLAvCYB3Bvf8q8dS5I8nS78+hKU5Rh8IsgYnUoJPKxpqIO+sgZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQ3lvKQfEazHxjeYRd2ZL67Y0XcJzoGs+8Inu0WLdBU=;
 b=M4DtXo37w0mTJ9pOx3WTVdvkBJNyyOCx8Yk/3RxfVeu0tIozl1lpW6+JBpRvYqVCthp+D5FBiA8dyXpAW8PtmcEbFK2HO8X5LbAx0HTOrKY4d/MX/SCq9IoAP+LLP6bju1sxQQOphnQni0EHSjKkeHI5TuLTKbu3TX2tvlKyi00=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8917.eurprd04.prod.outlook.com (2603:10a6:10:2e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21; Fri, 4 Jun
 2021 09:10:58 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a%7]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 09:10:58 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        dongas86@gmail.com, shawnguo@kernel.org, kernel@pengutronix.de,
        abel.vesa@nxp.com, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 02/10] clk: imx: scu: add parallel port clock ops
Date:   Fri,  4 Jun 2021 17:09:35 +0800
Message-Id: <20210604090943.3519350-3-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604090943.3519350-1-aisheng.dong@nxp.com>
References: <20210604090943.3519350-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20)
 To DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24 via Frontend Transport; Fri, 4 Jun 2021 09:10:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8aa11b81-f53c-4d2d-6a0d-08d92738aa37
X-MS-TrafficTypeDiagnostic: DU2PR04MB8917:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8917653A140AE96D93DFF62C803B9@DU2PR04MB8917.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bxGrt9bRgXwaQxmD3Wag+oMCSNurgwwcHU/bmw7F4schrj3u0Q1Q7GxR3NyEjZOTycJm25IIIFEK5QjPhhBhGff7eGEWtx6WeOgzrmzLw0TEpySAxxGPBrIkf1YHiiYM/opI0iHKGF7kf7C0xJYmjEF3r9IopkUignuxgeTfoGWdpo5orI5YDnN86lSxUB+vDK91CmAsdS4JcZ8SR4F9YoXQMjhd5xJqWwOvTIW3j+euwJYrjNjhqUaahJU1IU23h71MWAaQWHnmP3xcfg3JKj4Ch56niI9rMvGEf7opiBluK88ShU8RDA2YzRF3NfVF7g6JgQb7pKGq2A6yuwmaveCqEcqNNFmwb99uMaMMTEtqX+8VkdB/hnrqIlrBLfMMZsWipG3JdpFe8qatL0aQlOIYItT3bxZLxbKemOAfqqQ3xRbKzxGjss3HQb8dGjyPK3+IPX+zUaeCdHtFNx50eLVKzYh7njm/pUolfKL3tSBcAMvvfCPwIl+pu/UQ9/pWLvgDY7dDHMFCZPT27WNHf63SpUa/ad7LgIB4SHXX8Lj+hSwDGJXUtJHEWGLYcsoxVgmeQG3JwmIx0Jz7I6DWQZhhiS6U3CfGFaHTXMNoJ5fo8BuJWuIW91XbaDq9loKHLIeMHWvSDht6TKfob8DYJDHzfShE0q6OVlu7annacqdbq6dvwflsOhqIVbyx+Xu3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(186003)(16526019)(6506007)(2616005)(26005)(956004)(2906002)(478600001)(66476007)(66556008)(83380400001)(316002)(66946007)(54906003)(86362001)(52116002)(36756003)(1076003)(4326008)(6486002)(5660300002)(8936002)(8676002)(6666004)(38100700002)(6916009)(6512007)(38350700002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?80DV7Ki66zWM84bvAwAj6nIGK7S0eRI55xJMJzJuXtsBn10dyzyRa+kmPjrr?=
 =?us-ascii?Q?JYgdikIoM5Y0At2OI8MKngSbpc85HSguC40w+t8xttDK6NLxkpuV++8hOX0I?=
 =?us-ascii?Q?Awvk3F1tf479kx/UaQV6ziQYsxFf2gVXJD053cK3IkAYqDqSL6nz/Y0nbqL0?=
 =?us-ascii?Q?MgiQFiFyt7/pdNflEsxAi/NSasRrFv7dmFQiYU2bEFZSx/k56iK8DOMQfFvB?=
 =?us-ascii?Q?wimju/D+kKZKTosDxyOi7VBJC4PozYmtwFI/XiSby/4OMZkhRA7HeseDdTEw?=
 =?us-ascii?Q?W/w3Qje5s1KWSpKEbxUut0gOWgahE/D1Fe0GkQ/cjgD2Nz2Eow4dxsMxmxw8?=
 =?us-ascii?Q?hyrKojLbI+KvXpG2SZ8vce1EDeVkQxdBZcCd679nlHp5a6x1XElVz0TeQUs6?=
 =?us-ascii?Q?8rULnic3wm49VSXqy1qrNptbur4bCQFMYFqijkt0UvDmHpX7GqngD5Boaeb8?=
 =?us-ascii?Q?JTAToctsq0acjcINZUUoJY1epkhbnf1S0XRWB9mW+GTDLZ15LoAywJTbkK6Z?=
 =?us-ascii?Q?2LtCKorab7QOaV5oyOjk5RX0Wyti4r3NTafj2Afx3TExmOda5kKT4DlSlhfT?=
 =?us-ascii?Q?M3jpA4Vn1LzB+S16JYD6LOt2slpcrLMSwJLC7bPOVcDdDmdKO2gPQlesSTF3?=
 =?us-ascii?Q?L8UWJSN8PFmomfC7JSwra+Bq7DdMA22z6MiVOyLmyj+6nmGBWw98vVoFEjG4?=
 =?us-ascii?Q?CXlb0jh5NIru/Ntq2k+I6UEWoT+TV9LEyeM6mVaGHn8KZlJEA2f7XFUz0SUt?=
 =?us-ascii?Q?rrabNKgNlolwimn/F/+FKXAdKFcUX1wzhOV+3vDi29eHThAoTRzwptwILxFf?=
 =?us-ascii?Q?o4PnYXrl2XFyfMZ7K9NykMEK1Zyk8VfKt4vQd0v8MX5CP9OGL1SvkvLV9D2+?=
 =?us-ascii?Q?EakVH4RycO0dxOQEh+vcPFde/9oHv0v1AL49Nyha/LhjTilGbpknOfRsmMfX?=
 =?us-ascii?Q?2eo61a1+X9lji+IiPOETlU3c4FwjclygGmYMMrUtzRx36Fi+JUT6Hp2YBOJr?=
 =?us-ascii?Q?792X+xN66tyLbKdlvRDcMP4u52jdFLi6Ucv7OEU5Fl51JVpWvoRe1PRxPErI?=
 =?us-ascii?Q?jXnBUw9fQoNYxcJYqtRKK/ouKKuezMiuh4bvEoORxLBnmVSUP/0bnMYSSXqb?=
 =?us-ascii?Q?GDpn/ycj+UVjbY67yEG3eIViUUZ4C3yQXTuEeL297djDKuMNQvJGna7ArId1?=
 =?us-ascii?Q?NTAaugCIfk5MqCh8JIp7Y+KooMFENFC88jkDF1lJyQLuKUiugrWppeQIa4Ks?=
 =?us-ascii?Q?VDmy5zp021I5ovPKN6QCkw88Uy17hm8jOyWC3Zuao93uThb6XIyXoivvAzlr?=
 =?us-ascii?Q?4Vyj3LPrEo+vfEQzLEGDYeDo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa11b81-f53c-4d2d-6a0d-08d92738aa37
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 09:10:57.9963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bHwYZgO221PpqYXdshwdJ8Rjze2lHU6sLT8LLRxBh27NVVfPAdssbUepwBL6uODtajvJuQxDE1i+gulJD9ciw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8917
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Because digital pll for parallel interface is on by default, and
not provide enable/disable function by scu, so add the related ops
for this kind of clocks.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-scu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index f4efb3b76c86..680b2650fd45 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -425,6 +425,12 @@ static const struct clk_ops clk_scu_cpu_ops = {
 	.unprepare = clk_scu_unprepare,
 };
 
+static const struct clk_ops clk_scu_pi_ops = {
+	.recalc_rate = clk_scu_recalc_rate,
+	.round_rate  = clk_scu_round_rate,
+	.set_rate    = clk_scu_set_rate,
+};
+
 struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 			     const char * const *parents, int num_parents,
 			     u32 rsrc_id, u8 clk_type)
@@ -445,6 +451,8 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 	init.ops = &clk_scu_ops;
 	if (rsrc_id == IMX_SC_R_A35)
 		init.ops = &clk_scu_cpu_ops;
+	else if (rsrc_id == IMX_SC_R_PI_0_PLL)
+		init.ops = &clk_scu_pi_ops;
 	else
 		init.ops = &clk_scu_ops;
 	init.parent_names = parents;
-- 
2.25.1

