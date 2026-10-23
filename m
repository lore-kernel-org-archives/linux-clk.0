Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792773817;
	b=ntJmPfM3dhcLvxOfiFcpXnNbNBttav/VCjT47SD3o7LiEz9vbPyQb/hXJS7EOLnZtfGM
	 1iANX8lx0VRDkUaqn3PDAeaxJUA9rYgsHklFB8ak0JwAhsiKGAaLqtlU+VnSPPEhrdE3/
	 LiY/0F7Z8nfbllML//t+sZANIUUiL0H0fOVw/S9Jl6iTsbd2MJK4NKwNSHi6n+CHIOSAs
	 Ywvm1czM+Pqy4Mg+1HvZwNhwt7n8naZW8GA4HxElSUBjjHKpdaPSG4NzwPJHgTywlmdiV
	 jC4uBO5w2YoJJUzmsCQBDg1ktCgY/iKEB4UJEplL+GavDIFX0Zif3lKFWQeSGDEOy1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773817;
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
	bh=3YqBPQqJjkaJeg5zLnNQ0QyAaMGyiY4PEOi6qnBqfLE=;
	b=UxQEkA1vyVWSjz1vpJKwTt5dqk7qOoGGl/Sjls8EEvCv4HKOBm5OJcJ6wqldGchRx41S
	 7IrHr2hHSz+pK0/DRZf0mJaYDvKvzkeZRBD7I0QhGsjs9nlkkQue5LWTjDn4Sd/5JXTej
	 JDEPqvexoKPUfpOO75RaEbqngGBbIpUY7s7hh6bogD3mgDWtlG/yIDcil6ShCbslx6fiF
	 clw65llH6zsnT2k6mHe1mfmeMTWClyYg55cBBsxOhU1XoMZYzaiWO5X//QlAbA3+YraiI
	 lvC5+lMPVbiatF2jK+keP6TijJkDbqiLnrOUe3R8Y5163U86uRPdq9cFhujY+JLh9Yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=P2VTr0Fg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.52
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013052.outbound.protection.outlook.com [40.107.162.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D16606A31E;
	Fri, 23 Oct 2026 16:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D16606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=P2VTr0Fg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C09WCzlzNxQ0JWS5E5pdtGl2vPgh066+GF2/Bh4VsBtoMAq5TE8ZKdnONr0W1ttW2BzQn/plRmVAmfsdlu9r2HOS3ZXNCFh4joiYpC/fGLzGG6yUJBRTSeoR0Rbks3YRIcayj/7uvJ2gHzUByD43Ua+1KyNzjZFygpAcpUYHTEpbmYQ1W9UCn/GLX5rq4kTQwR+9MaYDTUVAtFOl9VV/GbB8TjFEwbLfa/qFJj0pb5QvlbFamYxryTlvbor1ZTUcl1/VXHCg+sbyU/Pxih5a9su2BoeOpiKYZ9wlr8Gew0874OwNW0eg7azvnJE2t4HbYO6MiyiKOPtQQaTtkjU9/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YqBPQqJjkaJeg5zLnNQ0QyAaMGyiY4PEOi6qnBqfLE=;
 b=aonk0JQZ/mTzFRYfQ9faobjAaxnL78qvx+e/j+KLw0Sjx0e+AQmfnn/B2qZU3xW5ppwoyRbA2yNYsuiD7xvSuY+Cr2pm71nQ5NM0fc6r2uG0vG+246jj6U++omzNqOHR10EbyJeNC2q8DpR25Ryd7+dIWCLOOPJLkGoRgWvbjm5dMBuRBaT0I/LUQyFbm1PP3iIOsh4YAx8mB1p+j6DRABOc1+qTphLdrH3zhkRfqVk/Cwym2LagNOGmLBFrYnhqahsqQDEPB9hZqlMzCQO4th5nxVxQ7CX+Dr+2pbxKFKn8riMIpVkMJiNFT8jn0IJNsgeVeS5ZKpW0vxZ0mbVwhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YqBPQqJjkaJeg5zLnNQ0QyAaMGyiY4PEOi6qnBqfLE=;
 b=P2VTr0FghqZtJqQ313duhJWuCDDDr/JH/j9/AVubR3/fFvXKNLLDoXkezSjA6elmgDTsza+q3q3GOcAH/uPrRvIln8/Ac1dfJIpBvppLkmhmcuTBUx5B5LiE2ECMgcjHnZRb4OXb9MuPcEwOyoT8vaZ57BdsVfXxiHXopm9wCDNd+hufFoBzpxQk9bsG19KBBbjUwt8vHJC6RwN8KpntwqcJ5KyYlLqXpZ4P1wXSxs6sjFhXGRU5CNHJQIY6PQak4czBOIUTyO5Hto3hLX6yAkTqfq6XwH46H9NZEQCJxy37kdHKYjlmL5+Zcf39C1+YmxbwSalXb7RQz25vCMZe2Q==
Received: from AS4P195CA0007.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::7)
 by AM0PR10MB3682.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.4; Fri, 23 Oct
 2026 16:43:30 +0000
