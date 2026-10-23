Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792762096;
	b=jQlqEtzqHgB6LXmnTfJtQmqL53oic5RugIdAuCyGh98sXyzjx/csIFpbu/3ukqpZBr9M
	 5BR/vNR4k5OkyLqlPHIKeQR6hamgMn3Dj5QWB09Hj1jCL5FmjY1VMK0R3nsik5tRc7kZM
	 gJkXQsnyk94/LGj4aMZK1Y9CkFuokhl2QRhU139G3lbrDvVBhgjAqCxUiE3Sl9shm4ZXJ
	 5WmO99xshCqJj3ZEynQkCdOy07wDurPtkFg/WV2lgBYTjNrymwznDyjMZdEzr4WwlfM1Y
	 C3f2yWR1y7nNzUKMXq4xYVpV8wH38pyxB/TR53wTYS1q/hn/IMZgIBFQhjux8/HZ11Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762096;
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
	b=HM50B7AxnqE/ASbrPkiDY310GYDiJyKwXr4/XVxTL0ey1nIC2QsoJXi51I8hnGm6Al3b
	 eLeCj6pHQlxyUUpL79GYdKdInJQe7V12hPMxEaxDnOkOVlUEL1psO4z/BvZ/gCiUAM4qp
	 qlEo7JwaX6ygxfC49e6P6Gz0eUw1354ZF6N1c7nAdYtilz+AS1wZHJWQkgV64HvoOxW2S
	 nbopOnW8kbqysyJ2zeoq3IKtOYfdF3nHmoWA9sYtO6FsCoIFhk08RuOMbEFxvt6m0cOUb
	 6NrFt0hacjAEqXBLULm4On1pfbHvydHLkf6IWeXFZfYepm/Lg9BWhTqyXiCRBqUJJaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b="P5cQ/Q8a";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.5
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013005.outbound.protection.outlook.com [52.101.83.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D72606A328;
	Fri, 23 Oct 2026 13:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D72606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=P5cQ/Q8a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gtwa8vfhCJgc6tpAMysXko6FW51uDnQ2EbyfVG5M2Rw6nz/N4nxueFk9dtydvWRNd5nyv4GLHRYokE7101cMnDr99eNDAxZ09/ekVuOyxPmnwEy3P4MWjtTY+WHsQLGNCMdYwTJkYSCDPl44SwpMZ0+YwaqzKz00PJfWVRzubT2uU7hbletY68Dxot64cez1aaCpw1LZpC3vHHSZCo0OHyUAMjxGenAittYXtF5iEGABCKeRxDaE2Zl8eZxPKOs7ImgNy6F9kZXDYI2MbTVm0458vkpdbsYpWrmGkgIdHATkQj6/OVN6yaZ080qDF5kpmlvJhEc1E/D7Yp08t5m8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YqBPQqJjkaJeg5zLnNQ0QyAaMGyiY4PEOi6qnBqfLE=;
 b=h6T99Qh4thOedw7H+ZgrdZSUKgjp4oTsICnQ2k5ZFG16I9EqK+C6MiCmqXeB8qmpZB/ENQG5W2POtOTqW2LzNn4L5dVBvaZfOE70uor9F5E/orO7iL4dahibrj1PINmO2uq/Mn2/obbHg9mlgQTv6zS08o8Bx+PY/LY2WDV0qFo2OpyQpi8bixJnYorw1Dt27CbhOAJu7AufLbN48z81p3WVcQBmjuqkCr9oYYnx+Dw8NjmFt6E6QjlbuXiS5cIT6XXJuD6R7LBjmjx2w6rbLP89q5IXvkcSC4D5t/H+IPavZerqiEmDR9bsSE+4bgw7kjKt2YeocMu3sM7xVWrPhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YqBPQqJjkaJeg5zLnNQ0QyAaMGyiY4PEOi6qnBqfLE=;
 b=P5cQ/Q8aty+xsD7Or0JalgpGCBVCb/oJoaBFuVOyjwL9PCPKliUKAqAcJb0fgzm0ISKpO6kFZDn87XCBlB7zqX3UuuGwOHeN4ffHEIqcmAO9Dmsb1HS1DxGhI3Qd70TMqHzYgrZZS67lW5HKQWpfveJjFoyH4FMMXREpGuKcoEI6W/xg/IiVPTD6vMCh+kCrO3y0SbcFwbPwsAQhQhTq3ekXE58InZYvS8A7oIcRlvdYIRuuCETVOqz+H1dCOPjo1UTFuxEnYl+UpNdYSovV9/SK2zX7M2OjqdRvH2z9UndO13NZlKypGg4CuAVlwkNjOA62xMVvXxxtDI5uJ2S69g==
Received: from PAZP264CA0016.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:21::21)
 by AS8PR10MB7158.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:61e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 13:28:12 +0000
