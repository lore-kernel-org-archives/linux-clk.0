Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yAnNKCCh"
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B341B6;
	Tue, 28 Nov 2023 02:43:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhLi8h+8KgO04pf04BdCVhDXJoMia6kbDzUNIKfsaF05F/P1Nv6XZMZqho/TXn6fDoNSl1M7XOuNy/uag6buq2b9Vp82huBRoI/xA/105v5Ae+kmVnP303Ih/Nnf+NvkF67isZSDhqGNNRI2NMtJ8dLynUrODZbEJnX5L6Fu3frgmnXrC+ZaLXe1IoFHkDPfeaUAPljpJ9j1IT7ZvONK5n+4iZ5mHvHdP2428k4BWIteKHB2CThaKs6+6Vs9I3aXX4jjNv2uYSBt5UttcgLh88Cc/zE9iYdMT04+vmTFSqhATL5YapsZM3Mcm76AdF4o6NTA8j7MXyyrWdS4bgO20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXld81WI7ECI/GYCbscrscETWtkoJwrEluUINEFTiIM=;
 b=hH+Whik+aMG3DPuH1nPf0C+BP8Uh8iMdu8APY2YeFTSMeeRViACF3MJJtdcwgljEx2M+3L5q1CT62XHQmESYxck+0VSK3xwOUVWd0xCFGVEmEKbsaoect5HRwnVEFV+IOlzCLBb6OSZCI3K8V9BwIhdlEHo0MgwLD9bQWo6l3fH8w3MWrsevIsAcSk4hMV4I+lH/J5bLb0gmjoiOytVwnO/BPNHEjKaeylUM+Yzq/PxTXTVqrM8i/FpCXm0pGerLfRXgjSq2k6qYo0f3lf06NUno5Pqh2G4p8W40U5fugw5ygDX4nNy7vCb78kZmwvOUKJ+aYqCUhiJuSeQzEFklYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXld81WI7ECI/GYCbscrscETWtkoJwrEluUINEFTiIM=;
 b=yAnNKCChDz5tSHJYMEfwtww4LrV81A4FQ7VydwEGMzTAxOphEaP0MkKFMFXvp6TkXlIv7x7NBZZanYhc+MYxQCWRiPlchCGNbb+472dluSWIUMItpHgvQVsC2GIZX5Z7d1eQ3hpdavrim+8vvRfXC5bPmAnxXDcO8bMeaTaqYfM=
Received: from MW4PR04CA0219.namprd04.prod.outlook.com (2603:10b6:303:87::14)
 by IA1PR12MB6602.namprd12.prod.outlook.com (2603:10b6:208:3a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 10:43:53 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:303:87:cafe::b9) by MW4PR04CA0219.outlook.office365.com
 (2603:10b6:303:87::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29 via Frontend
 Transport; Tue, 28 Nov 2023 10:43:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 10:43:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 04:43:51 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 28 Nov 2023 04:43:49 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <git@amd.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>
Subject: [PATCH v3] dt-bindings: Remove alt_ref from versal
Date: Tue, 28 Nov 2023 16:13:48 +0530
Message-ID: <20231128104348.16372-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|IA1PR12MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b48b819-d4b0-4a60-bc86-08dbeffee9c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iN6GTzN5tLz4yDl2ZL9fZhojeAHb8hNUF1Aie5hiQYzfo4i9FiMBTaIhzPJrizh9OAzFvObRjmhX9CFLanTd+URnJR6JXRxtpf4fPxcoCQCv1uduYeitwCdzA6SNVc7gqrb3r8PEYIDi46sIx0LghW3riN8Ysf/r0w5R/7jiXOrpcZCK7nEPgT12WLyMlODmybZ8mtcoloklaQipVUVR7nB95+RAPQesVSi7Du9I4EQ/IhT/Sj563R3uItu2GxaPs6XFyMZ3veW25l9eCumTMTWy51GlWJUbgAJqp4C9w3uvI6iQ+KNN0rwvocDPMsdwObYZcLx+1+24daq4cZKhmB1IrxqrfnP4mqAwSkoRx18mMPR7S+7b5lRwGrDm2B9t+S9NMmvvwn5G7FkKr2LfgiXrVWCSlLaWMvtJtsrkvWtGoqT8h95Vw02X5rkkphTfEfV2PzRfyQjAEGyBUv8aW+o7QhhY5RRKHsj7QT2Ty9Hh4fRcZlnlDc3PCvSCmW1xrVbdmz7AbD54ICxD7xk/c07err0uzGwM0SoowVIaGV9AIf+IXJzDbCd7l+k/FKOgdcOXoXvE0RR1UCp1qklXN7j/BjN3qHzmY5klDQKqX73Y42jPaHh94G7aGX9bedum9zxoo3/ZZ9ZYO3WGOMobdLSCvFSIkt3po8y5GGC1hRioePaVZBdI2Y0xDN4rXjYQkBtGcnVbZVUTbt+6vB98U/Cls3P7+AKOHT6/PAIPwVi8ymY4iLiNDAaR1ussNNgoLcwrKjQl3e0yXA/Wc44HumBYmNml7CQ6AnmLMa63n202AAPfDTEaiwshGOLV/UbC
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230273577357003)(230922051799003)(230173577357003)(186009)(82310400011)(1800799012)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(2906002)(44832011)(110136005)(70586007)(41300700001)(8936002)(8676002)(54906003)(316002)(70206006)(478600001)(5660300002)(4326008)(1076003)(2616005)(336012)(426003)(26005)(83380400001)(47076005)(40480700001)(36860700001)(40460700003)(81166007)(86362001)(356005)(36756003)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 10:43:52.4277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b48b819-d4b0-4a60-bc86-08dbeffee9c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6602

The alt_ref is present only in Versal-net devices.
Other versal devices do not have it. So remove alt_ref
for versal.

Fixes: 352546805a44 ("dt-bindings: clock: Add bindings for versal clock driver")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

---

Changes in v3:
squash the patch

Changes in v2:
- Have specific constraints for versal and versal net.

 .../bindings/clock/xlnx,versal-clk.yaml       | 31 +++++++++++++++----
 .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  4 +--
 2 files changed, 27 insertions(+), 8 deletions(-)

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
diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
index 822864488dcb..8e584857ddd4 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
@@ -95,8 +95,8 @@ examples:
       versal_clk: clock-controller {
         #clock-cells = <1>;
         compatible = "xlnx,versal-clk";
-        clocks = <&ref>, <&alt_ref>, <&pl_alt_ref>;
-        clock-names = "ref", "alt_ref", "pl_alt_ref";
+        clocks = <&ref>, <&pl_alt_ref>;
+        clock-names = "ref", "pl_alt_ref";
       };
     };
 
-- 
2.17.1

