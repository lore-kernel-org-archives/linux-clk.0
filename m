Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011000.outbound.protection.outlook.com [40.107.208.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325A63AA1BC;
	Fri, 31 Jul 2026 07:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785482496; cv=fail; b=pSK8ZmON/9SEB/BvAHDgWDkNMiaxqiDJ7RKVzuAMGyIKJ0aNnMIJkbHdHMiv80QodLoFYqnKQNMJw+HYN5dtO/fbIGhWou5eH2qlOOJ2/y7tbFAmJWigckNGnKkquCszNEPiAwuIKIO8y2TEFrbvO7PvAj7Dy3kNCobZ9NNmD2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785482496; c=relaxed/simple;
	bh=V47jCLmq0T60p2sKeaV+6+pFCCBCW8uOnkObHVB9Dm8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tneg+VPzdSrclFah6uVbLvt9ZKy3IiVuGwfD3sZrYvo4Zx2utSYaMn67T9FMTSdT5TaE9CV4hlguWB7AOwvIAgFHOomjA7qcwfXH9755Nc8+X/fOFlpjRofhBzNhraKp5BJpUvC3IyF+cVmFzvDCWGBNMMUuGtT3KRzrLKM93QQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4HkxqFiA; arc=fail smtp.client-ip=40.107.208.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4HkxqFiA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBnRjEDzkW0isPUdFCsDReNlelpJpbMnDN6I6guJomBH1iISFkwnb8xbwPaWGXDOpJUVwC+1N+6jftXnyr1GxJQx7F/ROqXRPnnjr4oEYeDjMkxfl9sKeG9xbKqOKDrysYtKLDfviMFHxIkKH+mEGTBXwk8/ADztSgcdEWG64iASXyXZ3Pz4RIyI8Hp8JRFlWMH+z8q/s76KxFTEOd85fB+NJc2/RvT1X/9mQBJy1ZPm37tNUyBOp6g+fdjDJSuLF6bONKC+hp7tFu9pxceggaO36Y3eihUpxjH6y+pNijjd4gedaOHmqZEcYpOmvxZVzofmoorh1filcbzVEn9TVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CicBIqSZ/S24t1h8VaeBpY8pAmb8zDhxWAWlWWlg77o=;
 b=f8VWzIMbsctG6wjZBXCGg9PpMZIwqT7tg63u+HibFzJTFjtlYIsK/rMW5cBFeCOVr8Ss8taHH+E7wSbaqnzZn8Cy/VlySoVyzftps/UBTNu3mj7eHWdzfZltW73TtnZ3vIbYC8pLH/i8uKiRDnEj3JiHGUD6jZgrnmx04EtqkuOGd/05ThVqumGe6IvleEChaaGM0rWAttNIGPWZyBkJ4ugfAg/YJHlVKCiYXHaARyGtto676eLUAilOaFTNg4Dq5oxTg6pQcSa+71NfzRJNV3k32/+78CL6ht/bZFP6Gm4fk/kOIGWjXH/pcipboeFCGzLIBjfUMK0dR0klo1ZLfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CicBIqSZ/S24t1h8VaeBpY8pAmb8zDhxWAWlWWlg77o=;
 b=4HkxqFiAVpfYtBewERrCSw0BN9awbFKTR8a7PqJg6yW2SanRYL4KMrlLpsVGPFEEz9SKgLvyd/DEDQySOSMSGkK0Bs7lnOizvCAkgrFmX6HO7bLmHFr6i0mSiIlxEnmmrnJK8LDdjHVJmKkeYZXBvXY5OZAHgXMqyAvE7x9oPac=
Received: from MN2PR01CA0061.prod.exchangelabs.com (2603:10b6:208:23f::30) by
 IA1PR12MB8077.namprd12.prod.outlook.com (2603:10b6:208:3f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 07:21:21 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::64) by MN2PR01CA0061.outlook.office365.com
 (2603:10b6:208:23f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 07:21:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 07:21:21 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 02:21:21 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 02:21:20 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 02:21:17 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 7/8] clk: clocking-wizard: Fix division by zero and unbounded register write
Date: Fri, 31 Jul 2026 12:50:48 +0530
Message-ID: <20260731072049.957624-8-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731072049.957624-1-shubhrajyoti.datta@amd.com>
References: <20260731072049.957624-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|IA1PR12MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: c07d7520-75f5-4f34-ecb1-08deeed4525e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|36860700016|82310400026|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SnB+NgdnmD3VvQgidXlRPED6xR6K+uwhXklCemrYNgfWh08GlNaAiVtTxcCfkuIWsZGaT8eVSooNbxVSeNVkMBP7lGjf9S3qwf3xA9wo2oFYmITLNocUwE943qZXOIdJNezSh3Vyrxv60H4zJAVaz7xW48V0q35QMTvWUCCerxeu17iqH57ingRj01222B1Z+PlO3N5aFJnJjz/lx7funaz+aBlGJlBOecdRey8agI3BXcouwCdIVb6A1G1aHc1QCKSfXOVRZ3i2tzav6uHXZV4YUNg86w+IYjEOjL8eD0u5ufsLpIDltCzwaK4rQqv6aCD0hR3hha+W3TQZk/4j3s0powgcZrSKUQnazw7Ukw6wN/i+le1YAepHqk5ZejuGGz5IQwGG+yaR69UHphgpvhJsb4HOfM0eUKrgrhGzfo6a3sQXbxc7ce4ZtFlVbH5x4iSwEiPWZ6AMR/uPgrZ/FntV5Y8loxGBUQdb7gKJp/A4QYKJaKEblLX5CnYn8BueN2rFbTyw9k7Gi0NBWzR3nR3U/aJvxt5tYHuBzibUsHFuooycCxkyKv4pqGAWeYtRkm8FsNpDsIq6qQw1a9x0RQwxIP64cy0vY0aQIGo/8d8/c0ugs9LqeVvnbWZ81tUodL47LIz+kSt3fLPcbHCOVgdmAbkCuzd6IdsP8uX98iIQpiMVu76ArVHojV85JZGkQBThJC1xhet5xMdF+MQ1Gw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UdSj1Oko97ot6CzBJ+gznMGKlmnxVDxW7wuQTBC9qprWzaFdZIgDJgAjxp8uYPCEWsb4k+xw/s8ifWydlOO7vCfzj7ZbfYHB/c3CjHlSMUDRQ1Ctzbnl+OsAvc47RAxfDiPjAG5F2zUTu4mxAifGefmG5ymFbqtfGgCzrmpUYKAjdlA6gAf+rIvpG4A9yg0cmzPaphDWmwaPC5PjVRdN4hsJO8ZNsYxiEzGrEjHkFMDtEOaLzkw3TpBls8aoq/zP/sbAl3oGyukHLN90TU1SVYpBIe7IBtr34JJTebOupbAPG6u4CAFUGu75ro0k15i5vm+A01NUzUo85YXmd84Vy/sKxy1NOFJxUBwdbYQ+AUD9nTuFDTkYEZE45uwmsd4X/IWPhNnnJuFGVrOXfzXi4uckou4cMb2j5ThpCUPBPic4f4jVymZ+squFjJtp3fac
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 07:21:21.5161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c07d7520-75f5-4f34-ecb1-08deeed4525e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8077

1. clk_wzrd_determine_rate(): DIV_ROUND_CLOSEST() can return 0 when
   the requested rate greatly exceeds the parent rate, causing a
   division by zero on the subsequent parent_rate / div. Clamp div
   to a minimum of 1.

2. clk_wzrd_dynamic_reconfig(): min_t() result was not assigned back
   to value, so the cap to WZRD_DR_MAX_INT_DIV_VALUE was never applied
   before the register write.

3. clk_wzrd_get_divisors() and clk_wzrd_get_divisors_ver(): If rate is
   0, DIV_ROUND_CLOSEST_ULL divides by zero. Return -EINVAL early.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v2)

