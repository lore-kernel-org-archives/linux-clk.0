Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795003176;
	b=jbBumm5RLBzoTujQfPXM9gXngDD7a8iSAFf4zT9f68zpQh8dWcIctrk92vrKO3nC+/RS
	 t2I+B88wDCgpv4Ww8F9K1+TbM2hJTevWJPbez6LncsE+y4RygUj+zOw3ObC0XVZ0+1CRB
	 KTqI4ljC0Og/LhpGXguoECaj4YxGTE1AzJ1azqzROcuLGE7C0J1cgd3VQtOUZIUxxTuWN
	 L0bObf2D3APCVtAvxygHiewDCbwNwcdhSGIQEINPfH18H5GaJTEosbDuKZeVJr4f511c1
	 8DCUd/xhYLQVEmzC9wLXKWatMtpxCjCb+H8yt9QSMdBaGIgHpP3f5JWvf92NV8o0j3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003176;
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
	bh=eQTY3j3AZU59/fujHkVPCfWowT+Xsw3ZASQle6IEE7g=;
	b=A3Z+n3X+u3ZeSA2qpALEYweCG3jDCnsinr1D+d0D6B/e9toE64+iQ0Odj7fN1zOpd8KW
	 1TiAeq5973AlFzjvnDdH5vL7jrBvB2EcQS4oMfkh3gsqsg3JU4yAPMZ5UKZOjOmDPqdjd
	 I0Jkl+ywLhuRMy3JfUZBSSgtu9nFHxnagqR1PDLy5yEEH2xJQYNLqOGU1NdA6cJ9cNM6H
	 0uz1A4fxSgbpjytYr7m+hdihYDZs5mgx0R8MzzSNv+NgYlabrbuuFJREILN8ZE3zefWGC
	 mmEiFIYZ2pOF3ISV6FtXf5B9xaG1qUnOFxZVAl25HBfiGFlKfj3ngP90kmY3qxXkB3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Mb17Iy6i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.29
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA9260A3806;
	Wed, 18 Nov 2026 11:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DA9260A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Mb17Iy6i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdM+GHs7WaJxFoEAjXa3Z38XZUrmayEulWpZB672kkKfnEwBB143sY7MPLcMjQ3BzKAYdD2TvC/ZKVd7lfQc4sNsQAAWNybDzKErQ9nREQd4ZOssMOiulV/J+/HjSj8kyKayLxUGTL0BiJ7zKvnO2ctwRvIt8AfiJesmEQyRgpHGQ2A0gb8Xy2MM6OQAVtUSn20rrgasgKOrt1YGQlz9bqDegyc8wPRKKD6G3gDBWoH7ha1Vw90jy+sLg/sXmLxbZNU+7a6Yy1kgsMLCdqMqJ9i97SRDg82xIz5lXc74/bnRvkDOZ1110yZnR0lkCcHGTMaz0//HMKRba+gqWvvfNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQTY3j3AZU59/fujHkVPCfWowT+Xsw3ZASQle6IEE7g=;
 b=w+kBSNjIeospeggxdZ9GIrmJwesS9qu1DIx27Lx8K7vso9e632Ochg8TanbJ8PwitK10Pg5I/3fhpWaCGprly73Kr0VFCYxNQWIWNL6PR+THXf1bCe0GHb3o27J+ayjzlhDYNhaW5AmLc99sLcPERMIoAtXzGrFhumVChDe1CCVp4/6S3xU3ZWIhA9h/z9N/OU4wp2QRdkSQ/BL+mHch5VwUAUFnhbHmaS23br+RMKVkplRa2RrIw4xFWWP5jl8Jlv1cngqRptOKU6+7P0/BzTiZSNpiDDwukd3yLylHjV4ptQvVMdTFUozHEkgMOqQt4CIXrGWptOsUfk944JnVVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQTY3j3AZU59/fujHkVPCfWowT+Xsw3ZASQle6IEE7g=;
 b=Mb17Iy6is8R63qstUxXNqeVcljJ/DvyCJnITpJgo6z+vMDVvUiNOuCp9lqQHZcqB4nfvrvwOyMvcpGMN7i1Ni2DXjjLxK64PHyju4RFv/ByWwgxUwziBgTxE3zlOiyF+KWC5ox9/lJlu8rYkB7cKweKxUwU8ZjliWXk2ubBbV88espf8i3xY11O7ySnj4gldNsTd3NQQdxjJG5DBn9j1F0XHoUuqEnAKP9H3HgtT+7xoHAMQGX6YkjM5A+uW92fwAKh1r/jqGyLmtoqKg69NexNuz8r9TDrLBFS2vd8BUoSX48lu9M4p/NmrMYsskSCaWxHrOwv5CT2ueuxb6XGZ0g==
