Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XSN0bs5/"
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2059.outbound.protection.outlook.com [40.107.102.59])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B242CB;
	Wed, 22 Nov 2023 21:34:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lx6OkiT6SK3JgSL3/47sjXjkmoawNtUcoxZ6ILXrfSAouFiRmdth5SI2dx2LD9gaPgcYbOyWs1PhIPnnWpzZQTUJWAa+PVo8Kf+dVoLqF++rbMfedqDqI+ijSBeJ9w380NmRqdqqN9zMw7/9JjY5gK+nON46s8RtSOXbsrLTQBsBUcPDToGIfWJCYLkbHCFXYEx48Wv+L5PhllP9juAcslTme2MmSAMn5W4b/tB3urj6lkrbQnZE2Yos+cP1GYZk3Y/SVFB2SRdnQu2nrps3p4a6FMh+Pfy+7F67Kg1Otiegfe8klfthE76Fn1unFye67Mpz07pXqM7hrWEB2CKE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDFVe9469SI4hiXRWFHtnIlLXHlts3fYpeCuTCmMrE8=;
 b=WUaFDxtBt4wr03EIVVRZ9Gl1gpR3RwtvvHskhE45xKUHgp8BBUup2P0sqOSpQWnATPFFvXKpqWb+OjPPQaSiMQs5eY/qNDCoL6RJNTui6KnGd4DbggnvXyFWPtfThLcXxgZh4fzkYD+pRneiQWV7k0VCrZaq3X4MzYF6k6bGtSO4hn0bY/ckBb69Lxy+Rt/xCJcL0JQnlSRTtW5a5NhG6H/j2x0hXf2yYvpGfqOkdAuqVAEn7VON6xJsSsAaypim5sKVEwPBJjhd2F2UXrEp98T4GK3ksa8RzAQ6TZZQX3JkIykAjj8J29ZPTStBh3NkxsFqvSr1vZUkQV1xJzYMng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDFVe9469SI4hiXRWFHtnIlLXHlts3fYpeCuTCmMrE8=;
 b=XSN0bs5/pqYxEq3NKCuF75MnNg0fvktj+UKBcRFK+D0Dl2sk4wgkYiGtMZUb9BAKdLgncXtPCYZCKi8nzVSjZnwLlnNky6N2jDUvwYRRqmP4YYZlZ8Sm4M+hy8VdIXyQX7Xx6Azjr4qIpU5BacvqcXEfxi9fqDxdom7F0KQPSA0=
Received: from BL1PR13CA0027.namprd13.prod.outlook.com (2603:10b6:208:256::32)
 by IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Thu, 23 Nov
 2023 05:34:13 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::1a) by BL1PR13CA0027.outlook.office365.com
 (2603:10b6:208:256::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19 via Frontend
 Transport; Thu, 23 Nov 2023 05:34:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Thu, 23 Nov 2023 05:34:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 22 Nov
 2023 23:34:12 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 22 Nov 2023 23:34:10 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <git@amd.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>
Subject: [PATCH] dt-bindings: clock: versal: Make alt_ref optional
Date: Thu, 23 Nov 2023 11:04:09 +0530
Message-ID: <20231123053409.10192-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|IA1PR12MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: a909022e-e9b6-44bd-2c9b-08dbebe5d3f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A2aGreOaQvGARLiVx5W84eknzRmVtlEscHXUpGcMNuqw7WbO7Q2re9n3PVZikO2I5ssjbpVZFkwhz0ImawFrKCmLs3Fq3JMAaYX85eBGs6S1XpRJo6w/NN2L4uGk4kuDqmLE7tjR4yzfmX5nHKMAbNrLBGzlcpwIjV1I+8uzH33VBfNUokGFeVIrMf1S/CxLVMq/tuQ7UkTH5J6YeUbE/mwRVWgpcmeDBm+ADjkRQa2JczVtme5b98Wi16YrFAjdwup7kpA5vHDWVHKScb/lCMJi0LJL8+HNBZbrTTevsv7vgpdbeOiiPKunjWXb8HYIimX3Ii3id+NS3jiHzOLHeGdC6NPa5CkbThz5miUm21vQXBpeUZUe/iAIbXIduZGcfVB9qWA+6Z9lXWLCUsS7wXYxOqqJf+li/14ZLe4YC0kLaYRxMHK2VSjzw2C+5dobm13IKhYNFip4xmtyjGLmQ17lScVdHBqKb5+sVlnXHP/ENg0v/a5YqKiIAj55XbIvpNJ/6r+CJOEVjeRyvT9dxBEYr87GgqGoBAjdaiBTQUSMYNCDtH+yjSNxAfvPfx07DZWFx0pUgxA8Mqk2qwjTst2qfHTrXHYOxGxM9QXbZkhJXCvwPJDVkawIWnUDMzTrL+3uMwM+zKdiRQtvUR5BWHXueuP9Co1JR5ZnZW0QdaQVDuJp4P8qyQg5FepCyK8qZD8S3LznroiS8BiRYOx9zz39rK+Q7gxhZPRUrxJYX96S5RIW3RI56qIkPNCLvVQcAsrpziXteIbDGX5hAgvUjTsmvIlyu/rrlpfP3WMd56kNjkSWLV4Ar8NqDqEnoHyu
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(39860400002)(376002)(230173577357003)(230273577357003)(230922051799003)(451199024)(186009)(64100799003)(82310400011)(1800799012)(36840700001)(46966006)(40470700004)(40460700003)(5660300002)(41300700001)(44832011)(2906002)(8676002)(356005)(426003)(336012)(81166007)(82740400003)(26005)(86362001)(36756003)(83380400001)(2616005)(1076003)(478600001)(36860700001)(47076005)(8936002)(4326008)(70586007)(110136005)(70206006)(54906003)(316002)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 05:34:13.7240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a909022e-e9b6-44bd-2c9b-08dbebe5d3f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6434

The alt_ref is present only in Versal-net devices.
Other versal devices do not have it so lets make alt_ref optional.
Changing the order of the clock items to have the optional ones at
the end.

Fixes: 352546805a44 ("dt-bindings: clock: Add bindings for versal clock driver")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 .../devicetree/bindings/clock/xlnx,versal-clk.yaml | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index 1ba687d433b1..746e49383074 100644
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
@@ -57,16 +57,18 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 2
           items:
             - description: reference clock
-            - description: alternate reference clock
             - description: alternate reference clock for programmable logic
+            - description: alternate reference clock
 
         clock-names:
+          minItems: 2
           items:
             - const: ref
-            - const: alt_ref
             - const: pl_alt_ref
+            - const: alt_ref
 
   - if:
       properties:
@@ -110,8 +112,8 @@ examples:
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

