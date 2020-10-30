Return-Path: <SRS0=Ewk5=EF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E4AC00A89
	for <linux-clk@archiver.kernel.org>; Fri, 30 Oct 2020 15:55:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD398206CA
	for <linux-clk@archiver.kernel.org>; Fri, 30 Oct 2020 15:55:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ka/7lQqH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgJ3Pzn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Oct 2020 11:55:43 -0400
Received: from mail-eopbgr00048.outbound.protection.outlook.com ([40.107.0.48]:5955
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726491AbgJ3Pzn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 30 Oct 2020 11:55:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfFf1NutIvw7nhfXssX69H4HK5o4eXcI5D0BrhKNX9/UynIUcGGdgTfIR7HZYL2hUiaug0dL7MqeOP+7k5brNMUTUryqGmhBSecdWlRe5xCKhL74GfbhdXLVUr1be10goxLxfBD1L0RfXnohPYHrchAEUjXaN80xgdweVhwexxuXqIxsqyYgXJSr+U5wto8i/6a4EPStoL7Kp/O+TEhMO6HvUPM3ptmYHkZUaqQpxAI5TzxSTpwfpCiL8PWThiqGGtMHX9x+2vJ6KrLHaUMt2AUL80OjuI2DCz66GdPIhOwfxMRV6fspvyIacT55f/nyfqhqmCp0URDam538Tgk9vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZtWTTwttoSBiBDjT6wpLueosPyO4FUIYrt59qCKti0=;
 b=fppp2jynNAfUiukf5Bpfs0Y8aFfCLs3xOX6Mg/K3vMPbUmomzqH2sM0JJs79Qiqor+UZ2R+u/rIuGwFc/Ym+KrrJ2qkjpzjHaWA+eSY7q6T7hO9+91N8Y002e5Uh9N8cOouA+wiLliNY4o04bF+jGc+7lcwQKaEoCZP9b8hdnrWIkoV3TwTPZhLDp1hRItpQCel9tOXt097Es2txgKGZMXkmfxmwGYEHoVkwRSbVq99wtsCFRedN6gAJolQ737M4TbO4HF1YgIr5W0h3dUlL0oBOq4ayieVHE74wtkvc8qGGrMs9d/HqyrWes6xeDUJX/DlMWxP0PvSfw+2rXcYJbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZtWTTwttoSBiBDjT6wpLueosPyO4FUIYrt59qCKti0=;
 b=ka/7lQqHRRaa6AgQsFHae1dZSn7dquAXERuTAdEPUZhWzA/5orSwU0DKDgGXvI9FyVoZ0WICmn1OIJ9/AEOlOR4SknJd64q0JAt6gX8QreM0leVa3VXrXa9jgJlsvs6Ocsr3CTnhIH0UvMQVFjaHFLw2HVwGUFPQr3Qq/L3mb/w=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5285.eurprd04.prod.outlook.com (2603:10a6:20b:3::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Fri, 30 Oct
 2020 15:55:37 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::546f:92f0:f3c5:a148]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::546f:92f0:f3c5:a148%7]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 15:55:36 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 1/1] clk: imx: scu: fix build break when compiled as modules
