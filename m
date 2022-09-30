Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD4DC433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 15:13:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbiI3PNw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 11:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbiI3PNv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 11:13:51 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2070.outbound.protection.outlook.com [40.107.22.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177D9129356;
        Fri, 30 Sep 2022 08:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnbX17iRo5/Pthg8VDxXSs1Oc0622nFwxfpQaHhoodxnBJNZPJPFjbnkJkjnHfbqiCggHyT3VuF9T3CWYfwuq2NRDeSNc/FGcYzMNWO0Tu5R6GlY7/1SyGZJfnjv6kJs2DWccNn/6USE0Jx5U6EiCP+WJ6oaCUBshJszmUjuE5cMqjjYIZvNigNfBhwcjLG2mMswHa+x4e/14e3RBIIQBgXB+WHiru+I0HpbKP1SpLA+X1TaWSQWwOQc0rcYKdUU1o6gaKiOyLU4bx3KBu14TxDx4JcLdjwDpFib2bRvsdJcFWRLuYksvLs5q7XdZ7yc4EgIty7UtrhVQ8ngBgXs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyUIJGmE0lcKg4ju2UqmmLGKTFDVKEMhlHsb2sdSGXE=;
 b=X4j8k7igxZimCpvbAzu6Cl3XgidrKotcaoAiI0/9d4hKC/cKQrygDivOsKbgETA5p34izmwnTL4daFfUUfR7PPOs9G6YDQKwHsdUoLJs8oyyTeE78YQdGfhvm8qIOIjort55NiH+5HYkZYIYkbA/5rk1pgS6vtlqpW8xgLjQItgmwevI34C8kEB1krGeKubQwMp2PW8uZp2OhraWu1VnLw5eceN2cAJ9xyc+7NEF+6wmhzBNv+TWHnyXEuO/xR5Ma54b+wjoWYDW8+l5MKYYOsY8eWMME/yhAz9MDDouzcd+FzQgKSeJ8TmIAUchpmouh9ZC8RDEzSPsXXCZSDFXlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyUIJGmE0lcKg4ju2UqmmLGKTFDVKEMhlHsb2sdSGXE=;
 b=qmF8+wlfwWo/UGtMDqXKvipz6zx2QQSoxFWuWAC4cz+64vud4Eem6l32xcXLEFzxbrRIrFKFvqVeBxZ79YbSTxjesqh40R6So+7hFDo+xURkdoGaBdxWavtoGhr1QYXnjKKriwxyJPNLUgDgDD9nx52XhKhvdq6dG2THXbY5H9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by AS8PR04MB8005.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 15:13:45 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::a81a:385:308a:b85a]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::a81a:385:308a:b85a%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 15:13:45 +0000
From:   Li Jun <jun.li@nxp.com>
To:     sboyd@kernel.org, abelvesa@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mturquette@baylibre.com,
        l.stach@pengutronix.de, peng.fan@nxp.com,
        alexander.stein@ew.tq-group.com, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: clocks: imx8mp: Add ID for usb suspend clock
