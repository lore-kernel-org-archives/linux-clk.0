Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DA938F252;
	Wed,  8 Jul 2026 07:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495173; cv=fail; b=ERNqCZvv05jtlQ3SuylItR4sYhwm0GRpE3mOGZGo20t6uApVGZxqSv0Oaua9oYNwisx3TITdvuxPVoXt4Pl0LMVNEbLqmMVB8R7tMqLqKjUa6we6C8DInzkaCkMF1DZHFemcMlWgnZ18rNFPZP9QFS7c169goBZR+ZxRqppmiiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495173; c=relaxed/simple;
	bh=6sTIiZZx/SgXYaLQyszqd512yScywzZLwvfzXzTmdwc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EqR3Bhya9ThExg5/KsnMZ5OhpQc2CQLCPpCiUSjH0m7j7vtZK9pUTHjRveMHEvBsE7RXpTbIdygCtwcFY/CCsRU7PuuspH6w1h+5kOqfcyEhuuRoEn1lvdblSmY+yZY3w27IiIDhA4110C3MEkHPFFyFppHErAhawV+fA1XaqKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=f3XhuKCn; arc=fail smtp.client-ip=40.93.194.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f3XhuKCn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qd/8E9TYeiw/wbm5bs+V+AgvMMCc0D/Ran/zT6rsEheMpZ3OZfVwoIOBB4t/jJtlcIYMIwj70EDb+B/P3q4cy+GyE2SzCWFyO0wRVe6v1wglgpLOxEVqajmiI5C9REGpLtfiJRPbwZIqKrdDyw4RjVOZ7SRlvN30O9QbNTARuv86ysUiOfb8ZheIdXEEtbTZmmEsxFe7tQS/BsMaZLWkAnoynt3z1UhN7uVhdBBkcTBOw2H5vuOF7wBTqwGwoIvT3rL0yHt0lqfBngj5B6Iw31ntTGs/JMSHBYzTtJdTKC8qPfBa+KJxZUorzbsbJCD1W+3UHD9Xv0mBTBhVDcBllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ew1O4IL+MbzHM7ofBV7/FASPb2L1Si3m1eG7vRti21E=;
 b=Rvj3fhqHu2lKYgfhwXysZ1XchvYw9bbBwOa30RzGb1LJxiFPd9yKl8FqMsIwrfH2EMH+bFItLeUWgRJabiPJvOkD24SBK5Xa6uwNTSKrKtm8+pp84R+kOnti55IkmUnaFUu0s6QWGEW22Ypf9Uofa9iDzvPPei3/+KCm3EH6WCGkqPn47a1DNMvpCUV0SUWMlZk3fUGY0ChnQdk1WWNoOjOofGgjL70rEFtcD92h7y99/rmXrAPVTaclCwSrrWUHMQnGuAIUtBCp4tjSKL4lduRACsc8FVcE2RpNima9M2b436h8VmAzvcXiDXnhVzlATw4B5icKPWaQblhME1tkPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ew1O4IL+MbzHM7ofBV7/FASPb2L1Si3m1eG7vRti21E=;
 b=f3XhuKCnf0V4pUbrSH1t1DzXPWP3AZWIKgRxnFmWFkocxMQROYAVXv+Ehg+zpxSM/pD9I3EQ5LxOE25BHTQHa344x8Li4gef4eVsRxLJn32MN8j9ltvw6JmAfvFeWl0lCKL58VWjv4ENDZU96Ljgf2O7KteGC7+EuP9hwxFQd5o=
