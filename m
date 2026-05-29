Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010003.outbound.protection.outlook.com [52.101.61.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6905E3D7A03;
	Fri, 29 May 2026 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063972; cv=fail; b=qIylQl2EAOBptOF4l0C04W7duia4tvb1DnQl0hcGTtLVpoY6t5Tl5WpF2F5tXD6Wj3Ds5Pg8/n5a6+qQAiUFesuYYUFZXavgeSKZ+IbQKbmNCbxzwXm2kj7T3OIRSy68TfjI+FjmQrFk46Wth+p1d1jogUffebG7b+XWg04pQtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063972; c=relaxed/simple;
	bh=DIa3FVrqnHTrAnYNNYU+dcTfW0XIOclzylRVZWLteZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u7rL/Gz/cVcVTpxignIJFBP/DqcJqvgwmXnbuVew0/s13FREUI85OZIoOdXXlvVaRTVNTcWi6Pjoubin04xk2l9jP67ySGlb+FtMoJOZYjzByH/MCh5aoHFD7b49wfR45FJcfebuUYD1nvV9oY8k2Y+uzhWxuRUeBL3JyFfH4FM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IbRRZiSu; arc=fail smtp.client-ip=52.101.61.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IbRRZiSu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaN2bEbnhoTAV7ZgTH6XOY47uv/gbcEZBU8WXaEB4basxHSoQIaUl/Yv/pnHzQJGPDVN8wSvKis+WpRBvE1fmRTY//OXehSb0tZaf6XpvUkYuTS487d83gzmlOz+1784QSCIKUPFIJatKIkiuoRT8GYe24pX+gAE1bfOiWS3L/opBsYP9g/ZZY+//A01SpEwG/m/8IPZySG+6KQWMmaO1JAo7vGDeOjOt9lilDmZY8W97OleeVi4jnaUmAn81ztWWnhvoO3xhUA5uljLyr0ek+49zntO//rKUxzP6eX1rsJ6m74a0jsXfG8iuYqww1pN+Fhuo/1uObUwCrh1TlkC3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWfuwA/n8f49ktMmb7nBbcrQNIEMU7zH1jlNCe5zkQA=;
 b=JsUBVocWGqTJp49hEOlVT2Fqlh6oqZJX1x95V/UCSRx0syNJxl+W/Piggf71gGADjoh+Znv6zynT/QSmjtajYLveI3QhrBBqkBmEidKUFW+CIwGaRFxmV+mGd+1kTfrDN5kwWBXaFnOc4LL4Ee9OK4fYU+sKM1SITvEgF1quE8CSUEsKbRRD42uZEOnhJsT5psDdoL21C2wYigDwqoctm6tvXaRHRrXSr98albjHTvyJ8qM5P2d4ICSznj2U8AT7dlElUEqkyVYAYOEv3L/lPG4E0eL+E5Qxhyc0ptKJMMeCCYo0noMir44Gv2Ri/4Pyq7Yl3Th2G64muVZTN1TAjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWfuwA/n8f49ktMmb7nBbcrQNIEMU7zH1jlNCe5zkQA=;
 b=IbRRZiSuTfGs5vgL1+8bwPJB3QOscLvSIOCOqoQ/vYaZBIq3LmD5e1mNuz2GHoapuFFlzHMYMA9ieP703AIhdZXQLYQK1ewb4skfSSBBn0UZ/Vf3E/cjKtJT5u2MHzFwa6hDx6lobygQqjA/oOdsPjhpD9rBFFaK5N86NXeQLis=
Received: from SJ0PR03CA0040.namprd03.prod.outlook.com (2603:10b6:a03:33e::15)
 by IA0PR12MB7775.namprd12.prod.outlook.com (2603:10b6:208:431::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 14:12:42 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:33e:cafe::a7) by SJ0PR03CA0040.outlook.office365.com
 (2603:10b6:a03:33e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Fri, 29
 May 2026 14:12:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 14:12:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 09:12:35 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 07:12:34 -0700
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Fri, 29 May 2026 09:12:33 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Rob
 Herring" <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: clock: versal-clk: Fix Versal NET clock validation
Date: Fri, 29 May 2026 16:12:08 +0200
Message-ID: <0b450e97e83b7ea662dbfae54b97d894534407e1.1780063921.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780063921.git.michal.simek@amd.com>
References: <cover.1780063921.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3310; i=michal.simek@amd.com; h=from:subject:message-id; bh=DIa3FVrqnHTrAnYNNYU+dcTfW0XIOclzylRVZWLteZI=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWRJzjtpKGJ+Mb8+Uf2Kqpe0O8uvOW0Kdrdd0o+3zNgcf 4pDX/xNRykLgxgHg6yYIst0Jh2HNd+uLRVbHpkPM4eVCWQIAxenAEyE/TLDPyXLQJ/5uypazx0/ 89i3hvfRphDZrbPVGpkrb38/lhaTdZHhv19ZsMn2F8ynt577/vVboFjeltK+8Cyr3L9xET8tlzw 4ywoA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|IA0PR12MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: e3c33c1d-1ed1-4545-9e31-08debd8c58cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|22082099003|56012099006|6133799003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	tuzq4msX6bO2GMvMsJFYymW0qgeALFZkrf1CLnWfej3FGENzx5MYb5FlrT+dPuBqT8m7jryjiGbbqSmPUDvo+RMIyuwCyoqxHCPv7QMitCu9EeCWaY5XSZNqU1XNfnXbIGxBrQT2CrAvbizdkgvyGPnhZNIP0y3giE2WKuQPSkGx/mnN89Tv+S9B+4l207+4l3k3IUJZ03nup6ObpOZ2+PeDxcuANB+z4nEYIeaulYGtP60zGm1DEdjicSO1/tgz8VaHaioEDDV7kzZat02U8kVDQ+JKfCzlVLybTP5amdbSH7mpfZyMGJ2Ai/RW5dZSBuCTs5v0EjcwKqD0Hjl/VnJ81LVTi5LXnvCDJlfBMr4w4c5JFepxawqcGfu4bowxsmuEMO+Q9LEw627YohVpBppQi1gFlBmaSr+8TuEmmQAVVn7rocX2YydhGU5q41Un+RlMw+CRXRIBLOBHvOOT+pNzPNhJ9Afaer3I5HY7g84JFdwdUwXK36EZ9K18eTPqHB7T01bM578u0w0VDuLjTAjWMmE+e/xieFov0iPuKkk+Sk5zED1nHrpQog2oRiRD/MgukEpy/jgdMzqZYdgZl98fexTo8ND8AK6iQTA0DQ9lVZJaLSvgTNE6T30tHwvNO11HsBYIG+10eUX4reMDsK7ubxAZns+gu1KfBngWa4dkB46DW00DisstqKSMZayaCw1Da3nlhuXL+pSPi/JOgtd7PJe1KNlzmjglcRFKoX8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(56012099006)(6133799003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Jy3lBbOmgDsLf8ZoVn/UfkLVHOIFJ2BhF1ygVDSzAyUDvj9oT76c5osVuqqsACnSNGNHtDsuPa3FRjUu30Kv3803uG7FAu2cUFaA0T2PwlawLTcz1EyYFdanbf+TeFwRAehKNRl5XgreNSYml5QnpcPvPSYnyOAAvWzLB5K0iyFC53GIag7I9EnRN6HP2BtOLjax9PhSbvs9p7gmFJh21HZ1jnNvYsTTCc25FWjHtEJqPIZeQjNo1Dgwb+/oaLPbgocdPN3x2yzqCnWi8yPc/kNZi8v+VuId3Gsf44syC24g+rMfNsbdSq8w4vLxgebflDnM0zL373TKokaow0EnG7GE/BejfoeV284Bw95oIK+NeAyHJYTOv2cylRRc0Wevp4I2FI0IG0aIA0cYY+qJme9GS0fjB+1yVqOlbzhO1xPOwQkYBiR1A9y8nLikMdx5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 14:12:41.4982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c33c1d-1ed1-4545-9e31-08debd8c58cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7775

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

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

Changes in v2:
- Update logic without ZynqMP part in this file and have if/else only
  around min/maxItems

 .../bindings/clock/xlnx,versal-clk.yaml       | 51 ++++++++-----------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index 12d060c39bfc..a1b8043958be 100644
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
+        #clock-cells = <1>;
+        compatible = "xlnx,versal-net-clk", "xlnx,versal-clk";
+        clocks = <&ref>, <&pl_alt_ref>, <&alt_ref>;
+        clock-names = "ref", "pl_alt_ref", "alt_ref";
+    };
 ...
-- 
2.43.0

