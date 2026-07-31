Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010020.outbound.protection.outlook.com [52.101.61.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161C13A1688;
	Fri, 31 Jul 2026 07:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785482469; cv=fail; b=Ya+LDPM1R4zqydia+S4SYfHKZYSYi6b0qNI0mGRmrSc77lbRJcb22QbN7wpNOO0qW+v4z4NA/rg06uAWCA2M8v0zmCIuQCZNXhYNFhziai3ojyNqjQRvLb4dqCTL5aE2099ECiyuQIhcrp1osT5+CyHc0Z9Bvs+iktjR49vFRK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785482469; c=relaxed/simple;
	bh=jtiy3a7yKdBPxrtPkxIyBF+A3PnAGpRXLWIxsl+QcWs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HJjH01XRCQVGsJkzo7FFbX0yMm5AAdLWoQbx7fU/N7B6xCYoriZcixEE+GMYNynxmIjP1zrBjpsdA3u58x7a0KPmrHgi+PGCu/9IgQxVNf2eVZ3ssbF74UNnGXvqT86+36BSDz0QmNXsqnaL9VRFVeZjVj+PYLnE9oyAJtVJTs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=f/GfKsld; arc=fail smtp.client-ip=52.101.61.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f/GfKsld"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcFrK+bTJJgjFtcEkhF1M9pMT+wK854ddkvjEQ4hBsBcVSXz7rndswd2fjzjbfxx67YDWGAcuY8ronBKXINMYc1r6S34wM99bDA2rsMu+kXiSSjb/tw2zZGmH/piIeW17V55m1hE8IL90bb85liiH+hasawImic7+iNCiK0Dtw5FEI7tAo1+3FeCF4DfxZ/WZ5OkShHbPkjZidaoBQYY4qdhrMSqBGH4SbfgjiO9d7nh8jf/TXlBTYC3jkpPXN8AB3hlmEiDewCjo4T9me2tJNnWa0P3ITkV9YCDlgJ524Xe5qpbfpzt03UcJXViwXUkZEN24qvrf16g2A1RQxA7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRlEtdhQWwPcRaBPIn4dmWShbUJlfiSHPheGxZk5I1Q=;
 b=G6g56A7omp9HKFkJFg49oexJ/Qc3gBBn3DMQJM9X1kY/wEKCZF2yMZCIddSDC8NF47yEEaHNAT1BwDaUhczLG9eCgDucxzgP0xpRFPiVAq6C40D73pM+tCaPtkXiU9u8prcsPEC/6vyFFPpn+lN/5IYo8xfr4uOYJlqeTSGMBUvkw/zjv3CA9v1PmTFwdRxisBPkNHpWGEq8cjZGBB7a0Z/Xb2YrT824DoclOJ0MsxZG1S8QDdrjgxnk0Q9EyH/TncgYXzfI5BWhZHyZs93YsZ8akHwR5/+vA73dpEi9/k28Uy4Jzsyey1UEgDO0X9G7oXBTq+4u+GahcWvQqlI2Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRlEtdhQWwPcRaBPIn4dmWShbUJlfiSHPheGxZk5I1Q=;
 b=f/GfKsldncCnbxj7GmuCsTaE9oYepG4CpYT3MG59L/awU4+YXAPwJk9+ZUyiu0RvIYiJxaB42Dkd7j56C3xjfOoABBwEQLg+xhUeFtJl07xPreyautx2b3V8TCD+YaYgaoXMRhSbInPekgWt0z7D/boDpAriJTPwQWKBg78zgm0=
Received: from MN2PR01CA0064.prod.exchangelabs.com (2603:10b6:208:23f::33) by
 LV2PR12MB5750.namprd12.prod.outlook.com (2603:10b6:408:17e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.16; Fri, 31 Jul 2026 07:20:59 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::99) by MN2PR01CA0064.outlook.office365.com
 (2603:10b6:208:23f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.14 via Frontend Transport; Fri,
 31 Jul 2026 07:20:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 07:20:59 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 02:20:58 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 00:20:57 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 02:20:54 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 1/8] dt-bindings: clock: clocking-wizard: Add static-config mode support
Date: Fri, 31 Jul 2026 12:50:42 +0530
Message-ID: <20260731072049.957624-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731072049.957624-1-shubhrajyoti.datta@amd.com>
References: <20260731072049.957624-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|LV2PR12MB5750:EE_
X-MS-Office365-Filtering-Correlation-Id: dd72929e-e9a5-4476-6d95-08deeed444f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|23010399003|6133799003|3023799007|56012099006|5023799004|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OJMmqlM/GMWN1k9nX89ZJCO+f1fex9U0YfrU+0uiEimRg6grJmBDph1D6zUi4JF46UqOuahburql4Kt4abog76I0dysHvkAis6KoP1jSSFp/9ZCTQE9pllkagnt2GQrRU3OEpPCsdI432jcAYqf/7mwEcH2PYrxxTK2PSnLe68ksUDThl1ZZGqFyRBuisSu8lkNcd5J/385HCr8SUzxCayv3vM0JaCIKgCZOmAQ2bEhNCFf2DDtPXJ7GmliwGyolm61BNhbZPjDvrJ6En7KCAm4sk0SqP7EvypDads5lvZBbUD+xveGCk52PPULV5P5FhdYGbTuMq064LKEXRbQoMLQ31awMXYN2bsmlJGnBxsp3+wWm9yfnl/Ew/0bW+tENjG3cZ+pfRww66MQSZfLKT2aKFOHCBh12YTtBtBJ5ZcE0q2Ekrw3jOiU9YWWS83UWudVzhhNgilNyugQXDJXsUV0ir+OQd8e9oZ/XoSV7paYw90mZGKGTr2+ZK6Ud04d6Pba/wyhI3cmUXLu2MtffsroUC0nejWOtEcj4RZoZECQsJl9XtO9s1xSHQjztvTMDpckrYGjAcYt0HB5zuYCYp2YrNaiKUbpCd9h46vE6WUaK5Wg2Y6wZPfZNAfuqZImNCqV2kUyS73BVLAQodUIoCythuTDAmjEMW0qCtnJFdqzC7fRQlMXoc1GFGITQAJBaElRBPIJlCEmSx5AfbdPzDg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(23010399003)(6133799003)(3023799007)(56012099006)(5023799004)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XhJLC4pP6Okh8VlR0OzYBMXAl9R3+FjNw/gY5E3RIzTJ8u1lNsBDZ/lYIp/E9p51WCdNxG8hhFXjaerJLn1HGYS2M5jNawCH+RzFjoPwutUeBJIJyfWQVs23PD5fnldTOR2olkL0O2sFQykv/xNSWMxXHSDj1DScTmSV2UCg0cGrZYQwARzIgx3UhgcMDVwtZmHqX5IRgb4q88U3qReVSZFsjQDgma4UZieCW5+GFOaQeYFSbE/O/otAUDKjr7aXtvPr3eraCZ/Xl9uTr6fJo5Qa7qFwlDLI8ZT6P55zibi1DKBu0SrjAjDhZ5smYnAYOecj+9XfClcAD2GIMfy2LztTzxS0/BeB8f+1BpKep1RO/IYSHbt+9NPEafNAtcPoGvKxZnHITn/xWKS3eBmvslztPm1neb5ytxRmzoHkYfYYbt57eD4qX5wWBxUWGMmH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 07:20:59.0414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd72929e-e9a5-4476-6d95-08deeed444f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5750

Static-config MMCM/PLL ratios are fixed at IP build time, so the kernel
cannot read per-output multiply/divide from registers and needs DT pairs
to register fixed-factor clocks. Also add the tuples by pair in example.

In static-config mode the IP exposes only fixed-factor clock outputs and
has no runtime-programmable registers, so reg is not required.
Make reg optional for static-config

In static-config mode the AXI bus interface is unused, so s_axi_aclk
is not required. Allow clocks/clock-names to have only one entry
(clk_in1) when xlnx,static-config is present and enforce two entries
otherwise. Update the static-config example accordingly.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v3:
Added reviewed tag

Changes in v2:
Merged the similar patches
Allow check for current dt even if it is unused.

 .../bindings/clock/xlnx,clocking-wizard.yaml  | 53 +++++++++++++++++--
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index b497c28e8094..865927b9f1be 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -29,11 +29,13 @@ properties:
     const: 1
 
   clocks:
+    minItems: 1
     items:
       - description: clock input
       - description: axi clock
 
   clock-names:
+    minItems: 1
     items:
       - const: clk_in1
       - const: s_axi_aclk
@@ -57,27 +59,68 @@ properties:
     description:
       Number of outputs.
 
+  xlnx,clk-mul-div:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description:
+      Fixed MMCM/PLL multiply/divide ratios, one (multiplier, divisor)
+      pair per clock output relative to clk_in1. The number of entries
+      must equal xlnx,nr-outputs.
+    minItems: 1
+    maxItems: 8
+    items:
+      items:
+        - description: multiplier
+          minimum: 1
+        - description: divisor
+          minimum: 1
+
 required:
   - compatible
-  - reg
   - "#clock-cells"
   - clocks
   - clock-names
   - xlnx,speed-grade
   - xlnx,nr-outputs
 
+allOf:
+  - if:
+      required:
+        - xlnx,static-config
+    then:
+      required:
+        - xlnx,clk-mul-div
+    else:
+      required:
+        - reg
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 additionalProperties: false
 
 examples:
   - |
-    clock-controller@b0000000  {
+    clock-controller@b0000000 {
         compatible = "xlnx,clocking-wizard";
         reg = <0xb0000000 0x10000>;
         #clock-cells = <1>;
-        xlnx,static-config;
+        clocks = <&clkc 15>, <&clkc 18>;
+        clock-names = "clk_in1", "s_axi_aclk";
+        xlnx,nr-outputs = <6>;
         xlnx,speed-grade = <1>;
+    };
+
+  - |
+    clock-controller {
+        compatible = "xlnx,clocking-wizard";
+        #clock-cells = <1>;
+        clocks = <&clkc 15>;
+        clock-names = "clk_in1";
         xlnx,nr-outputs = <6>;
-        clock-names = "clk_in1", "s_axi_aclk";
-        clocks = <&clkc 15>, <&clkc 15>;
+        xlnx,speed-grade = <1>;
+        xlnx,static-config;
+        xlnx,clk-mul-div = <12 1>, <10 2>, <8 1>, <6 1>, <4 2>, <2 1>;
     };
 ...
-- 
2.34.1

