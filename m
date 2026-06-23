Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023085.outbound.protection.outlook.com [52.101.127.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B6E3C584D;
	Tue, 23 Jun 2026 07:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782198497; cv=fail; b=AQtO1JM+1JayyBzbUwakbtWEnZ/G6C94mI2FTo6qkMUTwzfIQxcx5d9XU5KQnBg66dzAdB+C8AUoC+sYve/xj4+DaUg6cChfwwTgKG5mvqp4pjKL5lzvl+ZsqmIR6C7DyJr2hD3Z+VA84X24MCuBKqOFQT/Cqn4+SDh3PaD5pdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782198497; c=relaxed/simple;
	bh=PX0dmIiy0Dw+VZf9uNau20dSHNglMDpYtCrHDUUQYJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o4O/nZP4bRL1Vm7KiCswK1lC4cC9CsazZSwP4FLjzTirTyIe5jv8p3nYk3LvRIbVyb0nkLX8cE89HlEk3PV6mVEi8VE2YeshmKMCHcmNoTC9lNiBnToorCeNS4JkAr2LePg/JKrXvWb0GL5ukQvclhBXL2tLvjdw+D+J2y5SMgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mI4pcBQ4kRz5rW6eGEDQlPTLxh/36sr9hK+2dTKQV/zcB/wxUAmMlzy5fNfu+Oc+ALhpIA/rC8FYE04FAemP4UKFMwyYt3Lr5I7oR4q2LYKKs/rlwMvlb5EWJLVfI7BBTq1pvxWrq9TomIBnl+4LcXsVVNFOGv3YVrOCQgffiUI82FtcBtXUrFlJimVZ0bY2VtZJi4JK2J+NrS+AJeAQfhNyFBeU13gUhyj6IasFxj1BQCGekVrLgO2pXiFdxNi6RZyr+Ytu8hKoXpOjBPFC1/0cLuhEWNO2E15qy7oAD+ClxCeWaIRIx3TYXvWeOQ5CuFNZFeSe9JvROzwt48gztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVP/cX8K+IizM7MHHIWGgxoxHAqmXb0N3FutYFrisSU=;
 b=F5g9itcJkwY2ygpRKHWLYPlq6tqpvLMYJorQK70LBE+W7nVUtr6W+HkNxNEuj2XcSGoSFF1uXzdUM494kCGAd+NCAnutEZs73L0Ndmp4WSE6wznfT6IOY0t/ol8WHC2xxVwGsFtssMVjEqLYjLB1PNB7olUjQgSA1gdp1kPPF9CANy9CO9HNlns8XH3F+Qj/npeZqcLJ5cADTdmGROk36Gc0hEsqqtiUVXs66qeyz9DDEATW1FcLKYrNlKHM9hU9YMXFuV8zAsY/jiTI8jXPQe0JvjOYPK0gJO8zaJvSpIkjsIimR2XSkUdcWZqfLoVZFeN7tn1OOF5T9kwgMSQx6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) by TYUPR06MB6052.apcprd06.prod.outlook.com
 (2603:1096:400:354::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 07:08:11 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:4:192:cafe::8a) by SI2PR01CA0029.outlook.office365.com
 (2603:1096:4:192::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Tue,
 23 Jun 2026 07:08:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 07:08:10 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 95F9540E7F9C;
	Tue, 23 Jun 2026 15:08:08 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v6 4/4] arm64: dts: cix: sky1: add audss cru
Date: Tue, 23 Jun 2026 15:08:05 +0800
Message-ID: <20260623070805.211019-5-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260623070805.211019-1-joakim.zhang@cixtech.com>
References: <20260623070805.211019-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|TYUPR06MB6052:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 007b7fec-eabd-43bf-a341-08ded0f62f22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|7416014|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tjOKooxsYctyzmGcg8ClkOboALl0ywWqIOblc9Fmylxpz0jWoFrlLAMk89MlyRzSsSFwh38sj3dTEHvJEAiA3IN19+yLuXEA07nS77ltP5Mwszy5wIzdOfTo3NBxhmYoWSZVVZbb9CuL537i47es+92rk563bZ/a8gft2jlET8o0u3BgTHieusjKmfAC0uqa+G+lOjJjKyaOwQlWUqv2YiAF4zYu5wSQTDmXkNJ+4jPo7rtnwi2RI6sFaLga9VsTL/Y7Doh1Kid5re8V41HDwCiAEXuMUtlonYaCw8vojGjZg9P8kTrkA1oYdP6yY9i+oFXYT17qX6eqNzV/6S9IBqG+rWIde2CmQnJ4VVxO3xyh6ZV8X5ZzZxuiFD6weVJ1OD6dPAovi3ifCRHKAkJUfu0mXcpNSdzUhhzj9tMANSLRg7el+gChk2FJIV8KbhTrdrZ5NUOGZjjot4YJKhmDgpu3/6rj610FNZRZsd5eb+PAlEjNPAR+PoF3ygiR22AubtSGLqa7qnsHu5BjbursxFjEt6cjIIMz+6TLCMSSeMCu7RBv1MDuxwN8RtAshEeJCq5GHMbfV2cSEAWMs6S50zEx98/a1qJHlmqzDjWx7KOPwxCxzVeVOAunAyScBBHV8zX30gPVjxvfaak4tjm9RHEFvKARu8yrXI6IKxG+T27V4Ntj7bTMIoKzBWhsyZIl+V28VczB04DdD+I/hw0n3Q==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(7416014)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RGCwTk7urezJpf+VefzV0fPsWwAHRTlVoRLI5dAe8ED5ymQgP1CBdgOX8vcPYI1D18VBd7BGihhBIbF1vhOkc1kajj+y1SgGV7Pj1hyZpjHKb9hX3JoQB6tq1kcHb1wF02IZeFhAYiayKmajWvgr25Ne7I/dBsnJXlzoaIWOzq9Q0FI4P8sjDZFPDWW78RRCQcWR20nllFNPD1HklFdZN4OK+kDaja/kqlV/3tlYHj3D7FqRxdvhSQCjcx4BheaRd3ZTPFuOoDmLgozmeIJxa4zbB0T4079i6JmYhvq1uwTx4pvZ+SF5iMenX8nQaFqIVzj3NnFXx6d3coA1Y7R2zUKN7yeyqzhiSUmJfwmle8HVpuhLxnS/ABLgFGL+XgCAwhhAl+XVi9XRHo2SHo4hgJmS/iWeTS2ILMn1z5oW5Hr0hG8IJnPgpVucOrzGBwCR
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 07:08:10.0374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 007b7fec-eabd-43bf-a341-08ded0f62f22
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6052

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add the AUDSS CRU device node providing clocks and software resets
for audio subsystem peripherals.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index bb5cfb1f2113..6d045d7216e6 100644
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
@@ -488,6 +492,20 @@ mbox_pm2ap: mailbox@65a0080 {
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

