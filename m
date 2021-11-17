Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1680EC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 17 Nov 2021 09:09:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E08E96128B
	for <linux-clk@archiver.kernel.org>; Wed, 17 Nov 2021 09:09:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234831AbhKQJMD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Nov 2021 04:12:03 -0500
Received: from mail-bn8nam11on2058.outbound.protection.outlook.com ([40.107.236.58]:60608
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234800AbhKQJMD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Nov 2021 04:12:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DiFrlljg1pnO9u2cFeoCIMoARlqvN0vd9OoPR1exiPyCoLSwiB6tXYwiNIp861C05YrZObjNmRov1xgbxSB0z4XfBP7AZZJLX4R4uCrzBas8cFa1gbeluzRFVpjRPh5xG6WiwlKwXWL9tROWeKXEydNe+fgoaGQAxUu13ZP+xJJWqZPYpC96jala3DHi4JEiPvgqu/TD9tTB1+vEwLArzG/XuBAMuLg8swfnBDTHIfpp3Zc+Eyg68/s6Kw4n9lQRHVyZcxxzbGHwoVfElsGO956CNu3KnWEC6+AswgHXhTDFd/menZCrcTi8Lg9HjydgqcthuuwjJFrjVnl9Q5SCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1H5qONqLYdxJCAI8QjwdvyNVwRFAsf8fkAm6D6E/bw0=;
 b=Fe0xP8fOCYkiQyrOGFuhgX/BEs64ibTRMl3U0Rm9xxIwo9FOCw1mE+b9XPtdLzMjA9NCz3jUbCoQ7BVjCe2Pal7XAvMuOGmgic0fpDIOUqXQ3t7PFcniYQEl4ePj7RL8iWvWo5d0sPjm6lqVE2bIV+LSRcxv4AXtr9TUDk06s0CH4orRiHdlhXfWjFGJWuRvOS+LVCtEN6qgMjl2bjAYhu8e9/m5kisayX7QuSxkV5t97cjppaMaCw8QNYhieBObId3RprVwPjmVnO/1lJdCB67Yo7VsIM8aR3QsWLqM3j02oUZp1xHnDAtaXMmWFt0UNhBKIMop+RH1jzcKcHYggA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1H5qONqLYdxJCAI8QjwdvyNVwRFAsf8fkAm6D6E/bw0=;
 b=PVxIV2WoQzVgJpLuSkQQ+1bp6v5pyR48ect/dbQxZ70QUd/m0KZ03cA/jDVS3oIGbYZqdRHVpLGA9/+G/Rpf6zDlu6oqEOQVdq7kZ+fkQPkHfns5FU2kYF23pmveVrjUkrn6KRqoEclk7o7Its7OLwq4PJ0xBhHDf34t71HGMP0=
Received: from SA9PR13CA0043.namprd13.prod.outlook.com (2603:10b6:806:22::18)
 by BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Wed, 17 Nov
 2021 09:09:03 +0000
Received: from SN1NAM02FT0025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:22:cafe::4f) by SA9PR13CA0043.outlook.office365.com
 (2603:10b6:806:22::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.17 via Frontend
 Transport; Wed, 17 Nov 2021 09:09:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0025.mail.protection.outlook.com (10.97.5.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Wed, 17 Nov 2021 09:09:03 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Nov 2021 01:08:58 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 17 Nov 2021 01:08:58 -0800
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 sboyd@kernel.org,
 mturquette@baylibre.com
Received: from [10.140.6.39] (port=52302 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mnGw6-000EE6-Bj; Wed, 17 Nov 2021 01:08:58 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>,
        <shubhrajyoti.datta.gmail.com@xilinx.com>, <git@xilinx.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH] clk: zynq: pll: Fix kernel-doc warnings
Date:   Wed, 17 Nov 2021 14:38:54 +0530
Message-ID: <9929a56462bfdd491c43c233abc4341fc14dac1d.1637139796.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 841ca5ed-f9ef-4bad-cf1a-08d9a9a9e6f1
X-MS-TrafficTypeDiagnostic: BL3PR02MB7938:
X-Microsoft-Antispam-PRVS: <BL3PR02MB793866C18A95625C8083F76EAA9A9@BL3PR02MB7938.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:279;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yv/4mqMzBRPpkkQAn3LvOK8CQyXU+kelvZKRj7u7IR9h1+PXgRRbdXMuFDVru0ccVtYs1YEJO36sZ+YUVZaYLclTfDLy+Fj4XLd7FGBed5tE4x+WhvMn5245m/2nu+9uanWaHBcldURJayS5j5oZbGT94tsB0jPkpPFxjHKxP9//hUIST8wQFOgwFehlw28Ao2Y3YmfCOVEX3Bvafj4/hzX/86UEfVlVEtMemqakThnhudD25T0ttbRC9H8UG+Zfk6+2htINtXl4NjXltVqn7gCkVlaRTvZmENc/3IPAsVIbtrB6ARBNKNbn0pkanYvYFfCf8lvV8z+0oFedc2olPck7NOq/96HSFRDRkcHMA+WEnv3QWvJAv3qxnCcP3GXwiikDgvQr1a1orarB+KUkrs4s08JG4KZdL5pQxRKm7MC+96ZsNNIreHndKnV1E1Arum+CMOJn5I/lcHHw8JDTkgQcPEl1fj+hRGwFzNdOKRgL0suxKZvrYi1lK1BQZup9te4X5s7RkIxrauacWOz0WDaPXdWw8OaATHTdMg77HuprGwGsJOJQy2LtMry06j6Rek1BcFmTNEG0ffWPcVVUT4f/uFpNP4v3ScKKaYEtxz6Msz3IPAMl5++bRXZudZwSnEz724dZ7nVCDYTOXrszKtZVFy9cuwNMh0dXsov6jtWSfgKl2CDtcYsJuCY+ZKxAUeIwv0+xvJNzm6KPTpvaSXPBwTTgQEqQ1TwyGR+dgGA=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(82310400003)(26005)(8676002)(54906003)(70206006)(70586007)(9786002)(186003)(5660300002)(316002)(2906002)(7696005)(36906005)(6916009)(508600001)(8936002)(44832011)(7636003)(47076005)(2616005)(107886003)(426003)(36860700001)(356005)(36756003)(83380400001)(6666004)(336012)(4326008)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:09:03.8000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 841ca5ed-f9ef-4bad-cf1a-08d9a9a9e6f1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB7938
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix the following kernel-doc warning

drivers/clk/zynq/pll.c:15: warning: missing initial short description on line:
 * struct zynq_pll
drivers/clk/zynq/pll.c:96: warning: No description found for return value of 'zynq_pll_is_enabled'
drivers/clk/zynq/pll.c:116: warning: No description found for return value of 'zynq_pll_enable'
drivers/clk/zynq/pll.c:187: warning: No description found for return value of 'clk_register_zynq_pll'

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/zynq/pll.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/zynq/pll.c b/drivers/clk/zynq/pll.c
index 54f4184de89a..e5f8fb704df2 100644
--- a/drivers/clk/zynq/pll.c
+++ b/drivers/clk/zynq/pll.c
@@ -12,7 +12,7 @@
 #include <linux/io.h>
 
 /**
- * struct zynq_pll
+ * struct zynq_pll - pll clock
  * @hw:		Handle between common and hardware-specific interfaces
  * @pll_ctrl:	PLL control register
  * @pll_status:	PLL status register
@@ -46,7 +46,7 @@ struct zynq_pll {
  * @hw:		Handle between common and hardware-specific interfaces
  * @rate:	Desired clock frequency
  * @prate:	Clock frequency of parent clock
- * Returns frequency closest to @rate the hardware can generate.
+ * Return:	frequency closest to @rate the hardware can generate.
  */
 static long zynq_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 		unsigned long *prate)
@@ -66,7 +66,7 @@ static long zynq_pll_round_rate(struct clk_hw *hw, unsigned long rate,
  * zynq_pll_recalc_rate() - Recalculate clock frequency
  * @hw:			Handle between common and hardware-specific interfaces
  * @parent_rate:	Clock frequency of parent clock
- * Returns current clock frequency.
+ * Return:		current clock frequency.
  */
 static unsigned long zynq_pll_recalc_rate(struct clk_hw *hw,
 		unsigned long parent_rate)
@@ -87,7 +87,7 @@ static unsigned long zynq_pll_recalc_rate(struct clk_hw *hw,
 /**
  * zynq_pll_is_enabled - Check if a clock is enabled
  * @hw:		Handle between common and hardware-specific interfaces
- * Returns 1 if the clock is enabled, 0 otherwise.
+ * Return:	1 if the clock is enabled, 0 otherwise.
  *
  * Not sure this is a good idea, but since disabled means bypassed for
  * this clock implementation we say we are always enabled.
@@ -110,7 +110,7 @@ static int zynq_pll_is_enabled(struct clk_hw *hw)
 /**
  * zynq_pll_enable - Enable clock
  * @hw:		Handle between common and hardware-specific interfaces
- * Returns 0 on success
+ * Return: 0 on success
  */
 static int zynq_pll_enable(struct clk_hw *hw)
 {
@@ -179,7 +179,7 @@ static const struct clk_ops zynq_pll_ops = {
  * @pll_status:	Pointer to PLL status register
  * @lock_index:	Bit index to this PLL's lock status bit in @pll_status
  * @lock:	Register lock
- * Returns handle to the registered clock.
+ * Return:	handle to the registered clock.
  */
 struct clk *clk_register_zynq_pll(const char *name, const char *parent,
 		void __iomem *pll_ctrl, void __iomem *pll_status, u8 lock_index,
-- 
2.25.1

