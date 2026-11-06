Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793979361;
	b=GASxYdv37urJ7/Ll6nSuehsIlIjk3QAFIt0CHYHtIV7xu7evuEWDWaxNokQUAdkVyDFI
	 68FtEENO85bkD64NU3N48IWhypaE0i83PA/Vr0szDYpsEP5QY6DChd4cg77xTU2+asNdt
	 rWub47DrEyCSY75hkDyJRW0BVIhdUqGz133ZbK9Hl6tVCsmIYjxiGa/tBbKrR/flGTngW
	 5bRUfjXrVbrMSDjoQGGU5XePxSmsgpjbwME0i7vRsBIIfR9L5UjJjoolbHBGUK+ne+Rdg
	 9aksS08N1rhEHEPezkukceS3SRXx0hWY7sA8SoVYu0llfNAL2A4O8j+vWCDxoEbLoIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979361;
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
	bh=NF4OYJLzHJZCboMhCmJj/QV40fc5KCfLb6kq48uMn/U=;
	b=bUerMRTxz7e4yPDx/Ft7gtZdOVVond4WZQ62Qi4Ys9CMCf37bk7iNX6X4jGQhw4yK/Fb
	 C5hQAax1kJqT7vlcovmiYByxEkIL3QhZm8owkbPC2lyj0fli47qbx68hPlxA7q130oG4A
	 qIZVq1gKsElK5P6pSQsSw2uAsfvvRFJgauDuHtZp7W1lhDssdTDtokfkhowMU25eequsc
	 nGKsudebgY81IKN1WqyGmxBYTnCEf5ptYNKDUdF8DdDafZLuGARey/SCkIzZxXtZk2EZL
	 MvNkuXA5AaVIM7aGUiMwzzQkbY7y50csA6mtMi99PBRNZu0L0FRvKspdLiU0yz8qfQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b="M4ZPwJj/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.60
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19549606D812;
	Fri,  6 Nov 2026 15:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19549606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=M4ZPwJj/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBaeyXGKHK+hr0/mQcGLYk4EYZhsYoHZEOyiMFmYFoZ69V9N7HRb6q9o7kQbzjcERBL+EXWCGxtW05bGnoZLHPJQuBpYkfLunaKJ+RaK+Q5q3T7earFPaqoNn2acs6ci2st0kmFNcE6l2S+/XeETL7bJV5Kfx/2LXv6LMYehsVbXgJnX/17AxiXGPGF0wk+sUHmlTFBO0XwPLmDrllU0nM96ogIcwl5adzpKVDOFU/DKaulRfaKnfN/RmV8MBo8UFKYbLgITiglmGoZNzK9VcDT3hGSvvo7OP+Fqh6gIeI0hosM+2OJBxt/xhBvPQ6oGPlveBAzUqUyKGyMET80WvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NF4OYJLzHJZCboMhCmJj/QV40fc5KCfLb6kq48uMn/U=;
 b=d8iTd/9EQBTq0fhg2TAMBatRKWoRHiBnMW87O3e+mY3mhb+9ckWf7QtziwAtQToomq/BM8WchBBZzQlsSLfkRJ5Wy6nryKaQjIXgyIcaNBEFTUVgamtBrjVOlPP0YLgu54X6rKLPXmTRg1ENB7I/PtJj/y+MUXtUxKf/IZWNd19KQ88PkBRU6d22++W2Msd+juvWbFmfEA10nMeU2QLeJ5dCVkoV0LRfa0TFBV9C5sgQvEFhGpE+Tj7Mek5l0cJikaGMlbLlJFMK3cuGW/DcsTNXuLFB6WhwMy6EghghZNpaV4tqru56kwaJrnwwSWFd5OnfufQ+eWhqpYMORupOiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NF4OYJLzHJZCboMhCmJj/QV40fc5KCfLb6kq48uMn/U=;
 b=M4ZPwJj/d0DvX8vyThIWhnMIVxY25fIVvr6O5ImcW2uY3Izh3iXsa/XkG0pjJLAfeKbgIkbHeI73M6L97SbFEeMtyebEvVTEg1+Vh0Satrj/MBOp0srgGC3YfoTJyaDEMPnpXMCpAMDZvqVTaRXj1dylc88/GQU3jj4FbLMyE8WdPTcOAoNVqj6qfR/rbreSnXiGExvMvSN4ffUvOhq/NTIsY/CjGDszW8fFlqoNsRR43bfwXFpJrJT+R4Mw6XnK1soq22Yo+3O9yeBPOGzGmGMQQSAYWXDBYE4iaFIQ9McqEaTqK/8jkg9anafpwOewbQzTlB9i+hXuSbVFbv+z8Q==
