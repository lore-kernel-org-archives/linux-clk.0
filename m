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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28D2C07E94
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D98E6140F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbhFDJNF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 05:13:05 -0400
Received: from mail-eopbgr140057.outbound.protection.outlook.com ([40.107.14.57]:38195
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229958AbhFDJNE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Jun 2021 05:13:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsRcmqJtsu6JXMWqo16B48lmkQY75i1HRhW5bry8Jitdy6cetGbFfeBkS2N0J6Oxj2R/FPEfK+ZNnRJugB2m80yBfwxQsblxrcBF6iwdDW3KbRaIj5bTVZ78mX2cvP78Nb+V85bq2gnTAE6ww0EESC+DZNaz7zQm5vJ0n9KJEgz9TczE1mRJhSX3uPA/gXRJilP9WGQ5+NvdPWU4VqbcPymq6yL/XwY4oMXvKh5QQJpTWgcadh2cNcGxGtaSVfSsqkBDCsE5ZwWwu+XoEUyGh6hLxnzP2NrKZ6pbXB216JP3b61x0YhKUEOKWgBPUxP7laFsmIHTMeF9WjPe8gzc0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZeKe9SUPw+1Rsjs59RYc8qpF12DC6pQ667UA6z0d1Y=;
 b=kB5a9yI3EPerXNpNdz+G6AIENu6SL/OO75x+5MRcF0Pja76zakskjxUV38jAUcnEPCPvCBE0OqBHxpLycWnI7syd1yDZEBgDSApA4UPQUwvxH0dzKTfGYcWvndxYq1EaFL+1iZ9OfYzzGsc9vm9/1aPDagzpZTiO/W4IpNIjKSwqo52PakrI1YhJemHSw6YSGPQRmBLVujaN2DKIflRYJHzwgrWYalBvaTQjRa2sB5FHLbAFO869EJIlBwqFn+UH9w8jo4OIP/WYR33ol3JfaO2J9B99QxKM+dn+Kkq3DyZbInGQlEf582l6JqmjcpJjedxskEg9kr/4OmKYbbMlVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZeKe9SUPw+1Rsjs59RYc8qpF12DC6pQ667UA6z0d1Y=;
 b=Rx+5r24K7ZmKm21B5hc6Xhgf2YKlfCEj2uplGBHWOjubcNcmb6ZoRD9f1Dr9nHRVLxfp7ptPwp5Eo22eigzRk7NRmxNTJuYzYIz8Br4sgv5J2CMfxLAPc0uJrTiPAtvuEFnavaq8kJbUWsQlTrWxtpaHqXA9BkhL3//cVHAgkxg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8502.eurprd04.prod.outlook.com (2603:10a6:10:2d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Fri, 4 Jun
 2021 09:11:17 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a%7]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 09:11:17 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        dongas86@gmail.com, shawnguo@kernel.org, kernel@pengutronix.de,
        abel.vesa@nxp.com, Anson Huang <Anson.Huang@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 08/10] clk: imx: scu: Only save DC SS clock using non-cached clock rate
