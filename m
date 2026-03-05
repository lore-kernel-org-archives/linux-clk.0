Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012042.outbound.protection.outlook.com [52.101.53.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511BF3CB2C6;
	Thu,  5 Mar 2026 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772725223; cv=fail; b=uvWp+bgPDHZqbu4Io1vSHedn0XPXqpDQBmHqyQqS6jm2bhOGog2NvDIn+TOUhXpzXmEPuTI29cjCnV9C4stWebNPKE6PGZjn0555/ks8o9js97ccDMnKJTZLKHipw7q1UjTOVHHqMMERoJ3d40h1YlI3wnSkI4QIx1vDQZe1k/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772725223; c=relaxed/simple;
	bh=5oviK+YgboqMPFWnbhTbt4Fm1XyOw756fvygEQc4nSY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nSB7MRrEazIJh4q6pPsoOvcuZ+iBZsaG7zSMBMnZBwGGK9pnhxHW0AXuwG9kVSVniCCLQzp81uDsuJDsn6Wr3BLPavHce3L4+mv4eir3iqooiutpx264xS6Hy/lhHWp2YDLsX15tXfqxS98t6DetwEeBQH1FxOIQz3NiHZJk9n0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LvPslR1m; arc=fail smtp.client-ip=52.101.53.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LvPslR1m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ly6ZsUW6mKrEiuclTHXqgXeJszejEDOt81WIsH3IOacJc2nHMSSqXNNX8vPa21cXlD+VeWlAWJ3RxvwOJ9UdhZ09t93vBV+ksfQJu7u3tXcGvH+53bA7zE3+JPIlCwaivEVWitNixdkrlCezMARHozk1kYxDt3PaHG+ROgR9p5WD5Q71Gp9E8DbPMyQKTnJO/q14K/y6mbER3GewlzOG4sUI35teCR/J3ui+XuSq+WmWvBzkt+pHp2j/IubV8xgXzI2Z27g7lSgBwh/W43/fCkck5CpFDoih+dynQN+tZxPvxbulefr3J1kS55XWR1CUYwwV1Pkug7qZol8bI4jngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y30Oz6fxvnn78WvVDR9+hhSUDewtOjbS974gdcF+CH8=;
 b=ZQ9mECuucm55cH9UqDsONji3hYMBV3jV+t8Ey/xmKQ/jyuG9D4I8LFStht9fPtI98eK8B2YKV0iBhRvUFPDK7XGkZ3/KaiGZu4nKZZXheafXQ/srkqK6rCcYV2HZENA+71Yf0jX9+GEUhT7V8LjnFVcdwtuihfGdZEe5LAMPglGwLvOZEmT3+pj4hsnEG3EMv+xfrjOdWSK+TRNh4PXeZNL+p9IJWfPV0v4bKYs3AmL52KhZrZfgWdaHE1aeSSlNpHrK+abuQtkCuW8igTn02LmcjFW2apHXt4opslxkwGIxzxn8T6E/WhKU9Soq6ZVyn5vHxoujQTbWjM+G2IR5kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y30Oz6fxvnn78WvVDR9+hhSUDewtOjbS974gdcF+CH8=;
 b=LvPslR1mNI8frdnWqOK/J/ukgS4cho3cPiQbo+LvbmVeSxXKRUqgXgWCpHPDDtRXWpescpAF2NCm/D3YJ/kz8RNfm/RuMrD3xfFwmTxFtRQ1C4z4Hp0G7s6njTUfRURz0HVFgZY9cGbJdE6vemfkND6MDkrHY3rHPO9KHqn34Bc=
Received: from SJ0PR13CA0231.namprd13.prod.outlook.com (2603:10b6:a03:2c1::26)
 by SA1PR12MB8162.namprd12.prod.outlook.com (2603:10b6:806:33a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 15:40:16 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::58) by SJ0PR13CA0231.outlook.office365.com
 (2603:10b6:a03:2c1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.17 via Frontend Transport; Thu,
 5 Mar 2026 15:40:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Thu, 5 Mar 2026 15:40:14 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 09:40:06 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17 via Frontend
 Transport; Thu, 5 Mar 2026 09:40:05 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Rob
 Herring" <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: clock: versal-clk: Reorder if/then conditions for Versal NET
Date: Thu, 5 Mar 2026 16:39:49 +0100
Message-ID: <7241fe512ff677f7aa5b7212ae4056fba01f1f59.1772725183.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1772725183.git.michal.simek@amd.com>
References: <cover.1772725183.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3130; i=michal.simek@amd.com; h=from:subject:message-id; bh=5oviK+YgboqMPFWnbhTbt4Fm1XyOw756fvygEQc4nSY=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWSuXHyq4MWjBV4iHr3msZ92S27ke27ymfPBLTGu19NEi vu0/G2WdJSyMIhxMMiKKbJMZ9JxWPPt2lKx5ZH5MHNYmUCGMHBxCsBEFr5mZHhsKLvjgIVSseLu h7xSBzPEA49NOrHjyT6ppbt+rzrT6HGdkeHZfLknN54vm/d4QrjCVUuW59msB+e0vm4XXt9n9yN itxITAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|SA1PR12MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: a02291ed-27f2-477d-c913-08de7acd7ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	VbbG3nTk4MrOiuGADqEkarHOSNlg/b5LuQyp4QumujCkYxmrekEQc07+u2j+hHpc6xf9Fn+IsBZildRSK+yBcjM45oEHekwwY7ge+lzzeNjVHY2jadkkYsDBZJoFoTB2RyQj28PquDUL1Em9PTpdaxTHFZdh8VnD2mlKfjTltBZ6jMGf1vXmdBIr18iKOa9+FUJKhpyhILZKpke61RklhAw3VD9q52Cm9k5LENri+JPIIvvOvy9tGc/DAxyxuMV5J/szdnsMURGl/u5Gm6kyPCEFb07RgYXa+4Qgz9PMjMrGvte3VerbJ1YsnDwTdX72KOXIk//3igoXr4rvt2JlbRDARrLDOs6R6g9uUDBDV7JllMrgm66bFAlo7G2gM9Ifr3X+TxO71Akgw40DDi/71LVKSaPY0MHqd4uRqGNerqXL2x8HXQ4sywQh2APBHZETH1SICzKhQzCY9hViLUJ1CWgmyM3RQsjRow/gAX4Frzsn5R6F6UOAZvt0i319S9xePZQEVxtjJ9RmynbDwovAWiJBsk7kOt4J8pR77x+STrbBUqpofx0CC7j3r2yPtWn6OEP3bRsNRKRZGIrLbLYRYzo9T4YnGZL9hmUxobo+iMRJAgx7Ys4uhdzDJRhYwuqbVuHzGSlsWNgJxv6WiR4BLqSYhbh/oiNmXgWqtj5Gnkv8RG2TeQoiyTDFzFs1J/uz4VzTPuWsqmmXognX/teWdBPvJLSTvqTOFlF0P5I3b7WFnyP/weO4cCSJr0lYEF38WQqORZtvK0J6h2Ey9T/yaQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rFkWYGUMSn11iIU7UKh1n95EAtHrJGTaZFhDkC/q/XTt4sBfeFDvLV5QyOZdScdT3pFOB35sPHe9trkqvTKD9UPdktTEM+0V8cbmgXFkiOAGqbSbxLJqV5OWSu7lQri72F9Ncf2Tzgqj4FVjql1MyGiCUaUCRGr76GmMaEeytZN9VI7ofz4w0V3o5Gs2Ydq/mBLRQCW6rnTKWGXpekPJ/DIFE0QdLJqZiC3XIqSeLePylDsOUpRZiMJ974Jhssvw6Mq51vOClnEzhWLuykVVyThNsX0CJVOIYScpugJnqNQIOjNii4UqV5yZB13Q3+6P/ejJLrFkbC7YKMYoCz8/z5DFfgmYBy8v9TS/6we++u2gXKCXPrjxBzvzjMBIZlV8WgNT0Hm/VCKgOkRjzgpBHqFm+XYx8EOHHvuLUPQb+yBIY0XjdoBeFTiVz5mW7zn6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:40:14.3573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a02291ed-27f2-477d-c913-08de7acd7ea2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8162

The Versal NET clock controller compatible is specified as:
  compatible = "xlnx,versal-net-clk", "xlnx,versal-clk";

with xlnx,versal-clk listed as fallback. The original binding had
two separate if/then blocks - one matching xlnx,versal-clk (2 clocks)
and another matching xlnx,versal-net-clk (3 clocks). Since both
compatible strings are present, both conditions matched simultaneously
and JSON Schema applied the more restrictive 2-clock constraint,
causing false "too long" validation errors for Versal NET.

Restructure the allOf conditions to check for xlnx,versal-net-clk
first. If matched, allow 3 clocks (ref, pl_alt_ref, alt_ref).
Otherwise fall back to the xlnx,versal-clk case with 2 clocks
(ref, pl_alt_ref).

Add a dedicated example for the Versal NET 3-clock configuration
and split all examples into separate blocks so each compatible
variant is validated independently by dt_binding_check.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 .../bindings/clock/xlnx,versal-clk.yaml       | 49 ++++++++++---------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index bef109d163a8..65d926d8f464 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -51,28 +51,7 @@ allOf:
       properties:
         compatible:
           contains:
-            enum:
-              - xlnx,versal-clk
-
-    then:
-      properties:
-        clocks:
-          items:
-            - description: reference clock
-            - description: alternate reference clock for programmable logic
-
-        clock-names:
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
+            const: xlnx,versal-net-clk
     then:
       properties:
         clocks:
@@ -86,6 +65,23 @@ allOf:
             - const: ref
             - const: pl_alt_ref
             - const: alt_ref
+    else:
+      if:
+        properties:
+          compatible:
+            contains:
+              const: xlnx,versal-clk
+      then:
+        properties:
+          clocks:
+            items:
+              - description: reference clock
+              - description: alternate reference clock for programmable logic
+
+          clock-names:
+            items:
+              - const: ref
+              - const: pl_alt_ref
 
   - if:
       properties:
@@ -135,6 +131,15 @@ examples:
       };
     };
 
+  - |
+    clock-controller {
+        #clock-cells = <1>;
+        compatible = "xlnx,versal-net-clk", "xlnx,versal-clk";
+        clocks = <&ref>, <&pl_alt_ref>, <&alt_ref>;
+        clock-names = "ref", "pl_alt_ref", "alt_ref";
+    };
+
+  - |
     clock-controller {
         #clock-cells = <1>;
         compatible = "xlnx,zynqmp-clk";
-- 
2.43.0