Changes in v2:
Patch added

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 4ddcb4135306..b16656a11f4b 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -296,7 +296,7 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
 	value = DIV_ROUND_CLOSEST(parent_rate, rate);
 
 	/* Cap the value to max */
-	min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
+	value = min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
 
 	/* Set divisor and clear phase offset */
 	writel(value, div_addr);
@@ -334,6 +334,8 @@ static int clk_wzrd_determine_rate(struct clk_hw *hw,
 	 * achievable
 	 */
 	div = DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);
+	if (!div)
+		div = 1;
 
 	req->rate = req->best_parent_rate / div;
 
@@ -348,6 +350,9 @@ static int clk_wzrd_get_divisors_ver(struct clk_hw *hw, unsigned long rate,
 	u32 m, d, o;
 	u32 mmin, mmax, dmin, dmax, omin, omax;
 
+	if (!rate)
+		return -EINVAL;
+
 	mmin = VER_WZRD_M_MIN;
 	mmax = VER_WZRD_M_MAX;
 	dmin = VER_WZRD_D_MIN;
@@ -390,6 +395,9 @@ static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
 	u64 m, d, o;
 	u64 mmin, mmax, dmin, dmax, omin, omax, mdmin, mdmax;
 
+	if (!rate)
+		return -EINVAL;
+
 	mmin = WZRD_M_MIN << 3;
 	mmax = WZRD_M_MAX << 3;
 	dmin = WZRD_D_MIN;
-- 
2.34.1

