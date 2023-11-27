Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TMKvcpRn"
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2087.outbound.protection.outlook.com [40.107.96.87])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192BD122;
	Sun, 26 Nov 2023 23:22:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnUJwvhm/GWvNB6A3QlTzbs/diPmOrWurvcHUAxw/wcU10dTZdbYfhAcAc1HGCe/4NCd3MCZJ3yg/dpboAim3BlwbuIaHV2Z6bsR1kUhxCaKmK2ZlQlNaCIqEGCF8HLDLf+sPZnGXx5y4T+NE1RIYW+FW2FOvfT5MDv9+2hCYFtt0YR2ayGazk+3ZmZlS5ehsRZkg/iMQGeET5JYkYpNCbSQsS3IysN/+bbJaoLtbH5VhwH3PcBi/FZk/75BA/LoLTDScU4LLBbmFSUErN0knxbmjxEa8/WKZnNRzIlpCRYm6rf0BOawrZlUU7FCJLvl0CU9/CjqqSCo7sq+sCr/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxENxPfayq6JAx9NIDH9hO3di9bNTLILsiP87SAFkKc=;
 b=kMve3GGq+TjGYIWUR1oHd+FcTPbIZyGupParEeuKwJH9T8Wu3Tn9W3S6QCW4K8WmNjD+GWCbKOdBlEuF9+ylfbkTZGUh8D3jjwejSRIn1+vGBxcKFE6nt7r5++wDIVv+a1Nx2FGNqvVauyIj+Yyf2RCK4MA/yDozoB3iXuSqndQoq8ECVTInR+KXqaJ15rcetU7GLJkEl2kngAB70CO1+yTLt0uhodQhONu85/yyk+tntHRs3+3Sx81vyGbTU+zKYkBh4FcuKikQwzG5UUAYKXujiYgfhFMS182DdE8JE3YeNgnQG4fn/XTI29rpKJRUOr6+ytpg/IQd/BViclP98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxENxPfayq6JAx9NIDH9hO3di9bNTLILsiP87SAFkKc=;
 b=TMKvcpRnH43Vc+5KhZQhHeTNnH+53nuqGClUQiabLGpg3BbLzZfB8Si19/QlGXuNNlsV7iS5gghTKoZBovz3bNZMJjn9O2sCOe7n/0fiNcqUN+RTN+mUpPxz08ro5iKsNIAiw9oeWp1DHAFvR/LHii9H+8woTmCFG2WaFgBjQLc=
Received: from CY5PR22CA0008.namprd22.prod.outlook.com (2603:10b6:930:16::31)
 by PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.25; Mon, 27 Nov
 2023 07:22:14 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:930:16:cafe::e3) by CY5PR22CA0008.outlook.office365.com
 (2603:10b6:930:16::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27 via Frontend
 Transport; Mon, 27 Nov 2023 07:22:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.206) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Mon, 27 Nov 2023 07:22:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 27 Nov
 2023 01:22:09 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 27 Nov 2023 01:22:08 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <git@amd.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>
