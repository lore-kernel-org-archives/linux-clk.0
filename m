Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A5E3AB480;
	Wed,  8 Jul 2026 07:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495182; cv=fail; b=n4wI66It7KPqAki5lxJaxsEjdnQTOy9qmTr7r2duHnHA7ED0wEbq8KpnVinM7ROOi6S62EsvQQF+XIjsLKQEn05z+7kK1VolaNrFs/QDnHE4+vJgBLdHC28g9qdCRbBgUT5YILJoHJ9+twKWUI8UhslrIM1IJRY7duvaxTTCxUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495182; c=relaxed/simple;
	bh=tiSMk5mh16ep/lMuPUqCw4MqfCZdYWywkOpsCbA4Spg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tc4nB1I3DUE3y3IhrusxX7cleqLbD1KMoShhu1/yjPb4YV4oCskXhEOIN5EZYL1LXCpW3PmnpgeVStnMLdaOzr4/wGwQrIbO3Q8m0Xq5YF9jwkX1wOUqMfj8wROsbesSihhK+R5/Wel54iFi9BzWJuEYNSFr6quZOMWHLwPtsRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=u6srgIoq; arc=fail smtp.client-ip=52.101.53.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="u6srgIoq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l15Vdy4ICZ26rru4cZwoNREHNFcxnb+E2YmmCnYIXsNweQZmzwOo4G7Nv6GHia2FKJQ0c9357zksacxkYoT2nDjS2ntgjntV/nG9CIQp0os3fM6bOJY3I+UX4lthAy4bMnnWkY5qQFUbgr/H1iYupO2MncfOplqjbJNbUUvx5+XhrlBJTX+Wexni1VBVtvDoc7c6we3bA+iwwRVtB5vl7t6kJqY9zX98/Rm9PuLMsEqWO3R8mxnJtebSAzeEsVlDHSuXPo/TH7yO0TPXVVIhup5HdzQ4g/0gHeB/RFV/GJiwr4ZQku6h+yNw6gnmeSe4VXTEl0eyHqHsiO4ohXbrkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjJ6fPDlQNSfKM+1Kahx4Yy9FqwgqYRWAtKeGpS61JA=;
 b=MELPfgOLHk8fzEQkpX5DZDsaNQYAK1h8pK3dEHJ4T6bE5EacFl3YmXlgBbM5DdFt/4Q27kSSVs1J0chkVHH8kHEhEqTQR1bzIL6YaWniglarIzHv1h3lq1zduOqVEFs1Z76q9y/3niuwl0BtBTOegu7F6KZAjz0Zzy9RkJDLJQS8uJ3lsnHW7vRr+2cay32swVve3M3EYcMeTzPGa5CQyg9MS42RvHb5eSPt3M1qBDQ2nxZDadyIZcLdawzH2n1uUWcA2sR0UPWosATIfN3GNXtnWkmVoVMjDOa3H7y3l1BEipqpxuqTL+xK+oo4klCUp4jI37Dev1J/YDkrzMjbKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjJ6fPDlQNSfKM+1Kahx4Yy9FqwgqYRWAtKeGpS61JA=;
 b=u6srgIoqRqfbg1b6kM+Vrp2Rkb17te76Mjezc+tP/QQNTRIeuZMF160StUuiwqJWSCeIK2lHRCT74vOsQALNhmwg1XwjlWGm5z5NVX6MClQ9qEVgnvNHuYFTJyb+E5e7ZxOv02DpuAZF9ABWkLSKgLGzP5WuvP5G1Hl3nzB2nQs=
