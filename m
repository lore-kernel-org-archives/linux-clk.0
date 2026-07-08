Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012016.outbound.protection.outlook.com [40.93.195.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7FD2749E6;
	Wed,  8 Jul 2026 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516384; cv=fail; b=RqxQeGxKkUqcaf2u46FAUS4shqjFyAkQ+cjATASNnSefojgo6QtQKEVhy9ez2QNACmr3tfEeL0VjbWyXk1H5+HXDCOB934WAdVGv+oNTY+PmbQU8T6t/BnEuhl49MTvHTV1cme9NisLVp2a4itBDDOK8dchswbRdKnt/26RBCNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516384; c=relaxed/simple;
	bh=Vsm9T/brNLXLxkd5172XpaIeqHvJNceXTx6w1SA4Csc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=njAHT/su0R+l6dSuLFqfVPazhRmlZfCVG1FWgl+y0oji6ic/vNhDXwC3iJvsR73wdRwe+WYsl5zl7CMhYUf2k7RToQY+H/Qrm+tYz2+d/pbAfHissy+jwdhwRA2Pb4M6Xuu2baMfE8ODK1+ovIzfc/6dWX+DP1bEFgFKehkvTHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ovcLSFe9; arc=fail smtp.client-ip=40.93.195.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ovcLSFe9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHzmQdSD4XXXJ+/bME8+tQs4apNnDqWx4VvTn0uo4c/svgeu7MvK7L79eMQSpDdmLmvAErbBmchbsq02/K/vTmUrLA33DVTskx73ZBUDvf6Z5Q5zeJCQPZhos0JxBxAUaZhoHPv/VLX8gIGtXsMLpyFsIywBvf7yLwCJtMId7oDX3l1KFetZffoe46Rt9q8wumjMkANbBKpKKaa8TTC2xrJsQLE/WO4sJLsVygpq7vG602il7evsWx2JgubhlQdapWGxMGZxgGr0CbIyjo7YtDa/ASGljATCNjIzFCJn5g/NCRQ/xw+9fLGr8vBvKyLdyaAZlc9VO3u32ATpf+XyFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvlRkUKNn//fL4MKvKUdTLl8UAhyo2fVAN1iP9AOiEA=;
 b=pelSJ7sRaFEglB61YAPON/N7CPKp8tQqRg9iFdSSQmrdPj8HHjfxNtXRZCzWSPFvxgLPOTd6QxK9HK9VIFbLMPX4WClQ4/1gMK8iPXRM/D2Loq3ptLqtgX60gYLg+sqlou52IUImLSk3vQeNNWm59FkB4wfv4zbAbB6u7pEJfP3XAFX01u7Xc61C7kjy4kqjFyO32fX7SJtqF3d8HrtLRuppGWQaG2/+TlZ5ACQ2Ys8CiF2OaWDCS5K4mRKiS1lRYloXcklXGKJxwMP/nNfTfDzjU2/6cRGkkXWoEyCgzkiLQWxrHhxXj773wEGpZKSbK/wuXyvkLv4TDRk0W47VSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvlRkUKNn//fL4MKvKUdTLl8UAhyo2fVAN1iP9AOiEA=;
 b=ovcLSFe98DdCPXVK7ylq3/rI22W6/1TahrCMfhb+ShSldoP0WzzmBI0/X3nw0xC4+7cRcZVVRN5DlwzpOQd2WHLlYUUSepyv6VuO+QrP+yjJfe+FbtO+/E9GyXzNusi7v/BJsf06ebgIkhQh0OSos1U+aLXGkTZ9iSYQ+tRy5yM=
Received: from MW4PR03CA0165.namprd03.prod.outlook.com (2603:10b6:303:8d::20)
 by SN7PR12MB8057.namprd12.prod.outlook.com (2603:10b6:806:34a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 8 Jul 2026
 13:12:59 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::4d) by MW4PR03CA0165.outlook.office365.com
 (2603:10b6:303:8d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 13:12:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 13:12:58 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 08:12:51 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 06:12:50 -0700
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 08:12:49 -0500
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
Subject: [PATCH v5 4/5] dt-bindings: clock: versal-clk: Fix Versal NET clock validation
Date: Wed, 8 Jul 2026 15:12:25 +0200
Message-ID: <202e448e57cf979e1b5be61da0bad7778defdd4e.1783516336.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783516336.git.michal.simek@amd.com>
References: <cover.1783516336.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3789; i=michal.simek@amd.com; h=from:subject:message-id; bh=Vsm9T/brNLXLxkd5172XpaIeqHvJNceXTx6w1SA4Csc=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT5+ezlD+5rsnnQfeX9+al3+T8cajvjr7dML+L1ivjaK /fEjHSaOkpZGMQ4GGTFFFmmM+k4rPl2banY8sh8mDmsTCBDGLg4BWAia/0ZGWbuTnwto/iV9e+S NX8SLO///xv/rPl6mes8diV7mWvthS8ZGf64r/G89mypwv0HtWdtetcEtbq7SDc+2GK/6tndVTb 3r7EAAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|SN7PR12MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d58f13-1d0b-49f1-ea3c-08dedcf2a1ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|7416014|6133799003|3023799007|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6E5C1HMSbHDHjaF2AP8oi1k5UJ/ogvdfihySAkxEFuG6h9VUogtOVjxpv3gh4g9sTvYiAKaDjf6231fVz9yCeZg21R7HCFZwG9MYVe0eHt9MvjsNg2dAowN3nK4FOBxSY/rPoNG4wAc9w//HPHNBE+yZAn1IH0uJJvfFPraBCSxijQoxW/S3tW/R5soUBF/q/W4ZFzpX4jTjASQX/JPRBDX0ww+nM60iYohns+Z9WKzEPFnmkGEYBa0W7JjXajOYPMx5X2w1Xp0/aDWcvL4mGFAvw9f1Rhc2BPW05Ng6IIJI5x9ZxYyB1jchhUEhD2cLpNFSEHFr82HQpK2tUAUPvAMv6YWzM0T0FnJJ2uLZ+Y363tdIOS+4X3FNgwWZ/7iPJGOvhEux4z1s+kfazMlZpAsJhQvCmeG1vzwSecTUsWTPbT3TMlp8yeXVTQ5PyDj8DH/w69t1xVHXyKLtgndYnYkhf1VpPp9jSO/z79xA8KjV/WCJ4ZpjBYjBM2qVBEVd2TmICLv0EAdXvvsjTm8teJrthRID3NZIKKoJGrWaPnRWCUZEwuscEiNneqxCtc03BZ4IkoCux2dOeH9FDSl2ojlE6Voixq1UhwINlF2k6Y5ZP2Dem9G4O2e81nslD0rA/1KaDNEd0sTrBEZFJKofzz9USYHiedz/vWUa7eXLBnc+BdMl0hIVfT/mO53SyWS16Veu7yeiSfQhfEwqaJDw7Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(7416014)(6133799003)(3023799007)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NIBm8MeJyCMreW7WY95Myige4lkK2WCw+SlFRO90Y7fV84Zk4u1mMwy/U0eUkrktie7zN1k7XGot19hcfRjyXAN4UhtG8CrOPvwFT5+ga4zXXHrh3ka4nW0GiQ9BoL1BtDq4ZqPr2OHQ2bNgBI2KgdUMRFmv23EFZc26G7Yp+pbshvlpd8+C4akcWwCsWSCavZJIqIu5lA/j8gtpeSMq1VnvP6X/7cy9zHaGapwC7MrPd5uEvD+Zeav/xmqZPgQlw1yWRe1vTsSJI6E/t8E8tPHL4tKsEw8EHPc8Rdecv0wTHvKpEiDFS+UXa1sxVIyGNTtKhrGpTdEdLe0hEjdRTIgxqWHfHh6mVG7sfxp3yPdvvPmsoT+OjlOlE2naOdLiEYNZYnQ48g2l0UQmu2iEBn+VsHQyLkarJo3rmIDJZp7AD0k1S3naLHRrib4K0GbT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 13:12:58.4961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d58f13-1d0b-49f1-ea3c-08dedcf2a1ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8057

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

Changes in v5:
- Move change done in v4 to previous patch where issue started.

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

 .../bindings/clock/xlnx,versal-clk.yaml       | 51 ++++++++-----------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index 7b6d9ec83863..1f36ccc4cde1 100644
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

