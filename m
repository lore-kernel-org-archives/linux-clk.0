Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012014.outbound.protection.outlook.com [40.107.200.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE072277C9D;
	Mon, 15 Jun 2026 03:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781495343; cv=fail; b=nrHvgRqWDMnFOh3CXzOC+0QJEmM3y7TsdrZ3G3GROrSDGn9QHA+vFVE6a5aAg9WeNQfCH6q1yjRqBl152fE7T7PzwFG5n9u9uKyI35xunJKj2oO5IEWJ1ViWpU8O0Yt+q+F7l6vcXKGY3jGaa0t50PxvJb5oYmhgqK4zuHKEthw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781495343; c=relaxed/simple;
	bh=p45P1ktWN5KcipkqRq1rF1UV1jcpBaIqSiZTTI7sEP4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AxxbM37YvVrNWikgMpuENMWiszcjKZsacM/eCL56vUiOQksJL2RMDDckLEDwBRl0cp8mIL4fMxhiUxJB2XsNsr0PuK/OcvS/d0eDIE0XrwcLLUvPHDSm1ODDwYTkizq/uQqJRy7fClQcnLspNPBUOrybHMl0ZgN5CqvoPFlzuB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OUxkzhGd; arc=fail smtp.client-ip=40.107.200.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OUxkzhGd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlF+zOHG6HKWRXLLiF2TT4ZnKZjeUISEYPv0GPxnJaKfa2CnmP2KW4uX3Um2DWqh+pHfEGoIYRcS8m9MAhv5h1/gob+FzUUYj2UBCoftxH00mMcQMFs8Mc4nRCMgySrioMzipVFkD8XG377+/Z2yo3sQLEcO4Culhv8WUDAkBzH/uHAX3q5RbyjVSwCpEmLNMMKvHJQ9AP7uqeCWtEAeEtWaSFhNmORp4MjBAn1DyvRF1kYSf+UGr7S9570NLs5tCn8kLebQHVdrCM7iY7yLqIhfeuDqtEcDPlTbKkiSSwVOc3Rlj1ZOdruS8T6l7vEDPJLhLRvyALvhWAmfGi+IhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+nv+/L0CSmlMygHEgDFKfsxaaP/Pw1j53Pd0aAoVSs=;
 b=nc6mzBIclWQ1qkzz23qcC5vTOGwXewWqRejMpOLB2gu8OwNho20VETWh95IFoRmqrK0yP5Df1QnTbuBalYNaQD2LW1UTeAMcGSNG1tD+72Y1YBtFOtCd+AAUU/j3NnMNZwgbZZi5bD+VLNgHkLeVuIbhsN+34EYEr8Nj9hMgrrIJMlJpx2Bi505IRpOPLcxK8XN2EWf+9DFcBZi3oJfo3hWGK8qv+spa8OumxF5o5ieaiiOU5TZ04+Np9wWGrRQ6DuZVwO7upoX+7IEIlZeqwxKOhg44s1GXabTszK4B3eS6Mgp3Ebo7EL/BBf/fsHPGF8duhs0TF2fDB/4M6RFc0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+nv+/L0CSmlMygHEgDFKfsxaaP/Pw1j53Pd0aAoVSs=;
 b=OUxkzhGdNwapiBVodTy+Z92urlGqpPMJfxdzZJeAC4JYGXgisAKznjuQ6yePMwMIlPeboKTTLaRMjkjoVg2tVl4clVszT3In01R7OoiXMYFAYOUTbN5831ObNeU7pNBoKOA6CkDmEvQfFPpUO8a6AKf28GbmEsXVIhCJrcavYVs=
Received: from DS1P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::12) by
 CH1PR12MB9720.namprd12.prod.outlook.com (2603:10b6:610:2b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 03:48:55 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:8:451:cafe::4d) by DS1P221CA0003.outlook.office365.com
 (2603:10b6:8:451::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 03:48:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 03:48:55 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 14 Jun
 2026 22:48:54 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 14 Jun
 2026 20:48:53 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sun, 14 Jun 2026 22:48:50 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/8] dt-bindings: clock: clocking-wizard: Add xlnx,clk-mul-div property
