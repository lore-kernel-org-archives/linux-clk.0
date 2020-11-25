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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02741C56202
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 11:08:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 965F5206E5
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 11:08:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q8w1f/Os"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbgKYLI6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Nov 2020 06:08:58 -0500
Received: from mail-am6eur05on2077.outbound.protection.outlook.com ([40.107.22.77]:13605
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726034AbgKYLI5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 25 Nov 2020 06:08:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwiW4fS494uIoMd3Xo2L8p5nn0OGVX/3dWHtzLKHVlD5lsdM+KJgalVwa7UmYA8cCUsMtNC8zTG5/s6zEH9f7wPWkIk67JD6BJ2XjuFKWnx24O0+7bhR1O40GZmyxTa0xjjWqjffGtxZBxDdZx1JTIWMBKyBWMsHuD3cuNts8P9d2V97bUvlR6y8JQH64seuDyMIvGcruUc1R8hJrFB6ypTEsztlV4NfUheJA3QEUEA/sAs5hX9QOzjR4c51Gv/7JIJaWNJ6pFWVoRsh7orKAmrUv+x+kjU6M5KnI8aU2GxfGTW+DyoJfOTBjHTByw099y020a7TeMdfhZs0vMBkMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOqDkOjzVVzJq0ttphMQEjdp/qhsEb9b8AnLTTn2hR4=;
 b=j70G0hIdSJZqQgNImcy93C34O1HHp3oxhujFbnJiVq8CJQFPrwUFhh+PrLDUOWd+0a7plCT3jFGOuVknjqC4oX0TnTPuG7dFHhJTjG349iSOlIXstn+Sv7cQYBI6WpGEAf0xWH2LVKu02yN8Nd94dwhJCT/cIdVE40dxjlrtBF5vk7n+O5h5+bodCdJtxrsg1M1wcMEmj4QSA6NvmaZ8sH1cb9SjZfnrJPseYCbU/RfpEZxQszsN1L+yP7rtXKBeeh7zDcif61/lTWn6JknFJ0RWuna+ZPxFdKsO79DB9U7sdK4fKaJqj5zXsMhMaZKknI4e7Z/oGgLdX/5WvNM00w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOqDkOjzVVzJq0ttphMQEjdp/qhsEb9b8AnLTTn2hR4=;
 b=Q8w1f/Osr0SKxIgXpUSY/b2EJujQPQmD9lzI6xVVGa+yTjtqTOwV+pR6uoyBxrE+qaPHlvbMcH4WXwb5vZpARMyNAu92BGCFQhqvm5L2EINC/dH3AF0GQRa9C6n+Fj2Quo4k4gsioblFpyo3fzrwZJqnraGKyMblm32QoG63FXI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM5PR04MB3252.eurprd04.prod.outlook.com (2603:10a6:206:6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Wed, 25 Nov
 2020 11:08:54 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a%3]) with mapi id 15.20.3564.029; Wed, 25 Nov 2020
 11:08:54 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        sudipm.mukherjee@gmail.com, sboyd@kernel.org, shawnguo@kernel.org,
        dongas86@gmail.com, Dong Aisheng <aisheng.dong@nxp.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/1] clk: imx: scu: fix MXC_CLK_SCU module build break
