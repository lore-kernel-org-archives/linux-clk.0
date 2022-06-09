Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C312C43334
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jun 2022 13:27:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343647AbiFIN1W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jun 2022 09:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343646AbiFIN1U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jun 2022 09:27:20 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C5B4C790
        for <linux-clk@vger.kernel.org>; Thu,  9 Jun 2022 06:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMUmabrQ8D4qheO+cUPPL/5hUPb9ghpltHZTZ3livZWQvPp89sd4YV7DcsVPnMjNeyLsiscO6ykJywarYdL86v+5cCmzFvhhmF439febL0JzniDYR8hCjjrQGdw6CGEaQXj0ecSuePamF1d/+jxOEW8U/wSTC/VvWXAjwGaCyjC2NjJ81VJSuP67dJPLobcIH5YmDCCE18/1rT0QnDjAdV96loY5SEWJdzZavxGkpcxwTCRJ9nlTPrzXI+JOwbuToju5Y5bMJaDlM+Cauq0iTqayz/KjlcKaAvPz7y8/6pAbQctZ9IZTsCqY2iTpt5UB7NHeraXIJ06/Ura79sazKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBsg5/zz4pa3oCBojoywGXH4M60E6queiUYQ1K5GnkQ=;
 b=TmKHeFQ2ccJYwXFk0l+sEREhiXAzNscZLEEzWHfym8x6WLJdoPZkUmQCq2IOw2Ilx6PUy5bRgcxrL4nnniXNyq0bA09iDTO0H40ge3dBv2xAXRQp6Imxmk1SRCsOVFZm4pcvndY+GPzy4aBdECKfs0C4Dl6+8mAQiUx0V9EHH4/8u0ReP7OrVqxRFO1EMo9zXrTkqgqIje0jLS3RXr97cr7zBGKMozuPeZEZqErlgoqKpHxHp9+wgGnRzWzRlJ/Fr+XNNGVjrKOmOjghYfFiwaTr526LoDtsy+IyDBqvEzopgADbI5Z50FZ3Aia1IEMvdYr5QL1brafelCCjHr+UWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBsg5/zz4pa3oCBojoywGXH4M60E6queiUYQ1K5GnkQ=;
 b=MC5D/WcFyRlxmjEjRWQ0DEa4a4Z6lMD7JjXW5AS2lIN/RhxQCdriQKgbcj2IMdAhPG3gL5mjIXvBCMdK5eqF/BefYri02m2DtpE3X3Kk6HazrICE5+juoMXrXECgifROyNpGGN8+SroA1/MOUylB5i6a3BDUZD0wrqESrFLRohU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8196.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 13:27:16 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5%8]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 13:27:16 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/7] clk: imx93: pll/imx93 fixes and update
Date:   Thu,  9 Jun 2022 21:28:55 +0800
Message-Id: <20220609132902.3504651-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0209.apcprd04.prod.outlook.com
 (2603:1096:4:187::12) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3259baa4-17fb-45a6-8ee5-08da4a1bc517
