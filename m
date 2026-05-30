Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023098.outbound.protection.outlook.com [52.101.127.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AAC318ED6;
	Sat, 30 May 2026 02:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780107416; cv=fail; b=u91eAp0v93ht+yBGETdcq6lja2Gl7lGzkEqOliH49ZQCvM8jINxPcRPN+J4ONBjwDRM0VqoySE4qKx5FFCs9darlvOZvh5wGnY6JIE5lHLpGwjYBS+GrreSOkCEco0qD+LpSYvW2xPF4p5yExcgsRR1tfXFoDd0T9OkOWM/DSb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780107416; c=relaxed/simple;
	bh=xRnQLWAhRWlnGQDgYs8vEsrKYvPiNghQQ95Snmbv5TU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PFXYg7PSbLBHEp8EGASWwIO3YQBGxoMoFq1TP5Pm0K8CJ2qURuHw9QjaeXZ5vqDl35tSnnqKZQahASVR9W3Fr/knc3xnbyfGYEwkxGadBat7MvMrYRnNuKK+7BuR4CO38q7CkaJqXOZiIPh8dKDn0NUFqmjsQrr914R25kLLaCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bX5yc+86Iy3Sdml9WXs3MuBqcZBiLZat6E4rzwXw2omT9C+kL4Ml8axTHzL7iPMyFsOb09S4eZa44RyGGIlst59eoplCmHMJwqIrOVUcPweqwXCpP+gUB/uvFxf3GRvLTviuS/Yy2ujQ/hvtPkiuVeHbiVbmOWNvAHYQI6M+QsUhqsTeE8oRiDJmBjhcU/r8Opx/mSopf5nIlD7PUJ4dD49ZgMYN0F73kDOPY5Cy9rmNvlyJRALa/mN+ClhiJjQz5FDE4Qzo2zj/Jg6NBYtLyll+CVmhy1a2TD49au9BtSkoivFWDlsCE2bZXb+4GXT1rtfKp3i59cSnToHvDckfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmL1MdkzS2XPW8XZsXxACcQIlBKzKNRpQv5XJBr0yDg=;
 b=ZyBz9K14W41duuzTfIWSDgBksQeSIQJr99ii0sCk/Dpip8ycsao8iodKB+XZI75DCMnb1j52RY3xOnLH6girVJ++qSiF8bCySJu2sF2G/9K/zEvcxd581rKBt11VVS4Cwdzll/uKo7A8P3b954T1XCOfdr7pyYXxV8RQ0fzt+fyepn8EpSYFMPK6BrUwGzFDF3ygHI230DbWG5OGrhNW5cVJ5x2lgopeWfIJIV8iQqiBW9i9Wd42NNVYD2cbQiUmbwcNtlnYAeteVDY84tkqfRxihEz2biym8WZBQ/AkE8pSd06VcuvHpvVPWcuqGQLTn+pIg1FRaOoHv5tjctNOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0042.apcprd02.prod.outlook.com (2603:1096:4:196::19)
 by SE2PPF444A52B44.apcprd06.prod.outlook.com (2603:1096:108:1::7ce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Sat, 30 May
 2026 02:16:51 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:196:cafe::90) by SI2PR02CA0042.outlook.office365.com
 (2603:1096:4:196::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.15 via Frontend Transport; Sat, 30
 May 2026 02:16:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Sat, 30 May 2026 02:16:50 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D3F69408426F;
	Sat, 30 May 2026 10:16:47 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v1 7/7] arm64: dts: cix: sky1: add audss device nodes
Date: Sat, 30 May 2026 10:16:42 +0800
Message-ID: <20260530021642.64059-8-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530021642.64059-1-joakim.zhang@cixtech.com>
References: <20260530021642.64059-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|SE2PPF444A52B44:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 89808b83-1ea4-45df-952d-08debdf182c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	1xKSfXvRJRczMc9d9DnpJ1Z6fgga2zlzBsr2ygDUPo/pPJZwWZSu/tJEAlzEfBzeD1Uwri7a/IBELG+2RyKwziGLNe9F6IwbrDvjdJaVDp7SIHAt8Qlb4nCoxPVcKRZT1NPUJIS63nUJyqzxUbxp4dmyvVaLixwfqsZ1I1s0u5yyKrwIgNDDHs65Xcso0o1wOyJXzSsNKoNB7h3uQEg3zhq5aOnqhZtpMa1MTP3HNBkLHGjJesS1WZ89bSIipyhKR4dRtPXjGKBXF74oQCaStn0yKTIhX22ocijnfrCYN+5s1z5qyYS1nlwDLy2ddTyD7ns2lBsEfl68X6o2PAAD5ZFKTR+Wdhn5pi6yoELOPYQGmVWmFYChXcimAXWV2RBkItlYZVuQoYUCw2BZEwzV57yg0eKIZArF1UQcAIpjZWFie6xPqba1At1z3NksvTbSa9Y/Cqd1v3AlTjg1P6wbOA/tB8oV6LRgc2cRn1zniMX2rXxUIAcdMIu+kIcep+fMiGIp1SBddLzM0mpX87fwnjUmd0nePzautdRaVDzQzGzZUc8oHZ2uGnRqPmcYJWmmdqRpk49yRGGhj3vCwud7yQdHwy1G3f6wedPfHn8qWXH43Cqj2bN7u8UcOi6pc+8+fhopaU6pwA1zcrUW7lsYM8k/6UBNVAz11Hlu7ozMgrohra91+r8oleJJqHlaLMPsiKXoXPKzV3sM65AviyI6cim8ueE1BRwd1IKLXyQ3eIQ=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1WXvnExA8OiEg5sZmwnA3o6xWXm9dUHlkhiSNjK6yTGwcxQHA+5zy5DRnbCoNVLJEn8tbPnWtzEqGPNyl/OmsDiSbB51C6atJw/WFGZAMnn5hJf1cTlPbAtBvrBRjsBRbnAhXeFtAgl61a7S5JeaHMIsNHBvkxCAG8VLM5K7iYAHIGKOkm1EryLoeqVyTVFVrH0MSRZzWrObfnAJDd3cqmMkPYcnVjlwg7g9b56JozO4sZd0RRnBXznfDqsGskp+GJRJBmvrjr3BvpU/bOM2CHKv/lpyksHcBT5waNJVfHojzyPhHP4/gYighS4krsqSRs8VJIBqPoJn5DKxcqu95MfGr16hntR66pdR4qAe7ZWqyHArWzFeOZ6FREnZq3a21cyjSh7l7nIHMunu/0bQb3JLDYc9TETV5VFXNP31m2C9aQrG+lgQHe8qus3Kmqea
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 02:16:50.7978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89808b83-1ea4-45df-952d-08debdf182c7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF444A52B44

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add audss support for cix sky1 platform, including
clock, reset and hda controllers.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 34 ++++++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 56 +++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index e39c87774c12..1700ecbfa1ce 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -66,6 +66,20 @@ pins {
 			drive-strength = <8>;
 		};
 	};
