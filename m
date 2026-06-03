Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012021.outbound.protection.outlook.com [52.101.53.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7979939A063;
	Wed,  3 Jun 2026 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499576; cv=fail; b=WBckbjUwppDNNHfZMm7LZUnGSj8qUeM53B1LoJSej71oB2Z9hELLuhgOhceahpmEw3K1egrNOmirx6vQkr78ySZHts8xtPgjmnl7hcLFYjfA623yGRloGXwKbRVTvEiYjwKv+nsxYKSPv7Ou6LY8/HjN71E0Mo+TrILHr8Hr3Z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499576; c=relaxed/simple;
	bh=JY0bKLpJ6n00tX1y4bMpuomiycTyaF+CgmXmTFblIlA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qA7sH//ecvrHikHnqcuQQ7zPb5FK9kIldvC8WPWbN+498GF97rnMPqE2RdOPwwFEDlgtIM21oWBEyCuMv5QASBqEjwM+/WCa7tGTkLJ5P8tnWWm5nd3HTGRjgLRl+K9OCJ72aPUhhdCyBaiY86ESLGjOpwV3fzD6keJkwqcXNnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EHxsd3Qu; arc=fail smtp.client-ip=52.101.53.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EHxsd3Qu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXw1LZpg2AbUaioNIVZjOTXhEVWHwnVWMZSQItJSi4odlrVt79AoP6iqPA7qvU5H30SlgqvKTy+aUKUTXGGZ8JDmefE1oEf2u1oUN7bRPWYdpJFveT5HiqseSCa8ESX8vDZgk0IkskLProDqyckDS0e9shc09Pr1Fg0EXmweyYHa4WHvNyJ86ca3/60pDgOcA9Brcd3taB13EEAwNuCjYOsgmxfQO56ytaSMPGS9N9gFPV05w/hwWTY+S6bYCCyKbwvo8i5lM3oHw2rOMgc6kjXJ4tggkuoedeY+cdrARku0egQv2FGsoGbpiu4RVwuDTQZAwwEkDA+XiHH8QJetYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61nbCu+oTYkySxmndJbiYivMRZ6Q59B/O03A2HCAG1A=;
 b=FUaBD2OTHEPFrfcOPBGgAutT1A/8RsA9cNNG2yGDzV7VlxRshrx9x1fNucHieqR2dLnyeG8AY7A7ewf9lOuCkNwxbly8E2pNhcmtUuNq96wIrUHu5byUHaI0SDxNHzA66aW50V3vs5ipgcTTc9poRPDrhCI13jZk+aFVKvNWVeL7AG+TjWch3dSTIqUzbfpmGoeGQ/5kh0Ckmn/9R2BlpwzNyHf2ODSFD8JxcHU4bS8JjvPtlNW7UDqbECMq2rCc2lMVQCS/l1fjSd1XNbeGqnkpEItCp5gO2LbUw7e4m818tNJreOBfdMU8gBhYm45vqOCVjPVq9+Orm5E8bY/JNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61nbCu+oTYkySxmndJbiYivMRZ6Q59B/O03A2HCAG1A=;
 b=EHxsd3QuvCZjXGQ70wyNNlHMnvDUxRoN60M10zeR487fUtPJE4wt2hF5u/8HE8Q7MR30ZhpJrXfJPOZYD5X2RoJy9DGQLXoSQVPxMGexSNy3uVO5RyzDwAA2Exfk8RtzSstPN/OgpFge1FhUlg5wPbGtcm4LKLYE0nl491U4lQc=
Received: from BN9PR03CA0905.namprd03.prod.outlook.com (2603:10b6:408:107::10)
 by MN0PR12MB6173.namprd12.prod.outlook.com (2603:10b6:208:3c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 3 Jun 2026
 15:12:48 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:107:cafe::11) by BN9PR03CA0905.outlook.office365.com
 (2603:10b6:408:107::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 15:12:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 15:12:46 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 10:12:35 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 3 Jun 2026 10:12:35 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Stephen Boyd
	<sboyd@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK"
	<linux-clk@vger.kernel.org>
Subject: [PATCH v3 4/5] dt-bindings: clock: versal-clk: Fix Versal NET clock validation
Date: Wed, 3 Jun 2026 17:12:09 +0200
Message-ID: <b9676d7e4e6ccd6af99ffc3127dadfe0f4edb498.1780499520.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780499520.git.michal.simek@amd.com>
References: <cover.1780499520.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3607; i=michal.simek@amd.com; h=from:subject:message-id; bh=JY0bKLpJ6n00tX1y4bMpuomiycTyaF+CgmXmTFblIlA=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWQpuHge72X/sdL+V0NKrtrDRwFH2rPfGO44LHd+scVDh k5TTwadjlIWBjEOBlkxRZbpTDoOa75dWyq2PDIfZg4rE8gQBi5OAZiIXgrDP+0vfG4Ksx1qjr7Q ZZgW+ZZHa63L+tdsG0X0qqf9snm/OZORYeUMceaJj1iX5h//8yr97FXOdUd+ex35V9FoNzlvi3G HDjMA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|MN0PR12MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: af29d3cb-bd86-4a19-ecd0-08dec18291cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|82310400026|376014|36860700016|11063799006|56012099006|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wt62fObvs2tZa/F465S/j8UNWWMUkcZtGH2IFGk1LqllGaXvSm3pmjrHYewkFljOiYHjTdF9GY4XIrSO+R6cw8uln9IoWCUryz9genGEykLdyta/g8HUHVyYopS4TtRDZRY+xiRdDIwy+5pj0QLhavEb3nz+lQAUlKb7jRwfupNcaSGclxHtURPodztCEoKhS9gIen6FlSCcevWbj22mrtmpEPPqSvlllPF6TwpeghA6aEpVzrZUe1wTgeTFhN/3tx7T59zneTDv5CIo6HVyg2ExMG3lqartFlXynBQWtXsQ7GMqFMdjElsgpID8htvr22SGTRPyyjmDHp6NSYe6FgzNAmVDtXgvvfhlyRmwNrVR3WAkflc26LdhGQj7cLqkPFOBKO6iwV3r8hTpAsLGqAwPJ1NuG3PNp/3/bNCgv7Tjyd/eWC9F+c80KkigNPZFEPt8xN7DhFbBHNEHWyivoHYDEYtdO1fuyTDg8W9v14qzj6Uxpsb60dtJUtxlAZKtC13lZm2YXxvsZ7ywW2Pf+vQsCS8Jy6PIbJHr5ch7FF+AsF6w3cp6LTD3Bm1x3OOdFs/JKbSKreXfAbjld/fyVs/Agk5BP2kC+vDzKq3skJckXF9OeMfb2mu24o0u9NB/iWc9xwpen/ycqUODr68a9SqW+f2GnXteatmPmBG/ZTNQ9u/hTXAIAFb3g+MxTE3YTHMlQ7fB33iKW7DxqL5Wep4AOzXH4vom8gjDZLr9Hc4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(376014)(36860700016)(11063799006)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UOICn/LFrpiJVTsrBiBIwC2n2RMATw7ebXqRScgahZQdZcBQzRWqlPDEfPY/OwXTFnV/e+2D6I38hte0tpRXnSpRcet+9Z8SjRc7IsnaWw9lUHLN0ifGF66ttxMFqZH1HviCql+uKu7jBK1XIBlqHDbGJkC7l3wbUZKzfuCqCXsDtyR8GQwXqn8o3EYnFNMwBnxXQNGGXxCM6aLxco1diJ97w1oU5Ox53qMe9HAGdjX4udoow63aLusk1W07pFNKNtfbHuSq6ZLpcpsqGLU2lQGKH1G3BMdLPNXGgmVGUW8M9yuMtR2B1G56gCy2ECN1Kh92akaVf3e6tnFliJk1N3Tett7MmzzaDmRJtRU+mEPEL9HXGuLVdiJiH0drd8o0lA2NmL0JYJKLd2yEwzkawn6mPEGp8ZfmJMSYAJAx95OrXhsPUd3Y+UJ8JcDlEfLb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:12:46.8768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af29d3cb-bd86-4a19-ecd0-08dec18291cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6173

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

Changes in v3:
- Move clock-cells to be the last property in the example
- use 2 spaces for indentation in example to follow the same style which is
  already used
- Add fixed tag

Changes in v2:
- Update logic without ZynqMP part in this file and have if/else only
  around min/maxItems

 .../bindings/clock/xlnx,versal-clk.yaml       | 51 ++++++++-----------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index 12d060c39bfc..b533ffd082fd 100644
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
@@ -50,40 +56,19 @@ allOf:
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

