Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793981799;
	b=xFnJRP++Z0kWX5zp2VapPmd2SBPjVhNHJ8q8XZz6c4XezZm/fKjBQWY/kBrGzar7UaMD
	 8jOFDWnGDAYyZnOiuyOdXmRzvMwEO1CsYcaKCdqg/RGcHruEW7opm/jgymeeXLEwqYoCN
	 k5vH7XdkcwXnMlzpMJmhzyjtnPwqNCIGmIqJ+frKSbYDWZIIXArJpozeS7uv75kwa3WwM
	 8dyUKohK6LYiNoS9RlKuwWMHc8FEc3nDypcwuyzHjp2ls8IgBpHVO99l54lE1mpZzTqGK
	 L6XKYdw2/DqdzkvJ44gpx6CBcJ503mKe19+t6xmT3Kffn9nOQJvhXWGfN+vvzT5Rfcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981799;
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
	b=SyGX/RN09Du8Cy02jy7DRkvzhuNPXTUkAMJUi9jOMPcE9HCetyZpNnsFNflPHqio6+rs
	 sTvRBteDRTTQgxhGGo01Id26jOs2iUARTlrkdUivVOpNclB+fi0Ul6yuWSq64GFqxbdqA
	 38szfWh4fhCyxJbe0fP6234BEiudVuqGp5GXokW1o6F4bhC/c2YfMTmp5jkR55Jikfs//
	 Bbs5/YBol/6V5TY//iDeHoZWHP2i9IRjM9B52dSKhar1UlaWZjYdX4YYS08iwy+NJDBQY
	 CspoWElkUA7NiJDrCpiAkzISIeazIiNE2zTkhdM9dzpYu8eUQnBXKOHwWnk6x8vHc0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=bbRdIpzQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.51
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013051.outbound.protection.outlook.com [40.107.159.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08559606A339;
	Fri,  6 Nov 2026 16:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08559606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=bbRdIpzQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNlqFgIZo7eEW8/H17QOzlLYkEXX/DpgB3EFoMtx+WDWAObXT9wx8FRsu3Eq+tvGeIwLa9FXtOzLv0NYRd+v9fM5ADL653ujSBCT2HSQTFMAh0DgVb4EVrwbxI65MgAcqyqUnwfXH68gUXgn4wDo++7eZVickDWs99fYf2uoCUP6t++YsgY0V9JGyDf9COBk3wjdR8+LRVBZQ7hB5z+PqanDOHe3pZ+V4mPWWjSpPJCxiY5D4DDj/N5pPBgwE7Hx6cf+v5B49pNFdKcDm19s2kl6Jyh5oG6j2uEhSULXbQHuePGJ8AZs59FqGeUQwHYW67IE36TCze9RzOztez/Ocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEFWqOVqUPH0uPHGTt97DtrZ7Hg0Z/XjInfBc+a0biQ=;
 b=W/xMWbWWv0+afkgIaQgC4TU5N9B4bAc5aw9jijL/B0pnceakPj+kQUI/Fo1lnrvpLI4K1N8uTithPBO+aDBKZrmxaZMoX1/3cp/NN+7RYXR/3HkfF73kVkmeIJK7xY9/MoqyE5JUm13yV1p84JAd6N4ap2Xp/hq1xdXtu9y4NWx/aXC3Y9HRLYQ+AgZaYAyMPMXlqrT2xl8+KV6ils6WMgQMKEYIPvAeJ/tUSOcCP/jTy8NnqYp2b/JH3kyc+t8OZ4Q45rEt2BQb8slNlOR3+h1r1XZV4wGPufo4M4uBVxngjDrpvUEOW+6iKj2CSWQBzsSzo+66cqrWTmc5oirifw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEFWqOVqUPH0uPHGTt97DtrZ7Hg0Z/XjInfBc+a0biQ=;
 b=bbRdIpzQTur6tE6WdBLwr9cu7Kd6zDfPTIIblRclSo4cpBNEdIUX64SiJ6+qV44gIF6eUv4OcfPDBBYnqTwyJgUT6GCFi+t6bymROQAJQpKtCkVVHMgG1RWSQo/cWfiDsplMAw07jjhdYmskgApIxCefEcDj8X2kbTz9TuCXcIp6Y8z5kI1nQVhUokJ4CTxElDMgc9m+1cVWjeqdhqXlvBQxFuLiQI2LH1JW+QT+RspE72MiZ29JFiq7AiBWvJU6UEw9dLHUsaIjl+rSGLnQGR9/qARtqk5m1lL+xVbMUGjkOImfGKH2RgP/HTEq1n5IQHJy7IAnPUhL3vcvtzG2iQ==
Received: from DU2PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:10:3b::21)
 by DB8PR10MB3751.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:161::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Fri, 6 Nov 2026
 16:16:34 +0000
