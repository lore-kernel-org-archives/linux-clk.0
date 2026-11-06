Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793979357;
	b=c4eiv9zrwXxfNQ6NT/EvwVoxCYoYFbnk8QerEyNgn4DubJAQ6GCxK8C08uSstrQKT475
	 HMCc3SUnlGQ4fUmHPAbDLLqqX9m3AhvSsL0nx0qqzh0lPPgcWJgAUxDSc2zfvXEOP5Jne
	 IlDEyU8lHrVhjFcFm2b7g1mo650t5dbh6Pm7p2WqlAD29em5kNNL6lF+eQr3q2TmTrv/F
	 9QaRAUBpCC4L16YsLwhhXGuiRx4OD1k+TXN1tq7P+p373vZUb51pJps6g/dY4G2ExvzL1
	 3O3lcHHEPWdOVBl06RVChZqJY+bBi1avIzuOQGvJveGiaKcjJo/mkx/LIp+wHWHAZtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979357;
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
	bh=AEFWqOVqUPH0uPHGTt97DtrZ7Hg0Z/XjInfBc+a0biQ=;
	b=Vnjvt4wvVUnE3aE8CbviftJbViNB2kkiPzENiEqGd+BhwRveWEbx0hXEAYBUURvInGWd
	 3kBAdBAVKrNKU4Vf2PkjdnTpUa3zSbxJGzMkIeebWXB+GKT5TVQpLoUw//qvFhNhiSJzs
	 u5XJJtYW3Fl1rU90I5ll75RvOZvy0y44ljtCbp0noXooN1CoY5YeM/kdQLJXwd2H0cpYa
	 HfSzq3h1oe+EVOxvFUVJyLoZeldND2+mIL1zUvU/NMP+aM/REvB05rRDrng65FbhyJ15C
	 Q2IfU1eZDAr992hffFotyCBoLA565T4CRSxYijLvLqwWz3+f+uUsSf9BjPcx+TAjxnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=UIWBd+M6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.56
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013056.outbound.protection.outlook.com [40.107.162.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B997606A32D;
	Fri,  6 Nov 2026 15:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B997606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=UIWBd+M6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7B8N2tnWca6FL/qQ8NY1btN802zt2JcwZ9YAxuknr3dgaKFJJSsOklDt27mIGeWDXJvEB1p7+yRKtCptQq8XTwrlKYGfx1iI/xS8nWOjhLagoXv/Brzc91lHLiRqe5Hn5gTavBArhbjaFZHyBjYa0mMQFjujm3qC7SCS9EDy9xBS3w1O4n4KADGOBvwcQz21WZF/qMFIyHH6Sd2QBeWlhwYnd/c9pe2FRBnqQx3Vz2RI66FxmJQv+l2bAbtVKGapRqK0V2W4cRFZVx932eZ3MklPLtGK8G6BJc1QpSqd7GNhtPBCy8d/64Kr9b3XST65GxMXQRZr18bB6YbWTvKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEFWqOVqUPH0uPHGTt97DtrZ7Hg0Z/XjInfBc+a0biQ=;
 b=xcSvb4F7caoqP33UuI3JP8myyk3cFWQgNDbjInczT6S/Qm8z65c2uzzwdNN6gSFIQnG5fmD3B/iWAocmLxZF/I31EDxb5+3bOj5zpHRevFHnWeKU30Cb8R3mieF+f3vlskFo2Hp/017eBctBXMZ/gPng/WAO7Mk9T38Erf21OQXOtrg3coKnrUNZ1RwgoUZheegRMHaAD662Y0XVoh+/2grXgB0SL9kHTQYScPqPZ2xvvt0+nl5uaV5WjG1Tm63HnHWS2YYNpEDAXgWMX7r36Zhmbxorh3qieJwP0V5pM2IwBYToBiwhfg2354P2VzOBipliWs5yK8rgRC4TJ4gkqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEFWqOVqUPH0uPHGTt97DtrZ7Hg0Z/XjInfBc+a0biQ=;
 b=UIWBd+M6yrbIvjloXEfBIXQP62oDkyIE9B0sD6tmlDFNAHBGlCnZQHEFy6FOiMNqs5cMH0z4LqGgRloZmzx1rltC5rxbKq2ZKVydQxGXoslwFLxZXGGmZyK3cA9OjVPFRBmkjiH+OrbGLU7DaWpG37uVPUhSjcuRht1117YQjjv99M+VHw/ODoBSQzRUSGVJ6CuSiS4B1IP+foh3rAzzBvSmKxUEFrmh3KXxfZaQCDppT5x3NUNHbgccMEUwE2D50S925DnKyOxN295lBMtG0Lh5KQdGBpUYhABUOTdRVIqEsKwJG/1//2KqJq1sld3aih0BB58uwfZPzJRqySDflA==
Received: from PA7P264CA0175.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36f::12)
 by DU4PR10MB9398.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:5f4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 15:35:53 +0000
