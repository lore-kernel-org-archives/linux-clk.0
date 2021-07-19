Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2621CC12002
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:24:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 069B961181
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:24:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbhGSF1r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jul 2021 01:27:47 -0400
Received: from mail-am6eur05on2071.outbound.protection.outlook.com ([40.107.22.71]:29921
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232748AbhGSF1r (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Jul 2021 01:27:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlc1o3apyP5Qt1wNYxAENg/7zQVgofHDEbAQOItOhcVQhV9HSKQR18JW82DjlAf+x1rl314Em6Tl+HuBACQxyPTb6qpCLJl4ALXIFqGQPifUp3c9Atb0h/Q1rrP9iA0OQSz/v9vX/U+9NljRqVajabSOSHUyHxr+7CgNjuMmOP7FkMR5m+YjSAtCXy/JlzcUmyDdy8FfyA8ubwrQiyvGcjFxXxFPi2/oThhJNJHJrvkgzeUPPPIr0pPNlzJmQ5cLYy9rdnok6IQEibTlSPJoP1HdS+niiuwjYi6h6+ABQfVd3mK5YOsAoTnmLjNiTGCee77R77rmdS+44F8S+z7iUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4H2Ar39DWxgvDGBxcLrMn8sHQa7TZ195oM/B1j5L2E=;
 b=OeBjAF6tFYDOu9Vo7aix2wwzKUZIZXxUzG55vA8bnrbgbRSmBN83/B5ZIYsZcpEf05JtnGvT/v1K2MJrBezkU+XlweJd+XQiihAYD3z9D7dPmKQi0WGXSCWq2KkA3RQiBZKFTIrdWxadbO1cVsRZAPsSNeADQjeCie3U4wUFkzthmSu/ohOfGHad2+IxhUUVyCJqj1I7XQRx4qC/8GGDIX//7WzR7zNUYmXGwHnrQ5LFIHdQLMnKf+XfGVNDAyFHrxo5CpGrsnNt9jtvcJ9kaR7+GDrQf/sOBHBEgpthbbPh9nS45yb/lnA/7vQ/anzpUDhw90Jw8h943o65w5U2Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4H2Ar39DWxgvDGBxcLrMn8sHQa7TZ195oM/B1j5L2E=;
 b=TOyFQKVsDKeyVP289grjFs2Q93ZYBAYRrVQpa+rHb48bzXtfxIJO8v5wn/LrSR6kkKk/DSR6Ouqbw6alnM19Dsv48NdULexslpyvggk7/QrnTiCzI+SQVoX2jtH58OqkxFYSsQVhV90/Se9iVkA/sGRGiuyve138yuV1qutQ6Mo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB7PR04MB5244.eurprd04.prod.outlook.com (2603:10a6:10:21::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 05:24:46 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d%9]) with mapi id 15.20.4331.031; Mon, 19 Jul 2021
 05:24:46 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        abel.vesa@nxp.com, s.hauer@pengutronix.de, p.zabel@pengutronix.de
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 5/9] clk: imx: Add 'CLK_SET_RATE_NO_REPARENT' for composite-7ulp
Date:   Mon, 19 Jul 2021 13:34:26 +0800
Message-Id: <20210719053430.1442505-6-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210719053430.1442505-1-ping.bai@nxp.com>
References: <20210719053430.1442505-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0126.apcprd06.prod.outlook.com
 (2603:1096:1:1d::28) To DBBPR04MB7930.eurprd04.prod.outlook.com
 (2603:10a6:10:1ea::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR06CA0126.apcprd06.prod.outlook.com (2603:1096:1:1d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 05:24:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a579cab-8341-4f7c-4ec0-08d94a758563
X-MS-TrafficTypeDiagnostic: DB7PR04MB5244:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB524482374DBE7808DBE84C7C87E19@DB7PR04MB5244.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6DjEfzXdTN895clQHKZ1BMdqzs9ogUTyrPGRf6W6uXIlh4Igivf5OQgMeSXy2/rLga537yDa7KEId4/fZ6Jwf9A79zueZl8HJWhF1v48/YD6lYHUqR5RXBuNa3YUJeZD5z6zn9tR1hs05gChL/EBxR9nxgc3Vs3mlatEnEmr0zHrKr4gO2BiI9mO+bEGJYNobxYjJeRNlhS4P/AcGQwcHPFyV9bUa5C9+uo/aQwncA71MSlTe0f5EuyG1/Qs8OnauAFTHa/BfDMPPBSMGz/8wcJS0xxIA0QkEio7S3eR1jAE2YhvTFc7eG0P4qPiUQ8ZK9Gz+twbEvdXsCGaZqKwdjxwjMA4vfY/NkB5LQf2/kdqsphfH+66pqKnyaPW8DyOrXbB2Lh/I/iifgPVCfJSUPTuuFrPI1r4KhMfIJGXXWyKRT9vAOETqKXa2QflVZaursJSQgK3q1sUmmcTQKOTiNzVo6WGHdtySTkdnDLFi9F91V/vBJF9sx7UlirSk0AWGRl26Wv0k5CuMB4iGzQXGtIMS7dyVrhnW4ow77hVR77C1FA3/TCZXI2MXlK6L5aQhtiQhMMo81BVMsK264wGUOBEUnTBmPKCqngo1KpuDfbqh7XwwZIR5UTk+yxUgIhexaKeWOkKA3J45TpGYddgUaIQ3Uk/qpUglBaNKUZJQxeJyYOZ/IPnALZagSgawfa4tDKtV5MBtprbpPkOSN/ZqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(478600001)(83380400001)(6512007)(38350700002)(38100700002)(6506007)(956004)(36756003)(2906002)(4326008)(1076003)(316002)(5660300002)(2616005)(6486002)(52116002)(86362001)(26005)(66476007)(186003)(66556008)(8676002)(66946007)(8936002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E0ewbPXDWqKn8eBIxOmT3TwUfcxxnamm8UWlI+bPQTkZEZzQsV7xwjQLJkbE?=
 =?us-ascii?Q?0qQzsv/Mva3e6zAiEue68pPqGuEQ/B29kP0VdGkvhvXwdTlygCh84h2Tk8PJ?=
 =?us-ascii?Q?8lCEFMIuDcpUvEUanNd6aBkyKV8ycZafqa58DXFYKAOLrck3h9cP+NUUu+s+?=
 =?us-ascii?Q?t94mbYZdjsN7/+oVvb6uWcJJEZH03Fruto1uzAcbdtvb6vHTzaxxUMZhkELn?=
 =?us-ascii?Q?Q5aVrypFkxZghs8swuAVJVK+JUizDvXaQ7whTvFT2M3XynU3/t0c7Hu/JVJi?=
 =?us-ascii?Q?BytVyTwoRH5eAcRNTjZK4MFsOJeLiv1NFFeKAo6lwVlBXW70P9Ie1osCzGVR?=
 =?us-ascii?Q?W1VtDGttRQ4/hUqFHOusK2EcR1+snfmDbKVxFJ1k7GUbP0tBZYNNZNXyBSD4?=
 =?us-ascii?Q?Ni8wQICP4KCln5nsEo6LYVQ10llRMWFlFc97c/MUdhhobGuLPHNVNQumLC8C?=
 =?us-ascii?Q?9KvIr2Q8r9VyH72kxa2RA5zNDfwF4B5h4AVO4heD1zTBiqweWnBECH+8IQwB?=
 =?us-ascii?Q?rGguqfa5h4aBQ8MR4GrhT6uUGesQwLuu1ibLze60QuMg4Qzjju3Pw0mUsT/l?=
 =?us-ascii?Q?vFMxVPAWAP/zG9iP9XQg+RnlwghzBWmlV95RXuRPx35STYJFGziDjhUMi+5v?=
 =?us-ascii?Q?1KF9+z+eedvtYp8cKpsXqHRocjG+ZhLXZM/2SYahJYoZuTBIg+StED50T8ww?=
 =?us-ascii?Q?UNU0yDeIRiiekh0LBPVKUPYde1SfopstB0O2rRjgB3ONNc5Yr09W9xFyjtAh?=
 =?us-ascii?Q?WmZrN4W5J3MfPwrLx4ZGgJhnBg751An8gFJxPydoH+qEy9o7hLwqiYFWFQNK?=
 =?us-ascii?Q?zwcyVIaj8RiC7HcGLCVnlwON2AYjzD785FzFip7/KZUtdubq5swH6vjJ9M86?=
 =?us-ascii?Q?q1HXTsxs8E/jm3wpmGra1qQOJ6Agw4oblMpsLilVUq0P0LqTJGYGSfhOzbVP?=
 =?us-ascii?Q?lGEM28damKf12aR7HR9aS2o7bA49B9ULYG0oV7q3LrmHT9oj5mgFH1AHg8TE?=
 =?us-ascii?Q?47U0MEoyqB2jBfI2Z8qcmycCmjXx0UF8GEpi9TCloMXq7VWjTJSGnwGW0ZKI?=
 =?us-ascii?Q?iOeQde6/ogCnPdI+Z/gfqitD+awv436XYduxsH15aEQQvPfJpqciAr7xznbj?=
 =?us-ascii?Q?UjkKkExCqsEcp3w8LlcLzh1FbwJdqG7H1X8Wbm5+6otvshb2jHdInkJEBsr7?=
 =?us-ascii?Q?raIPL8/M8uwdzxShh0Z5o/lGOgwUKed6Z+FoHF125h/EqC1DbUVuXjk+RrSS?=
 =?us-ascii?Q?gPBjL4eK/2ybzzQQiiUJBgj/u8T2+Sem60FJy0pVG9Tbr4s2nfddGV7tWny8?=
 =?us-ascii?Q?Ym/NxJibOMe9vZIqyDwCfe+8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a579cab-8341-4f7c-4ec0-08d94a758563
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 05:24:46.2109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/fMd6SEFCKmNI9GgB5I/4tgDSDOPbYfV99YZ1oySuu5V3h4Vz6RjwAhVPIfZqhVEubtn6Gz6badnYxTZ6nfJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5244
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

For the imx_composite-7ulp clock type, The clock parent should
be changed explicitly by end user of this clock, if the the
'CLK_SET_RATE_NO_REPARENT' flag is not set, when user want to
set a clock frequency that can NOT get from HW accurately, then
the clock's parent will be switch to another clock parent sometimes.
This is NOT what we expected and introduced some additional debug
effort, so add the 'CLK_SET_RATE_NO_REPARENT' to avoid such unexpected
result.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-composite-7ulp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-composite-7ulp.c b/drivers/clk/imx/clk-composite-7ulp.c
index ba48445a0007..99a36a73dcb5 100644
--- a/drivers/clk/imx/clk-composite-7ulp.c
+++ b/drivers/clk/imx/clk-composite-7ulp.c
@@ -130,7 +130,7 @@ static struct clk_hw *imx_ulp_clk_hw_composite(const char *name,
 				       mux_hw, &clk_mux_ops, fd_hw,
 				       &clk_fractional_divider_ops, gate_hw,
 				       has_swrst ? &pcc_gate_ops : &clk_gate_ops, CLK_SET_RATE_GATE |
-				       CLK_SET_PARENT_GATE);
+				       CLK_SET_PARENT_GATE | CLK_SET_RATE_NO_REPARENT);
 	if (IS_ERR(hw)) {
 		kfree(mux);
 		kfree(fd);
-- 
2.26.2

