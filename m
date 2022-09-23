Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2808CECAAD8
	for <linux-clk@archiver.kernel.org>; Fri, 23 Sep 2022 11:04:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbiIWLEV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Sep 2022 07:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231998AbiIWLEP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Sep 2022 07:04:15 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80088.outbound.protection.outlook.com [40.107.8.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5353B1162FB;
        Fri, 23 Sep 2022 04:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q999k7TnPV+a5NqWEfKUJaF0BOTFuEnmwKTfXzTtFoAsI/xln04tMnclcOMYxKKkRdlTJvgWfUt71rI0y76mhUomIuc+YGqGMLFAVbar9WC06pX7KRJ0u4LOB4yDFroPDqGkiJDGsHTVlTs6oqAJHZ2Xfez3AYKTOacbAAJDdPQgch+Ajl6pA1WPKAzIo+KDTLug08xr/9RWkdYz5/wG6nwKNVrwoZWn5VyW5aerhL72Knj1qRQLtnomyAs9OVOev6p2m6pkX+4DLgXiMb4jfqwzerZObLT1rycmhbsp3xDODsUhRheqKasb/yLEx77CF3fyyU1/hYOf89j5OoWE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyUIJGmE0lcKg4ju2UqmmLGKTFDVKEMhlHsb2sdSGXE=;
 b=QrAgSFADgw8lfVcg7++aLEs5RT9FgdbeksqxuGm+kV9vgc6k5+FAAlqywEZg4B30Rea3xq7V4OaV1TeKS9aQoXhjW5se1HsgjU9rwyRcHlNrMWtkWmETMQ8DBm+cSk6zMxOqTxDor8lyWSjMngOR8WeCVlTih3CvS0ezPu50YAe+cDLKHu2rpvi3kL+8Xjzn6xIbF7NQUN8vluK1d5zUmhep0zo0/VUiTjWFuJZHSm6u64o9gg+ZpQ3UCgbNDnt9f4WbsAej1Ui0GJ8rNjyQFUzs3S/j95r3V+3GRuGDJ9WXBJEB7Mq5p33WPjMdUBPaRbRKZ8/V7Xc3Dx5t2f1xcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyUIJGmE0lcKg4ju2UqmmLGKTFDVKEMhlHsb2sdSGXE=;
 b=OwqhZMRvn4q3B3cIAxcOAK2rKR96a7NvdCvowSYGLZCo/R74sCr9nf7uiqZ5xBF2oEmoHgC116qAVAXAbU+X4Az+wns38VE0fOpftea9TnVdqFmZ2NRQ/aCBtoMICyKQnmUaD20G3pzGmnrhau2qkgrDaXRRcUJXRL1w3VoI1D8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by AS8PR04MB8882.eurprd04.prod.outlook.com (2603:10a6:20b:42d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 11:04:04 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::4ceb:3c8:9764:6dea]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::4ceb:3c8:9764:6dea%6]) with mapi id 15.20.5654.016; Fri, 23 Sep 2022
 11:04:04 +0000
From:   Li Jun <jun.li@nxp.com>
To:     sboyd@kernel.org, abelvesa@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mturquette@baylibre.com,
        l.stach@pengutronix.de, peng.fan@nxp.com,
        alexander.stein@ew.tq-group.com, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [PATCH RESEND v3 1/3] dt-bindings: clocks: imx8mp: Add ID for usb suspend clock
