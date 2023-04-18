Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D86CC77B76
	for <linux-clk@archiver.kernel.org>; Tue, 18 Apr 2023 10:29:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbjDRK3w (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Apr 2023 06:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjDRK3v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Apr 2023 06:29:51 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1F021B9;
        Tue, 18 Apr 2023 03:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TShyXbgx2CgO99BJr6vJsn5kk2/2Tx8/6aHGb36+4fxncNB5fTN8Z33chTG/G5zou5CZkI1mSeuJZX3v+YRngsN9b7hFxoLnngPBz/hoDIUOGzFaerncAZkLe8TzNr/lqdU1zbPIDTpLMiJ+6Vs3YwvGPIgD9n3UlmmNowg8oXpaLFBGbERIHvs8896VCqxUZo+hpOCIXK6z5BHZ/mEKu2UJJ8yRWlnqDpQ7R/VBeoXkmZ+8vGbZl9znJqWow6SddCUWYXnP67Ra0MpakUi35HhD4FEmzrO/0+3FjepM5nu9+71f38XdxpiajeGVUvC7a9CAK2TkX/8zm8V+rFpg8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiVipD/8itmEtS/2bvLyxv27RhJ4jAVrnZEQVc2aObE=;
 b=G3ngvq5w0IBQflZXvih5QHwFGTL+Dbl1AJs5FSWXYoqySjqpz0oen1ILtA+sJjlCMEUQSr0trv616eiwmT+eIVWX5pVsF6NyXQtZgkTvTGF+jtM58CT7h1MVJdamggbSaOGBJORazmjy3J+zZABqRkA1JMzN/v1CJb0zE6mNop1NUEUJMKTtXMYxvaUMDQD+d7UzZOkwaBEwZxoXSN48MCnakjCn7vTzlDZtgDD1Kz0M92AdQTwnCyxxUIHqVLXmpZK0S6/SJLdkCfYyJP78BMlGcohVbqS0mft8VxNVxxy0e3JrUVki22EK6mTug77BwExxwbCuU8/xInZiPIipdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiVipD/8itmEtS/2bvLyxv27RhJ4jAVrnZEQVc2aObE=;
 b=Jux53DHceqro1LCwHr4NyUS/LYNndHTsX9YanKEXpfkSFxxS8hX+vXzLBL5xx98FkiK2wTIst3Dnsz5oCQzi+ZoT6JvJOsQfvv2e8skMUCympJkQLOilwzXZUxTas+RuhRLWBkNgjhRxtkitwHTQg9yOjF4X0Zy8sIop7z/ZWtk=
Received: from MW4PR04CA0362.namprd04.prod.outlook.com (2603:10b6:303:81::7)
 by DM6PR12MB4484.namprd12.prod.outlook.com (2603:10b6:5:28f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 10:29:45 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::c7) by MW4PR04CA0362.outlook.office365.com
 (2603:10b6:303:81::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 10:29:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 10:29:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 18 Apr
 2023 05:29:39 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 18 Apr 2023 05:29:36 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <devicetree@vger.kernel.org>
CC:     <git@amd.com>, <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <michal.simek@xilinx.com>
Subject: [PATCH v1 2/2] clocking-wizard: Add support for versal clocking wizard
Date:   Tue, 18 Apr 2023 15:58:55 +0530
Message-ID: <20230418102855.6791-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230418102855.6791-1-shubhrajyoti.datta@amd.com>
References: <20230418102855.6791-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT051:EE_|DM6PR12MB4484:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb58b5f-f55a-4d07-e24b-08db3ff7d3f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 81n09bJsKCduic6WpkamHpp7V8Oxrod7IHhPa4e2pE+fv//giyVaxogQdwlg2deqPIdqoEpeE989jLhHr+gcpFlZkAob+zCV8Czen+aI0LSqK8lHj8A6pNiS3dAZu7NdimkhtkaPP4ZR/AVMubXvvyndNNAPMKuq4b3CSXfZ9wvHyOaVfpVqdmyj19xB4QyEEC2d8caOoqKEmKozDuwGTObhN1OA7ejn3kHplyglPf+UdKkdyjjMWrrQtfaihZ9Ppd8YX/ASA0z8qz1CT/Qd3rasdqtGLgTIu18HeWoeF/RH2a5GqnCBe2ZzTGYCyrxQp9rP26mQmMBbtysoT4mOtFdzO67tmYtdmtxcz22Bmy8umoFwZhnGalgwLTn8N0wRZgdk1IoP0x+0wmy+xaInqyjN65fO+Hmr8qu6uxjWQIvqmdrk7ykKDUn57fbvu+cqar4SrdxcSvUHyv5QjMqnLfPnYwJU3j5lVRQShIxEX+ZEflQUbaJFX/g6BUE3tNwUOhUblXwtWsPat4zlhQYvUYV0COGsTUradyq0f/tseG3KNXr7JeHXoAu4weFn2VbPwTYL3d/DwPwcGGhljX7xQXUc1WHzTP8DlsFkg/BMKX9i89S78abmLxwL0ZD6PvgdW9gSy8KCaaY08gkYnFJHDHm6sAOfrdAZ372p/Vws7s3UuUhIjSYhgYOXb5ImYtVwJhK4/FVAVvEeUv7S7AIS4AL/dVRd3o2ZT87t9V23lOc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(36840700001)(40470700004)(46966006)(36756003)(8936002)(8676002)(40460700003)(44832011)(5660300002)(2906002)(30864003)(82310400005)(86362001)(40480700001)(478600001)(6666004)(54906003)(186003)(2616005)(36860700001)(1076003)(70586007)(70206006)(26005)(41300700001)(356005)(82740400003)(316002)(83380400001)(81166007)(6916009)(4326008)(47076005)(426003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 10:29:44.6851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb58b5f-f55a-4d07-e24b-08db3ff7d3f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4484
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Clocking Wizard for Versal adaptive compute acceleration platforms.
Add Versal clocking wizard support.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 506 ++++++++++++++++-----
 1 file changed, 400 insertions(+), 106 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index e83f104fad02..18247984582a 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -23,15 +23,41 @@
 #define WZRD_NUM_OUTPUTS	7
 #define WZRD_ACLK_MAX_FREQ	250000000UL
 
-#define WZRD_CLK_CFG_REG(n)	(0x200 + 4 * (n))
+#define WZRD_CLK_CFG_REG(v, n)	(0x200 + 0x130 * (v) + 4 * (n))
 
 #define WZRD_CLKOUT0_FRAC_EN	BIT(18)
-#define WZRD_CLKFBOUT_FRAC_EN	BIT(26)
+#define WZRD_CLKFBOUT_1		0
+#define WZRD_CLKFBOUT_2		1
+#define WZRD_CLKOUT0_1		2
+#define WZRD_CLKOUT0_2		3
+#define WZRD_DESKEW_2		20
+#define WZRD_DIVCLK		21
+#define WZRD_CLKFBOUT_4		51
+#define WZRD_CLKFBOUT_3		48
+#define WZRD_DUTY_CYCLE		2
+#define WZRD_O_DIV		4
+
+#define WZRD_CLKFBOUT_FRAC_EN	BIT(1)
+#define WZRD_CLKFBOUT_PREDIV2	(BIT(11) | BIT(12) | BIT(9))
+#define WZRD_MULT_PREDIV2	(BIT(10) | BIT(9) | BIT(12))
+#define WZRD_CLKFBOUT_EDGE	BIT(8)
+#define WZRD_P5EN		BIT(13)
+#define WZRD_P5EN_SHIFT		13
+#define WZRD_P5FEDGE		BIT(15)
+#define WZRD_DIVCLK_EDGE	BIT(10)
+#define WZRD_P5FEDGE_SHIFT	15
+#define WZRD_CLKOUT0_PREDIV2	BIT(11)
+#define WZRD_EDGE_SHIFT		8
 
 #define WZRD_CLKFBOUT_MULT_SHIFT	8
 #define WZRD_CLKFBOUT_MULT_MASK		(0xff << WZRD_CLKFBOUT_MULT_SHIFT)
+#define WZRD_CLKFBOUT_L_SHIFT	0
+#define WZRD_CLKFBOUT_H_SHIFT	8
+#define WZRD_CLKFBOUT_L_MASK	GENMASK(7, 0)
+#define WZRD_CLKFBOUT_H_MASK	GENMASK(15, 8)
 #define WZRD_CLKFBOUT_FRAC_SHIFT	16
 #define WZRD_CLKFBOUT_FRAC_MASK		(0x3ff << WZRD_CLKFBOUT_FRAC_SHIFT)
+#define WZRD_VERSAL_FRAC_MASK		GENMASK(5, 0)
 #define WZRD_DIVCLK_DIVIDE_SHIFT	0
 #define WZRD_DIVCLK_DIVIDE_MASK		(0xff << WZRD_DIVCLK_DIVIDE_SHIFT)
 #define WZRD_CLKOUT_DIVIDE_SHIFT	0
@@ -45,6 +71,7 @@
 #define WZRD_DR_STATUS_REG_OFFSET	0x04
 #define WZRD_DR_LOCK_BIT_MASK		0x00000001
 #define WZRD_DR_INIT_REG_OFFSET		0x25C
+#define WZRD_DR_INIT_VERSAL_OFFSET	0x14
 #define WZRD_DR_DIV_TO_PHASE_OFFSET	4
 #define WZRD_DR_BEGIN_DYNA_RECONF	0x03
 #define WZRD_DR_BEGIN_DYNA_RECONF_5_2	0x07
@@ -52,6 +79,8 @@
 
 #define WZRD_USEC_POLL		10
 #define WZRD_TIMEOUT_POLL		1000
+#define WZRD_FRAC_GRADIENT		64
+#define PREDIV2_MULT			2
 
 /* Divider limits, from UG572 Table 3-4 for Ultrascale+ */
 #define DIV_O				0x01
@@ -65,6 +94,14 @@
 #define WZRD_VCO_MAX			1600000000
 #define WZRD_O_MIN			1
 #define WZRD_O_MAX			128
+#define VER_WZRD_M_MIN			4
+#define VER_WZRD_M_MAX			432
+#define VER_WZRD_D_MIN			1
+#define VER_WZRD_D_MAX			123
+#define VER_WZRD_VCO_MIN		2160000000
+#define VER_WZRD_VCO_MAX		4320000000
+#define VER_WZRD_O_MIN			2
+#define VER_WZRD_O_MAX			511
 #define WZRD_MIN_ERR			20000
 #define WZRD_FRAC_POINTS		1000
 
@@ -120,6 +157,7 @@ struct clk_wzrd {
  * @d:	value of the common divider
  * @o:	value of the leaf divider
  * @lock:	register lock
+ * @is_versal:	Flag indicating if it versal device
  */
 struct clk_wzrd_divider {
 	struct clk_hw hw;
@@ -133,6 +171,11 @@ struct clk_wzrd_divider {
 	u32 d;
 	u32 o;
 	spinlock_t *lock;  /* divider lock */
+	bool is_versal;
+};
+
+struct versal_clk_data {
+	bool is_versal;
 };
 
 #define to_clk_wzrd(_nb) container_of(_nb, struct clk_wzrd, nb)
@@ -152,51 +195,98 @@ static unsigned long clk_wzrd_recalc_rate(struct clk_hw *hw,
 {
 	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
 	void __iomem *div_addr = divider->base + divider->offset;
-	unsigned int val;
+	u32 div, p5en, edge, prediv2, all;
+	unsigned int val, vall, valh;
 
-	val = readl(div_addr) >> divider->shift;
-	val &= div_mask(divider->width);
+	if (!divider->is_versal) {
+		val = readl(div_addr) >> divider->shift;
+		val &= div_mask(divider->width);
 
-	return divider_recalc_rate(hw, parent_rate, val, divider->table,
-			divider->flags, divider->width);
+		return divider_recalc_rate(hw, parent_rate, val, divider->table,
+				divider->flags, divider->width);
+	}
+
+	edge = !!(readl(div_addr) & WZRD_CLKFBOUT_EDGE);
+	p5en = !!(readl(div_addr) & WZRD_P5EN);
+	prediv2 = !!(readl(div_addr) & WZRD_CLKOUT0_PREDIV2);
+	vall = readl(div_addr + 4) & WZRD_CLKFBOUT_L_MASK;
+	valh = readl(div_addr + 4) >> WZRD_CLKFBOUT_H_SHIFT;
+	all = valh + vall + edge;
+	if (!all)
+		all = 1;
+
+	if (prediv2)
+		div = 2 * all + prediv2 * p5en;
+	else
+		div = all;
+
+	return DIV_ROUND_UP_ULL((u64)parent_rate, div);
 }
 
 static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
 				     unsigned long parent_rate)
 {
-	int err;
-	u32 value;
-	unsigned long flags = 0;
 	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
 	void __iomem *div_addr = divider->base + divider->offset;
+	u32 value, regh, edged, p5en, p5fedge, regval, regval1;
+	unsigned long flags = 0;
+	int err;
 
 	if (divider->lock)
 		spin_lock_irqsave(divider->lock, flags);
 	else
 		__acquire(divider->lock);
 
-	value = DIV_ROUND_CLOSEST(parent_rate, rate);
-
-	/* Cap the value to max */
-	min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
-
-	/* Set divisor and clear phase offset */
-	writel(value, div_addr);
-	writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
-
-	/* Check status register */
-	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
-				 value, value & WZRD_DR_LOCK_BIT_MASK,
-				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
-	if (err)
-		goto err_reconfig;
-
-	/* Initiate reconfiguration */
-	writel(WZRD_DR_BEGIN_DYNA_RECONF_5_2,
-	       divider->base + WZRD_DR_INIT_REG_OFFSET);
-	writel(WZRD_DR_BEGIN_DYNA_RECONF1_5_2,
-	       divider->base + WZRD_DR_INIT_REG_OFFSET);
-
+	if (!divider->is_versal) {
+		value = DIV_ROUND_CLOSEST(parent_rate, rate);
+
+		/* Cap the value to max */
+		min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
+
+		/* Set divisor and clear phase offset */
+		writel(value, div_addr);
+		writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
+
+		/* Check status register */
+		err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
+					 value, value & WZRD_DR_LOCK_BIT_MASK,
+					 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+		if (err)
+			goto err_reconfig;
+
+		/* Initiate reconfiguration */
+		writel(WZRD_DR_BEGIN_DYNA_RECONF_5_2,
+		       divider->base + WZRD_DR_INIT_REG_OFFSET);
+		writel(WZRD_DR_BEGIN_DYNA_RECONF1_5_2,
+		       divider->base + WZRD_DR_INIT_REG_OFFSET);
+
+	} else {
+		regh = (value / 4);
+		regval1 = readl(div_addr);
+		regval1 |= WZRD_CLKFBOUT_PREDIV2;
+		regval1 = regval1 & ~(WZRD_CLKFBOUT_EDGE | WZRD_P5EN | WZRD_P5FEDGE);
+		if (value % 4 > 1) {
+			edged = 1;
+			regval1 |= (edged << WZRD_EDGE_SHIFT);
+		}
+		p5fedge = value % 2;
+		p5en = value % 2;
+		regval1 = regval1 | p5en << WZRD_P5EN_SHIFT | p5fedge << WZRD_P5FEDGE_SHIFT;
+		writel(regval1, div_addr);
+
+		regval = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
+		writel(regval, div_addr + 4);
+		/* Check status register */
+		err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
+					 value, value & WZRD_DR_LOCK_BIT_MASK,
+					 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+		if (err)
+			goto err_reconfig;
+
+		/* Initiate reconfiguration */
+		writel(WZRD_DR_BEGIN_DYNA_RECONF,
+		       divider->base + WZRD_DR_INIT_VERSAL_OFFSET);
+	}
 	/* Check status register */
 	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
 				 value, value & WZRD_DR_LOCK_BIT_MASK,
@@ -227,14 +317,35 @@ static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
 				 unsigned long parent_rate)
 {
 	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
-	unsigned long vco_freq, freq, diff;
+	unsigned long vco_freq, freq, diff, vcomin, vcomax;
 	u32 m, d, o;
+	u32 mmin, mmax, dmin, dmax, omin, omax;
+
+	if (divider->is_versal) {
+		mmin = VER_WZRD_M_MIN;
+		mmax = VER_WZRD_M_MAX;
+		dmin = VER_WZRD_D_MIN;
+		dmax = VER_WZRD_D_MAX;
+		omin = VER_WZRD_O_MIN;
+		omax = VER_WZRD_O_MAX;
+		vcomin = VER_WZRD_VCO_MIN;
+		vcomax = VER_WZRD_VCO_MAX;
+	} else {
+		mmin = WZRD_M_MIN;
+		mmax = WZRD_M_MAX;
+		dmin = WZRD_D_MIN;
+		dmax = WZRD_D_MAX;
+		omin = WZRD_O_MIN;
+		omax = WZRD_O_MAX;
+		vcomin = WZRD_VCO_MIN;
+		vcomax = WZRD_VCO_MAX;
+	}
 
-	for (m = WZRD_M_MIN; m <= WZRD_M_MAX; m++) {
-		for (d = WZRD_D_MIN; d <= WZRD_D_MAX; d++) {
+	for (m = mmin; m <= mmax; m++) {
+		for (d = dmin; d <= dmax; d++) {
 			vco_freq = DIV_ROUND_CLOSEST((parent_rate * m), d);
-			if (vco_freq >= WZRD_VCO_MIN && vco_freq <= WZRD_VCO_MAX) {
-				for (o = WZRD_O_MIN; o <= WZRD_O_MAX; o++) {
+			if (vco_freq >= vcomin && vco_freq <= vcomax) {
+				for (o = omin; o <= omax; o++) {
 					freq = DIV_ROUND_CLOSEST_ULL(vco_freq, o);
 					diff = abs(freq - rate);
 
@@ -254,8 +365,10 @@ static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
 static int clk_wzrd_dynamic_all_nolock(struct clk_hw *hw, unsigned long rate,
 				       unsigned long parent_rate)
 {
+	u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
 	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
 	unsigned long vco_freq, rate_div, clockout0_div;
+	void __iomem *div_addr = divider->base;
 	u32 reg, pre, value, f;
 	int err;
 
@@ -263,25 +376,80 @@ static int clk_wzrd_dynamic_all_nolock(struct clk_hw *hw, unsigned long rate,
 	if (err)
 		return err;
 
-	vco_freq = DIV_ROUND_CLOSEST(parent_rate * divider->m, divider->d);
-	rate_div = DIV_ROUND_CLOSEST_ULL((vco_freq * WZRD_FRAC_POINTS), rate);
-
-	clockout0_div = div_u64(rate_div,  WZRD_FRAC_POINTS);
-
-	pre = DIV_ROUND_CLOSEST_ULL(vco_freq * WZRD_FRAC_POINTS, rate);
-	f = (pre - (clockout0_div * WZRD_FRAC_POINTS));
-	f &= WZRD_CLKOUT_FRAC_MASK;
-
-	reg = FIELD_PREP(WZRD_CLKOUT_DIVIDE_MASK, clockout0_div) |
-	      FIELD_PREP(WZRD_CLKOUT0_FRAC_MASK, f);
+	if (divider->is_versal) {
+		writel(0, divider->base + WZRD_CLK_CFG_REG(divider->is_versal, WZRD_CLKFBOUT_4));
+
+		m = divider->m;
+		edged = m % WZRD_DUTY_CYCLE;
+		regh = m / WZRD_DUTY_CYCLE;
+		regval1 = readl(divider->base + WZRD_CLK_CFG_REG(divider->is_versal,
+								 WZRD_CLKFBOUT_1));
+		regval1 |= WZRD_MULT_PREDIV2;
+		if (edged)
+			regval1 = regval1 | WZRD_CLKFBOUT_EDGE;
+		else
+			regval1 = regval1 & ~WZRD_CLKFBOUT_EDGE;
+
+		writel(regval1, divider->base + WZRD_CLK_CFG_REG(divider->is_versal,
+								 WZRD_CLKFBOUT_1));
+		regval1 = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
+		writel(regval1, divider->base + WZRD_CLK_CFG_REG(divider->is_versal,
+								 WZRD_CLKFBOUT_2));
+
+		value2 = divider->d;
+		edged = value2 % WZRD_DUTY_CYCLE;
+		regh = (value2 / WZRD_DUTY_CYCLE);
+		regval1 = FIELD_PREP(WZRD_DIVCLK_EDGE, edged);
+		writel(regval1, divider->base + WZRD_CLK_CFG_REG(divider->is_versal,
+								 WZRD_DESKEW_2));
+		regval1 = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
+		writel(regval1, divider->base + WZRD_CLK_CFG_REG(divider->is_versal, WZRD_DIVCLK));
+
+		value = divider->o;
+		regh = value / WZRD_O_DIV;
+		regval1 = readl(divider->base + WZRD_CLK_CFG_REG(divider->is_versal,
+								 WZRD_CLKOUT0_1));
+		regval1 |= WZRD_CLKFBOUT_PREDIV2;
+		regval1 = regval1 & ~(WZRD_CLKFBOUT_EDGE | WZRD_P5EN | WZRD_P5FEDGE);
+
+		if (value % WZRD_O_DIV > 1) {
+			edged = 1;
+			regval1 |= edged << WZRD_CLKFBOUT_H_SHIFT;
+		}
 
-	writel(reg, divider->base + WZRD_CLK_CFG_REG(2));
-	/* Set divisor and clear phase offset */
-	reg = FIELD_PREP(WZRD_CLKFBOUT_MULT_MASK, divider->m) |
-	      FIELD_PREP(WZRD_DIVCLK_DIVIDE_MASK, divider->d);
-	writel(reg, divider->base + WZRD_CLK_CFG_REG(0));
-	writel(divider->o, divider->base + WZRD_CLK_CFG_REG(2));
-	writel(0, divider->base + WZRD_CLK_CFG_REG(3));
+		p5fedge = value % WZRD_DUTY_CYCLE;
+		p5en = value % WZRD_DUTY_CYCLE;
+
+		regval1 = regval1 | FIELD_PREP(WZRD_P5EN, p5en) | FIELD_PREP(WZRD_P5FEDGE, p5fedge);
+		writel(regval1, divider->base + WZRD_CLK_CFG_REG(divider->is_versal,
+								 WZRD_CLKOUT0_1));
+		regval = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
+		writel(regval, divider->base + WZRD_CLK_CFG_REG(divider->is_versal,
+								WZRD_CLKOUT0_2));
+		div_addr = divider->base + WZRD_DR_INIT_VERSAL_OFFSET;
+
+	} else {
+		vco_freq = DIV_ROUND_CLOSEST(parent_rate * divider->m, divider->d);
+		rate_div = DIV_ROUND_CLOSEST_ULL((vco_freq * WZRD_FRAC_POINTS), rate);
+
+		clockout0_div = div_u64(rate_div,  WZRD_FRAC_POINTS);
+
+		pre = DIV_ROUND_CLOSEST_ULL(vco_freq * WZRD_FRAC_POINTS, rate);
+		f = (pre - (clockout0_div * WZRD_FRAC_POINTS));
+		f &= WZRD_CLKOUT_FRAC_MASK;
+
+		reg = FIELD_PREP(WZRD_CLKOUT_DIVIDE_MASK, clockout0_div) |
+		      FIELD_PREP(WZRD_CLKOUT0_FRAC_MASK, f);
+
+		writel(reg, divider->base + WZRD_CLK_CFG_REG(divider->is_versal, 2));
+		/* Set divisor and clear phase offset */
+		reg = FIELD_PREP(WZRD_CLKFBOUT_MULT_MASK, divider->m) |
+		      FIELD_PREP(WZRD_DIVCLK_DIVIDE_MASK, divider->d);
+		writel(reg, divider->base + WZRD_CLK_CFG_REG(divider->is_versal, 0));
+		writel(divider->o, divider->base + WZRD_CLK_CFG_REG(divider->is_versal, 2));
+		writel(0, divider->base + WZRD_CLK_CFG_REG(divider->is_versal, 3));
+		div_addr = divider->base + WZRD_DR_INIT_REG_OFFSET;
+	}
 	/* Check status register */
 	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
 				 value & WZRD_DR_LOCK_BIT_MASK,
@@ -290,9 +458,7 @@ static int clk_wzrd_dynamic_all_nolock(struct clk_hw *hw, unsigned long rate,
 		return -ETIMEDOUT;
 
 	/* Initiate reconfiguration */
-	writel(WZRD_DR_BEGIN_DYNA_RECONF,
-	       divider->base + WZRD_DR_INIT_REG_OFFSET);
-
+	writel(WZRD_DR_BEGIN_DYNA_RECONF, div_addr);
 	/* Check status register */
 	return readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
 				 value & WZRD_DR_LOCK_BIT_MASK,
@@ -319,17 +485,77 @@ static unsigned long clk_wzrd_recalc_rate_all(struct clk_hw *hw,
 					      unsigned long parent_rate)
 {
 	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
 	u32 m, d, o, div, reg, f;
 
-	reg = readl(divider->base + WZRD_CLK_CFG_REG(0));
-	d = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
-	m = FIELD_GET(WZRD_CLKFBOUT_MULT_MASK, reg);
-	reg = readl(divider->base + WZRD_CLK_CFG_REG(2));
-	o = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
-	f = FIELD_GET(WZRD_CLKOUT0_FRAC_MASK, reg);
+	if (!divider->is_versal) {
+		reg = readl(divider->base + WZRD_CLK_CFG_REG(divider->is_versal, 0));
+		d = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
+		m = FIELD_GET(WZRD_CLKFBOUT_MULT_MASK, reg);
+		reg = readl(divider->base + WZRD_CLK_CFG_REG(divider->is_versal, 2));
+		o = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
+		f = FIELD_GET(WZRD_CLKOUT0_FRAC_MASK, reg);
+
+		div = DIV_ROUND_CLOSEST(d * (WZRD_FRAC_POINTS * o + f), WZRD_FRAC_POINTS);
+		return divider_recalc_rate(hw, parent_rate * m, div, divider->table,
+			divider->flags, divider->width);
+	}
+	edge = !!(readl(divider->base + WZRD_CLK_CFG_REG(divider->is_versal, WZRD_CLKFBOUT_1)) &
+			WZRD_CLKFBOUT_EDGE);
+
+	reg = readl(divider->base + WZRD_CLK_CFG_REG(divider->is_versal, WZRD_CLKFBOUT_2));
+	regl = FIELD_GET(WZRD_CLKFBOUT_L_MASK, reg);
+	regh = FIELD_GET(WZRD_CLKFBOUT_H_MASK, reg);
+
+	mult = regl + regh + edge;
+	if (!mult)
+		mult = 1;
+
+	regl = readl(divider->base + WZRD_CLK_CFG_REG(divider->is_versal, WZRD_CLKFBOUT_4)) &
+		     WZRD_CLKFBOUT_FRAC_EN;
+	if (regl) {
+		regl = readl(divider->base + WZRD_CLK_CFG_REG(divider->is_versal, WZRD_CLKFBOUT_3))
+				& WZRD_VERSAL_FRAC_MASK;
+		mult = mult * WZRD_FRAC_GRADIENT + regl;
+		parent_rate = DIV_ROUND_CLOSEST((parent_rate * mult), WZRD_FRAC_GRADIENT);
+	} else {
+		parent_rate = parent_rate * mult;
+	}
+
+	/* O Calculation */
+	reg = readl(divider->base + WZRD_CLK_CFG_REG(divider->is_versal, WZRD_CLKOUT0_1));
+	edged = FIELD_GET(WZRD_CLKFBOUT_EDGE, reg);
+	p5en = FIELD_GET(WZRD_P5EN, reg);
+	prediv2 = FIELD_GET(WZRD_CLKOUT0_PREDIV2, reg);
+
+	reg = readl(divider->base + WZRD_CLK_CFG_REG(divider->is_versal, WZRD_CLKOUT0_2));
+	/* Low time */
+	regl = FIELD_GET(WZRD_CLKFBOUT_L_MASK, reg);
+	/* High time */
+	regh = FIELD_GET(WZRD_CLKFBOUT_H_MASK, reg);
+	all = regh + regl + edged;
+	if (!all)
+		all = 1;
+
+	if (prediv2)
+		div2 = PREDIV2_MULT * all + p5en;
+	else
+		div2 = all;
+
+	/* D calculation */
+	edged = !!(readl(divider->base + WZRD_CLK_CFG_REG(divider->is_versal, WZRD_DESKEW_2)) &
+		     WZRD_DIVCLK_EDGE);
+	reg = readl(divider->base + WZRD_CLK_CFG_REG(divider->is_versal, WZRD_DIVCLK));
+	/* Low time */
+	regl = FIELD_GET(WZRD_CLKFBOUT_L_MASK, reg);
+	/* High time */
+	regh = FIELD_GET(WZRD_CLKFBOUT_H_MASK, reg);
+	div = regl + regh + edged;
+	if (!div)
+		div = 1;
 
-	div = DIV_ROUND_CLOSEST(d * (WZRD_FRAC_POINTS * o + f), WZRD_FRAC_POINTS);
-	return divider_recalc_rate(hw, parent_rate * m, div, divider->table,
+	div = div * div2;
+	return divider_recalc_rate(hw, parent_rate, div, divider->table,
 			divider->flags, divider->width);
 }
 
@@ -492,6 +718,7 @@ static struct clk *clk_wzrd_register_divider(struct device *dev,
 					     u8 shift, u8 width,
 					     u8 clk_divider_flags,
 					     u32 div_type,
+					     bool is_versal,
 					     spinlock_t *lock)
 {
 	struct clk_wzrd_divider *div;
@@ -520,6 +747,7 @@ static struct clk *clk_wzrd_register_divider(struct device *dev,
 	div->width = width;
 	div->flags = clk_divider_flags;
 	div->lock = lock;
+	div->is_versal = is_versal;
 	div->hw.init = &init;
 
 	hw = &div->hw;
@@ -588,18 +816,34 @@ static int __maybe_unused clk_wzrd_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(clk_wzrd_dev_pm_ops, clk_wzrd_suspend,
 			 clk_wzrd_resume);
 
+static const struct versal_clk_data versal_data = {
+	.is_versal	= true,
+};
+
+static const struct of_device_id clk_wzrd_ids[] = {
+	{ .compatible = "xlnx,versal-clk-wizard", .data = &versal_data },
+	{ .compatible = "xlnx,clocking-wizard"   },
+	{ .compatible = "xlnx,clocking-wizard-v5.2"   },
+	{ .compatible = "xlnx,clocking-wizard-v6.0"  },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, clk_wzrd_ids);
+
 static int clk_wzrd_probe(struct platform_device *pdev)
 {
+	const char *clkout_name, *clk_name, *clk_mul_name;
+	u32 regl, regh, edge, regld, reghd, edged, div;
+	const struct versal_clk_data *data;
+	const struct of_device_id *match;
 	int i, ret;
 	u32 reg, reg_f, mult;
 	unsigned long rate;
-	const char *clk_name;
 	void __iomem *ctrl_reg;
 	struct clk_wzrd *clk_wzrd;
-	const char *clkout_name;
 	struct device_node *np = pdev->dev.of_node;
 	int nr_outputs;
 	unsigned long flags = 0;
+	bool is_versal = 0;
 
 	clk_wzrd = devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
 	if (!clk_wzrd)
@@ -647,27 +891,58 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
+	match = of_match_node(clk_wzrd_ids, np);
+	if (!match) {
+		dev_err(&pdev->dev, "of_match_node failed\n");
+		return -ENODEV;
+	}
+
+	data = match->data;
+	if (data)
+		is_versal = data->is_versal;
+
 	clkout_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_out0", dev_name(&pdev->dev));
 	if (nr_outputs == 1) {
 		clk_wzrd->clkout[0] = clk_wzrd_register_divider
 				(&pdev->dev, clkout_name,
 				__clk_get_name(clk_wzrd->clk_in1), 0,
-				clk_wzrd->base, WZRD_CLK_CFG_REG(3),
+				clk_wzrd->base, WZRD_CLK_CFG_REG(is_versal, 3),
 				WZRD_CLKOUT_DIVIDE_SHIFT,
 				WZRD_CLKOUT_DIVIDE_WIDTH,
 				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
-				DIV_ALL, &clkwzrd_lock);
+				DIV_ALL, is_versal, &clkwzrd_lock);
 
 		goto out;
 	}
-
-	reg = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0));
-	reg_f = reg & WZRD_CLKFBOUT_FRAC_MASK;
-	reg_f =  reg_f >> WZRD_CLKFBOUT_FRAC_SHIFT;
-
-	reg = reg & WZRD_CLKFBOUT_MULT_MASK;
-	reg =  reg >> WZRD_CLKFBOUT_MULT_SHIFT;
-	mult = (reg * 1000) + reg_f;
+	if (is_versal) {
+		/* register multiplier */
+		edge = !!(readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 0)) &
+				BIT(8));
+		regl = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 1)) &
+			     WZRD_CLKFBOUT_L_MASK) >> WZRD_CLKFBOUT_L_SHIFT;
+		regh = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 1)) &
+			     WZRD_CLKFBOUT_H_MASK) >> WZRD_CLKFBOUT_H_SHIFT;
+		mult = regl + regh + edge;
+		if (!mult)
+			mult = 1;
+		mult = mult * WZRD_FRAC_GRADIENT;
+
+		regl = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 51)) &
+			     WZRD_CLKFBOUT_FRAC_EN;
+		if (regl) {
+			regl = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 48)) &
+				WZRD_VERSAL_FRAC_MASK;
+			mult = mult + regl;
+		}
+	} else {
+		reg = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 0));
+		reg_f = reg & WZRD_CLKFBOUT_FRAC_MASK;
+		reg_f =  reg_f >> WZRD_CLKFBOUT_FRAC_SHIFT;
+
+		reg = reg & WZRD_CLKFBOUT_MULT_MASK;
+		reg =  reg >> WZRD_CLKFBOUT_MULT_SHIFT;
+		mult = (reg * 1000) + reg_f;
+	}
 	clk_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_mul", dev_name(&pdev->dev));
 	if (!clk_name) {
 		ret = -ENOMEM;
@@ -689,13 +964,29 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		goto err_rm_int_clk;
 	}
 
-	ctrl_reg = clk_wzrd->base + WZRD_CLK_CFG_REG(0);
-	/* register div */
-	clk_wzrd->clks_internal[wzrd_clk_mul_div] = clk_register_divider
+	if (is_versal) {
+		edged = !!(readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 20)) &
+			     BIT(10));
+		regld = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 21)) &
+			     WZRD_CLKFBOUT_L_MASK) >> WZRD_CLKFBOUT_L_SHIFT;
+		reghd = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 21)) &
+		     WZRD_CLKFBOUT_H_MASK) >> WZRD_CLKFBOUT_H_SHIFT;
+		div = (regld  + reghd + edged);
+		if (!div)
+			div = 1;
+
+		clk_mul_name = __clk_get_name(clk_wzrd->clks_internal[wzrd_clk_mul]);
+		clk_wzrd->clks_internal[wzrd_clk_mul_div] =
+			clk_register_fixed_factor(&pdev->dev, clk_name,
+						  clk_mul_name, 0, 1, div);
+	} else {
+		ctrl_reg = clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 0);
+		clk_wzrd->clks_internal[wzrd_clk_mul_div] = clk_register_divider
 			(&pdev->dev, clk_name,
 			 __clk_get_name(clk_wzrd->clks_internal[wzrd_clk_mul]),
 			flags, ctrl_reg, 0, 8, CLK_DIVIDER_ONE_BASED |
 			CLK_DIVIDER_ALLOW_ZERO, &clkwzrd_lock);
