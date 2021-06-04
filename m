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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD4CC07E94
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 158AC61411
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhFDJNB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 05:13:01 -0400
Received: from mail-eopbgr140073.outbound.protection.outlook.com ([40.107.14.73]:43744
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229958AbhFDJNB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Jun 2021 05:13:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myQ/+BgIa99MCmGL2iBGd/LbOdpb8KErriwT5045qM89o81nVq0ZoOdgFi2c9L9zJVvrfdQ12MFTD3OCaBXXhzVoA2b4D5eyIuMps/MFUbcJW+vkhnQ2PgdCm/1bHWjqKk7T+3h3p89MLH5coNUsGkQIgYD+EzYyAT7B+5ExKXYiCL8YP7QaXUkYC0M2d+PTttt3UHhfGCBgS/FF3BRkcUG+EYjOT3gqOMn+pRaqENphCc+kA6N9GwAw55JEMBzSqr5I4T7TAJlo9g2XgKuCA/FgwK4tgweP4pwS8NZNM9xcp/MnB76e8IRzfHpxF86/u3WHMFeg/MMLq6cLf/2AFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtuAAg/CMVPHITuYhBC13sb5aLlq+HsI0FPK45jqnMM=;
 b=laRFW0OS9iNvu7BMKhumOtvUehHH4xGm6aTuhFEIJOQpLgMls9vSxmDXi1Cq8czDkzRfPU2xHaDMnJ58lcQ36K2uARhihbT6dc9vKX6udukA4bFjB/Y7Vg84Cl6Nlma66XLm/OmCxtInWZ0O1OfYjByTAWx3Uib2VBgYOQhiaJOS2ty43xA0Cu0tMfanXr77oANqZXxizPziz27CsCra40LKe6kfNYbaDJmUg5wxE6b2/9Gxo29j6U6yePIfNE314Dn/aPuX/pA6iA5KIdgc0u9o/eOd9tpdfZQoYxiA/VkECR7WxWvUDrjNpZSZEdKI6xZeYeFPCa08P+r4W/bQsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtuAAg/CMVPHITuYhBC13sb5aLlq+HsI0FPK45jqnMM=;
 b=k5DBP1n7hxKepEJXWNwCOUd374v5QT3Y32ZzDs08SLFsLh2ztr9+lGiyv/G13FnbddSmiVgQUJBBWmmyjIql+nLsnYDR6Wu7qn+a1mNkwRr16mwLHX3BLXCc9tQtQ3T6KGUNyXooR7UHF/FPRrxlyEzSjFwcq7GYe7LoPL9oFPQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8502.eurprd04.prod.outlook.com (2603:10a6:10:2d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Fri, 4 Jun
 2021 09:11:13 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a%7]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 09:11:13 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        dongas86@gmail.com, shawnguo@kernel.org, kernel@pengutronix.de,
        abel.vesa@nxp.com, Anson Huang <Anson.Huang@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 07/10] clk: imx: scu: Add A72 frequency scaling support
