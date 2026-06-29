Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023114.outbound.protection.outlook.com [40.107.44.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86CE3FAE0A;
	Mon, 29 Jun 2026 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724509; cv=fail; b=fWxJFkZfKzIBN/MCO7pVGkRTnzn1UK9E9CwPZ4ZCcmARYZuMGhQkk/RBTEwQHTFJQn1fCCF59Ke0f9/vrLjkkdXLU9lJN87bymcdU5qYGbM40RGnMZX7ihTjLrJ1sPDuzuhl3s8VGEfsVYWAUZn8DOY1qbj29AshPmzHvHitcY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724509; c=relaxed/simple;
	bh=PX0dmIiy0Dw+VZf9uNau20dSHNglMDpYtCrHDUUQYJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dtgZWW4hvkZuWj60QoaFF/OdGg9qaQwMa7Fd6DV3J1Un9J2zVJYm681Wgqd0EsHsWRilRWWgegf96TrFfYhEnKCGtDtGnyrPI0LGdh+/tF5ocpQD5b2ygpOlMdIcTn1hs2QikCVvW0NHBte4XrOEYv2BW+K42276f7gjjF/gKwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Botpv2hGaYFbTBwbJ+dZDJu3UaH/0KemWSe2YH7eYaJdhzxR7DRseJQhzL/N0Zfn6gOp7VR72d1as35o3eOcmcgzCbCiDajtufqCO5QmYe428mRQVu8sC2+Lks2KX5CkaHEWt6X55FRr7PCQsnfbSAkNk2HMOcFmiPjNmlWVqHiiWX4tfUjFZtcl3O5p7QE2Oo3Z65EP6CUX8eTOYKOoE6aYYVL1P/WA8q2QEknqkC5nxkECxEcUBkOEP23mG4XVxjEfB5cBZlXmfgAh6yNPV6sM+GA/b90fE/Dj6kBx2qhse0igy6cWCwmaxHIHTtlJNqnjRUAxcRKNhoIxVdDMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVP/cX8K+IizM7MHHIWGgxoxHAqmXb0N3FutYFrisSU=;
 b=nmCDqq6FJFjDUVvNsGI2LmSIxhaCVY15Ur5GPTdE9PpOxT2UmiHv0erSJlWk0q9Ce3z1TwO9Si8rbjss4aH3mZ2AkDFOuSxUCbcWDMdKwuPuGG8iI7D/HhA5pkXr561TRKtTSCAMb/PH7tZPQ3baaW2XNy8rRBHB3nZTvEYa4jA23ecLIg1DKRXw+VfxlQIhpTH41T92x8QVrW8o3eobRMSOFB+8ymPUPeO4ZNKm6zaxdcLNWF8KJYM4RblNWfAiyAIYHGHAMaqicgVNrnHp3AWCHrKpa9xNRDXa2KxHWtyi8aJcdA1jiILFaUnIp7fjgVansFzJV9fsTP2g64tHWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) by SEZPR06MB6530.apcprd06.prod.outlook.com
 (2603:1096:101:182::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 09:15:05 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:4:192:cafe::26) by SI2PR01CA0021.outlook.office365.com
 (2603:1096:4:192::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 09:15:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 09:15:04 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BD2554092102;
	Mon, 29 Jun 2026 17:15:03 +0800 (CST)
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
Subject: [PATCH v7 4/4] arm64: dts: cix: sky1: add audss cru
Date: Mon, 29 Jun 2026 17:15:00 +0800
Message-ID: <20260629091500.52540-5-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260629091500.52540-1-joakim.zhang@cixtech.com>
References: <20260629091500.52540-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|SEZPR06MB6530:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fcc41a02-725e-412e-5682-08ded5bee81c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iH4xm1jeRolX6NPqImx8U+NTGzZ4qr97BA9kGIfivVXLWwJTCx186dORYMKGcNyN+cM2ssDmRDjCTwnqRKZK1uh1+1Efz8PDr9STJIHYgzKYz9gUkBUr9jsPjeqpwF6qXXuDnEiySIPcScnu3t0FupZ0n6cR0FBswm2OR+pbTOvFCT2fMkHJM8lJaV/r1BsqFcLzUxS1qHcDO9Tf0e0WVs+G4lUIEYVb6f+Pd2ndC2r4f9M1eqlE6G/AnIykJmcqbkGK57idNC1RimkrCiBi3HCz1Pon2J4JRApe+DG74iRP+oYZIwM2sXeKJ99uV8K361qj7PzTl6pTugaXiND6D7uXTcllsamMEPgbwA3lXFaVDzr195ur54xke0JqRxFfjjf3//kRGmJK8Q3qyA+mqJ0lNy/QK0b6Fav08oTlEu7wlju1bptZug3CU1YxmgHcBfpZ5/EuEuTOruxeIGvTmbkWTB1s3FYQksH79fflbRii1IeQV9Ts7PNp5bNPoT/UuR+xmciw//Zxp9AS2ir0IaxYDSL7xEp4/KXwPLiCWs0uPsF/mpXD6ghbT0oyVVSqa+pqnQsEWhrMbDFmTmeOHRFSucsd3Bop3sYYiCkih1h7sovzKZDIZByzPFuYJ4uRiEKuvViSan2Y7aIa8/yipBWrbK6iMHg3eBH+LClk9zVz33vO1yYTjAwN5j5zFcDOanJmkdMDMwzvqHVLxFxrkg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WCbrsjObyD9zdm3TbUOw2nWUNgKlD2VqGCqf9fsCvm8EjCJEAKfYjMIlt9htuKN9QqCCCVxVX3s3aSARO/Ee57JHonqtFpHpVOFUfXb6vZ5CiszKT6tmGDJETJFWjMmklQ50/FUuotw0km/RxtBfbi3HOdTcGF3UqJ26gtZ6IjkVGa3H5T6kHoXhxN5uVp2NrsK0y8WkaTZ7sg/xfzA/fZPD6K2GQ8n5XNqc7GRbWlLC/lqgqAtzlte0LwoPKr1kHdnGLdW3OHJBnG9VEo4Ic7JZ9TQw/4a812i7//w9sHxf4qyEco6aWKZCWtMed7tjDW55G5OPV7uIk6+a6vDtvLguTmYu2gFLEXjmNvHFcKApXP2xRnmE+O1fEksmepRicukEN/rUw+2F5UJ6shE7BFP4q1QKnGUMlwf8PdoUGVb3/lEkBlnpWltR+hrBXZPM
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:15:04.6214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc41a02-725e-412e-5682-08ded5bee81c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6530

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