Subject: [PATCH v2 1/2] dt-bindings: clock: versal: Make alt_ref optional
Date: Mon, 27 Nov 2023 12:52:03 +0530
Message-ID: <20231127072204.25879-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231127072204.25879-1-shubhrajyoti.datta@amd.com>
References: <20231127072204.25879-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: f6bd0663-2067-4984-7614-08dbef1993d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G/iz6oGLEpvxaYTKyD5lq+B2zfwVZDlUS65XHt9g7cNnL7YsXOGQcoSltNj4nAZwA7H1QM5Cixnfc4gDUNc4qkKeegm4l+rIdYpU4imy3JXo91SE3Lnm0hRgs0P9kwbarUfQxHS9mdqbs7/jI76jmPa0Ma/pXFCwqOQ4AoEkHDmJ72dtxeATuXMbwS2d0AyFDDLJV6QdLoQFPO3/67lIPmmDU1YgF5AMxLVF8OnVaAAzcYpxwwcxUfaXcyN3SEm5Hqkhxf/gChliFTL3oT118vzK3S/e3Zm4RMKTbwJ7Fq5NtMeJ4vlDB8f39nuGAgwheSbOKORa/DkfKqcHvwhp6vvJUO0S7WlCkrPOXpZKus395gC3ViHrdiuhunr0I7fGPL0wDcGPiBcHxxAOM0wBuoO4i0vwOP76a3iRsrCEF5zICMFpEwoXt7GcFhpoYd8yxqLNUI6p15zJky71fKua7ysDoze4+SgLnsSBgPhfr+m48F5lpQA+UbqusPXtjEf97GrVEjO27avdjeOz+2n2OdijYabjKI63ZYQh/FNQYWXfKOp61ri+rhKfElo5rlp2nT+4nHh9i6+hpvYsNn7NfRITfoSkYWW5oCKjEso3X3eqSaOkcqNyXJ2rzkmm0ypo6pzozRL5j6dkAVjHlt8tvoxT3aFQUQP5IaXD82i5OjEEwV9uP6kSkX1VLley+dMBpXUViSIM1ykxp/6/PJAqS9Dn7T41sd3iViPTXjHcpLkfycvBNNwNkYSuPlYbofPNdI84Whj8LVRDw+8wgssJY0ee6vJVbSB+k9anmoAufOxNJtuZhpCkvx6+b5YjXQSs
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230173577357003)(230922051799003)(230273577357003)(451199024)(1800799012)(64100799003)(82310400011)(186009)(36840700001)(40470700004)(46966006)(40460700003)(44832011)(47076005)(6666004)(2906002)(5660300002)(36860700001)(26005)(1076003)(356005)(81166007)(82740400003)(110136005)(336012)(36756003)(70206006)(40480700001)(54906003)(70586007)(316002)(41300700001)(86362001)(478600001)(426003)(2616005)(8676002)(8936002)(4326008)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 07:22:13.4839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bd0663-2067-4984-7614-08dbef1993d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180

The alt_ref is present only in Versal-net devices.
Other versal devices do not have it. Update the binding
accordingly.

Fixes: 352546805a44 ("dt-bindings: clock: Add bindings for versal clock driver")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

---

Changes in v2:
- Have specific constraints for versal and versal net.

 .../bindings/clock/xlnx,versal-clk.yaml       | 31 +++++++++++++++----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index 1ba687d433b1..bef109d163a8 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -31,11 +31,11 @@ properties:
   clocks:
     description: List of clock specifiers which are external input
       clocks to the given clock controller.
-    minItems: 3
+    minItems: 2
     maxItems: 8
 
   clock-names:
-    minItems: 3
+    minItems: 2
     maxItems: 8
 
 required:
@@ -59,15 +59,34 @@ allOf:
         clocks:
           items:
             - description: reference clock
-            - description: alternate reference clock
             - description: alternate reference clock for programmable logic
 
         clock-names:
           items:
             - const: ref
-            - const: alt_ref
             - const: pl_alt_ref
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - xlnx,versal-net-clk
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: reference clock
+            - description: alternate reference clock for programmable logic
+            - description: alternate reference clock
+
+        clock-names:
+          items:
+            - const: ref
+            - const: pl_alt_ref
+            - const: alt_ref
+
   - if:
       properties:
         compatible:
@@ -110,8 +129,8 @@ examples:
         versal_clk: clock-controller {
           #clock-cells = <1>;
           compatible = "xlnx,versal-clk";
-          clocks = <&ref>, <&alt_ref>, <&pl_alt_ref>;
-          clock-names = "ref", "alt_ref", "pl_alt_ref";
+          clocks = <&ref>,  <&pl_alt_ref>;
+          clock-names = "ref", "pl_alt_ref";
         };
       };
     };
-- 
2.17.1

