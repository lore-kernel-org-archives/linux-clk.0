Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794316231;
	b=xZgtp1M18oWK+3sVPLKCnoWyr6Jr57JVAEJ/44pXN/9EfCPKA6pN2owzi/zKTHrMAp6D
	 mAZjrJQkuF8z2QIhPWPrxAm75z+r0gNmu+PkwIbyuJNxxsjsuzDbbwU4KpOedwxrcB/HV
	 wtwh6hCIdUDmKMh+f+S/kbGIWPRpYgzq/qxlz+Vw5gE9wyDYq1hi4EMVxI04NshFveUCs
	 F12wg4pjxGZc+cy5gIWzxooV25YFOj2w4A1znbYQsRy92rwkNJOtLiprwiUDsQb+f3FPh
	 9Mb6/iIPKYsND+TTvVIMPYjNpJNKl8Nw7prSCKY+wsVfC3+QmjhRjAbwGgs5H3mT2YQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316231;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=CfmEDI2aB8q+5oH8lglRkxHWssrtlRbOz4Ue1JsdrRw=;
	b=pSKCUEOV+Y3JdA3HIG2hUYb3+puwTKH4A6wFAbYP/IQTxPbjhB/eiz4KAdONs8K0VzKL
	 VYF/oVyP9PXsiHbeJVhw5z0Tdtfa8dKqrcscP6qvd1IOXFwlHUc8RoEw5EF8U4OYFw4CV
	 LmzZacQoUdlg+axsitm2HIRCFwUmOJWG1xqM1ta+650vpXAzgH2CfuD+0Fs8HdRFJfGZc
	 +Bfy2ArFnBhHETJE4yoJSvCTpoeFTvFLxL89jvTB5+loy7oclULr37Vi/6js2ogNpp00D
	 CN3sHqRUIaJWXMYqxvZjATgWFIzA8GBn7PhW+YXkmK1oEv+ZgZdnpNp5ry1IrVUJ8sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=KQl30Bxv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.71
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013071.outbound.protection.outlook.com [52.101.83.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA63606A7DC;
	Tue, 10 Nov 2026 13:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFA63606A7DC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=KQl30Bxv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Npa7Ot+r6tUP0zAVCkCkdtqVkMjCALMv3SNb8prRMFGL6gvnqwNvbiPlQhuFi8kZUbGfqneMR3iFlxpiO7j+dlLqisYPRMPUbMKsew4hop72Cc3Dkmp9I56y+ZSJLcZLu+B0hwgyg3OmhYUI9jd5nxct/VS2iEPM11zabUj3XeYkGW9SoMiM9smUls7sW4GgvTaoBhjl56VGXVPgZztycbJPNsLYDD1z/qQLRrtMHu8jKY3qPOzFHhI1iB4tFkFvogkpBEbyjxrvAAMpVPA+WDrGr/bH3LOx96xyhIbrAz9JVuSDOfipx+avLiyBJabpOoD3FXXNJknc/iQhnMut/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfmEDI2aB8q+5oH8lglRkxHWssrtlRbOz4Ue1JsdrRw=;
 b=w2QxWlRteMyleXj20xoIW9NpaCUgBr3hFHivnxadTs5GolvBepxFdh1bw1bnxTOSZq70/Ot9YXUXdCZihS+hyq2ANRz+qLzVKWtLY9hd+2dhXLTwnwsDq9dpHmDtIWY7idvKpuh22bZFTufQ7USymmsUlr6iqtKgJtwv0EpXvGR6oaSBxX1h19Zh7sFjRr3qo+bDOjAoU0UMmcJKeEUyOEeVtXrzchc+Mg8gz2cQGWPWfxJgtsazAuCgt8G5T9wwNXSursYk/rEx08ZoO9vHW4oLufvzEuaYr1Y1sZjo0h87k+XC2rqw+6AGNejQ4HCKc/peKdjom5nH0dkBb+XDdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfmEDI2aB8q+5oH8lglRkxHWssrtlRbOz4Ue1JsdrRw=;
 b=KQl30BxvL9/l4/kFEUFgoC0J0p/u5MqAiFH1kUYIoBLgI0gh6LNOpgGhDdjSZOgaSxZbI5f8OZbd2amFeWTDYrSq+huWNWY+ekuaiB/t7+53To8RMx3udb0sFnOSFY6dNji88tUyYRCPRdahGWdnhEK+XTUzznHOo3VwVffvhRpFpznm/y43FNwPLBzkpt3hbXtQmzi/sMz3pkK0n/6TuLVDn9WZ+bEaxfLeWIsgha8P5Iep00w1kfehcSJPlftM6975XFdDwYvAApVZIB+j9iCWNxSs3TXtoEmVGTFLF/R20waRp20tcJmrzwilBVq5P5mP6j9W/csijg6RD2m5cQ==
Received: from DB9PR02CA0015.eurprd02.prod.outlook.com (2603:10a6:10:1d9::20)
 by MI3PR10MB363412.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:290:99::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 13:10:25 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::17) by DB9PR02CA0015.outlook.office365.com
 (2603:10a6:10:1d9::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 13:10:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 13:10:24 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 14:11:04 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 10 Nov
 2026 14:10:23 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 10 Nov 2026 14:10:23 +0100
Subject: [PATCH v2 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261110-ups_mp25_clk_syscfg-v2-3-624559bb8ec7@foss.st.com>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794316221; l=7137;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=dv40+MDWCuL2eVVnwhdIenGwlzLv8ZtCsARwXSkjPSM=;
 b=TgzNBDBCYgWDVnNAbNraG7pj6q1GpmcC/xmOep+HIPlTeP/Dm1TV4wW8iVlnouoZ8OhZP53iB
 qiMYg0GBSFqDB7JlmNXoTAuhpPHOP/iFnUX7ZpS3+NdFP7fsWqcKpq/
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D13:EE_|MI3PR10MB363412:EE_
X-MS-Office365-Filtering-Correlation-Id: 13bc87fb-de10-4d5f-55e2-08df3f2bfbc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|1800799024|36860700016|11063799006|56012099006|10067099003|261022105027099003|261022075727099003|261021121427099003|261021135927099003|261028144727099003|261102123227099003|261009223027099003|261026140227099003|261009221227099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	cigFiRyC+uQOYok/NzGgv8CbMR41Y7PbzmIhwKema/HdOqh1gUBc2YLOsOILAK8YGi7TizZrOd4Bkixc+qK9Fu9pXZAOX0bD2tH4Hl7XgenRYuh6wG2uvnJ8ndgpnSOCv9P/Iaw4XDBg2DhlkqbnW3wLBPZfRzm3rzLt8dlE7SPJOUMxipUWOnMZWsTXrHWPRxaxfU5jgh2NuyxLVyOjmhBsGuexPuao32Vq/yJuFGzzi87ivXW0ZpaXqM+ICX+Ym4MFF4rwhqREbB67Ix4vB/AOt79GqNQt1EdPGNW2UQg1Bj10e5bXlLCiOaxY/k6oH5OxCaRb3RiXLLJAgqukKDEM0Uabj4imRfOchP7XyDhsHgkFwHnmzI8lHNyFVU5F42WFJhkuDo8MYeFSrbtUE+YapHTWNRvlOmTLkBfdPhpLZ0m9OYaFa4xhdU9q/0lxIuiKZSx1WeDbd1q/vUZJ9iV+yfDt11/G5KdEtFkXrTBtH61a/0T4+lve12Ip3PzFWDCP/52q5tQcQy0Z9SLJfS87A2oZ2q6wd9gAxZFDjCcNSZaqhmSoiF+0ldcKk6a0o+i/lA1R5tITOePHFtMPEZnHDtA9U/URnDgrLFMxZRTKsLv1xAVC5a3h05GPsJfRdNQys4XnN+bqUzoke/RT/EnQVWr3nZ3QgMM8acrmJpGu4Vpt0muRKaEK36270SBGukJsxCm/8bCqSa2+twkMXA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(1800799024)(36860700016)(11063799006)(56012099006)(10067099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021135927099003)(261028144727099003)(261102123227099003)(261009223027099003)(261026140227099003)(261009221227099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SaNFuQWyElt3GHjxsQNQBvVMOkuZRiJS0Zf1O0zyPs5TpqSMrydODaetHqlUgXSzsgRwLe23rfFbxk46F9TKcHOmDYSw2YLmxUt50ezWj9YyuIl2cMO/B7X4yzpTT8+0yC/QbfHA5GWmAvQUhxlaN6RiBXiqNZ09OQ+p7C9W1HMM9KQgCd0SQFXVNYdNXItQQvbgVuOxskwzKWktKgZ//B38GgdoPGkcFc7LDSM7rSL05y7DzjPRM7rbwoiud2RwWHFm9zdwjVZWwbjdaV9wOwSVF3u3KX103MAcrMe6kTPfWlsc/iGG7a5hOo8pDwOXPnKJCxDyaBQtpN3W5nALuyV3YYpYKk6jj+/z7B1WqlmgTV0SwIk/8XBsBq9DgJpK8VjGJx4CgCzz+qhAg6eax1NjB3EWqfg/PZ+w0a5lF8KX8X/jcdqfR6n2lQk2jNvG
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:10:24.7639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bc87fb-de10-4d5f-55e2-08df3f2bfbc2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR10MB363412

On STM32MP23x and STM32MP25x, the LTDC pixel clock is selected in the
SYSCFG DISPLAYCLKCR register among the DSI PHY byte lane clock, the LVDS
PHY pixel clock (reset value) and the LTDC kernel clock, the latter
being the one needed by the RGB (DPI) output.

No driver registers this clock, so the selection can't be changed from
its reset value and a display connected to the LTDC RGB output can't
work.

Add a driver registering this clock as a mux. The SYSCFG node is bound
to the STM32MP2 SYSCFG driver, which populates its sub-nodes, so the
driver is probed from the "st,stm32mp25-syscfg-clk" clock-controller
sub-node and uses the regmap of the parent SYSCFG node. The mux parents
are taken from the "clocks" property of the sub-node, and the clock is
exposed through a onecell provider so that the other SYSCFG clocks can
be added later.

Co-developed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/Kconfig                |  11 +++
 drivers/clk/stm32/Makefile               |   1 +
 drivers/clk/stm32/clk-stm32mp25-syscfg.c | 134 +++++++++++++++++++++++++++++++
 3 files changed, 146 insertions(+)

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index 5dbd75cde657..a298983f5511 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -39,5 +39,16 @@ config COMMON_CLK_STM32MP257
 	help
 	  Support for stm32mp25x SoC family clocks.
 
+config COMMON_CLK_STM32MP25_SYSCFG
+	tristate "Clock driver for stm32mp25x SYSCFG clocks"
+	depends on COMMON_CLK_STM32MP257
+	select MFD_SYSCON
+	default COMMON_CLK_STM32MP257
+	help
+	  Support for the clocks provided by the stm32mp25x SYSCFG, i.e.
+	  the LTDC pixel clock source selection between the LTDC kernel
+	  clock (RGB output), the LVDS PHY pixel clock and the DSI byte
+	  lane clock.
+
 endif
 
diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
index e04727b59449..8088d172651f 100644
--- a/drivers/clk/stm32/Makefile
+++ b/drivers/clk/stm32/Makefile
@@ -2,3 +2,4 @@ obj-$(CONFIG_COMMON_CLK_STM32MP135)	+= clk-stm32mp13.o clk-stm32-core.o reset-st
 obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o reset-stm32.o
 obj-$(CONFIG_COMMON_CLK_STM32MP215)	+= clk-stm32mp21.o clk-stm32-core.o reset-stm32.o
 obj-$(CONFIG_COMMON_CLK_STM32MP257)	+= clk-stm32mp25.o clk-stm32-core.o reset-stm32.o
+obj-$(CONFIG_COMMON_CLK_STM32MP25_SYSCFG)	+= clk-stm32mp25-syscfg.o
diff --git a/drivers/clk/stm32/clk-stm32mp25-syscfg.c b/drivers/clk/stm32/clk-stm32mp25-syscfg.c
new file mode 100644
index 000000000000..69b9a7592838
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32mp25-syscfg.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/st,stm32mp25-syscfg-clk.h>
+
+#define SYSCFG_DISPLAYCLKCR		0x5000
+#define DISPLAYCLKCR_DPIVSLVDS		GENMASK(1, 0)
+
+#define STM32MP25_SYSCFG_NUM_CLKS	(CK_SYSCFG_PIX_LTDC + 1)
+
+/*
+ * The LTDC pixel clock source is selected in SYSCFG_DISPLAYCLKCR among
+ * the DSI byte lane clock, the LVDS PHY pixel clock (reset value) and
+ * the LTDC kernel clock, which is used with the RGB (DPI) output.
+ *
+ * The parents are listed in the DPIVSLVDS field order, while .index refers
+ * to the "clocks" property of the node, ordered "ltdc", "lvds", "dsi" so
+ * that the inputs missing on a SoC can be omitted at the end of the list.
+ */
+static const struct clk_parent_data clk_pix_ltdc_parents[] = {
+	{ .index = 2 },	/* dsi */
+	{ .index = 1 },	/* lvds */
+	{ .index = 0 },	/* ltdc */
+};
+
+struct stm32mp25_syscfg_mux {
+	struct clk_hw hw;
+	struct regmap *regmap;
+};
+
+static inline struct stm32mp25_syscfg_mux *to_syscfg_mux(struct clk_hw *hw)
+{
+	return container_of(hw, struct stm32mp25_syscfg_mux, hw);
+}
+
+static u8 stm32mp25_syscfg_mux_get_parent(struct clk_hw *hw)
+{
+	struct stm32mp25_syscfg_mux *mux = to_syscfg_mux(hw);
+	unsigned int val;
+
+	regmap_read(mux->regmap, SYSCFG_DISPLAYCLKCR, &val);
+
+	return FIELD_GET(DISPLAYCLKCR_DPIVSLVDS, val);
+}
+
+static int stm32mp25_syscfg_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct stm32mp25_syscfg_mux *mux = to_syscfg_mux(hw);
+
+	return regmap_update_bits(mux->regmap, SYSCFG_DISPLAYCLKCR,
+				  DISPLAYCLKCR_DPIVSLVDS,
+				  FIELD_PREP(DISPLAYCLKCR_DPIVSLVDS, index));
+}
+
+static const struct clk_ops stm32mp25_syscfg_mux_ops = {
+	.get_parent = stm32mp25_syscfg_mux_get_parent,
+	.set_parent = stm32mp25_syscfg_mux_set_parent,
+	.determine_rate = clk_hw_determine_rate_no_reparent,
+};
+
+static int stm32mp25_syscfg_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_init_data init = { };
+	struct stm32mp25_syscfg_mux *mux;
+	int ret;
+
+	clk_data = devm_kzalloc_flex(dev, *clk_data, hws,
+				     STM32MP25_SYSCFG_NUM_CLKS);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = STM32MP25_SYSCFG_NUM_CLKS;
+
+	mux = devm_kzalloc_obj(dev, *mux);
+	if (!mux)
+		return -ENOMEM;
+
+	/* The mux is a sub-node of the SYSCFG, whose regmap it shares */
+	mux->regmap = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(mux->regmap))
+		return dev_err_probe(dev, PTR_ERR(mux->regmap),
+				     "failed to get the SYSCFG regmap\n");
+
+	init.name = "clk_pix_ltdc";
+	init.ops = &stm32mp25_syscfg_mux_ops;
+	init.parent_data = clk_pix_ltdc_parents;
+	init.num_parents = ARRAY_SIZE(clk_pix_ltdc_parents);
+	init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
+	mux->hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &mux->hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register %s\n",
+				     init.name);
+
+	clk_data->hws[CK_SYSCFG_PIX_LTDC] = &mux->hw;
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+}
+
+static const struct of_device_id stm32mp25_syscfg_clk_of_match[] = {
+	{ .compatible = "st,stm32mp25-syscfg-clk" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, stm32mp25_syscfg_clk_of_match);
+
+static struct platform_driver stm32mp25_syscfg_clk_driver = {
+	.probe = stm32mp25_syscfg_clk_probe,
+	.driver = {
+		.name = "stm32mp25-syscfg-clk",
+		.of_match_table = stm32mp25_syscfg_clk_of_match,
+	},
+};
+module_platform_driver(stm32mp25_syscfg_clk_driver);
+
+MODULE_AUTHOR("Gabriel Fernandez <gabriel.fernandez@foss.st.com>");
+MODULE_DESCRIPTION("STM32MP25 SYSCFG clock driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0

