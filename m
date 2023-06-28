Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4F6EB64DC
	for <linux-clk@archiver.kernel.org>; Wed, 28 Jun 2023 09:28:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233087AbjF1J2Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Jun 2023 05:28:16 -0400
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:50496
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231142AbjF1Hzx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 28 Jun 2023 03:55:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coI22secl6fc6lZfw1Sc8ZcxQqHv2n7WQ60fClKprmTVxrcTIHNJ8nbZtIdqX7l88X6sUqWKAZVU4qQLpS8lztkTeaB7AnIyRQVWbkkqbbNZVXbn739CYJVRXKW1AczrXD25Q74KZSy6CTj+0t7u1ion+A7v/bmArhWtnLQWoawObzUFIt/3UB/MJOxIKWvJDJIhVdgCcZZynYYgg/+pMEj/OaGSAfT1/iEaRBG4BoyEw5kbzUEx+68oy6ixM2YGzGdv7s/3nvWbGwnb2mX5JFfQi2raXZN/6cLHjPPJZD58rAWGV2RiZarKCfILtarRTbO03Ibmkw9+IwiaBbAkpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuGO5niohB6vqOcrdWMbpCEh5IDX9dCXOQanNH8P4pw=;
 b=S1dG38q7osp61fqN6+h7kGb19/kogVhOHas3FHoQ5IeWG53CPXI8OkCOCKeeXI8bJ112PgjwZ8NWI+/VjX4qnrC4NIfFDS1cij3YwBRahD1MbUURxVqBbHRgECjJxV1mAQS+eNYdJ9eZt3TO1HQ2Fb/8RfI5/9Ehkn6RoPIACTMyN8sJFdd0DsEjWS9jsnWz9fnskWVJOYDoSLpzp+Z0NS0B5xOYnyNsayklkeJ4SaOTWSIyXk2/A6ZO68/sd2PNleBRJp3ioAWZzofY0sBNWo4O286uL9u0Mgr/DSHuF6ed7KWDqO65x4SaIHKPphtzG60woOBolOLKbgCC+5AD9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuGO5niohB6vqOcrdWMbpCEh5IDX9dCXOQanNH8P4pw=;
 b=K3LYMjWeAti0lCdxHIp+Rhi7FiKx4ZB7Hbg6ZAXsFdE7oYHG4j7t7kTbocjgStbIedpEeUY+ATA//3Spkvbd52+mMdzerLrpSBcVEeT7y8dMdyFyU9SokQNZiKMZNK5GcRm8pJRpqT5qzA6NAlb3Bns8MENZbrtVRB5UrS06FKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DB9PR04MB8314.eurprd04.prod.outlook.com (2603:10a6:10:249::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 06:14:10 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::4ecd:8d95:3543:cb6d]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::4ecd:8d95:3543:cb6d%5]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 06:14:10 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     abelvesa@kernel.org, peng.fan@nxp.com, sboyd@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] clk: imx: Add 519.75MHz frequency support for imx9 pll