Received: from AM2PEPF00070CF6.eurprd02.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::11) by AS4P195CA0007.outlook.office365.com
 (2603:10a6:20b:5e2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 16:43:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF00070CF6.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 23 Oct 2026 16:43:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 18:43:49 +0200
Received: from localhost (10.252.9.175) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 18:43:28 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 23 Oct 2026 18:43:20 +0200
Subject: [PATCH v2 4/7] dt-bindings: stm32: add clock binding for
 Cortex-CM0 on stm32mp25 platform
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
Message-ID: <20261023-ups_mp25_clk_update-v2-4-398d348ea8fd@foss.st.com>
References: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
In-Reply-To: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Gwenael Treuveur
	<gwenael.treuveur@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792773804; l=4216;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=ihfuoPdN8mbPb8Kg/gwynWIfED3T6eWjZ6ZI4XBY7qQ=;
 b=+a8r673ds1Pa3+wFHNjEOlj3hHlpSV2zZdVppPwVz5jXMkhruss+iXy3jpPXRx6aiD0mMGehU
 WLYeu0PMz5DDv970/qXpH1C/N+6lVRkwWMPQ0lo3S6K5fgG4hrHHKVo
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF6:EE_|AM0PR10MB3682:EE_
X-MS-Office365-Filtering-Correlation-Id: 89aea6b7-ce1b-4378-be4d-08df3124c4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|23010399003|1800799024|11063799006|56012099006|22082099003|18002099003|10067099003|261021123027099003|261022105027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	0cJf3f7tu7nhH4HfhS2yMGKgDSKqaIQKWNA2iqNOS1PEJsjiU2YHJsV/U3I9OAUTOkAfZz9yUmvlReL4IWsOZl3HiQt57ypb6Ezi232yuPrGESKVPMf6CgWoLAuHN1g3VXLW4ldfZvjquov4/zrlhFruH4s7QlD4FVfAKW/FKwMjANV6uKadiU+/3uKy/A5Nv+goE7KqxYopszXOWvr0Ni0H5AfaYf2HVCK0dJzyScBq10qoSz8SHX/mbk1uJtFAzbX+VtJSSvDcLrisfRhydZXTd4tkUBryb8sGiv4H+Qwm9I+QSOovdo+kK9dUEPNXHyT/7fiQiT6Ck5DXn1MV3ZzmFrLZj3tKHrOwXsL3F0uriN//S8SJUDrOPzFb5eQmNaJNxttAg5fDVFFWpEUVleD7f1YpB47GaO/bVw9QK4g/8o+sAzBy6mIOxLTwHXQFXH3DMtpguDnnM+bM9S/eIBoiRmycOO9gCnGz0mz3OqyEbu6YH7CNbYnkbc67saox0huk+Zq/AEI/ITmAHlLFUo41zwe4Tvw6LJ6TVl1k1p1NNOU6cxMSLtBE9pnNsD6j1WnulXUvTQLawygXtCajHA20Fz3SHbVMux8x7a+TrwQqezIVe5yf7ViUpY2+w8VRrTlX2wEoIpWo/tdrxOOKYV3T48Srh3+Y0hzO1FBFNjWwWOzx+zNjnOsu2OtitxrBS4gZpAT2c9kyFhl/JGrBtA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(23010399003)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(261021123027099003)(261022105027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O3l6vOmqLifuGunHweba7wPd/A3MmRbQesZlvzGVKpv5vBKqM7G4rXCsn3qtRIkUyMQnPFX9LUp4hjndNrNr/30R/HCspypvIR34M49zkf8PMJgkDKmW6TzA8T7B9uJ3vGyxXTpm+0JpSsN/Buw+ADx6ZOvn1xCex3OwQBK8ahIoG4et1aPoeJHKtgLwsdvR9QL9IPLLUcqpHfMsySqBVEIE8GpSSMlVCyJk0/F9IB7/o9IgDkP0CDHZg5w9Cx1F2dd/rfYvbHSWi/OFQ8cp68F2fbNzaey4PTvFybI8z0JDsZeOGoOK5U0iRQD1KkLfq1QeJEGSE8NuDEupSh4ggJ9FGw/YTYGDDKQmCG0qPe2TxiN/wImntn4dMXyURQGapnYdvkedVrv5aHJCy9aN6xs8YnVOtBH1v8udh7GkXVMLTxGdbS+AXpF45Rpmfi2I
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 16:43:29.7088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89aea6b7-ce1b-4378-be4d-08df3124c4a8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3682

From: Gwenael Treuveur <gwenael.treuveur@foss.st.com>

Add the clock identifiers needed to allocate the D3 peripherals to the
Cortex-M0 (CPU3 domain) and to enable their autonomous mode:

 - CK_CPU3 and CK_<IP>_C3: allocation of the CPU3 domain and of the D3
   peripherals to CPU3
 - CK_CPU3_AM and CK_<IP>_AM: autonomous mode of the CPU3 domain and of
   the D3 peripherals
 - CK_HSI_KER_ON, CK_HSE_KER_ON and CK_MSI_KER_ON: kernel clocks of the
   HSI, HSE and MSI oscillators

Add the matching SCMI clocks: CK_SCMI_HSI_KER_ON, CK_SCMI_HSE_KER_ON,
CK_SCMI_MSI_KER_ON and the autonomous mode clocks owned by the SCMI
server (CK_SCMI_GPIOZ_AM, CK_SCMI_IPCC2_AM, CK_SCMI_LPDMA_AM and
CK_SCMI_RTC_AM).

The three kernel clocks of the HSI, HSE and MSI oscillators are also
added at the end of the RCC input clocks. They are optional, so that
the existing device trees remain valid.

Signed-off-by: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 .../bindings/clock/st,stm32mp25-rcc.yaml           |  9 +++++-
 include/dt-bindings/clock/st,stm32mp25-rcc.h       | 35 ++++++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
index 3b7925d2c175..423016ecb602 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
@@ -32,6 +32,7 @@ properties:
     const: 1
 
   clocks:
+    minItems: 80
     items:
       - description: CK_SCMI_HSE High Speed External oscillator (8 to 48 MHz)
       - description: CK_SCMI_HSI High Speed Internal oscillator (~ 64 MHz)
@@ -113,6 +114,9 @@ properties:
       - description: CK_SCMI_TIMG2 Peripheral bridge for timer2
       - description: CK_SCMI_PLL3 PLL3 clock
       - description: clk_dsi_txbyte DSI byte clock
+      - description: CK_SCMI_HSI_KER_ON Kernel High Speed Internal oscillator
+      - description: CK_SCMI_HSE_KER_ON Kernel High Speed External oscillator
+      - description: CK_SCMI_MSI_KER_ON Kernel Low Power Internal oscillator
 
   access-controllers:
     maxItems: 1
@@ -214,6 +218,9 @@ examples:
                  <&scmi_clk CK_SCMI_TIMG1>,
                  <&scmi_clk CK_SCMI_TIMG2>,
                  <&scmi_clk CK_SCMI_PLL3>,
-                 <&clk_dsi_txbyte>;
+                 <&clk_dsi_txbyte>,
+                 <&scmi_clk CK_SCMI_HSI_KER_ON>,
+                 <&scmi_clk CK_SCMI_HSE_KER_ON>,
+                 <&scmi_clk CK_SCMI_MSI_KER_ON>;
     };
 ...
diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
index cef997508b56..53c65e9a12f6 100644
--- a/include/dt-bindings/clock/st,stm32mp25-rcc.h
+++ b/include/dt-bindings/clock/st,stm32mp25-rcc.h
@@ -365,6 +365,34 @@
 #define HSE_DIV2_CK		343
 #define CK_KER_ETR		344
 #define CK_KER_STM		345
+#define CK_HSI_KER_ON		346
+#define CK_HSE_KER_ON		347
+#define CK_MSI_KER_ON		348
+#define CK_CPU3			349
+#define CK_ADF1_C3		350
+#define CK_GPIOZ_C3		351
+#define CK_I2C8_C3		352
+#define CK_I3C4_C3		353
+#define CK_LPDMA_C3		354
+#define CK_LPTIM3_C3		355
+#define CK_LPTIM4_C3		356
+#define CK_LPTIM5_C3		357
+#define CK_LPUART1_C3		358
+#define CK_RTC_C3		359
+#define CK_SPI8_C3		360
+#define CK_ADF1_AM		361
+#define CK_CPU3_AM		362
+#define CK_GPIOZ_AM		363
+#define CK_I2C8_AM		364
+#define CK_I3C4_AM		365
+#define CK_IPCC2_AM		366
+#define CK_LPDMA_AM		367
+#define CK_LPTIM3_AM		368
+#define CK_LPTIM4_AM		369
+#define CK_LPTIM5_AM		370
+#define CK_LPUART1_AM		371
+#define CK_RTC_AM		372
+#define CK_SPI8_AM		373
 
 #define CK_SCMI_ICN_HS_MCU	0
 #define CK_SCMI_ICN_SDMMC	1
@@ -490,5 +518,12 @@
 #define CK_SCMI_BUS_STM		122
 #define CK_SCMI_KER_STM		123
 #define CK_SCMI_KER_ETR		124
+#define CK_SCMI_HSI_KER_ON	125
+#define CK_SCMI_HSE_KER_ON	126
+#define CK_SCMI_MSI_KER_ON	127
+#define CK_SCMI_GPIOZ_AM	128
+#define CK_SCMI_IPCC2_AM	129
+#define CK_SCMI_LPDMA_AM	130
+#define CK_SCMI_RTC_AM		131
 
 #endif /* _DT_BINDINGS_STM32MP25_CLKS_H_ */

-- 
2.43.0

