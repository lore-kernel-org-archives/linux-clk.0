Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E00BC5519F
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 08:38:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1662F241A5
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 08:38:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="RnM8Jw8s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgKRIih (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Nov 2020 03:38:37 -0500
Received: from mail-vi1eur05on2069.outbound.protection.outlook.com ([40.107.21.69]:19232
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725747AbgKRIih (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Nov 2020 03:38:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drOupWMJJrWVSINLRObiO7Y099cqjMm7pQXHazSsUGLGIAnWJ7YA08ddHJdgfvp/ltZPvv6IryT5Q0oiQIm0UM/IiXguWlhEnDe1gzDvmLfvY0EOuzy3FLxUu5bkvdtjQb32CnUGmFRXFv81QX49n1icGK6Md/jYV3b7MweWN1Cf0lEm5/tHNBlZpByHsmqxe3yHeVvuEnL9yKU2/PgxqoVYYM0voa62s6vwYqhKFVOXtDoC4sEDizMLvs+HLcr3WjHZfGujA24gbLmDjOedMvGrV+cvUdKkC1wfTbZT/5vFs4cX/4FlW4OJ4/Q6kJQUCcH8fYUfMh01uPXD50+Yvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UGCzG1NVzHrxOBmYwbKzPATUVnDtJzVx7a9N8p/Vno=;
 b=ZaQ83YeIKDtOA/PzfvYAP8FUgL/OqlV7QsUq0c/48m6XfaHnH7rPcvpROQKj9FXCjv9xgf3ixbKNEcIAkxSkKx7RUn1nDLuaIE8Y6hjVwXNggYDWPMxFy+Dhg++d953ZNo5mPIj2cxlI+mdkxpodVPToXYG7J8Is4r1dR5VzoPD0JtZ53pRAeMRBdrjmSqHkgBZwO1XKiu90abjaoSUVARi0+2lg63PHpmhAsXDI/mBNQTLOcZz5HDu71essQ3oVow/GQx6URfiEPnXS5gxU54515v0sWPQ49xc3YXf5K9gHE9AFgnZsTR5O9hkkXYqVO7ehBRBtlr+iDmUEOW/C5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UGCzG1NVzHrxOBmYwbKzPATUVnDtJzVx7a9N8p/Vno=;
 b=RnM8Jw8sDOWzRpx3bw9w4XZKEcHvIj1M4O961md99Ge0scKE4u7SfhOduoZw7e8jJHq9jlM8mnAopmXh47KyKjA1m3pE8p608DM9INxNbW+dzTidKm4ZweXbwiCIhII+0YSpC+k6YhE3UwogeUeSf5BAL3u7cZn8W2fgMTj8MKY=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6990.eurprd04.prod.outlook.com (2603:10a6:803:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 08:38:33 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 08:38:33 +0000
From:   Liu Ying <victor.liu@nxp.com>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, robh+dt@kernel.org, aisheng.dong@nxp.com
Subject: [PATCH 0/5] Add some clocks support for i.MX8qxp DC0/MIPI-LVDS subsystems
Date:   Wed, 18 Nov 2020 16:31:25 +0800
Message-Id: <1605688290-21805-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0166.apcprd03.prod.outlook.com
 (2603:1096:4:c9::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0166.apcprd03.prod.outlook.com (2603:1096:4:c9::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.17 via Frontend Transport; Wed, 18 Nov 2020 08:38:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3dd31205-116b-45c0-e336-08d88b9d557a
X-MS-TrafficTypeDiagnostic: VI1PR04MB6990:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB699003D21674F479ACC7EAC998E10@VI1PR04MB6990.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lg7RkXOn31JZQPoUJUm13JAOvryKLOmA8a1k56ShMLfhXw9aQHfMnG3c2pUN7GILC/KqLrFMl2jNGcGEIaamDhE1S6ZfV9mrq0nHasDxbvizSpdILkt2abbc2GcjZBCbvh/l0a7tz+o9SxLOHGVhwK+4l7l0v3UBfYGo53t4dKvCcoDPJpgYkdV8KIS5I+IiMUdOAEWseg1/wS5W0cCyAn/Wom6resi1xoXWNqL0KbuU9yWeKUAmWJ1sot3u8gRMbbbW3CI9gd8qotqJJMk/S8Fk94oBUfw9+AiK6KXQYeWL6r9dlYyJK8BLKgETrrcaGL1/F7WCzZoplkRpdIkEVQ/RTKwsm+ej3QexT1hbfOKFRT8rXAL6nqWBAXSwc+eD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(2616005)(956004)(66556008)(8676002)(5660300002)(86362001)(6512007)(4326008)(66946007)(186003)(6506007)(6486002)(478600001)(316002)(66476007)(26005)(16526019)(83380400001)(52116002)(8936002)(36756003)(7416002)(6666004)(2906002)(69590400008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: J9vyj7Cez8wHqeMDQyr7q/bNwVaS1oZiKALmbz/sdLZhc+QS5VD9DrsXnGudxDuDNWu4DVGEjeEFnun9TO20Mw8FNyM8ZAfcnXUvZbvt+rh7Z/5eW2kStRGKHrznYCte9Apn7DqEkaIlmUz7P15iS+x745x5HwJvpIFw6mfRZ3KrdEKApLbSDPi0iPm1tN+e+8OS277G0tq1ac+PXiEXHP8qwOXySmyCk1Q242bYHhmvbiosR+/XqSPLGVtbRDrjlBzVRFEz47arrdrxU9FGSiLzQA0fk/ZyapfLXFNRbvJczTmwYDuL6DTdvvVwSjbBeQpgQcLr4Z0Tl9GF7gQE3Ado4pLVuCWnaIZJmMunJqKMZA+wE3X6TLEw5tpRlBYXHG7kC/7sB9rAoQSpj0ChBoD3r50I/Yh0vp+Q0a4d5dTD3hqtClpube4qTuI+arCB2ttIJQy4fRaWRDvuKIVVEjW4RRRH/ukvGvl9HBYzw5EyutzV0acQhxkGeWYYfEEpImB4auRFFO5Xnpg6daVmI8q/jKb5rpNJWlq10B5hOEwi3rB3KyTi9KZc+elr/PnARJmn4zHRzF9Rrf755WarOEq1RJDq6VeldqK8g5FpnpWT73uLQaAJEJGnypBraDNo/f3Li6QcD4JH5lwE671qEA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd31205-116b-45c0-e336-08d88b9d557a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 08:38:33.5477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPPmorw8tthZ+yeQpaF8KBIAPlrjMLfxg5yo1Ah6l+AQN1xJv4MNVYZgZpZe852hcr/NXxV/4flPwBR5fA1L3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6990
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch set adds some clocks support for i.MX8qxp DC0/MIPI-LVDS subsystems,
which includes some SCU controlled clocks and some LPCG clocks.

With this patch set, some basic clocks for i.MX8qxp LVDS displays can be got
by drivers.

This patch set follows the legacy/deprecated way to add the clocks support
in clock drivers instead of the new 'two cells' dt-binding way.  The reason
behind this is that the existing i.MX8qxp SoC device tree is using the legacy
way(no conversion effort is seen) and there is not i.MX8qm(with a similar
architecture) SoC device tree for us to enable display yet.

Liu Ying (5):
  clk: imx: clk-imx8qxp: Add SCU clocks support for DC0 PLL clocks
  clk: imx: clk-imx8qxp-lpcg: Add display controller LPCG clocks support
  clk: imx: clk-imx8qxp: Add some SCU clocks support for MIPI-LVDS
    subsystems
  dt-bindings: clock: imx8qxp-lpcg: Add compatibles for MIPI-LVDS
    subsystems
  clk: imx: clk-imx8qxp-lpcg: Add some LPCG clocks support for MIPI-LVDS
    subsystems

 .../devicetree/bindings/clock/imx8qxp-lpcg.yaml    |  2 +
 drivers/clk/imx/clk-imx8qxp-lpcg.c                 | 79 ++++++++++++++++++++++
 drivers/clk/imx/clk-imx8qxp-lpcg.h                 | 29 ++++++++
 drivers/clk/imx/clk-imx8qxp.c                      | 12 ++++
 include/dt-bindings/clock/imx8-clock.h             | 61 +++++++++++++++++
 5 files changed, 183 insertions(+)

-- 
2.7.4

