Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83EB1482E3;
	Thu,  2 Jan 2025 17:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735837462; cv=fail; b=rinEdSaWZmkoXuaqJ6gaDmWXtOPGUgtMM3Xt5rxkXXPQAI6sAfvoV2vx06qI+zqabDOWOd1WMUQFB68gVpcA3PpPIFsNLNSQOky379mov5/0TdPZpuzwb7X0MZ6ykB17gS3PqaKQLln2Vj0P1XJTMNw6FatifNYHCm4B1C8AyEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735837462; c=relaxed/simple;
	bh=406BGHCLRUywwMdHP2CxpHhltYIgAqlbXb970KgwfZo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c6A+M7QSt2nJgJk2Nur3UOTauFNMbo8ECIMCtdeIT9QZIUmSG3loxUutVS4nP2XEBf7BUHshji6ZLSxkI+KpDsfZ9ATwhLXnsryP6+mHUVxytckNpmBD+AHcudhbyR8FJ60G2dsMm9BxyOJyox3HvhJOaLbbbUYP/HhFHuSeXN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Rt1+yES5; arc=fail smtp.client-ip=40.107.237.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Rt1+yES5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOnpJvUUpnvMBL1SMia6BJhGEIWMaT/hal/ty0SkJW6mH/oWlWQRMBUQoOfA43V+f+pcJzy7M9m3v/UHow/p8izA8sxq1VlpD/7M/RtLPVsGZIombLJUM9BiXdBgUfkAeppXjubK3O33tnYR5A7c+2wpl07n8g9McCIXjOOtporOuqB7F0+0eotXXEfV5Ltj6Q7QDLyUE4tbNiWei93PaX/DmRSluKcG11+C4/TFDR0/LmU1NwsTeECm1ha4jbUGCykD+Gthy6W+e/nY2ucNDct+xY+WyCaNQhYHhsNO4Hp+Hufy0u590fIVdnV+JFjRQz5p5b8LLrrCS2TLhak6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lH2b+Yw84xb8+PrnQXwbNTY4bmGa+nOWnxNHSaT1oMg=;
 b=RRBJk1R+gFuHuikqhn+wklDkqNHDx1noKTjGqDEHAGnk/L6ePmEH40o+B/gRhTT3JVXmHQT6rY8tCG2Xtxeyc6RzOLKIuX2tALwkJqwxk9qvT57dywCfEoK+FgpofuThCwWk3NfTsen52kNpKH8TE4DPli3HI25Xtl1zB6nPYILq2bMA863RbMHWiYeM8e8x7oSlV8yayi4T+uO64mmcf6LhQbhZUPHxOzx6VSILtQ25gw7PBwhGfAcTOc+4LACSGbwLr2b6Y9PsPONfEWZJA3ZZnclvJ2wxmYpH+hypT0G3DOoomyAesg1FlN5bZFCyvYjgrLrs3LxgeFauIx3amg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lH2b+Yw84xb8+PrnQXwbNTY4bmGa+nOWnxNHSaT1oMg=;
 b=Rt1+yES51lQF8qY6Qg4UMlOUmRZWNuf7X3PN2o4jzK6yL1PSTg9oAY4Xs0QBi3tbGiiZOpxHyYBqSRZa6Z5V/dNl99Eu2vC4FFRNKrPZj5wxCsQA0hDd/sDZqipZU8LG3/vNo3ih+JGYUBYWaOH8ZpmYBcIYIqjvivvEs4zGsqk=