Received: from MA3P292CA0066.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:49::11)
 by DB5PR10MB453860.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:5db::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 11:59:30 +0000
Received: from MAD0EPF000008B6.eurprd04.prod.outlook.com
 (2603:10a6:250:49:cafe::6c) by MA3P292CA0066.outlook.office365.com
 (2603:10a6:250:49::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 11:59:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008B6.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 11:59:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 18 Nov
 2026 13:00:23 +0100
Received: from localhost (10.252.6.76) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 18 Nov
 2026 12:59:22 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Wed, 18 Nov 2026 12:59:08 +0100
Subject: [PATCH v3 3/6] clk: stm32: Add STM32MP25 SYSCFG clock driver
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
Message-ID: <20261118-ups_mp25_clk_syscfg-v3-3-935de791a4ce@foss.st.com>
References: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
In-Reply-To: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, <patrick.delaunay@foss.st.com>,
	<yannick.fertre@foss.st.com>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795003158; l=6874;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=0kqYXeSX7SDcqimNCB/cg7g2I3Hdl5BYVm6PV1UZbTs=;
 b=sPit0beb72GWh3YFSO1KqzebhEdGTgG0QIp/NhmJWnSa34gp37pPfUDVfdgRtahpXMfQWcSjo
 78z+aOdoFebAdZSmvkENTvZ17oEq6aZon5hq6MxlLNtkfbKvtASFLf9
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B6:EE_|DB5PR10MB453860:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f0f88a-f1d4-45f2-2fd9-08df456b65e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|1800799024|82310400026|921020|10067099003|11063799006|56012099006|261022075727099003|261102123227099003|261021121427099003|261021135927099003|261009221227099003|261009223027099003|261028144727099003|261026140227099003|261022105027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	f8XMfJtVf5pMbfO7HVIQH4/EZJ/KW5CuuEUaq40s/lPDDeodpzphHGmgf4cLHu7VuT154ADNAgpq4h5+3U6dKa/d6a3dMV6u2SSCrOhMrHrYrR7bY93BIoA36syTFY8Mg7aJ4hrcJz1q4TQ88VGUaYKItTL4UEy5G0CNMXqN5KjMnW4d2s81z1xtgcODTRhVprrmslcDT7lX9KHfUge2fe2XAxoyZtJeP4ICY5B8+GduJvV3RmiW6d94vy7BiL76oYqM4TgrntAZVTUjqmscTmNCFlaKXEY4wn9gmhq7nr/DrH8HW8f942E7EsCx4+OdvjVLYZwdzQ6XFlMLckreoUAF4E7g3Hp++plll5wKyXXlacNa+wj+mV9AGmYIHYv2AOwBqlbEGA+YDs9zkA1/JV4MaD9sGez9luVUCuqd0oFs/juh1kamVeqBMWIyv9xTHScGFZ89DMtpIcktLzCwddsRj/FF5582ARZsTGHb17F4SDSTzn1ya9b43REh1GVbGH5jL6l31JN1pYsLcNgl1NeYasXRy8cgB8OqZ7VtShqFNXA+vD7aFfLAuHsaMEUDFjZO8tASqaBwhGQuWRZKRG3CAqExO3ZBzEoZ4OvUh2T9sezIBZFIUC/iRNoPlTVx9CpmAxZQ8yUm/xJQ7QeYNESYf/vcPrgJX3j69enEgxRz4ermj0VzpFL90yFNB2ys/7HDHKq1geyj3COWISi5nr9pL1WutCArVUHthZJd3xwnjBnkaltC7Bb89tCyN3WQ
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(921020)(10067099003)(11063799006)(56012099006)(261022075727099003)(261102123227099003)(261021121427099003)(261021135927099003)(261009221227099003)(261009223027099003)(261028144727099003)(261026140227099003)(261022105027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nYwywsobL2BDGl5lZR8HFzuynKWBff1BhMUaFJ9FJof5A1FPeSszNDyozRCxWBsCzK0i75U7bZyoiuJO4o2Q1Es2zkZS4URy09a/aDZ1U8z5y++vgEml94dCo+mVV3RkAoeJGTujuBkz4uYc0Iv95qbL9h/4M9KCu8UgH6pj8Tw9lc4cdjMFNUCHRTrAv7FTGbnToy8UVNMjQBCgEVYozQEr3A830UnT9VZqBoGaafHACVyhhI5MS0hDcSVMMaXqLrrfIHZnyLdW3KmF1lAe/lp7c9DvfC1Cw9IkQb9oUvC/3cPQOiQfsvgnKd7QCmtY6+rr87TRW4iFWhE81kziLNeVTvx/uxWyiA+Tosx6ZqKj98LTl7Wo9Y9FO2ZUL2IxI6o4MXOlgxvajBYtBgplKNpXiHGKFCN7qEYd2LdwgOcKzSMzhSuIfi9Q4zoyt/O5
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:59:28.2131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f0f88a-f1d4-45f2-2fd9-08df456b65e7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B6.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB453860

On STM32MP23x and STM32MP25x, the LTDC pixel clock is selected in the
SYSCFG DISPLAYCLKCR register among the DSI PHY byte lane clock, the LVDS
PHY pixel clock (reset value) and the LTDC kernel clock, the latter
being the one needed by the RGB (DPI) output.

The SYSCFG node is described as the provider of this clock, but no
driver registers it, so the selection can't be changed from its reset
value and a display connected to the LTDC RGB output can't work.

Add a driver registering this clock as a mux. The SYSCFG node is bound
to the STM32MP2 SYSCFG driver, so this driver is an auxiliary driver,
probed from an auxiliary device which shares the SYSCFG node. The mux
parents are taken from the "clocks" property of the SYSCFG node, which
remains the clock provider.

Co-developed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/Kconfig                |  13 ++++
 drivers/clk/stm32/Makefile               |   1 +
 drivers/clk/stm32/clk-stm32mp25-syscfg.c | 125 +++++++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index 5dbd75cde657..18289816f030 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -39,5 +39,18 @@ config COMMON_CLK_STM32MP257
 	help
 	  Support for stm32mp25x SoC family clocks.
 
+config COMMON_CLK_STM32MP25_SYSCFG
+	tristate "Clock driver for stm32mp25x SYSCFG clocks"
+	depends on COMMON_CLK_STM32MP257
+	depends on SOC_STM32MP2 || COMPILE_TEST
+	select AUXILIARY_BUS
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
index 000000000000..41f40325a10f
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32mp25-syscfg.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) STMicroelectronics 2026 - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/limits.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/printk.h>
+#include <linux/regmap.h>
+
+#define SYSCFG_DISPLAYCLKCR		0x5000
+#define DISPLAYCLKCR_DPIVSLVDS		GENMASK(1, 0)
+
+/*
+ * The LTDC pixel clock source is selected in SYSCFG_DISPLAYCLKCR among
+ * the DSI byte lane clock, the LVDS PHY pixel clock (reset value) and
+ * the LTDC kernel clock, which is used with the RGB (DPI) output.
+ *
+ * The parents are listed in the DPIVSLVDS field order, while .index refers
+ * to the "clocks" property of the SYSCFG node, ordered "ltdc", "lvds", "dsi"
+ * so that the inputs missing on a SoC can be omitted at the end of the list.
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
+	int ret;
+
+	ret = regmap_read(mux->regmap, SYSCFG_DISPLAYCLKCR, &val);
+	if (ret) {
+		pr_err("%s: failed to read the parent: %pe\n",
+		       clk_hw_get_name(hw), ERR_PTR(ret));
+		/* An out of range index leaves the clock orphan */
+		return U8_MAX;
+	}
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
+static int stm32mp25_syscfg_clk_probe(struct auxiliary_device *adev,
+				      const struct auxiliary_device_id *id)
+{
+	struct stm32mp25_syscfg_mux *mux;
+	struct device *dev = &adev->dev;
+	struct clk_init_data init = { };
+	int ret;
+
+	mux = devm_kzalloc_obj(dev, *mux);
+	if (!mux)
+		return -ENOMEM;
+
+	/* The auxiliary device shares the node of the SYSCFG */
+	mux->regmap = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(mux->regmap))
+		return dev_err_probe(dev, PTR_ERR(mux->regmap),
+				     "failed to get the SYSCFG regmap\n");
+
+	init.name = "clk_pix_ltdc";
+	init.ops = &stm32mp25_syscfg_mux_ops;
+	init.parent_data = clk_pix_ltdc_parents;
+	init.num_parents = ARRAY_SIZE(clk_pix_ltdc_parents);
+	init.flags = CLK_SET_RATE_PARENT;
+	mux->hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &mux->hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register %s\n",
+				     init.name);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &mux->hw);
+}
+
+static const struct auxiliary_device_id stm32mp25_syscfg_clk_ids[] = {
+	{ .name = "stm32mp2_syscfg.clk" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, stm32mp25_syscfg_clk_ids);
+
+static struct auxiliary_driver stm32mp25_syscfg_clk_driver = {
+	.probe = stm32mp25_syscfg_clk_probe,
+	.id_table = stm32mp25_syscfg_clk_ids,
+};
+module_auxiliary_driver(stm32mp25_syscfg_clk_driver);
+
+MODULE_AUTHOR("Gabriel Fernandez <gabriel.fernandez@foss.st.com>");
+MODULE_DESCRIPTION("STM32MP25 SYSCFG clock driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0

