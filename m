Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022119.outbound.protection.outlook.com [40.107.75.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D8841168A;
	Tue, 30 Jun 2026 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823466; cv=fail; b=gf0vEJg8raqRfrI0QBZkbZlRBlMbgidqAtHY/+y3XJ5akbO5FcapS78GhfdEo7yXoIdOk/lNgkupp7sfegr0y329LhKpMmB7XdKxO3mrIEByp5bdIKuA7gtK90YbOJPPcY+WBUWYILwyIuuQoOahIQSPxMbHJw5eb/wkkHvNZEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823466; c=relaxed/simple;
	bh=PX0dmIiy0Dw+VZf9uNau20dSHNglMDpYtCrHDUUQYJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LvA6uN0KqRS/dDEmZeBTSVot/xkDbqNk3l3I3nM5s1mAvVWqPFLVOqfveH1MHt5Kg+qFhNmJplUzsUBpSf2zSrrnY+7trCONmIsCPsANYvDybKvvfn54wKPlg6egfRobsLqyiKhqpOTrYRsZpFE7biX0MfXkQp6OKMITDVuqvYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SD/NjTsiBdYsSH8IssYkPaQTnxslrCHCgOr7iy90T+9tZM+GcoFjl9L1GPdzVFgcYbK4Oi/0cgmRlDe8ws8rgKtZ3Lbd6F8Cq2PzIifB9MqTcIUw45CSW2Q9XYsMc+ZKC+tUL8RXDS69uGiPE6tE+UoqHrRoMzgx0m/CdXm1U/I7NiU4z4sks/m4dUbJ+qZXaA+FJEgPByz5lrlmgMqy4UCguiqX29LAOpb43j+lXjx0qGQcy6RXm7zD1+v9YkqiyLpn+57paUsAOBM59I6+MQkI0ZxsjnPXjngCfBd7oC/pGZxs1SGZWVZqt0qOUBukD5xpsHHyekIxDMjKcdsjkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVP/cX8K+IizM7MHHIWGgxoxHAqmXb0N3FutYFrisSU=;
 b=OElyI84SvXVtL7FCjfXThXffIzkh1q81d5QPfDm7SNSuw/Mi4NfV1UPPIpUrE50OPMH4BY+tidNDYW3TXUI7RstTnpwbCSgBExGcBaIipa1+uiAIe9PUhuB8jd0qkk2utAqeveHkhuLZ32rWDny+NoUD88oGNkyNoLwJp70/kjC/0CBXryfDG+4PS51Q2BAesxSlR+LT7E39nf/Raxr2uwJyJjZaPQzLeoJf6+B2OgrwjmYFBP4SJsUVpAlokzGMkI+igQvMUnH+I4NAxt86pg/B37xN9Fcei7Lh3fEeDi5UeVfntKvy4lxVJ/SMeoeVWPMQ/sA1qgA6wOvlGJBuUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP301CA0024.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:381::14)
 by SG2PR06MB5058.apcprd06.prod.outlook.com (2603:1096:4:1c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:44:21 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:400:381:cafe::84) by TYCP301CA0024.outlook.office365.com
 (2603:1096:400:381::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 12:44:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 12:44:20 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1FC9F40920E0;
	Tue, 30 Jun 2026 20:44:17 +0800 (CST)
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
Subject: [PATCH v8 4/4] arm64: dts: cix: sky1: add audss cru
Date: Tue, 30 Jun 2026 20:44:13 +0800
Message-ID: <20260630124413.1814379-5-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260630124413.1814379-1-joakim.zhang@cixtech.com>
References: <20260630124413.1814379-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|SG2PR06MB5058:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dfb484d4-1512-4469-67d9-08ded6a54ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|36860700016|82310400026|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	f4y6AQ++GB4jFNbNiT3RB5/SIOO4RP9RZ7kcYLoi6g137tvvX8/4nHQHc3OsO2aZobMgvk61FQ2Xd4hvROM1Zd+u6DhsIa6NhzujKiSinw8l0BKH9GwkCJ/RODsk1O84yr2DeYSTzS0bHHHU8FapvL8JLjTVeDnVTDnOvnvQjoOXxo1szAoL/LYW4Egx005zARgbUhRLC+DFK243GxqX5H3FH6HrjNOs1lhu1Rb9cZ8lY9ZzA1EN2+KOLmvG1XOBKAwXDpq+GdAmTIAzWROQlfeWMBE9vadGvQSRhxBJolV9CKaCJ3VHabN2qJNR98MGrK4z3AyGhrzUbtdb2KuH+FedTBukywB4VQwmJjU/bUzZBBcaBBoytWasSdpcclEPU0TmCFV5P+Hm2gGyKHcs5mEfyNIxyDav1oOqtOfK5vB1yXlKNE+9ETPWhbC1SPrPoJsMk3p7Z5sWKdOQNI2nKg+kqXpscy/cvxRhlW+BpBllDN0jSbBF0wxupR7WZw9glfUfMB58lGazPe2/xaAFZA4WywIwOdb0+aHK4xsnokhXcHafctOrlYE2jeLtJ2O+IO1Y6ZYRkPp8IYuSlVFM4O0F4BA8jNNggVzF3givK5m8JXvN33z7N+U+HjcgpBxjRcNA+/It1PuHQh4qJuwSgtIUzp4okIqICidA0CDNcL0v7nyZ0uX/6LmYCYYXX3SXnCpX+giq3gCnNS9V1F2f+w==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o+rTxVS9afxrC3Rni0ndQGhr+C5R/sFTrwOMwNp3Hvj8j9RK4gCJ0Dt2TFhFajB5s1gt/TTj5W2nDbwQCDxUMhvyFGHID3p9FPM8Ph6twBj5G4F3QyTFgb0ljItRWJjs4GicF/49LlfbO3tbmoKygk19vd/whPjPZ6Gx0JOj5I1vFzcCvjKoniEuC5bOCX/UU920JyMXFr1B+tR7ZcmXnRmNEt3OH+57zvQHmKeL7c8igZdRxS4svWVJpE7kVXkyePhXHmYaI7ssRxRJFaOTcJyQK69o+YM7mFwao5Am4QQc6F/WPUCSMmQ7jMrcghg3UvHmHX+MXYfRMdaWtadULOJN1DyrJlLkLMqLWCno4lNoV6xED7JPh9B11VRKvmDncKFMcD4nrj0Q5gmIB40tEj2xX426Orddn1ysZ+B/EoUBx9hs0yZkfW1LtcNu/Iqu
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:44:20.9938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb484d4-1512-4469-67d9-08ded6a54ec4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5058

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

