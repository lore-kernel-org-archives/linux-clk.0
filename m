Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792485078;
	b=Yy/ZeiDOxK2sNakNPfMxFnTNjlyd3Z+iEQc1KHx5iYkSRQ7W5EGlcRRXVcyvwpysU6CJ
	 Xz69R3LWDie4s43HwweCqfbAAwQxKnxsPK+u/AAjw4YAIRM+hFkPFw07TBtoQj40ff9C0
	 D5EfksAjNmnj7zvE80LcZtFRcWFgHlsQ6ZtoApVzHy6A9JcBBRBbeobVOiZ7iE6qtpS9Y
	 cPWZQVL4/E7zAbePiP2LntvMQ+1QI1Y4kpriFn5noNyG/XqgEPG7qx5aHqchLba+fyCqm
	 oGQoAPK8xwwBhxixKNWCFSstFexSKcy//h3rFlQqG9ja4wn35G0iwHPAtP4VE4KW2qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485078;
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
	bh=FAHovt2Cded0oRzrUAktqYk11FCII6egiQN0gg69jjs=;
	b=IDdRBTjtIUAKC5BYj0ZR6cYQeLpoBBmYiRko8WZuOrNv7MGFKpiih5LwPkLejY+BEwIy
	 sqzWVMwTU5oJB1YMdrsjjnnJcFgFx06RmvSbC7TM8RiHwPpruGt74Q03DyPPjmoVodPVO
	 RHVZZr4ZNb25ACIEhgJZ5KVutosI9FA2/lh71TL8m0JuiTi7F83aW2vzV/ZlqL6teCD4s
	 ybspyY0lPwRLESnaSmBa4VZypZ/qkusXIX0Y4Bu7bM3YnDZywnDoYa1zJiBb+GblTWGcJ
	 5oddXRtBKYA18i8+sknFBdpN03Lmaz7yUKDADATjQDAiF2yCs8BXq9RnABVW/YKc11A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=j6vCo6ba;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.70
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8BF606A330;
	Tue, 20 Oct 2026 08:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F8BF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=j6vCo6ba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3Zaq7EXGCvXF3GmLOj4MiNxBcpaOZNFdybTaYpfDOhGlUBm3Eo+AexwDaWLlgyTJzAWt9ps96I3PQXxHgI2abow48HrD6ybqiVNvSItipn6kVr+gYLyHiQF38DilWdD6b3/2DxlCYx6k8VwjHRJ5xrimfhp1hdVxPltexgDs7ppQ8fRem2tgpBwirIanYNIkRGdVETh9+GtGKxjEwVG9LCHmqAEnsUyWgSEt8HZgPckEQ9EGleu/S/uJ8C0MD/zzoVlBmTZpn9W6NhiGwpQ2vHsHSy8PqGZpIbSNdXA1hGA5RNF94uGhObC9XH0HWjfRv3Q5tPy5mPLP/bpbcaoSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAHovt2Cded0oRzrUAktqYk11FCII6egiQN0gg69jjs=;
 b=yLUBXUBIMxLXVoxMhw2TNzb4ToK+g60PWBZ1sFFHXo2trutT4kZq40oKC+Pd08vdboPa9CuCDHC7yTRF792sjvtheCbYYoiobeHyBgdaVnUTdXBxHla0wiSG2C2n6x1XSSavytTn8g3fkHpD9V+5p5lByYfyl8q6JE/exUbVfTpw9eogd/O30L7s34UWzmkGFDjq4jwwJxxyG3HhOwsOavwBxXMj6mrNDJDEBDRM2nci8CqlAvJK55ec7PHTa27Ky8NeaBq8tbUiVIg/3TvdtQWFXjzY0HTQQekW+F4kVMwRoX659dbKNZZW1/p1yFr+XAqcNC1UjAbaHUMCNHc54g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAHovt2Cded0oRzrUAktqYk11FCII6egiQN0gg69jjs=;
 b=j6vCo6bah8QbXHYl6FxpYZxUUBgVuN/hbqVcuugLbVEasdrmgwvvQ7xFjErm426sE1qpzOi+2B/bMNpEDgaVRHrjtoZeSRqUbdIMcmD2zaWQ57gmcWbTYsKf/hOcYC275Z9NnufO+mgAIkridy+TaWHFYD6M4VHHrNQR+xcYANqmReUfKxFKgS+FZqQlOUbPudFcePMYIzOCGVlWxkILGqBuQ1cWYJbmcXq6knxlvM+Eu5wire7w8A+ZElzNgh5LT4wXCcyup0WJCxYPSMwT9bWtL45V6CdI4KkWJFgjLXsbLghsSZtDBxwp0BalRPGocyTsiQCnubHso9OkKtzyCw==
