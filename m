Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795492733;
	b=3juiGHKy8usIf7NO2hUVMD61fNYbQ1pbWhdALDloz76JkK/s5s6veZHsUdDPAmIPNKe1
	 9VBnbjJYTezkQCrivS0fsNoq43yinSC5zlFhC1d9xcOXk5g7OlViO4PA6SBepPssyEARU
	 0q8cGJPTv4ltkyz/mpNcjIN8XR86kVHa33/c5IEXSyB0kSu69ttliO8gvdFI/ekGwVxi5
	 JGlds6qPacZKbcIKHvg022Y/KaBUGNiE3kil4Q3FAoy1aBAT2JHC+cQlTImVfS/zEAMj1
	 dB9U+0Bi4J/KA9UDELDZRE7j0izpF5PLfCBn5pAl34PdkFWMtUljYF8tRAOedbYogGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492733;
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
	bh=baPHYrggxoOLvarHOfIl1pCBNTJ74QC7TJKrXOZSnO0=;
	b=OGW+pQh0pWpnb+tiTeCl00JCSpnbWvmJJr/l+1aSg+hgv8hv0DWoMwJAJpBIiX2hj2Ej
	 JMrfUtrbvTVOWkSSzcpbYF5kUaGo8wkLW5a3lPE+wtT3IhJ50W6rziTMRSleaoJFNXFYX
	 iWr3YF2NXoZ9wynMtQ5RLFooB5X05w+g6ms9jxlEaWW+2XG92V7GJ7/UBtymsWJcOYzaz
	 j44Hdy67xl27z55Kqd0dAceaW7dKc3jM+Y6RQC5WqFh24WCbWTqr7ZPNUw0s4/CcmJ9LW
	 unGblzV0js8wr48RmMJ1P8lT3cXtf0VNpQtchfdSkseJUyFleL+V0/KyS2cX8Hii4yA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rDWxIiFV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.9
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013009.outbound.protection.outlook.com [40.93.196.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B02606A68E;
	Tue, 24 Nov 2026 03:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72B02606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rDWxIiFV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGOHIqAA8sEYoYSB+R4VWcygr1qyG7taEFZNHVvP/AsWABHgSBvGWRW1/zPK8siG4BcsZ2ykC+NXtCS+jQe60vTsbB8pY7kdu+AmMZfQolmJVHZrgZlau+m4tbT0IT4ZCAvgF4ljtmHWR8+IkhUJ6adJGwF8GTZG3VhgOSuWAy+xG8C+2y3FMA9+uh6R1ywSnqZVbOncTl4rcEZ8/aKkkSZ8waaC/z87QE4o15c4A1q6PNE5dP5qi4wCkr808UMa7whZcFMOx4xytMOFtKrkyaqvq9jZfpm4hL8jgoHWNOKr8yUli0LJyxapkQY031wTIifRzzyTNJcymdmhtEpOPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baPHYrggxoOLvarHOfIl1pCBNTJ74QC7TJKrXOZSnO0=;
 b=CRv1gwqWXUT4oZwIy1WPbn0r2wKBDERevuB/z1Mg4wZN9jUXdBsXsJqWeqef1aQbWYi/JhbFL91dBO56aoTU46fS4nfIUlB/97XV5ZvKhSBam+DozPL6rXaFkjoZJGWlP2cdW0fxDfqH/FicZ1yWJAjOTlKY12R2UsIOo9ppydlRDeliXUzvLLHBTUHxran61c6mTNYQkFTb9N2i4Q9Ym2uFTaNrROhp4lTCqffPouqQzo/S2jFx0OTp0IirWpqrYIv2C7ia0vwwTYYdwKGmYVQIlaWfJhddrOdIpAb4rNKLYx83bj1hRp8CL6XhRCueJtgCH6Kvz9fJfl6eDkuDxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baPHYrggxoOLvarHOfIl1pCBNTJ74QC7TJKrXOZSnO0=;
 b=rDWxIiFVBFor5WbYYEwqMX3Fbn7Tbxt3vLix+b6gp+h2Qr0rxGWL+HkNBXh4txuHG4rvnbDfnfmI+Z8uybuEbYW2mkuJqMcpuMaqt3y5pt2M8/MT9fc9x/GAzF3QhhaxebQk6Ayyo1bC5MLxGSCr6F8xRTb5HPT4lfNy+nzEl4s=
Received: from CH2PR19CA0023.namprd19.prod.outlook.com (2603:10b6:610:4d::33)
 by DS0PR12MB8526.namprd12.prod.outlook.com (2603:10b6:8:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 03:56:46 +0000
Received: from DS8PEPF000000E0.namprd05.prod.outlook.com
 (2603:10b6:610:4d:cafe::5b) by CH2PR19CA0023.outlook.office365.com
 (2603:10b6:610:4d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 03:56:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS8PEPF000000E0.mail.protection.outlook.com (10.167.23.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 03:56:46 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:45 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:44 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 21:56:41 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 7/8] clk: clocking-wizard: Fix division by zero and unbounded register write
Date: Tue, 24 Nov 2026 09:25:52 +0530
Message-ID: <20261124035613.1968260-8-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS8PEPF000000E0:EE_|DS0PR12MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a5e5ab-c34f-4d0a-18ef-08df49def5c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|82310400026|1800799024|376014|261102123227099003|261021123027099003|261021121427099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WsV/Sb/ujuD2nlifee2DIChhMywUXHFbziGNuOtz4sIAWklf+ToiOU6vd/aRRCtZ8cG9CgVHO9/OzN8iBBl+sjcojG+EfdizokOjwNVA1ojabXScaJjlbj57ym0UNV++JLBWg8HzTBjY1tR7lUZOB2/DrBXl3hezErxfXlT1bD3lblP6Hr/9oNZkVX/W20w9Bd/DiL7SNyLqbXfoSXHOYMbRWgBuIZ7hf2ffnNG7YOD7jxEtyLau6dozMMADXK4D/qRU/SgJsIfg/Bc277Q7un7h4QFfDIY+vXIUYkdJfF4iOFxfGUi6xp2Isc4jvhrWBHJLHPjpTzJ4Al0E3rwgjY0Nk7V9eFwhnMw2kCggbiusvubrK+WUO/c7kWzeMQ076opXyIZ0hn/f40mA/90mfBUaSmHZ4Q9UKPgBttxjzy+MnIOXmYY22NbvrNBor8rgrLVBRb4Pr2rtQuyZesowZvWhXaZd2wIvEeJtuJQFAFSg9Inx37yEAeufI/bYHQH1+pjNQXTYcNlpcRzm0h8lMU02JautBYJhAtmFgOon9NVCL+bhlStd9DufBVZdgHuDLh9sdhtPUA68yFoG+hM/2IHdL3h2sruGcK4g++TltBNLdXzeDt+K/UuNrbRTqs7PJIYlJSf3XQpv90fAASw3NYnIRNbpjQJLPAW6cPJt4qgFpfrOzUxRfic8Sgt7qc24RgtbuKp3/kxEiHim+/ucyQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(82310400026)(1800799024)(376014)(261102123227099003)(261021123027099003)(261021121427099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8jOt/pLQaPFH+SG6nDHX3U/5QYn85k4UexG8npk9Rs9t6msadEYfoRxe0wEeRYqjfrx7YzOcgyIgi1a1kW96zRUr3qSXEwa16NNF+/fIdq39o7Dkint39DfzhP9zOBO3CYYX/eFdQU+S9s4Mlk1NJ62lvrLz4B7Y7iX7P2Nvl/LUUJgWq8Yar85/rPpsdX077xqsN3BXhSprFyNLGz5WmmjjU4lycy1nzcX6qCXpMYh1nrnYS7lQIfjjVPLLyOTJ7ecV14u6HOzivX39E4jBIEG3QWDyJOoCS2gApcrNZ8Ud9oR1gmcqGA6zfdU1Q2alBaTOyJ35fHtPVQuhAOFFxawcn/P2qWmD9+34/T0NBKHrrZO5SgZix/thWU4Z0g6QBQzqQ2FM/paos6dQkAKwoE/ja75wRDNsKE9rUbecDNOfkw2ifqAvH2A1REkup2bF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 03:56:46.3734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a5e5ab-c34f-4d0a-18ef-08df49def5c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS8PEPF000000E0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8526

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
- New patch

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 7fe8d0d4cfba..046efa5c77c9 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -303,7 +303,7 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
 	value = DIV_ROUND_CLOSEST(parent_rate, rate);
 
 	/* Cap the value to max */
-	min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
+	value = min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
 
 	/* Set divisor and clear phase offset */
 	writel(value, div_addr);
@@ -341,6 +341,8 @@ static int clk_wzrd_determine_rate(struct clk_hw *hw,
 	 * achievable
 	 */
 	div = DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);
+	if (!div)
+		div = 1;
 
 	req->rate = req->best_parent_rate / div;
 
@@ -355,6 +357,9 @@ static int clk_wzrd_get_divisors_ver(struct clk_hw *hw, unsigned long rate,
 	u32 m, d, o;
 	u32 mmin, mmax, dmin, dmax, omin, omax;
 
+	if (!rate)
+		return -EINVAL;
+
 	mmin = VER_WZRD_M_MIN;
 	mmax = VER_WZRD_M_MAX;
 	dmin = VER_WZRD_D_MIN;
@@ -397,6 +402,9 @@ static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
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

