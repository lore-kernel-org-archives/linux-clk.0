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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC19C4708F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD61C613F3
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhFDJNK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 05:13:10 -0400
Received: from mail-eopbgr140089.outbound.protection.outlook.com ([40.107.14.89]:30594
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229958AbhFDJNK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Jun 2021 05:13:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0NYk9BgkLHsDpOnXzWVkcFiXrDt9SKImvytSvz4SPONGfci/Glun2xBUehxQAnngqb+1CvIWP0ghcwNZ7FN5rPZGV6KegomuuHE3hoLhFlIzGhdwjwhqRSY6WFH7Znws3IGwXl5yvqc4r0amP467Mo1vrT5EWknh9I318b00k9B2YJ9nTV+F4bnV8mxyleX8lwGn+ZSkLVT74opmv/qY5dCjNOK08qtWUcG6xb+kiRBf+E5876xB1J8d6ReRaSC41fknrFQhIBYhsg87gKTW8MraAktiG9YOJrWAOI4/+XSOhritBEjhj2bt4cuYdhmKfRBjh/l6ulxd9NAoRnYNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=533+t3DmY87tl5FJ9uScdAqQe1mt+tdsTY9yK0+bdzk=;
 b=dm6/K0dcMo0R2pgZWQkErCKDXm1ZrIpXH/6Bsj2TFQ8BDvosfLz2GrR1PqM2hwiTAFVEZ5f23pdGWytc3GHJdRIdMvMRXSaoj3AhYX3mNgPtAdyZGo7mlgFoFIS3RyeKKMDphuSE+57Lnd01lsNjVOKkHt2aYIj+uVXahHRMUpLyXn8H/OLyq7cY4wEoDpS0XX0KcEOhrZcsX6YiOTR5XNOwroIOVe+wMoDRvWvHEplyMEPIxTZJ80gBjJQ+e40GZ8yHvPIkKK6B8tfyhujQ6Qd+ZWunkhAMGGndp9cO+AVPiWtZsC5X5mgO82CgRr2CMuuT6p140181FBooxvs2PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=533+t3DmY87tl5FJ9uScdAqQe1mt+tdsTY9yK0+bdzk=;
 b=BYyLqlvdv7fMfeG+TTBaOKZmlKOTKzi04z1f8xLi/2DEC0c5KODoiE6Jqofnb2WmO1UG0JfoOKU8HvOQiLVaSuY9bjJvE0d0yY6cIRqd6I1knDUnbv/pq+o4Xjo6kPlxkRnXujCtkm+S7uaH/d9aBpbgSXw1H4ZDri5fF+4I1RA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8502.eurprd04.prod.outlook.com (2603:10a6:10:2d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Fri, 4 Jun
 2021 09:11:23 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a%7]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 09:11:23 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        dongas86@gmail.com, shawnguo@kernel.org, kernel@pengutronix.de,
        abel.vesa@nxp.com, Nitin Garg <nitin.garg@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 10/10] clk: imx: scu: Do not enable runtime PM for CPU clks