+	}
 	if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div])) {
 		dev_err(&pdev->dev, "unable to register divider clock\n");
 		ret = PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div]);
@@ -711,24 +1002,35 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 			goto err_rm_int_clk;
 		}
 
-		if (!i)
-			clk_wzrd->clkout[i] = clk_wzrd_register_divf
-				(&pdev->dev, clkout_name,
-				clk_name, flags,
-				clk_wzrd->base, (WZRD_CLK_CFG_REG(2) + i * 12),
-				WZRD_CLKOUT_DIVIDE_SHIFT,
-				WZRD_CLKOUT_DIVIDE_WIDTH,
-				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
-				DIV_O, &clkwzrd_lock);
-		else
+		if (is_versal) {
 			clk_wzrd->clkout[i] = clk_wzrd_register_divider
-				(&pdev->dev, clkout_name,
-				clk_name, 0,
-				clk_wzrd->base, (WZRD_CLK_CFG_REG(2) + i * 12),
-				WZRD_CLKOUT_DIVIDE_SHIFT,
-				WZRD_CLKOUT_DIVIDE_WIDTH,
-				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
-				DIV_O, &clkwzrd_lock);
+						(&pdev->dev,
+						 clkout_name, clk_name, 0,
+						 clk_wzrd->base,
+						 (WZRD_CLK_CFG_REG(is_versal, 3) + i * 8),
+						 WZRD_CLKOUT_DIVIDE_SHIFT,
+						 WZRD_CLKOUT_DIVIDE_WIDTH,
+						 CLK_DIVIDER_ONE_BASED |
+						 CLK_DIVIDER_ALLOW_ZERO,
+						 DIV_O, true, &clkwzrd_lock);
+		} else {
+			if (!i)
+				clk_wzrd->clkout[i] = clk_wzrd_register_divf
+					(&pdev->dev, clkout_name, clk_name, flags, clk_wzrd->base,
+					(WZRD_CLK_CFG_REG(is_versal, 2) + i * 12),
+					WZRD_CLKOUT_DIVIDE_SHIFT,
+					WZRD_CLKOUT_DIVIDE_WIDTH,
+					CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
+					DIV_O, &clkwzrd_lock);
+			else
+				clk_wzrd->clkout[i] = clk_wzrd_register_divider
+					(&pdev->dev, clkout_name, clk_name, 0, clk_wzrd->base,
+					(WZRD_CLK_CFG_REG(is_versal, 2) + i * 12),
+					WZRD_CLKOUT_DIVIDE_SHIFT,
+					WZRD_CLKOUT_DIVIDE_WIDTH,
+					CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
+					DIV_O, false,  &clkwzrd_lock);
+		}
 		if (IS_ERR(clk_wzrd->clkout[i])) {
 			int j;
 
@@ -793,14 +1095,6 @@ static void clk_wzrd_remove(struct platform_device *pdev)
 	clk_disable_unprepare(clk_wzrd->axi_clk);
 }
 
-static const struct of_device_id clk_wzrd_ids[] = {
-	{ .compatible = "xlnx,clocking-wizard" },
-	{ .compatible = "xlnx,clocking-wizard-v5.2" },
-	{ .compatible = "xlnx,clocking-wizard-v6.0" },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, clk_wzrd_ids);
-
 static struct platform_driver clk_wzrd_driver = {
 	.driver = {
 		.name = "clk-wizard",
-- 
2.17.1

