Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792485075;
	b=DD1gPGjc7WLupkVYd9GVPNnllWTJcwefBYooSEsZ2fYVCprpNFBvY8sCtv9LN7kM4t6t
	 jqwThg/AY85wqEFcY+QqaVTHIjAQcxS5cbga88gfnI2tzx21vpy1nEfq5nF9HaV7FvWaP
	 bt0ppLRj3MSYwgkQntzljPvMit009F3JHR3EnD1MfkMTy3N4DppefO+/2rVg/TdjssCrk
	 s+tzeXTurhZo66vaWuzCe6hZ93BJ3JuTh/5rVck5YhMELLYEuNDdGGe4+UltXmxIe+tHq
	 m9NUSntGF5RLVmS5kxGIqhsEmWd2fLo6ouM7dqzxCpyakNe+dSDkQXkIlG7wXMip6bQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485075;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
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
	bh=0lU08U14aXdgOwI/xI+P2RMBK07w/7d05nIDIjgd8RE=;
	b=yZNIHcSWRE7B74E3aClV/Zhp7riYGEB3dHBYugyQoOkEf5Yu8hkMbOyO72HPHlmVIqpy
	 awdNj2M0CcX8K4eJUGyw/U2HonSe8TvZf7hQfhp2XSubTXzyvuFMzXoKDLJPA9CEZIB/K
	 MJihnmXasjT7vl2cS2WF5ZVuCyyo/7em+JC+3L0wtnSakpkFaDfiTfgBVSEJ6LAaf/oWp
	 M3ye46acefiQNph8gL916RfLb58QEZIzv/5ooRFy7UNXZ2OBlkpgApslcTIl3YXkdT+r3
	 U8vZJ6SeYk2NOQX6ciWdgpGkBoQEY2UDBZ9ubAskzM6DfiIfIh3o0xey2ZaiKufqLjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=LId3BN2A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.25
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF81606A319;
	Tue, 20 Oct 2026 08:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF81606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=LId3BN2A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKYzvLCj812TnDEqn8YAwqJFwCNilANQ10WGJHc/lP/oBgf31zW8FBtOn2IeqTJgBmhDn+mR4R4LqF2xi10ngmWLsd2Ufn8ga6mKRi57Xaa/iEQBrOSvUtxPVBzZxZ8DKn6QELkhw2wVugXcL1qWXoWpYUWbn/HVVv783JhnEmFK9DTqapph34V9ZiL7aHwWe1TtL0iwPTDTSb2ab10lDz1NuPLhu2dZ7CvPCKJZvnnuded7nfkHShCZyzzYFD7U9Dgaq37AfANdlfD+2F/5Av9XSi9ZpIBhjY2ekzJa/7DUu+K2O1JDxDDW0+agIZiqz3tH3qK3Y0rnrAhqm9HKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lU08U14aXdgOwI/xI+P2RMBK07w/7d05nIDIjgd8RE=;
 b=h9XByFlnZEOhyOIgNCMWr0kg1P1s87NxUot73ul4WvKlZWmZUCR0HlrfXp9bwWOPPA1nR0W+volE5Td7bNiEsTHbU9FXR542XDUKOAxfHD7jkiAbiwKFTRJCwRqTC/2Ej3aRK1zXAMRuE71s8ix2W+avV9GyuG6aLqfk9vI6QLOZP/UqmK2/yw8rkRZgTmJjtSJrq7s2XPJfF3GvwlLoMF60bQLlc2y7oJMwcUAVQw9V1WEgLBjheFmdQmP/6S0Ym9HEJS+7oPtjn9GQy8Aqup+xyPDj6cWw6vnzFznPq32yNKJ3KQYmLJAycFdul6UuQGzHZDrXz05MURCgkw0IMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lU08U14aXdgOwI/xI+P2RMBK07w/7d05nIDIjgd8RE=;
 b=LId3BN2AB0RrXsP720KBi3+i5BKpE48FYjLHpNDcFZiq28VKO3WDrXxAaYhnx0VaZaFHfXd/Z98wxUpQTM+Cb4Olev5cT4BaXJPo7Sr9TGWO3qMFwVtN5u4Bym4yQnZNyGyBdN24iqznvwJlFkxI0NvWWW+H5Mp44z1R6HPhTv7vXZIE8sgJF4RMd42cwbs2RNwjwz8sdk0o9/6O+j/9AwjQSDaX6PiM4nes5EB1TP1LIEJUrIFfD+T6DMYusuM0RkFilMkzqMFkiNxK8UijZNmxH1CS0cu7mfIIofLnJ/sLkbWIh8G13DHVBUrPeOsjm1P4h3gnIcC9A8ft9GteSg==
