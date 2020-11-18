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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4095C64E7A
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 08:39:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7905624248
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 08:39:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="aVMxrY6U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgKRIiz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Nov 2020 03:38:55 -0500
Received: from mail-vi1eur05on2062.outbound.protection.outlook.com ([40.107.21.62]:54973
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726158AbgKRIiz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Nov 2020 03:38:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihcVT8OaeLIQ9RUKCp2p/22OS3w2U8/jTWV4VNJ9NWEsdtq3R3RL869tjjoloxX8ks2nWQw4cGnIkpELBOB3f4ahvysNzVG8ue++mBMnRlINpYldc9UxkwTBg7VtghXWRjJM4sE/c3VHyEWQPpEWp6TWKgcbuko9DxxBCY05oAbilShQfP4RaUmJGhdPuG0z+IN8FC5r2oDiic/1byyeqT1yMndk+HrZ4pZWyLdXZ2DfBvUndZd8L39d8il3QUWzcQKr+WkeKFVVYPWHuH9/4UUatdHHQ018P84H85hlw0wLyVQtiAiiVVkEAxy3niO/2dNWipH3yHEmRWZkoGOEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKK3XqQ1XF2GtJNzeyDirpXVgWa1KmUe4myZFl92IYU=;
 b=DwIKbDekwDyJH3l5P0i3xldFUqXDpyftcdD5D04uLGDU5PsPpP4vWWN9dO51zRzFLw2jMgDohEm+SPq8zyhqHT5PFbafzvnlENwbla4iKXTIxmZ2u+1mz1w+Bjhx5bd5V0xodK67r8ySKORpQEk6ZHKS6Qyvi0W7skKbbsTbN4ZzNvOpIfN5tRce+ZZl27gheWxSO9nAwL7VnhCzw4FzNnjw55jCt/yg+LJfE1fW93IQXhwj2jNu3LDtQZCA9I5JewjX3BN1o4horDQwvdERaTQ6VrRgQ2yv7T2+R3DU+MhM5aqeSdVlE/vNJF2M03hIU5HeyvUunL3NHfFiiawy0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKK3XqQ1XF2GtJNzeyDirpXVgWa1KmUe4myZFl92IYU=;
 b=aVMxrY6UUB4JxpHsv4+6YHnAIi/t5a8wxd97vTPtRcT+0FG+K77XmCFK5pEOunprc/MDsnsP3TT1rNsw7mTQdhG4zthikf+exVD48vbQOzg4CeSHtQAnQfEeVXOfnhtDFaYduSJmnLk3o8+DDOaRTD5mLJALFJC1UJrBUt5TTcY=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2528.eurprd04.prod.outlook.com (2603:10a6:800:56::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 08:38:49 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 08:38:49 +0000
From:   Liu Ying <victor.liu@nxp.com>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, robh+dt@kernel.org, aisheng.dong@nxp.com
Subject: [PATCH 4/5] dt-bindings: clock: imx8qxp-lpcg: Add compatibles for MIPI-LVDS subsystems
Date:   Wed, 18 Nov 2020 16:31:29 +0800
Message-Id: <1605688290-21805-5-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605688290-21805-1-git-send-email-victor.liu@nxp.com>
References: <1605688290-21805-1-git-send-email-victor.liu@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0166.apcprd03.prod.outlook.com
 (2603:1096:4:c9::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0166.apcprd03.prod.outlook.com (2603:1096:4:c9::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.17 via Frontend Transport; Wed, 18 Nov 2020 08:38:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5cb3b172-1da7-4040-5838-08d88b9d5ef8
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2528:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB252890C8A3AA7A3150682D1898E10@VI1PR0401MB2528.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P0Fxkz31skvOuIacgiydE5DsmwH/rl3XOFhjJjUOkNYguXsnQFmMCzQjF18uQb4JhltrX5W4uA9mTvMJpdBk2YHPGrXHBb0quDDMD0ePXHvcisUQ8Lhz1TPREyDl2irNy76CDeasTbi7tQbPM+dGkGH+9bloAeMCHRAxEhz6e/wElDGJs6btkE0IdSRgk2HcsOgZgGWBdvYbpCsjS4XXbmY5G7RlX7Q70j9EBIecpkO7+Tke4nbawAib6JNA9n/ygJNa9UNUzTNbV3Nw4+Mtj8/8yNswWXWUGJBMkD9CcSRfLzXPHBJzOzwiW4tLUAQ7jB0ZL6b52ePH8xCuzsXHpzmdyBJHaMewgefqQdeW4LlqeT+ZB5Km7iUfW6yCFqkvHCHue4D3vGvM1iINP+5KTsQJNQE6IAQWlMcYPjRO7n0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(2616005)(8936002)(2906002)(6506007)(83380400001)(36756003)(86362001)(6666004)(478600001)(26005)(8676002)(6512007)(186003)(7416002)(956004)(316002)(16526019)(66556008)(6486002)(69590400008)(66946007)(66476007)(4326008)(5660300002)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: BsSISv8D7K/yxbzSaGEy7KjsYTkTqsxbw0mS6GuBvMrK/XMM4lmQ2zirlkkrVfI9WC7M+Rz8FwF8QfQFiVDipRKaLyUVpVpI+5h0V0pUD500XMagUaCq8kHsmYzSELdQxq1SOi08o1+zde5qoAt74TFxN5vMe7HOiVjJAftIDmZfguQhF95ylZ54us+Z8Lj/8hho+4+MtMNVURFb4iJ6ajy1OYP9NHOhYM4kULoq5I27ApAEl+93kFCy/j5Q+iiVhYFySXFf8S371c1LHjScXOTyBa5AuY65BdUsgqqRyYMU965Ffa68xTXyNKlqaNCLl9WbCAfisXBf/KjX84gwUPv+P17nQfD3ZYRww4ZWqdzNn6GQCNejRyML7mv585tcApE6G02tQcBhqeZcuJZIoKO6vkG005ROiIE0oxUjSgRRK/tdBWFeLk0pXPhQeUP4+M/lbGmWu3Vo4e/LgAcIDv3wte45KDil5rz1vB+vEjZ7UCZ0WEjLc4pDQzLIBn+5B9702tpK4dvh1+UYgS1jKvlDUok+9hWY5Qwaq3wY/VEG/1ffW7TUp8xCKZ2zO+VibmGtegMAV5sZRMPBotbuwWUY7o5vMWlooVYjXgtcNwuJ3fRITJIK64tGeDkAfdzFujfYczu85Hulzj1X1akTAg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb3b172-1da7-4040-5838-08d88b9d5ef8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 08:38:49.5873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZGd7Mo3im4ABys97+DdnfVZSNivNKhyS3+JkL1wDn32oP28h3TMAVlm0vRdhEAiIFgV45BrcdVbCaDfE6tlfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2528
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch adds compatibles for i.MX8qxp MIPI-LVDS subsystems.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
index e709e53..868731a0 100644
--- a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
@@ -40,6 +40,8 @@ properties:
         - fsl,imx8qxp-lpcg-hsio
         - fsl,imx8qxp-lpcg-img
         - fsl,imx8qxp-lpcg-lsio
+        - fsl,imx8qxp-lpcg-mipi-lvds-0
+        - fsl,imx8qxp-lpcg-mipi-lvds-1
         - fsl,imx8qxp-lpcg-vpu
         deprecated: true
   reg:
-- 
2.7.4

