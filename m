Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023098.outbound.protection.outlook.com [40.107.44.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293DF3B777F;
	Wed, 17 Jun 2026 06:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781678473; cv=fail; b=FexYbsroOoPBWESoK8fQm88LdzTGQk/0ruIQYicj0AfvK8LYJJlti6auDlh0yMuolLBCGwp64DUP51cylKjxcllvRLPybqdfmisiQbK/LKPMIKpVjtcmDgCs7xYj9mHAXRUWfNUemBEU5d7D92i2tULtWdokYMj11s+CHWHieY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781678473; c=relaxed/simple;
	bh=XY8OmKS5RMP/eLdALeKP5k5qw3m1MHBv99xOUrCTuRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O73IZfdIs/lcFq3kn4FB1kZkVRKTiIG8Xa4+UwhIWCABfMB4I8A5t7OR8tWDe5wsapm6VJArPHCuBdq+283fHG74kUTth3Ef9XAAdS1LvF3l5BLqG3e9+PCb2CZHCd2l7dyV6mmol6v+7YE+rlDFGSn4VqS9Va0y0JT5lxdJaho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ims14/NRoXQVxbhDsRR1JSY40KpKdPlwfkmWEXcv26EuaqqkqNM31ikLE/mqKC+tgdK8trw/yJ8Ou1g6zVeJJS4ol3d7GczIDI+0hyRJ5VrK/wSmnxxQ+ip/q10sl0q9812Wr8kuhZgQsGx80aRmnHD8RyLQBMrQv1fOkZQMLVLGozBP7XPOotXxQcrYlx+gsQubVjGD7+0/ILzxD/FHPJCBwU3V33Icylqn/tGzeZXfEqOVD7G0jDvxwfjL4Tz7eDzQTOmSkliPw2Go7gGSiNk7P5ySUFpKoC+7lZqfLfzJL2YXyEQuXSzkxPU5K27kPddvhwW2192LOJdzN1r+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2acalGdjXOFuxzk/aAGrwUTAkAlinpXJgrCw5xAZqA8=;
 b=a/A6m6UvqrRUp/A3N1A/lJy6YPUvLGkfH8EMaZX4t1nyKga1GC7mB5fxXrxuVVszeSvh8SiHdZ0FqqEFrWCX4hqCy1zIO53tCSJqZPTuxoHI17axxmTW78DpQyjizBghA2qVEYek7AO0BaKyLfLD80xg8MdGBoZJudvynGR7bpKNBOozsglO7eYFoAiDsTvbat63KAeo9j5f8Q0SG76BVy310eJFrg5k+4oqvHHYoXA+hu8TzGXaHrzvGffogkN/0h95K6nl4c3lmQmrFIRv8pn2Iua6+hae6n2Wf75+IlJIVIxqgMS2KbTKXqXyYm3dC6m6IxhtRb/vVU9dUwL8IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0014.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16f::15)
 by TYPPR06MB8033.apcprd06.prod.outlook.com (2603:1096:405:316::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 06:41:07 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:301:16f:cafe::a8) by PUVP216CA0014.outlook.office365.com
 (2603:1096:301:16f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 06:41:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 06:41:07 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1637B41D400E;
	Wed, 17 Jun 2026 14:41:04 +0800 (CST)
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
Subject: [PATCH v4 resend 5/5] arm64: dts: cix: sky1: add audss system control
Date: Wed, 17 Jun 2026 14:41:00 +0800
Message-ID: <20260617064100.1504617-6-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260617064100.1504617-1-joakim.zhang@cixtech.com>
References: <20260617064100.1504617-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|TYPPR06MB8033:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a55f9224-9b7a-49a7-bbb7-08decc3b6930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|7416014|82310400026|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	d2Rlb+WQhjtI6fagtPSG2Cm4OJub1TyK0x9iAx7rGfaQ+hsN5hnrZO9hwVviI7KEF8rhxJivMZanw5q3RD/WtwhCR8rOo7kzC1WTxcjGY6RnZYtlF54aFEFmrFuW7RDyQpiPWxeFNRQdINH7rFMVkkMNSxH65HTd+OhBnM3TaOpSjtvdOmw+C/YseTi1oiU27KHmaql1LR1Ui2rifxVic215IfaEn8eXDx2m7+9pt5H5P3z/KYCSgQ+greNqpUJdVo9BkpbiQ7NuEMPXDGt7N7d5S0Niu76NxdYTuXQq0pD6N5fjVjkIIKRwAhO5Zuf6aAtUnDwTe4CiVcmBcID0eb/w5PvY/cEacdT0j+2FUb6LTTfOAaZ2fJWgoF4UDfj9MmmWHR7ClLTX28dXAe4HSZiTIOb7R5u10YeqARp0ZTvGrwodqnabpuxa4X4sQ4IUSn/lo8KB0jpBl0WZjH3zAmGmZeSwnaal3AvS9n7NuuMs6F6cFwdKlWEpkAOkJ2JGg2/Oirs6SUKQEW4kg8iLd5iYPb7cmseJX9thdOccHV8jaBNzhtLCtc7XgjOtcCRR4bSWm7MrMxNWi8HECmCNNsVxMv4xABBDUyg9fHnlMQghUHCPL9pGtu+Qt0rIiCpa6JVNjXJzuoAu7TCLREdh5jDtNLWteaNWIJvUNJ694hgi6JyeSBTnXQuw+R/2AwR+UzANehn703tT3i5R365qeIgzMTi4WOwyJ6jAtxzWj7A=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(7416014)(82310400026)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hb0xE4ddOjSA8QQ0bZNbETcoZFKakBDX5UYcURuv/a1yJZiBviLZ75SFrcRIYb74h7drEE9VjIXi8b3EHerhltMohCn8sTMgO3ghlsfwfemmuphRevKdyqTDxJpepPNKXdpw7+vUi66Rc5DfLkHhMRbp6HU8fKQXEwfulbLsr7v/0V+aSKcFNivMB1Sv58S6lK0/Cuvw/XnpvBu/DVrZ2WzYj/rqoWm0IwqfUCtor38NesJNdbrH15NtfYd6R/tvxxUAqa80Mpbq/ZvXg6MabjivF4cIsltlM5mawkQ02Z3MWxgvEeo+8q2VEVffKtqJ6E9tqVz9JQCmWvQ9Up0kpojHzkyqpINEicplr/q9hrLXz2mmhnDiS7IYxsiT/py55mvlLK4Lm3q2ObAiZmn4366RGCq9JTimGzCdqFznmNNakhUwYoLDRa4ePolRw9Pi
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:41:07.1069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a55f9224-9b7a-49a7-bbb7-08decc3b6930
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8033

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add audss system control device node, which would provides
clocks and resets for devices in audss domain.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index bb5cfb1f2113..3091789fc176 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -6,6 +6,10 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/cix,sky1.h>
+#include <dt-bindings/clock/cix,sky1-audss-clock.h>
+#include <dt-bindings/reset/cix,sky1-system-control.h>
+#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+#include <dt-bindings/reset/cix,sky1-audss-system-control.h>
 #include "sky1-power.h"
 
 / {
@@ -488,6 +492,26 @@ mbox_pm2ap: mailbox@65a0080 {
 			cix,mbox-dir = "rx";
 		};
 
+		audss_cru: system-controller@7110000 {
+			compatible = "cix,sky1-audss-system-control", "syscon";
+			reg = <0x0 0x07110000 0x0 0x10000>;
+			power-domains = <&smc_devpd SKY1_PD_AUDIO>;
+			resets = <&s5_syscon SKY1_AUDIO_HIFI5_NOC_RESET_N>;
+			#reset-cells = <1>;
+			status = "okay";
+
+			audss_clk: clock-controller {
+				compatible = "cix,sky1-audss-clock";
+				clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK2>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK4>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK5>;
+				clock-names = "x8k", "x11k", "sys", "48m";
+				#clock-cells = <1>;
+				status = "okay";
+			};
+		};
+
 		mbox_sfh2ap: mailbox@8090000 {
 			compatible = "cix,sky1-mbox";
 			reg = <0x0 0x08090000 0x0 0x10000>;
-- 
2.50.1

