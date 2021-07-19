Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683EDC12002
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:24:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40CB760FDA
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:24:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhGSF11 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jul 2021 01:27:27 -0400
Received: from mail-am6eur05on2050.outbound.protection.outlook.com ([40.107.22.50]:30147
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229512AbhGSF10 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Jul 2021 01:27:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bwjj5yfg9UtcdVbmK8pR3MIuVf6TbkAcAoCyZVcDNSaLjL6Z9EQ/Jv13n8sLRBlBdpJqqJn3iHwpbWr1i2XyRQwc9v8E49KYh6vCUTHBhlRvZujr3HIKIY1ZsQb3bsR1jKjKv3XaDuagQvvqI8Rrgpye67Kl5UDAKtAkDiLMao3OBLLYpPwOV7r+mkY5p32t88BW8n+i1+sqj+Usib5g0tcFpjcAxQtbMRttIkNXv6UgG79sD6PMRP5PYjDApeMPrV/OuA30c1skiaEWMdyy7AcsW2gj8GC5GX5rg+Nhb0C1XpF9oJkcIGmynq0h4A+77nfv4Qjlu2XkMj6NR+moGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM4I9i8wA1OdMkWgGnFeMEhS3SKw2ygXFMTRQp12nOY=;
 b=Kz/KoiZmuFro75t9g4OQREV6CJEpxXGuwh73PsaaAgEHQ5LOUnaKfRIy+cqOERLbSgOVAR5ideo9ITd+XVxzauvHAO84a9qbuIM3Gsyeaw6pFnEG5MokDxi5WrsppEJ+GY9JZ0gzfcZQz0DBr3LublUphpqSzyjC8Z998yYtQj3W7dGczhvU1BkjLrJ+R2xe1zmYJ/nJim23fpFC6gpKYPw4kVxK5SLnMMZDS0tDXXQH50HhviW1QytGkx+RiPzma9bM1HpmAVTsIGe/svzSphQPxR3L+ADj4M4enpJx8exkrtsRD9Iz9JDZDkTRgkXC3mI/vm4KNhNJ5LYxeaPUQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM4I9i8wA1OdMkWgGnFeMEhS3SKw2ygXFMTRQp12nOY=;
 b=W+HxgeXvIA1dYtQIqGX6Vz+XdMgvHzjQmNTcvhTZ2eVyQx5wQlAfoY2eMM0dzpvL53CZmuavCOvA2HDKAxsn0HTj+Bu6AWaqEdI3+3uXKnRsHzTQ7ciauNCglTMfqt5husFoI2ppRbj9pTUSvW8d83scmpwVUOLrBIZhswHOOKw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB7PR04MB5244.eurprd04.prod.outlook.com (2603:10a6:10:21::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 05:24:24 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d%9]) with mapi id 15.20.4331.031; Mon, 19 Jul 2021
 05:24:24 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        abel.vesa@nxp.com, s.hauer@pengutronix.de, p.zabel@pengutronix.de
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/9] Add imx8ulp clock & reset driver support
Date:   Mon, 19 Jul 2021 13:34:21 +0800
Message-Id: <20210719053430.1442505-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0126.apcprd06.prod.outlook.com
 (2603:1096:1:1d::28) To DBBPR04MB7930.eurprd04.prod.outlook.com
 (2603:10a6:10:1ea::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR06CA0126.apcprd06.prod.outlook.com (2603:1096:1:1d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 05:24:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efa82001-a2a9-45c3-2f81-08d94a757871
X-MS-TrafficTypeDiagnostic: DB7PR04MB5244:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB524418E7EDFA275E8781496387E19@DB7PR04MB5244.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GrVcTk4NpbMa48L7Re0tELZEeUzG0PdVxBHBYnVd68v36gTd+6geeIy/ONNv5uaO8sIwNE6eRNf/NoKhBmlGsESRNaef2nNYHWBGm+vxC2n3vyCufCeRU/ug3hJ+ltYKW5lNzCkHg/OExzrr1Tap7M2fbYVjs4FlaV5eVGeIjWksf4N5IqX4W0riSSmchQ18B/GY8B3k1QMBfNTooV+tBHn24S/ZxkhQi5e37KUhIXKwXsU7mc2OLCp5JZz8DKmG/SPTTmRl7mCNFhfvOnEN05ZiNrr1r/6QY7AKGfcDGRyO2zRb1pd6pzjunbXp4/tze/cI6dYB2ytBsQfRwGN1Y47YjxxEHwO7Qq9WSDb8rjgLwrSRbxlTVWsJhgPcPPv52hlHR3w0jJbZFNo351fT1HdQ1izQfwkhuZVBdA/GZ47EXpvJ+V6ATmu7kU1OMptoS+v1iLfKsPU5wcNmpBXsFTl4j2OOK5FURkf+nQVhfcF6TzcmQ+95E2zbCx+sNxHQRV4wSsZAZwR0BSyMtAJKaLTAG/o4iAeDJ2yN3Hi6nhCQxUnjSSsJB8zD56JyRIYfW0LtwsB5ui4bGGyWfFp5K27F5Z9ecP0tpAmiVSIdReLCMiNHogtna8Cn2tHgOtMFqmc1Ss0sXMsorocDJSsb+gv4ynm0unqiOAJ+VYT05YAv/rCiK55X3aw6pBuIZP26W0rAu2LWrumab3IzUvjyn+YAP7h20Zto+/IxKskNWFIIJ3YRzSNJl0+b8krevqmZHQTAlQ5gQJChutcnLY2vw7tgrc5BTC1DNW8vCNN51e1u7mz2NyxMAIwP8Z7q9hdT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(478600001)(966005)(83380400001)(6512007)(38350700002)(38100700002)(6506007)(956004)(36756003)(2906002)(4326008)(1076003)(316002)(5660300002)(2616005)(6486002)(52116002)(86362001)(26005)(66476007)(186003)(66556008)(8676002)(66946007)(8936002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tUqSFneq0iQkdahU17mdMtq2nxG99QaA7GIAXKPYv0E9AOwrBxxJ4PzQsHUK?=
 =?us-ascii?Q?pvkw3KrZj/4WqqnO/0nhZSUJuhgfpYwEllntXAe9GylTspFHUZT3EjVS5n1a?=
 =?us-ascii?Q?fEqx+bzluAWddwGqHSmVRAZ9n/mNK+Al2sX3QIMZVxIYcadbcDHNjEWX3Hx7?=
 =?us-ascii?Q?pt/UMvDoJGkAD7cZN2NYKUjxy0h/KLDFKY4TwqeqkUZwpJNGk/tTwWTxOKtB?=
 =?us-ascii?Q?9SFDD/D3OJ1WXzbZmuqrFO5lypd9R4+IbkW2G5+EEd2CwXfefnLgp8y1+R4N?=
 =?us-ascii?Q?/nIskFZz/iuBDByCkuXw++Eu7u2vdg1MtXfzUNTewfrZkgcKOpzJlMxY+oDQ?=
 =?us-ascii?Q?vZ8w68FRt7fc3WdNKwQKXMLnruAXvk1kxwizZZ0D8MpOQQLYt83rU68zJMPu?=
 =?us-ascii?Q?M1plp+fLPxkH8dnQwwEY4zU4x4bWznthOmKeQ+m0Ctul0hkKSZXCiFUmwTeq?=
 =?us-ascii?Q?8cOw/bCcJ5Dty7MZwOhjvGK1HQND45MyPHFo9pgLrYLD1rp8sAvwhJkIfBZV?=
 =?us-ascii?Q?tPzMIo7VUSYn/9XFn1cawK0Zc/zOXLbcq6kDzMkfb6tuDHlDW6lsV0OFTcQ6?=
 =?us-ascii?Q?KM6XyKh4sLBuZwOjDVXpCw9p11KuqguSq6yZTwtoA3SM2TtPY6uZwMuy3ME+?=
 =?us-ascii?Q?0nh+m/cZclhEr3Vsad1Giak4GU89sm7pg109H9GfhNEgcPRu8+gkzsaGw6qW?=
 =?us-ascii?Q?7bBigLUcFm6hNcjBUC/QEhIUlLI+e8Fqwm3FPiCfl+LX3A0rQXD5H0mhjcIq?=
 =?us-ascii?Q?9k2x8QAEJQn8xj1598BUqC3BGFd9bO58srcGJ2p8BvIb1EXcg/29tdi7OttG?=
 =?us-ascii?Q?48bbLm170WRuZh4nI2uMu3EaqIol7aM424reegKH9xHLzcy1dLT03TohzhAh?=
 =?us-ascii?Q?AfojgA/UQofc/+JloKWGLmV+3RWZa5ZuEbFeX/f35s41+HPTDw3w3/64/VvV?=
 =?us-ascii?Q?M9Gs2FuGvJ+SPh0NVs/uXYBn+NX9N3UvWX3pWX5yWApiWurqgeEajbxTR5bK?=
 =?us-ascii?Q?72dA6y7VPI0XIEOHxbwUFmYciqPeoRzq2HUbOEE/1EIJIboHNYm7Gru0ea61?=
 =?us-ascii?Q?AfIH941zthPxkUBqXQTH6cocR3onZJphk+Ktnrmp0TCXfZ+e6nQUCfKZFu1Y?=
 =?us-ascii?Q?F6mv78+46T/0nMO+EdskqVE3f7Dq57I2Ffr8Wt3tDhfq878+lWY7tMxvPCQl?=
 =?us-ascii?Q?sxTJphmZWp23uGqNtfOj2jzCVha49Ji+6luNx+MagNMpMe5yQelipASfB0pW?=
 =?us-ascii?Q?/yBrXJNGGJw1N/xzIIc7bdxM786Mq79bEJIbkbPVkY+XzsPBgWhJcQTJINtr?=
 =?us-ascii?Q?FIPFYdjKcn0j4B+P2lw4jYke?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efa82001-a2a9-45c3-2f81-08d94a757871
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 05:24:24.4288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RO5dhXEB1D8T7lrLLmvTg/hYj2MX3RRP9PPIMIiV9GXJL6j/y1NeEzAt91a0ZNyMgpkIvDKL4FwWsqOtnwrzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5244
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patchset adds the clock & reset driver support for i.MX8ULP.
For some of the PCC slot, As there is a SWRST control bit share
the same pcc register for peripheral reset ccontrol. To simplify
the case, register the pcc reset controller driver when pcc
clock driver is registered.

Patch 1/9  for the dt-bindings part is send out for review previously
with the dts patchset:
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20210607083921.2668568-1-ping.bai@nxp.com/

Shawn suggests to send out the clock driver part firstly, so this
patch is included in this patchset for now.

Anson Huang (1):
  clk: imx: disable i.mx7ulp composite clock during initialization

Jacky Bai (8):
  dt-bindings: clock: Add imx8ulp clock support
  clk: imx: Update the pllv4 to support imx8ulp
  clk: imx: Update the compsite driver to support imx8ulp
  clk: imx: Add 'CLK_SET_RATE_NO_REPARENT' for composite-7ulp
  clk: imx: disable the pfd when set pfdv2 clock rate
  clk: imx: Update the pfdv2 for 8ulp specific support
  clk: imx: Add clock driver for imx8ulp
  clk: imx: Add the pcc reset controller support on imx8ulp

 .../bindings/clock/imx8ulp-clock.yaml         | 128 ++++
 drivers/clk/imx/Kconfig                       |   7 +
 drivers/clk/imx/Makefile                      |   2 +
 drivers/clk/imx/clk-composite-7ulp.c          |  87 ++-
 drivers/clk/imx/clk-imx7ulp.c                 |  20 +-
 drivers/clk/imx/clk-imx8ulp.c                 | 574 ++++++++++++++++++
 drivers/clk/imx/clk-pfdv2.c                   |  22 +-
 drivers/clk/imx/clk-pllv4.c                   |  34 +-
 drivers/clk/imx/clk.h                         |  24 +-
 include/dt-bindings/clock/imx8ulp-clock.h     | 262 ++++++++
 include/dt-bindings/reset/imx8ulp-pcc-reset.h |  59 ++
 11 files changed, 1187 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8ulp-clock.yaml
 create mode 100644 drivers/clk/imx/clk-imx8ulp.c
 create mode 100644 include/dt-bindings/clock/imx8ulp-clock.h
 create mode 100644 include/dt-bindings/reset/imx8ulp-pcc-reset.h

-- 
2.26.2

