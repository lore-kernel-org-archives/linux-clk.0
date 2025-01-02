Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189BE1B07AE;
	Thu,  2 Jan 2025 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735835845; cv=fail; b=RA+4X9tvy93b1pX2kp5z5OF2rdqE3feUTma52fG5vdwu6eI110TuqDQUywYA82rxeyqvcQqT0IaIjVgAuJPR80W+jIC21a2lFLI5Z3WVWpzZ8+OPVQTqbEOrSQDueFlsCwjI/22EjktKJ0hQAm1IxkJxQnnAvCuKO4V78CrErUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735835845; c=relaxed/simple;
	bh=vAF4vHNLcHydWiuh0uc+LETAnwiHSAAYrHOUbrqI/NI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GgeBBOFj75oqs2l5qKI9enwJMdp6t+fQ/CXJN8FmXedue+XOynNBe9KtLFFfiTHS095PtWwfwcUlSusZx1PAnLQ7AwsfQKLHdNjPdlJBdlhzNdGb1YJYkL9jqnjLlmoCWBDxLjo05tvVRHRiC5hwbdyqfgaRnNnzm+6tr3yVDa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aIVgY3sP; arc=fail smtp.client-ip=40.107.220.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aIVgY3sP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRCdTcgU+dLwUCTm7Nj0oZoXyWRZNGiakGqaSM4GlC8r/7+rgmEFp/Bh39vcg2EaZ3PT8pWtNPik9nL4Ufzv5BgyhduM8xtAtXyWFtPVE2ztl8jwfIyACMLEdFaTjMmM6bWzxqcWraCwbGIv+y0/24IgdMj7dFOmv1OFRbw6lP69etY2W3VFdHRIJwd5mzk24N6BR7VYA3EbVE9EmF2/CxvLO4Il5H7wfmVphaKBtwF3gVTmXCwZVc5Ce/d5aHtuFnl+8ypsAg7M1+FfSFR1c/rmK1beHYP4HNC7oe00bn/sDxiyYVzY31iJ6i8jTm2/HOWVRm7wkxUuIGVY6isb0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SY4KGx/O/MepNYZ6gHzSA253G8TqC1Znfg4AXvMuXc=;
 b=qZklPamnxxZ17Z0KMFB1mRLGidZj421Nliyp5IiVuTxxC+MtrAYeaaVVNFlfHtluo/oyDDTyFbUfJuEl6eXgF7hRY+Xt5PlUz1uo6UK4q7VFZWpUtxYnspl5jvuOzBFuROQMt8Capz8GoHBqnFf3avArmEdFdgco4SuFFf0MHb833qc4CTf5awtunL2Zb2BiP0HGb/ggqgQOGJHTrEpAIgRMVMSoIjCjvYYEUGwvsvIfbXiaVVnbp+TKzax7fA5bBwh/BQNiRnZeBGVO4ejukQyS1NvQZ8JTIZQatE+o0VIE42c30AebHxCIcjFkaYnCCuY9aWKhjUKjuNQ/jGkq/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SY4KGx/O/MepNYZ6gHzSA253G8TqC1Znfg4AXvMuXc=;
 b=aIVgY3sPPS5w3M1OLCTA4FeVC23vSEAyf1LuDb8bgXY6bew7l1xh0nmqTpmtgXVa8R74q5WAjPOuj7Wyzheo+GOUA9m2WN58uPOpFFEjNhg/+4ruXxKlS6iPlnpcLfwLuepaSZIPIroYjdlatflbdqz3HFPGGzCjguStSbECTpk=
