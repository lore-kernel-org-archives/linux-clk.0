Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57611531C8;
	Tue,  7 Jan 2025 04:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736224856; cv=fail; b=a8jEWdS3Tq+KT+XHwlS0Is5HMjBqaBvq1G0J4v92e8P1Vh9ABU3LH1Z6FHb69mwxbz/3P+SqUuGNkFD9tVVZY6NxUgSZ7ul1jHFTMYwbdk2oZQMGqxjGDBlaHl/+sOY9Qs1AUTG3A1Dkst6jzUs5NY7ql1PC9QbJIIcyl6ccPtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736224856; c=relaxed/simple;
	bh=WxZUjbUXVUwGsZIehidKhp2FWQGzydWQtGdO5XZkExY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DHiFUiyv8b6tuIkwaxEkeSrASC4mbg/6AJVuhJzT2LRvtRIS0GhzW3QBGwmCnw/P8J9syEwW0RH3DQAWrJhgsZqir/xdA1t7j6jUYVme4OJ8zQ8wqPanxRuo+gz1l4iCcpU+2XWQWgLfrTsuwMVgsMAu82FRhyzyJgwAMHaApAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=l6XbM1RM; arc=fail smtp.client-ip=40.107.92.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="l6XbM1RM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzpAPMTVDxIV+TjlOTLVgmmBL33tCcW3GaonbHmOJOwKg8tuvCfPTuSj0kLAWQW5A3tqyUJCZEaIcOBdAfELXfFBchBs1fco8ZK4JpysbSJB54XAPkSyH4U6fB/n6qby4RyZ3LY0V7TKzeqyVnJqm7nMHAedEfmyl4iidudnRkyMnm1sR7fp0G8RQx6kGfEaePp0iWrNP33AW2MzuibxxISHX0LjWyEQjxmN5yAsNFAkFMT8qu6xLoyy2u9ksE5NBrmH/di/YYPyQjqzrFL4jG1SJmJWCqPxh8zV1bnQoZ9xNetfRM68fvfAbU3RgUU4CBZ8kjSk/9lGn87gvuusuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jNb2+2Q4JO21YSPwFOQvb13LFZqcxpDBQ2734aEJ7s=;
 b=bKo8LxjHkUYjuxenJRjW9A4MXcXH8hnWSUreBviuoXtcYo9M8S8yyG8y1T9tJxwTjnhXQKtZUusTs453KhyON6+5m7rgDj2mc4u3A6zdf2KMMLFRskyhKjfkMP/N5uSbvOud7XK5PtGraicDgcfqjsEOBj39S2M2YT48ykaWQ9qHCqDb3NrTinndidEsQA33fF47JhxxuijKvNFbeqdVz5/C+zms39vXS9AF1XrmLFK5Nbco98gyMelumPN7ZusqpgCVGZffD0FpWcKO/xgLoiCUl7xOLoj9lgC340lkUHnsYB3arAb4jol4TjiQROhbAeJRMrtsIrMk3ypMUKO7lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jNb2+2Q4JO21YSPwFOQvb13LFZqcxpDBQ2734aEJ7s=;
 b=l6XbM1RMLW0UEhh6sQCnDXGZuVVkAtcnqGABLJ5r9C18BR/u1lVWleSIXbNzSxYAFKMoF+GS1/KTp8u2GQdoPfomnhiOmXJ7I6En0jpHepiEQeubI/88jPJ08/s84pl4TjqzJb+0rO9gcj+YNFGk5G3poZ0DRdkXV89j1Xtuu3U=
