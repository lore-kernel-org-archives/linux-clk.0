Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793981806;
	b=IAlbTGFoGxX6UdXaNGjVFSFxnT5FimU81lVO9428YBdPXH6oHBSJAtBClHxhTPbAzhzJ
	 o/hqvlVN2mBeV+kk14kbVSA97w5Awm7/fGTOaIWndTz99hstW4m6SbFEW4b9Qb23pa2+0
	 Q7gCJ7gobq5/op+5ZAB2ppKThc3reyVoUdU7RMTKeqdPPkNl7WvEeW8LclYL3atHoMbF5
	 xg8dY6RkdPuAScTcycPT1BmffvthXzHb92MX+wlLLmFdQCilcfgjO7opjAqsJLPvSyGAo
	 +f6Gx5L7qRpBRG7Qhym0+UM1g0/YWpF2P7Yq4slbHcqYYVT9nMWZ1T6c8hhVb1YQNrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981806;
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
	bh=XewHIkWxTFmMQ4BeNxtdv86Gk5Riz4t7IY3ZuKOVSBc=;
	b=336YEB549CzALxXaaku66TIsWFi41zazIUbSiarE91GZk8cql4Ws3WFXeP9VK8IQ/pRf
	 ruxNfdaL5g6qOpxe1NT7EYq1bw68BBsaTSSHKtGgfCt+nLfODW8+ZzcYgbbrxkeOPSQQm
	 cdZNAn1nP5UYAZ3j/pCJAsYFfBOCxleQI+3j7aQ7VYZa5Iix3TFeYo4Hgd0NG0WpnhPHx
	 /0GVtzQ+SPqRh3j+6921dyYpTWbnVvTIJ9AY8KroL0EX8G5dup39PiQnsgKabcOSyYfeY
	 8q+3nRJePkvPrhsBLBDU4s/zeWLqpIY8txYvSxz5NgOiU3PvTFwAOCtwKpGewE7O3QQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=jqSDoNo0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.8
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013008.outbound.protection.outlook.com [40.107.162.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56267606EE88;
	Fri,  6 Nov 2026 16:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56267606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=jqSDoNo0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3pZC9W1M7QjrolCQWcUCHkZmkV0M38hgYfpmOGpiZ6RkUMyDmkbOZ9UY4ZskswecjLxe2w08Ly94ks7s6T7ILnuZV0yUX9brO8ENSGcEaa/v0utMaHqNj3ZX1df2tzUUUn0pc1U8qblMxeO4+ELSMhEbQWY25LyEjPXz2gNNmyN0rQIw9wHFdv7pF2x3F9Jkh1Tu+Yfs1Ol+Lt8IEScX5rhDsrXAqssMPFdB2DPyjO7W4xCUXdUiB6UnlK8XtdtBPkuiKWPeAogrwSJ1CKgqWPjOkQ1K80vHwoIoLflotMML2kEiOei+Fg+WRK7BVx/ToOjuxtFcvBuDSTyk0/CUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XewHIkWxTFmMQ4BeNxtdv86Gk5Riz4t7IY3ZuKOVSBc=;
 b=Bv70XFdIL8V//+nhsfN0zvOUhdgr6SinNvFu//1X5hhtJYIJobV4Dzor/m1oiaRZ/gj6kJtEZmvdPhbg6gUvQHJe1/W/w532Bz4HqSOqTKf5c/bRqaof1DI1HREeVmE853eksuAvxoR5KAHskS0g7DZAgBLWx9cwIZpZJ9Th7Yr0020yWh9nh05K+4PxlJHu5aXMxnc2Aq0LqsthtnoyNOBvtaAu+nwjt78Ql0Wm6VjQYJgek3nbQEiyMr+TA+/ZGGJuxgr1Jp64KrTxhyviXz1nC+5fMmRMGsQ27rhH9TdArTsGV77P4QlXZHBGymvDqcOdZtmG0OcJy0MGl5F/bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XewHIkWxTFmMQ4BeNxtdv86Gk5Riz4t7IY3ZuKOVSBc=;
 b=jqSDoNo0Txi8B9NBE9aDW6NEi+k5P8Z0yVlpenPaid1BqzZtDAbfFNYgI1oDCUmZOxrjsqSpXBQY7ncO59lAdqsumU6+JZVhXr2A3j4fDVgT6WYyQEZwP5wHQJHgePI5B210zMR/WSdxrxWdJ2FB2UwC2HbfpimIJ+58lO1MGVyXOXgAsI2wzaDj61Q6+WjBlN+09taX2XHiAZGxTBA4oiIl8+RpehS9aLAmeKEVRw9BrFCib27qqk0n05Q9HTvNbDMaW+zUjrcTB+KO+f/ctElXpoap0beWJFe4UwAl94MWmkk4FxThFT/rNnt41YddSuanhY5ZK+6qTGwq9hV16Q==
Received: from PAZP264CA0240.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:238::15)
 by DB9PR10MB6643.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 16:16:42 +0000
