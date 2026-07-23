Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023076.outbound.protection.outlook.com [40.107.44.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016413EFFD6;
	Thu, 23 Jul 2026 09:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797703; cv=fail; b=jKuEAIpGQQqejTW1ZvukKlYEKf5shg80xPpcZIfEhhZZeCO+KSpQ50ExuS5escEdLZBDK0ynnx4uHEALI5P2LaOmV/CgjYK5u/cw9S4ra2KQQC+rjwmPeZZkQ71COM1Vqi64b0LlMc9JSdu1kKVe+kP0L8YBMjIUVrHFp6/XeZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797703; c=relaxed/simple;
	bh=xD0ZsKAtcdrW+NDEksvW2lhRj4aGyX0yiBd6AinJ+98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a2jqLR3GSsKOG44nfyK5t6PtZKngqClfNq+rXW7VJbfJn24MzJfGTWom0HJhX6mj/k2rnndsOaQNK6aCuNF+eNgdICIy5RVkaTmfHdMLe1qzs9WJ9LwHjMQYEDlaVZB/g+1cLnVdosO15Do5qglRnvkOdfYoNA4sXGSp+p8x06k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sj4LPKFLz48WxP3opskzgpbB7sPickutwUEcEWKP+0+xiCaDa6k3nUZkRE4J8+54OUH7X62S4Nq9T/vfvHfKvV6a5NLLHwyBE2nB2oWqkN5sHT8b02XMziPiZMYiB3D0CD5oLtXpsZ4l7Xa1BV0DABks3TosB7TqjvxkQtL5J55le8oeLuSZcHB/nM0UwKxyYzsaXik0FJFx6YFanDpDkFE0OdcXWOrL1Veo17YVO65CDFt0q+aUWBNWJ/CkuaTY+eD1tpSc2+rtVSx3OKpgyJgQTtKBF+v9DnqK1njemCRl0LSdSGsPH9huu/Ua1eOoIlqorZCZlc6k5of38aP1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1Mz4rOABbuY4F1mkmNiJrsvm1/Qoz10s+UYuQectBE=;
 b=pjCQJeVOyo45m69Ms5l52KcFDzUSBbhIudT2P81dxKc0b96ZdYjKjBmTTlGnrpfXF8nRQMemGopRCAF94GHUMx0KP4sj5Ghr4bKw6TJQVOVlkABfbaFZ7qC/7pGcCGLD5ZMh1s870gxKlnutZfnh79eMrgkkh5B5E1HqlrYmRAsKKWD8Azc7g+NHz0dlpM4/fzJzcdMzLHcy05ueBu2oVtUNgt8326d0kS7HvkVkjs/fQtYtXFJKg79pTnzgF7j3f5T4HiKy55x3QzZnUZPBMoJ3K0Tc2wghe0n1qxlYrgfPXDsvrhornXpLQclD9h0maIkpMBc0sQCAGreePLlgEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUZP153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::14)
 by KUZPR06MB8239.apcprd06.prod.outlook.com (2603:1096:d10:5a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:08:13 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:301:c2:cafe::a9) by PUZP153CA0018.outlook.office365.com
 (2603:1096:301:c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.6 via Frontend Transport; Thu, 23
 Jul 2026 09:08:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 09:08:12 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id EC81140920E3;
	Thu, 23 Jul 2026 17:08:10 +0800 (CST)
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
Subject: [PATCH v11 4/4] arm64: dts: cix: sky1: add audss cru
Date: Thu, 23 Jul 2026 17:08:08 +0800
Message-ID: <20260723090808.1727598-5-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260723090808.1727598-1-joakim.zhang@cixtech.com>
References: <20260723090808.1727598-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|KUZPR06MB8239:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ed4a3bc8-c147-4ecd-ef18-08dee899ec75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|23010399003|36860700016|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Y954w2JowBmNxGdDdcIvX4PYcJTy2BpFbZdSd5up+VQA6NrzxY3yOefu/X7LrOnuYD7Z/EuUh6FIcwnJCSXz6XMkG2UKkbb+ZthybIX9bV8D6M39OYmtz5qPTaUGngYE2YotyEYIK7+poGayXv8GO/InKMqIgZnU33e3HK/qbdgsjIRYWRVowCMAITI0h7fpXLqgzPtLEgE2SF3a0kklsTyJ9zZlNZQpe4OLyyIxPwTuME5l3CAM77UvINjQOw3bEv+cKpm5lX0IHhFXocdcb11EKBVclkKMVfW1ot9w9wIPA3lLybiGjdBJYfvyCSqfvo5r4PhEc7wnH5/33f0IqfW4a4x1WXjwmvg34aCMsqk5kGrPss/WRn3qlF+MDl7UXMDsCbFvd9JJFvGYffdoulQdEdFiCvBqoGTXt+xwYaQozGDnCA2O22FVebN3fXrHGhbok/OMys4jnXexT2UyUH2WoKvaNvHHi/xJLT7iMp2FP79JeMNSOpO2VhamLxHJmpVSn91JaKnvBsL2++H9YAofeGN8H2czf8kbeisijHRj7VbFohhT+AEJUGr2F3XP9bkBRxF6R84pxt1A/WNHFmoJKFDo3v/gD1iwR6PtQfrAxk9leVq9XoJAb7/FRT/KFKVr+sfAHBUddC60cQHa6N+Xlrw9MpcNCr6FYNdXCh7EF58nFomMxIH7zfrbNiMzKxRKZCdx5H3e8EEZthp2cg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(23010399003)(36860700016)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qsZJ1QfQbM+ZlOI2e1y6Kz+nSmWNXw9xacJ21kQHvQ2EF4ON5pG9zZpNOIVUJ+YFTXfXMEM7jmzsEQI9us89IOBuK7mVJWMl+ieVMudwcg2nFBuQxJn8EnLnl2CG7wgtxihKtMtAKnqmdPaW3mIU7ZbsZlWpiSXmkcfrW9e4krrq7KRj0XACCtylKunKR+QcQLNikIZA04qu4qg8XdOcBLs2pqDlf34T+aVeJzNqASpqelXf+n2Kl69i0WbidGmMHNaWkLIOCuEEAma9ZPJ5bBiibVwD03KSk/NeOlEmrzhXCwOMs+8xdJhvuKHQOX3BzRTh9nIYbgg6eewDdZ1hVpkjJVldfaSKjWY1wCX2HROBCs0gd998bhBxCiFtfVS7Po2OVy0mo0WwyctxAo89ZJ0Moixax+gks43hBKaY7ugIBQYD5v9073PmnNTT0uvQ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:08:12.4212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4a3bc8-c147-4ecd-ef18-08dee899ec75
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8239

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

