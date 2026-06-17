Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023099.outbound.protection.outlook.com [52.101.127.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1C53542F6;
	Wed, 17 Jun 2026 06:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781678470; cv=fail; b=m/+0ZFN+BNHWzv1+0K2ACXExGsl1kniwYJdY9gJ2RtWChLPFsTJcIFUuwZypSwCeoh1K4j0KlXENCpUBNwjmss9CMyb4BHN03K9wxZ0ig2UCCIc/QJXzWET9qVgAIbaLrJAEB7lod8XZnbsU/YIAvGhoDYSkNTb5kmIVWhdPFrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781678470; c=relaxed/simple;
	bh=1MF0BAEa0CwWEvAlXbt09sGTqWxWtm+9OPDFsutp2ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Btp0hmOcntMX2hucRbGlx0Tf1okU8giQyZNJOevrcBTckujjLt2GfKFKbkrr51gvvcKD6Z2EA2zk2uffYpf2KBGMAWOrt/k0H0PLmGPL5lJ7ARwG7XzzGnU48drBg0nGTa4DgmBIFWGm4m0HFtKk82iU2WmpcWPVtNfCBA7XYRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/AtvyzqM3XQMfc7etil0ev0CGM0cYl2srYe/nL3Ci8FAgN2Jgsr6TZLHh/50mJwm2hZZDKCACeJCc3/6xpypbbYwQZ9x+we+O1474lCsm3Rr3IoNLUa1t+6KCXwiWJpW66f+zQT6eajoilxhZewmvd3USDA8etH6DoAh03S+2HTIGV4iWl5fNkOqf/rutF1Cbts9hfgamkOGgmv/ULYchHzy5JGxcsKiNXxlKhVaG6ISo1u6GfTVRIvHB5gAd2+KA+Q3VJdP5FTVlfrYISYPVc/aMVxIIuKqsb5UP63GGHQ5YGbfmhFWjIUZ+hzwCAJaPKFVsTxYdw4c1AaWVYUEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6wfM91+Mc75JGSXiajPrv7YZLUJ0tzvc/SVrF79QsQ=;
 b=g5S3kAOMn4s2Ut82nWgVJzI+3JF2IMKOOZtaj7KlYnb7gxTtC724WVM4Zm+2vGbo6rNCj0tO5b3Wtz1WBAe7bBKM870frn+4AFeraXFdqoRzpxyG+EliVFpPq7R3sGRZDQcIzcuTbMmwZIXmmWmRpSp5F/01jj395jCqOlE0O+RhEN9Avyy9GSlkyC0hdQvePqdoZgKLY/ozmtqjThPcU9nk7tBg5cj38dUraz0jaWq1BoQUCR0dH6NaDxvuCpY4DGhcJ8pEyBR+t39O8a6BYulrsgOLgWDrGS022H6O3KE5BvImgtPBf0BYmA4piqsQ1aVI8esKKip2Wp86u84zJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0061.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::25) by PUZPR06MB5499.apcprd06.prod.outlook.com
 (2603:1096:301:100::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 06:41:05 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:300:57:cafe::87) by PS2PR01CA0061.outlook.office365.com
 (2603:1096:300:57::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 06:41:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 06:41:04 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CF11B41D4001;
	Wed, 17 Jun 2026 14:41:02 +0800 (CST)
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
Subject: [PATCH v4 resend 1/5] dt-bindings: soc: cix,sky1-system-control: add audss system control
Date: Wed, 17 Jun 2026 14:40:56 +0800
Message-ID: <20260617064100.1504617-2-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|PUZPR06MB5499:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c33bb1f2-c9ac-4676-4cef-08decc3b67a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|23010399003|1800799024|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2/3+w3FjvCqgOJJB+C9F2UYOg8HWeeWaa7gPlMkOtKfI3h+jVYwAJF+6ZLNO2hPND+J4uYz49TO3inCRMShlVKuXpsnJ9lDjdrQ+oox6pHeM8+G9HtDlMJDBRZR1oKWzg/tMwy6qjhUT7kSxGMvaRsjUcOCvQSSTeyVYb4rn6WYUXKEqOrhFqCUaSrMyj2xh1ca97NSbakNuWKgU9aNgW3Fy29AkCxyNEnFA4Dau4LxI85QG9XYfavPTgYFMz8m2lvhxpUdHSHn5OqRlOKNqdgbMtjrm7WCAaPX1kHvksiHF0IqlyVjvUKxRKQVA2Hnw3M/f58vt4sKaxHpokg6nKlgdq0zfdcBWq1jzKi5MUGWw5QVru+ThOiK7EJrRkNMSmlm6cqOmvJBtLTO4icdNC+KVasSF33kLJjvQ01cjlyNR8oRY5QzBaQKJAa21mP59iM34CWM4LuQta/kYm1DSqaV5F5WgmTlpWgXd+mvNbjInM8gwZn6KOTxYgFqKP7zTltn9U+HYCJv+31PL14Yzusxj9IuE2BUFnTewk7Z6siRP9pdCEB7MOma/SwrMbDxXwa2+xxvBi2OV6s3nBwhM8LEG9wI+7qm4FyA3yFlav/Wm9kZ55D5oYkdDb+dVYyjG0n4OpSs9YZ1GrI5HnXkf74/XYY/E6vm+6l3k+x23WHJHv1kO/m81hJKECY6ni3T3ZMmH2MnuggTZCjCwvCA8jZIk/I0K/AfhkAvejRxsHJ8=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(23010399003)(1800799024)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7XquuM8sCMY1z6pIuTA8Kau3b8XNatXl7IV41dEiETpRwmGkxDUMhGcE+5IxK15kd6Joe//iGKdJXl+4PS73tP1UU02cNPhr8tB/r3akwIvSCw7yKXalrygLDAT9Qk7b6awnyqw/WuHggzaCDw6kNNREJ7MyMpqIYE1iTbFno54vak3AMp9WX4G4ahQ5ViwZ590pjJ0YmsBQMLdJWe0/+NQKatfJ0G79hF/wwCNDabi0K9+nNqJUzWYhnO7pPhuNseH89b1Bs4BRQdBXUC+gtA40kEzLkuihrcYL/4QUsxh1iMG6Mw6aTwoerxWWel2DtCDlrM1OQR3Yn7oswyenBkV+wozU5adRkxLJEvxClLnPf0qLfIGtxpR8I+mIwTF9eJ39+5hYgjTrQwZ24nITlX4roSbsarFmD0QgL185O57yDjDLJDkWrzwYKbEmcF4y
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:41:04.5422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c33bb1f2-c9ac-4676-4cef-08decc3b67a9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5499

From: Joakim Zhang <joakim.zhang@cixtech.com>

The Cix Sky1 Audio Subsystem (AUDSS) groups audio-related clock, reset
and control registers in a dedicated CRU block. Software reset lines are
exposed on the syscon parent via #reset-cells, following the same model
as the existing Sky1 FCH and S5 system control bindings.

A clock-controller child node is required under the audss syscon. It has
no reg property of its own and accesses the parent register block for mux,
divider and gate fields.

The AUDSS is also controlled by one power domain and reset part.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../soc/cix/cix,sky1-system-control.yaml      | 48 +++++++++++++++++++
 .../reset/cix,sky1-audss-system-control.h     | 25 ++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-control.h

diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
index a01a515222c6..5a1cd5c24ade 100644
--- a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
+++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - cix,sky1-system-control
           - cix,sky1-s5-system-control
+          - cix,sky1-audss-system-control
       - const: syscon
 
   reg:
@@ -27,6 +28,38 @@ properties:
   '#reset-cells':
     const: 1
 
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  clock-controller:
+    type: object
+    properties:
+      compatible:
+        const: cix,sky1-audss-clock
+    required:
+      - compatible
+    additionalProperties: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cix,sky1-audss-system-control
+    then:
+      required:
+        - clock-controller
+        - power-domains
+        - resets
+    else:
+      properties:
+        clock-controller: false
+        power-domains: false
+        resets: false
+
 required:
   - compatible
   - reg
@@ -40,3 +73,18 @@ examples:
       reg = <0x4160000 0x100>;
       #reset-cells = <1>;
     };
