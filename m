Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792762096;
	b=SqELTdevvhNiXNyVHxTN4IBEscPjxyq/gyK7zUBrGxldApiWoIN4U9ADoWJvpF7cm1O/
	 pJpTmr86QMkvP+aHRo2a+/Kt8X4F/PaIWuc4S6levCzfSfSoSkA+Gy9i3wJ9LTTIkWOno
	 H1WJvKh1jWRNVVTcWeesQxrArXO9L6hwRwrTMr25Zz4OuUMMpsuteFM2jfJ0GjYSy1e+F
	 +U35wRn2LMgoLLjOGNkXXFGZE/f99ImNA5NwH6ijyTlnV225ID/on5stpD1UnhmBJMM96
	 sF2qHJWQZ4fbiICOXZNtLt59MsH9Biw0XqIoAOwIjdeGAkHXPtUQcd2ICH9GxAu/GXw==
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
	bh=EmxW++muCBoJP1KSzHZBk5/1E6g51EifKo5ZOv2LTxI=;
	b=RAapcnVonSZng4El3Y7Vw29EZLInwGU0yycDCAxAVKbrwnwpJAxBGal3T1AHY/x5cSh4
	 2AiVgul90vmnWkLjsBASx2EjdJcIaCoZghpWtyAeOhB/95aViZ1f/T5hoRnHPmuY81Q4T
	 9vf0Ghf1QbTl5nTaYJ1fLFC75l+hCs76+Bi6AJW0MHQHHJPf/iMXMmdXwwXxMgaugHTu5
	 irRzbAXnFhEnuUFN68uJg0eEbcy65oTp5gg0UwPEbCuB+auuM0/GPlMQADpVHzYfMWW/7
	 WQrhyyyk9MISeHpdDra1CukgH5wMjg0Z5UTekZjUCIiiQEqu2c/YCD7dXhc0T7l8ArQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b="k0Pg/GS6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.68
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDA1606A329;
	Fri, 23 Oct 2026 13:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DDA1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=k0Pg/GS6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3oxg33kaA3F0hChSUTkpVVSFnfylN/KKgKMNO4l6Sm64IMdisYP8I7UQFHUvq288SdiM1jUcEoDFL5eMqI/SnzHZ7hG/goz10M3UV+rMFrWjZu8wwZmsiGqEqAaRmdc+L0R62YXJqICkhT0iDfi7xUJF0JEijFmrqFTRYTY9CdIM/COvHUpxjm22k/kbxNWVjYBwqOItfrSBBKgTC+5tR/5eEpgUuhvrjeoA/Xs6CTdhju9jwdYy9cjWh6M83LHTzFXFYri4U2shboFqUJWn/i5lCs6DUVV3MbPFfvNk+5FbU5WatS1RblKo4BGh45TSqeekks04Fbj48q34IL/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmxW++muCBoJP1KSzHZBk5/1E6g51EifKo5ZOv2LTxI=;
 b=aq1CrY8nCaGPO9EzpK07dV2hph+js6zAJeEfnGWnw4YfXBiRbSICB1rHagvncm7y5Xrn6B2jySdzDfY3z0nW5phlaZYmJxxufVJfcnhPiWWigfuxvOlsUri6OxG9arRAl+6cTfo2HWz54z5ib9VczhLq9ZKWM+waIqkTV+6uifMp7iWHov11rWNtCN3u9M72iklMjXmCqCXMqDyhxJ7Z4U9+G2ifwKZaNXKl5alaefBE1Pzg8CgJJtDqylI2rOZHxUhyFz2H1RdOM35/chWCyWW/tQn/XOv64/ACjjYh+q0YRwtDz2/WCde2AdnBEOOcJ6p+vhpRj8LSn20kMshJAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmxW++muCBoJP1KSzHZBk5/1E6g51EifKo5ZOv2LTxI=;
 b=k0Pg/GS6CJOLPbnemH5l5uNwq0IL1nwNQu/a/yeirfHzwasVw/ferx5DgY07lETg83QL0zIyMBV4ukgtEag+r3YNp828CsuxMyEeeJxtYhY1j4leC1nzK2XH/NIKsdeqUuk/p7vrE/LNS0d7dN7Z/V59sE8ZH/1DMBu04Mv/CSckXmvjyTOglY67Kyj8YgdgAdMWhKrRloVrcvnkhPZGaiptL2pHtfYEVQ/CcUn3AMM4vDH3sZ9+sAXmI8L9hHGL6ZzwbfWwROFxLoLSx04aWRnPzqDpPVYyZ2xuyLCEfqXeEG+7cEzJS8TDQlWYyJhIawCH7hLshR52tRR47cD9Vw==