Received: from PAZP264CA0029.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:122::16)
 by PAWPR10MB6832.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:33c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 15:35:53 +0000
Received: from MI3PEPF00008487.eurprd02.prod.outlook.com
 (2603:10a6:102:122:cafe::86) by PAZP264CA0029.outlook.office365.com
 (2603:10a6:102:122::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 15:35:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008487.mail.protection.outlook.com (10.167.240.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 15:35:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:36:23 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:35:52 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 16:35:34 +0100
Subject: [PATCH v3 5/8] clk: stm32mp25: add clock for D3 peripherals
 allocation for Cortex-CM0
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
Message-ID: <20261106-ups_mp25_clk_update-v3-5-4a32f68119ed@foss.st.com>
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
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Gwenael Treuveur
	<gwenael.treuveur@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793979349; l=14585;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=hP4ZZFGqpf5fJCFZNqJYugdnwYhe35/K7Zrq40VVhZA=;
 b=t4AsR3WKI8uaeqT8hGuG8Wc0ziRJhQ8sVKVq5jSBXbvllNQMe7RH5EkWhmuHu4zGfT9WpzYnC
 9ymCMtRKwGKCIyyVPmxBzEQu3hMk6C8/VBTCseKrgVMTt/g2NHSm4Ja
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008487:EE_|PAWPR10MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: df91957d-14dc-4c72-4c5e-08df3c1ba460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|7416014|376014|23010399003|10067099003|18002099003|22082099003|261026121527099003|11063799006|261026140227099003|56012099006|261021123027099003|261028144727099003|261022105027099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	uCZM2zC+TjoEPPtH5cKzi3WJ+xUM4/3iZFwQwC9Zc56THM15VC7eVFZ08g0Bbd1xZUzmnCG5+CtXYdnaQ1sotNze4IQAe3uH0ONudTF5BG/ojQayqZRMUPXyss3hCeIfUqSSdMIA2T9PWt4f7SZdhTOYqFdajyyYgjPDMbXvLSvF6hLRFe1dAfxMJcX2N8/gOaKXU2pGd6gHPcFfULtoX+u8z39gENf14oLRCdLyHMnZoE7uNM914OrRKfAU2gcLnCaO2wNGLf8HZbt+w+hjmmS24Dy6VYvE4vdu2jd8wYU50eLrqsW08ZooXmcRD0qB5pvNS68y+GNN9cDpp6K61/CDZTay85ZkhqkrG3U214F+0/ncLL0tUwEOQPjGB+dGl4ZAdBkxz/SEOFuV2Gmedr8CM5AsgXinZJqGIx4XhexElZdazrLgk8g14kiEsGiu+s2QMGFqUl36nK93xwP1uk2QMOODwqv3NlUfPMzFKTnl+B1oiMVYHIayLY1LyAoKikseiJN1AD4LuAzm++qN7NKuNbRjcbtmrRe0/tLylITwhM3ZahtuweKlkyYhB0U1Ft7duNjFBsHylDpCRTg3IJmiwaiuaLBPmXb6QWdQHqKpEWZByYu01mfsoU9bAnHofLjVbKBk+msZuoBw7vrAHFCRY0FXDVrUyZBa6KuSgbo0jKkxZVcv6cuYE2Rb+kGRdaVtMraM0Lvp+Dyw53X9bQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(7416014)(376014)(23010399003)(10067099003)(18002099003)(22082099003)(261026121527099003)(11063799006)(261026140227099003)(56012099006)(261021123027099003)(261028144727099003)(261022105027099003)(261021121427099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h7EE5yxG72wqBLDEYsQJgQAUB73YthFZ/0tmbt/79qoaiNLVdROmEemL3CnzmeLsYsluRtOFkGZCl0mmCMMEXRPGr3aaheEw+oNNQDoT6rGVSsruyA/Sj4ir8rhBiU6c7Lrr9It3vH2W8Z49YcVpgVlLP6qRboHWGzDFIrH1+nJs0+aQesQR/ZEAg057ckgAvcl87lxUeTIzqeXPKa37KikwoyHX0H7hWr7LkuLZchpOyelblKfdThUVV4e6UwvYsaefQlyPTiawP9JxGP6rBI4niTw05HOLw5Ty9gTv8zCgoug8GuSCf71DIWnYIUX/fxTyYSqCwl2FBl77KpYTVw8YXcatE6GqjKC+qTk6Xkzw4bohp3LdaxupJA5Xyu1RVgWPFsHcnObf8qvwVKyDbRYCFGkOQu9FRI2AaqRMihyqfQprZG9wjn2jMf5JgNki
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:35:52.9026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df91957d-14dc-4c72-4c5e-08df3c1ba460
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008487.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6832

GATE_<IP>AM allows to enable the Autonomous Mode of the D3 peripherals.
GATE_<IP>C3 allows to enable the allocation of the peripherals to CPU3.

For any D3 peripheral allocated to CPU3 (CPU3 domain is used and AMEN),
MSIKERON must be set to allow the Stop modes. That is why all the
autonomous clocks have the MSI KER clock as their parent.

Add the HSI KER, HSE KER and MSI KER clocks as new RCC input clocks and
register the C3 reset.

Update the number of clocks of the provider to cover the new IDs.

Signed-off-by: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp25.c | 176 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 175 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index fa025a9f3f37..e3a2e5ea775c 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -18,7 +18,7 @@
 #include <dt-bindings/reset/st,stm32mp25-rcc.h>
 
 /* Number of clock identifiers of the binding, SCMI ones excluded: highest ID + 1 */
-#define STM32MP25_LAST_CLK	(HSE_DIV2_CK + 1)
+#define STM32MP25_LAST_CLK	(CK_SPI8_AM + 1)
 
 /* Clock security definition */
 #define SECF_NONE		-1
@@ -38,6 +38,7 @@
 /* Register: RIFSC_SEMCR */
 #define RCC_SEMCR_SEMCID_MASK	GENMASK(6, 4)
 
+#define MP25_RIF_RCC_C3		72
 #define MP25_RIF_RCC_IS2M	107
 #define MP25_RIF_RCC_MCO1	108
 #define MP25_RIF_RCC_MCO2	109
@@ -126,6 +127,9 @@ enum {
 	TIMG2,
 	PLL3,
 	DSI_TXBYTE,
+	HSI_KER_ON,
+	HSE_KER_ON,
+	MSI_KER_ON,
 };
 
 static const struct clk_parent_data adc12_src[] = {
@@ -225,6 +229,10 @@ enum enum_gate_cfg {
 	GATE_ADC12,
 	GATE_ADC3,
 	GATE_ADF1,
+	GATE_ADF1AM,
+	GATE_ADF1C3,
+	GATE_C3,
+	GATE_C3AM,
 	GATE_CCI,
 	GATE_CRC,
 	GATE_CRYP1,
@@ -249,6 +257,7 @@ enum enum_gate_cfg {
 	GATE_ETHSWMAC,
 	GATE_ETHSWREF,
 	GATE_FDCAN,
+	GATE_GPIOZC3,
 	GATE_GPU,
 	GATE_HASH,
 	GATE_HDP,
@@ -260,22 +269,35 @@ enum enum_gate_cfg {
 	GATE_I2C6,
 	GATE_I2C7,
 	GATE_I2C8,
+	GATE_I2C8AM,
+	GATE_I2C8C3,
 	GATE_I3C1,
 	GATE_I3C2,
 	GATE_I3C3,
 	GATE_I3C4,
+	GATE_I3C4AM,
+	GATE_I3C4C3,
 	GATE_IS2M,
 	GATE_IWDG1,
 	GATE_IWDG2,
 	GATE_IWDG3,
 	GATE_IWDG4,
 	GATE_IWDG5,
+	GATE_LPDMAC3,
 	GATE_LPTIM1,
 	GATE_LPTIM2,
 	GATE_LPTIM3,
+	GATE_LPTIM3AM,
+	GATE_LPTIM3C3,
 	GATE_LPTIM4,
+	GATE_LPTIM4AM,
+	GATE_LPTIM4C3,
 	GATE_LPTIM5,
+	GATE_LPTIM5AM,
+	GATE_LPTIM5C3,
 	GATE_LPUART1,
+	GATE_LPUART1AM,
+	GATE_LPUART1C3,
 	GATE_LTDC,
 	GATE_LVDS,
 	GATE_MCO1,
@@ -285,6 +307,7 @@ enum enum_gate_cfg {
 	GATE_PCIE,
 	GATE_PKA,
 	GATE_RNG,
+	GATE_RTCC3,
 	GATE_SAES,
 	GATE_SAI1,
 	GATE_SAI2,
@@ -303,6 +326,8 @@ enum enum_gate_cfg {
 	GATE_SPI6,
 	GATE_SPI7,
 	GATE_SPI8,
+	GATE_SPI8AM,
+	GATE_SPI8C3,
 	GATE_TIM1,
 	GATE_TIM10,
 	GATE_TIM11,
@@ -354,6 +379,10 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
 	GATE_CFG(GATE_ADC12,		RCC_ADC12CFGR,		1,	0),
 	GATE_CFG(GATE_ADC3,		RCC_ADC3CFGR,		1,	0),
 	GATE_CFG(GATE_ADF1,		RCC_ADF1CFGR,		1,	0),
+	GATE_CFG(GATE_ADF1AM,		RCC_ADF1CFGR,		3,	0),
+	GATE_CFG(GATE_ADF1C3,		RCC_C3CFGR,		23,	0),
+	GATE_CFG(GATE_C3,		RCC_C3CFGR,		1,	0),
+	GATE_CFG(GATE_C3AM,		RCC_C3CFGR,		3,	0),
 	GATE_CFG(GATE_CCI,		RCC_CCICFGR,		1,	0),
 	GATE_CFG(GATE_CRC,		RCC_CRCCFGR,		1,	0),
 	GATE_CFG(GATE_CRYP1,		RCC_CRYP1CFGR,		1,	0),
@@ -378,6 +407,7 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
 	GATE_CFG(GATE_ETHSWMAC,		RCC_ETHSWCFGR,		1,	0),
 	GATE_CFG(GATE_ETHSWREF,		RCC_ETHSWCFGR,		21,	0),
 	GATE_CFG(GATE_FDCAN,		RCC_FDCANCFGR,		1,	0),
+	GATE_CFG(GATE_GPIOZC3,		RCC_C3CFGR,		24,	0),
 	GATE_CFG(GATE_GPU,		RCC_GPUCFGR,		1,	0),
 	GATE_CFG(GATE_HASH,		RCC_HASHCFGR,		1,	0),
 	GATE_CFG(GATE_HDP,		RCC_HDPCFGR,		1,	0),
@@ -389,22 +419,35 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
 	GATE_CFG(GATE_I2C6,		RCC_I2C6CFGR,		1,	0),
 	GATE_CFG(GATE_I2C7,		RCC_I2C7CFGR,		1,	0),
 	GATE_CFG(GATE_I2C8,		RCC_I2C8CFGR,		1,	0),
+	GATE_CFG(GATE_I2C8AM,		RCC_I2C8CFGR,		3,	0),
+	GATE_CFG(GATE_I2C8C3,		RCC_C3CFGR,		21,	0),
 	GATE_CFG(GATE_I3C1,		RCC_I3C1CFGR,		1,	0),
 	GATE_CFG(GATE_I3C2,		RCC_I3C2CFGR,		1,	0),
 	GATE_CFG(GATE_I3C3,		RCC_I3C3CFGR,		1,	0),
 	GATE_CFG(GATE_I3C4,		RCC_I3C4CFGR,		1,	0),
+	GATE_CFG(GATE_I3C4AM,		RCC_I3C4CFGR,		3,	0),
+	GATE_CFG(GATE_I3C4C3,		RCC_C3CFGR,		27,	0),
 	GATE_CFG(GATE_IS2M,		RCC_IS2MCFGR,		1,	0),
 	GATE_CFG(GATE_IWDG1,		RCC_IWDG1CFGR,		1,	0),
 	GATE_CFG(GATE_IWDG2,		RCC_IWDG2CFGR,		1,	0),
 	GATE_CFG(GATE_IWDG3,		RCC_IWDG3CFGR,		1,	0),
 	GATE_CFG(GATE_IWDG4,		RCC_IWDG4CFGR,		1,	0),
 	GATE_CFG(GATE_IWDG5,		RCC_IWDG5CFGR,		1,	0),
+	GATE_CFG(GATE_LPDMAC3,		RCC_C3CFGR,		25,	0),
 	GATE_CFG(GATE_LPTIM1,		RCC_LPTIM1CFGR,		1,	0),
 	GATE_CFG(GATE_LPTIM2,		RCC_LPTIM2CFGR,		1,	0),
 	GATE_CFG(GATE_LPTIM3,		RCC_LPTIM3CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM3AM,		RCC_LPTIM3CFGR,		3,	0),
+	GATE_CFG(GATE_LPTIM3C3,		RCC_C3CFGR,		16,	0),
 	GATE_CFG(GATE_LPTIM4,		RCC_LPTIM4CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM4AM,		RCC_LPTIM4CFGR,		3,	0),
+	GATE_CFG(GATE_LPTIM4C3,		RCC_C3CFGR,		17,	0),
 	GATE_CFG(GATE_LPTIM5,		RCC_LPTIM5CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM5AM,		RCC_LPTIM5CFGR,		3,	0),
+	GATE_CFG(GATE_LPTIM5C3,		RCC_C3CFGR,		18,	0),
 	GATE_CFG(GATE_LPUART1,		RCC_LPUART1CFGR,	1,	0),
+	GATE_CFG(GATE_LPUART1AM,	RCC_LPUART1CFGR,	3,	0),
+	GATE_CFG(GATE_LPUART1C3,	RCC_C3CFGR,		20,	0),
 	GATE_CFG(GATE_LTDC,		RCC_LTDCCFGR,		1,	0),
 	GATE_CFG(GATE_LVDS,		RCC_LVDSCFGR,		1,	0),
 	GATE_CFG(GATE_MCO1,		RCC_MCO1CFGR,		8,	0),
@@ -414,6 +457,7 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
 	GATE_CFG(GATE_PCIE,		RCC_PCIECFGR,		1,	0),
 	GATE_CFG(GATE_PKA,		RCC_PKACFGR,		1,	0),
 	GATE_CFG(GATE_RNG,		RCC_RNGCFGR,		1,	0),
+	GATE_CFG(GATE_RTCC3,		RCC_C3CFGR,		26,	0),
 	GATE_CFG(GATE_SAES,		RCC_SAESCFGR,		1,	0),
 	GATE_CFG(GATE_SAI1,		RCC_SAI1CFGR,		1,	0),
 	GATE_CFG(GATE_SAI2,		RCC_SAI2CFGR,		1,	0),
@@ -432,6 +476,8 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
 	GATE_CFG(GATE_SPI6,		RCC_SPI6CFGR,		1,	0),
 	GATE_CFG(GATE_SPI7,		RCC_SPI7CFGR,		1,	0),
 	GATE_CFG(GATE_SPI8,		RCC_SPI8CFGR,		1,	0),
+	GATE_CFG(GATE_SPI8AM,		RCC_SPI8CFGR,		3,	0),
+	GATE_CFG(GATE_SPI8C3,		RCC_C3CFGR,		19,	0),
 	GATE_CFG(GATE_TIM1,		RCC_TIM1CFGR,		1,	0),
 	GATE_CFG(GATE_TIM10,		RCC_TIM10CFGR,		1,	0),
 	GATE_CFG(GATE_TIM11,		RCC_TIM11CFGR,		1,	0),
@@ -518,6 +564,77 @@ static struct clk_stm32_gate ck_ker_adf1 = {
 	.hw.init = CLK_HW_INIT_INDEX("ck_ker_adf1", FLEXGEN_42, &clk_stm32_gate_ops, 0),
 };
 
+static struct clk_stm32_gate ck_ker_adf1_am = {
+	.gate_id = GATE_ADF1AM,
+	.hw.init = CLK_HW_INIT_HW("ck_ker_adf1_am", &ck_ker_adf1.hw, &clk_stm32_gate_ops, 0),
+};
+
+/* C3 */
+static struct clk_stm32_gate ck_cpu3 = {
+	.gate_id = GATE_C3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_cpu3", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_cpu3_am = {
+	.gate_id = GATE_C3AM,
+	.hw.init = CLK_HW_INIT_HW("ck_cpu3_am", &ck_cpu3.hw, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_c3_adf1 = {
+	.gate_id = GATE_ADF1C3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_c3_adf1", MSI_KER_ON, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_c3_gpioz = {
+	.gate_id = GATE_GPIOZC3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_c3_gpioz", MSI_KER_ON, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_c3_i2c8 = {
+	.gate_id = GATE_I2C8C3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_c3_i2c8", MSI_KER_ON, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_c3_i3c4 = {
+	.gate_id = GATE_I3C4C3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_c3_i3c4", MSI_KER_ON, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_c3_lpdma = {
+	.gate_id = GATE_LPDMAC3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_c3_lpdma", MSI_KER_ON, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_c3_lptim3 = {
+	.gate_id = GATE_LPTIM3C3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_c3_lptim3", MSI_KER_ON, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_c3_lptim4 = {
+	.gate_id = GATE_LPTIM4C3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_c3_lptim4", MSI_KER_ON, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_c3_lptim5 = {
+	.gate_id = GATE_LPTIM5C3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_c3_lptim5", MSI_KER_ON, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_c3_lpuart1 = {
+	.gate_id = GATE_LPUART1C3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_c3_lpuart1", MSI_KER_ON, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_c3_rtc = {
+	.gate_id = GATE_RTCC3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_c3_rtc", MSI_KER_ON, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_c3_spi8 = {
+	.gate_id = GATE_SPI8C3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_c3_spi8", MSI_KER_ON, &clk_stm32_gate_ops, 0),
+};
+
 /* DCMI */
 static struct clk_stm32_gate ck_icn_p_cci = {
 	.gate_id = GATE_CCI,
@@ -844,6 +961,11 @@ static struct clk_stm32_gate ck_ker_i2c8 = {
 	.hw.init = CLK_HW_INIT_INDEX("ck_ker_i2c8", FLEXGEN_38, &clk_stm32_gate_ops, 0),
 };
 
+static struct clk_stm32_gate ck_ker_i2c8_am = {
+	.gate_id = GATE_I2C8AM,
+	.hw.init = CLK_HW_INIT_HW("ck_ker_i2c8_am", &ck_ker_i2c8.hw, &clk_stm32_gate_ops, 0),
+};
+
 /* I3C */
 static struct clk_stm32_gate ck_icn_p_i3c1 = {
 	.gate_id = GATE_I3C1,
@@ -885,6 +1007,11 @@ static struct clk_stm32_gate ck_ker_i3c4 = {
 	.hw.init = CLK_HW_INIT_INDEX("ck_ker_i3c4", FLEXGEN_36, &clk_stm32_gate_ops, 0),
 };
 
+static struct clk_stm32_gate ck_ker_i3c4_am = {
+	.gate_id = GATE_I3C4AM,
+	.hw.init = CLK_HW_INIT_HW("ck_ker_i3c4_am", &ck_ker_i3c4.hw, &clk_stm32_gate_ops, 0),
+};
+
 /* I2S */
 static struct clk_stm32_gate ck_icn_p_is2m = {
 	.gate_id = GATE_IS2M,
@@ -958,16 +1085,31 @@ static struct clk_stm32_gate ck_ker_lptim3 = {
 	.hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim3", FLEXGEN_40, &clk_stm32_gate_ops, 0),
 };
 
+static struct clk_stm32_gate ck_ker_lptim3_am = {
+	.gate_id = GATE_LPTIM3AM,
+	.hw.init = CLK_HW_INIT_HW("ck_ker_lptim3_am", &ck_ker_lptim3.hw, &clk_stm32_gate_ops, 0),
+};
+
 static struct clk_stm32_gate ck_ker_lptim4 = {
 	.gate_id = GATE_LPTIM4,
 	.hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim4", FLEXGEN_41, &clk_stm32_gate_ops, 0),
 };
 
+static struct clk_stm32_gate ck_ker_lptim4_am = {
+	.gate_id = GATE_LPTIM4AM,
+	.hw.init = CLK_HW_INIT_HW("ck_ker_lptim4_am", &ck_ker_lptim4.hw, &clk_stm32_gate_ops, 0),
+};
+
 static struct clk_stm32_gate ck_ker_lptim5 = {
 	.gate_id = GATE_LPTIM5,
 	.hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim5", FLEXGEN_41, &clk_stm32_gate_ops, 0),
 };
 
+static struct clk_stm32_gate ck_ker_lptim5_am = {
+	.gate_id = GATE_LPTIM5AM,
+	.hw.init = CLK_HW_INIT_HW("ck_ker_lptim5_am", &ck_ker_lptim5.hw, &clk_stm32_gate_ops, 0),
+};
+
 /* LPUART */
 static struct clk_stm32_gate ck_icn_p_lpuart1 = {
 	.gate_id = GATE_LPUART1,
@@ -979,6 +1121,11 @@ static struct clk_stm32_gate ck_ker_lpuart1 = {
 	.hw.init = CLK_HW_INIT_INDEX("ck_ker_lpuart1", FLEXGEN_39, &clk_stm32_gate_ops, 0),
 };
 
+static struct clk_stm32_gate ck_ker_lpuart1_am = {
+	.gate_id = GATE_LPUART1AM,
+	.hw.init = CLK_HW_INIT_HW("ck_ker_lpuart1_am", &ck_ker_lpuart1.hw, &clk_stm32_gate_ops, 0),
+};
+
 /* MCO1 & MCO2 */
 static struct clk_stm32_composite ck_mco1 = {
 	.gate_id = GATE_MCO1,
@@ -1212,6 +1359,11 @@ static struct clk_stm32_gate ck_ker_spi8 = {
 	.hw.init = CLK_HW_INIT_INDEX("ck_ker_spi8", FLEXGEN_37, &clk_stm32_gate_ops, 0),
 };
 
+static struct clk_stm32_gate ck_ker_spi8_am = {
+	.gate_id = GATE_SPI8AM,
+	.hw.init = CLK_HW_INIT_HW("ck_ker_spi8_am", &ck_ker_spi8.hw, &clk_stm32_gate_ops, 0),
+};
+
 /* Timers */
 static struct clk_stm32_gate ck_icn_p_tim2 = {
 	.gate_id = GATE_TIM2,
@@ -1787,13 +1939,34 @@ static const struct clock_config stm32mp25_clock_cfg[] = {
 	STM32_GATE_CFG(CK_KER_CSIPHY,		ck_ker_csiphy,		SEC_RIFSC(86)),
 	STM32_GATE_CFG(CK_KER_USBTC,		ck_ker_usbtc,		SEC_RIFSC(69)),
 	STM32_GATE_CFG(CK_KER_I3C4,		ck_ker_i3c4,		SEC_RIFSC(117)),
+	STM32_GATE_CFG(CK_I3C4_AM,		ck_ker_i3c4_am,		SEC_RIFSC(117)),
 	STM32_GATE_CFG(CK_KER_SPI8,		ck_ker_spi8,		SEC_RIFSC(29)),
+	STM32_GATE_CFG(CK_SPI8_AM,		ck_ker_spi8_am,		SEC_RIFSC(29)),
 	STM32_GATE_CFG(CK_KER_I2C8,		ck_ker_i2c8,		SEC_RIFSC(48)),
+	STM32_GATE_CFG(CK_I2C8_AM,		ck_ker_i2c8_am,		SEC_RIFSC(48)),
 	STM32_GATE_CFG(CK_KER_LPUART1,		ck_ker_lpuart1,		SEC_RIFSC(40)),
+	STM32_GATE_CFG(CK_LPUART1_AM,		ck_ker_lpuart1_am,	SEC_RIFSC(40)),
 	STM32_GATE_CFG(CK_KER_LPTIM3,		ck_ker_lptim3,		SEC_RIFSC(19)),
+	STM32_GATE_CFG(CK_LPTIM3_AM,		ck_ker_lptim3_am,	SEC_RIFSC(19)),
 	STM32_GATE_CFG(CK_KER_LPTIM4,		ck_ker_lptim4,		SEC_RIFSC(20)),
+	STM32_GATE_CFG(CK_LPTIM4_AM,		ck_ker_lptim4_am,	SEC_RIFSC(20)),
 	STM32_GATE_CFG(CK_KER_LPTIM5,		ck_ker_lptim5,		SEC_RIFSC(21)),
+	STM32_GATE_CFG(CK_LPTIM5_AM,		ck_ker_lptim5_am,	SEC_RIFSC(21)),
 	STM32_GATE_CFG(CK_KER_ADF1,		ck_ker_adf1,		SEC_RIFSC(55)),
+	STM32_GATE_CFG(CK_ADF1_AM,		ck_ker_adf1_am,		SEC_RIFSC(55)),
+	STM32_GATE_CFG(CK_CPU3,			ck_cpu3,		MP25_RIF_RCC_C3),
+	STM32_GATE_CFG(CK_CPU3_AM,		ck_cpu3_am,		MP25_RIF_RCC_C3),
+	STM32_GATE_CFG(CK_ADF1_C3,		ck_c3_adf1,		MP25_RIF_RCC_C3),
+	STM32_GATE_CFG(CK_GPIOZ_C3,		ck_c3_gpioz,		MP25_RIF_RCC_C3),
+	STM32_GATE_CFG(CK_I2C8_C3,		ck_c3_i2c8,		MP25_RIF_RCC_C3),
+	STM32_GATE_CFG(CK_I3C4_C3,		ck_c3_i3c4,		MP25_RIF_RCC_C3),
+	STM32_GATE_CFG(CK_LPDMA_C3,		ck_c3_lpdma,		MP25_RIF_RCC_C3),
+	STM32_GATE_CFG(CK_LPTIM3_C3,		ck_c3_lptim3,		MP25_RIF_RCC_C3),
+	STM32_GATE_CFG(CK_LPTIM4_C3,		ck_c3_lptim4,		MP25_RIF_RCC_C3),
+	STM32_GATE_CFG(CK_LPTIM5_C3,		ck_c3_lptim5,		MP25_RIF_RCC_C3),
+	STM32_GATE_CFG(CK_LPUART1_C3,		ck_c3_lpuart1,		MP25_RIF_RCC_C3),
+	STM32_GATE_CFG(CK_RTC_C3,		ck_c3_rtc,		MP25_RIF_RCC_C3),
+	STM32_GATE_CFG(CK_SPI8_C3,		ck_c3_spi8,		MP25_RIF_RCC_C3),
 	STM32_GATE_CFG(CK_KER_SDMMC1,		ck_ker_sdmmc1,		SEC_RIFSC(76)),
 	STM32_GATE_CFG(CK_KER_SDMMC2,		ck_ker_sdmmc2,		SEC_RIFSC(77)),
 	STM32_GATE_CFG(CK_KER_SDMMC3,		ck_ker_sdmmc3,		SEC_RIFSC(78)),
@@ -1942,6 +2115,7 @@ static const struct stm32_reset_cfg *stm32mp25_reset_cfg[STM32MP25_LAST_RESET] =
 	RESET_MP25(CRYP1_R,		RCC_CRYP1CFGR,		0,	0),
 	RESET_MP25(CRYP2_R,		RCC_CRYP2CFGR,		0,	0),
 	RESET_MP25(PCIE_R,		RCC_PCIECFGR,		0,	0),
+	RESET_MP25(C3_R,		RCC_C3CFGR,		0,	0),
 };
 
 static u16 stm32mp25_cpt_gate[GATE_NB];

-- 
2.43.0