Date:   Wed, 28 Jun 2023 14:17:24 +0800
Message-Id: <20230628061724.2056520-3-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230628061724.2056520-1-ping.bai@nxp.com>
References: <20230628061724.2056520-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|DB9PR04MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 8baaff5c-6a00-4412-6c9d-08db779ee2dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fr/2mdhHHsbbWKOEgGECuUy7SPqRe5NBVzNKN+UM//rOSKX23BqGgpiAa4bTLaW6De4Hmw25ezQUCVgBm9LbRWV7o75C3aqkTpGct0skbnKwzfNj62znP4kUmNDfCvmk04CslOtoBJ+3VPlKgO3QntK/tjiRvG40TtI04qb5h4FDydyQxo5h6e4Y+wwWs3MMnJ79/zC3K+PYkLdkY7ko77WDqsj8HaO9Vs1yW+usTnxLCotG+fFwdlzuSwTCyu7AhPLzYtTY8DPec2Ekzu+iDE8PmN4enZ1f5BEpGx5kVR40PPRBQ2oHvbxWIg887o+tdf3hW2H/jzVNb7kITNva2O1vu0sNLAS13kqNBvaLvSLhJCfvtmmuTHBplzCZsJxhODToSFuwKOobvWxT3DnVoyRqCcBr4VSaLmj5vTLDPdQi7ingECbjaqFY5cP3YEEym6mBViO5cuQFGTF4FgQHaj5Q0K9oF1LRDRTKtIvanhsa8vJehmI8KDy72Mt2dJDN3esNowqY+xU+rwXUUgO57tNXyGk/wyayyJgBpzM/ZXqpxrzkszekOTuTfA3oBogik/CpD4EIlW9s2wsy0DSdu3A10Io7uVj1LBH4ItHags1H2W5NRRf7hwIf8ZFUr8lO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(186003)(26005)(2906002)(4744005)(1076003)(38350700002)(52116002)(38100700002)(2616005)(6506007)(6512007)(5660300002)(66476007)(83380400001)(66556008)(66946007)(8936002)(41300700001)(8676002)(6666004)(36756003)(316002)(86362001)(6486002)(4326008)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nYcOU6YO2QeMs3NIy0Mhj95aTIBJYlwLr7kXUSn6Gtqwn3ERZmh5y2/wrCzY?=
 =?us-ascii?Q?f0/RVJ3WLEomlm6dnYbIg4HtJlc2yx3+HmQAcUmLe9sEkvCTEZXmClRe7OIm?=
 =?us-ascii?Q?epailHT6ezEOFe+bZEKj00Jp4bKkOWoshNIADclGv3jaGZVi5bWLDZ/Eg3/e?=
 =?us-ascii?Q?/jhXVtc73BGIrdWxBRXXcQONBOT4+azgz5nhMNjbf0mgj8wVY5n1MML8VOtw?=
 =?us-ascii?Q?W65rGpDx6e5u3w5KWr3urGN+zwSUEE+4X2ou2+YGcUAt/ZJrhqG6oR+nijct?=
 =?us-ascii?Q?KzbyxC8ET2cJe4/qkXQ77Hsp6uuB5BGMTA6dU3QFDHMAa3mLYmICAoy3bMGT?=
 =?us-ascii?Q?OIFJ87mz7nOFVaQNPfdODWd5BdcYdFggjjmVV0auF5d9Ghgy8aDTyUOEcWj5?=
 =?us-ascii?Q?Pdom9oB875+xtuPKI1hGqEs9uYWRt/wJUch5IAmAlTDDJTwxkYS2hefa/q5D?=
 =?us-ascii?Q?BsqOZEud5onK/AAWr8Tamn4HQQmj3RHtThAjmMDLYLrupJcEjgvc37nLL5WZ?=
 =?us-ascii?Q?PKmWIuva9ZX6IFGrb9NKt3RRv8H3PIjdNRZ2AMootDeTUs76F0G9HBTZAuEf?=
 =?us-ascii?Q?fVeBgvfwy/ObtjUGnQTZU+g/YHg+N9OYLKocQjZS5PSmjIqlyuJIJdZ+ahpS?=
 =?us-ascii?Q?2oAKRhndFO6dUhHlzVY9bFVpMyhKcELcprhttU+NeFGqypytgV3l87uzcMsI?=
 =?us-ascii?Q?Rg988hcm7xAB6Jo+rMzj1I5cgOx1dNpfCaNqCqXEWyCdVBqwlHDRkrPIOnRA?=
 =?us-ascii?Q?VQSfQxJ3p9Ugd5D6407KOYLZbPLMMyKInrqIdi+kB0JA1A4alV/390vmg/dd?=
 =?us-ascii?Q?EvoYM6omejO3HZvTKVhYrWxKcuakQn2YNgCzxY8EoDEo+JzsyEFd1EXCPvMD?=
 =?us-ascii?Q?sa/IEo3n+rEz+kGwHMEqtYK5/tanUs/1RfffdMMLG/JNeP3opncxMSaTUYJo?=
 =?us-ascii?Q?PdLMl3UaDVXZff61o3mRAEnZEvQeoelR1jJTrZ+s5ax/jfp+ERAO3jLwb9c9?=
 =?us-ascii?Q?g6qukRy/eDDKw4ekP/9QVT5LM1WfeRBAdavikudmR1BJ0+44DQkMiOpy9+u+?=
 =?us-ascii?Q?oE2xrQVz5r0arXjvqg9GZAQWNvLSthcxBInp21mDQDjvjI2YYcRxQJlRjXJ+?=
 =?us-ascii?Q?2Tpr0OynEqlENOS7326yuBwbCHTthk8eQa2cZvz+BJEbqA/fmapu/Bz/EfZo?=
 =?us-ascii?Q?RLvGiaGb5xb+8JjtbmpxhVyYtp0sidyDHGXQIs8JeEyeuX+/Pa8HP7CfmnAv?=
 =?us-ascii?Q?JRfTiRFT6a724E5eQRM8wX2+3JUUYbvcLaavW7xwbXZ/gj5a2CDD0l5Kt2BE?=
 =?us-ascii?Q?x5mCPq/3IlqQO2xXXrhphWqibc2rX1+IC8Nk/zaib8SpwXSff+d+z4f/ZlOp?=
 =?us-ascii?Q?q+HCSzmXdNXpK+dTHRYzsm8oY+OQkEpcnaB+jvXD4Q2bkrZn9cgAYsCoo+72?=
 =?us-ascii?Q?M7DzN1g5j3b1lFg5GtD+QQcSUNnUJn4bPRgVdCWUdbbiswDjwkfoGmvKbp7p?=
 =?us-ascii?Q?+khGKLUu0L8da+xX1fD4W5ZMHK6DWxAm8VUllK6OcZY9oQs5kVHLqBJYdLBE?=
 =?us-ascii?Q?+imMw9w4VGxXSKlVpRTqNfWrYxj/5D1SHALOPMiw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8baaff5c-6a00-4412-6c9d-08db779ee2dc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 06:14:10.0788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4i5rxUQrCnAWaYpqLRU7VMRDvZ7eKFF9XfD/XvQH/qYB6qGYnEV6AbRVHRkn9QHFerfbpYoVB7EL5/3zDo0XRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8314
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

For video pll, it may need 519.75MHz clock frequency for
the LVDS display usage. So add 519.75MHz frequency config
support for video pll.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-fracn-gppll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index c54f9999da04..44462ab50e51 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -81,6 +81,7 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
 	PLL_FRACN_GP(650000000U, 162, 50, 100, 0, 6),
 	PLL_FRACN_GP(594000000U, 198, 0, 1, 0, 8),
 	PLL_FRACN_GP(560000000U, 140, 0, 1, 0, 6),
+	PLL_FRACN_GP(519750000U, 173, 25, 100, 1, 8),
 	PLL_FRACN_GP(498000000U, 166, 0, 1, 0, 8),
 	PLL_FRACN_GP(484000000U, 121, 0, 1, 0, 6),
 	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
-- 
2.34.1

