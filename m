Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022132.outbound.protection.outlook.com [40.107.75.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B01921D3F5;
	Mon, 20 Jul 2026 05:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784524518; cv=fail; b=TjeCCUnJDdG3MjIn45WnxbRrRcDqKa1IZjOyTfkK/hPEmRXv5oLi7BrSNxTck0fB2Y33fj/NEHtPslXlV6a+Qeg4cjgltG7eX3ktyqH94vfApL4C4jM0J559nKVrSS60nAWwWntQJcj1E2oTRCwCdWGEdwcqEN0ay3PtB+EffR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784524518; c=relaxed/simple;
	bh=xD0ZsKAtcdrW+NDEksvW2lhRj4aGyX0yiBd6AinJ+98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pXVcEpfNAHStjC0n3GzGmR8uzMMvOZafIx/jqKUeRTpU5/NGIJCPgR/eCij6GDW22V1Rr7+Lu6G41fbEnZMqJYxFtpdvwpFe8RF1mNCt9HunmzC20VfPzr1O5+Gt2sHCycyEN4Jdd52hVLqlrzij1vN5jCpiPzU1rBZh3TC2+iM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dinU9NRO2EB+hdPOGJ9lRKuxQkd8U7wQqoAo+jy6i8rcsws9rgSZkfRqfvZor178w0BUL2S6dKPmu1u8JFUttqlr0jp91+7+carOFfptJbHRemnteb0uhHzAa4sS8VrvSNfPlxrQC2eK/Kud+SpjSPGhZw8XUMsXkQwGD6m2bLSdsvncWG1BpbKdx1BSmpA4INHA8i/bliGZfx/8vC1NhjER0sCusd++/fwwTbH+kqkPX4yDj4WzTRJNeZj6M3Q0xZjMmpfG9sS4bU6iKhoTtI3FwqvdHiNbjd7gcDEEKkaYl7aNWd5qHdRBNyEzeFknxAFfWD7hYYI0BWPuaO1UuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1Mz4rOABbuY4F1mkmNiJrsvm1/Qoz10s+UYuQectBE=;
 b=FR5rGO9isyXYhkCgsE+fSSnTQ+9Nt/hdhPGi2+Bl4VNX+dAPamye9mj+kGQHE0RK3szOoNw4iyz6jGvoiW9oNlTMorMSZeLSsJJAupca+QZBdONYlYpBSd9F0RozjInsVbesCyS2C/t9CnkpZkMcJPSk+NEH0MIxcCcMPaHy21NLp9oGW4Y0ZtyJpqf7+HTY3GnZQAblIuvLXg6Ps+kqku4bCDneu9Q9qHGglpLmtJVSLDHRQe3vyknBbJFrkbWFo23DdMZ5wZJ+YBExl5VNZqmiEZE+Lea5SbCn84BglXjROM0TS8v12QaxBoBzANX+N48NH5H6UjYA44gYP2rb3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SGAP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::27) by
 TYPPR06MB8278.apcprd06.prod.outlook.com (2603:1096:405:395::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 05:15:12 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:4:b6:cafe::a3) by SGAP274CA0015.outlook.office365.com
 (2603:1096:4:b6::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Mon,
 20 Jul 2026 05:15:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Mon, 20 Jul 2026 05:15:11 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6080F40920E3;
	Mon, 20 Jul 2026 13:15:09 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v10 4/4] arm64: dts: cix: sky1: add audss cru