Received: from PR1P264CA0120.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cd::19)
 by DU0PR10MB5804.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 08:31:14 +0000
Received: from WA1PEPF000099D1.eurprd04.prod.outlook.com
 (2603:10a6:102:2cd:cafe::a6) by PR1P264CA0120.outlook.office365.com
 (2603:10a6:102:2cd::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 08:31:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 WA1PEPF000099D1.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 08:31:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 10:31:29 +0200
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 10:31:10 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 20 Oct 2026 10:31:09 +0200
Subject: [PATCH 3/3] clk: stm32mp13: add the SPI1 to SPI5 bus clocks
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
Message-ID: <20261020-ups_mp13_clk_spi-v1-3-6c00730945c7@foss.st.com>
References: <20261020-ups_mp13_clk_spi-v1-0-6c00730945c7@foss.st.com>
In-Reply-To: <20261020-ups_mp13_clk_spi-v1-0-6c00730945c7@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792485067; l=3693;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=2UHaHOTcGhadyA2id+F2GWY63dRUpwuyCsoIHhNUqFU=;
 b=2lsYoY4kxPi6SiMoMnbZo6fwCYsyzebOHrp45THp4TKmDNUQCLNhCfwGCnmhLIvEHlYhIGiz7
 dV1VHrKEu6kBMQAUCVKbd9hDziQQAYt8QNxWAhxpvwr3cGbLDEYQkfN
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D1:EE_|DU0PR10MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: cc5bb262-0b2d-4c6e-8148-08df2e848119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|82310400026|36860700016|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	4EO731HilnOqWmPeztzuaShxC4HUPZCt+HSzSyS/11cvzSUB4PzBzzimoRcWeqBYOgqGC0tk6HgMBe+ND3561Jxl99y3x/Cq2Jkh77ZdP5ufbn3lsBFiKnbFERja5dTAJ9Jw7/B8/56k3khE/591Z5a6LCKrvs2XvzfzD87c+X5OEv1T2apefY8n1nj5lcfqWJBPc5P774U0l6IID2aAcAqXYQFR1n56tkwumLFIlReN1Dx1wPzD0SIxNTyWXQOZKQ8zuaOH2jMSWO7t4pTdGk6rLc0Dk88jXdNjBhtoBkEZCeEw0R1/owA7rArEMovu4ch+JXSnG7CIn8WW6gZcf3ANre348TZpX9rMSSGnxqoJfvxNdjg6jbyypChorshBHG7577xz+ZQyL0ONVv6Lp4ywCZpHNlrarTR3Vi15Qe+gQmg5xRJthzeK3DKPLsVnKHz9Yr/MjJ9m1wuc1RclSJt/POBWiLENLwyQAhskn6HPqyjfW364F7/oOY7Jx9LV2F+BomhLhGbQIVHcK9RJTXYIQdWZpsxnc/Wn52L640vD4u83XS7J4Y6BnHpMbgmFECZMlEr+Y7O1vVYw1qMXMZq+rPL09Punqxj7d+omcUFsxoqcaiF64oM30EjEf326HPLPDH8XocuotYLf7S02cccVEJ3nR2R00lJYLzIb6/kPVhdVKSy+n2E88p6Jmekfi9ksK++IEdnP54t/+dbqZg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bBbHM4TuiBX4XpiBbRtJM+qO1zMtBk7/p0bJKcue8FQ26zVdPkrg3N7KKyLYkP1YGy+uBD7hTAYXSzcGGPzJ9xClhdrEdKHGrksVJr/I65hgs4TezsDW6A0SFgUTuR3K+R0a67AbH5h/XUsUper/+mlH4RaaPAO6E32Pcjk2nRt3VlEi/3WOgioDbjNn0VAJSpELXvMc4Nn5cQ9VT9X3ejHE9DYEzSuE2+LialOi0HyJGDYdyMCluZ9MxBjema2kkM597IY+D452SiIlDcmYLm1nX765knhWAJF7n1L3IfdACMIkOz8Lw1Ck4455OmO2K5/otHaQPNkAKJsAfTytClYCIYV+fJa7VqF7kx0NlsMWr2OoPmTBgVaGVJBbz4sKBw88CS6DnVEPyL0+4lxFSzi3+4H/9RmQHDbrvxS8x5E04Ntuoq+JnrjvQ0s6Rgzt
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:31:14.5292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5bb262-0b2d-4c6e-8148-08df2e848119
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF000099D1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5804

Register the bus interface clocks of the SPI1 to SPI5 instances, with
the IDs added to the binding by the previous patch. They are needed by
the I2S driver, which handles the bus interface clock separately from
the kernel clock.

Each bus clock is a gate on the APB bus clock its peripheral is attached
to (pclk1 for SPI2/3, pclk2 for SPI1 and pclk6 for SPI4/5). It uses the
same RCC enable bit as the matching SPIx_K kernel clock, and the gate
enable counter makes sure the bit is only cleared once both clocks are
off. SPI4 and SPI5 are also subject to the RCC secure configuration,
like their kernel clocks.

Update the number of clocks of the provider to cover the new IDs.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp13.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
index 76cede5e47bc..90c4bfe1b2c4 100644
--- a/drivers/clk/stm32/clk-stm32mp13.c
+++ b/drivers/clk/stm32/clk-stm32mp13.c
@@ -17,7 +17,7 @@
 #define RCC_CLR_OFFSET		0x4
 
 /* Number of clock identifiers of the binding: highest ID + 1 */
-#define STM32MP13_LAST_CLK	(SAI2 + 1)
+#define STM32MP13_LAST_CLK	(SPI5 + 1)
 
 /* STM32 Gates definition */
 enum enum_gate_cfg {
@@ -717,6 +717,16 @@ static struct clk_stm32_gate tim17_k = {
 };
 
 /* Peripheral clocks */
+static struct clk_stm32_gate spi2 = {
+	.gate_id = GATE_SPI2,
+	.hw.init = CLK_HW_INIT("spi2", "pclk1", &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate spi3 = {
+	.gate_id = GATE_SPI3,
+	.hw.init = CLK_HW_INIT("spi3", "pclk1", &clk_stm32_gate_ops, 0),
+};
+
 static struct clk_stm32_gate sai1 = {
 	.gate_id = GATE_SAI1,
 	.hw.init = CLK_HW_INIT("sai1", "pclk2", &clk_stm32_gate_ops, 0),
@@ -727,6 +737,11 @@ static struct clk_stm32_gate sai2 = {
 	.hw.init = CLK_HW_INIT("sai2", "pclk2", &clk_stm32_gate_ops, 0),
 };
 
+static struct clk_stm32_gate spi1 = {
+	.gate_id = GATE_SPI1,
+	.hw.init = CLK_HW_INIT("spi1", "pclk2", &clk_stm32_gate_ops, 0),
+};
+
 static struct clk_stm32_gate syscfg = {
 	.gate_id = GATE_SYSCFG,
 	.hw.init = CLK_HW_INIT("syscfg", "pclk3", &clk_stm32_gate_ops, 0),
@@ -832,6 +847,16 @@ static struct clk_stm32_gate bsec = {
 	.hw.init = CLK_HW_INIT("bsec", "pclk5", &clk_stm32_gate_ops, 0),
 };
 
+static struct clk_stm32_gate spi4 = {
+	.gate_id = GATE_SPI4,
+	.hw.init = CLK_HW_INIT("spi4", "pclk6", &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate spi5 = {
+	.gate_id = GATE_SPI5,
+	.hw.init = CLK_HW_INIT("spi5", "pclk6", &clk_stm32_gate_ops, 0),
+};
+
 static struct clk_stm32_gate dma1 = {
 	.gate_id = GATE_DMA1,
 	.hw.init = CLK_HW_INIT("dma1", "ck_mlahb", &clk_stm32_gate_ops, 0),
@@ -1356,6 +1381,9 @@ static const struct clock_config stm32mp13_clock_cfg[] = {
 	STM32_GATE_CFG(TIM17_K, tim17_k, SECF_TIM17),
 
 	/* Peripheral clocks */
+	STM32_GATE_CFG(SPI1, spi1, SECF_NONE),
+	STM32_GATE_CFG(SPI2, spi2, SECF_NONE),
+	STM32_GATE_CFG(SPI3, spi3, SECF_NONE),
 	STM32_GATE_CFG(SAI1, sai1, SECF_NONE),
 	STM32_GATE_CFG(SAI2, sai2, SECF_NONE),
 	STM32_GATE_CFG(SYSCFG, syscfg, SECF_NONE),
@@ -1368,6 +1396,8 @@ static const struct clock_config stm32mp13_clock_cfg[] = {
 	STM32_GATE_CFG(TZPC, tzpc, SECF_TZC),
 	STM32_GATE_CFG(IWDG1, iwdg1, SECF_IWDG1),
 	STM32_GATE_CFG(BSEC, bsec, SECF_BSEC),
+	STM32_GATE_CFG(SPI4, spi4, SECF_SPI4),
+	STM32_GATE_CFG(SPI5, spi5, SECF_SPI5),
 	STM32_GATE_CFG(DMA1, dma1, SECF_NONE),
 	STM32_GATE_CFG(DMA2, dma2, SECF_NONE),
 	STM32_GATE_CFG(DMAMUX1, dmamux1, SECF_NONE),

-- 
2.43.0