+
+	pinctrl_audss_hda: hda-cfg {
+		pins {
+			pinmux = <CIX_PAD_HDA_BITCLK_FUNC_HDA_BITCLK>,
+			       <CIX_PAD_HDA_RST_L_FUNC_HDA_RST_L>,
+			       <CIX_PAD_HDA_SDIN0_FUNC_HDA_SDIN0>,
+			       <CIX_PAD_HDA_SDOUT0_FUNC_HDA_SDOUT0>,
+			       <CIX_PAD_HDA_SYNC_FUNC_HDA_SYNC>,
+			       <CIX_PAD_HDA_SDIN1_FUNC_HDA_SDIN1>,
+			       <CIX_PAD_HDA_SDOUT1_FUNC_HDA_SDOUT1>;
+			bias-pull-down;
+			drive-strength = <20>;
+		};
+	};
 };
 
 &iomuxc_s5 {
@@ -82,6 +96,26 @@ pins {
 	};
 };
 
+&audss_cru {
+	status = "okay";
+};
+
+&audss_clk {
+	status = "okay";
+};
+
+&audss_rst {
+	status = "okay";
+};
+
+&audss_ipb_hda {
+	model = "Radxa Orion O6 HDA";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_audss_hda>;
+	memory-region = <&audio_alsa_hda>;
+	status = "okay";
+};
+
 &pcie_x8_rc {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index bb5cfb1f2113..fe096ab95f3b 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -6,6 +6,10 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/cix,sky1.h>
+#include <dt-bindings/clock/sky1-audss.h>
+#include <dt-bindings/reset/cix,sky1-system-control.h>
+#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+#include <dt-bindings/reset/sky1-reset-audss.h>
 #include "sky1-power.h"
 
 / {
@@ -155,6 +159,18 @@ core11 {
 		};
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		audio_alsa_hda: audio_alsa_hda@d0c00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0xd0c00000 0x0 0x200000>;
+			no-map;
+		};
+	};
+
 	firmware {
 		ap_to_pm_scmi: scmi {
 			compatible = "arm,scmi";
@@ -488,6 +504,46 @@ mbox_pm2ap: mailbox@65a0080 {
 			cix,mbox-dir = "rx";
 		};
 
+		audss_ipb_hda: hda@70c0000 {
+			compatible = "cix,sky1-ipbloq-hda";
+			reg = <0x0 0x070c0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&audss_clk CLK_HDA_SYS>,
+				 <&audss_clk CLK_HDA_HDA>;
+			clock-names = "ipg", "per";
+			resets = <&audss_rst AUDSS_HDA_SW_RST_N>;
+			status = "disabled";
+		};
+
+		audss_cru: system-controller@7110000 {
+			compatible = "cix,sky1-audss-cru", "simple-mfd", "syscon";
+			reg = <0x0 0x07110000 0x0 0x10000>;
+			status = "disabled";
+
+			audss_clk: clock-controller {
+				compatible = "cix,sky1-audss-clock";
+				power-domains = <&smc_devpd SKY1_PD_AUDIO>;
+				resets = <&s5_syscon SKY1_AUDIO_HIFI5_NOC_RESET_N>;
+				clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK1>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK2>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK3>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK4>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK5>;
+				clock-names = "audio_clk0", "audio_clk1",
+					      "audio_clk2", "audio_clk3",
+					      "audio_clk4", "audio_clk5";
+				#clock-cells = <1>;
+				status = "disabled";
+			};
+
+			audss_rst: reset-controller {
+				compatible = "cix,sky1-audss-reset";
+				#reset-cells = <1>;
+				status = "disabled";
+			};
+		};
+
 		mbox_sfh2ap: mailbox@8090000 {
 			compatible = "cix,sky1-mbox";
 			reg = <0x0 0x08090000 0x0 0x10000>;
-- 
2.50.1

