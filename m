Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34266C76195
	for <linux-clk@archiver.kernel.org>; Mon, 27 Mar 2023 06:26:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232043AbjC0G0q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Mar 2023 02:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjC0G0p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Mar 2023 02:26:45 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3144498
        for <linux-clk@vger.kernel.org>; Sun, 26 Mar 2023 23:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sxjad7xFdFHmDEL53MYVlrNCza20Ra91da82Zd8rSbhi32yu8BUOjMvvaHTRpI9Yi5X0Bu42vwdMJHWc+Xby6ZO4JbDM633KRAmra3+/V+ZlsccF3K6w814IDk5XPCVg1fX0PwN42RLQ1Am5qbf4No0KkLVBig5n8SHMjo2wPmyULqDNHXYXExBaspFMgJF/7Y0Ncicsjbd7d8pV1N5iMLLHeKu2iFQBL5UutYmC1axqxHHhNcD5eVDHgohivX0lT+5NxZEQhrXxXxN3ap3hEcAjPF/Y0WmXC0dZZETL+LWJevf9UyYaJskTcMqrWdq7KWqde8+DRrs6FPlBLZH55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfKXtTQbkOPKBxoxiIrdR2N0QD4VEh+kMILwQsQ//8M=;
 b=kZyAlPtXmoa67LXzMaGAllLgdKI+k0EEC6m7QsTmIRkqU7pVU5DvwBALQEHdXDLxw+CRHBO1gIcukNcPP9zY4ZsbaEHlf/feEwtUVLjL7zm8KSdxq0teQ6KDpfFylR+cjDsof6+VCAwUMVLTYgZFVre9Cf/8oTAmyLGuJKHzwTOL3/ujoOcHqqOIRmoUznWIw1p/Luna0TseG9UzWn94njDiUvUUqf8YpKa0tuadV/cBzuEf1Sbl5qSPn3llwT8xu+NkT521IelZ6pOjDMJwxbI/ZXfc1sKT/HTswL4l/uSHzsI7/uWyKTHkdWkXgminBkxIOz8rNYBwfdS3jyV78g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfKXtTQbkOPKBxoxiIrdR2N0QD4VEh+kMILwQsQ//8M=;
 b=I/3j7vrSoJb3aK1EMzSamE9HuyyDxc4XTFbDIT6BFZqI93tgPLtwJIcF3SOrfJ/0blYq8FBnbtAQ7cjF9a20s1KSH4whhdTh0r3CjRBMWKmIho2Jr++ayO/8+lHQsjbZuiEw0smEU6u/X19EXIYscqjtOFLF0uEZ6w913kefl+w=
