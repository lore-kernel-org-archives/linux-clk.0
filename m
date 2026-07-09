Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878AB3AEF28;
	Thu,  9 Jul 2026 11:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595669; cv=fail; b=Viq67oWmflAK4S5FMCfqkH8aStbyxUgx/a/9vWCTYn7wmn6ze1h+u3MQvun92FIPpPmC/4jD7q9rC2uSbCtA+EqWoLWlye/J4NhNqpa1osBkw7aDE73ywcoa4fi+TDI5fkzpXmb5Q47QX6FjX8A+DzwPc1l5rNGtRgPjsZXzzdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595669; c=relaxed/simple;
	bh=1p/Xno+ZMUnXw5aE+NH0fHO1nH0mC756bztRtJbtHnY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rxbA8CwVb1xwM6p87+vRkAGMKODKMDEs7NAic/HcnYNNWWjE9UR1fQBcgq0R3M00Xu+YlPCIiv5nj42MTZLPYXo+LhuzvUjZVlBiPxiuyaXj5+XYQVY0sir8YiQ/N/csid4g8eAlcquklFZ+Cf9y6d6wkNTSK7nk6kPik27xn2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cVFxLBQe; arc=fail smtp.client-ip=40.93.198.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cVFxLBQe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVeWdO9Ol0X2N6zLPknW9pjWgF5WUW+/UDb6RaM1WkBhrletjvv9BRhk/s3xChypcmEQ7LPzUNTWn0HjZvClZCEvZ079PlqmjhmPWswEjk+4geBWk9xwiS9dsH2T5EdFA+kcKtTlQv3R3gd58CUPy/vScOxSipHpbub3cRuTEpboXextm4KFEDVt7oKyeN3RQxct28JlGLwzhNESxc5uZoo0W1axIOhbmG6HvVRYA9ZQJeMu2U9j84xQ6TAOQ2sYNQ/8wKNDsgUZ4oEkbfar7u8SMr/lkF/bjGEE6tvrNwz7wxyeEWI9f1mQJgUiVawKFVfcEvSXkbZO9Xxu0povJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhSb35yd7z4L155wAsKnaL0Ekv55Xjz/lo0m1jvuKRA=;
 b=BE42XMSR6oEAY5NPEK7P1PbkjOCJ94xW4WHVrSeYgNS1U0j1JqNToQ2rX8jR3/JzVV0Rr6jS6UWTPFzMBlyQRyGV5Gccf1+b4OJ0pL9DHQLhFU1KwZZnhhnvZ888UfhP5iLaQkbwZWFCXSMmeOklr+1XVxgdssbI4ZNNFzBGMCTeTOK999XCvZfUHL5i+D4EK7WjNz9aL7sPTBDT6wl6H5rkKvFnpx9MaWP3MnaCFH58+kWTHl1OF9V1ArO4ptmSN5hCaieGmrtoZOYkbseGBVo9b+vKt6bMiJzZ4HmRSJpcwLRW8gSc+VUBGMqJFejnnLbDOvGXRKuG8ak+TsCSSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhSb35yd7z4L155wAsKnaL0Ekv55Xjz/lo0m1jvuKRA=;
 b=cVFxLBQeHTxhpLxLnScNJrRDeGh4JZ+cjmXBqaAh++3vWH1cCRhVr66/dX0KXc7fPAMFi32rJW+N/TiIRH4b4c7SBe8QeGpuC9z1DswoeWAwgf+KoTwyVs9+ZjoiLxaxEtAwyLWrqXa7ET7rrageaq5m3z/AFGIEivVzIDaWEPY=
Received: from SJ0P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::19)
 by DM6PR12MB4044.namprd12.prod.outlook.com (2603:10b6:5:21d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 11:14:23 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::2d) by SJ0P220CA0015.outlook.office365.com
 (2603:10b6:a03:41b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 11:14:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 11:14:23 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 06:14:22 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 06:14:21 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 06:14:18 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 4/8] clk: clocking-wizard: Add static-config clock provider support