Date:   Fri, 30 Oct 2020 23:37:33 +0800
Message-Id: <20201030153733.30160-1-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.23.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0164.apcprd03.prod.outlook.com
 (2603:1096:4:c9::19) To AM6PR04MB4966.eurprd04.prod.outlook.com
 (2603:10a6:20b:2::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29396-OptiPlex-7040.ap.freescale.net (119.31.174.66) by SG2PR03CA0164.apcprd03.prod.outlook.com (2603:1096:4:c9::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.8 via Frontend Transport; Fri, 30 Oct 2020 15:55:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 53a64c81-c0c8-41b5-784d-08d87cec3de0
X-MS-TrafficTypeDiagnostic: AM6PR04MB5285:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5285EFB2574C31FE516F365580150@AM6PR04MB5285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k36RA4ITraJTz39m/vcSllufTADxR5WmFPgMLmDFYFN43mVUSce/Uqp1zptLk9eOYaThBB82dMwgS5Bv5Wn/cBSpwV2GQsFiwSZRsCxAhijk7LsoD2CPrntxmD3hKNfw7Db0ihRGg2ODIUcBL0PxurovtDTj4TOUlcBGUCDpYYrbTplTHxKKdslNBmi9VX2OCrnx7f51d8EkkcSA8YbApZabsdjizxq3ODzQNV1vik8o5b4E+aJ+H9+U+07g+7B2jDvSmduBnly/oYTfiUZt4vtsciG1gLWljo18DcwsfZONe2k62+u59hPrXgw29iAk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(66946007)(66476007)(66556008)(6506007)(2616005)(4326008)(478600001)(2906002)(54906003)(26005)(8936002)(8676002)(86362001)(52116002)(5660300002)(1076003)(36756003)(6486002)(83380400001)(186003)(16526019)(6916009)(956004)(316002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: t+3sIY7XSgmK2l03OXir1cWnWGIu5AO3Rjy2ZODmkWgl/QOOE1jfUw03nFXbmirCGm3oH97PWfuw8e7MW11O0Yb42opILpi1phhcMBYPdNV25X6iRAeV6eGOiaezT2MPH0cAZoqKycXct6yBg4J9zhWuYkcxKNBVkAluC3itImoaq+S0VDJblePYFs0BuXZ6ZE2mDJZI7FW8M2TdyjI2Anyvb8SLAm3b6LjBrabahQc8N+7vPfOPn8b8yVqYOfSKTVGphKwJAG9FxRbl2gAnEb18vURiR13g5QxWtwy76fPj6wZhvB7+V9RjMSIMG5DKJCftXubkD9t8ojYMsk65y8MYVwbSBi0RFt8UO40Jcl1qriTjcc5Oq+Ddvakz/85fhPN6LTAjmtifCcjmKuCThj0BfBRxbILLRWjidI0SLlhDoGtlUlyiKHsHEQ4zAc8T6UQn63KpCfbwY+1MeBZDqTpGEPlkbp4y54kcgReYYjvlMiCggdnSgEip9EKyI06ijqE1FIeg/79QSvZwQwv++WdHyprmZNa+I5M3MIJmrd5A9SWs1oHpf/RkCd9+Uc+Atl968MQ22ipzkfvTXFXCiVq1Q/NYLkwnI8ZbX5XXNL1e5uzVxOlz08IOIF9w8deSO0ElQgAj+jLIjnmmm7mXuA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a64c81-c0c8-41b5-784d-08d87cec3de0
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 15:55:36.8180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlVnnmksE7t8N6rMHxz43XvRVthlLZxaZTuSvwiI2iqfO9O+67K9zQvTw4C0rq41CDozdfha/hVeJ9YFDR5P2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5285
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After commit e0d0d4d86c76 ("clk: imx8qxp: Support building i.MX8QXP clock
driver as module"), clk-scu.c and clk-imx8qxp.c are complied in one module,
thus there can be only one module_init() in those two files.
Commit 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
introduced another module_init() in clk_scu.c which caused the errors
below.

To fix the issue, we can remove the unnecessary builtin_platform_driver
from clk_scu.c and directly register the driver in imx_clk_scu_init().

  CC [M]  drivers/clk/imx/clk-scu.o
In file included from ../include/linux/of_device.h:6,
                 from ../include/linux/of_platform.h:12,
                 from ../drivers/clk/imx/clk-scu.c:11:
../drivers/clk/imx/clk-scu.c: In function ‘imx_clk_scu_init’:
../drivers/clk/imx/clk-scu.c:176:35: error: ‘imx_clk_scu_driver’ undeclared (first use in this function); did you mean ‘imx_clk_scu_init’?
  176 |  return platform_driver_register(&imx_clk_scu_driver);
      |                                   ^~~~~~~~~~~~~~~~~~
../include/linux/platform_device.h:218:29: note: in definition of macro ‘platform_driver_register’
  218 |  __platform_driver_register(drv, THIS_MODULE)
      |                             ^~~
../drivers/clk/imx/clk-scu.c:176:35: note: each undeclared identifier is reported only once for each function it appears in
  176 |  return platform_driver_register(&imx_clk_scu_driver);
      |                                   ^~~~~~~~~~~~~~~~~~
../include/linux/platform_device.h:218:29: note: in definition of macro ‘platform_driver_register’
  218 |  __platform_driver_register(drv, THIS_MODULE)
      |                             ^~~
../drivers/clk/imx/clk-scu.c:177:1: error: control reaches end of non-void function [-Werror=return-type]
  177 | }
      | ^
At top level:
../drivers/clk/imx/clk-scu.c:470:31: warning: ‘imx_clk_scu_driver’ defined but not used [-Wunused-variable]
  470 | static struct platform_driver imx_clk_scu_driver = {

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-scu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index e5837e7caa50..d8d59c90bb18 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -20,6 +20,7 @@
 
 static struct imx_sc_ipc *ccm_ipc_handle;
 struct device_node *pd_np;
+static struct platform_driver imx_clk_scu_driver;
 
 struct imx_scu_clk_node {
 	const char *name;
@@ -173,7 +174,7 @@ int imx_clk_scu_init(struct device_node *np)
 		}
 	}
 
-	return 0;
+	return platform_driver_register(&imx_clk_scu_driver);
 }
 
 /*
@@ -474,7 +475,6 @@ static struct platform_driver imx_clk_scu_driver = {
 	},
 	.probe = imx_clk_scu_probe,
 };
-builtin_platform_driver(imx_clk_scu_driver);
 
 static int imx_clk_scu_attach_pd(struct device *dev, u32 rsrc_id)
 {
-- 
2.23.0