Received: from DS7PR03CA0163.namprd03.prod.outlook.com (2603:10b6:5:3b2::18)
 by CH2PR12MB4230.namprd12.prod.outlook.com (2603:10b6:610:aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 06:26:41 +0000
Received: from DS1PEPF0000E645.namprd02.prod.outlook.com
 (2603:10b6:5:3b2:cafe::2b) by DS7PR03CA0163.outlook.office365.com
 (2603:10b6:5:3b2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.42 via Frontend
 Transport; Mon, 27 Mar 2023 06:26:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E645.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 06:26:41 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 01:26:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 26 Mar
 2023 23:26:40 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 27 Mar 2023 01:26:38 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@amd.com>, <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <michal.simek@xilinx.com>
Subject: [PATCH v4] clocking-wizard: Support higher frequency accuracy
Date:   Mon, 27 Mar 2023 11:56:37 +0530
Message-ID: <20230327062637.22237-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E645:EE_|CH2PR12MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: 0162020f-1fb9-437c-c106-08db2e8c3a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GTGc5P87lL7ztR6Q3iRjz6rJUbIRAQDtPz0rDRVJ970m+0DJlUP4rzuIQ6VlRb7gGZwVOB9Ni/6ci2hbOIuytJsQfmkzSH756DDgKojrR0pOOcCbBbxVrZ+ZuJhRP3yK3A0wy82qFmRI/rSYyl9fg9Q5AUVODScuVvRmDtGCZCXmPdCzG1+7oa6DKdpYYrCJx1DPTw2vNgSyqbQlCUFcQpxDZP843g2eaYnbGSxrOTkHatKbEu7maQYC/NJS5U29IX3xnGkZRi7knUV7y3YUv9T7ZDQhdrwtLMQ7agDqZyY9Dskafi++ah7WfQvIDOX0A477cdgIhuEgxuvNFiBYSTCBQN6yHRu5ymQPvF1gV4LyYSYYEU823ziGlQOqeoOl073r+IhTcz0wMpg6M/2rWq2ip/avgJzEnHrEQ7ZkE3gE6DZquJKpl2SINSmntpLGaGUJodsWVF01v6C09uwn7fTN21naGej0fmri9n0eRyDgD06QGAwYpsBSh8TdwJ55d7FroOFOQHgNFvIy5iEgvMDLoeowsgtsWFZ/bxBSvNW62lOarqlJdzQB+soD3WBTv3pLJBQNwUwNpj8GQSZN3xQoJGbFCYad4VVDp/xE2gi3dfan+Tut+3ZN3DAgVpbeQ0+2oWW2ceHnYrxIvNVHSRrcRcuyeXegr5jNbJJktmStXmyiTrAFyL8CekDYMFTVsiceB+1iREqclXqFT1Kb8RgUrMt/BIEiw6VkN5z5WJI=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(2906002)(47076005)(426003)(86362001)(83380400001)(186003)(336012)(2616005)(40460700003)(40480700001)(356005)(36756003)(36860700001)(82740400003)(81166007)(5660300002)(4326008)(6916009)(8676002)(8936002)(41300700001)(70586007)(70206006)(82310400005)(30864003)(44832011)(26005)(1076003)(316002)(478600001)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 06:26:41.0880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0162020f-1fb9-437c-c106-08db2e8c3a4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E645.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4230
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Change the multipliers and divisors to support a higher
frequency accuracy if there is only one output.
Currently only O is changed now we are changing M, D and O.
For multiple output case the earlier behavior is retained.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v4:
Remove a typecast
Add math for the clk_wzrd_round_rate_all
remove conditional lock
rename m, d, o variables

Changes in v3:
Move to devm
Remove the extra paranthesis
remove the cast

Changes in v2:
remove an unneeded assignment

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 228 ++++++++++++++++++---
 1 file changed, 204 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index c495d709f9e2..0347679e8622 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -8,12 +8,14 @@
  *
  */
 
+#include <linux/bitfield.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/iopoll.h>
@@ -37,6 +39,7 @@
 #define WZRD_CLKOUT_DIVIDE_MASK		(0xff << WZRD_DIVCLK_DIVIDE_SHIFT)
 #define WZRD_CLKOUT_FRAC_SHIFT		8
 #define WZRD_CLKOUT_FRAC_MASK		0x3ff
+#define WZRD_CLKOUT0_FRAC_MASK		GENMASK(17, 8)
 
 #define WZRD_DR_MAX_INT_DIV_VALUE	255
 #define WZRD_DR_STATUS_REG_OFFSET	0x04
@@ -49,6 +52,22 @@
 
 #define WZRD_USEC_POLL		10
 #define WZRD_TIMEOUT_POLL		1000
+
+/* Divider limits, from UG572 Table 3-4 for Ultrascale+ */
+#define DIV_O				0x01
+#define DIV_ALL				0x03
+
+#define WZRD_M_MIN			2
+#define WZRD_M_MAX			128
+#define WZRD_D_MIN			1
+#define WZRD_D_MAX			106
+#define WZRD_VCO_MIN			800000000
+#define WZRD_VCO_MAX			1600000000
+#define WZRD_O_MIN			1
+#define WZRD_O_MAX			128
+#define WZRD_MIN_ERR			20000
+#define WZRD_FRAC_POINTS		1000
+
 /* Get the mask from width */
 #define div_mask(width)			((1 << (width)) - 1)
 
@@ -97,6 +116,9 @@ struct clk_wzrd {
  * @width:	width of the divider bit field
  * @flags:	clk_wzrd divider flags
  * @table:	array of value/divider pairs, last entry should have div = 0
+ * @m:	value of the multiplier
+ * @d:	value of the common divider
+ * @o:	value of the leaf divider
  * @lock:	register lock
  */
 struct clk_wzrd_divider {
@@ -107,6 +129,9 @@ struct clk_wzrd_divider {
 	u8 width;
 	u8 flags;
 	const struct clk_div_table *table;
+	u32 m;
+	u32 d;
+	u32 o;
 	spinlock_t *lock;  /* divider lock */
 };
 
@@ -198,12 +223,155 @@ static long clk_wzrd_round_rate(struct clk_hw *hw, unsigned long rate,
 	return *prate / div;
 }
 
+static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	unsigned long vco_freq, freq, diff;
+	u32 m, d, o;
+
+	for (m = WZRD_M_MIN; m <= WZRD_M_MAX; m++) {
+		for (d = WZRD_D_MIN; d <= WZRD_D_MAX; d++) {
+			vco_freq = DIV_ROUND_CLOSEST((parent_rate * m), d);
+			if (vco_freq >= WZRD_VCO_MIN && vco_freq <= WZRD_VCO_MAX) {
+				for (o = WZRD_O_MIN; o <= WZRD_O_MAX; o++) {
+					freq = DIV_ROUND_CLOSEST_ULL(vco_freq, o);
+					diff = abs(freq - rate);
+
+					if (diff < WZRD_MIN_ERR) {
+						divider->m = m;
+						divider->d = d;
+						divider->o = o;
+						return 0;
+					}
+				}
+			}
+		}
+	}
+	return -EBUSY;
+}
+
+static int clk_wzrd_dynamic_all_nolock(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	unsigned long vco_freq, rate_div, clockout0_div;
+	u32 reg, pre, value, f;
+	int err;
+
+	err = clk_wzrd_get_divisors(hw, rate, parent_rate);
+	if (err)
+		return err;
+
+	vco_freq = DIV_ROUND_CLOSEST(parent_rate * divider->m, divider->d);
+	rate_div = DIV_ROUND_CLOSEST_ULL((vco_freq * WZRD_FRAC_POINTS), rate);
+
+	clockout0_div = div_u64(rate_div,  WZRD_FRAC_POINTS);
+
+	pre = DIV_ROUND_CLOSEST_ULL(vco_freq * WZRD_FRAC_POINTS, rate);
+	f = (pre - (clockout0_div * WZRD_FRAC_POINTS));
+	f &= WZRD_CLKOUT_FRAC_MASK;
+
+	reg = FIELD_PREP(WZRD_CLKOUT_DIVIDE_MASK, clockout0_div) |
+	      FIELD_PREP(WZRD_CLKOUT0_FRAC_MASK, f);
+
+	writel(reg, divider->base + WZRD_CLK_CFG_REG(2));
+	/* Set divisor and clear phase offset */
+	reg = FIELD_PREP(WZRD_CLKFBOUT_MULT_MASK, divider->m) |
+	      FIELD_PREP(WZRD_DIVCLK_DIVIDE_MASK, divider->d);
+	writel(reg, divider->base + WZRD_CLK_CFG_REG(0));
+	writel(divider->o, divider->base + WZRD_CLK_CFG_REG(2));
+	writel(0, divider->base + WZRD_CLK_CFG_REG(3));
+	/* Check status register */
+	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
+				 value & WZRD_DR_LOCK_BIT_MASK,
+				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+	if (err)
+		return -ETIMEDOUT;
+
+	/* Initiate reconfiguration */
+	writel(WZRD_DR_BEGIN_DYNA_RECONF,
+	       divider->base + WZRD_DR_INIT_REG_OFFSET);
+
+	/* Check status register */
+	return readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
+				 value & WZRD_DR_LOCK_BIT_MASK,
+				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+}
+
+static int clk_wzrd_dynamic_all(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	unsigned long flags = 0;
+	int ret;
+
+	spin_lock_irqsave(divider->lock, flags);
+
+	ret = clk_wzrd_dynamic_all_nolock(hw, rate, parent_rate);
+
+	spin_unlock_irqrestore(divider->lock, flags);
+
+	return ret;
+}
+
+static unsigned long clk_wzrd_recalc_rate_all(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	u32 m, d, o, div, reg, f;
+
+	reg = readl(divider->base + WZRD_CLK_CFG_REG(0));
+	d = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
+	m = FIELD_GET(WZRD_CLKFBOUT_MULT_MASK, reg);
+	reg = readl(divider->base + WZRD_CLK_CFG_REG(2));
+	o = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
+	f = FIELD_GET(WZRD_CLKOUT0_FRAC_MASK, reg);
+
+	div = DIV_ROUND_CLOSEST(d * (WZRD_FRAC_POINTS * o + f), WZRD_FRAC_POINTS);
+	return divider_recalc_rate(hw, parent_rate * m, div, divider->table,
+			divider->flags, divider->width);
+}
+
+static long clk_wzrd_round_rate_all(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *prate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	unsigned long int_freq;
+	u32 m, d, o, div, f;
+	int err;
+
+	err = clk_wzrd_get_divisors(hw, rate, *prate);
+	if (err)
+		return err;
+
+	m = divider->m;
+	d = divider->d;
+	o = divider->o;
+
+	div = d * o;
+	int_freq =  divider_recalc_rate(hw, *prate * m, div, divider->table,
+					divider->flags, divider->width);
+
+	if (rate > int_freq) {
+		f = DIV_ROUND_CLOSEST_ULL(rate * WZRD_FRAC_POINTS, int_freq);
+		rate = DIV_ROUND_CLOSEST(int_freq * f, WZRD_FRAC_POINTS);
+	}
+	return rate;
+}
+
 static const struct clk_ops clk_wzrd_clk_divider_ops = {
 	.round_rate = clk_wzrd_round_rate,
 	.set_rate = clk_wzrd_dynamic_reconfig,
 	.recalc_rate = clk_wzrd_recalc_rate,
 };
 
+static const struct clk_ops clk_wzrd_clk_div_all_ops = {
+	.round_rate = clk_wzrd_round_rate_all,
+	.set_rate = clk_wzrd_dynamic_all,
+	.recalc_rate = clk_wzrd_recalc_rate_all,
+};
+
 static unsigned long clk_wzrd_recalc_ratef(struct clk_hw *hw,
 					   unsigned long parent_rate)
 {
@@ -280,7 +448,7 @@ static struct clk *clk_wzrd_register_divf(struct device *dev,
 					  void __iomem *base, u16 offset,
 					  u8 shift, u8 width,
 					  u8 clk_divider_flags,
-					  const struct clk_div_table *table,
+					  u32 div_type,
 					  spinlock_t *lock)
 {
 	struct clk_wzrd_divider *div;
@@ -307,7 +475,6 @@ static struct clk *clk_wzrd_register_divf(struct device *dev,
 	div->flags = clk_divider_flags;
 	div->lock = lock;
 	div->hw.init = &init;
-	div->table = table;
 
 	hw = &div->hw;
 	ret =  devm_clk_hw_register(dev, hw);
@@ -324,7 +491,7 @@ static struct clk *clk_wzrd_register_divider(struct device *dev,
 					     void __iomem *base, u16 offset,
 					     u8 shift, u8 width,
 					     u8 clk_divider_flags,
-					     const struct clk_div_table *table,
+					     u32 div_type,
 					     spinlock_t *lock)
 {
 	struct clk_wzrd_divider *div;
@@ -337,7 +504,12 @@ static struct clk *clk_wzrd_register_divider(struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
-	init.ops = &clk_wzrd_clk_divider_ops;
+	if (clk_divider_flags & CLK_DIVIDER_READ_ONLY)
+		init.ops = &clk_divider_ro_ops;
+	else if (div_type == DIV_O)
+		init.ops = &clk_wzrd_clk_divider_ops;
+	else
+		init.ops = &clk_wzrd_clk_div_all_ops;
 	init.flags = flags;
 	init.parent_names =  &parent_name;
 	init.num_parents =  1;
@@ -349,7 +521,6 @@ static struct clk *clk_wzrd_register_divider(struct device *dev,
 	div->flags = clk_divider_flags;
 	div->lock = lock;
 	div->hw.init = &init;
-	div->table = table;
 
 	hw = &div->hw;
 	ret = devm_clk_hw_register(dev, hw);
@@ -425,6 +596,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	const char *clk_name;
 	void __iomem *ctrl_reg;
 	struct clk_wzrd *clk_wzrd;
+	const char *clkout_name;
 	struct device_node *np = pdev->dev.of_node;
 	int nr_outputs;
 	unsigned long flags = 0;
@@ -469,6 +641,26 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
+	ret = of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs);
+	if (ret || nr_outputs > WZRD_NUM_OUTPUTS) {
+		ret = -EINVAL;
+		goto err_disable_clk;
+	}
+
+	clkout_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_out0", dev_name(&pdev->dev));
+	if (nr_outputs == 1) {
+		clk_wzrd->clkout[0] = clk_wzrd_register_divider
+				(&pdev->dev, clkout_name,
+				__clk_get_name(clk_wzrd->clk_in1), 0,
+				clk_wzrd->base, WZRD_CLK_CFG_REG(3),
+				WZRD_CLKOUT_DIVIDE_SHIFT,
+				WZRD_CLKOUT_DIVIDE_WIDTH,
+				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
+				DIV_ALL, &clkwzrd_lock);
+
+		goto out;
+	}
+
 	reg = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0));
 	reg_f = reg & WZRD_CLKFBOUT_FRAC_MASK;
 	reg_f =  reg_f >> WZRD_CLKFBOUT_FRAC_SHIFT;
@@ -476,20 +668,11 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	reg = reg & WZRD_CLKFBOUT_MULT_MASK;
 	reg =  reg >> WZRD_CLKFBOUT_MULT_SHIFT;
 	mult = (reg * 1000) + reg_f;
-	clk_name = kasprintf(GFP_KERNEL, "%s_mul", dev_name(&pdev->dev));
+	clk_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_mul", dev_name(&pdev->dev));
 	if (!clk_name) {
 		ret = -ENOMEM;
 		goto err_disable_clk;
 	}
-
-	ret = of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs);
-	if (ret || nr_outputs > WZRD_NUM_OUTPUTS) {
-		ret = -EINVAL;
-		goto err_disable_clk;
-	}
-	if (nr_outputs == 1)
-		flags = CLK_SET_RATE_PARENT;
-
 	clk_wzrd->clks_internal[wzrd_clk_mul] = clk_register_fixed_factor
 			(&pdev->dev, clk_name,
 			 __clk_get_name(clk_wzrd->clk_in1),
@@ -500,7 +683,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
-	clk_name = kasprintf(GFP_KERNEL, "%s_mul_div", dev_name(&pdev->dev));
+	clk_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_mul_div", dev_name(&pdev->dev));
 	if (!clk_name) {
 		ret = -ENOMEM;
 		goto err_rm_int_clk;
@@ -521,9 +704,8 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 
 	/* register div per output */
 	for (i = nr_outputs - 1; i >= 0 ; i--) {
-		const char *clkout_name;
-
-		clkout_name = kasprintf(GFP_KERNEL, "%s_out%d", dev_name(&pdev->dev), i);
+		clkout_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+					     "%s_out%d", dev_name(&pdev->dev), i);
 		if (!clkout_name) {
 			ret = -ENOMEM;
 			goto err_rm_int_clk;
@@ -537,7 +719,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 				WZRD_CLKOUT_DIVIDE_SHIFT,
 				WZRD_CLKOUT_DIVIDE_WIDTH,
 				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
-				NULL, &clkwzrd_lock);
+				DIV_O, &clkwzrd_lock);
 		else
 			clk_wzrd->clkout[i] = clk_wzrd_register_divider
 				(&pdev->dev, clkout_name,
@@ -546,7 +728,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 				WZRD_CLKOUT_DIVIDE_SHIFT,
 				WZRD_CLKOUT_DIVIDE_WIDTH,
 				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
-				NULL, &clkwzrd_lock);
+				DIV_O, &clkwzrd_lock);
 		if (IS_ERR(clk_wzrd->clkout[i])) {
 			int j;
 
@@ -559,8 +741,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		}
 	}
 
-	kfree(clk_name);
-
+out:
 	clk_wzrd->clk_data.clks = clk_wzrd->clkout;
 	clk_wzrd->clk_data.clk_num = ARRAY_SIZE(clk_wzrd->clkout);
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_wzrd->clk_data);
@@ -585,7 +766,6 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 err_rm_int_clks:
 	clk_unregister(clk_wzrd->clks_internal[1]);
 err_rm_int_clk:
-	kfree(clk_name);
 	clk_unregister(clk_wzrd->clks_internal[0]);
 err_disable_clk:
 	clk_disable_unprepare(clk_wzrd->axi_clk);
-- 
2.17.1

