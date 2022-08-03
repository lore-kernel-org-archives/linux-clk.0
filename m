Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16099C19F28
	for <linux-clk@archiver.kernel.org>; Wed,  3 Aug 2022 08:16:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234360AbiHCIQC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Aug 2022 04:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbiHCIPl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Aug 2022 04:15:41 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE406160;
        Wed,  3 Aug 2022 01:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFj27FqVV0AbGSq+M4nCCnXZQkM6Y3IsiT8JrkY10GY1nisI2sMi9lrjZRdLoTnYg8rAmBjp4C6bxwIwi7R2mZo4nS4fz101ju3oUrgu6BUCp7Upx+HCbibmuWyxnVCWBvanoxsRkHksHyJ/4M/8ekhf0zP/XrYl1EoEO+ETvKB5OBkfqGMfuaml4Puq7XoRYx6KVSsvmoGF2KP+BLWdIaDwuMzY7KxO3QUWdimh8Iw78/UoSt0xoQ40tH9Y3f2wFh5CnuNe43EUp0c1Jd3his+5Ju+B+orIqIpIvsvclxRJxr1zCHyARUXeE8xMM/Jbe02PrG0u/mqjJlCAHEz8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9amjrc4lGk9YUE3IeTbt4WcUe6TQJsVH6dqwB0KoLI=;
 b=f4AeYaH5CffVJEgqplelTGPEAZcfdLfj69d5Yic9yJIivfJ/Jg0diV7qjaoHjRltJHBAgpVx4eh0hvCix//u8z5w51J9bgqmB3NdKSQc5Y65jYoZUyJIVWsrec0CU9wKMN9chg8brfHeyjZQ+8SV/1pV1aX1KxzU2lCsAy/2YmNXt1bQE/rIwKoPZgAcZAKXcHeDGG+GDi1gB7j0wXHHPrKIIEV5yR9t0F0NWLM3dPpEDTvlQrjekKFWGzx2/YZuWBb9IHNlq5+6yXmibmYvyXDTyMcrbSTsRggis+E56kTdGGap6aRCxClUjgdZpxpqjU6Fx3gjBQDKXMgeT7SQ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9amjrc4lGk9YUE3IeTbt4WcUe6TQJsVH6dqwB0KoLI=;
 b=aX0nQA6Y3qKMKiZVeVwcg2yldmOX6zmPwxXUON4DbYmKe33x9MT85hjvpF17SeA4EXmtKgG+FRZLcQ7XLebM8nsPsmWMpAPo6c8gT62r0gJSWSJfGXiP21ZhGWmcP8I+UtDD7nbuRgeHT5gpTjWGenKsyiL+EW5S0GIDQl9vLdM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8233.eurprd04.prod.outlook.com (2603:10a6:10:24b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 08:15:36 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 08:15:36 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/7] clk: imx93: new gate API and composite update
