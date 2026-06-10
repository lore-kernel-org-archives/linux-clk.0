Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023111.outbound.protection.outlook.com [52.101.127.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9823264C7;
	Wed, 10 Jun 2026 06:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072243; cv=fail; b=TONKwOCv2Hpdr6kYidTU6SsvXY7IQyKZcKjqIuc6fDAUiMqruZV1MRUrmaHfcwT6dH0iRCrUjj312qwSKnuzPpkJuvELdODMqNn7ibikAXY0LAHuV5Af4cBeMHwGSVEVQQnTNHgunQOEKozAIzvmNejyTxjjCgSyiw6347piLIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072243; c=relaxed/simple;
	bh=Xs9POHrnx0oSiwLX03/00LNcDAk+gjSZYgWWh0CTXbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eq4t8U+AqFQM7qRNf8SVPNjxBytB1iLVtPIiiXc2Md0oWbdrAj2HhcFumcTKeT7BoELrcwj3wXPcVAqLAux08FukWQomqUQjzI5/tp+kWcD5XA2Kjs6CBZpUf3ceEgqmRysu0SogVFdAEY2uN7YRRCds8ecIYtIhwG1QGsEm0QE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLV7+EUeGKdcUEj/l2bSqBXbcfrXYLrsDi9wwVYkKOSvH0G+QXOOocU9WXpg8qXYxWm/SRNdeKZczvKQPprUgSSQIrnmLMQxa24UWtQP9tMnBCC9lj+deIMxnvhaLl0fxADN3XOHqy7rfQH5Z945rpducHVrHX51379o4let+/CnO+2bGwKmFiuvkNHADLAeUIGi/zUNBhrgzOePuCUQuS/WKYWV933rNEBB8k9+Lam032CrqUx9pDiOKJW425syWS1FZO8lSOdOJe9CUSYqP3F5H4SW3bg1VKOX7Kn1vvEHumLQ9CInw1YaosZuOcqK7O57sSB1yFuOCQaHxtJNnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQXq7y4VDRCnCs7aTyPe3mddFLkda83JZJ2Nuluqp8U=;
 b=mTbyAgeOYZ33EqIvAJwGJBjxWrYITJOWwOn9WKwEsZFZj145BvypG3r5l845LVwq7uT8etcCsu1w34rx6zIKxbOq3rmmPl0NSS9U20MFck/Cje5qwpQZSE4kq2+YDUO/Im4H/6nvQ2zxvjgE1KbJxIO2RuIAZxtTkQa1VUotSTUfgLT4XOttrMNb4YI7GwI1Qb795owCoeg1wtkW3FY148OatSwGSdhAQ4kV1AkUPVR9f2+tDQ93Hl1k+Eq1ZELMo4VeFQ7QaKmrXkNldv6Q3WwqEP3+mw8cidUIClZ1+IUDzKhnA/qitjKy3Fnr+H+H12alIR3M8Md1ch/JJUsx3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR02CA0005.apcprd02.prod.outlook.com (2603:1096:4:295::7) by
 PUZPR06MB6006.apcprd06.prod.outlook.com (2603:1096:301:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 06:17:17 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:4:295:cafe::6e) by SI3PR02CA0005.outlook.office365.com
 (2603:1096:4:295::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 06:17:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 06:17:16 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AACAE40A53A1;
	Wed, 10 Jun 2026 14:17:15 +0800 (CST)
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
Subject: [PATCH v3 5/5] arm64: dts: cix: sky1: add audss system control
Date: Wed, 10 Jun 2026 14:17:12 +0800
Message-ID: <20260610061712.3203984-6-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260610061712.3203984-1-joakim.zhang@cixtech.com>
References: <20260610061712.3203984-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|PUZPR06MB6006:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 700e391e-ce50-417a-e680-08dec6b7eb9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|7416014|376014|36860700016|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	PTwH/YNG0OQhIrNYTOKllvJW+9DcZyrKn/OIfctido/QBd9dDHPzkbS4uEKaJewulcbkFnmkxS7cXd2n8aqBHo5A3sTIcYEzZtI4jQYEw0LicWP2ade0D+C+0//jS8Gjp2qMhiXP9YINDky6+Xr/UZgxFD5DETFvOPI8UA/3PRo/T1VYbgZqmsbKjW4skhrKE7uHk0S12+3X3BWzKYhYcvzqFpJNTg+eA2vCipCBpYeDllOCX01v1OBzryXuP3mc3kbKHfJsNOnciboO0YKomJO4wRAdhNcWYgRvICqt0SWKMO0UykYkF1kIe3KVpMS66Ch2Xbgt6vja6SAnGMCI4XQ/PMsaeGFcGh17p2mI96u98EgPz9zBWYW+GO76RAu6Sy16ldiLY545k4tpyGjpllVUINnzC1ONbeQnuCL8SFrGVFV7uuwrcCm0Hh4s5q46tbhbB8mj2sblqmPLIvTxsPfZCRAwl06sRTG5bAMGWX1RAhXwXKHjAttLJ4zIukvJB42+4cTTfD5g72UD5TcsMbA/gTA5zHvHoQcUocdiDYTj+8oIfE8EbvHQ0MwUi1fWm8Qm5n0PNS8/Xc5B3vyPOXY/saYv6+ev7FqGD3KDbj6EFZETgr1HMgylQeIJawdqQIl8eoNKctr2++8aEe3jfsQW0A1QxbQYIHJ98CIMxZmUa87tp+dte/xAnfuUtRjocQCYqYL4FA1cQKdR83sW0Gn6XehH5/8U48YlaznFce8=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(7416014)(376014)(36860700016)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HtcNEXBvjeTqu+iSKgmDNGLUoyk2FpUfFvdJ46dznRxvU5MSLXHf13uUcs4YWGcWgnFYRVnzto5CsXZ9cEGX0HkxB6cb8hQulWsbnMPlE137THAj7OuJC3Vz7t4vlPXgi1R9KJjIqif6E5hYHnnTx7v4v4aiDta8q9b+1buKJJXnDWO8AtJvNJCen5v30GbdsUA7IkjulLz6SBYRMNXASWSAhEr4Anvl5NC5MKFKHsnGSLWUdGU7V7cu0fkCXznPTqaDoA6kO/9gaZYdRlrMKgLad1xILC7w3xoLcmJsmpNRx0XyidSSeetAoubjI0oiX6n5R8Qlyc+Oa2rspcnHmp5s1dZLbwKd8adJhzj/N33qCT9RwDQQZOLOYZsNvezNbGvIiIsejkq/q6uHOYohrOr2ZZd2NlQezSjWTj/55MBo7CLjmBAilMeBmtwCfdXB
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 06:17:16.5441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 700e391e-ce50-417a-e680-08dec6b7eb9e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6006

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add audss system control device node, which would provides
clocks and resets for devices in audss domain.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index bb5cfb1f2113..368a1d85c93d 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -6,6 +6,10 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/cix,sky1.h>
+#include <dt-bindings/clock/cix,sky1-audss.h>
+#include <dt-bindings/reset/cix,sky1-system-control.h>
+#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+#include <dt-bindings/reset/cix,sky1-audss-system-control.h>
 #include "sky1-power.h"
 
 / {
@@ -488,6 +492,26 @@ mbox_pm2ap: mailbox@65a0080 {
 			cix,mbox-dir = "rx";
 		};
 
+		audss_cru: system-controller@7110000 {
+			compatible = "cix,sky1-audss-system-control", "simple-mfd", "syscon";
+			reg = <0x0 0x07110000 0x0 0x10000>;
+			#reset-cells = <1>;
+			status = "okay";
+
+			audss_clk: clock-controller {
+				compatible = "cix,sky1-audss-clock";
+				power-domains = <&smc_devpd SKY1_PD_AUDIO>;
+				resets = <&s5_syscon SKY1_AUDIO_HIFI5_NOC_RESET_N>;
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