Date:   Fri,  4 Jun 2021 17:09:41 +0800
Message-Id: <20210604090943.3519350-9-aisheng.dong@nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24 via Frontend Transport; Fri, 4 Jun 2021 09:11:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a2fbd23-2260-475f-5fcd-08d92738b589
X-MS-TrafficTypeDiagnostic: DU2PR04MB8502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8502154D9395FB99DA3D3BA3803B9@DU2PR04MB8502.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WZkn+rEHNKuRLv2x3Fxym3qM3SLIygDzQwCBcw8gG3k4Bg8aTFZ6AtT0UTgukmQgdQx46a94EADKOS6PXi/tA0+5PkTrxnABdhaz+fpRvF4bXzvR84kRzI+mKStAG7kMjxB65WI59klY0W2jpz5pDuhmufMSMNCDqPTcWPXMEqgwtllZ9HEAcuGDeZVoi2/ljpdPIJ+h5D8tTi29F+VSBdpn/igB+yAWl/A5Q76lASJlidLKg4btIk2zul1TmR9dRT68wf8dI/zrVDR1YOpVL8d3JSN+Dwt6ZwJ5Sa2OHX1ZxlMJHJctqRBZDeIvYAPd0r2FF0TCaWjuPAS4qINwm2/MuMftV2faQRuW1syV9MLre+7QwKNKxFOuzwgx1Mg8LRy7Si7gH8a/I9h8bq8v400kQzkdFLRQKzUWrcQ+lHOii60tQfso9aconQSi7z/EPxjmfWO2vu2GlnrMuoz+UIuosalYyvpHEV+PDhhs/VV5UBAS5Cc/AdBaKrBh1C+r1bWV4HM6C2jiJERiw+CvsieofuAzQPiAqQ6rCd+Gz3TXLN1iTdUgb7cATDVE3mD9DdzBrYnTQ5ez4tFfQY0C/wqmv0Y5CxGjaNQZ5Jlk72viDkq5GaaaoyPd0hCRdxfSVedo3u1ITq4XAl5norQzC4DrWWRHRFvPICJWJfwWR/NGFo6tRvk3WS8VgZuOv8Yp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(52116002)(6916009)(6506007)(478600001)(83380400001)(4326008)(38350700002)(1076003)(5660300002)(6666004)(38100700002)(2906002)(36756003)(16526019)(186003)(26005)(54906003)(316002)(66556008)(66946007)(66476007)(2616005)(956004)(8676002)(86362001)(6512007)(6486002)(8936002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UAGBj97DJHzqfKmBwDEANcODAqbdmwW2xt63SUe4MwcM7lcAMA1wUZcOB9F8?=
 =?us-ascii?Q?UWnTUwSiH+G0WkbvoVtQ3/XhoSm13BkwnyZu3x4p48FXIyGV4c6RwHb8AWYy?=
 =?us-ascii?Q?OfZdK/Og26JGse9vO9yivlks5+xri/jr1PsaiOGZ5ePsOhOt73aWQ2gFVHa2?=
 =?us-ascii?Q?CAe297WW7LeploNj97yGgq7ecJmDqA/IrFVaamME0woJ6REmH/RWz43GB1UG?=
 =?us-ascii?Q?hmT/7k2SJQbx2SJn7eqzoPifWL/EP5xlCJZ237LXPNf+TgIF0PLDMyGHNg3N?=
 =?us-ascii?Q?PqQesYycaayHrVhwSPpwgIboRQRPnLBCcehpaivB5RZDUXtYX8YCyX+D9QC5?=
 =?us-ascii?Q?r011CiAImvZOktuJ1mD++2MXjMmsXbInWKcVTJphL4BCgHOg3T5ZuvLTy143?=
 =?us-ascii?Q?0dJQ+wOOSaHZhKqc8cxHUDELNKrF4BB/+FKs0kPVDvWBamIxICyGb3PJCe/k?=
 =?us-ascii?Q?K4mucArDMd3usFt9gRS88bp/P3cF33wG2FqaMMhZ33AlM8bMQAlPE4iAVi+S?=
 =?us-ascii?Q?o6h861n4zyiy5lewd9jMWu3GPqhLaf06dbEgIX3+45DoCv5+5wTZLtJp/n4Q?=
 =?us-ascii?Q?rlyLgqKOzb+e5oADXIO/FQB2Yuce7Lk+no4Irtu6kuL8+UPOykt7wVSgIo2r?=
 =?us-ascii?Q?40dyysW/0LA1eY/xX554EVuqVrTAwd28m0fqNl3+f8ahcXWTcceYWRkBFVpf?=
 =?us-ascii?Q?13RDQfhbMTpyjk++qp7amt2qJdhwJiJm3BuhbdFliie46M0WURxs+0bxKVtB?=
 =?us-ascii?Q?C4HVQOeSQN+RL0LppCGrXEjKFsCmmoYWbudlbfxzKGqdCHkeHrew+gxPCLDD?=
 =?us-ascii?Q?GdANsdW4AfFIwTJ8WQHQTkAuDR4tOBlEKjkZAurTBcfTr9sH1VAjIcehcgix?=
 =?us-ascii?Q?/11nb2Jv90b05YAjjsEfP80iHA+JZUOeLBfrMcSlSPhQpJgqVpbL3zI461Qb?=
 =?us-ascii?Q?pe9GZladCsU0yBcbHhZGeUpDwDcDtRcuDXbOmmXwqsk0C6FGT4HrM99+CcYn?=
 =?us-ascii?Q?lMKIKhEPCC9OQPoftU1egtf82I94JaSmJ8c/nVQIiVZ0479pSg7tNmZ8Rh13?=
 =?us-ascii?Q?Yt0zgwhOzF5vrB5sbByM1uRxCh7QMd17BwFxU56m35cut84J9zc0/b8kRLkm?=
 =?us-ascii?Q?Scdc4vD3NByLPqHRgILTYvELVIFuNLLuq/FNpa/Sbw/UXgxI/CimcNDqdD1V?=
 =?us-ascii?Q?h75f9L7h4u52JKI3WUj3ivA4poJZUR01G/3pgPKcshCEHkf1xwrE3Ndj8tK6?=
 =?us-ascii?Q?6+h/tASzcnxhUFdNJrIfOUx2aRltTge23hPiMlSlYeovbZqDIzCRXrQh+rh1?=
 =?us-ascii?Q?xenq8kMXeg035UUz3YkzexB9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2fbd23-2260-475f-5fcd-08d92738b589
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 09:11:17.0142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fo2U/0POpLDwRzbsvQ856VkoaLZsyQJvdxbrjL81InCJ9J17zmAa95WEdaFyaD5Eu42P6tp0wTkcbC68Y5id3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8502
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Display sub-system has special clock settings in SCFW, the
bypassed clock is used instead of PLL in Linux kernel clock
tree, so when saving clock rate, need to save non-cached clock
rate for Display sub-system's bypass clocks, and other clocks
still use the cached clock rate which is with runtime PM ON.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-scu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 9f7ad3ca1039..37919ffc46a2 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -547,7 +547,14 @@ static int __maybe_unused imx_clk_scu_suspend(struct device *dev)
 	    (rsrc_id == IMX_SC_R_A72))
 		return 0;
 
-	clk->rate = clk_hw_get_rate(&clk->hw);
+	/* DC SS needs to handle bypass clock using non-cached clock rate */
+	if (clk->rsrc_id == IMX_SC_R_DC_0_VIDEO0 ||
+		clk->rsrc_id == IMX_SC_R_DC_0_VIDEO1 ||
+		clk->rsrc_id == IMX_SC_R_DC_1_VIDEO0 ||
+		clk->rsrc_id == IMX_SC_R_DC_1_VIDEO1)
+		clk->rate = clk_scu_recalc_rate(&clk->hw, 0);
+	else
+		clk->rate = clk_hw_get_rate(&clk->hw);
 	clk->is_enabled = clk_hw_is_enabled(&clk->hw);
 
 	if (clk->rate)
-- 
2.25.1