Received: from CH3P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::11)
 by IA1PR12MB8333.namprd12.prod.outlook.com (2603:10b6:208:3fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 07:19:20 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::29) by CH3P221CA0001.outlook.office365.com
 (2603:10b6:610:1e7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 07:19:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 07:19:20 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 02:19:18 -0500
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 02:19:18 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Brian Masney
	<bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Rob
 Herring" <robh@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Stephen Boyd <sboyd@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:COMMON CLK
 FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: [PATCH v4 4/5] dt-bindings: clock: versal-clk: Fix Versal NET clock validation
Date: Wed, 8 Jul 2026 09:18:51 +0200
Message-ID: <1bde44b7fd701b43aeee425be9647c15d4bbcb8a.1783495122.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783495122.git.michal.simek@amd.com>
References: <cover.1783495122.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3985; i=michal.simek@amd.com; h=from:subject:message-id; bh=tiSMk5mh16ep/lMuPUqCw4MqfCZdYWywkOpsCbA4Spg=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT5/nz42+bvXidxm5T7N7hCFEJcuwLm1x4WVNjd+HPv/ tTFpvUWHaUsDGIcDLJiiizTmXQc1ny7tlRseWQ+zBxWJpAhDFycAjCR0mqG/1VR+1JuKM2f82/X gpqTAh6u/PdnTV/WwiD5tnYOi6FJXwsjw9WJGzZ3vP1k8+H0AxvPkLPHTsw+mlr1+GB23zKm+xu ZLjACAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|IA1PR12MB8333:EE_
X-MS-Office365-Filtering-Correlation-Id: 8677fc46-e032-4555-317d-08dedcc13a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|7416014|23010399003|18002099003|22082099003|11063799006|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ZrA4ilju7NAecRRSmegAcR46OTP2TNAzUsIazhJDeRko0RYZklFPxCPzQKndzXvNTLVGZ8L0LCglnLufBn/HR6Kx0U4YeQtBpHVxs50/ozOVlRFfgd613u5vxXX507Mh8Rak65kRf2edQD18PbpAPlLq/p+NMPuE9hIR0e5ot8T4mWihijCbOOUgDuCWMUZ9WDwugJlOV1Y5fhXw8yla4UEOmqwE2MGelNDnf8ipxUi4RiKwSUy7EQ53T14H+I1Zn9glLqZSdf1iGmWB7qKX4lXHkVAWLMaIjg7Tff8MLSeE/baVJavzejQcNx2Z3D6HiobdADiwT8EuGDQ5DGOQurZzUXoyeSJu4OYIRpdBIHTDxTtxKHOYntlTRGZvpYSiyK9y38H1wfW/9OkONSwy2lqAWQ5DgoT6N4tjNMvTFXBy56HdHZunp/zYrfUxwM6hiBb2FC6O/XI8hnWboOsYAOJpqBlV4hvw5crjsgmpvCx3PonNqx5nfwf89Ll6otXLxHfGb8KtHAwVQcpO8uU2o2kNvLGVIxZEd9eMU8Ih11SLZF+p+zM+f1uO3gR+XdhdpUQvbD/b7PlAekbUTkFcdcpc9jK2yA3680ImcOpef3wL1zlTleYuBVumGCUs8kgkLnauuRONInTJX/tjDS9iKg0i4tJ5yaQnAIh7Qsuv8XIWfEs3kJh5KjmkFTEICZQcBiCjvjC5pQ8/S6vZf9FPEA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(7416014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Yl2hdISqUZnAYrksfqqLHSPOwsWMhwC4fQImg7vXxoQevpXBNzTA7J6rtWjhEKrJkqLMhNU0T1uQpkPqvg3w00Z8VcufIqzdzz7F9i1GczdKj+sxgeFi3Z59U9Q6jsmcQxw6aqbq5cGS1iuZM2I7ZpfhCjXZ+fHfwcGtAfJ2cej5jlPHGfWYWzw5dSIEvWijep4ysj/X+31qigSDoWNluLznp96pI8KDLMV/LrUTbjpuC5QEVUu45cLVq94UPLd7axOO6LKBY6HptvKoHNvwztC7VbRZ5fJ0j7jIlHHZyoErFIKNmC01coEtQzRwX37Dn254/ddB/CYHT6SIWx309qAfkOpRjMl5Y7zwe8Wq/2OXLXzhlppNJUZvz3bhbL+FbAgOgRLFpIa2vxRQYFlq/8/a2YI1rnE9AyBR50ef+snJoo8gIL9r+KkeLK0R38jF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:19:20.0224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8677fc46-e032-4555-317d-08dedcc13a72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8333

The Versal NET clock controller compatible is specified as:
  compatible = "xlnx,versal-net-clk", "xlnx,versal-clk";

with xlnx,versal-clk listed as fallback. The original binding had
two separate if/then blocks - one matching xlnx,versal-clk (2 clocks)
and another matching xlnx,versal-net-clk (3 clocks). Since both
compatible strings are present, both conditions matched simultaneously
and JSON Schema applied the more restrictive 2-clock constraint,
causing false "too long" validation errors for Versal NET.

Define clock-names at the top-level and use if/then only to constrain
the clock count (2 for Versal, 3 for Versal NET). Add a dedicated
example for the Versal NET 3-clock configuration.

Fixes: 39118392d19a ("dt-bindings: Remove alt_ref from versal")
Signed-off-by: Michal Simek <michal.simek@amd.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Changes in v4:
- Also update firmware node to match xlnx,versal-firmware enforced by
  schema

Changes in v3:
- Move clock-cells to be the last property in the example
- use 2 spaces for indentation in example to follow the same style which is
  already used
- Add fixed tag

Changes in v2:
- Update logic without ZynqMP part in this file and have if/else only
  around min/maxItems

 .../bindings/clock/xlnx,versal-clk.yaml       | 55 ++++++++-----------
 1 file changed, 24 insertions(+), 31 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index 12d060c39bfc..1f36ccc4cde1 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -30,11 +30,17 @@ properties:
     description: List of clock specifiers which are external input
       clocks to the given clock controller.
     minItems: 2
-    maxItems: 3
+    items:
+      - description: reference clock
+      - description: alternate reference clock for programmable logic
+      - description: alternate reference clock
 
   clock-names:
     minItems: 2
-    maxItems: 3
+    items:
+      - const: ref
+      - const: pl_alt_ref
+      - const: alt_ref
 
 required:
   - compatible
@@ -50,46 +56,25 @@ allOf:
         compatible:
           contains:
             enum:
-              - xlnx,versal-clk
-
+              - xlnx,versal-net-clk
     then:
       properties:
         clocks:
-          items:
-            - description: reference clock
-            - description: alternate reference clock for programmable logic
-
+          minItems: 3
         clock-names:
-          items:
-            - const: ref
-            - const: pl_alt_ref
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - xlnx,versal-net-clk
-
-    then:
+          minItems: 3
+    else:
       properties:
         clocks:
-          items:
-            - description: reference clock
-            - description: alternate reference clock for programmable logic
-            - description: alternate reference clock
-
+          maxItems: 2
         clock-names:
-          items:
-            - const: ref
-            - const: pl_alt_ref
-            - const: alt_ref
+          maxItems: 2
 
 examples:
   - |
     firmware {
-      zynqmp_firmware: zynqmp-firmware {
-        compatible = "xlnx,zynqmp-firmware";
+      versal-firmware {
+        compatible = "xlnx,versal-firmware";
         method = "smc";
         versal_clk: clock-controller {
           #clock-cells = <1>;
@@ -99,4 +84,12 @@ examples:
         };
       };
     };
+
+  - |
+    clock-controller {
+      compatible = "xlnx,versal-net-clk", "xlnx,versal-clk";
+      clocks = <&ref>, <&pl_alt_ref>, <&alt_ref>;
+      clock-names = "ref", "pl_alt_ref", "alt_ref";
+      #clock-cells = <1>;
+    };
 ...
-- 
2.43.0