Date: Thu, 9 Jul 2026 16:43:59 +0530
Message-ID: <20260709111403.1579159-5-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
References: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|DM6PR12MB4044:EE_
X-MS-Office365-Filtering-Correlation-Id: 199381cb-f3d5-4722-5e09-08deddab3b26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|22082099003|18002099003|3023799007|5023799004|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	xGtRZi3/RA8rEI96KQU7bUPa3774l4uxspFptxDRRMmE3fyqXqXuJYijLUCmnfmGjG46yM2HTN4V7v44Urha4NSfj4v1v9EAUqF1z4+dVEg11sqXolScao0TvFPPrxS3TCdtH95/+MvpsTuDggwOvc6j1upYMSARQ8b2fFIB7MJm6bBoo4kCc9YTb6qmc2bCjoRnmDuqzS8hpAfmcgFiR5uap5dujNP48MRiq4ECww/deyF+5K/DEbptdzul452GJE05dyOhNj4uJpUSjhqOLcHVtYBszEOhhUwyweKoPip66lPRh4dQsVcPEuaXk2F6pRdNxMPc2GPxvQ0XWlCQTwMauGsQ+A5sRHGrDncMtLjo4rfYD0sRrNpOmJM4sqJIJXhus1gMtjg6Kst1p7d0Tp8qKW8eSGtERtbzSUv4QBk6Po+G8XhANs/VbRx1lIXG2h2xdrdVxNzIViwzHYlj+RZdu+uObeiBuY7mxkrzR+57LotLGGkx3w1Kt0xi7siLGSO4AZrXinOCWbMKdODc8BlLqZ94tu+w6fYGPzZhvLmAX4LLoDcCYeAmGUXejGmno6JpxwiUIuLo4tXRm+6zDt6Qu6ekO5t5eHwt6vwYpmrl8Lj2O02QV6Npk1lEJ602Uh/gKzyzh6we6j+SVTQJZhSSJfoCBCCDz+DkaJ18IPmd+UEb/9Q/7JtOaEz/3xo9gOC+KPDXc2uLGL9y7lbEeA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(3023799007)(5023799004)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BqO3ndcRN42AsGe6bRDPiDipmOe5s6iFmU9u9gLimdiW//1afsneu/9G8wtJRSyak2IfX2xHrA0BWBDeN8YougJtRtC4eVYLqyWXmkJd5mLeJOxbCVUXKCVoly498JuKhotgj6BNfFk/ejVI15w5sNwn8EaA6dnK7BFL5xG8J99hYf5uuxysTPpw1p1+XatiB5brtBJFN560ihFf80vwZGg3JiUK09lRq1yyRU0+iFnyE5fkazpetB0mVhqAqlbHUxNcqJsBch0x1REFqdMeyfP88CnrOoIQ/NFb+G2f7rkeQbP1L0r6o5YFV4FYuaY3hGN2wgTt0O5pYS9/zwjRxbLUdniuSmp4YwvSQeJvfXMjBAZrU8n3A6+tIoyPzwQz+PVpeaqWCTzXXqH2IelGXNffAwgPzH596ngA+z6e3ztmgLgrj8Gu8QCcSG1SpRF3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:14:23.3427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 199381cb-f3d5-4722-5e09-08deddab3b26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4044

When xlnx,static-config is present the divider/multiplier path is
synthesized inside the Wizard without exposing runtime MMIO
reconfiguration, so omit the AXI register mapping and advertise each
routed output clock as a clk_fixed_factor child of clk_in1 using the
synthesized ratios exported through xlnx,clk-mul-div.

However the parent clock of clk_in1 can still be gated, disabled, or
(re-)enabled after FPGA programming (typical FPGA Manager flows,
CCF-managed parents, PLL fabric power sequencing).

Add a 10 us delay in each output clock's .enable() hook so consumers
wait for reference settling before first access.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v1)

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 137 ++++++++++++++++++++-
 1 file changed, 136 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index ffc78c90bee6..5470a717fccc 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -107,6 +108,7 @@
 #define VER_WZRD_O_MAX			511
 #define WZRD_MIN_ERR			20000
 #define WZRD_FRAC_POINTS		1000
+#define WZRD_ENABLE_DELAY_US		10
 
 /* Get the mask from width */
 #define div_mask(width)			((1 << (width)) - 1)
@@ -697,6 +699,13 @@ static int clk_wzrd_ver_determine_rate_all(struct clk_hw *hw,
 	return 0;
 }
 
