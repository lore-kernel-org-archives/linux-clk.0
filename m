Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795492598;
	b=nnnrkv/MaRC0lINF4xFfBitphK7sb1k7ehGeRd33rXfk9nRUnOaz5kyN3KVeEsCY4V7d
	 zePbErthlPX1pL38wJ6kNqgM5+c22pKfHewq+noCfwqPkMrYWcWUgqRe2qfIbY8u6r/ze
	 t7i0zbb9hXw0zeKamlb9Rw1bXTcIL+mMhtmjFhX7HN8p50N/DOUezthLJ6sfM0MgA29tj
	 uRCUa4izKqDyqIom7bJx4OMGNdd5BEoy4WIbIHXCW1Cr59UjgO86Js+jgR8QBIAWdFs2k
	 rcvm8bx7yzhosaQtimRY9QZxo+/wrlEyKtd/MUA79qNA1CmFtqTCI7eRIjBDahhU3KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492598;
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
	bh=Qk0OglZ7v368x18maB2KEqlOcezhryEgZkop+ji8DpE=;
	b=xK5K4NK6XReUJ6bP+6Bu1w8jZ9fJ2TFRHN2DqlUqNXUWx1jz69E1DfQhGSea/EACuWq4
	 tpv/Uuraa0ix8W+rtFm944d/3odHB108/B2umGp7KqNTmzXisqIfIuyqRCDDeWvklfx94
	 rNAG/dTAOmPCoh4N6Un95aL1bpthMpRaSb1Xjw4/aBJqUCiJjuEzWhDOm0L/6qC/ANvdh
	 Cy/z7bPbFL+NdXLTXyshE794Xh3HTmLJARMqa/w13d2+I8l8g/YlVvfPtOUAZkJT+Uhot
	 3Ri2zf89qj61sS49uykt2tX4FudPLMOQKPF8a5X0gXfHaKP5533m8DDeBcl5J23x6rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FyDOuems;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.35
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012035.outbound.protection.outlook.com [40.93.195.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25671606A32A;
	Tue, 24 Nov 2026 03:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25671606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FyDOuems
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1fOxoQnM7caJLfI861NqhYdGYI87Q3d6eVc/9EKOmlmFBEiA7JThTsvlrqofgvqujghu4lE80s18wDrsgXW2AMCcSr48V16oJ2qLqLUtxNqZD5HREv17t9ZdiDDE6lOy0Q/9u4Ufuv5U1kr5plKDpQjJaBrkC+a7voG4ibIxK2DcZXWFiL0+/ae9En8GIXa0WdjRrg3QhquGWNMcMRgwt8u8Rs8uYR33nJphI5aWD3kBc7uL6x78UXEePm8GaTaw6DV7suGM+f6YfHYauwdZvDMsvxnRmew1RI9J3wOKpgRUeVJRzdSx0nwXa7usnqGrWBKzF+0Cy1arQGxEoEcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qk0OglZ7v368x18maB2KEqlOcezhryEgZkop+ji8DpE=;
 b=DyUwfDspWZKdwt5JrMOwIB70K8O5XnUcvIOKKKeh9uxdOKdq4DVIQU1BnRmg8gNwKG0RWxC5PywZgu+LLEU1AAzJV9+5GPVNQ7kR7E4C81OIMpBf+vraoHLdi9lS91qEu9pO5ULrnz2jkodfS0NyvoYNH0I2/erf3UUDiDX6FILq2AGfMvifSMP7D6w2KGntg6bXwi/yo3WE4V6utHW9dYfwnPZoVRWa2pbOUwDowWUM1jWrV5AV2aaK3Es5jUzmqxzao/ukQLfTnBR4iyU+78cwMaGRDliS3Q/s+/JdXA5hBIDNvdkNzPs7Cr6cVm+l9HryD8sAHzv0Z0h9ms5ygg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qk0OglZ7v368x18maB2KEqlOcezhryEgZkop+ji8DpE=;
 b=FyDOuemstGsQHqg/nzfnwVNmY+XUKcDWROz0Wnu2+LMJQYMtudN6zScr5K19y+m2UGorIEF9BJRvE0CE7yvriEWwugwN9aQH9/y2dSLmMgkhjBhLPPeXrowHHBgPEBVPrfSiLguLsYnT3PIFBOLLQI7ktn2tnopwInqPxpWQ0kw=
Received: from MW4PR03CA0193.namprd03.prod.outlook.com (2603:10b6:303:b8::18)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 03:56:32 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:303:b8:cafe::59) by MW4PR03CA0193.outlook.office365.com
 (2603:10b6:303:b8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 03:56:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 03:56:32 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:26 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:25 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 21:56:21 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 2/8] clk: clocking-wizard: Do not map the memory for static-config
