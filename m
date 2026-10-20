Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792485077;
	b=QoAInyT6cm2Yk7xY1y/OdOXaOOhDvXdNTyEa/IMRnR1Yas7Mx9hDipVrjTDDuilmwqHr
	 gatBWFyLBj1624y2AGlUywoMKBnJ7j+u8svilu+n6QTer1EGO0jdrVnPj0pO5yv4e+bjT
	 heOGEPhfb5K+AOxzbP9GMyJ0D4+YoujBh6Dw/heehFTiWTtLU4kZ8SwBTE4Ggi/dgOk8V
	 nJEfEOlcZeMIkMPeCqGSVgdvJNTAUYcXJKNVWQPa8hEsgp9qXYCp7haS8c4QHoTvncrlS
	 eeDJHbLTMhtZJjKYgXlawmsvpBZ5EByyICCIiODyUWh5QrmnUKYBFBh09784tW8J3Ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485077;
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
	bh=Xhx1C7g1EP+N0ohvufodPwldNzI2TXyfZIuRtjvT6OE=;
	b=QH9yL0PvVyMyi/jYA/ljJ8kmERfGryGzJZTsRFjcYA27lLYta/8tDJJfmm3ZfEfWstDh
	 nxKSIwwAQAKZkNAzey+0UJrC6YUkSsJ053Pv+khTROmieK9Gbr/JWMoV5h5AhLqGwd/qt
	 haCluaEtih3WFrEJwtSy14DpklkjG3UHi563AVL+suGAN1JKCPTFYzc6WHTrJLWpaRq9f
	 A5MvgBCrXTNrT0hu0IiJJnAGgvB96a7nseKU9eztn1aSQIVu1t2/ZcBhjlRyOqcgxorn7
	 I17jlb3xLQ4JpsR5isIZ7MLcLDTq3iDa2VD11IWrhKXYNHJ/nicCR2U29rWN0IqEmMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=P5lvwOtj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.6
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010006.outbound.protection.outlook.com [52.101.84.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A381606A322;
	Tue, 20 Oct 2026 08:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A381606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=P5lvwOtj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjlw9/AR2SwXGe6F4ryiB3U2tYf2go8ZdBj/EHQhIFuSgix0CIbZKxwyWLvLCJcLSZLjs3NT1txqZAx/ie0mFEVT2Nsw+BmB88MxlyUbevxS2jmTqxRdSKIatKnKhGO8dtqddf0+GVx1pbfo7u/zzm/fxMOTi+b/8E7+WznwLSdKQhiQB6iZUx9ErW1AavOSZug0cBFa3RDDwEp6grxk++9TembjsBZCwIiiJJD2YLYBMy30kzIJTtDI+xX5FDKLG36V4ciW70S2V6+FWeNthlvFbt+HMsYWyJ7nFem/WM3yDCIq/aTDkCrNijJE3vuWJ5/y0wDxfEe0ccu1E638Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xhx1C7g1EP+N0ohvufodPwldNzI2TXyfZIuRtjvT6OE=;
 b=fznIsIDCcMGl5hTA/bFhAi0fr4rJ5kSFoITlq2IGHUJWUjz4LKY11A/R+qkv4S5o3xEPDi5D3qISHaM6LIDENIWXVbBcPrJBrdkXFqf2joH7cyG0DTpJGRG18GfSQelgi+9vf3FQ/dYRF85e/gRx6AwEpRnjBenMbNpw/qCFXXwUTkkEHewk/9jG31peH02AA0G20dPXuGp1WeYACWsBtsfMcX4gg+i26DqpH5TJJcC333+gNz8zZQaKgcZpzSy/fap8+LZShmhlRC4ltAj6Pz6mpdUHIwhDnRr8a7B0buuNSmAMCKs10oO5+xB9WCqiauTse+WblQSyz7K618Kdiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xhx1C7g1EP+N0ohvufodPwldNzI2TXyfZIuRtjvT6OE=;
 b=P5lvwOtjV6p+b8FeqVz/f70N/8zTm6TbuCyuEep+aCLv32Tmb5n6S7Y3AWL2iv7y0rJtDpsMMui4QEfotG5lgm7Y1F7yiSJ9PgdYuExoSbXhg0ts3hNMrEJJ/Nua1fHEHwB1uiGaToQPCCkVesTMblJoj63OCw06lnShj+cn3cW+kdUu21T2cuQFIwgDG1/0e0DKUiHtz8Kpv9hreJK1ORL+Oye0p4qIZdMRsnOn3qkFqCwUk7dk11dgrRqsDrhkv1IBUFMpoEExiTfAiedVtOOfAhFTEHLdIW6JutVT/0YpkEuQPDEMKckiPwZNK0OGpOFi1u6LKBV+n5WtjO9P5w==
Received: from PR1P264CA0125.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cd::12)
 by MI9PR10MB992211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:290:89::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 08:31:13 +0000
