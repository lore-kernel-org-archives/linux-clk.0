Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793981803;
	b=aX9XcUldDEeOkgp9rwiZ4Mt8i95NcZg2CBgl9DLZdF/5d3b+raNn3Y8ssi3kkdQJnwiK
	 iP40e+2yBNGuUxC+HrHPZAQ4dA9L/g3b3i6zM2SJz1H6CKFOoYELZpZDZQ193tmMDgvZb
	 AEoeY9mAo7whbL5xAkSkWHS0A4uN1lq/5Ag9OOpp/oDqJcxb6asrBGT/EqyFKzzcM2zv0
	 2inNSAKxOIbGYOVSzYxP8UgQTtgL7nYqajHRahd98ETSq1CRXjM4rPZjc1IfM5d1YWyzh
	 whdWBT6qvAiwY0I0/hoZhIgkfq6/b6g8DQlL7AQXP7DiFBx/RMuCrgxfejkKLKlNy2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981803;
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
	bh=cAFJj8dj4fkxLjDokyHftq68b053Xdzi0Nqa8ddH0EU=;
	b=42KGiRZfThY9RuReHTTPScW+GE335z/06CHf/xKzpkTdhQhzWsGYgVIzEhtbrTda7KOm
	 U9L9E6ceRmVBH9I7p1TA03gNNGMhuTfXWPVWA0Us+lJrzG4K+87T+dHUFsq3CB1xABud3
	 aw1x9FKF//PAhDP5h2njhvSHPaqHlIslDxN3ZX9zwTRbkaFOY++9GgduPSgEB0pwjP/MV
	 bnDMo6JJVdwG6lWs80MqYnROGtFbMYV6noAoDbcO3EdRAtt7PJJS1T1MOqHd2LU2/Q5Uc
	 KbUagrM19eqCoGX8oDh+yaJHk39LBzbe4LRQiFolp79FC6FPpcbQLrMH6eCCXN7NI0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=ckjbKbnJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.27
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFD0606D813;
	Fri,  6 Nov 2026 16:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAFD0606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=ckjbKbnJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwTjoK0QYQs7xp7og32evrp2Hhe41mPJ5nzpm1UXDAohoSN5XqgqTPiTvR+z2eIzc8jNzf91PlmAnv1l3lZ4FOnq/PUph+B9ZFNWbkgtNWbUilILQsix8/i+CebhsbAmNauOpCFCc3ieQOAbhmA7wSLHJXmMunkLq//p1SJCsbLgZvEVGJ/oxvRm/nS52RImmk7DBNxQKE8ob6uIKylDeFcSu+KUMdQSWeiI10xS0JhQAtA5zsASPo7rYcOk9LcbJhy2OZYHRKbUDGaGGO2KzqkaQMBoC0eTeWWEsrdrJaO8WWigKrC0bHP1TkbQb+Z0dxjMC710bdG4ae9f5IyxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAFJj8dj4fkxLjDokyHftq68b053Xdzi0Nqa8ddH0EU=;
 b=JLlkZP99Y56AUNIbIBVPfgrH+YdVku+cYz7BRN4f4jS8VsWy4JrQADxvpd9Jl5XfHi2NE/kkdnm6cftUj/VbdNvIkaxa66b3cyAvqDVL1VPj70fiJQJQNAYdVZ/PZE8/b9AYHiUX2G3EPN1m+jj3WkD1z3FxhXBCann+zzvnDOyPr3rqbO3fQ54UT60wk0zkA8kDKSE6h5+UGUEMRTqZI4xel5CJ+DImjJH0ZAMp9i18M/fdjNoF/vQv1OS3R47Oc3lultlPMZgCrx1/mUv4lpht2F8/aSymBAKou4OXhxZo1IZ4NsBzof2xi2cf2o5Yc6iGJ4+PBKonYJXewVOA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAFJj8dj4fkxLjDokyHftq68b053Xdzi0Nqa8ddH0EU=;
 b=ckjbKbnJ5vnVGJrJF38YAaIb8pCpB5whEh3ACsOynXdAkRpVZUfO3bF+5UFjQwO5NF8hmpxUHFSt58P1esgnWMXqUxK3aFhIjPTUctkqsGUNBYAGV8AN7COKgg2+xJz13tQOrZNUdyDRbYtSnHGcSwC1jwEIq0MyixiCnTifiadQxOtu6KJBTrh/7zYr98keXkpP7uNe/KGbFwW8XOaWffYhDog7KHGPbnvlEHSITnksb9BmW/LlCVbR82P3B8+ZplvVtJT32nG7DMXdRRAMp02CYlfpHlZA3bfdkPn7FIUOQBx8GN/zh3jb8mglOKns4wyT2F4JiE92vvP6sDK06w==
Received: from DU2PR04CA0268.eurprd04.prod.outlook.com (2603:10a6:10:28e::33)
 by GVXPR10MB5888.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Fri, 6 Nov 2026
 16:16:38 +0000