Date:   Fri, 30 Sep 2022 22:54:21 +0800
Message-Id: <1664549663-20364-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9640:EE_|AS8PR04MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 369c4130-0b9e-4b7d-4ed5-08daa2f65e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b0Frk4C7+C17Jjy4uf2OeUgXG7Hs3qxo4Y/cbxbegEXdictyPxU8oRto6JHOAlsxKJ3yVNO623s7y8v0SgZtg6BJfrpr856MpZKVASsT3j8fO/GrhNfpgVN8LWah617Xiiwl7v6BluwhCcEKyPCA9fWUtBhAYjolie/7XlWiov9YE0nn9YQhhSPbV4KtI8y8snVuG+Y7vzCmzYfWmdknNXpGcRPwSOwGLDpwcZYaA8mJPPlJbIFSimvSEpATpsdG7AkI33AUxkQsbh9IyGkC1JD2JDKPqUlIkD1EoCvuEiYfLKLnDTvcVyH1G5SNtcdHADQCIaZyLCWwO1Ce+sjA2e9vaSZzLoKoUBMA4taT8g4MFI4wyG36LHbUd8xjE8XoTc9p5JdtAIHwN/zbe1f2NkRM+jLtOWlO4fdEL2OboITwRqE4oJKnL70cuxYlkrjn/QIwuhrG2ZNysUIcG4NhfYlGiHkqSQhUALIbI67rBmKj7O8PRPSfeoN2GCFTr/14PWUsKYXoU1ZOQch+epOqHwQpL2jiiHSUaAEwAEndzyQCY2v7uPuRUkjljxBMuokDho7xPlphvIUUoy2XOLQ4DKCr1RfHXF2GYH9asYAQhIjIJl0SwBkoXrW9283Az4d9oGEXzKNAXPW8JohNjmrTG6VVO9ECjfN+8IcSrBoPu5mfggLnLfJs2t8aQQfj0r5EAa6O8HlfYD5HXHTa7XgGV4tmLivpa0MrsvcQvE642H/dSumHdelq7vLgbD3URSrQJz1qp2UdXwK8TLh93KxUWCtgWFw8CHqvGxHBpXYU42g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199015)(6512007)(26005)(186003)(5660300002)(7416002)(4744005)(2616005)(83380400001)(66946007)(66476007)(66556008)(2906002)(6486002)(316002)(6506007)(8676002)(4326008)(478600001)(86362001)(6666004)(38100700002)(36756003)(38350700002)(52116002)(8936002)(15650500001)(41300700001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ja2jlBrPlLXjNO/FJV3c/pkT3dtnU1D774jBTjyIokgyIr6t6ZSGqETkW/Ly?=
 =?us-ascii?Q?6A04hdohCTe2MAfkF0kr68rNOotapxQcS7YhD38H8Ub5iIPGQqYwzscHU0Nh?=
 =?us-ascii?Q?yvfSMlObE14qPzPm6+fT19tuMO89z2CQUNYAMuWVrRKccT9Gjd/LjvTVbUn0?=
 =?us-ascii?Q?ZjrT4iZEGe/EZis07NPBl+RA/oMrW6qlfaEHWA2GHf+q2fMJnM/6HeRqVnDZ?=
 =?us-ascii?Q?kRpzq3zoPOO6HLaZhSmflwUMYkPUewLoMOEE7UoeXlW8Ljmb3c6PIBXVFqbX?=
 =?us-ascii?Q?B3g7NfWpS5MhD61H3VnOXR8/qFdpHHHTBwFkrzV3AjhzZK8/NSj/Y87zrDN7?=
 =?us-ascii?Q?/9tIY0udyhpqK8KMrj7Vjjt7V/86VlBuuURQuewU+2V3XNvkSFT/VEoxYswR?=
 =?us-ascii?Q?4d0UROhyMqa6ZPdmxqEonQsQtBiYTovH805PJFmhxGeoGa52G3DQPx6gx0BT?=
 =?us-ascii?Q?vXwh1ePTdoMv9F574xMzu4cb7eNCVWbszT62MVBfj0ZjlAWo5gXNF0NtAjCZ?=
 =?us-ascii?Q?a46G2hkzdAD19NywscTd5LtBbPfYvSRMqf0qhsGYV36eSoBX0V2UUg+aGBTU?=
 =?us-ascii?Q?RQmNfvB4Q3s9G4WB/mf5OAiMRUcr3J1+OKLUFmzdtNVUUwNtzxP7GxqcB76y?=
 =?us-ascii?Q?7VS1LxK9uz3l70l7X3VtNjPaCc0NvEDFKOVarzg3HsdQAN3ZOgV7ljP5A1cv?=
 =?us-ascii?Q?g8PzCq69fkYvOvAJbk0cmarCL5Rg2Aez9C1HVzgavtXVBIjK3FswFlWNCDhF?=
 =?us-ascii?Q?fI+69TJcArXAxA2LGy0+YR5tTuk9LI6wdd+7+DIOgtR++xwSiunzkwSayxlt?=
 =?us-ascii?Q?ZNheTEBmJNWaeUx7kssgSZM5BWOna+kYX+hWlUJUboIii/Wh9rM/9LaSgHjs?=
 =?us-ascii?Q?fZuUTu0k6NTm+SvtBZbW9CSIIa1oO3yYtJq0QtcvEhQ41ZOqXJKTYWww3GQu?=
 =?us-ascii?Q?Jb9NKpozyKSrUpQsyPLhItcF6y/IHvPOMDFPvpUqR3sMWcS3oeBlh0c5tDO9?=
 =?us-ascii?Q?TQ426ShFJ4N7CHGpNdeE8JGm90nUO7veZx3vCDGfggZ7iYG1cwLYyHzBRLF5?=
 =?us-ascii?Q?xowpSNyj89KfMK0RqtHRDFIimElfrAmLTimL/NVqFXD9I1rptw2dFInKnkKA?=
 =?us-ascii?Q?RW8e+IdS1Ov1h1y1oySTXgI4ktxqHEW3fzMO0p25oxJQoIkTaVksVnQaEnT9?=
 =?us-ascii?Q?0zCJZZtBY3D0I22/UN89ZEm+TXuPEe6TFeEoZl9+cgz0vCwR7vE52OIAydsG?=
 =?us-ascii?Q?JgHNSB8bsfLrnLUzkB+K5nk1VM7XNCY3ZVKBkhA4he4xFq+V2b/iB43Ppy9P?=
 =?us-ascii?Q?6zVkTRdqrgRqwzOuF3xwwftYsiCpw86IEStfqRjvxYKOZqeQ4WEoR+iRCIEc?=
 =?us-ascii?Q?FUa8LpII0o5+3U+FHIZPtKta2JeQ88E6LfqVGSNDKI55Z7479YYloGGzlqZp?=
 =?us-ascii?Q?ks+lkjomium4XEIXqRFpFoUZAnxAl8sGogpfiwfuvU1XOdovh6njR13tO7rV?=
 =?us-ascii?Q?gUjKp8Jt2v6L0UCi4kHR77oGZxpamVRZyeMG0B7x+dlRkINqORHXv9G6QPnN?=
 =?us-ascii?Q?er9onq42Hkmh2CBcVYzUcoWqiegxqqfYcSXQ/jfM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 369c4130-0b9e-4b7d-4ed5-08daa2f65e44
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 15:13:45.6660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNrYuUi7x4A0yXQRhA02cjThfvJTPNEEZctBUVcZeqK9qOZcOpjqFBTYjh9gm93I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8005
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

usb suspend clock has a gate shared with usb_root_clk.

Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
Cc: stable@vger.kernel.org # v5.19+
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 include/dt-bindings/clock/imx8mp-clock.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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

