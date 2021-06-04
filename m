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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCB7C07E94
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1753961418
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhFDJMz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 05:12:55 -0400
Received: from mail-eopbgr140054.outbound.protection.outlook.com ([40.107.14.54]:32578
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229973AbhFDJMy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Jun 2021 05:12:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+7BevM5JSw994ktddH5rUY8JEhwDoEZ5WAuXHte1dqOKT1MmrvxPaxcfVi+1eZHyo4ils6EKt5Go3mq9FjmmLnEAqxwDiNaedb1KC88vMOw+xVO/Z7pj6TUvZLSHASa8T6L46hanw+gnN4LXYZyB59t5/sLyNkBN/yWgH28qeDKiUkLJbTWvudS+KYN8/rwnf81tGaVqcdPemTuv4eH4JRqagqD1S8aWd+X9Efvu8Qw/o08dUgFVNKf56QQeAgA0g6p8rTcszqZ6cIm3rz4WJi8MiO3+zsANbFd83qZqoFRnQ7i5axMHiHJQGO3YPYzG4ao6+yaleKNXfgsIwwBmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+tyWJv3dRBiWEhUKMUAp9jJj4ZO3HIM0x41dogbDWU=;
 b=N3+szBBXRdUIt7Tu8ymA132vnvoPuAgqQJF3+HvSfUqKEfxWihCkrDZHVPdsc2hWVjUcVS4Tsl6Bfexp5am/dZapa42MpwbjGFPhlKrmQy7pFtUfSHu+5Ms89wJgJh0fIX2jFCgYzL53/YiJyvs0Q9bxZAcsMZTAnUFnhf7oExFh9Yh6Sd6D+UwCuePU79nxWFWud+HqPHle7G4UXO0vqJmx522Iu1D95J5N1tB2FlWaRiVCJnmhlyeue7MX1jfKppEb/r1YbilOVrKSIGRSDQLUJ4qh2FOdLC/AjwPVSdm3xe/vpEV9m46t61P5bNEmiQY9K1IDbSqQzpUHPDp7+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+tyWJv3dRBiWEhUKMUAp9jJj4ZO3HIM0x41dogbDWU=;
 b=cuFVXy4MxGQZVGkFjKkGulyaP9uyMP1QKBOqIvQqifWoMwrW1ab6E1Svtv30YaPyJmODJ4+xxxeNbdIXEVPaVWd8xvus/GD676hj1WgHmLDnUhxOfoLw0DYbsIFakL2X4cNeqGT79XdpZW5VRWUoAX6wnkmKvfjYt7MeQ4Jzshs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8502.eurprd04.prod.outlook.com (2603:10a6:10:2d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Fri, 4 Jun
 2021 09:11:07 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a%7]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 09:11:07 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        dongas86@gmail.com, shawnguo@kernel.org, kernel@pengutronix.de,
        abel.vesa@nxp.com, Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 05/10] clk: imx: scu: bypass pi_pll enable status restore