Received: from PAZP264CA0030.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:122::17)
 by DUZPR10MB8228.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4b2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.2; Fri, 23 Oct
 2026 13:28:10 +0000
Received: from ZR1PEPF0000E6BA.eurprd07.prod.outlook.com
 (2603:10a6:102:122:cafe::1d) by PAZP264CA0030.outlook.office365.com
 (2603:10a6:102:122::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 13:28:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E6BA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 13:28:09 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 15:28:41 +0200
Received: from localhost (10.252.9.175) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 15:28:09 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 23 Oct 2026 15:28:07 +0200
Subject: [PATCH 2/7] dt-bindings: stm32: add kernel clocks for ETR and STM
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
Message-ID: <20261023-ups_mp25_clk_update-v1-2-e906e7a38cb3@foss.st.com>
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
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792762086; l=1944;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=GSgOwjZDuhrIDIdVospjwtRBccbKbUndwKmf4/tHb7w=;
 b=X/g924sP92iO+PDejkmcPUFsLZSeqQIGVQo8O9eRVieWWvw3SkCcS4DUZsT/mM+ranj3klenM
 Sfu1RZC+vjCAXMhiaDTZWUQJm7+ohUlcQPiGIOXH9WowI+HS4Voq06w
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6BA:EE_|DUZPR10MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: ec931950-8f49-426c-3233-08df31097aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|7416014|376014|261021121427099003|10067099003|22082099003|18002099003|261021123027099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	5fnCsLR+f6NmPege+uPaageeIpR19Iy8glxWUoOmqF2UaNhZQfd9/xl2mHZJtjwuYpCoJR8c90GZCtog3jvjrV/+O2Bjjo33auVJCqPvko/oH27E+q/xla8+fGIvFeFIgurXT+Q5qtkTYkHzsFuxB2mYxqfEdbpHRbmra7NHB9QPPkH1njRN0dKDNT2G/jCvMbdzWTjLTg7TAD8X2DVp25jMBrtaTZ6BKbHcdS66d4c7CY8j4gGScsfVjTWHCfSQTce5GEckOruzlgYwk737rfq0bE97Usk0rIU1t6hS1lA1t2jmE0bBgS2tBeSjJ3iFFPdEXD00qXY4U4GaTNfe8sECt82S80Y3HtFTBix6DbpFGzxj2wgAYRQwLxoYcjzjq47IvxhHbHhXRvT+PdoKvfhNVAXAaW7Fb5lqyUZu0T/6Z3KciSULfWQOYk0MdYvmDpl33p0I64DpXP+fAG6lPGLvR6Hfs04MJ20BJXjBaYDUSefe798eQU0snOALYTL8Mxk0cB1Qc+n9I/vjkAUbYzW29zVfoWQtoEO2GG+/q/dOJne3NIW7OZL6CozAj2a64dLLYCTV1duNoe3w9DC202ge4Ghm8uW0FEcoyjvrX026jtJVTTPiGloLjaGNm6tF6sSK9mJr+94K2H+ukq5b1CD+p5C2wl3ndtkRmWXwHSxq+QF01hKNDfupapqZBO5xWPC7fOCcZDCVBv5IJp1adg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(7416014)(376014)(261021121427099003)(10067099003)(22082099003)(18002099003)(261021123027099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z2MES+1Ecrfl6+Oi36vJo6dJ77MxUskhdl6G90rKXTfKS+51l2yCeR8W9mbA+nF90txfHc3mcR+9MAa/D5sUmEimnO8vpDJ3WZ8eist0/KAr06qQimPLZuZudASMuelSDsPkg7brwnBHlFd++kUcBMKVyuz7JWILgU+3cp05cFLWb1MqbpSUwHK4Pj/SEjmW8wqs4H2z8fa4dQStyBWH0MQsqXqve7IZqsHuH8wRkbYNL8AWHGWlKlXKjju7jWGnWaV08k7mzwX6o29myvGASSq+93GDLD/tkFov5G8Iin2SkKdAgOt6yo7YV58hoEQZNdDpg2OWZD+N4LhEnr7CaauRYpYZS9UGg80mUe7qQR5qiNY3gojBQdemxxQznhlZIdHHjm6zWA/gaBjn6QD939F2532IZrAPfPLa3pXUHbAtENgXveCbk7SffroKVpf5
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 13:28:09.7284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec931950-8f49-426c-3233-08df31097aff
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6BA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8228

Add the kernel clocks of the ETR (CK_KER_ETR) and of the STM
(CK_KER_STM) for STM32MP25, with the matching SCMI clocks
(CK_SCMI_KER_ETR and CK_SCMI_KER_STM).
These are the trace (ATB) clocks of the CoreSight Embedded
Trace Router and System Trace Macrocell, while the bus clocks
only provide register access (APB).

Also rename the bus clocks according to the reference manual,
without changing their values: CK_BUS_STM500 into CK_BUS_STM,
CK_SCMI_STM500 into CK_SCMI_BUS_STM and CK_SCMI_ETR into
CK_SCMI_BUS_ETR.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 include/dt-bindings/clock/st,stm32mp25-rcc.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
index 242f61205a9f..cef997508b56 100644
--- a/include/dt-bindings/clock/st,stm32mp25-rcc.h
+++ b/include/dt-bindings/clock/st,stm32mp25-rcc.h
@@ -109,7 +109,7 @@
 /* LOW SPEED MCU CLOCK */
 #define CK_ICN_LS_MCU		88
 
-#define CK_BUS_STM500		89
+#define CK_BUS_STM		89
 #define CK_BUS_FMC		90
 #define CK_BUS_GPU		91
 #define CK_BUS_ETH1		92
@@ -363,6 +363,8 @@
 #define CK_BUS_ETHSWACMCFG	341
 #define CK_BUS_ETHSWACMMSG	342
 #define HSE_DIV2_CK		343
+#define CK_KER_ETR		344
+#define CK_KER_STM		345
 
 #define CK_SCMI_ICN_HS_MCU	0
 #define CK_SCMI_ICN_SDMMC	1
@@ -450,7 +452,7 @@
 #define CK_SCMI_TIMG2		83
 #define CK_SCMI_BKPSRAM		84
 #define CK_SCMI_BSEC		85
-#define CK_SCMI_ETR		87
+#define CK_SCMI_BUS_ETR		87
 #define CK_SCMI_FMC		88
 #define CK_SCMI_GPIOA		89
 #define CK_SCMI_GPIOB		90
@@ -485,6 +487,8 @@
 #define CK_SCMI_SYSDBG		119
 #define CK_SCMI_SYSATB		120
 #define CK_SCMI_TSDBG		121
-#define CK_SCMI_STM500		122
+#define CK_SCMI_BUS_STM		122
+#define CK_SCMI_KER_STM		123
+#define CK_SCMI_KER_ETR		124
 
 #endif /* _DT_BINDINGS_STM32MP25_CLKS_H_ */

-- 
2.43.0