Date:   Fri,  4 Jun 2021 17:09:40 +0800
Message-Id: <20210604090943.3519350-8-aisheng.dong@nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24 via Frontend Transport; Fri, 4 Jun 2021 09:11:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62266db3-c4b0-4ab0-50f9-08d92738b39b
X-MS-TrafficTypeDiagnostic: DU2PR04MB8502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB850254E08450C7FC6A311D40803B9@DU2PR04MB8502.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +c9cy/KBIAfqtpgBESoC0dsOG5Fs0S7xhHP9uui9jVk8laSXAsyjZkITwoPs+M/2EJAQfxIiYdJBNhglsQbOfKvqim9KhCX20j6fr59kYVdQaPddiYoneYRZGNGqjyEDa0bN/m1KEbGYZF7qHKBgZ4/JM9+359RhRqWdqHgCVb/KVb0ywwFP1Oye3n7giry4asIKl2wGv0c/Bro8yqrhm7MjVaWA7n/VMJypbOfNYMqu30Ck03mOWW4iPCIPvoQGknRMMtPwRCySWl0hPDnObuA/NVQQtKSKoWzdsaf2m8jTuaapFYvMSr7SFS8tCrcuJsSE8Lc739PCnQMGtA8+2cqfLey7pAIB16fgOguG95zTaw/6A22aeo0Jko+9Uiyag1Lon4h63vIPKz4M+KGa5IMBYyGLAjRf3vuw1bnhNOjKA5aH+rD3GDSa8H2sHpRgmtqlbsw4e7/nfKci6VnWrPK5LZMtD6OniSbz1uBWYMibnQUmqo9lchMHT75Wbcq9GNQfNgJLCrxFdGOlle/ljnPRS64Z+wwbQQr4kpYRX4jh2DMf39s+17mnPnMk9Yq2NvQoxhFruleOClvxmwJVZUuMO7ToBrjzf0+jYA89FtVv2CBDkeCGy/VJqv/UpbPoG96ylP2BtnTRT1iKNi/gD7f0154UbSE2urH6VWWdwSnWU3m+TRuJWk0Pp2EKNTCX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(52116002)(6916009)(6506007)(478600001)(83380400001)(4326008)(38350700002)(1076003)(5660300002)(6666004)(38100700002)(2906002)(36756003)(16526019)(186003)(26005)(54906003)(316002)(66556008)(66946007)(66476007)(2616005)(956004)(8676002)(86362001)(6512007)(6486002)(8936002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qeMiw//Gqkgm6ofHl7YENrE9kMiR2h+1PzflpPhleMfIrcwwhSIS/W3OfwiY?=
 =?us-ascii?Q?iA3zoQh6jPBAwKjKZ6Hx6W00oqGdyLP71dFWFvp/OaqjR+myJFJz2mICR/IV?=
 =?us-ascii?Q?3+pkL0ei0s/JoopYFBENieFwf2Kk2ZPtd07ppwOKSIuYvrvaJ/V4IpjnesHB?=
 =?us-ascii?Q?/VFtVHPX8A36YHYeBodSUSGVfj55bO7EGbst9niWsKl6L7q96cSpzQtqg0jn?=
 =?us-ascii?Q?KSzdO8u5iJZx7g/KLMkkeq3aZC6bi4HxEkFt2+x9XrupvsW0F2T/qnXVaFLk?=
 =?us-ascii?Q?XBlfirFFi8OlpucZHIkk/STf+Ub2SJ5GoghiNrZW4xWHwwUxvDIIBtdzp86V?=
 =?us-ascii?Q?OIytRssg9UH+RzeAvzF2YUGBxrpqA21SwHDdMEQOn0qVXAVSYYrWcVqGH4Hl?=
 =?us-ascii?Q?oUmzsKLELX+L5L79chCdU/LEn/rB0pMy3+9die/0OFmhH4oW+diIaNwwjCAA?=
 =?us-ascii?Q?HCV3Vve+wdjyxemLy/+hJfXLvyypSre1T1ELWk1PKcuWpAm6Mqu+SIrMquD3?=
 =?us-ascii?Q?Ty6nk9/+C0C0MskifnSsopwAMQKO84a8lwJFl1ClhnGAs/RvZeisPWoNlctc?=
 =?us-ascii?Q?+wR2eH+OT3FJCmXXroDcI+Y8p9hwUuEz6JRtDiC0LUnvn5j3Ux7QGEjZImzA?=
 =?us-ascii?Q?O6xddvVsKn/0Dr8xbaa1RYyI29PUjOk+4WBrh4075Wv3SSjs9iVD9ECyawB+?=
 =?us-ascii?Q?jTduomcEleQgGndlKMjYjzKuEt0yuFyZD56D614HTdZQsQw9EI35zUYT5ffi?=
 =?us-ascii?Q?6Cva/2m/LV2M8tMkVwFmTFZQV1H1iEH6S6APnGvOrbTk+w+5NQLkGxUfwQp8?=
 =?us-ascii?Q?3qLUF7S0uEw5lfpKGUqYzc4yP35Zy2KTJXYTs0ab8LFCUogJT84ahRhPamoP?=
 =?us-ascii?Q?nLGnwTyY7i6mgfG/eVVabNWSv0oVA76zVSeMyMauSKIDQxg/1I/hyOvFqK8v?=
 =?us-ascii?Q?+0U0sFbdUtR33oKk1Bnz4QnAFhfwsrfC+++Bbc+Tyd0tETDM3ByoL/RTjyBt?=
 =?us-ascii?Q?/cOEtLCM6/+5iC2GibAFAk/0RbtDrEIDV2kf3EDQnWnqxICeyyj9IvDOJWQ3?=
 =?us-ascii?Q?uBaDc2q6jMbO4pjw+Od9HbyzKAOg74LdnQMASP0VciY+FdqQ+Vha4Vn/e+aM?=
 =?us-ascii?Q?6hoWi5Qy8OulnNN8ZW71ZzRzJ+kvk/CTscsWyQrFCAuQbYMJU1qGzA7UZrz8?=
 =?us-ascii?Q?oUPQeGQlkOTT79BByN6IgEoF/87Ry8FdTuQ645jjaMvM9TnFKcLqoQolZUEu?=
 =?us-ascii?Q?pklICF5hBPfKuZOEulN/ueS0asCA77KwsYb+uZUcru0N6WLeO7+J1B98X5+u?=
 =?us-ascii?Q?9uz/8h75cZGRVI/Ryll9uGEV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62266db3-c4b0-4ab0-50f9-08d92738b39b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 09:11:13.7206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIiypw4xF9W+P9/wMQu06GN3SizCkQ82kuvm2O1AnD456MiRuXM66SyhiXZE1stpFKh7WmqzMS29YSesNBSGbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8502
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Add A72 clock to support cpufreq on A72 cluster.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-scu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 8b3eb58e6d12..9f7ad3ca1039 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -275,6 +275,8 @@ static int clk_scu_atf_set_cpu_rate(struct clk_hw *hw, unsigned long rate,
 
 	if (clk->rsrc_id == IMX_SC_R_A35 || clk->rsrc_id == IMX_SC_R_A53)
 		cluster_id = 0;
+	else if (clk->rsrc_id == IMX_SC_R_A72)
+		cluster_id = 1;
 	else
 		return -EINVAL;
 
@@ -449,7 +451,7 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 
 	init.name = name;
 	init.ops = &clk_scu_ops;
-	if (rsrc_id == IMX_SC_R_A35 || rsrc_id == IMX_SC_R_A53)
+	if (rsrc_id == IMX_SC_R_A35 || rsrc_id == IMX_SC_R_A53 || rsrc_id == IMX_SC_R_A72)
 		init.ops = &clk_scu_cpu_ops;
 	else if (rsrc_id == IMX_SC_R_PI_0_PLL)
 		init.ops = &clk_scu_pi_ops;
-- 
2.25.1