Received: from SJ0PR05CA0139.namprd05.prod.outlook.com (2603:10b6:a03:33d::24)
 by SJ2PR12MB9139.namprd12.prod.outlook.com (2603:10b6:a03:564::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.15; Thu, 2 Jan
 2025 16:37:07 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::bf) by SJ0PR05CA0139.outlook.office365.com
 (2603:10b6:a03:33d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.18 via Frontend Transport; Thu,
 2 Jan 2025 16:37:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 16:37:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 10:37:06 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 10:37:06 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 2 Jan 2025 10:37:05 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Rohit Visavalia <rohit.visavalia@amd.com>
Subject: [PATCH 2/3] dt-bindings: clock: xilinx: Convert VCU bindings to dtschema
Date: Thu, 2 Jan 2025 08:36:59 -0800
Message-ID: <20250102163700.759712-3-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250102163700.759712-1-rohit.visavalia@amd.com>
References: <20250102163700.759712-1-rohit.visavalia@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|SJ2PR12MB9139:EE_
X-MS-Office365-Filtering-Correlation-Id: 636fcb83-eb49-485e-b96d-08dd2b4bb276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mnau6rB+TcccLMxMXJdThkBVBkBN6QhnbHzxn0e+85qdfsmNeczg0j7TaN1A?=
 =?us-ascii?Q?vLU6GTviEKYWVY9MNvAdzbxt9x14HpPY45Puvs9FfhYQUbl4ctL03V46/C7h?=
 =?us-ascii?Q?Hw8ohwfXEXPOQ5X+rylknZBaxtmb7D0u2XIeq8JYBuGGQxgVyIibtpAm24hz?=
 =?us-ascii?Q?HGtkV2uT5jOIpIMfKZrQqQOKRyD2PDr3JZGEdm23zNvm0BM7qvku6PXVE9kN?=
 =?us-ascii?Q?pL3se2+mQPWlQ/DY7f6dnsPZS27QepiFzi5Jps/swjxhlzClxVRHS5HQ9rxY?=
 =?us-ascii?Q?Yb+6gMfHzv+JNiXju/Dql6OPjjcFbfFDaeIUq/J5m4709Cv/vViYW66BVO/b?=
 =?us-ascii?Q?8mZY9JJrQlYwYwi0PwiIjyZzkYTbcrKg+Kjh+Es49HWG9I36JXkLiIksogBR?=
 =?us-ascii?Q?pMdVsHuBOLxl/dyJBeNS3mcsBM1ypn074wj97pPmWxVSsQS7KD3hgYD69Ewa?=
 =?us-ascii?Q?IPef84Dp7aKSB7haqi3tCvr5PZNLiE60Lsy/So/Zxt1IxXkDQCNCCjPFl8S2?=
 =?us-ascii?Q?Xeelaf7MSowfZ5UFO00MykNglLgHB1u6VxOvnsGxJlZL9kCquz4DOuXK8bMz?=
 =?us-ascii?Q?3uDqPDVpmDk8wTX3fgmNQKHEhmIRwpPqwtqtM6PLIxlTId837OAcojzgjIwt?=
 =?us-ascii?Q?+k+jeUP/OQJ2caOlVm2AjAka+4UkUYdU9fgrwwOVlqeOafu+qa18Hyt1j5wT?=
 =?us-ascii?Q?Q+PIuTjorkyegKhcJFNkEpFIxR9j6L50vpbR+7Sh42OfoSpGh9mCQVfaq9Zz?=
 =?us-ascii?Q?k9eve84+/nBul5YBzEv8TzYE5T4GG7kbK6JCXeOSWgGAeeriFNrr2mHJwANv?=
 =?us-ascii?Q?FaXHZjXZYCJyF9xGDGr7tK2640nxZHKcAYUAfR7SelxVWNrvealVW89lsEgx?=
 =?us-ascii?Q?onPkhZQCIKjuQ/AMxlFvfB76FbXhAu+amk7KKKa5z4QbnqSX916iU/G/SYvG?=
 =?us-ascii?Q?Y4/YXOu0iMVQK3uYrbewLUIcbc1y7xKngi7llR6DwYGyWaK8YZ7zAE1hD/P/?=
 =?us-ascii?Q?EvWFTc/WkIu6V7QZUAJ8wqBlHVxxH345rNtAxRPKdNxnWPbgycEJUxfR20TR?=
 =?us-ascii?Q?2pH9g9Tn9TiVGJhtAQNySDGNKmcAHVVt645guK3FiTD8LeBVro/zG5gKMa86?=
 =?us-ascii?Q?IMco+Jf2cGvi9N/DAJdLPIifOkEVfhWE63y8Y2TS2zbHut1/3weDkUltRMJH?=
 =?us-ascii?Q?mks6cINCN0iks8LEq97cLIRYPV967njx1ahplapNBRMOPKhy/OcMlk7l45MI?=
 =?us-ascii?Q?k6pWJXJ/dCgZOCMdaK5tzj7lYDN6n5/Go+a+J06AG0NCR3A+y1SUFgBhtlIV?=
 =?us-ascii?Q?0egwOoN6d1+cnvgDxDQQtJSjzR5DwBIC8mBTMNfLED4acFXGPnpN+rIYpxnm?=
 =?us-ascii?Q?k1b8z9rE1LfZJAmV1tCv8B7z0lfAN2ETdPYxTr6BBO9S2JyCSl++TfudlvQu?=
 =?us-ascii?Q?EPvl3vGKfVicKlkqWSMfns4hONUW/JJE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 16:37:07.1426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 636fcb83-eb49-485e-b96d-08dd2b4bb276
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9139

Convert AMD (Xilinx) VCU bindings to yaml format.

Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
---
 .../devicetree/bindings/clock/xlnx,vcu.txt    | 26 ---------
 .../devicetree/bindings/clock/xlnx,vcu.yaml   | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/xlnx,vcu.txt
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,vcu.yaml

diff --git a/Documentation/devicetree/bindings/clock/xlnx,vcu.txt b/Documentation/devicetree/bindings/clock/xlnx,vcu.txt
deleted file mode 100644
index 2417b13ba468..000000000000
--- a/Documentation/devicetree/bindings/clock/xlnx,vcu.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-LogicoreIP designed compatible with Xilinx ZYNQ family.
--------------------------------------------------------
-
-General concept
----------------
-
-LogicoreIP design to provide the isolation between processing system
-and programmable logic. Also provides the list of register set to configure
-the frequency.
-
-Required properties:
-- compatible: shall be one of:
-	"xlnx,vcu"
-	"xlnx,vcu-logicoreip-1.0"
-- reg : The base offset and size of the VCU_PL_SLCR register space.
-- clocks: phandle for aclk and pll_ref clocksource
-- clock-names: The identification string, "aclk", is always required for
-   the axi clock. "pll_ref" is required for pll.
-Example:
-
-	xlnx_vcu: vcu@a0040000 {
-		compatible = "xlnx,vcu-logicoreip-1.0";
-		reg = <0x0 0xa0040000 0x0 0x1000>;
-		clocks = <&si570_1>, <&clkc 71>;
-		clock-names = "pll_ref", "aclk";
-	};
diff --git a/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml b/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
new file mode 100644
index 000000000000..bdb14594c40b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/xlnx,vcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+title: LogicoreIP designed compatible with Xilinx ZYNQ family.
+
+maintainers:
+  - Rohit Visavalia <rohit.visavalia@amd.com>
+
+description:
+  LogicoreIP design to provide the isolation between processing system
+  and programmable logic. Also provides the list of register set to configure
+  the frequency.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - xlnx,vcu
+          - xlnx,vcu-logicoreip-1.0
+
+  reg:
+    description:
+      The base offset and size of the VCU_PL_SLCR register space.
+    minItems: 1
+
+  clocks:
+    description: List of clock specifiers
+    items:
+      - description: pll ref clocksource
+      - description: aclk
+
+  clock-names:
+    items:
+      - const: pll_ref
+      - const: aclk
+
+required:
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    fpga {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        xlnx_vcu: vcu@a0040000 {
+            compatible = "xlnx,vcu-logicoreip-1.0";
+            reg = <0x0 0xa0040000 0x0 0x1000>;
+            clocks = <&si570_1>, <&clkc 71>;
+            clock-names = "pll_ref", "aclk";
+        };
+    };
-- 
2.25.1