Received: from ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
 (2603:10a6:102:21:cafe::31) by PAZP264CA0016.outlook.office365.com
 (2603:10a6:102:21::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 13:28:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E6B6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 13:28:11 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 15:28:43 +0200
Received: from localhost (10.252.9.175) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 15:28:11 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 23 Oct 2026 15:28:09 +0200
Subject: [PATCH 4/7] dt-bindings: stm32: add clock binding for Cortex-CM0
 on stm32mp25 platform
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
Message-ID: <20261023-ups_mp25_clk_update-v1-4-e906e7a38cb3@foss.st.com>
References: <20261023-ups_mp25_clk_update-v1-0-e906e7a38cb3@foss.st.com>
In-Reply-To: <20261023-ups_mp25_clk_update-v1-0-e906e7a38cb3@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792762086; l=4216;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=ihfuoPdN8mbPb8Kg/gwynWIfED3T6eWjZ6ZI4XBY7qQ=;
 b=DaMZvLzNoupEI0J+16cHrQ8M4Te99f6/nT2nET6q9xQhUoMW91On5o/Vq7ZbE9vj7sJqax20E
 +PcNJKCZdWBBdIA2gWheiXiw0v+grRRzJF3/Z1v7EnXEcPGvxUhCCYw
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6B6:EE_|AS8PR10MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae9d1a7-71d7-4ab7-8a79-08df31097c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|23010399003|36860700016|261021121427099003|11063799006|56012099006|261021123027099003|261009223027099003|10067099003|18002099003|22082099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	yWwgkXiN1G1h3pB8nsVNzbueKZkDttEzYwC2KiSYrKHZ9de+WLHtSSAJ/xioEkjPp711aDaHm3zElfM1zRpi5HXkypiCkeWXBt5Sd8/O+7WHPWol0uCRrML5mdB+peP5GYrgHMyimajM/djeRGEOjoFfoXkEsTbgl/iB6cl6Ye3VR5ihwKBLjs3TLw+870BYDfsWni/B1lX10pURW95y7TY6JwCoXBk/9B/iYoRc3kOVfJ28Af/mTcydKsI1Z2ZV4Ig1yH4Q4h4RGD4hGmvT9dPdqbrSgmvfI2+BBwZnggS2xtuNpiPc9+5utPazgeXHvQQqq5jLfsik4uEFt/4syan3dp3HA00+PXpV4L9hEUomCB5pI3+iWol70UqxOJMmPT8gkaKdPrOqO+v6VRfnmhXcMwJCvw61xlmvK1Xp9N3D4zKFGIj6fUxF8UiYowYdBHllvdfNgnMVbnXlp96cloO10b5EzmSsQInY5XePOebiXYzgBchIeLRF/IDD37vQVT5P65T9r1zy+XrQG8PMJ2HV7uOd6AejOWzgxc1PZ5qvwUvIOyOjpnZW4vmcc2A8oUZXTuWY229yEdtRo9/0i536EtZACVlihCekbbLY9IJSgPIkcmyGyS0lRV3S+qdiPYEuoj6FG5JhHW4UssrA01jvylh9AEgHkEe/Yi0pwrPlk7uRTe2khcX4zAvzH5dKsHPGxxteS9RhpfW6DPIvMQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(261021121427099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6gNdFaoUvervg9j7DTGiRceZpDj1MHSA9P0OuCsgA/l6bpPc46AwA675AQO5g1nrOyzEtg13ScHCwMpCfFhoP534LcmqO3kZI5MAWRXT3Of33wF6lF0O2XyX/9EVuWNL3RDrNHYVlvl7L7A2+Gc1Vn5TwI9YjSfkOELuixTt+2Lefy7FL3YfEz+kIuFU5QDSNWII6NZi2An0Vu03YVlxP2ZrDz8japz15OM/z6tKrL545As9/aD15unyZ2GxO2m/xTi63R/BrV1WgBidTFf2cOLkp9+Ge8AjyuCv/+im0mSLkAnWAb9DP0xBfs/kZhbyYweU1e1ES4QWslnJ5jhazrrODJahufJGcXj4/fyZavvChumfbU2iINj292tVnftTJw/t09iOnWALRk271vRZCE5gFo7LToxnR3W4LyBJkHEFIJL2kBuMBb8vjNA77gzM
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 13:28:11.8782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae9d1a7-71d7-4ab7-8a79-08df31097c41
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7158

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

