Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013028.outbound.protection.outlook.com [40.107.201.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E52280CD2;
	Wed,  8 Jul 2026 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516387; cv=fail; b=oe8xesjjBkFUNi3amcqwkOhE/bWXNdF2K3asn6EVgpFsm6rRsrJQlkofQwZ2hpbHe6HM7nVt/9X68v+mm2Lf5GF6fO4XqtjuqDkxSg19qQVuKOrx49ySjMGu2L3L3JU+GVW0fjBSx6QhHcJV21+QUnAsQpOYxj1SZe0iPLgoSlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516387; c=relaxed/simple;
	bh=qCntx5gpIOKTLymOmKX7EtNdLa0tTZJaasVcoy9ZAmk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S0xYSDqzuPFb/TT9IAEnMt5rByY06v3QLeMF5//nP1CX/rcxYegxAP2CTYtZ+qJ+X1IZhlDeVgSVzOu0NKzyaDsDclk0OOQH8VutO+bmaMiDDAl+cAc4ItLdkW89GFa9dRl0/4S6iwLDRSocJKHKj7xGtVT1NAR8C0Qfmjp/YuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Effs1Hum; arc=fail smtp.client-ip=40.107.201.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Effs1Hum"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xz+q2T6QvhPp0E4MKDepoJltNaRrJumjf1ac3knYgGsiNMig0tx6p8NKTdniOTjx0FfoRRLgmnu+9SBxccWg47/Q8LFBacOTra37O+U0XDu+Ag/u7n8qhXZh9ZAH/xgDvzKLJ1jt9iKip3fxgYfJ1ZOaOcKgCG0Pw6dncf8EH/C62IPsLRBupAPnML2PljeTqCvm9RDiMG+BRxs0c7v9Kyj4p+lh+RenHP/R74iJKrGgCoomomxg4ghd1cvFeOAnlReJD5WP9lJhJjRIYPRjKjH4S7BwmwFAG5VkHDLnpqqOAQFhtIl/DcS+j7RiSxh8W8/dNEhmT8Fwa9uswFEnIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fX49zdX/Vbmqg0ewWnSsr+q8OP4X/A2AO1yoBz9a0XE=;
 b=g82wF8z7X3/SaH66l1141SLwG8e98AulnXXygyNbW7FMRp9afi+LJSmy18HAiYDqIzkl3hCoDCObKkeHPs0kcwiGc/4uORImLOsrplqWfANFdbvjtIvrh/s2sjVX896iSmNRMpfIk06Kb2bT3tM7bqwyV+uOKanIhF7mAz9pQL24B1YHpbwnzHxmuP0T2jgxsP3f/TTrWGttZZdvuiWhKB0fzF7oJaIftD/eFTaUS1aJtlkC2pb/TLzvpNCr5gmJA4Jr6wywU/F96egN9Aow7Nvr0CsL/vQozl+cLBXKyAJScEVe0BFqfPi//L0r08BebB1TiAnRaiaFBH6ueT9JfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fX49zdX/Vbmqg0ewWnSsr+q8OP4X/A2AO1yoBz9a0XE=;
 b=Effs1Hum/q5rMiKmijbURhUwYKtqXbmccwfjjaW4549hIdBVsytEVx4vEPg8b9FridgfRe3ngc/5Zxbc49E56rhFfMLD9OJkPbV1tAzYmPzNOkfgiYtdpy+xzN5UPzL0HKTMI6nvJhaALxX66FyDvahfNUPYrJIjsuaw8jbaY3Y=
Received: from MW4PR03CA0168.namprd03.prod.outlook.com (2603:10b6:303:8d::23)
 by CH3PR12MB8545.namprd12.prod.outlook.com (2603:10b6:610:163::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 13:12:56 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::78) by MW4PR03CA0168.outlook.office365.com
 (2603:10b6:303:8d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 8
 Jul 2026 13:12:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 13:12:56 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 08:12:38 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 08:12:38 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Brian Masney
	<bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Rob
 Herring" <robh@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Stephen Boyd <sboyd@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:COMMON CLK
 FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: [PATCH v5 2/5] dt-bindings: clock: versal-clk: Fix mio_clk index range in clock-names pattern
Date: Wed, 8 Jul 2026 15:12:23 +0200
Message-ID: <e742b7da70c2bf10650a81e537f1b90d76799416.1783516336.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783516336.git.michal.simek@amd.com>
References: <cover.1783516336.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477; i=michal.simek@amd.com; h=from:subject:message-id; bh=qCntx5gpIOKTLymOmKX7EtNdLa0tTZJaasVcoy9ZAmk=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT5+exmN4lr6lBOmix+KL/TcdFac4NABQmnt6dnZNzR+ Xzu2IW+jhIWBjEOBlkxRZbpTDoOa75dWyq2PDIfZg4rE8gQBi5OAZjIuksM//QVHNSvHX+3ZoOa 1Zbc/n8nJd5VnZyeMmPHs+0ZW//MOZ7N8L14tqB6Jv8Kri0Cz/zt/Y1++X+80V0n0fTi8jWt2QK XeAA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|CH3PR12MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: d9fb05d2-32c3-4f66-c0b9-08dedcf2a074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|1800799024|23010399003|82310400026|376014|3023799007|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/GU3yeKB8wV3GdNyaHSj7zff/Bs3pM06ICudbrpCUV3P+mKeJa3bPn0RuEPIqTKGZsA5KFyeB/jESIikKWyGZfWuqsJRzJY+4535qheZqK34GNbR3YEDuKettQzhOM9jZO6gsFgxffOhWxOjcKU2dbl9CCFrw8XUmQub8/02zja6n5mp9Jf9Ky+7CsRFuRMKA9+j9ZPhZ1iDIU3fy2OnafDpKFbFLVbVBOiYYCE4UEprhVS6VOeMOZItePNsv9cdvxt5FdRlAfAcGFx9GMVWNvXs87P6g2G1UoQKYZSFPecmIAyBMi685C5011QDp1ZV6xqaKJst2gbLyb2a0F1D53OFpw4JQBnI79OBcD1yORvlZwX0YMvwGS08qVbar5SpdkuEm0BA0yHrNBor7pBfSxsYJfWW1WETNkdTiqnwGedonyak1gJTT7lP3KeDe7ZC2jbX1uf7G6Xnd3ejTY9LThxvlUA9V8z//976joKCrXP+165ZKABKqE20Tidl2pMSm/lCPaC1wshAanJXku2oWfvE/Fag6In58m1/huQjbqrnjL4SaNxJvD/BmbnAh9Eoxf4YPaLMlV5yNvz74xhe6wStsH0JfI5umprAIHkV4Unm09/ONqNZTi71rtnEbng1GNCGyfL4SYdvt1vvgfXUKTVjjEXvsn2iQF8UhjOzE5BswbgtkMbQmZPsw6f1Bcc7ajoK/ogJOMbp6YiE56ZuIQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(3023799007)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BA6o9lRqXU/QtM57SggHwMSnFBCybj6/fRPwUo5wIjbixDUy4ywCOwMM/ppbKJa0EYPo9JPLwEc5FvnUCcGtYGemikZngFVjvWS+PMzdPWtX7C6x2n1nUqjMgYDkTDINTRCK0Hxb4YTHv7dzoeP9dRIaAtmVREmlDxXDZxr3rpM+PvHaXSEhL7fabQupsE/8TFICb+qksB3EYRYHT5zpuF4KWdw1+g63RpnL9JTnPV5LI2IY0BX5rtb9p4zmJzFpAYHlWodvJmdhuOp4zn57UwKtyhOuxn/VPoCW7IRW0utRkHRqInBnhSDgf5dv9SxoSq1Gjj264qFayIJBxdFC0vr1rDE1lz6TMwdXii9ZkuPOJNLrBJGz2WBCW5BkIXKnVmwV71prknZ1ZI1n0tjTQ2zdYqKyXVlUkvb7LKR9BtvcGKGspA0o/BhlCpp0/cwd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 13:12:56.4591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fb05d2-32c3-4f66-c0b9-08dedcf2a074
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8545

The clock-names pattern "^mio_clk[00-77]+.*$" was intended to constrain
the MIO index to the valid range 00..77 (ZynqMP has 78 MIO pins),
but a regex character class cannot express a multi-digit decimal range.
Replace the bogus character class with an explicit alternation that
enumerates the two-digit decimal values 00..77.

Fixes: 03d4a1004053 ("dt-bindings: clock: versal: Convert the xlnx,zynqmp-clk.txt to yaml")
Signed-off-by: Michal Simek <michal.simek@amd.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

(no changes since v4)

Changes in v4:
- simplify expression to [0-6][0-9] from 0[0-9||[1-6][0-9]

Changes in v3:
- New patch in series

 Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index bef109d163a8..b1623c2ab0f6 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -116,7 +116,7 @@ allOf:
             - const: pss_alt_ref_clk
             - const: aux_ref_clk
             - const: gt_crx_ref_clk
-            - pattern: "^mio_clk[00-77]+.*$"
+            - pattern: "^mio_clk([0-6][0-9]|7[0-7])+.*$"
             - pattern: "gem[0-3]+_emio_clk.*$"
             - pattern: "swdt[0-1]+_ext_clk.*$"
 
-- 
2.43.0