Received: from MAD0EPF000008B0.eurprd04.prod.outlook.com
 (2603:10a6:10:28e:cafe::5e) by DU2PR04CA0268.outlook.office365.com
 (2603:10a6:10:28e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:16:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008B0.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:16:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:17:08 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:16:37 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 17:16:38 +0100
Subject: [PATCH v4 8/8] dt-bindings: stm32: use reference manual names for
 ETR and STM bus clocks
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
Message-ID: <20261106-ups_mp25_clk_update-v4-8-9e32b817c38d@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793981792; l=2111;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=Pl+ebgHzWLJCS7orqKlES0wzOu+BmanxxWyCyk4owPw=;
 b=AfXwNZN/puGRY0PZZHWfsZVssath6AHpeKEtgB/f0WgC/OL5QSfkKWUjkyBzqvpdFBQbiCrK9
 bh6EtpgeU39Az20QWxJh3RH7+IsM59gN6+J/BCAqrsXmHF+HzXyxhyo
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B0:EE_|GVXPR10MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 7222b894-7774-4ebb-32ed-08df3c2155e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|23010399003|10067099003|22082099003|18002099003|56012099006|11063799006|261021121427099003|261021123027099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	oEO4hxw/F/LmObpjme+aPcMoBIKrsQO8lRwgk3M5HXWLiwj8AMS6fJz/C8OGDap4Lq+l8dgRpEJf1tMjEUsEYHRTCSp8JL1t47xV6Gqcz1eCPniP5A2s34vDg7IK8h55/QMksoJmX0D+gx0KBJFbFdqR6C1lIfB6NiKaYx7w6Mc0Wq0as1UDYdHQ4Ue/mn2c6VC/vSAvQezqwk+KFnta7vorxmuAdGd4YgrCxROLiRgLmjyFEco7m6K3fcp9Y/F/HPXa0u1RFl/UXc2zFIpMe97IZ07Cky6AsSLsaxnK6rzjUAMGZcIKubSELmAqt0BOZGM/imeoQ8oXy8qppwCZa9SLS7TXIFN9hkRUVbDdxLYWBbb3n8QdxYz+hTXRSDbOaSNu1FiOyrO51CnhecYCp+X8IZ2aT6GxARKYxLWbAfxd7SoOwhhVWMBLbje937He8HQ397SLA3U5aYFv9seQGn7hGU95JX/AhP+WiZw+ACS3A44sueiqqgynU8vCeKUxTsYQZR6Hta9siqWYn5mrTwtZySXzt6oT1yNnJMVcCUwwPcp9nsw15BhxQe+lAcovoaI7wSClvdofyw1r4WTejToOj2QU8mniRE8hKkzsqnKKs2iUBocCqd3LW2nGLQrZv3+QXdqUNaEWcTSKCa/Us/0dAQ28kAZydJTWR4OLl0c92tMfGNayOmoQH/deIjq1LDt21P6j3R1rl2v9qonpQg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(23010399003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Oi8gU7PJPgdAmjkgz3X1lLhZvaLCoH9CV5oHfyZnELvKptxy4p+zFX7twry6kCwZGh8kdhCJ7Ao9WxYUZrRGoUNTEleOICdd3KOzgHyyG4TI9VBMvXZnKh0A7VlecCNpAuOOatcW05f5oLYtaqPkC8BOWlFegF23ZqMC7gHy8S2EItH8ClRjJYB/jRAbYIhvj0RXiODB98FhjMJg51HmtvNfSpxc6TxWsxyzpBwcvAVj/ZFTwny+Z6UI5/T0ukIVsly7mSa06wYZVjmIUkJ+8EvA2H07fSXdIDOZOjllvd6oWDRMP78REKc1ybBEs1MYFgcXjGiWUXLzyEcVY5OpQvayGFMHgSYXBsDSlWC3EKCeeqMrkFsuYuahX+WVhdxsOJ4hJz1ePjpOy8qSOOd4I+3Fcmn7gzY3NCWYR67439983MymmOKtRTO7c3pUpSkD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:16:38.1451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7222b894-7774-4ebb-32ed-08df3c2155e6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5888

The bus clocks of the STM and of the ETR are identified by CK_BUS_STM500,
CK_SCMI_STM500 and CK_SCMI_ETR. Now that their kernel clocks are
described as CK_KER_STM and CK_KER_ETR, and as the RCC bus clock of the
ETR is already CK_BUS_ETR, these names are confusing. They also differ
from the reference manual and from the STM32MP21 binding, which uses
CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM for the same clocks.

Use CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM, with unchanged
values, and keep the old names as deprecated aliases so that the
existing users are not affected.

No functional change.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 include/dt-bindings/clock/st,stm32mp25-rcc.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
index 166b4fa1ac2e..c05a4995e0cb 100644
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
@@ -481,7 +481,7 @@
 #define CK_SCMI_TIMG2		83
 #define CK_SCMI_BKPSRAM		84
 #define CK_SCMI_BSEC		85
-#define CK_SCMI_ETR		87
+#define CK_SCMI_BUS_ETR		87
 #define CK_SCMI_FMC		88
 #define CK_SCMI_GPIOA		89
 #define CK_SCMI_GPIOB		90
@@ -516,7 +516,7 @@
 #define CK_SCMI_SYSDBG		119
 #define CK_SCMI_SYSATB		120
 #define CK_SCMI_TSDBG		121
-#define CK_SCMI_STM500		122
+#define CK_SCMI_BUS_STM		122
 #define CK_SCMI_KER_STM		123
 #define CK_SCMI_KER_ETR		124
 #define CK_SCMI_HSI_KER_ON	125
@@ -527,4 +527,9 @@
 #define CK_SCMI_LPDMA_AM	130
 #define CK_SCMI_RTC_AM		131
 
+/* Deprecated identifiers, kept for backward compatibility */
+#define CK_BUS_STM500		CK_BUS_STM
+#define CK_SCMI_ETR		CK_SCMI_BUS_ETR
+#define CK_SCMI_STM500		CK_SCMI_BUS_STM
+
 #endif /* _DT_BINDINGS_STM32MP25_CLKS_H_ */

-- 
2.43.0