Date: Mon, 15 Jun 2026 09:18:38 +0530
Message-ID: <20260615034845.3320286-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
References: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|CH1PR12MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: a3363bbd-cba3-4266-4dc7-08deca9105fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|3023799007|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gEwwdFGV2WnpQLJp6RMCI7gqDFo2vRBjcaX2sgHxEi14jrPLh0NoBRq5dvlIiHdo3X4QQvvEydUNaFuXg0R+QKVFjeTBTkMvX7x8G3O0EYmS4cOP9TyhOsBFNvYbr1KCtng4/QzdLmbN1zxE6Rqwn0HXNlRH5O5Xh6ObY1b47QW2hGH8Rs0b/Z8yGE1usb4C0yUKeJ9pmuI5F481miZ2eVgyXUhDoAKA2bC1w/DcXMOowvKveKQRNX4z0cP8bbPisZejbMFhsgV5anKV3OJbeORdwH+XkzIGPlr367Oey6R2d6I3BwdInRY3bMUuMz3iOrcvkbvMve5RuJ4/4RJC1E3WoXb5mrxdZZlRe+IqK17tAp5GhupBXnAIFs+zC4IOLu2759SzzfMmo/hLPlW3l8GwCNSgmKrGulFs+U7vY1NfMMF/ddcLOr+Amt0qh403O5zSosiCx5slk2V56iz+8m0nuA9Uqwu+anl94sRXeezVao/wCE8NEELEuEZOf9O8nY+nWDktD/hGw6hjRTeYd9/2dn/WN4j7olUwAXT04OTnE6M4uRIzR3mBtXU7/y2Zh/c9K/MPHk7akIKJb93X8YPS6VQhQTctii6YbpFvJ8LVfJDg7NP8GsUrUqL2lk+Ysr/AIQCWKvAj+2Gn0oSuMGS2tbtGC+b/DZPBGLs5RwvCd49FJwvWwYrLG1trLpcYnd1YwWp0fUZXFXVOvff1cHQYQjBeOiIxGFhZgBiL1HY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(3023799007)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fDSt8jHsaoHxPhxMUJovb049YeRWE7RGEl+rsnAMJJyAE6SBEQqQdg/5MziGJckhOsfwHxgTKMeoIKQBQ1fO498SCIiI0su/CBHgBr4qLHCGpam2UGfQ58D+ZXGlyW4Y4zNAoD7j/6N1tyBDGDStTBbgPovOAI4UBG9j/qJ6+Aozhz/RzkOt0H/VXBf2Bi09B4GBPKmzVYzSa89u++xUKdEYvJ7O8f+wT77XhX59TGCE1ZOCm2+Xe7hcUomVTUGA2jBgV8QEI3Ixkr1xstDMC3aVX0WztzJg8yPX8EA/sfevW67/hfoSjS/fxxpGir82PKOkquyfP61nxf9qICiKCTaRmoiMZmqXEQUU1y2IJReyTBjLh2VV2tv72kujFFPxMx8ROeK+tRNpSXXHhTGLdWH9fFQyVr3DaAWTwQvzQvkkXyLb1eZKY94GetNZ4yBZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 03:48:55.1939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3363bbd-cba3-4266-4dc7-08deca9105fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9720

Static-config MMCM/PLL ratios are fixed at IP build time, so the kernel
cannot read per-output multiply/divide from registers and needs DT pairs
to register fixed-factor clocks. Also add the tuples by pair in example.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 .../bindings/clock/xlnx,clocking-wizard.yaml  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index b497c28e8094..8316654b0a91 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -57,6 +57,21 @@ properties:
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
   - reg
@@ -66,6 +81,14 @@ required:
   - xlnx,speed-grade
   - xlnx,nr-outputs
 
+allOf:
+  - if:
+      required:
+        - xlnx,static-config
+    then:
+      required:
+        - xlnx,clk-mul-div
+
 additionalProperties: false
 
 examples:
@@ -77,6 +100,7 @@ examples:
         xlnx,static-config;
         xlnx,speed-grade = <1>;
         xlnx,nr-outputs = <6>;
+        xlnx,clk-mul-div = <12 1>, <10 2>, <8 1>, <6 1>, <4 2>, <2 1>;
         clock-names = "clk_in1", "s_axi_aclk";
         clocks = <&clkc 15>, <&clkc 15>;
     };
-- 
2.49.1