Received: from ZR1PEPF0000E45E.eurprd04.prod.outlook.com
 (2603:10a6:102:238:cafe::2f) by PAZP264CA0240.outlook.office365.com
 (2603:10a6:102:238::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:16:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E45E.mail.protection.outlook.com (10.167.241.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:16:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:17:23 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:16:36 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 17:16:37 +0100
Subject: [PATCH v4 7/8] clk: stm32mp25: add ck_ker_usb2phy1_stp clock
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
Message-ID: <20261106-ups_mp25_clk_update-v4-7-9e32b817c38d@foss.st.com>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
In-Reply-To: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793981792; l=2839;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=tzeOTXkKeq3tV9H6W50ELVPUNBn9EbNJLSzzkRQDRPU=;
 b=Lu1ql8N7HyqFj7PIsAgdeq1xHdl5SQBGNWrDQE9k8TrpWLK/fycBhGdmOXXV5IUryqWaTXxti
 zZmWOJ9CkxgAzTXIdyvkplRqmW+Y8zyYmrnrQIwlkPyab+Nf4VidA3j
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E45E:EE_|DB9PR10MB6643:EE_
X-MS-Office365-Filtering-Correlation-Id: b5e46d54-d17d-458e-8dcc-08df3c215846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|82310400026|36860700016|261026140227099003|11063799006|56012099006|261021123027099003|261009223027099003|261021121427099003|261022105027099003|261102123227099003|261022075727099003|261028144727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	cFfCarC2u60Attwbx7E5ocIZV7L+I77Lzdnvhsz+Ms1Xf1UFQabjnozOioN3ebcgAHVZatTgbMPg+Rs+f2PNZvPjC1958R8tf9d+5rHXDabN91rUwMyw8onsGwNFfRn8VcpNozpnsmHU2Kq0sswHT7MUI8acyeJm89e9zfMFK726tE2nZ8OCpH/JjV3+J6DHkGGN3XLiwZvvFq0ZrdC1onScEheQ9fZaMSDOy9m1BUVbS9SLG68M51ewoTezXOv2n4PPpAtYGVHqDY87oFBqvttjk4wUa0X+Mo0LWF+pxX3Lo97TmEfq2PUIWxfCicIO0uEvxs2ci3e2sMpqWTmbdEfhk8NFkYCkZLFLcWLC20SECdF6cZcDO2vnfoopILJnXjzZkoWH94UC+StAcyA9ys18qh+QLoGQwFg1yTpT6y6S+eeKaG5OxefcQC5bIEwmefdg+XL5zEY3OMjEoyoIOtX97KcQO7xxbp4jOQnq7NbwcJVlESO5393BW9tcYFxAVkP7LVTo/JRnOY1dvOSGq4NPBpzikX9uyNjtzUl+7rVHpe3NbyvUvIRgVgbQd+F5qnJL+bfx6hDW+knK32i9h2f8WhIDP9FxrMSTy9tYV69IGezb9ei2g31HILBhEAWfmseSv2e89/hXN8IEGZdSnkxCZT00xRVKwAYG7ifhrVoAiuR/duHjG9TumXmvvwAMqlVrzAgVv/90IvjGxhWeEg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(82310400026)(36860700016)(261026140227099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261022075727099003)(261028144727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Umw7grH3jSVmS5euBntfkeXdxNNbCaua5mO1sjYYHDXxcaKwFX4v3UeKLruNOH6sQpDLksFpe+kgrH/QZV4ShdVrubhZyT2sSTar1MTuS1NhACg5GwoX6qqpqRkamrRYjscPu+01dx4TMrsh48CER6Zq0/ZzjJ1MouTQBHiaOBc2zEZ/G/slOT/wsXcn7X0j1Rnto3Ys4DCuwrEBFizGzkD4wAWoiTfpv+bk//cO5Ok0nyExtCo+JgUke3s5vg4lYNgghBxearK5tgYliSm3dAxEstcO0yc0XiiKDPKVXJvLI2DPa/peDh4CtM7LgMRdkj2mdoTIYgbIaPpV71m0NenhP5FgYTMN0FRujpqkazo53clBebPC1pZLLbNeerhcLOvAz1nqkqn/ezej9teAXzjM0rUITa9vqwy4i4AihdQcgssxytvDcGF1P058ozys
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:16:42.2200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e46d54-d17d-458e-8dcc-08df3c215846
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E45E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6643

Add the ck_ker_usb2phy1_stp clock required for USB Host (USBH) low power
support.

Set hse_ker_ck as the parent clock of ck_ker_usb2phy1_stp to ensure it
remains active during the low power modes. As this input clock is optional
in the binding, it must be described in the device tree for the parent to
be effective.

Update the number of clocks of the provider to cover the new ID.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp25.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index e3a2e5ea775c..a8bf9d570272 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -18,7 +18,7 @@
 #include <dt-bindings/reset/st,stm32mp25-rcc.h>
 
 /* Number of clock identifiers of the binding, SCMI ones excluded: highest ID + 1 */
-#define STM32MP25_LAST_CLK	(CK_SPI8_AM + 1)
+#define STM32MP25_LAST_CLK	(CK_KER_USB2PHY1STP + 1)
 
 /* Clock security definition */
 #define SECF_NONE		-1
@@ -356,6 +356,7 @@ enum enum_gate_cfg {
 	GATE_USART6,
 	GATE_USBH,
 	GATE_USB2PHY1,
+	GATE_USB2PHY1STP,
 	GATE_USB2PHY2,
 	GATE_USB3DR,
 	GATE_USB3PCIEPHY,
@@ -506,6 +507,7 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
 	GATE_CFG(GATE_USART6,		RCC_USART6CFGR,		1,	0),
 	GATE_CFG(GATE_USBH,		RCC_USBHCFGR,		1,	0),
 	GATE_CFG(GATE_USB2PHY1,		RCC_USB2PHY1CFGR,	1,	0),
+	GATE_CFG(GATE_USB2PHY1STP,	RCC_USB2PHY1CFGR,	4,	0),
 	GATE_CFG(GATE_USB2PHY2,		RCC_USB2PHY2CFGR,	1,	0),
 	GATE_CFG(GATE_USB3DR,		RCC_USB3DRCFGR,		1,	0),
 	GATE_CFG(GATE_USB3PCIEPHY,	RCC_USB3PCIEPHYCFGR,	1,	0),
@@ -1635,6 +1637,13 @@ static struct clk_stm32_composite ck_ker_usb2phy1 = {
 					    &clk_stm32_composite_ops, 0),
 };
 
+/* Parent clock of ck_ker_usb2phy1_stp is HSE_KER_ON to ensure it remains active during low power */
+static struct clk_stm32_gate ck_ker_usb2phy1_stp = {
+	.gate_id = GATE_USB2PHY1STP,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_usb2phy1_stp", HSE_KER_ON,
+				     &clk_stm32_gate_ops, 0),
+};
+
 /* USB2H */
 static struct clk_stm32_gate ck_icn_m_usb2ehci = {
 	.gate_id = GATE_USBH,
@@ -1993,6 +2002,7 @@ static const struct clock_config stm32mp25_clock_cfg[] = {
 	STM32_COMPOSITE_CFG(CK_KER_ADC12,	ck_ker_adc12,		SEC_RIFSC(58)),
 	STM32_COMPOSITE_CFG(CK_KER_ADC3,	ck_ker_adc3,		SEC_RIFSC(59)),
 	STM32_COMPOSITE_CFG(CK_KER_USB2PHY1,	ck_ker_usb2phy1,	SEC_RIFSC(63)),
+	STM32_GATE_CFG(CK_KER_USB2PHY1STP,	ck_ker_usb2phy1_stp,	SEC_RIFSC(63)),
 	STM32_GATE_CFG(CK_KER_USB2PHY2,		ck_ker_usb2phy2,	SEC_RIFSC(63)),
 	STM32_COMPOSITE_CFG(CK_KER_USB2PHY2EN,	ck_ker_usb2phy2_en,	SEC_RIFSC(63)),
 	STM32_COMPOSITE_CFG(CK_KER_USB3PCIEPHY,	ck_ker_usb3pciephy,	SEC_RIFSC(67)),

-- 
2.43.0