Date: Tue, 24 Nov 2026 09:25:47 +0530
Message-ID: <20261124035613.1968260-3-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|MW5PR12MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: 09528b24-aa9f-42de-5fbe-08df49deed9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|82310400026|376014|23010399003|36860700016|18002099003|22082099003|261009223027099003|261021121427099003|261021123027099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	7RSGnTYx/5qcEzuJKTTxSZ272IZV8StXbxVk68gy98RCg1bW5+gL7Wr4jGU2pEYqNvg3hgJ1vY+0GEAhjeKgyNZ9P3bEsjVDODmdKAFtXUSQ1vmX3vSWaAbtvT5JnEfd03fyWX6cdx5ST6oUee6tHGc4jZLW0b7gE3vBUtJ73KBGZyloiePX6ePe4XP5rcQAfWenKtwjMmsNpsaD6+glFhkhMM0xs9VBGk/bIo+bw2OUCsIZt8sh2umo8W+MaMYC/1AEXuTztqaO5pNalTZslBS/SX7hBhoxX0ONyQNslZcBTOtXO4CAIO9XI4GYO7oc1g7nV3Kn9vI9uq+sk/XCur8xh5aMVxy6jkqJyFUYs1MPcpavhenxQ3F3CQsSa0agcayR43ANK9ksKd6pipL8nmEEAb8xgYXjJabIL5AugU/YzjgStpAI/1vsc9Ss2I7LJiJNo5gpgEDoWUsfhbXaNQzAECljHtU1EXRoaYZjUizIPDxYU1VxJEjcFNFUlXcxoto9qdVyh9rskYBtSZuOTlf6fjvXFuHbNQJpfkUTVg/ivhDUyPlEEv63THvlDVQq7dz2w6+FMeDAg3SSOP9hty0OvsFlimB+tWhIL2YkuKmfTPUUXyC8BtVgUkoI5TqM94yar9QMdfu/tEB/RWwCkMKRxACPHMT6euPh5VhPLeOGPmE2/0i/X8A2WgI8PTITZjm6vo2CWgWQr+HiCOB11Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(82310400026)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hkEx2Wte/2o0Z+aEf7+e7jnMkPSqkvfB/3oaxuD1Hh16ffGxMfwShg4bvYbGAES7GjgrSdBheaSkvIKEMuiYhfpcycDqxHsCn2VH5rdjDMlxooLtSRbdLQTMeXO4agFwW5DFLJoNaH1fVY/SVHgBN9XgMG66xVahL1xN4NV3LXkl5I5OCW7rZ1XUoJrCoMDZM7A3YUGbO0QYPRb68QBfrzMR2IXnlbglO+XqCpr/mKeqZeTmQ2hD6FiS2jfADPVYhU4UtLy7sn2cffXpBButvn6CMPl6pQYi/UmNabXmC4XH6zICmszdh3qhQcihseu5Zt3xFSFXQzCKHnMN4cHQwq6c1WQ7eCyZhgf8MQZaRiGr1BX0/o3YyincyiQPNypSefbD6Z1YXTkfFIc5gGwhCi6EZLBA4zxsVnDKkgPwOGzFxyF6wHaZUNEqNjhhhuuI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 03:56:32.6423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09528b24-aa9f-42de-5fbe-08df49deed9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622

With xlnx,static-config the MMCM/PLL topology is fixed at synthesis time
and no register programming is performed; only the dynamic path needs
the AXI register block. Move devm_platform_ioremap_resource() under the
non-static-config branch.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v1)

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 71abd46b3593..3c8e1b082fc5 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1304,10 +1304,6 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, clk_wzrd);
 
-	clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(clk_wzrd->base))
-		return PTR_ERR(clk_wzrd->base);
-
 	clk_wzrd->axi_clk = devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
 	if (IS_ERR(clk_wzrd->axi_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
@@ -1319,6 +1315,10 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	}
 
 	if (!of_property_present(np, "xlnx,static-config")) {
+		clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(clk_wzrd->base))
+			return PTR_ERR(clk_wzrd->base);
+
 		ret = of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_grade);
 		if (!ret) {
 			if (clk_wzrd->speed_grade < 1 || clk_wzrd->speed_grade > 3) {
-- 
2.34.1