+static int clk_wzrd_enable(struct clk_hw *hw)
+{
+	/* Allow the output clock to settle after enable */
+	udelay(WZRD_ENABLE_DELAY_US);
+	return 0;
+}
+
 static const struct clk_ops clk_wzrd_ver_divider_ops = {
 	.determine_rate = clk_wzrd_determine_rate,
 	.set_rate = clk_wzrd_ver_dynamic_reconfig,
@@ -790,6 +799,85 @@ static const struct clk_ops clk_wzrd_clk_divider_ops_f = {
 	.recalc_rate = clk_wzrd_recalc_ratef,
 };
 
+static unsigned long
+clk_wzrd_static_factor_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
+	unsigned long long rate;
+
+	rate = (unsigned long long)parent_rate * fix->mult;
+	do_div(rate, fix->div);
+	return (unsigned long)rate;
+}
+
+static int clk_wzrd_static_factor_determine_rate(struct clk_hw *hw,
+						 struct clk_rate_request *req)
+{
+	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
+
+	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
+		unsigned long best_parent;
+
+		best_parent = (req->rate / fix->mult) * fix->div;
+		req->best_parent_rate =
+			clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+	}
+
+	req->rate = (req->best_parent_rate / fix->div) * fix->mult;
+
+	return 0;
+}
+
+static int clk_wzrd_static_factor_set_rate(struct clk_hw *hw,
+					   unsigned long rate,
+					   unsigned long parent_rate)
+{
+	return 0;
+}
+
+static const struct clk_ops clk_wzrd_static_fixed_factor_ops = {
+	.enable = clk_wzrd_enable,
+	.determine_rate = clk_wzrd_static_factor_determine_rate,
+	.set_rate = clk_wzrd_static_factor_set_rate,
+	.recalc_rate = clk_wzrd_static_factor_recalc_rate,
+};
+
+static struct clk_hw *
+clk_wzrd_devm_register_static_fixed_factor(struct device *dev,
+					   const char *name,
+					   const struct clk_parent_data *parent_data,
+					   unsigned long flags,
+					   unsigned int mult,
+					   unsigned int div)
+{
+	struct clk_init_data init = {};
+	struct clk_fixed_factor *fix;
+	struct clk_hw *hw;
+	int ret;
+
+	fix = devm_kzalloc(dev, sizeof(*fix), GFP_KERNEL);
+	if (!fix)
+		return ERR_PTR(-ENOMEM);
+
+	fix->mult = mult;
+	fix->div = div;
+
+	init.name = name;
+	init.ops = &clk_wzrd_static_fixed_factor_ops;
+	init.flags = flags;
+	init.parent_data = parent_data;
+	init.num_parents = 1;
+
+	fix->hw.init = &init;
+
+	hw = &fix->hw;
+	ret = devm_clk_hw_register(dev, hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return hw;
+}
+
 static struct clk_hw *clk_wzrd_register_divf(struct device *dev,
 					  const char *name,
 					  const char *parent_name,
@@ -1154,9 +1242,11 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct clk_wzrd *clk_wzrd;
+	const char *clk_name;
 	unsigned long rate;
+	struct clk_hw *hw;
 	int nr_outputs;
-	int ret;
+	int ret, i;
 
 	ret = of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs);
 	if (ret || nr_outputs > WZRD_NUM_OUTPUTS)
@@ -1224,6 +1314,51 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 				dev_warn(&pdev->dev,
 					 "unable to register clock notifier\n");
 		}
+	} else {
+		u32 mul_div[WZRD_NUM_OUTPUTS * 2];
+		const struct clk_parent_data parent_data = { .fw_name = "clk_in1" };
+		int num_elems = nr_outputs * 2;
+
+		/*
+		 * xlnx,clk-mul-div is a uint32-matrix of <mul div> pairs;
+		 * FDT encodes it as a flat u32 array so we can read it directly.
+		 */
+		ret = of_property_read_u32_array(np, "xlnx,clk-mul-div",
+						 mul_div, num_elems);
+		if (ret) {
+			dev_err(&pdev->dev, "xlnx,clk-mul-div missing or invalid\n");
+			return ret;
+		}
+
+		for (i = 0; i < nr_outputs; i++) {
+			u32 mul = mul_div[2 * i];
+			u32 div = mul_div[2 * i + 1];
+
+			if (!mul || !div)
+				return dev_err_probe(&pdev->dev, -EINVAL,
+						     "invalid mul/div for clkout%d\n", i);
+
+			clk_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+						  "%s_out%d", dev_name(&pdev->dev), i);
+			if (!clk_name)
+				return -ENOMEM;
+
+			hw = clk_wzrd_devm_register_static_fixed_factor(&pdev->dev, clk_name,
+									&parent_data,
+									CLK_SET_RATE_PARENT,
+									mul, div);
+			if (IS_ERR(hw))
+				return PTR_ERR(hw);
+			clk_wzrd->clk_data.hws[i] = hw;
+		}
+
+		clk_wzrd->clk_data.num = nr_outputs;
+
+		ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
+						  &clk_wzrd->clk_data);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "unable to register clock provider\n");
 	}
 
 	return 0;
-- 
2.34.1

