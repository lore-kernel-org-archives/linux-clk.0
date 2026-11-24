Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795492607;
	b=gVDq5NhINnxJ7JDoey+Irj5guUAth6ETwfxR/11F6n3PMstui+5b3gYeR7CZvmjgLXBS
	 pRlu/DPzD9rMVPa5bPC/wsy3V6VVZcG858+gsl83CcMfMkG6AU2GKnan61Xi3tIJsZsHh
	 OaPxi+hWJs5vnp+MrdXxR4IE4JuMV8al7NXFy7Umi/UrP1LWR0AKzOPsENbczyPyD7QrD
	 vucSOXtphhofDwsu0cGNJSU7q+g6g+xECQ95WPY+Iw0RhVvXeLZiwkwnf1Z4Q3d2lOXrV
	 bM8n20MMmA+ACvhFf2Y2SLA0GhtfkNSChxQYi2CwwcgqmTf9FcSEdk7nBmsrImLOtxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492607;
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
	bh=ZGdorF/41IyVyBqcUesnUhPl1YWUERWGX7u+UM8ct4c=;
	b=KFpqanSfjq3PXF+2G3Y686WMesq+mMWOTiXSvhwOcGri4tk2XcvFTur2dTzsTCWcYfXa
	 QHqMd/tRQz8hvF9RD9j54V+f8h/gJfddgLgG3u24L8DljzojnWRhyMc1ThSCOecVNuADT
	 bcIBAGkvYV1puQuqvn+0P6+cKW/B2m3vIQY4HO5wJmK6DpbHwf4e1wXodX4Jjlb8plVmL
	 7larXcNFGpO3BN96DAlVvoxtTfBvgnJBYLem0lJRbExr8uBhzFqAUvgwC2mMCeVwL6rG0
	 T1qCF7YDbMSOIjqwNFRSxATFQlOop4VtAbOJzZrSOliKIKMguA4rkC7E/La0hAIaA2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5QA1aREY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.23
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010023.outbound.protection.outlook.com [52.101.46.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC94D606A698;
	Tue, 24 Nov 2026 03:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC94D606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5QA1aREY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJv4oRrM0eV9HRURBbrdYEqASDgjwhoBMsJuDnA3a1+3gLGs20Hy+UHrrezNzFIBGnQk3YTHUyZk55islR5/QwXSL8PNoh5m1Xea6fcpNrdVqrEfqR0anI2RAio87lrg/JhIRNm28jRY6sgqIS15yj9Jecf2h1CFqOo8LEfwtSDtDpyWAjVmM7AVI1nud1+KpFjBOc25881dLlXSEGCj5SeOVkgvj/nArBggSqkQOkloC/WVprLf3BWoX9QkCu2Z6B6qnoOK0X8lGXABnUhGV0IL6p0KImCBmBsoiX3gVTYn7m6IK6fcd46VedVOP2P/XF6G/O8soTaRr0YQuNhIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGdorF/41IyVyBqcUesnUhPl1YWUERWGX7u+UM8ct4c=;
 b=ewDdS+CTFUdw1ZAtl/BnLTVTejUIqZj1XX8XvuEMlwxbCSCL0hxWPYBZjMe/bjv1H98ty36pAsaZ1+qpxSQNqdXqR8Qs6/u0U90vnAxqlxQ2RXhdK0HyvejVqZtkdQe62Vt+8veQbcJgRxJTavO09r7Lokg4vtV6hs1qKhk5v5PnqeEfAQ3VnCpNhZAmtC4Bjn1Z8/Issm3hY6FGQLjL4Gm1Mv3WpleG5gLjPdt8Vp6al2h1HjSibxGzDtJKinP0CgYeSGxPEzaLDPyAPZyJZBCPXPsNVeQhkkFizHOvYTdqHBqKyzxXdUg+2eea7fYEA83h+hJ1xlUOHMEVHbrwww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGdorF/41IyVyBqcUesnUhPl1YWUERWGX7u+UM8ct4c=;
 b=5QA1aREYjHTaFNc02xigfQIXNdmCe5rceLkLYXAq3hCjqKzCC4XSLaLGMg/h0SUU+hdbv5Xuwp52IRxLWiCDWa1s7GISoLDKOBDUHDxpgxb2G9N780iJQlaIOXN7QJ8BgPGuCFxYo2R0xx7V1ZQqJGCw5jtksx1ACDavKqFHnnM=
Received: from CH0PR08CA0018.namprd08.prod.outlook.com (2603:10b6:610:33::23)
 by PH5PR12MB953872.namprd12.prod.outlook.com (2603:10b6:510:501::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 03:56:42 +0000
Received: from DS8PEPF000000DD.namprd05.prod.outlook.com
 (2603:10b6:610:33:cafe::7d) by CH0PR08CA0018.outlook.office365.com
 (2603:10b6:610:33::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 03:56:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS8PEPF000000DD.mail.protection.outlook.com (10.167.23.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 24 Nov 2026 03:56:42 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:41 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:40 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 21:56:37 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 6/8] clk: clocking-wizard: Use dev_err_probe() when mapping registers
Date: Tue, 24 Nov 2026 09:25:51 +0530
Message-ID: <20261124035613.1968260-7-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS8PEPF000000DD:EE_|PH5PR12MB953872:EE_
X-MS-Office365-Filtering-Correlation-Id: e50709d9-73f3-4694-5a00-08df49def34f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|23010399003|82310400026|261028144727099003|10067099003|56012099006|11063799006|261021123027099003|261026140227099003|261021121427099003|261009223027099003|261102123227099003|261022105027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JanlwLo9bndEMAl8ZveO2AqAdalfgdrql2178lzwClMWhGqudXjZZ/GAC7JbjKKMJoA6UgkvZikJWV61ZCEcqnqf0j5QBUDSzmO/lthZcktPTdF6GWrMaqnIO/dlWc/xPk5Nix6Flrww70Jx/YbnbvuNY5c+FrDNTgIiKMI2XUvx76M9jmWt1DIUNVhXlgqnC0AR10debfSJLWS0PlhGMV4vAQObJJfy5lDOAPYmgXbvGtCTyaxBgssqtz0HugihmrzLuJ13pCDDb7QANChAgnQvHeU6cYZGP5bOtkz5N0wZnAYqMhwXwtu+2Y1Uv/bqutN0mgDmYWRWMhHDx866l1VuX+QT3QFk141wV85S9CUuTeWAdBuEh6mX5Xyxk48SP6xC9yYA6I+aMjzNaegDHBymDNA6y1iqkBxi2V5nMyZ4RfwfRTvmrN3RA6y9EJKjNB/90KyNPL/jHAq5c761/FTm5+icjpaaeyHD0mb4affVXyrCwVlTOgemSkUOSJhVdUFTca8qWjlv3aoYZDrKS9NMpN/rnqZmbyQtjwveo/0eD4VnAt2bw1kEtk5+TPnqsLa5zmT3Jlj/8QRLoWQToxnndHFvCPGsqF6KVTCOUUyGd6zQCtLJS9Les8HuefJ6t/+QnfCH2q8W1tJ6nb2dsJ7nlns2P0Rl0k6LG+R1gV++Y6+s5pmc+y5v3c07ynL1B/LqWIv+J2HZIKWDTkGkKQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(23010399003)(82310400026)(261028144727099003)(10067099003)(56012099006)(11063799006)(261021123027099003)(261026140227099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SxvEQbEA5B6LfGjCaldakDMuiy8P/SDgYgDYLAtIYwOUPJMkWbrbUoJJryWiTZVTt8GLjDJonX6IVnetJVv3/JSuJuMF2re3eXXL8iL91TjSPDc2LwPZzcV1GcC5jO6xp6zwizA9U+C0gg7cH6tUYACgcHmoupIbr41X71jQkaJ6LMJADpYBicJ24jKnUNvOHXXMqdRer8W3ZWPY85ch8GMOrivic2Mw0eEeh7+4jzd/5km9Rtrc7kWvwKLidDaJNilJKJK9ycngLCW/ll5gPUtoMWBviV7VgscRwN2rc3bTGrUOkF0d40VpjtCtFf2BJPrdVTLMIztOtlD0HR4OTDbcD9RmtCoK1wMzWwMwocAbwshy2cG8viDUQptfK6mXmsFzf60jusKRKfcLynxSEpLiltVk+eJKrl1PD67VRdaBkz88iA2eR6A2282wTDct
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 03:56:42.2763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e50709d9-73f3-4694-5a00-08df49def34f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS8PEPF000000DD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR12MB953872

Align the devm_platform_ioremap_resource() error path with clk_in1 and
s_axi_aclk handling for consistent logging and deferred-probe behavior.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v1)

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index a3f4c5d6495e..7fe8d0d4cfba 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1414,7 +1414,8 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 
 		clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(clk_wzrd->base))
-			return PTR_ERR(clk_wzrd->base);
+			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->base),
+					     "failed to map registers\n");
 
 		ret = of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_grade);
 		if (!ret) {
-- 
2.34.1