Date:   Fri,  4 Jun 2021 17:09:43 +0800
Message-Id: <20210604090943.3519350-11-aisheng.dong@nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24 via Frontend Transport; Fri, 4 Jun 2021 09:11:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 528c5fef-7320-4d06-2a81-08d92738b93c
X-MS-TrafficTypeDiagnostic: DU2PR04MB8502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB85021E2B445388D7AB5772B0803B9@DU2PR04MB8502.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /HdzoCzly5SQNaDswxR8E7SEGKQ6LAyzUHYSaENd1+asSdcrPs5zbjD2a52l821o09kCcd7bRmn9SSwywlIwPePEWhGNDXmb2jWGeYBtM8yshhHeoAZISTso3hvK3iEFLGp611suPb9IAeo5zfDlyKxQZNzdCAm/k9Wh1wo6QoYtzgVWV6e6v8140zYjoPjA6BUm8F0F7/mUWhd9iIADUOQbKVSsrIRyZckX0Qj8haH6K1/VfWL1b8WgnbIYtyR3FKSX2d45xp9SUFwGt5HJMLZIGEeh8PfrWIkCrBJILYGPhwGgYQjlHMrGnl/x2SsQq+qbY4roFHWIWhawERpYEYIC0OIj8ph9CFu1E4DLpHpHhUVBlG+Lld2n+Mpbx8TBv1YA9PsKnU12oaPy70Jqj9DQuLbgeW67KSvHAykAYKERKX+J2fAH5ehlufPc12yKHOOLrvTazuM7UtF+dtVNRAaewIYNKipl29DO+DMT+m1uZdr91FT2YkuONZQ+8tcoHk2DLK1Bxom8fkJ70Zax6Ldra94pnD7uizhLdfgYRpONzJ6Qfp4WL69Jko6nQhxSTyLqVZLtYAoe1nKZ2lxy7AFE2wtf6zLd6WUfoujMg/euQoVebTIFJccC50MtMQvq58DgezZqycLtSEKN1lFFSiJjg3EU+86j0GwJIQH2apJgn0TOkstBQ2ameqWL7Drb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(52116002)(6916009)(6506007)(478600001)(83380400001)(4326008)(38350700002)(1076003)(5660300002)(6666004)(38100700002)(2906002)(36756003)(16526019)(186003)(26005)(54906003)(316002)(66556008)(66946007)(66476007)(2616005)(956004)(8676002)(86362001)(6512007)(6486002)(8936002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?59ZGlZGmG6D1BEAeuBqAlcEso3PxHisw0/MhYqG4HB2OU2DNLzaki970/uS3?=
 =?us-ascii?Q?ni6rA0OFoth4BlVbN8M2UIOA0V6uHJJqo5PcyHeJ7toenY03MV3mr6G/noG+?=
 =?us-ascii?Q?+tXULoUPWxNMw3URfR1yj3BbgEYWb7ZRpAjNXSI7mxl+CutfOMEfWqUUDshQ?=
 =?us-ascii?Q?fKn5mE5AXsbac3QFQL8KeSrNIvGjOZkNC/X1yhppDM0smfhNn3YwC7aH5k2M?=
 =?us-ascii?Q?bZ9gfxEgYkZf97CfUcQdNs+VcMeT3Cl0bKiGWUPwPSePuxbYqU+dIM4dq+0d?=
 =?us-ascii?Q?ABtLlNXE2MQ89QznIUUiENYB6nHTQpHPmzhxb0wjHWBIUXanvpsVYHsB2nvy?=
 =?us-ascii?Q?eW1CMI0XI3xGmGVYEeqXdf2NJkRmS2a9hIN/z0w5ZfS/ga9m7x34UMiA1sCD?=
 =?us-ascii?Q?+nT7XZ/ms4NSu8ctDDIq53+zRZalyzXZgh03dgwPPsszYoXIXSUJgATT8m6r?=
 =?us-ascii?Q?uf7xLoRZDxkR/iAPxt78X/sTO5ID9gULxCv1pUsCeG4sWv/7dO9KMQwiDw4U?=
 =?us-ascii?Q?ZOoJ9qrgbpc9DlHsves1YAwlRNIVwTRrqZkKugblrOI+UXPPK0/L9eBjC18P?=
 =?us-ascii?Q?ZGHWZiqlvxGTUO9PY3GmusvYcQpkn+7o+PGHNIcBR8f9avotgBH2noC299lM?=
 =?us-ascii?Q?gSKOoFKrTiFpx2+fwi5zJ/pGY+dayQX4A6So/APrfkZCn0d1LCVpAoNlEZiW?=
 =?us-ascii?Q?0fOONDVpIAWbhLE8JP9VN7hsr/BmSXPcJ/qlto/uq2UcCS5sMiQzGpZ3cdpW?=
 =?us-ascii?Q?iQ3QGXNPhGz+IDz0hGh0gFLbgfmDaZ3BcMrumpR2q2t9pHGx52ZHpUWVSLgw?=
 =?us-ascii?Q?uO9klRDo7GjaoFkQe84Z146bNBaazNrBKi5UFIaKf8zkg6MYJpUemCuGHpYR?=
 =?us-ascii?Q?BX3nQp07zLeXLFg3qHkRbeCsL5dc0xA8/szes/th9DUz1dJUmu3WqrKGG/SU?=
 =?us-ascii?Q?+e4SRqeqhv0egscCCRcYK08HSDz+TNfni/abYOV6qOPOXqNrH1bS5WgdyKsA?=
 =?us-ascii?Q?eeF+QOPy/rAhfIuiGpJrZPP4f5aQBXzdl3Wyqsg3GbHlOqosqXqGRiV/Tp2S?=
 =?us-ascii?Q?8FYFw8Prva2qc0DM2D6Xwn0x4kvpASFR8ZqgCU7T8dk3UN/FpmUDEWp2QJPh?=
 =?us-ascii?Q?2Mdn/OAECcpTGxXkRNZ0ZNFh0EaVG0/tQJypnwRoLiAI9dCMZbefmcWn3G5q?=
 =?us-ascii?Q?2bhTIAMNCoIDiy82r/D2ym2pYJ/dVFK9AW39l7hGu/8a5Knj7lNtWcN8pEzY?=
 =?us-ascii?Q?zNWumiAXZ4A83Uf8wZLBe1rPTgRRkl+gLyZndqUYAc2iHUFScvZMgI5GhR/x?=
 =?us-ascii?Q?BRhumQdUwplu+WTaDkiAGYQX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528c5fef-7320-4d06-2a81-08d92738b93c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 09:11:23.0489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miP8fTMNWHluvV9UhCAPWXhqbzVnfU358jegwsNjCHFWebUZy6VSqXLg6Mz35K7jlTC5N28+qkZwIyOdRFJTlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8502
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Nitin Garg <nitin.garg@nxp.com>

Since CPU clocks are managed by CPUFREQ and ATF, do not enable
runtime PM otherwise rpm gets out of status as cpufreq
also manages clock states.

Signed-off-by: Nitin Garg <nitin.garg@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-scu.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 597cd2754370..083da31dc3ea 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -521,16 +521,19 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 	struct clk_hw *hw;
 	int ret;
 
-	pm_runtime_set_suspended(dev);
-	pm_runtime_set_autosuspend_delay(dev, 50);
-	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_enable(dev);
-
-	ret = pm_runtime_get_sync(dev);
-	if (ret) {
-		pm_genpd_remove_device(dev);
-		pm_runtime_disable(dev);
-		return ret;
+	if (!((clk->rsrc == IMX_SC_R_A35) || (clk->rsrc == IMX_SC_R_A53) ||
+	    (clk->rsrc == IMX_SC_R_A72))) {
+		pm_runtime_set_suspended(dev);
+		pm_runtime_set_autosuspend_delay(dev, 50);
+		pm_runtime_use_autosuspend(&pdev->dev);
+		pm_runtime_enable(dev);
+
+		ret = pm_runtime_get_sync(dev);
+		if (ret) {
+			pm_genpd_remove_device(dev);
+			pm_runtime_disable(dev);
+			return ret;
+		}
 	}
 
 	hw = __imx_clk_scu(dev, clk->name, clk->parents, clk->num_parents,
@@ -543,8 +546,11 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 	clk->hw = hw;
 	list_add_tail(&clk->node, &imx_scu_clks[clk->rsrc]);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
+	if (!((clk->rsrc == IMX_SC_R_A35) || (clk->rsrc == IMX_SC_R_A53) ||
+	    (clk->rsrc == IMX_SC_R_A72))) {
+		pm_runtime_mark_last_busy(&pdev->dev);
+		pm_runtime_put_autosuspend(&pdev->dev);
+	}
 
 	dev_dbg(dev, "register SCU clock rsrc:%d type:%d\n", clk->rsrc,
 		clk->clk_type);
-- 
2.25.1

