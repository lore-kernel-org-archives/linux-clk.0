Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E277B39C00E;
	Wed,  3 Jun 2026 15:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499552; cv=fail; b=HnF9GcJzD3VyhCcaVR3/9kE0OR3vuQjozWlnLsLkW5EM4wmLOUcRcznkfZWcG6hfkpXJtQ4tltoQBcj0G4NGgTTnWgscjcksOndSibfTnvwVIIqLx71UjTPfh1qemt4lJHc+A9gFINieql1ZMYnOSchxD8RqRnXsQ3sElizYNYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499552; c=relaxed/simple;
	bh=S8gzFLNyUQYy6nJulHDVMym0puvESx/NHsQEaUpSJis=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dtg37UkwWjGl9msACMZ6lGZQBMeTiU65xgekj0Nrj9AbfSar3RuKIw34WS9ZZf0lyKhYk9L9dxWLk9s5RZy9bVZZ9rbpMvMbwnB53p3+6LfUNDtp3v+V+2cQEzvjWYYiX7mghd41/mVpnx2yaUuAxyrFcXMZfZqRltVrto8qigU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hqw9trST; arc=fail smtp.client-ip=52.101.46.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hqw9trST"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5aX0vj+s6SpKdYRlGniVNZvYX+ToB/lTrHmL+ur5gOKkSkm6/H+syO89cXkLso66WKxDdHr0ZLw2Rw/EbogOEwVDtP24nEmSQpKO6aFTCHdVa2I5VTW9p+v5JCKNokyp2C6wu3kOd3dZUkORzPHh4p69QNDanSfT0Tm+6SM8YqYRONa0pEqYqkF7K0HbrNrr/73arsW37humrLcgV2f8GOFi9mnCfVUdoAHb2AmBZ0UCo8Ts5bANiNc7fnvoDnKJpZMoyHeqzrERaUcgZ0/KrRsbScECI7FfzBF5CEzgF0DPWSg7qqv7A8i/LLN/3CFPFQdKvb/HYRxlxOpveeFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwORnBXHUaDp0MkDFx3vfQMoVAhXFG12wKVGaeCCsQk=;
 b=NjWy260TO8Lp/EaFscWua+phTrjFpvH3X4s9kgYovRn1Hg6gtZVybLtTVgGcX6n9duZxWYpj8IBCX79h/LOohFcZ4Hm1qpcwXF/hIsiD/32jfgQUKkoI/TsO5ZpqRgobb/WKB1pdubpYo6K2mJr7RUVHO1H4eTmY4h0S+k7tnJekVdJkgnueA/hgx/ihO23G/4zD6CVpODaY5sKqJPnnE+7j2G+iajt55HNRBApEBux/Bs/Yxi5h94w0LLzFvmeb2XOsb4aT5XYVrbS1cbFQIEnW3IadFGPHjkiW4rTfOiuu3o/BzyPOzY3ZiFfq5kylnvDQupO4iaQdOl3fsLgAUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwORnBXHUaDp0MkDFx3vfQMoVAhXFG12wKVGaeCCsQk=;
 b=hqw9trSTi4yBBymtqjVui+wNB4kLpw2qDjAscebeSZSx+MTKoNyhut06k1LSjutwmrsB28fGN2eYxXWG7PtrXopOutcJIgO9zfqfT3V7QDQ110S0BEJXb/2fFa7B5MiNRlnRvunIC3D9HtMNG2TsnLfmv8R8biBzKivu4cpF7pc=
