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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18949C07E94
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F167D613EA
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbhFDJMs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 05:12:48 -0400
Received: from mail-eopbgr60074.outbound.protection.outlook.com ([40.107.6.74]:55951
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229973AbhFDJMs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Jun 2021 05:12:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZZaYcF5blOjfMVhq84ueDLeEOtq28YUFiU2d2f7K0kYrufWtERgRFx9i0U6pNJHF0IbECMEjQrzcQUt+1R9FpVzx7mE6a0YDVUcoSMljhMOWlzQpcdK0BQWqJKWM+HXsnr8gKoQkTXzWgs4WhiLZH0TQYhfzu4GacYcxRdKed9Vai6cdAOzVCPOiYz/s3Q59ZvLBqGWWEhLKtgaaH25FfGJgNF9mVAHsuPWm+aciEhS9wjZ4kyEbbfl5JETbDOGd5y+M1wmO6FNgwxzZFYleWcDZhteTkkT9nv1nq9rAmGTmF6W+nOb9Ji4Hq8eA8iukjZJBPdg2iwuuPgG2sE1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVfDjeRA3HhAS5lK0m1JjwZJrA9o6mqkttbYHpxIA7k=;
 b=e36JOGvKEAjvez9K7KiFD0Hg3n5jH04VWJ91+64FNWIboj2S4oGghyK+FvdKsG8I/ATaUYcfzWDjuem8pqObN67eoov5tAq2uMx6T0vYkKHU65TMVjy+ejLGX5qbptfPKQxsDNUNa7Gla8CmiRyFBkd9f/zH+6Dj8XGKG2/LeMj2Bbt/cE16gNbV83K5POo/1UUpmZFmAYYoSWbpG15IN3WuqGd+/3BbelPtmgfwj5GzoiT/fDH6B5QSAJKRQKCdHbAdR0fWRPFM2V3Xa28bdhI2HEntD1EWTNG1Ej8gP4Xx00WZ81rwoaNd3Qk5Eyy4VagAPLkqJDQATxZ4Hem5Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVfDjeRA3HhAS5lK0m1JjwZJrA9o6mqkttbYHpxIA7k=;
 b=OruPQKtv16AYT6kM0EGs4k19S2JWVdOvsRZGeKNjrAgB/jHB+L3cMWYXeM996bcL21UwlE7+G0N6e0Nl4YWDg1QHdIn7sHp9fxHd3sn7VjOU1t8VdstZr5oSZo0P8NteB7LEUrkqL6v9SixC1kGGv3ZvBh+t+mfXiXky+strSZQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8917.eurprd04.prod.outlook.com (2603:10a6:10:2e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21; Fri, 4 Jun
 2021 09:11:01 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a%7]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 09:11:01 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        dongas86@gmail.com, shawnguo@kernel.org, kernel@pengutronix.de,
        abel.vesa@nxp.com, Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 03/10] clk: imx: scu: bypass cpu clock save and restore
Date:   Fri,  4 Jun 2021 17:09:36 +0800
Message-Id: <20210604090943.3519350-4-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604090943.3519350-1-aisheng.dong@nxp.com>
References: <20210604090943.3519350-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20)
 To DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24 via Frontend Transport; Fri, 4 Jun 2021 09:10:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a07e851e-3651-4c0b-91a6-08d92738ac05