Received: from MW4PR03CA0293.namprd03.prod.outlook.com (2603:10b6:303:b5::28)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 04:40:46 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:303:b5:cafe::e8) by MW4PR03CA0293.outlook.office365.com
 (2603:10b6:303:b5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.16 via Frontend Transport; Tue,
 7 Jan 2025 04:40:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 04:40:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 6 Jan
 2025 22:40:45 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 6 Jan 2025 22:40:44 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vishal.sagar@amd.com>,
	<michal.simek@amd.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Rohit Visavalia <rohit.visavalia@xilinx.com>
Subject: [PATCH v2 1/2] dt-bindings: clock: xilinx: Convert VCU bindings to dtschema
Date: Mon, 6 Jan 2025 20:40:37 -0800
Message-ID: <20250107044038.100945-2-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107044038.100945-1-rohit.visavalia@amd.com>
References: <20250107044038.100945-1-rohit.visavalia@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: rohit.visavalia@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: c1a28b37-4e54-4d16-741d-08dd2ed573b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sYLrYbmxPi+zTANYy8mhlm2er6mbu84G+ZMQ+u0IIyG2ba3DnWHU7jp8h0n+?=
 =?us-ascii?Q?IUlYy/HS0o+QJuRUG/FfMRI/zYNKYKnWGhGguc6+9PFAYSz4hhnsR5Hyyqdb?=
 =?us-ascii?Q?YvUYVsR8pSIPStv6o2UTfoVQ9THpQxockPgqWfy2YDWfuDu/XwkaKoaYJj5a?=
 =?us-ascii?Q?hzUynKYyWmNYyldXh5WXRVlNr6HBflSlDLvBi7mz4oZeaJKeW27MAxcjLnv9?=
 =?us-ascii?Q?CHOdrLvp6KKTXiS6ubxhB9T2T2jkUxfOOYA1N2VWORaubCqUVuQAj0cSaTwV?=
 =?us-ascii?Q?b6GvMqouh5IKrHPNTASrJYwhxaPVafY/44rHTJbAG1jmjsT/w/orOvla9V4x?=
 =?us-ascii?Q?vwh0V+wV14acb6dWjvf3/Lpfrn1x7+BTJdos89f8J0ry6Ntq+Q8hfiB2Hmkw?=
 =?us-ascii?Q?huSGrpy8dOP4cGI5E5yCo46h4FL5T/PT40hAcqCwKRWa2PzG5Z2GZX5ODL4f?=
 =?us-ascii?Q?T4Ti5bXouXxDoDuvNcI0Zl0ctn1d8W8vIDHGKnNDf0nFnUrPdLeVKUPFBanu?=
 =?us-ascii?Q?PwxRpRSJuPQKGrG+CAgt7eGTBYiUYKiaEd/2Crho4z9nhxI+2bk9QRLoTeuy?=
 =?us-ascii?Q?yiOAZLAlFXRxX6e+sxJi6Pmn5+ma3su+gNRNPrLdSVUS52Y8Yi0irrBFU4Br?=
 =?us-ascii?Q?9D4huX6Fh6tZEZPyle/TxxbSsph4YfBMlXOY1AQ4jClBAhuH8Qx7g+CJFWRz?=
 =?us-ascii?Q?SlFBfOztC2UMACll8cqYwFffxrI7t4fsy2trYk19wn17zSNkhng09cq6yPWV?=
 =?us-ascii?Q?Un8zOWHUn3261aPS1GHDCmPuoGBvmZ/zE0uUkM5T/n8JIt+P+/etRAhbuD3X?=
 =?us-ascii?Q?O/K9yHMJ3Xp/C3i4ObmIpBZKzZwPzWWV7UEV9hjfekmSH/Tz1Ic1KrBrWVkt?=
 =?us-ascii?Q?eElzGEdlKZgzTxQSzvdOvtqef3m1crMKeS0SoIm+X25caov/sxyh5Nf5oOGX?=
 =?us-ascii?Q?Wp8ZGKyoZoM/8beDnONMKt2Wpz86FkqJGSBgP0yb4bDf9rArTY4n0KbREnlR?=
 =?us-ascii?Q?Dnm41q+BymMa+s0OVzz2lmi/aFJNQsrjrN7WF3B0UmMH2FGE2z8s9V4DAu1U?=
 =?us-ascii?Q?dQ10Xu19uaEt8rkRIuzCoYP+inrqH5ucUiqXRZ19Nec+L63cU2pSTacLDck1?=
 =?us-ascii?Q?N2zmb1eUQKkXev1SraR8XrW2VOBY81GAQLk6ZCiF+Z5nWnTi0m3rSm4Qc37u?=
 =?us-ascii?Q?72Rn+KcyXG/tbt/2S+JK83j1z5D28PpS4U9SmpbhETh4GznOiZxuXlAbEdUX?=
 =?us-ascii?Q?6yJCjN7Xmveyv1IzhTVPIGC2gtaPP/3unY/xUj0U6ImmjM2PCesCxJEM72u0?=
 =?us-ascii?Q?Iqyfzd7eaOySx2zusBuzpjKaH7OeKaTwkpHb5DT2nSpZ3bpp9jDgvIfWJdSW?=
 =?us-ascii?Q?eT3VTVX3C94tDL+2QaNOH2VrI+wnaT4Ec8cY1xUJiLWDb0pm1NIAOuW3bmIu?=
 =?us-ascii?Q?loVPDjWIWhqS5L2AI1TR1ZalTxsUZN4P?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 04:40:45.9033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a28b37-4e54-4d16-741d-08dd2ed573b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375

From: Rohit Visavalia <rohit.visavalia@xilinx.com>

Convert AMD (Xilinx) VCU bindings to yaml format.
Additional changes:
   - move xlnx_vcu DT binding to clock from soc following commit
     a2fe7baa27a4 ("clk: xilinx: move xlnx_vcu clock driver from soc")
   - corrected clock sequence as per xilinx device-tree generator

Signed-off-by: Rohit Visavalia <rohit.visavalia@xilinx.com>

---
Changes in v2:
  - dropped patch 1 and move the file during conversion
  - dropped description in schema
  - updated commit msg for change in clock ordering

---
 .../devicetree/bindings/clock/xlnx,vcu.yaml   | 55 +++++++++++++++++++
 .../bindings/soc/xilinx/xlnx,vcu.txt          | 26 ---------
 2 files changed, 55 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt

diff --git a/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml b/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
new file mode 100644
index 000000000000..02d27d11a452
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
@@ -0,0 +1,55 @@
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
+    maxItems: 1
+
+  clocks:
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
diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt b/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt
deleted file mode 100644
index 2417b13ba468..000000000000
--- a/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt
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
-- 
2.25.1