Date:   Fri,  4 Jun 2021 17:09:38 +0800
Message-Id: <20210604090943.3519350-6-aisheng.dong@nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24 via Frontend Transport; Fri, 4 Jun 2021 09:11:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8865e384-4229-4749-f18e-08d92738afae
X-MS-TrafficTypeDiagnostic: DU2PR04MB8502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB850266846F69EAEEB4551B44803B9@DU2PR04MB8502.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OCvkD4RuhBmvYIrOhL7RARoZFXDG7C5DZ3DzK7UZv4NYO+A2ayo+Ge2JHU2Xo3ut/Gz8KT8NVVVCrbnMWSaPXquF1QvB3hxIkESz5YX87lwjzAQzIDhw1BHH+g9K4HhGwjYtWhIHRIlw0f0HDwzOQb7O0ewAM0IUZM0ALO6hp8+PqlIzCW6uRfozu7Cxbv5oQ5rbcHgMDzGZAcsofXkVephsdbJcUtJWmxnELMdmQ+O7ejnBJVbwLamZHoOATcPPulP3lYVz+hbXBEyrjtpOWjDQX/cESFKqDhQkSE7yN0TCzOc0KURCRS4lQLdnZGxWMHwI7MhJJLeSGiamTUMB4j1USzMtS5dIVqzSoPRAVl5JXx7HKYu2BMCQeuO459sigWd+Ro7WQzrV/XcRz+6oo1c40WiHY6upE3pbii0zSeN7sEV/xcOfd6Y52alGfDZhDoMewN/bpqBgOQiPHXFV3h56euAAx2Mqhu2hxIW+6ks60cotlOpXVGR9mCdudCkabsB3po1b0F7ArFuyLBIDLTzKqz4jx7R87yjVtDTpTOJ/E0tadpKy/jHdU9epEVIs3ceoL7x7c83q3vA6zh2o++BlB+A5JkzfzykYTueLAnCz/46xM2bmxObF22IZx1xFePxV7RGt9MznDQfqFOkPjuhlW91iUX8ea/66BjLkIAGgTtkLZ4e5KCDn4HcLr0b2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(52116002)(6916009)(6506007)(478600001)(83380400001)(4326008)(38350700002)(4744005)(1076003)(5660300002)(6666004)(38100700002)(2906002)(36756003)(16526019)(186003)(26005)(316002)(66556008)(66946007)(66476007)(2616005)(956004)(8676002)(86362001)(6512007)(6486002)(8936002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dt84UM04jjj9AyRSj+JpK2qJTSPJDQUKx7nTuRc2Y5w3KSBDTq2OvgFyPDF3?=
 =?us-ascii?Q?CC/iIIZWNZ+r0Ac2v/APxLKufNuSvwXl8g3D3CWYoTuxGUgguSUBsv4V9pqD?=
 =?us-ascii?Q?N7nWCpGcplFUWfB2i4TawkijZ3X4fbE7VdplAJX4PTXw/G6Hprw3b3TBbVcq?=
 =?us-ascii?Q?6aGuX6DlGdcu9kdpwwOW38QoRt1dCJl2oS+kyCcp+qHGMLVJymk0dRFAxfLc?=
 =?us-ascii?Q?QqZ/VTwTG7F5umIG3isxArcvplu9AK2tvDQ87nZEI+GLvOMHDYTieAHxjBLH?=
 =?us-ascii?Q?0IV1Zoswh9UwifPXRIbb06kCp+5MJwa5uGp9hVT8A7V5/zwWmJpA4J3tcXus?=
 =?us-ascii?Q?rs841fXs9DA3gwxy4uV6qR7RkUjp5gwEMoUmWBqVwOgxgyCKY+54judT2icu?=
 =?us-ascii?Q?c6Pi9mslWqOouXw78PTlH2DI3m2YVbYU6jfNpx5D642W2iH/bjsv85dBSaak?=
 =?us-ascii?Q?q3EQNPZl1SZ/2g665TxtIsgE5gT9NMBbxsM7wB7M6rGPjmXJpBgvR7dfPK0w?=
 =?us-ascii?Q?dBzYAtq5zQdkiUN7oEyK1iTsfHs9OsmDCSM9xsYWcSF+HG6kLaLppC/P27Mk?=
 =?us-ascii?Q?OkuToD1arGFqsutWRCePdjBCIGb8iOJ8u61jmVNqkDKk5iW3NFOhK0NoJeYD?=
 =?us-ascii?Q?7Qodgqul+HFsjcL5HbbpRwZ8Ug9ddkLPmRAcJ9KJXTmq+QNn2Ie6sFs7kRFQ?=
 =?us-ascii?Q?mCn5l0qW8z5dN8MuRJrHKlBzuAu3XYNgoTdxB6Nj319aUaIJT3T7qhpqSuYn?=
 =?us-ascii?Q?Goy0uSAfrMLZPvnHicN7uOh9EYLJF8EWRKmXJ5j7V8oxFg54fmaX5z2uzxAp?=
 =?us-ascii?Q?Iri9pz9Y04jPoN7vGNWnD8TwZA2UHrOZCsDR6OEP2VrIMQjGqsZJ3e1vi54N?=
 =?us-ascii?Q?1QfG5WfGS4URtb0NSjup8Bg4LffFG3TDdp8ZyBVZv6rQsWSwMpzEXhCcHa6K?=
 =?us-ascii?Q?OXoRjs7yBt++BeUOqOV3TWftpittSWtJ4CspPQsT93eIP/zXLedAJx3ymkks?=
 =?us-ascii?Q?NZUu8iyqTu8s2ejORPlKT8x30AacWilTqbK2Q6+kDlx8MHnqTUcAVxCqTP2n?=
 =?us-ascii?Q?7LCSlf2UdWyacCnEGud1POBu/q0cYrpNeRnhfqEcXQXMH5aS9r8CfE0kXncL?=
 =?us-ascii?Q?aWwlKjyYthEneGJ9wgqwyizzrtnFj0FUUGIp3RrccdrH1g/K4kEh2T43fDgJ?=
 =?us-ascii?Q?pM39S+wN/f2GWAgRUQUtKRCN2dSPnALBHT/kA18NXsW7EaeW1CUlOYM4ECcV?=
 =?us-ascii?Q?K+qz0WnvRYOdekuSm2QuKkMI9I7/4093IR/gulWIVdU4+X7NjwjgnhRXi4K2?=
 =?us-ascii?Q?Ml6ZnWFZ4gqUz0nAYYHULnZl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8865e384-4229-4749-f18e-08d92738afae
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 09:11:07.1643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKBW9GzXM0yTpU22SM6FYKuuB5dA+W+Aiy9c35txPpfkLMlv24Kbp/Xe0QxsmPvvuK8bzmhplJM96REgPW3wCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8502
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PI PLL does not support enable/disable. So bypass it's
enable status restore.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-scu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 95fcac7f73b6..2537e68ded16 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -573,7 +573,7 @@ static int __maybe_unused imx_clk_scu_resume(struct device *dev)
 			!ret ? "success" : "failed");
 	}
 
-	if (clk->is_enabled) {
+	if (clk->is_enabled && rsrc_id != IMX_SC_R_PI_0_PLL) {
 		ret = clk_scu_prepare(&clk->hw);
 		dev_dbg(dev, "restore enabled state %s\n",
 			!ret ? "success" : "failed");
-- 
2.25.1