Date:   Fri, 23 Sep 2022 18:45:03 +0800
Message-Id: <1663929905-10492-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9640:EE_|AS8PR04MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: ed131d19-8317-4ded-9171-08da9d5353e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q1vgUKpLLeHNMj+W0Vg41R0e27C9TYVbfxh+yx8YBiTcwAUAmlDeq0OXUZ3XFCSdpQQLxr6n5loF12apgYC8ORUPwrgUT1oTJ6+rNnY9LXd7zyiU25mqq1EUw7QRtfKo5NqWamff69mHSguPUe+O/+0qUbZp1MZq2j2uESPCBn4zoFDTKXT1T7ZVZJogIzAmoHFiHXnDdtri6ZJBcCe9V43nWFAhpkrQ/OsHzxdooBrGDd8orKVk0yyrFFMsUBZmBgrk7ZxO3kAfjl10KdgV4SCknDmsyqJMkouP34PpmYR1yCo0rrEcMinKrWwuZXLbxoQXXvwZlp+CBvyUqXUkxCA1B+qyF9NKNBVDZSvWxeLHGQ1BxZGEDnLp1yXVCWziLjS08T2y70FRvKqi4vheIiMKNFSg/+YNgcqMLBnfFrupkuY4gWg1GAfpI2bk+8BRTSCtXyzrpErEECZ0JC0qx2LFcqhk5/KlYyxkRQJUZPhLpGrmJtD4f2uAXXKSbAgQ7mv/TaUyWirmrEtIo1cX+ZzFqlHkx9QgI2Mh7p48fzZhO83d59uM7TsSKDLWkoH0ue3wiZlDQaS8lDrAWek9Y6KpLgJrm7qnT3V3o8OkJVoTOq+xlUC9Hjs7+Cv5aIJC4bewDIl0NJb6V7eq+PctUKFdOSt1wYCG+WCKwLIQ5S7yuMIrMKLXiD/zNUlBCcoqpjPgxa6djpBGK99Ku0eeZW5LrfaUk/qN3T6BN29OKVFYCZ/B6rjPTp06ADpbH7bQclA9z6ksg8JluaKneLncxGIsGyDKXUnjyglRInoTY0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199015)(15650500001)(2906002)(4744005)(52116002)(86362001)(2616005)(26005)(6506007)(6512007)(6486002)(478600001)(8936002)(41300700001)(7416002)(38100700002)(38350700002)(5660300002)(66946007)(186003)(316002)(83380400001)(66476007)(4326008)(8676002)(66556008)(36756003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NMcvDcY6QjizqVGNgtMNnbZ/czjRv4wcj+KNXB0R7hXqTWvtXjq4J05IzdtL?=
 =?us-ascii?Q?SgU2DiecsM7SPyYZ3BnS0l7EW+O5vy50Bw/0iF6GhsFRBZ9/cMiiMVHoNecc?=
 =?us-ascii?Q?bYM/GBqFX1e1GcjMNehk/8qz0Zo1qoutzvcQu1OSspe/aR8sTTJ6UK7ukMSP?=
 =?us-ascii?Q?3L50Ua9YI/Bw+Y7JCF5zA433BAlQl586Afd5zGGkXM8vr5zihgHU0fauHyKb?=
 =?us-ascii?Q?gPNrW11+zXjWV5G5jdhmyJZbuHF/K/+2tICf3iWD4c5fOI8v/5YaKA9o2wJg?=
 =?us-ascii?Q?j/Ap/OKyqpdJ3gbLQZ0qXQkM0NOLeqHM2dFlqaot2Kk+3apP82W3SDsw92RE?=
 =?us-ascii?Q?FwfZmH5e0Hnl3CBO816JqHwXPqsm7pJcl6nzydneCepI/NfY3AQA2VEVDExy?=
 =?us-ascii?Q?9tzsSBfpcFu0eYXr+l4OmrLb7/4PHr1kr4ew8W4+LW4ijI5pDQ8UPhOmsu28?=
 =?us-ascii?Q?Egu2NOi9t9kEDeiGh8NrNGF69oooDUW7d8w4HZqJcG3TV5rNa8PppFj65zmf?=
 =?us-ascii?Q?Io8fNjhNId6qFgT4idWOEkW4oWi9Z7ls3smT7U3DTqn7skFeVPaVPIFbmUMZ?=
 =?us-ascii?Q?3Narc1g50ToyJCQl3W1wqps7f3qTp43lOoQos32KqluerhnJFwzZvxa78Wtr?=
 =?us-ascii?Q?nIiakJLbFGSP6WPxMLFGmE5hEKLqKz7nWtWR3eqwr9MABgsiC4I9Y0Reokhp?=
 =?us-ascii?Q?vkYPbNBeHnogQ/sNDKpSp6cFsuXrBK20WqTu6uIMepwd7uedBllJFmU3nkQV?=
 =?us-ascii?Q?4y0EFSqaIk/x5RPXi5zyBljKV3LdJF8DyL8d6iAzTaCrKv2BMljSrOFrRWoR?=
 =?us-ascii?Q?2J6LwTlrrSgPQx0nbxbyyJQBsODNoKZfc+1wirLgvNkuByNKpRwaWoGDYdM0?=
 =?us-ascii?Q?c0lUljKkWkKKXP4qJUwX+PSpmEWb4qzvG7lkoLEAejYcz0Etzt6/hKeeXn/E?=
 =?us-ascii?Q?oJ7bG6oiaSE+M9X14dbevdH/tj6y+8CdWUDX5Gu0vrBzgGx4ydWKS3r9Eimk?=
 =?us-ascii?Q?DoEOS2ayntC9ZrCZSUnzs/dQTl/pv57L4H/eVPnPYwHAqp5mOqoA6jKCziBP?=
 =?us-ascii?Q?W7KmMunhXJG08QOXm6Kj3FyZ0xIsp8peSqt3IqVpevObjPTMMaPnZ6q5Vetq?=
 =?us-ascii?Q?XYSNXYe4j3Zxwk5wK1DUC0833qWMb6TrYU3GiQVZP5aV1CsYhSoCP7eOTVHB?=
 =?us-ascii?Q?LHRgtwCTQr7LRFYIXqDoNLXn5XKT8bsvZcgztiGHPf6ZA3zq+iZ51Mlz7KFx?=
 =?us-ascii?Q?tYPrf01r+OQBP/h1KzJXdLE64RGo1YbM0nMj/b4deiqscvQmBdEhxzMVSxoo?=
 =?us-ascii?Q?0E7tUFClDyFy9OeUdkV1Ixl8ZhSQ91xK/kci7lanhxokDfGiBg+DTkTnnNZR?=
 =?us-ascii?Q?vE9lFnYQfFaHMHHQqE0aCDd8smMpsFzsVKXXOoB7qD9M0N+MI0K6Vc4mplUS?=
 =?us-ascii?Q?NnUEUdIU1WEZ6ndHgnamjwM1+XxHh939VrmK+HUWwgKIwtJBKyetbttXMm+D?=
 =?us-ascii?Q?iSUah1gwtQhk6k8yhUEiFH6QGDIgr/Ty2bjseQW3VYd2s+M2EMrE+j3Myydp?=
 =?us-ascii?Q?oj0R8k6evFz1/Famhjw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed131d19-8317-4ded-9171-08da9d5353e9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 11:04:04.4990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hd0veOpr+dyzqu1vc2uzuh5x/mWJeGseFDi7G9Au+Bin2tDiE3m58s7kA0V9ktXo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8882
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

