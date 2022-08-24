Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA68C32792
	for <linux-clk@archiver.kernel.org>; Wed, 24 Aug 2022 08:22:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236050AbiHXIWb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Aug 2022 04:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236015AbiHXIWL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Aug 2022 04:22:11 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50061.outbound.protection.outlook.com [40.107.5.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2CD890821;
        Wed, 24 Aug 2022 01:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cm7ysGxz7gMeolB7hNNi3ChnA8hOae0UhVH1S9x2TJ3wD8d+IJi/XhMl8NUn8x1htivQed0D+4jwmm2dWuwOSqwvmTX5IgNsrx/uNLZrn2FQkYdyknE4/VzGr06r23i+AMczdBexTQdYT8f0vahAgGdAD1+JPUKJKGkcWy+9WsJHxJcLBJG2uJu4jEAqfWkDwwZ6sG9/7TNPUIAy8lxdeMMH5TZP5e/3nwRBdGoUuQwDRah91L9V5f9gcqW4fbA7v/GCA9LHjcLx5wq2DZDtW1KZ+9sxs2f7alSUTIrOE4JHA6ZK6k0jLgZwfyeRqd9+CjykpKzypKjYa629TBgt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uhYes+mp4kGdokqw1Anr17niI/0FZWHme2D2hkiUUo=;
 b=ab91UOizzD/M053iKRLywMH/NHwUgjfUsgR0lm5TShffNejffUWbacZthChnp8+/Wz+O+WHZzFwEWG/REccf2o4/XIyQBMIqwQ/TIKmfBLiA4yx+yFVj1lx2agvtL1ABwDHgzEV88gC3oTuXgNYWZPo3fjcm6RVvIl/8luY06/HDEl7H2329zvHj4xmqvsDnfUc8LD+oY0ezc5QG3ziYB/tqzSqHML9l0JMMK7NmLG2Cq5BD8d2rVlaUiHu2sgqc0tB8YQFK2bLyUQXobA1yM/XkwOk3goWOSsU7t4Kpq/VG+0e2pEXBIshMSm/hmBfMJ1Sf9SSTTtTg/N1BqoZaZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uhYes+mp4kGdokqw1Anr17niI/0FZWHme2D2hkiUUo=;
 b=nIt6st2nrPzBO9q0y+a2lEFGvUVa8vqxNKkvlDH3aPaKvsZHE6A66IK0ZFuIilOArm32YzncyB+rqj11JrHWafbRATfZc2Q98jC7VcJMgsxMnzUJvCo7yUomrzgd67uLlUy4j3MC8mPEqk8RzcJe0X+TN31y6KU31GQUElLC7M8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by HE1PR0402MB3514.eurprd04.prod.outlook.com (2603:10a6:7:83::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 08:21:54 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::1c65:f6a7:bc4:eb15]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::1c65:f6a7:bc4:eb15%6]) with mapi id 15.20.5546.022; Wed, 24 Aug 2022
 08:21:54 +0000