Received: from BN9PR03CA0780.namprd03.prod.outlook.com (2603:10b6:408:13a::35)
 by SJ1PR12MB6147.namprd12.prod.outlook.com (2603:10b6:a03:45a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 15:12:26 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:13a:cafe::61) by BN9PR03CA0780.outlook.office365.com
 (2603:10b6:408:13a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 15:12:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 15:12:26 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 10:12:25 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 10:12:24 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 3 Jun 2026 10:12:24 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Rob
 Herring" <robh@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Stephen Boyd <sboyd@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:COMMON CLK
 FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: [PATCH v3 2/5] dt-bindings: clock: versal-clk: Fix mio_clk index range in clock-names pattern
Date: Wed, 3 Jun 2026 17:12:07 +0200
Message-ID: <5662c24a9e65310fc6520afc95f1a639fe6d221e.1780499520.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780499520.git.michal.simek@amd.com>
References: <cover.1780499520.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1328; i=michal.simek@amd.com; h=from:subject:message-id; bh=S8gzFLNyUQYy6nJulHDVMym0puvESx/NHsQEaUpSJis=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWQpuHikvrrXcmnb1krN0BOMN9dyPc7PUjz02sPq2dHFT wrMPn006yhlYRDjYJAVU2SZzqTjsObbtaViyyPzYeawMoEMYeDiFICJvJrP8N9vruizWultHEtn KHwuLT79lNHsseOFbXa+x7MKT80uWbKCkeF7EYv14ncm79r7JkVuubvU4aiqn9w3RSUjxXOujf+ j2lkA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|SJ1PR12MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a2738f-8fc3-444c-1c30-08dec1828567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|3023799007|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	4Hy2WzrNDrFCiIB6Xf/LEgRYa+XSYnb5ROx+W1bFodwXokC/nGP+Gomddo7Z6khzQdAVXpQTuJlwLLvUwbB0wYoZ6ZfBgXQUnxftiZKvRjnJzIOLr5hUL0FedwdDJoinFY+1GEt/sOryfEle84o5/kSWH4qwfYb+GWIJsV5sOWSbsHajCylL7riya/qBeSJXWcklssZDefIgTIHwF0p2MQkm3iHSN4xaGRf41o78xh4ms+NAh228oRdersVqzBz9G87w3zfPlmmQEjVAijndAAeHWKEPcVJGi35DVF7zK3ssempd9QyLbMpJTzCYvynMvBEdoo3XwRaMc3Xmwddzsu9oea0IrcEX5e5T3MlNBAR/d9ggGjn9a9q+yn+3e05UjCSI13BMKsO6NByS8p7YcU5L4AS3d1GinpDJuetPvKOxJvmvRPRvegcZFMx9r3ebX3X077Dm0VHTy8K/wZNqWXRjmhNetb9QZbvXlXKnT4bHAsDZSbqjW/rdbXGz8OrPe6MZVCT0Zw602S5v6dyngngQLojcyVYggajf73e/ArxYn3JtJNfJEKl04chrRL7TCsMgXZ6EaCmmpdQLj1jNX849PZ2welFRPE6L7ONwJWGKCxi+DflgDGhjGrBRMNasQNobZVIbza3a9bfIyoRx/aXS0geDzJwAzTyc6fZLsPEEETWEmAhR86TZrbG26fbn6k2X5OvlOZUw29LhNbZ8dJRiXCsRz76Ixy1jxLS0ugY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(3023799007)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	thxtXm8cDyAwfYAby6ufmMWkQqtZYgLbc44EzlO7BWrnkMCG7U7i9tw+VbSraMEfRXKh0ih1zEwRL1O9kxwekpkHF6963WTFAFhQNl0lGjsfIOc6sDSqQhrSiJe5bVbMLSX+2Zr/oyKfrHyhfacp1TwrAtdiECrzeYaBncBVrOlk9XbT6RBmJJdY9yyjxzHnQBVuWQyoVB39vI19EPReAMks6/xAG+v+sS+Zh9lYcGAwC9EBrNghcYHlA8tai6y4bOK4gkGl1f0nUo4TunSFqoazkpt+bCeYEBo3xn8FQ2xgwUzGAzye07J8NwYo3I+1QKyFVFUupJ3vcLsET1tB9/Jv+wGGfqyYucyKt2bdMrkgTRx4CRqS8L+7p7dgloHTO6x+BDBKAzlZxyJ6lxbf+DpdXU9PSeemH8YM4l+jTDf97IyiertXIZ9cF2P7VHMy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:12:26.0719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a2738f-8fc3-444c-1c30-08dec1828567
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6147

The clock-names pattern "^mio_clk[00-77]+.*$" was intended to constrain
the MIO index to the valid range 00..77 (ZynqMP has 78 MIO pins),
but a regex character class cannot express a multi-digit decimal range.
Replace the bogus character class with an explicit alternation that
enumerates the two-digit decimal values 00..77.

Fixes: 03d4a1004053 ("dt-bindings: clock: versal: Convert the xlnx,zynqmp-clk.txt to yaml")
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

Changes in v3:
- New patch in series

 Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index bef109d163a8..d843d95801b5 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -116,7 +116,7 @@ allOf:
             - const: pss_alt_ref_clk
             - const: aux_ref_clk
             - const: gt_crx_ref_clk
-            - pattern: "^mio_clk[00-77]+.*$"
+            - pattern: "^mio_clk(0[0-9]|[1-6][0-9]|7[0-7])+.*$"
             - pattern: "gem[0-3]+_emio_clk.*$"
             - pattern: "swdt[0-1]+_ext_clk.*$"
 
-- 
2.43.0