Received: from MI3PEPF00008499.eurprd03.prod.outlook.com
 (2603:10a6:102:36f:cafe::48) by PA7P264CA0175.outlook.office365.com
 (2603:10a6:102:36f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 15:35:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008499.mail.protection.outlook.com (10.167.240.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 15:35:51 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:36:36 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:35:50 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 16:35:31 +0100
Subject: [PATCH v3 2/8] dt-bindings: stm32: add kernel clocks for ETR and
 STM
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
Message-ID: <20261106-ups_mp25_clk_update-v3-2-4a32f68119ed@foss.st.com>
References: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
In-Reply-To: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793979349; l=1203;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=xQI1FA3IDu5N0xkbp4Z1vV2Sf7/6woM3b3ah21Sw1QE=;
 b=p+uJ+SQTN8tqYUU6dr1/Fvo+OfwUsPz3y1n1mfWKGaKka1ombn8bLy4/cm25vgvwzXjPRmXB8
 FU4sSkDVrDIDdJ6Zd1FCXHPmfii8jaNX5EbXX0H9HEDSv97EO9GvaX6
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008499:EE_|DU4PR10MB9398:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e239213-19c6-4e9f-66e4-08df3c1ba348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700016|376014|23010399003|82310400026|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Wybk5hz2202kWRqsohJgj+AFvcIjiukwYDFGhl6NkO9dFHd7GLus1InNg+1VDTjcHU1wHsdaLVdEyJ8EkphMF0krMsc3hOq7M32hzG0hVdvguiBJ0eN4F0c21zFCpfQ8BnuXLmd7uH09w9LUNuOCfiJy/eawxfL/Kuil02pz9VF3l8MVEmBIuyQ9+2HHjmo7QuYswogSrWsBJkooHqyP3s9S5iSU+8lr48APIuBRPCBW8yCT9ojNkIBhL/6SKn5SzHzxVp1IZoTYDbk/9XKHFLdPaRLLdRU29oa8JIqIejRRzxUG5qWcM4U9tf3BlRGumvz8kSP07KXXu1pLPAOv/NAXlEIsdz1/GdC1KkHqvdaZXx125X2r4QatHBz5lekd4OjwvIITyigsiHGT5on0xC95gdfN6QAc6ADyLSlMGeyWFZaNPiGY1jIb950a+/b4dPJ7aK612MwG8RNKawyr5cK9Vj9vS/Dzxj8+NXyclhfJisU96IX1kN4zaGU3tGeem3K66Ql5gkoFrSQMe3X4LeNv+YnoTz28mZ01j5r5YQ3hx3jmxO7Pu68ap9iPW6a1OWsPGL/uaO9D7/J+p8UX+EyxwE78KV57bbtQN3+PyXEnN/mcrVrG3JkrWNKJQHHK1LFGm1vgrc+1Yvhyi3VCzpDjl4EGKDFTeT+aGMeN2ZEiTn+yZHij/kuc38YmEZtuxfRZbb4qVEa3R/XidhfMzQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700016)(376014)(23010399003)(82310400026)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PiCxaWwHxXRNVsNm9EUyiitMQbTQnsE7mvHwAwxTyqnmmZe5PfMIR4v9yJwMlrwGiy+8Zqc7GfuHBToV/9fn9/IbzjyjCtDyzd7W8oUoJpqNyYXtW2X7LUqyvmbWB3Lbt0FNxvUnkeQaGaUwFCmu1rrV99WzM9sbvnC/AoPa2tAuO1DXgv61tLgK4hF+x2vE4hhOOYMU/nrjoHHJQqlgOtFfCS8vYZglVfBeB+EVBMQAaBlkHO5xo6IsFjZgihqf4DePeeW/4Z1o/MNDRozurYC5YmZWV1oNTue/5o6C0ghKvqf+BhoZBp01y6G0RWYwd9KyTIP5ikILhc6Dh10NfbUUz4TsIxq6dglddExkuF2a96Q8YwOv6J0LiYfHxCyF1t3PxS/YMiBietlzeRGZdzMNWhuJ/AM7tDaFkhFz7ENxwHzU30M4DtoP5rQ58K7q
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:35:51.0684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e239213-19c6-4e9f-66e4-08df3c1ba348
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008499.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9398

Add the kernel clocks of the ETR (CK_KER_ETR) and of the STM
(CK_KER_STM) for STM32MP25, with the matching SCMI clocks
(CK_SCMI_KER_ETR and CK_SCMI_KER_STM).
These are the trace (ATB) clocks of the CoreSight Embedded
Trace Router and System Trace Macrocell, while the bus clocks
only provide register access (APB).

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 include/dt-bindings/clock/st,stm32mp25-rcc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
index 242f61205a9f..96b4cffbacb9 100644
--- a/include/dt-bindings/clock/st,stm32mp25-rcc.h
+++ b/include/dt-bindings/clock/st,stm32mp25-rcc.h
@@ -363,6 +363,8 @@
 #define CK_BUS_ETHSWACMCFG	341
 #define CK_BUS_ETHSWACMMSG	342
 #define HSE_DIV2_CK		343
+#define CK_KER_ETR		344
+#define CK_KER_STM		345
 
 #define CK_SCMI_ICN_HS_MCU	0
 #define CK_SCMI_ICN_SDMMC	1
@@ -486,5 +488,7 @@
 #define CK_SCMI_SYSATB		120
 #define CK_SCMI_TSDBG		121
 #define CK_SCMI_STM500		122
+#define CK_SCMI_KER_STM		123
+#define CK_SCMI_KER_ETR		124
 
 #endif /* _DT_BINDINGS_STM32MP25_CLKS_H_ */

-- 
2.43.0