Received: from BY3PR10CA0016.namprd10.prod.outlook.com (2603:10b6:a03:255::21)
 by MW4PR12MB8609.namprd12.prod.outlook.com (2603:10b6:303:1e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 07:19:16 +0000
Received: from CO1PEPF00012E62.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::6b) by BY3PR10CA0016.outlook.office365.com
 (2603:10b6:a03:255::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Wed, 8
 Jul 2026 07:19:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E62.mail.protection.outlook.com (10.167.249.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 07:19:15 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 02:19:12 -0500
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 02:19:12 -0500
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
Subject: [PATCH v4 2/5] dt-bindings: clock: versal-clk: Fix mio_clk index range in clock-names pattern
Date: Wed, 8 Jul 2026 09:18:49 +0200
Message-ID: <f0ef921cf0a5762c0530d0f5c4fe252ab35854f4.1783495122.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783495122.git.michal.simek@amd.com>
References: <cover.1783495122.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452; i=michal.simek@amd.com; h=from:subject:message-id; bh=6sTIiZZx/SgXYaLQyszqd512yScywzZLwvfzXzTmdwc=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT5/nzwsGn1jMR8jzO3hNUMm3bE/5urI9Hv7TOz6XJa7 2a+qkfJHaUsDGIcDLJiiizTmXQc1ny7tlRseWQ+zBxWJpAhDFycAjCRIF9Ghv3reDu+TvheyhZZ NcHQY031sb9lwX6ByYvjP++WWXmwmo3hv8PDhAsaX77N0Oy8Jfx965vPLtdM62Y1bwzj61/vPv1 GGScA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E62:EE_|MW4PR12MB8609:EE_
X-MS-Office365-Filtering-Correlation-Id: d327e666-05f1-4adc-ded6-08dedcc137d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|22082099003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	jZ880OjArGXzvpCX1VojIv8eaN+s1PQKYkYjqQDBiG1wwUNE377aX31hq+xqrfuPxFnUYDgOh+1PYkZYB6uNsGc+5Xfi6/fH+IRuobawsXZZdRQW5VWDL+eMgHOm+FZPswJS0HDnu0Pf9icIXL+PjRCd1TWjls/9pad+QhqIVj7s+HCDm81qMEQBCisxn32p2QQgKGRWuXMS1qGxkqTUxNrMPI0/kZu9CaVYBVDViWofSeV9aPHblg4pgMwmfcixOrtMFhShRrgA00DqFM4mwWFpsiN+AxIrlD7G3Wtn3M83p7DUNDk/ZUDHuWujIkM1S4AZtyblJnbubGrNJUNOjCgBSiB9dtKfhfCwNI95+QEF0q7zMEj4OQart2qDRLKXUQcxz16EWizLfAwDp4S1CMQlviOF6624uJgBr7oWxAdHmBiuQrWDIL0o3KKsDKcfqB7PngzjXV0Swwd7PdDOyTncLJuXT72QvwFlfLmKg2B/X8lUsRsq3yXjRGCLSc+CbD9Rjyy8EwsBTCr9sPP9w/b3brPWRxAnF7NDapaMqptLBmvPOnzFnft+9KqEqcvodHHTDUe0tE7J8g9xnqa8sa5OVJLtThjaHMiMimnlKHtzv6ssrDGlgpiEVWXV1olhPiGMzl0JiiLBbDAPjzpZiq90e8FNphLAbjuimItD24m144L/2StJgmP8Yz6b5BiTtUVGY2gBUUO3SXqQDNCzZA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j6oV9xUL9FMON3Jpu2xz2F0xrWiQiXwROj5G781Dzvo409A2UZPQpfucdawHrg5Sr0yRDR0q/48SYfZ5RuRPyAhNsjEoxP2dOSkGngo7rXJMd/0WQywjizBfsTF8DrkKD/4H6W2Ci+vVy5HloZHkD8HSnoup6J9/V4bnNk/SsZwyZ5DRwKgQJeyqbAKPesdofbHXAiiLHBZne9zjSXT75CzZGckgwKaZmEa+aIUsX7kvpCaeJoaYYBQztd7ZSaUZUmk9Y7JfDZJ8tjXcOsy8BdjK/viTALaa4ebCzIguWH8XINkQanvggRaLbTKOLevOZb16NLYL7neyBzvJMQWWvV9tYy4EfYSOkRyk0AF1hRzZ/V8lQVgRsQ3Z+genLDPjLHcnu8x7BtRKZVwLFjKwdkyDUIs70cpQdnx0itenhLsb96SnXO+Js7/LCOYBQ4Vm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:19:15.5905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d327e666-05f1-4adc-ded6-08dedcc137d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E62.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8609

The clock-names pattern "^mio_clk[00-77]+.*$" was intended to constrain
the MIO index to the valid range 00..77 (ZynqMP has 78 MIO pins),
but a regex character class cannot express a multi-digit decimal range.
Replace the bogus character class with an explicit alternation that
enumerates the two-digit decimal values 00..77.

Fixes: 03d4a1004053 ("dt-bindings: clock: versal: Convert the xlnx,zynqmp-clk.txt to yaml")
Signed-off-by: Michal Simek <michal.simek@amd.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

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