X-MS-TrafficTypeDiagnostic: DU2PR04MB8917:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB891721177D5D24DF71219499803B9@DU2PR04MB8917.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7jEgbgGi8ZFfPGViXa5G9DqxyUHvpcB9iDSyExn2N5ZT9mRQRmJvrs2chum0DrrKoutIOLz6zxFmx/iEZdWZX+NVnWSTV0fb4ptRQ9ohI2fTf+3hZosYbUkDS5/f/QydJm1BsyGo+8eGUWeVd2qhCYyTbxUsc4v61KDHME2OvC6bveSKap2aOWxLHLNmqoXHCfcZ/BmduJVfi8xjwmP+HlFqeUod8ZOXkJ1L8OegULdX79pxZPwGKpMSllWDekqFtF5biJd4T3lhyuJscYdkM9Q/+MGRSco8cxQhfGn5zKoB9BVAbLin7GvL7/aMHEhrPs9NMJ0LpkNriLgSbFRhI8p3U46m0nY1Ucg55twScA5iLU54TrNjO9/52quRiC+VyHFV/zRgYzCEhPdegJ7S9BrlLBYDEvuyqssQcnNI+bNPgXrREc8cqmQ44f/2sKr8u6TVnHW1IMc3wlPt6CHu75YyYYkBFjf0wFA1tM1y0f6dg2synq66YXL0P70wOUG2JCz8lVEMSiEst6+ae3O7zF8EzwKfKSVN5M0qSfphsPaqI6HR1Yn2/jI2UrE/+UdU4DehoM0gaAzdJLYyIQ2s216XzSbnHNkewhzD0Gm2LkgEEtiYA66Qcbb5zCtNXWDyDtkpisiZjoT7aGxrU1RWti5qhap2APNlT96fZcKWrkaVDKoXYVkZYgj9WUxl3ANC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(186003)(16526019)(6506007)(2616005)(26005)(956004)(2906002)(478600001)(66476007)(66556008)(83380400001)(316002)(66946007)(86362001)(52116002)(36756003)(1076003)(4326008)(6486002)(5660300002)(8936002)(8676002)(6666004)(38100700002)(6916009)(6512007)(38350700002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LV80muN8VdUGNCOlzOV3KhRfbr8zDHLUhj3w/25YaEiHiNihjT3zwaQuyaMH?=
 =?us-ascii?Q?yzmnKcDKMd3ElIjExYuW+n5s0A7wuOcir55Uo0fLJ/h+/a0qgSeKP2ISqvAp?=
 =?us-ascii?Q?81TGBmyUbj3M4AiiwYG9bUbWS9IlcdT3M36faD9toZc5A6maYnSrrZwMVVP0?=
 =?us-ascii?Q?kMEUi9CETejhtWUz/xMFtjptckqUNjzC5WaS/rYTZefPh8PNjq0uw5JvzdPD?=
 =?us-ascii?Q?KFtBm86Z+9bwKXOuBVR0Q9Qp0qniCqnjqRr99qBV1mj6BC1/EqF7X+BO00q8?=
 =?us-ascii?Q?AZ4ZIKZZ97G8tCYxx6lvdI1wLIz7Ml3vedspTAsKG9kN5aXBPRvMwNgZRuOx?=
 =?us-ascii?Q?Wi0UxRA/nOJFpVyiaEPesHZae3LoCkooE9BM0/r5z8iQzW21IgeGfmw+tdZ+?=
 =?us-ascii?Q?QWuM1hf2GDJXXfvmf3s6IeUMXN4/+BU3yzInCYCTkeJGPQKnfqJ5bFgCarqB?=
 =?us-ascii?Q?ENE0KoeOeJDQRzfWydTLMc2ZbvKnl0+T9dT8vdTGqmtiU8PMUXYzijyRCFyV?=
 =?us-ascii?Q?gVVMgyhjoC1h7z6TL/YA+47KjNcdJaUqYSCyTdR4/I28F9PBVs8RDsWYXAe1?=
 =?us-ascii?Q?mwPsGhlSIH1Ntcfa7HFm0zpz4rLjGWpILHHP1kGo0yL5lKU7PQwwSO6CZoxx?=
 =?us-ascii?Q?TLKRARak/68lwMFhfldMHF3K0OzUqolL/u0Do9IH5oDppzc58p8mdStk/Sya?=
 =?us-ascii?Q?6UPHgh2VqDuJBzghhdrW3xcouMfPuJMcqlW+RRwuxQsDcg+MCoMfAWh8otqc?=
 =?us-ascii?Q?roNHU41Lhjv+AYLAFi1OvOz9hTzVFOMse3BVnjCZ9fcx7IzehwtRXLYRgauC?=
 =?us-ascii?Q?xemnh+lrqC8/ab2MOVoMTSpBK0cABbwQyUZ1wADN9DnGPv+8KCMfVZHyHlAa?=
 =?us-ascii?Q?u+otgv3f3bWrARqU4SjPpStn/O/1u76UsUHYS83+CsW+dOsbrUKSHA3NYEiT?=
 =?us-ascii?Q?G2mZ+pqADcudrG1F+o2Qly7uJvNRJfWLjRuIoDP5G2qAMQ0HZ6YA5gtVEEWJ?=
 =?us-ascii?Q?hRUd2Bj/O/NzBxtrdeh3hOAjWOF5deorpCYKG9KezhsYe8IbG6ZZCSCVQUUR?=
 =?us-ascii?Q?Y1yvzqfT9iUwbDBL6C95dBiQeeMVDKV7F6H04GrFXclRI0x5zj/rO95BSSm3?=
 =?us-ascii?Q?V8weSvnUgVBsS7Yve21gzmF3+SvQ2ga684/uS9Vp5syCPciKZoQk23ea6jPK?=
 =?us-ascii?Q?2UrK5WosUfgONwvcGfKO/TqqsvYIk8d+fh1EEZDQ9fkcdp0xwt99FqbX8vmb?=
 =?us-ascii?Q?D8sGDM69/9PuwrAZHDvNE1wJlZrHDz1CXtAyjZtHeYvNrQCGWXAAA4OlXdyB?=
 =?us-ascii?Q?ub09BjvyBkDaOQ9ILevyXGar?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07e851e-3651-4c0b-91a6-08d92738ac05
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 09:11:01.0529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glx+CTOE2em++IsC8E/gginUrDf2w/wUmXPczieh+SRnf7Px5fvhrre5xJt9ibJY653mjvFnqngKSrXNjkMBiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8917
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CPU clock is managed by ATF. No need save and restore.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-scu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 680b2650fd45..d87a1a1b297e 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -538,6 +538,11 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 static int __maybe_unused imx_clk_scu_suspend(struct device *dev)
 {
 	struct clk_scu *clk = dev_get_drvdata(dev);
+	u32 rsrc_id = clk->rsrc_id;
+
+	if ((rsrc_id == IMX_SC_R_A35) || (rsrc_id == IMX_SC_R_A53) ||
+	    (rsrc_id == IMX_SC_R_A72))
+		return 0;
 
 	clk->rate = clk_hw_get_rate(&clk->hw);
 	clk->is_enabled = clk_hw_is_enabled(&clk->hw);
@@ -554,8 +559,13 @@ static int __maybe_unused imx_clk_scu_suspend(struct device *dev)
 static int __maybe_unused imx_clk_scu_resume(struct device *dev)
 {
 	struct clk_scu *clk = dev_get_drvdata(dev);
+	u32 rsrc_id = clk->rsrc_id;
 	int ret = 0;
 
+	if ((rsrc_id == IMX_SC_R_A35) || (rsrc_id == IMX_SC_R_A53) ||
+	    (rsrc_id == IMX_SC_R_A72))
+		return 0;
+
 	if (clk->rate) {
 		ret = clk_scu_set_rate(&clk->hw, clk->rate, 0);
 		dev_dbg(dev, "restore rate %d %s\n", clk->rate,
-- 
2.25.1

