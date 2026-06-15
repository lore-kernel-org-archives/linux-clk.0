Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012046.outbound.protection.outlook.com [52.101.53.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140DB347C7;
	Mon, 15 Jun 2026 03:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781495344; cv=fail; b=Er4PQMDLQ96OjuEa9xrSMT27aJxQo89yX5qqLxd+Im3T9CmjXBMk2C88xX0aVFmCK4nvrWL9knXJ6N7tw8M2opQDsZ6OTc/nPZeZhBz6+PzpcxbpaDehN+DSqoa19ddFUc7PpuYCJSIYB6Rw3+b8cFWn3kNZScLJlCMmLQ56l2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781495344; c=relaxed/simple;
	bh=5oy0irwYM2ZFIY50Zoe9jO7OvHiLsSPn5eSvFU6+fTQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F83YI7dWNyiRHa1LGG25RPniXJ0pouppcH2xo+KrJP76+IIThnJq/fdJly80yWUbtAR78ysaCV2xURHr3JQpQg9zbLb3t9wWql0MbPzQA8l/bP/kBBG0Jt7yAbZkuKAFc/6yZJSWZ2A4AaNjTjX2RE5OQcvHp+jZO6x+jVN1QZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0pnSjQFd; arc=fail smtp.client-ip=52.101.53.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0pnSjQFd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDlzA7eEQAQix7Yk8eD8L+oq0k8mVDSxwBmsPbHU3uPRPvmDmSJgna2fbNhpX+skZS+fSs7/zBi/oXIDvcaGuC65xr1pd1vymThokpk6w56CxVLwzb9xyLkaD8wEfdyci0elqzRZJxj1u0WbjQtLEHAPF6V8paM3M1ZtdF+qR+sQB4WIZz6hZUmd+QHGONeUYrm4oCSkN2R3Z5R+GF+2arR8XDBlHwe0L7TrzMfYUwBH65LkVMEn4KENEtWpwxIMTbyhX9KesDjb6vAQzxjNxvEt1WXir9pfDKgh930kMS/ME0OhRufolxc8iPPhdhQX6VNVd/cM93eiOaJ7/quoSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IuEXB7+JOgSdlRzNmiaRvDiC4vPu2vJjQAolXDYLrA=;
 b=hos+AqSVKrdKNAV856qwEW1pi9qfPRpjjFbEQ9s4zXCoTP2fydG1trYF1J2bEwl2dDlqEbYyeqFuIl6Wos3XV+WDdjySem8oi/pZENEE6OT39XvN07yHd0WLMaaJDveS62yx+aZbGJBqBuk1qcweEEruERBrOWNrLSo7S0TViJg0LsFhGtqBl/2oU5f/y3u7NoK/bYb2yPfqhMT9iTBCLMB2ZYVdQL1J6kM7yIlRpGVJ/9RowEI4xTD9D0DerwVbDozmzdi07IR1HgABESN2TT6/LYM4frOhrrWjdZKx5RGhebs3uGwISPKuY6MPzxhp4yN2t9YFhmG4kstrxXSXKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IuEXB7+JOgSdlRzNmiaRvDiC4vPu2vJjQAolXDYLrA=;
 b=0pnSjQFdZh/1hM0s89lMHpplaHbR5ThdZnX2uC2YwTYJKyVBOjeYzjmHfQrMob+AnIAs7Uwp6S/R84Q3lNqwzG8kPaJcU9TZKsva+zWbM7KRTsbsDmXoK4YagAIWpc0VYQ8sq4qX51wXK8K0HI/NzL+jdjJr5jo3ARKsag9F/dc=
Received: from SA0PR13CA0024.namprd13.prod.outlook.com (2603:10b6:806:130::29)
 by IA0PR12MB8423.namprd12.prod.outlook.com (2603:10b6:208:3dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 03:48:59 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:130:cafe::95) by SA0PR13CA0024.outlook.office365.com
 (2603:10b6:806:130::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Mon,
 15 Jun 2026 03:48:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 03:48:58 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 14 Jun
 2026 22:48:57 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sun, 14 Jun 2026 22:48:54 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/8] dt-bindings: clock: clocking-wizard: Make reg optional for static-config
Date: Mon, 15 Jun 2026 09:18:39 +0530
Message-ID: <20260615034845.3320286-3-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|IA0PR12MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: e63948b8-a6ec-4d3b-c034-08deca910826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|376014|82310400026|5023799004|11063799006|56012099006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MHQoXDh/XVaEIvRSo10oUheQM8HH2FKTHJpThgSEuvBI++12PHtEvti/BIiLQXUT9NU0RL82s+YmDbfEpAo8U0IX9xGqOllAD4mVJIhrTRsAGxyfREwM2JvsNdqUMj9+NZuJs45cBHVpBBobydWwkGNigUgywecwqqEnhTWuQ3S8o2kQGTOjoh0zpwqdtzewz250+UJJfF0q8wJwoLSSuhBw1mISaCrdXaCL3w5jeqyUskR6nOX1+m+Bvt+jY7skgHf5XZck20T6ajdPba6VsF9nMu6DAN6JgrB+zUkjbq8Rg7RwgfuCy2zkW8/wT92geVlbdfwwKsVs/PFOWeg5yrvZzVqtlITLbDKmkxhP5YZxQGwO85BUUV4oXyRZv4CP4R3QDIxdJ2kB9WKHL6Tk5mplMWJPexvnSKOlt0LwDuvbVVpxk7ComhonWoMBCpAUI8cqtnBabuWJhrPG3e3VbYL4o1MnwPqRHlAxAJEZVdJGH9A6piamp/WFjc4IaH5RK8erpUAGwkw0w4VK3RhLnb71Bo2lLo210nO/KX6MlneX+kVj+V6NvtrNEi9e4PoGyuSLs15jn1WhljV/dTzzP6r/D+McxRXIeF+lOaLYN2B4/EbPP45Db+Bhj03RcPIyIcyPnt3QGYSYtKURNCa0R9+liNvOoLDBfFlHyL17qxxpuxG9/yA1QI7mAXzsYQxsuEr6SuEd241SfePfQOnNWgpCn5kMw/hCpls1POlBHos=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(82310400026)(5023799004)(11063799006)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/qiBVBPQ5fcr9uQJlIKIpD2hs7Rx0PjA7XXBV7Fcz3/31k4aRTTzUyTEDNAIwju6Yy///Yo6rXQqXGN6mtVFA3drTSXNGNgHtXUpbXSMS50+eoQ5EvEnBV8EfJy8UDM6kzVvtdSjkGo1tB+aou7NxdcaKMINOfN2xrxp9foylpQd4rbt3bt7HqYwV6WBZElSCVnnfY+0wrqfYh2a9zNyiXk1SDxk+CMt0NkCfjrns1Otvif8yfBQrqRX7iwGvKY9jivT3bR6rJD2Al9RMufi0sA4cnII+EB3vTmVH2Fr/Z6q2AKcphdFpEMaa8eRo8wUeOgV0DQw9OAPiUb2PftSs4nn6PMfb66d/D+Mn/gxDTAoJKkwp/Aq2HipiVbSs0Y/Ezdvuc41z2Pp3jdiSSCPvNSppNtZV271wpwGQPcSc+6mjAVCiw+IYOlOaBv++tF6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 03:48:58.8671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e63948b8-a6ec-4d3b-c034-08deca910826
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8423

In static-config mode the IP exposes only fixed-factor clock outputs and
has no runtime-programmable registers, so reg is not required.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 .../bindings/clock/xlnx,clocking-wizard.yaml  | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index 8316654b0a91..aa397550d107 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -74,7 +74,6 @@ properties:
 
 required:
   - compatible
-  - reg
   - "#clock-cells"
   - clocks
   - clock-names
@@ -88,20 +87,33 @@ allOf:
     then:
       required:
         - xlnx,clk-mul-div
+    else:
+      required:
+        - reg
 
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
+        clocks = <&clkc 15>, <&clkc 18>;
+        clock-names = "clk_in1", "s_axi_aclk";
         xlnx,nr-outputs = <6>;
+        xlnx,speed-grade = <1>;
+        xlnx,static-config;
         xlnx,clk-mul-div = <12 1>, <10 2>, <8 1>, <6 1>, <4 2>, <2 1>;
-        clock-names = "clk_in1", "s_axi_aclk";
-        clocks = <&clkc 15>, <&clkc 15>;
     };
 ...
-- 
2.49.1