Received: from BYAPR05CA0021.namprd05.prod.outlook.com (2603:10b6:a03:c0::34)
 by LV2PR12MB5919.namprd12.prod.outlook.com (2603:10b6:408:173::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 17:04:13 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:c0:cafe::a8) by BYAPR05CA0021.outlook.office365.com
 (2603:10b6:a03:c0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.6 via Frontend Transport; Thu, 2
 Jan 2025 17:04:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 17:04:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 11:04:11 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 11:04:10 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 2 Jan 2025 11:04:10 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <michal.simek@amd.com>,
	<vishal.sagar@amd.com>
CC: <javier.carrasco.cruz@gmail.com>, <geert+renesas@glider.be>,
	<u.kleine-koenig@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Rohit
 Visavalia <rohit.visavalia@amd.com>
Subject: [PATCH v2 3/3] clk: xilinx: vcu: Update vcu init/reset sequence
Date: Thu, 2 Jan 2025 09:03:59 -0800
Message-ID: <20250102170359.761670-4-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250102170359.761670-1-rohit.visavalia@amd.com>
References: <20250102170359.761670-1-rohit.visavalia@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: rohit.visavalia@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|LV2PR12MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: c483f838-ccc7-4029-d4e0-08dd2b4f7b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pHCqKjg0bwdll0R6fnCK1Yu2m6PaBV6wpfo6sDyknnbvYxsp9clYsoXz8KMI?=
 =?us-ascii?Q?3QLFwuPxPP8e+vcMwdCvmyKwMQ3nZQUlglXYOZA4TYL0qWuZ+nodW5n/Od9+?=
 =?us-ascii?Q?Gk/WFSIdcpaIU7Hz20AIGPysXXDN5oXTW6mxq5aDw1AulAFq78/+1Buaxo0s?=
 =?us-ascii?Q?zwExs3JxG8wcDrPR9ERvqOeX1N0k4c9gBzTOOtUsFRM5Qh7qfT5sF3Xhxnt7?=
 =?us-ascii?Q?zX4riHMGmwskmD/KIqL1LbeArjOEnE+1b7Uby8qaRMY/nzTEIbkQqC/ZQqRa?=
 =?us-ascii?Q?/Q8ypYKVqx0lPTzOByOU/ibMRN8i/Ufr7iuZQ9xtShwGmRq0FG4tpvpKuH1E?=
 =?us-ascii?Q?6ziKCsGczeZZ3aenkmHYNYj3XPCLSS39CpQJJuNaHIm7NJHR/dOE28YB4NVg?=
 =?us-ascii?Q?wntsVnI1pte65vUbE212s70WLWKxtV1yN0UlNHZ6AC1o+h+kvNG/lOWBndX8?=
 =?us-ascii?Q?JRw7EdlYjyAO3LRYOPWo+qmB686+QGitLtHMVdsedM3k0RwUJFrASSVnWnY1?=
 =?us-ascii?Q?sBPhEPMrFaOFT7ZUsmVe2LGpjtiMr1OXir++Io7kSrCbdK2/GqO15h7mErk+?=
 =?us-ascii?Q?0GnsckQ0VgYqsYmvfpalhlZFUAOqTNnzRTITk+b/bX/GRzD8SR9QrccGFNbI?=
 =?us-ascii?Q?n9/UaO1ZGg9pwaU8ANAuE9Y+O1QQpiRslde1yQvAMoIBJsVaKYUMAibWv/EP?=
 =?us-ascii?Q?r1+6ju1tMd2tzNhrzx17DhGv6L3EAVAPIiPKI7nETbNLaPpjLH5Ac9tkg6+5?=
 =?us-ascii?Q?QPrC6RFqxLhDz2e2Fmmo0dT/8nkFhsQpryRT+qOww6dvBThc2wb72xhM1JQW?=
 =?us-ascii?Q?z2CQc7PLC1IhZ4hDoG5FL0yKwUUK1bks2oU3gsqzS8U/Y3N9c3KYVbU5Ga4r?=
 =?us-ascii?Q?HeaYxtn+TkDb2XtXsVS0n04Obkb6/qM8ZkFITi6XHGmnn2gzsfCx9oaYcZvn?=
 =?us-ascii?Q?l1QhLknqZ5zsbxw4fCU2OJHqqQ4L8DUfp6yIVbe9XOKKZyNCQt3CKWJ3SKGa?=
 =?us-ascii?Q?AubzFp3VCNpIr1TPxliNz3m0712YBikLE3Ho57+oF4PWO3K86jUeiXq2LIlD?=
 =?us-ascii?Q?QJVoRvr8zySF7UN2W7G82St8mgLQfmZQiskMTzD3RzS1KogHw9c7bqWuSWcN?=
 =?us-ascii?Q?r3yVkBfOBmQ2kWcQw074SIUp9kVgxINGZfq0gllCEIzFBTUK5mA17LcwdEx/?=
 =?us-ascii?Q?y29w52cjxdCkR/QdRPikG9NnyGpg2uw1eWgHohXjsV9BCgIP963dacn1dj1q?=
 =?us-ascii?Q?SIYqAc7wAW4HE1N46kBKRQDYk6XzrtCgHu5I61E7fShhHEtLVuYDtRu3PHBJ?=
 =?us-ascii?Q?A1kXARCwliY3e3yinHsA35WE1CHeXnqX2exDXhCHDNPT+OCP+Guki0g935ux?=
 =?us-ascii?Q?NP2LHONP4Pu2lZeZZ+WLDmelJH3Pwx84OQsFRiTFw5yDAMLzJq6a3mn5iBTB?=
 =?us-ascii?Q?nCtKl5fwZKeMf4pdqPeEGXxCSOzwKIJKqwiwtviKOxBmsMiwvBdorelUDv4v?=
 =?us-ascii?Q?yAgdFk3gGPIwgJc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 17:04:12.1568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c483f838-ccc7-4029-d4e0-08dd2b4f7b09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5919

Updated vcu init/reset sequence as per design changes.
If VCU reset GPIO is available then do assert and de-assert it before
enabling/disabling gasket isolation.
This GPIO is added because gasket isolation will be removed during startup
that requires access to SLCR register space. Post startup, the ownership of
the register interface lies with logiCORE IP.

Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
---
Changes in v2:
  - Changed patches sequence to have patches with "Fixes" as preceding in order
  - Used dev_err_probe()
  - Moved warning to dev_dbg() and updated print with more detail
  - Link to v1: https://lore.kernel.org/linux-clk/20241226122023.3439559-2-rohit.visavalia@amd.com/ 
---
 drivers/clk/xilinx/xlnx_vcu.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index c520ae1ba65e..50f7c3ecb07c 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -11,6 +11,7 @@
 #include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/errno.h>
+#include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/xlnx-vcu.h>
@@ -51,6 +52,7 @@
  * @dev: Platform device
  * @pll_ref: pll ref clock source
  * @aclk: axi clock source
+ * @reset_gpio: vcu reset gpio
  * @logicore_reg_ba: logicore reg base address
  * @vcu_slcr_ba: vcu_slcr Register base address
  * @pll: handle for the VCU PLL
@@ -61,6 +63,7 @@ struct xvcu_device {
 	struct device *dev;
 	struct clk *pll_ref;
 	struct clk *aclk;
+	struct gpio_desc *reset_gpio;
 	struct regmap *logicore_reg_ba;
 	void __iomem *vcu_slcr_ba;
 	struct clk_hw *pll;
@@ -676,6 +679,24 @@ static int xvcu_probe(struct platform_device *pdev)
 	 * Bit 0 : Gasket isolation
 	 * Bit 1 : put VCU out of reset
 	 */
+	xvcu->reset_gpio = devm_gpiod_get_optional(&pdev->dev, "reset",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(xvcu->reset_gpio)) {
+		ret = PTR_ERR(xvcu->reset_gpio);
+		dev_err_probe(&pdev->dev, ret, "failed to get reset gpio for vcu.\n");
+		goto error_get_gpio;
+	}
+
+	if (xvcu->reset_gpio) {
+		gpiod_set_value(xvcu->reset_gpio, 0);
+		/* min 2 clock cycle of vcu pll_ref, slowest freq is 33.33KHz */
+		usleep_range(60, 120);
+		gpiod_set_value(xvcu->reset_gpio, 1);
+		usleep_range(60, 120);
+	} else {
+		dev_dbg(&pdev->dev, "No reset gpio info found in dts for VCU. This may result in incorrect functionality if VCU isolation is removed after initialization in designs where the VCU reset is driven by gpio.\n");
+	}
+
 	regmap_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, VCU_GASKET_VALUE);
 
 	ret = xvcu_register_clock_provider(xvcu);
@@ -690,6 +711,7 @@ static int xvcu_probe(struct platform_device *pdev)
 
 error_clk_provider:
 	xvcu_unregister_clock_provider(xvcu);
+error_get_gpio:
 	clk_disable_unprepare(xvcu->aclk);
 	return ret;
 }
@@ -711,6 +733,13 @@ static void xvcu_remove(struct platform_device *pdev)
 	xvcu_unregister_clock_provider(xvcu);
 
 	/* Add the Gasket isolation and put the VCU in reset. */
+	if (xvcu->reset_gpio) {
+		gpiod_set_value(xvcu->reset_gpio, 0);
+		/* min 2 clock cycle of vcu pll_ref, slowest freq is 33.33KHz */
+		usleep_range(60, 120);
+		gpiod_set_value(xvcu->reset_gpio, 1);
+		usleep_range(60, 120);
+	}
 	regmap_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, 0);
 
 	clk_disable_unprepare(xvcu->aclk);
-- 
2.25.1