Date:   Wed, 25 Nov 2020 18:50:37 +0800
Message-Id: <20201125105037.22079-1-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.23.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MA1PR0101CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::28) To AM6PR04MB4966.eurprd04.prod.outlook.com
 (2603:10a6:20b:2::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29396-OptiPlex-7040.ap.freescale.net (119.31.174.66) by MA1PR0101CA0018.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:21::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 11:08:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: df35afed-e49a-4a8b-a144-08d891327eef
X-MS-TrafficTypeDiagnostic: AM5PR04MB3252:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR04MB325238658E34F10E4C493EBF80FA0@AM5PR04MB3252.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NpHwpQkcW5sz+P9Ml432I220fVprfXSSNA10cq6dr02YBlZ4Rh8lzyThLSqbHUk2eu38wWAbFcDLtu1iTUJ6uo1g2isgRXOmRVP/jvkpSI7aPhd6SFBMOahSHZTo3uFq1zjqkeJimyj2exMHU4RkGEL5sYN6Z6zu39i3AYYHee84RsnZ5ni/adKwwOTqJnz8ee9s0pv2tnQJCOfu5NElWI6/7rtFloRdP4DymN1AHmX3ScNagh8z4j5gPHnokG51EzcY7WQ5X84XMLrsJ8T2dXbeW86gmKRfZ4Z+sTIRJH7T381XzSW2kRdZ12Oz6+0rnjNxHvRKWA6d/Iesy5xGuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(186003)(66556008)(6512007)(16526019)(66476007)(316002)(66946007)(8676002)(26005)(4326008)(2906002)(5660300002)(1076003)(6916009)(478600001)(8936002)(86362001)(956004)(52116002)(36756003)(6506007)(2616005)(6666004)(54906003)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: cNz5gdkL8UE6GZp2DSZIcSjWGY/ENxKoegcaoznRloNPsSW8zcfYeVWrkPNKSne1oSEoZTpWgfGjwdTzCUbZk4/7HoAnhngDLjwTOc35NzzczTJuLE6BC5ykoed3rkCq4jI6QVWSdjbuuCqVFD1un+CjK0LPGQFCtKoV7ITSBaVfcIOoZi609hODz+nmU/LTdDyuXvwiFe40ygKBT6UjZvymxXrPDi+tHWFBxq/etiZlwGmWaM/w7Nf+f1K3PirnQUG/TEOlYHPIfGjQv28cN3tmLNCVyrO+Rp8A8QFT2tSF0MWwKe7AFtNK9XHcIwfe0bVvoGcv5N81j/F9OPGLgMD2uT/rXVSs0XsOM5BYzcXMEBrIu91QIVALEgipqBRjiSfj4y2eJ79C+o82tqZcWyZG/yu5TiaRy5aHayIDh0XNE1ilxQWB0E9AgBCeztgDgvbgLaEAZMoBAtGenaGXxOXSA19g1BJjSOnFKv8chMq6S76OigG3hQ/R+M1PHGlIZPvr9uP/pD3mhe5EL8VhUKuAAJ9AhrocYaRftxdrJXAxljI+kT/8fpXNRcRx+FZ/+tsNeurfSwozI8jiaZvclXIwPhqHsYpr1kxyopjtFSw8sO7/0193YZnaghVIl3sP96xc3lTaH2DdnFzJccK/FruoNeaAIdM2WWtY6bvw26TJ7SFoETHcyokatq8zJyZ+dmTAWkTofrWw7VNLsc3JqJDG5ZGCIBOLc/SJHe67v2yo3xk46TrZn8b1ILXDH84HappA6MPrAnPGhzVcfd0NWfC8cKGHfNfp+y9S+V13wBrW+lO4Fupe7+tZXa0XxxDn4qXEyZ01vHKwxCMWFC2ZaM6HXVlXb8kOTnv1iy/9kcAEdvz4DF4PLsURgU7/PrY+oLxeqc2KKsKoTPEDI6QmKA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df35afed-e49a-4a8b-a144-08d891327eef
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 11:08:54.0369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwNhAVz2nOtgqokyUVKlIjIK6Vr8G85DLiKeNfGrBmWuXKdXi7eoX2P+u3stEeyN27V03YtW3AypJOiw1rZXow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3252
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This issue can be reproduced by CONFIG_IMX_MBOX=m and CONFIG_MXC_CLK_SCU=m.
It's caused by current Makefile can't support build clk-scu.o and
clk-imx8qxp.o separately.
"obj-$(CONFIG_MXC_CLK_SCU) += clk-imx-scu.o clk-imx-lpcg-scu.o
clk-imx-scu-$(CONFIG_CLK_IMX8QXP) += clk-scu.o clk-imx8qxp.o"
Only enable MXC_CLK_SCU while CLK_IMX8QXP not is meaningless and buggy.

This patch makes MXC_CLK_SCU to be invisible to users and can only be
selected by CLK_IMX8QXP option to ensure they're built together.

Fixes: e0d0d4d86c766 ("clk: imx8qxp: Support building i.MX8QXP clock driver as module")
Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index 3b393cb07295..dbacdd70af2e 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -5,7 +5,7 @@ config MXC_CLK
 	depends on ARCH_MXC || COMPILE_TEST
 
 config MXC_CLK_SCU
-	tristate "IMX SCU clock"
+	tristate
 	depends on ARCH_MXC || COMPILE_TEST
 	depends on IMX_SCU && HAVE_ARM_SMCCC
 
-- 
2.23.0

