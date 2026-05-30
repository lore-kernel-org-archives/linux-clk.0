Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023134.outbound.protection.outlook.com [40.107.44.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BA1317161;
	Sat, 30 May 2026 02:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780107414; cv=fail; b=B8t+wUzYBlxv4BwIQFzLoY6OO0txr0lm4JG3H0aIRcoYBwR1XCF6lREgrgG41r00GyVmzSzTPLs+b+QUIy2S6pHK6xck6EigANMjsrj6uaK26dTTSyqiwd4u6+VssvUMB/ZtbFMwc2XQqtM2b8YbzSnpvPFnsdBmgPhz/bkue7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780107414; c=relaxed/simple;
	bh=M7hN9NNflnqo+2gkTPvp6aVvYE4NY93rFTEJ1Sut9is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oBoQBCGy2at6gP1/dLAyCyppqZaMX3EqbPwW0scnPJcv3oZ1T83k1AoHv2qKcHb2wy+4Eg+EYvjSQispPwR2MTlRgX6yAcTscy5D1SUJ9Kw/r5rs0/BzioxC62+D+ghj8lekSPMu1L2B91Y+4nynVpyiUSfLRhMHjvv6n2Xzlxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5xccinuG5aqCGt995xFlk8af1pTcxTYKtJx0WDJl2llUN6ZNIQSf08Q/dUu6EyyBfPSnjLRaXtwCYhBR9k22atvRyr9et2JTV3WRXwnlmCE+q0YUo5KMoLyLiNEZROs3Sz8zkYxPS07/QkUsuVkq4N3ODuyo7WO5ICwUCY8UkmHGhxqEwNVqOPkUq6h4fMhs+UNK1utG/UIi+ZVK8H+m0654EOm6jrcwswVwImq9ypnRHzMsjFtXni7DhiNWq3T0tMoiAL6xZfN6Y2pkve6iiuZfOoOlljmPh2AMc20WxUMXergqtM1Hc8/qHlRGcTRmWi6+TzYti0nGjbJFV0cng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JFP4tvydo+Q4eGr5frqfSofazl9LItJLcPilmV/Wa4=;
 b=AZm4M+5uYhMv4dA8ciMRcNeK0RDyMXsCNRReyE5f+6VqQgvcSmyvvohkK6BkxPFARFZ9bTXbgF6uHoPrdD7n3uhBgxXAKIZsufysu7mUwEM1HiVrDaeU+LaZyUovJxCbuZPKam/CoflyXtJDkKwGAgsK+KKfeIXpBODpZdcO16df1y0BboIMhSmwPJPk9cnlY1upZ4lDtn+IVRqbTIXYhwDBDmtZNYQ6BtzL7VovpsZLIPJ73TaDgBgXysZRfXdEMiFNKdqcV3wAO39lJlYqIbPxJWMP5xVbG9vpyYPrUTUmDrFV0hXCX2RCkvzm2MPB06MRlibYnc728BsImLl6nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR04CA0208.apcprd04.prod.outlook.com (2603:1096:4:187::10)
 by SEYPR06MB6754.apcprd06.prod.outlook.com (2603:1096:101:174::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 02:16:49 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:4:187:cafe::64) by SG2PR04CA0208.outlook.office365.com
 (2603:1096:4:187::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.15 via Frontend Transport; Sat, 30
 May 2026 02:16:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Sat, 30 May 2026 02:16:48 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0F3C8408426A;
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
Subject: [PATCH v1 1/7] dt-bindings: soc: cix,sky1-audss-cru: add audss cru system controller
Date: Sat, 30 May 2026 10:16:36 +0800
Message-ID: <20260530021642.64059-2-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|SEYPR06MB6754:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c9e61cf5-1829-48f6-fe59-08debdf18119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700016|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	C3Gd4HY35UxfgyWG9vSOBVOxp5PAaCZvImVX4YdlfIG8Y2Q87IFmGTt7RHgAiQ+AjiFHrHxLdi/wBsFFanqtNKO9r/P6kxd4o0QTiXF6Nmw7AYmLIZXaoCaUBB5xvPep8WXS0I2Z0EuJHOu4pPxPllAPUYSgKYVlo8ncLW68FpSRH7kQvQQR+u0iMcz4DpeWwT/T00XkrmZXYfsWWryFx0pm+0SrLs2GL0v2Ug/2FTLCrKin+yGb5J+lupewL1gmWpRDnkdcKw1cAqHfUFMgbcQLIdHW7cLbrd6DT6zdUc/YGuIyxrvl3nqdZuNUQQazknoLcSnXR89KtwBm4V8+tnYXCCKTQnKWSUv8HRe/X6ePjmUdn7B9PbGgd6nH0gqy1BZ3yoHcOnV4FNQk/alWCb4yqgK6Ej0E9oruNV+Pm+QFRF0F7FEgDjzc7ieZ4tiDty09pUObS5+m74VM2A+xM9gVCusY8TsEXKVu7VwpHIa2IQ29Jhi8p3UBK/Xh22uIW9ve4q/SxT67WZOvJ7Ge0js8/Hx5x1a5uS1dQOGFlS9NF/uX3OjaqlDcr7Yk5M7dwga10Twh0mVpgaCyj11DwsIwJBbWT7G9Yb/Fd+FCgpBI8euvIOBy+dIIjpy+uw9pIy3Il8CAQRJaa5Fl+EFyMTI0N5HDqFEu9/cMZhYowXKPupwA+23gsQWg8vvZOpXl
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700016)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pWbYFVwajd3jK2kC7uwZNUZXfkziKAKP3RFEi0iT8OIT/nV5a0a2rsttUKPvuBdubTt2HjF4Hl7zNgz0X15UqQ+HXlViectppBkvSIxiA9cTxdJZ0lsGckqxEt1uJmvPyqr7gx+BaW/SxitYdD4VoWb3TsKTw2Z6KJyVNV6bbdKkICJTD1X7kcvhu7JNGDDRfGAQjEpTO45jRVwJcnTe+GZr8TTbD8jP4s6Kypc/nxMwFWONRzComD1T3cvh4dAO25y/uN8l2QLCKXa7k82uRoU8YAOu89KWqJejTp1WlSDVIZCXOBegOw2o0rq/3t00Aml487ZsG29smQLMhTVrvaYAJKxCy+7CyyXdNmzL8xCI1EHP9UY+jirTxFEXVDZ7C0hNY1/xPUv0ZffflINLSDmicZTieh2oKoNAaLic5csS6jydEhDe1VZ2iPKM08d4
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 02:16:48.1889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e61cf5-1829-48f6-fe59-08debdf18119
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6754

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add devicetree schema for the Cix Sky1 audio subsystem CRU syscon/MFD
parent. Child clock-controller and reset-controller nodes are described
via references to the AUDSS clock and reset bindings.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml

diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
new file mode 100644
index 000000000000..889e77fabcbf
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/cix/cix,sky1-audss-cru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cix Sky1 audio subsystem clock reset unit (CRU)
+
+maintainers:
+  - Joakim Zhang <joakim.zhang@cixtech.com>
+
+description: |
+  The Cix Sky1 audio subsystem (AUDSS) Clock Reset Unit (CRU) groups clock
+  mux/divider/gate and software reset control into one MMIO register block.
+
+  This binding describes the syscon/MFD parent. Board DTS must instantiate
+  a cix,sky1-audss-cru node with a reg property; clock and reset providers
+  are child nodes without their own reg ranges:
+
+    - cix,sky1-audss-clock (see cix,sky1-audss-clock.yaml)
+    - cix,sky1-audss-reset (see cix,sky1-audss-reset.yaml)
+
+properties:
+  compatible:
+    items:
+      - const: cix,sky1-audss-cru
+      - const: simple-mfd
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clock-controller:
+    $ref: /schemas/clock/cix,sky1-audss-clock.yaml#
+    unevaluatedProperties: false
+
+  reset-controller:
+    $ref: /schemas/reset/cix,sky1-audss-reset.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    cru: syscon@7110000 {
+        compatible = "cix,sky1-audss-cru", "simple-mfd", "syscon";
+        reg = <0x7110000 0x10000>;
+
+        audss_clk: clock-controller {
+            compatible = "cix,sky1-audss-clock";
+            power-domains = <&smc_devpd 0>;
+            #clock-cells = <1>;
+            clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>, <&scmi_clk CLK_TREE_AUDIO_CLK1>,
+                     <&scmi_clk CLK_TREE_AUDIO_CLK2>, <&scmi_clk CLK_TREE_AUDIO_CLK3>,
+                     <&scmi_clk CLK_TREE_AUDIO_CLK4>, <&scmi_clk CLK_TREE_AUDIO_CLK5>;
+            clock-names = "audio_clk0", "audio_clk1", "audio_clk2",
+                          "audio_clk3", "audio_clk4", "audio_clk5";
+            resets = <&src SKY1_AUDIO_HIFI5_NOC_RESET_N>;
+        };
+
+        audss_rst: reset-controller {
+            compatible = "cix,sky1-audss-reset";
+            #reset-cells = <1>;
+        };
+    };
-- 
2.50.1