X-MS-TrafficTypeDiagnostic: AM9PR04MB8196:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB81960B44B4A7D6AC6EB3A3C8C9A79@AM9PR04MB8196.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y1GvvzNI0TLN/39IqEu4uF1j9cQoNl5xr75bA0jICxphPQCVcoR/nuVQ6T/mbWvJV2Tr1m4iutp0kBKX++AaduFe7vbTTwXXURkD1243E+V5tFMvTCKbsElZAnpilxH6HIeu0u8cq+hraRglgXJ794OG62AZ/mYhKe17xlZCryAROnJy8tnbNT3HwXpu2zy7VZa3S8Bj9NZidKmeqMBSLMUE/Au145UK4jse0q8h6msLHp/xz8LQWFHvGB+Y2pV3KQaPRw9eXZ2sTYMoNK5eXxqhCUtNnxxKJDUu2+XKNbOuIHgO+z6yVqAzPR2WxKefiqMC982npgeOwGSpuv/D1ieUvR9TfZqwlC+rs+ylSmtYShgtu0xMASEWFZ6GAA3rFE8PbJ5S2uSwHRAMiVtFb9RFy3YG6ReDk/ckPRfOFCi0ii5esDkkFcyJTH7qEm9SCTvKBJM72UoqnsD9b4fXXP4CeVWHvNHpRkMXcoMMB3lk4KhV276EKjCQDasrvuBuHssUedOJgJleFxNaM9A0yAepJvsJ7p2VWecmg74hQnjSBfQQyGA/+RTCXI5J+lyFJpW3mmyIfLibVeK2GMq2rkiD97jrlAx4PrsPdvfx9+b7pScj+nOQvacdlAIOOsU5GzC69zKtYc1NeIgTBrvry0dYo4Q1ot6//RiBV1yH9gNvq61ywuI4vcGINVst+hwizmiowk0ZX7rxWtxSqlbNxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(83380400001)(86362001)(38100700002)(38350700002)(15650500001)(6486002)(2906002)(5660300002)(4744005)(66946007)(66556008)(4326008)(8676002)(66476007)(8936002)(52116002)(1076003)(2616005)(26005)(6506007)(186003)(6512007)(6666004)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RZrjyD5X1xzH0Fib8KDTRCQyg+x3hymQXGLo4b/0ZIBZcjlq8iUEPqNSW7yt?=
 =?us-ascii?Q?iWYu/DIo/A9XnOM/I9yy6/louA10Q/pEOM2p3Dc2vzvkEHwtYYodyyq5vvMJ?=
 =?us-ascii?Q?XtYoBfp1oDH/8tT+dXDUqQpVeHa4gq8m8BgZZoSVX8mGWsMQiJ7ohZs3L3N3?=
 =?us-ascii?Q?Gb4vTYHJjzOlVN2QIiAV/PjvwR98Z7VgyPZRV1jcJI9v+wCz5vNDXXzGmcmw?=
 =?us-ascii?Q?JCBivkslaeAIaYgpudl0IsW7hJ39/XSpfW0C9ZFA1SJ2eC13CLlo+o2HG9p1?=
 =?us-ascii?Q?ctqnKBJM681pylSdlmavxSxIN8GxaPEQ3+JNzXNyyNWNnhqmz/lybGuAWg/F?=
 =?us-ascii?Q?uKkX8432UhpXX+WnAs9tkibZd7Biqx6Zz0l6iFmJ++frLbNeZebdQbbuoJTc?=
 =?us-ascii?Q?ujDaZ4nKxfFBaOUvnYv8fXI6wLQ9WlOEDYnmkaN8a4nZ0MNDiKr0jEgiP3n5?=
 =?us-ascii?Q?I9PbokW0BFi2FdiGfOuq+Uq7D9rIFbc2CdwQXcoe09BiGwq7B5VXbo68zd5p?=
 =?us-ascii?Q?SmV3p29+uDaWDBS0FnDlOH6VpI0kk02OBxfLE+UVERJLs71jlMqhBbMZJGOG?=
 =?us-ascii?Q?bXGBnB4wmJMJuIYzmZeQgZNJe42JxfrI8fCbOkw6FIk7aiwA747Quw0RBsI6?=
 =?us-ascii?Q?aoS9PYUMoqwUxSQTenukFKinn3IuezicjGIFgr2famp/rFEayt5+s/z7h2Oj?=
 =?us-ascii?Q?bcGpQsdaWCm/sU2pcSipW3A1t8Dis6QxXQxJTchwrjgxIb0hA4Wz8miU1s2J?=
 =?us-ascii?Q?3EeIrfJKu2j1pB4KAGo7TsmsKnvK6lE6+Yx2g28taPEYISZFuIscOf3sCQil?=
 =?us-ascii?Q?WRsGOrI91SN31HAxFvSLjAtCqpVsiPKPkxOV7r+oglVV8qFISWHJi6ydmk89?=
 =?us-ascii?Q?xyUM/dSRetC2+7riADDOeNWmMNzkN2C3fu1zpxIQwHNpmWiWMiV1IC/4yD9l?=
 =?us-ascii?Q?cQyTzasknr2bD6N4JEOPkpxoiWNz3bULQI6coLu5NMB6uEujT8QiFa+I2wCO?=
 =?us-ascii?Q?P2azUuGPSiDCL+15Qbt5Uy9rDVZEGBoolmqKKd2grSDY/TaN9BIG+TSpFdgi?=
 =?us-ascii?Q?rLKxqFZbz2tIuRdaCxV5P4T0pii2BCKsqZWzoglhdUX1BYb2549IVze2Kc7T?=
 =?us-ascii?Q?lwXruDnzv0LrxBq7f9sI8v/9LnKSsqsilsJOCzTqIrO//I4pzK1D6cR/dc/k?=
 =?us-ascii?Q?lhnNPrn5p1qT0AiPm5WQf+T1B3X3FJ3cY7pDY6RByo/bciCDU1tqdwzd19nJ?=
 =?us-ascii?Q?+wMVG6LZ5S5GnRsiHWyUs65J0aDx4lmW65ZBvXAmr6HyTAjE3YkW/z9qP6hf?=
 =?us-ascii?Q?lh6fXyaY7TcO4bYKspSq2wCSAh9dwwTaCuj7FMxZ20ymRedJ8I9p7bp2APbj?=
 =?us-ascii?Q?n+Y7KvC4NT3R/J3JNGpQ96YNeHkK8098RrlYdxO2ND+reRIMbuKR2iNFAIVz?=
 =?us-ascii?Q?lTDl4i1h4SiYJh7P3hZJeyNIB4QjdD9DPBu/h+NuUTBU8TJnDhT2PYQS3u42?=
 =?us-ascii?Q?RKxtRwn/0dGimlSe84+4a/XT5QSMC+rTCGdXaf54Mf8I5xuH0jp+Kh8Hlzis?=
 =?us-ascii?Q?qLVoXVUkGwpLF5F6Lg9N4tmW6x1izg41uB4gvIjRJUZqc4Z+M1gSmoI6SZaJ?=
 =?us-ascii?Q?xM3H1OLh3sMaaO0D+6KEJvSDEvQGFP+YsIGBf29ycp/SwuTtPbw83HjbOhlr?=
 =?us-ascii?Q?Ju4qhp/YX5PmUd8E178a9O/DpnpS3Jnt//g2SSy2Tm844t17ZrHsjiL+vIcC?=
 =?us-ascii?Q?cn1EY2I7sg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3259baa4-17fb-45a6-8ee5-08da4a1bc517
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 13:27:16.0698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUsNUPdqo/3hvqjEgib+dGWywIyHvGiE3+vuCSkQv7oDbIWZhULuKy7FkjI0vT4kYW5LcIzFfSVPuFACKlNorQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8196
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

This patchset covers a few Fixes to pll and i.mx93 clk, also includes
one patch to update pll freq.

Haibo Chen (1):
  clk: imx93: use adc_root as the parent clock of adc1

Jacky Bai (1):
  clk: imx93: Correct the edma1's parent clock

Liu Ying (1):
  clk: imx: clk-fracn-gppll: Return rate in rate table properly in
    ->recalc_rate()

Peng Fan (4):
  clk: imx93: correct nic_media parent
  clk: imx: clk-fracn-gppll: fix mfd value
  clk: imx: clk-fracn-gppll: correct rdiv
  clk: imx: clk-fracn-gppll: Add more freq config for video pll

 drivers/clk/imx/clk-fracn-gppll.c | 36 ++++++++++++++++++-------------
 drivers/clk/imx/clk-imx93.c       |  6 +++---
 2 files changed, 24 insertions(+), 18 deletions(-)

-- 
2.25.1