Received: from MAD0EPF000008B4.eurprd04.prod.outlook.com
 (2603:10a6:10:3b:cafe::8f) by DU2PR04CA0016.outlook.office365.com
 (2603:10a6:10:3b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:16:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008B4.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:16:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:17:04 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:16:33 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 17:16:32 +0100
Subject: [PATCH v4 2/8] dt-bindings: stm32: add kernel clocks for ETR and
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
Message-ID: <20261106-ups_mp25_clk_update-v4-2-9e32b817c38d@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793981792; l=1203;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=xQI1FA3IDu5N0xkbp4Z1vV2Sf7/6woM3b3ah21Sw1QE=;
 b=qJF71oMxWAkclLZ/yPoyEzePSK50ZqNESr7qmbLhp7Pq6PdnRcgRLYn765aXFFjksQBhkzOMT
 dG3JcuAEd+iDk+mg6ZicGq0pndil1/Yg3z4xqI7D6sC47MQpzh0F8OC
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B4:EE_|DB8PR10MB3751:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f2e3abb-be72-44d6-5268-08df3c21537a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|7416014|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	5lcnxKGhOyMwNLe9QELwyEPBMCriNoLVWr8hFm6EcHSMbHK+rHZRqhYTEu+T8HB/2L63HzIOMkycnRwtbQWb7T7a9iqLE7NpmGSLtd7ajLOSUFnd8ly8v7CyeijW+HYlESOjMMMAk2SbaO//lTH27a99FUmyjySflQeRXKSK0B8wGnknwVayz3pcMUgw/XyhJODM6WJjcKE2zZ+qHY8lSThNYwTPsoEzmGDtbR20M7uARyhT1SEPGieDCT+hexk2oIwppiGz0zb85C/gg2wAOhR5AgYMc2ggJ1Zd0JMd+tizIyD9/ROf2RIo1JMQ0czByXv5Cx58jnBwcDQYmTvuTHYeDF3fmyyl4g7gyimPKZc9Gq6n/urKBOoTTiWVYh9Hr+YrjeEhPkOHbHsbzbJTVlbD5hxubS6HsivsdIx8lX6YY6yeuJouhufU7brU5gt60CsOoP/g4bhQFnIpkN1FJ8G8YlHDJIIlr4hJpCUPyGAykYjU4Bm/3jBr2hJaAx5+L2MlmQ6xkvBnq8PfGydfuku+VayzrZlGeKBW67Gp0SzjJoiB9X8+wO/a7xG5eXirSlhuOjzYeeGoIxLLzmz7YS0d77lwe5N29w3ZecgE3JE6e/NgsmrZFy+Ne4kDWAvWY898xmiLPvuK0F9uc6zktCYCrN0+k0pcl+qut/9jGbTvtMZbyj5aoz0dTiZ7Zo9DOvmKrAgf/rRKdVxUhgVkpQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(7416014)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	37E+6DkrBEqunKGPvkLGAN86vRtGxecfuDbEJKLvewk1wKsF9hcq89EzJ5DP+Jl7V+LGF58tQ9e6/bupqd4ltGQK9N+iLofnzfEi4Jx6DA05gPo4PJW4gFtIIk1LMUQGb2xUgljOAsVLutCJmjAauqdVpnODtOMvFmnfJfSL1ulFQNZAaQKrGH3nVUTT/C2Qjw0fITyIeM/oZhkynqpBE+3HiX7o/7cdmt0fmBNm1MFEJ0PlcGej2rSZx2wRHiePGp6XK7JZbqWDAgtAOvyxaGzBoVNDmbFN/PQPU2EPmOmfxrZGuaVufKH3T0vefEAdJRwtd9eWI/2FA157vkHHN++6WW/UIP5IESyoIpRNTk42OHgJs9jwQJmq/D77t3BqKoJN/TJ30zzJFDyuJ9MiXAADelnk5UGo/dwKPhyiGC0edtcDoDcT+RNyX4SMFnwj
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:16:34.0916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2e3abb-be72-44d6-5268-08df3c21537a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B4.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3751

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

