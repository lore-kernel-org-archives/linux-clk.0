Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795492597;
	b=brPWJ0Ku2bb2jGNWaEz6d5O+c6WP8lRUYz9+9Gj9kzJu39g/ot9n0q+TVHdgcEYCrs1Q
	 s+L8wPGh9Zx/khP6ghHFrR22Ipq6l/5C1YKsSeOMtcS386XYWugRqhCzcb+TbHRzlGtND
	 wuaJjlmstkqY9tmT642rUHh4bE/INaWQLiA9orWGH6xhU6Cn9q8NfSAr8dGE1Hv5/AtZI
	 xh0DMY74SrsXzAiwyUin73D5aVr3s3uYrPjON2ZyoF1qandu4C6+jeE08n5YAm+FRYLFf
	 QwMgzQAYhIRt4FKn28bRSqXsfx00HTXpGjGkBilulNSlzGHBh4bQOzValvLKNjYz7xQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492597;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=6bWlluDFQ5Zo9wSLkWNdOJvFRUeKlyGtGZgMbGChsvU=;
	b=kh9oO62kPHNUjwQGCC1RzE5RlHCW4hjh+EC1U92OdeMFD2j6y+DqnUbsXNMsHyPZX+AJ
	 J6JmOxzezd81jv7mU0IKDKoLFzySe0UcdDubC1kIQYABjoH4hUi62IMb068euRSwEc6U1
	 4mgo7j1PBZdeNWQQhfoBDSTlmbWL6fd3Q5aEIhQQdCnBtWELCWuADw/vU81jUJrY3dWd/
	 O2ubcSUaznwugunKJTqDDFWA4g83nhiMHwV0wu+kCXIWkkraR498lBMa1HC7zeefl8nYe
	 9zr9fvee4cIvoEWEJO5+BQQt+yhDQkEnjdo71h87FsugBkiMeVPvzcmHKXI8gFXWOSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QnamxDBj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.60
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011060.outbound.protection.outlook.com [40.93.194.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208BE606A327;
	Tue, 24 Nov 2026 03:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 208BE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QnamxDBj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UY0b8+1QwGuM+iKzV2zRtxJSbYi0/Tf1uNgzNVVM4Kb6ChNoA08BYD7xpKen+Z8xlKBxA0dyZWidrbX7viygD9dg/uMGHbpquwKY/PLU7vQAT8sAs1Wxa+WpG6Ub2iJvsxoG3aK42IGG6oHoLNc3mlJr/7ca9bim3wjMc4cJ2SsIZEDxMX2PvTQxkDYgYsXzR5iempt8tZFyZRn1vHG9Vbxv6i+0+CvLp9R1pgb5TfdgVMkWxHU+hYitV1oX1vH8BAxpiJDRo+Xv4jZPVQnfQ/WzJhiaFrIzdf6Z+VM6A0dqdqwWaD6wS9dAq6/DN/UWaJXT3WlECrXTsiYPP6YTlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bWlluDFQ5Zo9wSLkWNdOJvFRUeKlyGtGZgMbGChsvU=;
 b=VYZNuwRakor2dwTVdqgI1HC5Oi9mCGvH1wKXiIK03dohV1ZcfvmNrKIVPlwkclWGdqx9X4OwI5Fe83JHL977Wge2DHLNWLhS/AiyMEvL6ucQBztbJEDVqHiqVnAUizB5cqvj7fvQtlggHDPzmwE/Upx+07C+lwX3sei8o+Dh9Qz6nCchA9n44IkxaQh+R5CfsfhbM6+NLFQ1FyIF9kIADGO0Vq9nWXTTeVRmdQmEpzJUjzOpzJJKh8lOIS0d7AGYxodi9tfo6TFiy3+59l/GPhqea+lo6Jq7WTSI4TtXSaOnl3ti5M/08XyolfCSLKt/MpQvSDC474DU8LKSke7QMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bWlluDFQ5Zo9wSLkWNdOJvFRUeKlyGtGZgMbGChsvU=;
 b=QnamxDBjO91ZE2relRBB79o9crJR4zPjKM3jGRP0/jbYw7lBm2cAoh4ytJwW+qOXukVfktLaDjPgGls3kfjEv7ebrqf36orENKwk0zAJ1nxUk5V2u6deM2j7Ah/CbSCQCzmyDhz+8sCfMN4LTFipAmqNf6ctRXpUzwqQe6ly76s=
Received: from DS7PR03CA0177.namprd03.prod.outlook.com (2603:10b6:5:3b2::32)
 by DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 03:56:30 +0000
Received: from DS8PEPF000000E2.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::29) by DS7PR03CA0177.outlook.office365.com
 (2603:10b6:5:3b2::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 03:56:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS8PEPF000000E2.mail.protection.outlook.com (10.167.23.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 03:56:30 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:29 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:29 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 21:56:25 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 3/8] clk: clocking-wizard: Move clk_in1 acquisition before static-config check
Date: Tue, 24 Nov 2026 09:25:48 +0530
Message-ID: <20261124035613.1968260-4-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8PEPF000000E2:EE_|DM4PR12MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: 43bb3fe2-e253-4d0e-d30c-08df49deec37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|7416014|22082099003|18002099003|3023799007|11063799006|5023799004|56012099006|261009223027099003|261021123027099003|261022105027099003|261102123227099003|261026140227099003|261028144727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	tK3SB66vHPG9oCyt2vi/BIIWLYUH8JrpjKNtJwAiHWsxsUtwXj3okbfRXHHQgTsghiz+ShDsLOBUbi/4A0mDJtkU5JvZ7tNvcKCdO825/xZsg76YThfLmJoni3syrutCZA1fQrnSZ5jNRLP10UkY+1xdKlnlZzHIIebfp9g3ryRBLbcAo1tu3iR0GhiddHLZfu2mRJMH8l45PzultbEBB1ldVOGq3iBUDydNd/aVAxMyhBHUCvU7bXqR+VIOPKt8nXu9hMMfX7CZQI999PuNJ4WqdMCC6h/jmylGChfeje6wdv/gn+75m9oxMzqwacPgA2vyfZUPDBTc0s9bOxX67Y4YZ0zR3ZAoghVRvrxdjufWNDADVgeXqCSDfhWTCWVh605QjuO/Q/70BJqusF9ns4Uey4rmvuQiSsLcq/7/ykV0Uek3T3fDl8HE1Nnt1zrAZOQQnzPUlP/dfamiB0ul9yUGtnRUM4p2vu+0HEcpMfIo3kf2/zuR8sf8gFjHJ3cdMtWi6xMpcSy9m94QPeilFfeMTNIoBK3vwkv1votuKbRelTFocSUziS2pxJJf2I2sg1YWdpSfP7afggzEHhkmssCVm8dlYPXhZX3lEPq8+j7Ts1B0f9p8b4ladRjk3tGhPwrxqekLjzKxHEytI6wp4w6CtewgpkbbC//tqwXVOwCObLB2cQgwqOocEdb9ZoWbOzJkxO6Oxea1A5ZosMgZzA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(7416014)(22082099003)(18002099003)(3023799007)(11063799006)(5023799004)(56012099006)(261009223027099003)(261021123027099003)(261022105027099003)(261102123227099003)(261026140227099003)(261028144727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o3CXV+iyEhPVJU1WlQEgzOalIoyVQP3znz7MpR6NJomhLXhmGfnde+Hagop2AUhoAYkQIqpZvDZ34K5Q7Rjsl3pXyLbocqviwnJRwbHxdoTWzWd4cVSV7wv7SK+6JkMqewHAdlU/spKBJNjHPYigfO6PNT0/iJMvp9dXJC6fHnmuK0gYpyNykyQydxQo8FHgf9STAfHTukQwjahztJ2sOgv6U06StDb85G1E7T3AA6X2DeZbv4Zo3TVFoSPCyBIuIhTNqVsdD7PqcDgcdNphDI4mzHM+1hDO+PqqAE7NYRxHFR7AnySgWa2L0vecsmQ2S2BSa3JiP1kerUe552qx1PTXj698JQg6kpWB/d7k6F/lcsQwJlNzqKk+6ocRDac9gQXYOHdF+sc0NY1pZq8bAQKaUZ3+bxCzBtG4Z6jbH6GtxVNprjmyAasf2KDB2OQE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 03:56:30.3727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43bb3fe2-e253-4d0e-d30c-08df49deec37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS8PEPF000000E2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6448

The clk_in1 is the input clock for both the dynamic reconfig and the
static-config paths. Acquire clk_in1 for static-config as well. Output
clocks are registered as fixed-factor children of clk_in1.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v1)


 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 3c8e1b082fc5..649cf2d21943 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1314,6 +1314,11 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	clk_wzrd->clk_in1 = devm_clk_get(&pdev->dev, "clk_in1");
+	if (IS_ERR(clk_wzrd->clk_in1))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->clk_in1),
+				     "failed to get clk_in1\n");
+
 	if (!of_property_present(np, "xlnx,static-config")) {
 		clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(clk_wzrd->base))
@@ -1328,11 +1333,6 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 			}
 		}
 
-		clk_wzrd->clk_in1 = devm_clk_get(&pdev->dev, "clk_in1");
-		if (IS_ERR(clk_wzrd->clk_in1))
-			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->clk_in1),
-					     "clk_in1 not found\n");
-
 		ret = clk_wzrd_register_output_clocks(&pdev->dev, nr_outputs);
 		if (ret)
 			return ret;
-- 
2.34.1

