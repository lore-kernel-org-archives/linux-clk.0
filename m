Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011038.outbound.protection.outlook.com [52.101.62.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D3D54739;
	Mon, 15 Jun 2026 03:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781495350; cv=fail; b=NXdmNE5JXrtiNmcCvXVh5qVjgAAPv1IMoGGUYb4BdwtayVC9FqFQ/KmRRtUBfnd6k/qCXfbFQnmW3/4bhg7JG/+0qD/1MvECzwr70A+O56aKJ4ekkECOCSrj2NK6smUUNyg5pyE0RMLG3FqgRN697Go2PQ52xAKjav/B0CQ9nHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781495350; c=relaxed/simple;
	bh=sVFEJFWKVCyA6vPJJS95JaHGURfvAzl+jBPtd7CWCS8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PnaXjbSLBhxt0mRyY6kHhIlnD2oxkgCiVHOMXSC+BkdQIU6vkDwPynEMWsgSFjrgPmuDK79mkCPAti8SRRyX5PYjsrbJ7goGHQHXGYJ5TtamIv/mPtONGcs76lAGI/4HkB16rq2ExSggytAIJYLbfSKq+fsC40+7En2f13fWqw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HgOBDE46; arc=fail smtp.client-ip=52.101.62.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HgOBDE46"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xh8T6BZFcvxob9UECjLSNnLTuuNKHqobAx41X5tD5yQHI76tmY5ESN6f80veKbm3kk7ax+Ua7yEeTsaC0Q1VhRMoCQx4Iw+6IdBXbO/ORFeXUtjyPPvuhajW+sU0DTvTOHJxqSJl3nivU54+qLs5tC3AYfkD9KnTF9IcXBInDnrmpka3RP3PMkz2n6VqMsdZBvpLB5Q46ZU4JYMBUuTtxqZNonprshiqYxXYKlr/R6J3QI/ppr9gq0CcakoA2hXmTJKoyzp/zK+D/1jixRNS6b6XtnN15shaW0vEDznFdSEbCmnPMqPQXXjrFQ7hhxE3f6Krft8KlmUWudKHffyoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCkV/jR1xKhYZBkS51DtNgQ9TGyMCnIYr6uBulUa2v4=;
 b=sv67Vn2RdTX+sM6GJSPnkap//I/pFoNcUJOYEF0jZGu33Tte6lv4L893m1XeG2PEMu/UVvbVARH90irckLhkCzU6CfaFXs/uFyamGrx8rVVehTrXoRwXvuT/Nr7UEkFNPWG16nJD/JkRfP/EKTMqKhh2+Y8KfW01V6yBckgDSpRC6wSnMOg8gPJ+FxEqRHqL0tTr04c8oiYjnm1jXPz3SiypVto6A9RPha/CvHCcD1FwPgsXeqjpMsXmNakdvJSfj8stjedPTxtiMJqBsiducfBYTx1p3U5cxpMu0W+hl+bw9N37LtvwZHJWyfbb+IvdU2VGv/8CtmPVzLL0FZ81Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCkV/jR1xKhYZBkS51DtNgQ9TGyMCnIYr6uBulUa2v4=;
 b=HgOBDE46SFwHtfZGphnW3jN4xRIUOK90NVIkg7hlJYzwMtaPelQLe9Tu0MLKhK1iqO9llPXQraTrlf/0Xtw1no0+G4axzjfSDPHpuh0D83xknzkUljOflEAkOKvHzegu10t5zQlsR+/418oULH/Lku1WXVbemNB10mtcPn9RAQs=
Received: from SN6PR04CA0093.namprd04.prod.outlook.com (2603:10b6:805:f2::34)
 by IA0PR12MB8982.namprd12.prod.outlook.com (2603:10b6:208:481::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 03:49:03 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:805:f2:cafe::3f) by SN6PR04CA0093.outlook.office365.com
 (2603:10b6:805:f2::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 03:49:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 03:49:02 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 14 Jun
 2026 22:49:02 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 14 Jun
 2026 22:49:01 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sun, 14 Jun 2026 22:48:58 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 3/8] dt-bindings: clock: clocking-wizard: Make s_axi_aclk optional for static-config
Date: Mon, 15 Jun 2026 09:18:40 +0530
Message-ID: <20260615034845.3320286-4-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|IA0PR12MB8982:EE_
X-MS-Office365-Filtering-Correlation-Id: c29e4216-421e-45d2-0e9b-08deca910a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|56012099006|5023799004|3023799007|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	G4HzcbvVP8i280nPw2Ktb7C14O53D43JV+hAxSIBIwEzmJaLvNCBddKpofGYulawyUxc6jzbdlv20I9YHHSNn+GWVHvJb2C8UsotUsbo8L8HHBon0kF9NiRsKJ2BgsoQGf9lGOTc+sQ4CkGOM5gQ7gQ2YrDeFlL/AFFVRZX0NnmbF+Ln1NuA75HRpSGWbcjmfZyfnZ9IFobkrADxlFykxiMcLENP3hgLHQYdbtH5AQIN0i8zw2k0k4no/avYotqLeCoENVXjicViC4lakdgjpt6SpcTTaB28whkObnZwoSjwqFrV+bxqjB7lXopOAt2aTlkC7dFV9FX87aDiHV+uF5mKNfcSnjIn37kHvsX6zn1yn0cv5KaikV4Qlk+JX+xgVMHdqm/5D2lzL4qSZW2b1dRkwTUnLZPjrQzqgHKDM1QboSyCtJp91pXyNIIsudMgXq4gyxuzcDvVEw0YoEoHSEpzuYrIWjweLdTAKP4TyJggygRwxlId8hV/bK3yQK1E6ViB9lStmBfwdvw8zkFThMdtRa0n9cpptA6a4+TVwbxma6uPz3vbqtSRiswM9oVepe9GS3IBRx8Wy7hVqws2u7rPtq8eJU/Ps3gxUp1QeLdGSyvyKYaCa1spG2/S8mbWs2kq0866GlKVjZUgF/Bc0QjqTJV5woYsRc91MyD06AcVGPLcpegXOKUr1ACDkDtDClwvEX8UT3fdqJxTz9xPqbbNYe7kN0lnJ8Eoan09y5U=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(5023799004)(3023799007)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TYIrM0ceA7jkvKBOmk9oXNsY5Mi73xk8Br+npU2inZv6pKvOYpVfT5+FIJqGipHAEceetroZzs7oBhdEXTaMrnsgoFjZN2csvs2vcY38wpkDRgZBcuoSmLCLt2nkcPuVkFUBxR039zy7WONTZdhsw/p+4575AAMwYkcZUI0mu0p2PCEkIAFiCogqFaZylm+8JoL8qwfaNCEcYbxWvCxLByGfFAC+Rbwz0eouIwiNojrwDlasaZ4BPoNjpHYgCH7jpoXP/pkLpZ5Qfffi+aGmx/TwiwlFaRj9n84DGgshZT+91hyIC58n9Rb8jmRluViNPbtZPdd/Dj9wWtY9Dd52wizJC9agRPWo/RdFRC87NBlHSK8uqppspMHumdObeSi1uCrPeaE0UKMS28YMtkFw6Ibu6RDF8t6tBupLK3McJX21v4Vmjnfi+d5Xb3SuKXxD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 03:49:02.7929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c29e4216-421e-45d2-0e9b-08deca910a7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8982

In static-config mode the AXI bus interface is unused, so s_axi_aclk
is not required. Allow clocks/clock-names to have only one entry
(clk_in1) when xlnx,static-config is present and enforce two entries
otherwise. Update the static-config example accordingly.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 .../bindings/clock/xlnx,clocking-wizard.yaml     | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index aa397550d107..0daefe89ea89 100644
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
@@ -87,9 +89,19 @@ allOf:
     then:
       required:
         - xlnx,clk-mul-div
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
     else:
       required:
         - reg
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
 
 additionalProperties: false
 
@@ -109,8 +121,8 @@ examples:
     clock-controller {
         compatible = "xlnx,clocking-wizard";
         #clock-cells = <1>;
-        clocks = <&clkc 15>, <&clkc 18>;
-        clock-names = "clk_in1", "s_axi_aclk";
+        clocks = <&clkc 15>;
+        clock-names = "clk_in1";
         xlnx,nr-outputs = <6>;
         xlnx,speed-grade = <1>;
         xlnx,static-config;
-- 
2.49.1

