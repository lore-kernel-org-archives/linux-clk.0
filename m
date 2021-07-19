Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4440DC636C9
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:24:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D4F461182
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:24:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbhGSF1v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jul 2021 01:27:51 -0400
Received: from mail-am6eur05on2045.outbound.protection.outlook.com ([40.107.22.45]:16897
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229906AbhGSF1v (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Jul 2021 01:27:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQofr4mtRDWaBJ/f44zFhaor0xwvGA92UKcW4LZtJkCzhAy+5bSRqwfxXmf7p8eybq17I3hehWCx1U31XQeDMCQRiACwCPJ73Rrc062TdrfYvX2uqaksEkVcmw1dQDSlfF3VfwkQhVBT9nC9SygPgDUlcP2EtPC2pl9Cncnef0I2ZNnhLQ+CBv2sN26NJWbgFc+bjU3eXWNk+xHGsIQd/Xg3HG9qGOc0/fRM+WDabqc3KyCvwUwFKwAHDmCDOHIXDlGlVtZaAoggATbYECcMEgVlskavLL5oQpFn8kyVjRHXt9z2eozmvL0j6sHFuJPEjCNkn1XtmLrzjbwJ3kb1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiHwM+0WA7cXLVH6BcSWzgps7Dl5B3a/jw7LHHfo7Ck=;
 b=kaW2+vNVL2l5TjeTBsZ1L8xJ4Q69f6V1uep8uo/bxm9uhhiWsZGc7Mww+DDLZ9ZSBthyu7yfR24TbgJjFLfTdfMl/GuTAntN6zyVtRpEAsA+6h8huBKiD0Zc84Muevl6h/eyfdhY9SuDHUPfyjkqvmk5PakeJtxLRbmoB39Co3+eB3OWtLuW+ycWzFumal1fixgwWpDW8QB87ZxcLJQ0wPVf4kucuVaj0QLJpr3jegBInPhG/ezvqeIiIhcqe1G+Om4Wy1UJaIEoaKcJLtAXjh0p539ZE7aCuJHfGn+HQlav1t+pSEgv/EVeu8FBTC1Mxvc3LJ2tY9C2Kez126to6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiHwM+0WA7cXLVH6BcSWzgps7Dl5B3a/jw7LHHfo7Ck=;
 b=CBtLQsGFztwe1Wl9Qr2rBHaE7YCALwaFWbow59h9sXbsE3dyKSEn6nHiG28LGEbpSkrmfx/uYXKglfpnv1KmgWHzzRvOUlfs4KO3v83QYkQ6GgDZ4r4b5guugMjDtqU4TDoRNMcM/6D9sX1MRsf5GG5ZoboxMEVqzHUHGLdbb/w=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB7PR04MB5244.eurprd04.prod.outlook.com (2603:10a6:10:21::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 05:24:50 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d%9]) with mapi id 15.20.4331.031; Mon, 19 Jul 2021
 05:24:50 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        abel.vesa@nxp.com, s.hauer@pengutronix.de, p.zabel@pengutronix.de
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 6/9] clk: imx: disable the pfd when set pfdv2 clock rate
Date:   Mon, 19 Jul 2021 13:34:27 +0800
Message-Id: <20210719053430.1442505-7-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210719053430.1442505-1-ping.bai@nxp.com>
References: <20210719053430.1442505-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0126.apcprd06.prod.outlook.com
 (2603:1096:1:1d::28) To DBBPR04MB7930.eurprd04.prod.outlook.com
 (2603:10a6:10:1ea::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR06CA0126.apcprd06.prod.outlook.com (2603:1096:1:1d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 05:24:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d647ae39-e826-4c4e-1afb-08d94a7587f0
X-MS-TrafficTypeDiagnostic: DB7PR04MB5244:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5244EF1165246763BCB3710D87E19@DB7PR04MB5244.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZhhdtIMuUDnk1mUhFR/fKj6if7y2uVrlBTn24EEPZVX+kbcM29tFhdpuatiMiUySsqJY9Qf6LcLFnL6MavYPycGFY7BN3225LzBxErAquyVhGXz3AudII5QqCzTRsyb0LcbTMU//IU1m8+zQEXmltEaZiY/xs2ojVvvmeQdgG1NVxN0A35duXZYHgkZxhEx3IsGHlMkBjbba4UJjAxG+TlkueP+/ueGQq7nz7yidwa25xrlmOJrbkEVbmCvHDTGh7lie+vVlGikKZIK6dwYWHAaNHDcAXHsqXugOTUU5Io9A7mN1ZoL6hCZQzhgJKLh6du6dzF+a3V5Y5aBcdSqP0SeuyLQE6RHZL8dK13zqrHNvGBbbIIrkhBlUIHKZ2EvOt9HZeEgt2ybFvznqEVubV6vX293+2MB3UKOxfXKaDqe67XD+W9MSxL/Cw/jSzhGWQ+0j+8f/1tKJiDqwtP/rC1qdxPWrznASwbbnNwl8yTqt7TclAIPcvDGRiDbOuj5zyv2ArHAJM1upb26GqpnWdaRKwR5nOTG+VNcbjrZVSLWgXJLtvbpl6BkSQk8nYOfGjRX6C5JJE3M8FFf9sV1w8qnK4/AsGus1qNh9dbp5Mr0SuLVFA7v/dvYWh/FM0apyFmbJEg9NhcokriXCBn57Zi/mLcdMg53Rfr6lj7OJUn4xHjxz76Q2qiGcJeIpvGYtQXORC2yoTNK1PSgFV8QNE+cq1UhsyLUqMj/Hd6C2fRs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(478600001)(83380400001)(6512007)(38350700002)(38100700002)(6506007)(956004)(36756003)(2906002)(4326008)(1076003)(316002)(5660300002)(2616005)(6486002)(52116002)(86362001)(26005)(66476007)(186003)(66556008)(8676002)(66946007)(8936002)(6666004)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0nofiigfL2zZPtl56giRRbLmZs6OFT8GBlWVcgx7jQ/8rpGvBXM43jXofnXp?=
 =?us-ascii?Q?RG7JlLhOCg3QMLJLhZojvdzBcVVvR8m40d/ZS4nNoictn1PMcf/4x6w8vAwf?=
 =?us-ascii?Q?/D/RlspUrzvugd24DlvFI22Cgvaz9OwlMKeszfmXDQVi9UgpEnkTSIiP7whB?=
 =?us-ascii?Q?ekrN0Cl1z2k+SNUu06Dgc9Yx9r2tSuaUw4hc//UrV1mz66jSjxtvz1o2Aot6?=
 =?us-ascii?Q?bQSMUq0VurAmIpD1KGV9Ge+BxnTg1DfVmoPtx4fsWv86qD+GVzYXvpjxuGwK?=
 =?us-ascii?Q?obi6FoA0Pq4P2VqE01DEwCR/qrkmBUbj6G+JtjrutOsowhzJAQzGfV+Zc2ju?=
 =?us-ascii?Q?diSa8ApSpwRbOXfUI0G4bVP0nH/DYaDF2aOvA5wJmiIoOiipu2pzzOcwTEow?=
 =?us-ascii?Q?sVhi4MSwtONHem3kKWqu2TLd+ua/9WQahBKZO6tV8qtOQ8qdJ8f1wo3/Lg07?=
 =?us-ascii?Q?7deQssFFyBv5ghp4ZAavBPuE5XrcFF9PG9w4azij9NlqIEJiP2I0kPTGhTTW?=
 =?us-ascii?Q?pmbAQtPr6n5P/CJ5HIkL0G77GGSbycB7WEaJr7qH4jQbYEQZEJBuYpRJwM8c?=
 =?us-ascii?Q?sZrBSUoF7BBjKsNM8doeW4N8EMw/dyRvzoHFWeWcJvYK26Cv7u8I2Cl1Er4o?=
 =?us-ascii?Q?ZsOXmTM2PWcYj4F84a1RPIhKsYOj31ucu5qjW5TYPqvg8h3fKecoRUWc60Ds?=
 =?us-ascii?Q?+2fGmrXDhcgCQb6CbF5/yELHbiWdkGJgpHbFgExxemefjSY/BQOWv4FqlTRB?=
 =?us-ascii?Q?vT6M3afwPwz7rHJo5mG9yLDj9rv5T61h0p3VPDN5l53GuNAIbEO2Xnnkihye?=
 =?us-ascii?Q?MO/e29/GZTH0bWOr429hOcEjqdiLmdgVExfB/J/7cO8jxk50/spU0mcrQgH7?=
 =?us-ascii?Q?iL8OsVhr+V0YqJQt/IW1Ssbqmtnbvkomq6PWmFsuKruVhaTWFLYGcN5163op?=
 =?us-ascii?Q?BzKXDGOM+gGmW7yJp6WxPvhMWLj9BYovV+vHzzAziZayZ24Y4V0zj+A7rfDd?=
 =?us-ascii?Q?JBs/RSVvs6CPPbwwgFsYmErI+x/wzsjhfqwzEobtMZjBh+ArK3Z2Mdred7TA?=
 =?us-ascii?Q?teZrSSXyA7DwSqUFQEg8Suk7NrfgG1Rwer7imZAsD8HJZkpXrmlpFqAu0h8F?=
 =?us-ascii?Q?osMyQTTzn7VOxXYi6cIuVZYZJnI7tMzF3ER6mn3UQ9HH5ZPcZH1sMfAyzLK8?=
 =?us-ascii?Q?otWBgkrfPXaq7/GAdswgka99hm0l2EewWUBz36P6dnm5cMystjLlyvrczgwF?=
 =?us-ascii?Q?c5gmrYRmdwoWtB98SvPI3wpkjfbIjIOnRqXIZYe8biIhJo3oniVdaTkpWKDD?=
 =?us-ascii?Q?rAhILCL3+BCK9AyHhOC+bxNL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d647ae39-e826-4c4e-1afb-08d94a7587f0
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 05:24:50.3706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eL3YYOQm1oAY7ZdPJGRlRDBb5sO8q2f1t0elnMVhqIQgXfdiMfPXZSlLOCG4MFLlTL6XdKz6gzs9dOFgriDpVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5244
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

It is possible that a PFD is enabled in HW but not in SW. That
means the enable count & prepare count of the PFD clock is '0',
so the 'CLK_SET_RATE' flag can do nothing when the rate is changed
while the PFD is hw enabled. In order to safely change the pfd
rate, we can disable the PFD directly if it is hw enabled but not
used by SW end user.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-pfdv2.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-pfdv2.c b/drivers/clk/imx/clk-pfdv2.c
index 6b744c84278e..9cba83521988 100644
--- a/drivers/clk/imx/clk-pfdv2.c
+++ b/drivers/clk/imx/clk-pfdv2.c
@@ -161,8 +161,17 @@ static int clk_pfdv2_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (!rate)
 		return -EINVAL;
 
-	/* PFD can NOT change rate without gating */
-	WARN_ON(clk_pfdv2_is_enabled(hw));
+	/*
+	 * PFD can NOT change rate without gating.
+	 * as the PFDs may enabled in HW by default but no
+	 * consumer used it, the enable count is '0', so the
+	 * 'SET_RATE_GATE' can NOT help on blocking the set_rate
+	 * ops especially for 'assigned-clock-xxx'. In order
+	 * to simplify the case, just disable the PFD if it is
+	 * enabled in HW but not in SW.
+	 */
+	if (clk_pfdv2_is_enabled(hw))
+		clk_pfdv2_disable(hw);
 
 	tmp = tmp * 18 + rate / 2;
 	do_div(tmp, rate);
-- 
2.26.2