Received: from WA1PEPF000099D1.eurprd04.prod.outlook.com
 (2603:10a6:102:2cd:cafe::8b) by PR1P264CA0125.outlook.office365.com
 (2603:10a6:102:2cd::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 08:31:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 WA1PEPF000099D1.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 08:31:12 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 10:31:27 +0200
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 10:31:08 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 20 Oct 2026 10:31:07 +0200
Subject: [PATCH 1/3] clk: stm32mp13: define the number of clocks in the
 driver
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
Message-ID: <20261020-ups_mp13_clk_spi-v1-1-6c00730945c7@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792485067; l=1471;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=ce1OvXpsOlqNK4F54X0h0G9PBQ670O+gC8osGCqeK7w=;
 b=FL0ievA60ggb0duxxEfK/0ZlOL8pjbx0GuvkXjS3JUigcU4S8fCBnZ8du21MJVOgeGXnJsYUh
 6PKmLDo6S0/ChqBtDZUJujLnu4LJPw6SNsy3rRA6EifWKpJPDDMU4v2
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D1:EE_|MI9PR10MB992211:EE_
X-MS-Office365-Filtering-Correlation-Id: a93699b7-be6a-4af8-e89c-08df2e847ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|7416014|56012099006|11063799006|261009223027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	MRK6QYkGJIEjREkR0a8lVlfH2vDGl8Px/cOT7yICSw4rM1DHWlAuNSaSWLI8e5r8NYRRdRhX8oXeHN/b6UUJU2hVJIdcKc+DB9TS1+RzVYZbpaHtlGyhjYQO0hxiCdibwzX8NY3vhc52YaiIpRzaMfl+8loTgTBSd1+LVFTA8V1YVFQ3OPAepDIm6b0GJWdmfVvU61j1Vgc52GkZBKlhNwudLiIp1UUhx+YVrSOJtBU79Ywm3SO4l/7eaQJhUPFqelwGvVWz5KugGWeE81EyX0XSJw4mAkzJSIU/WYpwjL8fL/qHcrrwYqf+TMYOAScG2YEXkvsm2UkdDveYg5UUNwubCXgBJWc6qSALRO2e4kMcCtgpjVxDCjTu+0Ky6WhPQJDroaYmjQeF8c5SqSwgWfhaK10Cr3JAtVJNLiFWcice/v5rAjAE839mSn97imH1Vc1tEUUWgmy/R2AcK3elKtrecFE3Uo/0ylKBLImrAepiZAJsW8JAWECvkBTCzlNC89Lx9GjfKIvjM5kAa251pt26baSmDly8+sohP25Ndcf3S3EFzand1Js1KCZQASveGty08rABYvvo6ZZXfb8evz2dLQNX0ipYKHY60Wd+xVjAW+qyRpvESh/MCprcr+lRpDKTQ8lYTxtkqONvrEPZxgOgnsMnpgdEmidR/9RaEs2UIRK93vava1AVO/vvMfY5Xp/V0S+Mg6MI+mv3px9eJw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(7416014)(56012099006)(11063799006)(261009223027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZlkD7NvCDyswgUIg2LZeqe8oImV98WZoTPB+Cf5IU7E/PH6ydGRhRp9tIitfnBhVkQHnmSpih2r9hddG6+FM4PgPteR9JQxrkxWbTVtjQWlJKq6uUK0RET+gqP3BdlFnjBd+eQAOsasrbYFVCv8bl2hHvP/oC5A9uj2a3QB0g6L5vVbjtXeNSg3A3/eYHMjo2HAcKyAO1etJsXJnSnFcuj57JQE3rD/n6BbaV/DVIVq9pNzkpbubf196svTkp7B1QsSz//YI3HGQcRFz52HED/0Ojv/RCV4INNlrY0wZjTJnjaTRQJO5AVO/Xl8ok8pvIrK6STW1boDVtdboyywG0DN5OMkwbSpQ2jobtXs2SygBGVZegpXO+ss7bK+GXOgCSmXWSHzVPtsyRNEzSbJpD/5d5u9NpnQ30HvRWS2GYwmviNwKSnxhQhm/qEiERroV
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:31:12.5887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a93699b7-be6a-4af8-e89c-08df2e847ff1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF000099D1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR10MB992211

The size of the clock provider is given by STM32MP1_LAST_CLK, defined in
the binding header. This is not part of the binding ABI: it has to be
updated each time an ID is added, and the number of clocks handled by a
given driver does not belong to a binding.

Define the number of clocks in the driver instead, as done for the
STM32MP21 driver, so that the binding header can drop it.

No functional change, the value is unchanged (162).

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp13.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
index 9bc94c3c5df8..76cede5e47bc 100644
--- a/drivers/clk/stm32/clk-stm32mp13.c
+++ b/drivers/clk/stm32/clk-stm32mp13.c
@@ -16,6 +16,9 @@
 #define STM32MP1_RESET_ID_MASK GENMASK(15, 0)
 #define RCC_CLR_OFFSET		0x4
 
+/* Number of clock identifiers of the binding: highest ID + 1 */
+#define STM32MP13_LAST_CLK	(SAI2 + 1)
+
 /* STM32 Gates definition */
 enum enum_gate_cfg {
 	GATE_MCO1,
@@ -1523,7 +1526,7 @@ static const struct stm32_rcc_match_data stm32mp13_data = {
 	.num_clocks	= ARRAY_SIZE(stm32mp13_clock_cfg),
 	.clock_data	= &stm32mp13_clock_data,
 	.check_security = &stm32mp13_clock_is_provided_by_secure,
-	.maxbinding	= STM32MP1_LAST_CLK,
+	.maxbinding	= STM32MP13_LAST_CLK,
 	.reset_data	= &stm32mp13_reset_data,
 };
 

-- 
2.43.0