From:   Li Jun <jun.li@nxp.com>
To:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clocks: imx8mp: Add ID for usb suspend clock
Date:   Wed, 24 Aug 2022 16:04:21 +0800
Message-Id: <1661328262-3867-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0130.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::34) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7dec13e-34a2-4cfb-0f96-08da85a9b3eb
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3514:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FlWXOiN2KgIN5I7mG37nDfwwj4B03Lh05XNBJ0+pXN+JBK8dWVamJQhvL/zQQc5kwP/+YR/VBdMjLJSBFrvWjkeMZV2NBKBicXkICnDRdc1U5yYF+GhRDnaTbCpVLg19XOqXs1bhzLCLnluS0t+UOyE3+KYQDnC4GJFkJMN+k0qC29HebITIcAIMb+JFMg/AML64P3QOn+GAfTL+UcmTb/bkuufr0OYdjdepks/GljgwGatO92/dJ3tRal5UHeb42AV/uDbpaegBkG+JNXmsCGUKCDnZ/2v2mo8CxpwftciqtlqpOPYVT7IFcygoknTI7q/UGy/xBBHt7pnebHYCaHwIykozdeXW0YzNCJQ1UiGJZm5G7Jvund6+PLXDw1RC36ptBwgb+jJeqouLKFqO91b3Z08yscN9FKlN5rZWVBtxtkMS9GxRB5IQk3tqHzzeL0/wpBdDSEutmvCODWN/qMWFUao0d54aLwtnOau7G3C5oMurLcXhx2GiOvugnHTzboaSQRZoFoUgRtRnoBYq9Ys293wxA6q8/H7OmV0HGbghsUSR7DbsX8XidwK6xC9a2bqrkRzHsiHi5FkOoKIxFQg/9/SweKODSZekmXad94bg3MBvIi7maIOsmiGvgHZ2bu7hWIftICRbMKdX9yt/GPRvQwEZvAiQnDGjB8dLvCP9AHfNrRWP6fA6cE69rAO2PLGQX2zkEH2bXhKMwi2/JjwLrNMrU6BYKg5d0ClfuYEOzleQFIzv/DKOEtK2cSEKUtidjW7VcrMa52ObhPeI0/FsmKCvYAV+bVcQCJy/0cE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(2616005)(186003)(41300700001)(36756003)(38100700002)(86362001)(38350700002)(52116002)(66476007)(66556008)(66946007)(8676002)(6486002)(6666004)(6512007)(6506007)(4326008)(26005)(2906002)(83380400001)(316002)(4744005)(8936002)(7416002)(5660300002)(15650500001)(478600001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ziRBaq2ZDSIRyi+xSVNVUVLGxmoJZm+qbv3q5wRk2p7gk8w0qO5QGMkoxznx?=
 =?us-ascii?Q?dsWhXZTgKgnZmYGMKalwKVQs6z4z1OPc3QWxIxIgXwJKOcRA0R8TPOJN0jA+?=
 =?us-ascii?Q?RqZJH2T12WaU8yu23ZULHHcZNaWo0HcSeasCJnYG8G0yDC2Nrm6mrGcUTQEN?=
 =?us-ascii?Q?G/DaS3CJsBX8wdsN51qisJ+jmFHL1gQcl75dd4AMocho00yKzaIqgW1lCA3S?=
 =?us-ascii?Q?Xjwn3XPpYZOEZwTMEI3QsYR3BMwC2Edl0vWTBNHnRqC6OvE8LmwySjNp1mNO?=
 =?us-ascii?Q?9/Qks2wWqyiRJWcrAGMt/TVRJnXs4nQhFmcYgm+j6m8BIPbDW7glL9z5Slx9?=
 =?us-ascii?Q?x5p9Edm8Ku8L9/mwYWcSqhVxdVYdnAsZCOI9RGj2b16e0j2M7D+BQYHyeIRy?=
 =?us-ascii?Q?MvgZQgXk4V9474fJRLDFHbhac8AApPa/JNGRz1HhAWPB3BU5/6J425xgUcEu?=
 =?us-ascii?Q?sOTMF4ZPfZmRWJCIdwfmEpXaZ41P+eelLkE+hvTUXTsqujaOsVof15Z07Rnx?=
 =?us-ascii?Q?/FDSYHcA/BR08QdffH4VIFGQtDLE/nwXXl+23jdMxcJz/5amkkqVMYXM/V4o?=
 =?us-ascii?Q?oIr35a8pYhxxr6nZ88Z8Jf+RPoqpww28JzN7+O2WRXGby9uO3XsY5q5KLIUz?=
 =?us-ascii?Q?1+V+bih4gLXwQoY0AycyauvcPO7WwLwUP2sl/I7D8S61a+ad0dXYs9/YJHpf?=
 =?us-ascii?Q?j2rNR1o4PZQT9p7rOIMa43AKo/3mzEMNAX3Rx/hCOCF5YaSRgEma5XrIi6j8?=
 =?us-ascii?Q?D8lW6DtN5qjdzf/+hPrsjY+4jyerRHRY0KzZfVL5dpHQHfeRrF9AmJ+WmVhc?=
 =?us-ascii?Q?ToQy5Bi8SjaEgghlfYK8A7jtyp/+Fs3HVohccIdCgKhemtnoYAMr8aRVW+aZ?=
 =?us-ascii?Q?E0k90PB4vBL9atPeCz5UInOstCV0B0hHBMHjnp4z+YGMdgFYrSICNR5jNWH3?=
 =?us-ascii?Q?lWhutJ1Gw8GkTyE6oR6TaDsKnHiTNVm+N8HjLECTEW12E7jw07jJFSOGsyaC?=
 =?us-ascii?Q?DfS1WMkUNEJ9KD7P4l/inLupKt8CY8VR/yCGmxi/ia3dKQOUFrSMZfXRh+uX?=
 =?us-ascii?Q?mStxmdXYPD4V7TTwe+Rp6UYCJ9lt8wVRuxwB27aLYc4eQXNXOkp0NkXKvwMb?=
 =?us-ascii?Q?bQJDLGyfYGz3nDN6NQeBq0kb1dAYOwn6l0u9Ujsz7xWpE29686KhY2O4Y+Wn?=
 =?us-ascii?Q?n9ArAZuE4EySE4X65jZ0NZNm52HOa7aOLuY2BYnWmxuA7VFVJLxVoqtUdjpe?=
 =?us-ascii?Q?AnhERWe9hwSWCGqrmNzxsxvgxBd2/N3vgEaPxPFuGD8xR4CYqi5nI0D0F4kN?=
 =?us-ascii?Q?6mNf9HjLe0lCxIvic0DFAxuXU0rujKAxoVB1RjFBEyuu1YyUf/uqImB3NwP1?=
 =?us-ascii?Q?+8bufEx5Rw14cIHrU4FF0tFYv5YrXoST6U+CN16Mxf25q2fKZHRMzn+UhAh1?=
 =?us-ascii?Q?eNgQAkgCfPlCi7PrrgtxFTa/prk5SGyqlz9TCrdqHoYCZV1D6U0Edwv3b7u+?=
 =?us-ascii?Q?ucvfcCGDPiWa7MftJsc9qXP0vLT5ESs/wwS1JNSSnoODTHYkB9ZX0+HGgxko?=
 =?us-ascii?Q?smaHlzbklpOBIk6lBoc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7dec13e-34a2-4cfb-0f96-08da85a9b3eb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 08:21:54.4902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y87NmrSb9m5P7TzPqMzBaPKXOeFO26x+dMHESPZzwM4hRRDRX9Q5uwru6cs9+t1L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3514
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

usb suspend clock has a gate shared with usb_root_clk.

Signed-off-by: Li Jun <jun.li@nxp.com>

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 9d5cc2ddde89..1417b7b1b7df 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -324,8 +324,9 @@
 #define IMX8MP_CLK_CLKOUT2_SEL			317
 #define IMX8MP_CLK_CLKOUT2_DIV			318
 #define IMX8MP_CLK_CLKOUT2			319
+#define IMX8MP_CLK_USB_SUSP			320
 
-#define IMX8MP_CLK_END				320
+#define IMX8MP_CLK_END				321
 
 #define IMX8MP_CLK_AUDIOMIX_SAI1_IPG		0
 #define IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1		1
-- 
2.34.1