+  - |
+    audss_syscon: system-controller@7110000 {
+        compatible = "cix,sky1-audss-system-control", "syscon";
+        reg = <0x7110000 0x10000>;
+        power-domains = <&smc_devpd 0>;
+        resets = <&s5_syscon 31>;
+        #reset-cells = <1>;
+
+        clock-controller {
+            compatible = "cix,sky1-audss-clock";
+            #clock-cells = <1>;
+            clocks = <&scmi_clk 0>, <&scmi_clk 2>, <&scmi_clk 4>, <&scmi_clk 5>;
+            clock-names = "x8k", "x11k", "sys", "48m";
+        };
+    };
diff --git a/include/dt-bindings/reset/cix,sky1-audss-system-control.h b/include/dt-bindings/reset/cix,sky1-audss-system-control.h
new file mode 100644
index 000000000000..aabdce60b094
--- /dev/null
+++ b/include/dt-bindings/reset/cix,sky1-audss-system-control.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ */
+#ifndef DT_BINDING_RESET_CIX_SKY1_AUDSS_SYSTEM_CONTROL_H
+#define DT_BINDING_RESET_CIX_SKY1_AUDSS_SYSTEM_CONTROL_H
+
+#define AUDSS_I2S0_SW_RST	0
+#define AUDSS_I2S1_SW_RST	1
+#define AUDSS_I2S2_SW_RST	2
+#define AUDSS_I2S3_SW_RST	3
+#define AUDSS_I2S4_SW_RST	4
+#define AUDSS_I2S5_SW_RST	5
+#define AUDSS_I2S6_SW_RST	6
+#define AUDSS_I2S7_SW_RST	7
+#define AUDSS_I2S8_SW_RST	8
+#define AUDSS_I2S9_SW_RST	9
+#define AUDSS_WDT_SW_RST	10
+#define AUDSS_TIMER_SW_RST	11
+#define AUDSS_MB0_SW_RST	12
+#define AUDSS_MB1_SW_RST	13
+#define AUDSS_HDA_SW_RST	14
+#define AUDSS_DMAC_SW_RST	15
+
+#endif
-- 
2.50.1

