Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012040.outbound.protection.outlook.com [40.93.195.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9460240FDAA;
	Thu,  9 Jul 2026 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595660; cv=fail; b=WSc7wL8I+MiPhPQcdWxIzWk+ojj6N1BJRDs/1855PRvqDA66aZpyaP7+xzMjBxW0l121OYLhCHx9tj+adPPPrPRfwDRTyCoqh2DwvvltrySN3V8Er8pUEtKoOlD0uCrGpeOreOMpGIjCvaDH82hB66icEYMbqmaQkwJJ8f9nkLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595660; c=relaxed/simple;
	bh=HxUUKncJU2RZzXpGO15I21HMvZD0ovneEkhG+ooKXrc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ENf7zZquTFGmZGvNZa/4LHUz7dv7mb+hy/6v0M+4MRvaJD/pGRU2lYHWUYGRGwQu5+4Ed316Kx9ZHXUgMN2t7eMcMBINRBoEsWh0LxE61wvRJjUrd5i1QCB+fHCJNJiBrk99docdeDwz5MFIsu4sAjM47MtwxpejQJmcQPt+t0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mWVNe+H1; arc=fail smtp.client-ip=40.93.195.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mWVNe+H1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkJvkwWxgf4yPugVGkZrqqzeXg31clRnDMnamNaB5monAQEljQAzLA4EsPAiKynFpK8Q8j85jKzQdsbmpHZTi/xSMjvnd0oDH5MJibxfv5hylra5DB8Tdqex0/xvGoavcDSwx7T7gs1gq0z1wS7u5MbQ1voMoy0J25o1Z2A50MMjJ9g+oRODN4yNdjZ9PM6j9M0d0ju2d7KbIS7BIhGKGLOe9HAMM/cztasymCeRQD6Tl0zTKmr1TN2ejLEF2IpwCh7zbWuMiiIpUO+Y8dAPTUqii/BRulbS0N6d+ZF+KKYC+36RKPBUoPK9rJeaGn0Nl4+hGFWpBCw437ZKwUwiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gol9/XjPsuWC33Y3ZFspoQDpaFNdCRi6rrIQM7LoDsU=;
 b=yBoFtc+AN3+HPnD7uS5jP0YAiu+3tSrjv9dsfqQJlJbTS9EiFxRgk6hk/AGKry/Dcf4RRjQmwt6NwegskGVJj/9sXc80SX//T6q06N5disg462ktf98FFPioyR62+thgGEWqBiBU0l72U/xDeZi+X00L4qffwnQY5kOqVl8FLgo3YEU3XXpt5/1hlLuYJG2WZKsCfz2PYM47H0NRj+kDG6mznfpVpyTR3ievbAhoQnDzJgqK1eKoqFCB5cZUWwcgCo/cbJ90cojke9xWb9wyzs6PFTHXpvIExqIon1SDvSsh5dACH/Zhaz8PEQwAQKX2EM9t4nPy4j3NLBaFnn7iag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gol9/XjPsuWC33Y3ZFspoQDpaFNdCRi6rrIQM7LoDsU=;
 b=mWVNe+H1iOqfc2edslgvSWQNTPOj1TBVIivS+ZpnjVM/EQx4t7e2KmB+aRrGjPdntEp5fvYkKfgucT/9c+YpMb7+7DcBaVpJ81YinRVL3RX/DmvHu17v2aGk/6dxNakCAbPjIRbNGMIDxUxIzVvHD8tqBJdsRCn3XdhJZuxV4Y8=
Received: from SJ0P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::21)
 by BL1PR12MB5708.namprd12.prod.outlook.com (2603:10b6:208:387::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 11:14:13 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::5a) by SJ0P220CA0023.outlook.office365.com
 (2603:10b6:a03:41b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 11:14:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 11:14:13 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 06:14:10 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 06:14:07 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 1/8] dt-bindings: clock: clocking-wizard: Add static-config mode support
Date: Thu, 9 Jul 2026 16:43:56 +0530
Message-ID: <20260709111403.1579159-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
References: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|BL1PR12MB5708:EE_
X-MS-Office365-Filtering-Correlation-Id: 85952434-c922-4c94-8d05-08deddab352e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|5023799004|11063799006|3023799007|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8z1PF2rrPvMSwn/lOXp2OsTLcTloziDGcx46bilAlUfpkQgn75uMPRRbjRp6Ntfgo8dEZqXaWT9j26KOEijmhye6Pd5RBYnVhI74E6E/3p6Xi13etNkA9hIUy+/6udou+3JdRelqY1WBkuRvjM2JedUmcBh0m0rZ3bN0R0J6HO9ERL2b/DL4Xti0Chw2u3NAMP3D3ZG8Zlqr+o/p82gB4xy6/RNWRAIHr7wbaecovNPMKCFHrQH8qakMfxJJp4SyY0L2jf3e5GslfAPbvcq6w7UNAOwz4EHxHy2LgOweScXrQn1xehwStdsdI7uVxQ45SJ2OQdptW08/YA5VDu6Qj9fD22Gzf4G6bz9lAIPZ/0Q2XzvNrrD72NTzIdeWbNOomVui7ulsA2lSG9rAZYTjXQqLyg5GPtDLomeMOdROR0NeksGCBwoJOe+zYUpzEerAjhBxxFQKEu4dOm88jauQ7d04sDBeDArfwRl8tw2bbockld13ZjO2g+0qMG/soghsXb1Gx1+Pxm3WQwhLYpGC8l6bKhQk93NxtjRW8TSKs/5yVI2RgoqcUuVXBJEX0kePELW1VK6YATWQA959UazasBe8Yt+joUoT3lc7G9O7Fqqqqss27BwojduTnykCW4fFfTzdonsoRajk20s8YoFKhBCzF7bvqwzHLudspjMB3ose3LNHjglXR/LLrHLTrZyX67drJQ4dLu5R+V0ad36htA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(5023799004)(11063799006)(3023799007)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l2O4+MVHBPChw1kugVGzeDBuSbMq5yQCww5Klh+bdFvKp4q4FYQ9fxh2ig6y0eLFufwZ1fVMxg2D//ED5t2IjEWQifjzK6CjZLioBM9P8uWHpEb/I6dGId32ExnUoBCpKqriNc4eYcDfinh52mXpfv/IcRo23JB7pFUKFsKOI/l3aWKhVMtsw6+ygyE1hPp0wvmmSJ95Db516MgPtbiLTFEKKWw2BHts0tktVv9cCF+wYzog+ke0L8TJ2NVt9Jt2XOJvxCKwgR0asoAk6Nb3je22zBOCY8V4vHrZFEA9xi07SPEBe529pz6UxMmZu469nDJ/MxU7z8WTVdjGUJy9FGEG4qPvIvYPxzdoFuaxjtS69Zk6TJwCOZW+67mGmHPul9/Doyl+IY8KWuxYJuZgzW+22ktvoNBPBOxjv0qJ0TsaBhK67kmLXkuSPK9Bcb4e
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:14:13.3568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85952434-c922-4c94-8d05-08deddab352e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5708

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

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

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