Received: from DU2PR04CA0222.eurprd04.prod.outlook.com (2603:10a6:10:2b1::17)
 by VI1PR10MB3982.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:141::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 08:31:10 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::b) by DU2PR04CA0222.outlook.office365.com
 (2603:10a6:10:2b1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 08:31:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 08:31:10 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 10:31:38 +0200
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 10:31:08 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH 0/3] clk: stm32mp13: add the SPI1 to SPI5 bus clocks
Date: Tue, 20 Oct 2026 10:31:06 +0200
Message-ID: <20261020-ups_mp13_clk_spi-v1-0-6c00730945c7@foss.st.com>
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
X-B4-Tracking: v=1; b=H4sIAMom12oC/x3MTQqAIBBA4avErBOagqSuEiGiYw39iUMRRHdPW
 n6L9x4QSkwCffFAoouFjz0DywLcbPeJFPtsqKu6xQpbdUYxW8TGuHUxElk5h9Z3HoMmDTmLiQL
 f/3IY3/cD1oVWgGIAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792485067; l=2056;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=BeJjrsdURT+qVZKvc2tcK3aL0zhGOGjP9XYAwjjNMzE=;
 b=UrP+lJohKx+eVKwHMQwsLw4+xoGe0dT88xrgHDgDzrJuhoh5d5GkhV0qXFc/IYGQSILYD4T7t
 +/LnH2mW1dGDlszlk2t7hC7CsgfySRJJzRpX+zTmwn2N8WcjktDQYt/
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885C:EE_|VI1PR10MB3982:EE_
X-MS-Office365-Filtering-Correlation-Id: 674740dc-4c15-4038-349c-08df2e847e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|7416014|6133799003|18002099003|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	5sIuMV3fq+miJVuoj0jnjJRcZtOOHw5z/T3q/mffhTxP7CvYnHxXyo2mo/KO9ICNQyDwdX9Hxh+ES+w7h3QzugglnBk3cX//ytUWeZ40RKsOHCMtdMBFaXNvAiR7XdXVbXGPqGc4en1ZyswjVc+9nyxlP3H3zp5NNdcc/ynIbxeYb3e3sPtwLnZldlwjGsXCdpqALNb2n7+gaedTZtpAMUMzBWMWfz4LEKcC8fpFPWh0EcI1mkx8rE1iEWZUaxqO47e99SOQ/bJapQQ2AxHpranSmzzatrMUKO2nsTBevB8sq0j0yvWpBZxojw+cKcekctqvScwQRhcJQBUTt8rqYf6Xsyan2nW5b9LcOH33ovI69CgeFlD1SxHDLbOHo6BIIAI8B1Uy0WFkg5PitfKZWj8/DWxzmxNweme5yz97/mvPEtu1ZLv5/N/9fDv9Qr5E6WxDZztbTBE5dCkyci3kZD8EVKTFRxNNEoHng9Avzu0byXuXbqXr7bvmdzrdxYBxF+FFyAZUp1ua94Kv37LZxSZXf2q9PrVS3gbGl5PhL70f1yHhuY3v5NvP4r41PlsqqmQEqwf+TOHyHseHOgo0wejcE028pMCBotXxF8t+fEs1ulf9uiZz7y9iZZJDQBypOUMlutnuC3BWgKxVxMfTLL8N9O1Xk7Kk9dyf6n5lloxGm/te+70Cxm60XsqlEQOdOIP6knPFYi/q68G3Ozgl9g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(7416014)(6133799003)(18002099003)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/TZnoaU9PCNMVZ2OlQB3yxVR7emzJTkoOmeq2JbkdPAGEdnfzpAQDZ87ZFXlb6xZdC1a2oZIhplCT3b51AOTuJ7NyWnn44LiJ9pOJAVNVmxUS8UqFq0ffwpqhYcrbXZjII/RwkcBGlWnQ7oCoN3p1DJEJDU4nALLeap5bqXQ5ODkYXEN+hQaBvC25myTq6WI4+va9/y+iYlw2fB08DLV/kT2JGKr7St+C2H0dHNnpLdcAqSkWh1z+5BqF52bVR5N/c2KJUfo2FeZ6y5LG4k5u0KexXirw7aNvv98lfeIQ1WfY9iBk/KdpCw+saXg5waxxJmGDvhheNmQ5yoH8YEsxcUUs1BUZc6bWefNAN84b0c56mRh8d4Iz0DMaIjHTqcJMI9EH/cxRmOsTj8wSNte23Ymv/y4Un1Cmneafzt29qs8Noij8xU55Md04vzSd1Ax
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:31:10.0418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 674740dc-4c15-4038-349c-08df2e847e6d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3982

The STM32MP13 RCC provides the kernel clocks of the SPI/I2S instances
(SPIx_K) but not their bus interface clocks, whereas the STM32 I2S binding
requires one as its "pclk" clock (the I2S driver gets it with
devm_clk_get(dev, "pclk")). The STM32MP15 RCC already exposes them.

This series adds the missing bus clocks of SPI1 to SPI5 to the STM32MP13
RCC binding and driver. It is split so that every patch builds:

 - patch 1 makes the driver define the number of clocks of its provider
   (STM32MP13_LAST_CLK) instead of taking STM32MP1_LAST_CLK from the
   binding header. That value is not part of the binding ABI and would
   have to change each time an ID is added. This is already how the
   STM32MP21 clock driver does it. No functional change;
 - patch 2 adds the SPI1 to SPI5 bus clock identifiers to the binding
   header and drops the now unused STM32MP1_LAST_CLK;
 - patch 3 registers the corresponding gates in the clock driver and
   extends the number of clocks accordingly.

Each bus clock is a gate on the APB bus clock its peripheral is attached
to (pclk1 for SPI2/3, pclk2 for SPI1, pclk6 for SPI4/5). It shares the RCC
enable bit with the matching SPIx_K kernel clock, and the existing gate
enable counter makes sure the bit is only cleared once both clocks are
off. SPI4 and SPI5 remain subject to the RCC secure configuration, like
their kernel clocks.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
Gabriel Fernandez (3):
      clk: stm32mp13: define the number of clocks in the driver
      dt-bindings: clock: stm32mp13: add SPI1 to SPI5 bus clocks
      clk: stm32mp13: add the SPI1 to SPI5 bus clocks

 drivers/clk/stm32/clk-stm32mp13.c          | 35 +++++++++++++++++++++++++++++-
 include/dt-bindings/clock/stm32mp13-clks.h |  6 ++++-
 2 files changed, 39 insertions(+), 2 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261016-ups_mp13_clk_spi-cc1ad9d1f7e7

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>