Date: Mon, 20 Jul 2026 13:15:05 +0800
Message-ID: <20260720051505.1252774-5-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260720051505.1252774-1-joakim.zhang@cixtech.com>
References: <20260720051505.1252774-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|TYPPR06MB8278:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ab18688c-8291-4b94-1166-08dee61ddf97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|23010399003|1800799024|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	xxp/PHuRD+yhTLGrXSQZsonGmSw8iGbzF/FTUGXNnJr4tcvoXYoVEpQwIu6E2mw1dfTXaSiuo67b64rDjqkRaXGJ1/sDZQ/BVNQrnSqjlaeoFk9TNZbJWR1Kf+tD7h3moJ3tOgSH8cM2pnCoGU3O+BDYFNNW22xoNRV20ci5MkuEmzw4b8t1h50je21bRE/1+7r3LfhKBM+a+U/tHMP5n57+JP4hgyTdfleqMIjIheaZtf3DJYsU6A8dX1I4BvXjymO8tYx7NEzR7Q8K69uDZMehtulip6xDDpy/Xep4mOpJOWdK5PNaBgiMfUG5f5QijzYqZIWABXR+zQ7FBk881dbQ75XfCkH8yrUQp7yNJ7Ywgrl6WbDNkB0Vz8dEOsNclBWhg+jHjatTUypoD97L0ti3/hGZ/3LUWZOiov75uMcbIW5XlEcgqiRCH05C2G0V7fdNjM3xPYxRfeP+Jy1gUdEWmpE2GMxiRMWMvc6hgpCQPfmCfsj91WX1+c08mXI7Cqc+2oRMc4G6pEX27cQfqx6LH/rTQmLMEk5B8CwFPBVhFAcHnczXx7XbJR2WTW+V1b1V0ndZJusrCX18vUk5eyAaLObakVbNpeH08XgPVYotBIqnSJXpndyii9HDEPIh0k1GuLvrog1BpqIU0Gk717ynTBiFUVsVD3ymVB3aTDZz1+aD/i3JDgWnYjeTsxVCK6UKJflg0ev2yncHNAH1lw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VQ2Fq5KPUE+TqZbeeooOyXaEkhNeN/t5LHt4TkjsOw45ORmcE74WlCV1R6GfT5MToP3OnSXPQvQ2dWE65a11Wq2v+tjgEw5LgKbx1QQj4hSWTckOUPjQZLjZtFnSUSt8J1mSW+SS6FxJ3KGFUje11YLGdFoua//5QP9Ci35pWLTMwfm5RZtdfAuz9gWRIPeCCOC2WXUdk2f5gIwnIVbG4SYuPQEK+QJYvSUqzdPjMKNyEmySuOcPmcqxVt7AqlYqnc7f/rQhlzhCsmEo0WGEmar+nN4Q3gKj5uq7q3qnMACLTm4UtQx3Le9SN2pu8Q1AFnA2gB+j26GTBQWTYxUaQ2K+J+pkwi2eHQ2xJw9KHwaPnLV6uS8r3pQXOwKpLiLneGRTt6G4zxdpGALyYlm/GfIAmJCgnN236DTcAqmvhZENUVFpQK3jtqJ9y2VWDYZ4
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 05:15:11.0195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab18688c-8291-4b94-1166-08dee61ddf97
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8278

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add the AUDSS CRU device node providing clocks and software resets
for audio subsystem peripherals.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index a77c52296ebd..9b2d969f6bfe 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -6,6 +6,10 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/cix,sky1.h>
+#include <dt-bindings/clock/cix,sky1-audss-cru.h>
+#include <dt-bindings/reset/cix,sky1-system-control.h>
+#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+#include <dt-bindings/reset/cix,sky1-audss-cru.h>
 #include "sky1-power.h"
 
 / {
@@ -558,6 +562,20 @@ mbox_pm2ap: mailbox@65a0080 {
 			cix,mbox-dir = "rx";
 		};
 
+		audss_cru: clock-controller@7110000 {
+			compatible = "cix,sky1-audss-cru";
+			reg = <0x0 0x07110000 0x0 0x10000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>,
+				 <&scmi_clk CLK_TREE_AUDIO_CLK2>,
+				 <&scmi_clk CLK_TREE_AUDIO_CLK4>,
+				 <&scmi_clk CLK_TREE_AUDIO_CLK5>;
+			clock-names = "x8k", "x11k", "sys", "48m";
+			power-domains = <&smc_devpd SKY1_PD_AUDIO>;
+			resets = <&s5_syscon SKY1_AUDIO_HIFI5_NOC_RESET_N>;
+		};
+
 		mbox_sfh2ap: mailbox@8090000 {
 			compatible = "cix,sky1-mbox";
 			reg = <0x0 0x08090000 0x0 0x10000>;
-- 
2.50.1