Date:   Wed,  3 Aug 2022 16:17:06 +0800
Message-Id: <20220803081713.3504699-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaecfa11-e4b4-4b2a-ed9e-08da75285829
X-MS-TrafficTypeDiagnostic: DB9PR04MB8233:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3hv2FfmNeVOUYyWo/fZGWuKHYfO1yBH1+/zyJGIwwOyRaSF2KH/38eL+qN4ZMv4FsKHzg7CQ6hRf5mh5PJLwirMpKOs+H8y9sk9HSGQqqy4nn7QbQB2i44olsT3r49g3CJ6TdE+UQh+tUju+zaY1ArzjLMO7R+CgyszjBhpZ5xnl2P5qi3QiceG9h8zwNER69Phz+FzAjBGqWTnJFaFxIeyf+/Yv4uk/g1MhuLAYIGqB8YpH5UKf5lk1cPQfCxy7E6DzoqfjKnoaNYjRbHMqKsmgCd8m2RI6el5kVYmP9/XrQVVNDMWAvxgYMoOcCywWDueTPDnt6g3Dr5W9jWDF/Yljz9M2u3Zh33TuJUf84eAIdhjyb7O0NUx+9qTDhBU8g9QSDwYQr7+NxX6DarZHAu5R5I+W0GI2XxOxjq+rOv8D2ATOTZ3LnHMEf/MQ6arZ9CQp48D1E5S/KKt86k1FhBAHjn0+FN0n6331grCqEk4M1kbtjIYLuhIbNrvuG/z5KVRg+PJg/wNzL1or3KiQ8EiGWJk3jeST5WP5Ban4RA398dQxbEGY1UhAwrMO2hEb4imAJy9rSFseSWG05NbMnO4TYGKBPsFvFAV/mXczVSDXXbz0J6spOiUsmXGl6vAiWthHWtIIB0HMzaikqVcJ57jDEEwfMv3Bm1rys37cJrg8eWoCEp0eyD+rspQKtPLUOnFo+YTYIj7EwT4/gJ1q1/oilTIBqf6/vQvf50mOVQvmKyU9Q1LapKGVzSdyuUIpaffy3PamCTAXmvvkxgBJa/KrubLErCDOwGDgShkUUSUW0aMO73/cdiRzIA1bIK6z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(7416002)(2616005)(6512007)(5660300002)(26005)(186003)(1076003)(66556008)(66476007)(8676002)(4326008)(66946007)(316002)(86362001)(6506007)(41300700001)(478600001)(8936002)(52116002)(6666004)(38100700002)(38350700002)(15650500001)(83380400001)(6486002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DVbk0Q6ay5F4C+cRnhT/Kq+sAfOdfSuICbjgja6QDQfozaE1P/zBQQ01C5zn?=
 =?us-ascii?Q?Sse0f+AAXGtDaVQn0LpkRvan0bvxLWvM8hcqpJDAY+F8CST/yimwCIRzs768?=
 =?us-ascii?Q?Rxzh2H4s0mP4UgqvDsuGLE8FDjHYbfG5ttya4EftUQSzcocE72Cg9UBCyuwg?=
 =?us-ascii?Q?UsVn1IKLB45YVftMmfDFr4C/jalFAJKnOiTxMfq62CxOuXEyXhwgu90UZdJH?=
 =?us-ascii?Q?JeNRochFnMEw+2QWUp+DbrgKDyCi0J0DmvAo7vUZLZtn+P2NrLi1GsZwj5qZ?=
 =?us-ascii?Q?w0jzBKLASOwVyGD/C4ufKv79ZkDC+Mm6QJ7wiAEBYX3KJdaykcLD0GdJwe00?=
 =?us-ascii?Q?6lp6gq+va9daWwEoMgfGwfNCwMWF0/FeKn9br/g+kAedCE2iRhfsVRVAt+CT?=
 =?us-ascii?Q?ZNgXd7J7HpGX/BWTNIOBs+1THK2ZkH7GaJDT5Tk3tlwOEykbtVfRS8q0w8Dn?=
 =?us-ascii?Q?deOe8aDN8h9cOCLshySfBrSZU2JD2R58XYxtksnCdV2eK4347OcseT3diN/n?=
 =?us-ascii?Q?/aA7cj/NLisSqeasjK6VFuuDGrBmOSUQG6hW9HtfCiND+O6vyLKVhbboW02i?=
 =?us-ascii?Q?dJdSNEJhxHSZjGQ7qvCKs19mfC7jj+HSWE9aNuWHkQbEKK+hhuR/hRuu13t9?=
 =?us-ascii?Q?RBtpT7rU3vQQYEMePbF89ElzS3na84qHJ0vhhZE4favaugt+LJWfke9cfMhZ?=
 =?us-ascii?Q?l4fBwidYeVWJ/hSXUZsKuhfYtF1k2wuQa8mTicJvS5JtVc+bQp3k2GOTFt2d?=
 =?us-ascii?Q?PcBD7qu2MiQ7e6LVGoBk2mInj3S2Y8LQnwAFSoJ1ig0xRw2bxIyk0eDE/vZF?=
 =?us-ascii?Q?v+JI1Sj0i2X1ClXisIvN0BkQwUtfwSXIt5mvKG6r/DrkmliUrGlbBoJnuFbg?=
 =?us-ascii?Q?0opWjBJN7z0/Y2twyfsvRGtauRKka0wg1xPWaepmt4SRew9gpoDgAMTCc+0V?=
 =?us-ascii?Q?Bv/nCx2ok9DJyLcV7s+kBuNfNh/jGA8RtojP7k7mlDW4CCSRgUEp2u/diY4X?=
 =?us-ascii?Q?3smccX9pg/60+oziSL6SHdZMrHDGauWIFOiCYsozr+u1eCxpLhYt68GCj5zo?=
 =?us-ascii?Q?FkMI3nRdDtN/ofV/FLLv1vug+OJEWFnzLRbVGicL8y2POyNXHd824vYOd2z6?=
 =?us-ascii?Q?8NJJ3pWpFaST2wLZQV8S51zv/cmusNP9NyoprZUhuGe5w4DCq5Orpz1qRw1H?=
 =?us-ascii?Q?9ZO/1xLeocov8p0ykWozgENt+Jvq1zhvQdj69uI3Y1qrbX6+6KSFMhjYrgk7?=
 =?us-ascii?Q?OaS/AphK9TjdepU77GlUs16hXP8mmiJLdaW4jF0z4IkSf92gdsDfBugpL+jS?=
 =?us-ascii?Q?sk5TIqWmMWSzXKDaX5p7DiDDDdfRhh5ZhBxPvhrw2ypchFvKVS+t18AjDlHI?=
 =?us-ascii?Q?MMz+95eIozAVA83k7w00CVuBF71jAYZH2uCcpckrVw6n2kqnMpg6VaMh70xt?=
 =?us-ascii?Q?QV/ERvI3+K8T8vGQWwBejM7+jinw8Mf5ZV0OFE8+owu8OdVySNLlodSD7YCE?=
 =?us-ascii?Q?GRsEYnTi+OlVJUg8dLg8sr+jwfIdxYB3y5o7RVJTf0Pl4pfAfuZSPbcEXVE4?=
 =?us-ascii?Q?5y84QBTxAO1DQ9c08lvyc049RQ/PZ3iqoI5WsiB2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaecfa11-e4b4-4b2a-ed9e-08da75285829
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 08:15:36.6818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neIIwdXKnhHKexx9HLaJu4rJr5HFKUK389FF2q5i0D44GdnS3SMfMuouQAi/bCAsKkA22Ru0QhNYixVaAPqkRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8233
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

The current clk driver use gate API as i.MX8M*, the gate2 API use 0x3 as
val/mask, however i.MX93 LPCG DIRECT use BIT0 as on/off gate. So clk
disable unused actually not gate off the LPCG clocks.
And i.MX93 has AUTHEN feature, so add a new API to support i.MX93 clk gate.

i.MX93 CCM ROOT has slice busy check bit when updating register value, add
check. CCM ROOT also has AUTHEN whitelist, so add DID check.

Besides the gate/composite update, add MU[X] and SAI IPG clk in this
patchset

This patchset has got reviewed in NXP internal, so I keep R-b tag here.
For those that have some change compared with downstream, R-b tag dropped.

Peng Fan (7):
  dt-bindings: clock: imx93-clock: add more MU/SAI clocks
  clk: imx: clk-composite-93: check slice busy
  clk: imx: clk-composite-93: check white_list
  clk: imx: add i.MX93 clk gate
  clk: imx93: switch to use new clk gate API
  clk: imx93: add MU1/2 clock
  clk: imx93: add SAI IPG clk

 drivers/clk/imx/Makefile                |   2 +-
 drivers/clk/imx/clk-composite-93.c      | 171 +++++++++++++++++++-
 drivers/clk/imx/clk-gate-93.c           | 199 ++++++++++++++++++++++++
 drivers/clk/imx/clk-imx93.c             |  30 ++--
 drivers/clk/imx/clk.h                   |   9 +-
 include/dt-bindings/clock/imx93-clock.h |   9 +-
 6 files changed, 401 insertions(+), 19 deletions(-)
 create mode 100644 drivers/clk/imx/clk-gate-93.c

-- 
2.25.1

