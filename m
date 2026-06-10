Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023107.outbound.protection.outlook.com [40.107.44.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1A01A3029;
	Wed, 10 Jun 2026 06:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072243; cv=fail; b=q99h6TiEOPiS8eZIx3YDNfqHNIAJZTAFmRVp4sMVsyXrn0xkaln0HpOrCKOS/dCu7zVnqssd/1mTECIL+ecgIphJDBTGhpobtFUlQRxS0xLgOtWmuxzeSCcb929MnZrrMiy4YJdqMqDZOXKnqFZuDB8Yhdbxb6wpcrA2Hx+AAZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072243; c=relaxed/simple;
	bh=J4I9WTFtywDyUD7GmEEZzE8sDsumYbGqDM90W+J7aBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d4H7sza4L9wpSXEMik0PHPBUp6lQ+vnJr1CtqsNXI7wMcczLBAwAz/GIPWpUImHO4IyoxD7Y98TYspGDJ2ribD3HFrIbtogtziLgJ7oYWBYGdG3+F/Xx7YSUcemAxM7m75dymAyphxmhgOWd82pGQJffmq9EKHJvx3iDEgu6TnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwWaMoY2Bc9E1x3AYGxvgaf6PS3b30o3KoY2Rpe3SyYkLV9CsgmwfbYKFkhetvmLzyO5ZDmEGr3jb/iMAjNH8H5lJt1r8SKu+kOuX/yIy9e+l6tRdqBA84fR2hTbhNWF6uSgqHP5b5mq5i9v0NGuGZFGNCbkr43UKvGB1iMD/dOoQcViRlwcVxlrTU4J2WPyND4Ddv/55tPHmyQvPffHNJvy0ScQdueBVnCylLqHqtB5uEzelPwdQwLh0+Ech7JlDmME+C4b/vL9jbxxTlJQOTlTX21kYAN5EXzgUumw/foYEEmSivN1moDrrbnYjO5zGYoV/M0wy+UkQ1hAotgnCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8alqY4R5hutRsfyBo2HXDGln7eQlwJBz+LYE97EJFwA=;
 b=bHOrH7uB93BldXACDHdkMyydAaC2rd5WVG/ZHojj1gkznS2vGSVvxxxoGIhz0q9pRaOpC0etrc6RUZKFdu4AHTKijw2fLh1RaZbDZyqZlrEwrsuIX25Nnml4N2OATIvharuGyFKyqzouwHYhJw3LhacJp3KVnuKLM0n+4VhnoZ5cXpZR+RuafzJG6foazW9uH22RfuAhFIEsb7WzcFn/Y5SqlafMzqbFuzZXNsgNihUEF8kJFMxMx4GYsrka1YL7zRy5aVhyRlnfeK7iCjnjoY+N199ccQo30R3pZRpU9ONwj4WqjWDKs4dEQR5+e+nZy4qHSmB1FeOQ678/aYNohg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) by TY0PR06MB5731.apcprd06.prod.outlook.com
 (2603:1096:400:271::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 06:17:17 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:192:cafe::9) by SI2PR01CA0026.outlook.office365.com
 (2603:1096:4:192::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 06:17:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 06:17:16 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3D36A4084274;
	Wed, 10 Jun 2026 14:17:15 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v3 2/5] reset: cix: add audss support to sky1 reset driver
Date: Wed, 10 Jun 2026 14:17:09 +0800
Message-ID: <20260610061712.3203984-3-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260610061712.3203984-1-joakim.zhang@cixtech.com>
References: <20260610061712.3203984-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|TY0PR06MB5731:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 89ba2c35-446d-42ad-d2bd-08dec6b7eb6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|1800799024|376014|82310400026|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	du26nou5MMsfAXdm1HBr04sb8UiUnaZgIXFp48c/M+yErr7ce66CWU3N76NzFlTBTYb5z+Kh9LOh1QHitfabgX4BxNiEbQ2SgpuCFjOWQyPEcHORFZmjy0vmfOLHi/Ly8lAqIUzCOH0cDtWlF7H811RXRDPmukKpvythZqM7C36Apw975T4hodVndnNYgPjf8uhm9rT2v8DNjSyUYyM8s8WjfZD9DuRNXIGbGjbV1R2wB9lo3gpPpwIoEtB4ZzIFIvTkb0yN+5PUAGUxG0xeBwAgNDBieTVCJW4nfSku1QGdL9OsFXydwo9KmB2vUiw7iFeOMu9XoXTwx7mEVe2Q85NGPChH/oIy4HR05nVAFL1KZFoqnlFuEuOG08jqZ74Gb/5LNy/k6fjK8OtYAvdZwamWRpS9Xysh2MnxZFvkAyEBw9I0eYi5h9+gCKr29gWT9di+scd4vueAY68A8lYucw41s+CCOLk07OxGQZjoFDbqpk8zQacCSf3jUEgZ1+aDtpSeMotBdBydRAUcQ6SLTmQpKcJ0gHIYM7UPnDBv2vhMLajcOfoycrBXnN60QCEJ0ZtPXGSJLLB9Et70twx8pXkqNzQYGqyo2iCxVhoJaT/akP20TrtJ3m037T75p0EpkSuMCSK/m919aGNxD+VQeUT33Z2d8eiojaIEEah3Q2DeLGzVwDJiiNhbPENVgrctRsep2+Rq+z3Wa8nrLyQhOncqpI1rYkiOutI4h16seHY=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UPPs+k6ziT80dBH5NSvYEfA46Vr1Bub25AKuoHOAC+tlrx0ucCIBNQVG4na8sR9u6cr5SEERYoYq8MZ2Y+lNVMwOSZ8X5Kc0+LpPn89ynr+LjgRRqMJcfGe3/9/kTtV5fYsKJ/1GYT5q4Y81bQxKL527f5KcVxLa7nh+8zCYjTCyAV+o1R36+270Ypaj+5EflySjYD/o8vp1pk/ew9NYytvz/gdOA9q7mRUQhkcW+NMk+XDTVKf7+woz0W6AmLWujmAN/VMHuW/4VJAHLwm2J8BX3uBASj3TNjHvM2txWcBdq4FSnyOqK2Dr6dqmzYt0gWNfAUn911x4GlpK2w0MhFl/3/gwbwzRcDjoLThihrotMU0u6QrU5kuVGs2XYjs9Ow0W/bpFLfDWm52m3/NSeo/XpTbUis+VPcsC1ph8noea7NLFL48aHu1EoTD7On/u
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 06:17:16.2570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ba2c35-446d-42ad-d2bd-08dec6b7eb6b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5731

From: Joakim Zhang <joakim.zhang@cixtech.com>

Extend the Sky1 reset controller driver for the AUDSS CRU syscon. The
AUDSS block provides sixteen active-low software reset bits in one
register for audio subsystem peripherals.

Add a device tree match for cix,sky1-audss-system-control and the
corresponding reset signal table in reset-sky1.c, reusing the existing
regmap-based reset ops used by the FCH and S5 system control variants.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 drivers/reset/reset-sky1.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-sky1.c b/drivers/reset/reset-sky1.c
index 78e80a533c39..88100c631cee 100644
--- a/drivers/reset/reset-sky1.c
+++ b/drivers/reset/reset-sky1.c
@@ -16,6 +16,7 @@
 
 #include <dt-bindings/reset/cix,sky1-system-control.h>
 #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+#include <dt-bindings/reset/cix,sky1-audss-system-control.h>
 
 #define SKY1_RESET_SLEEP_MIN_US		50
 #define SKY1_RESET_SLEEP_MAX_US		100
@@ -258,6 +259,34 @@ static const struct sky1_src_variant variant_sky1_fch = {
 	.signals_num = ARRAY_SIZE(sky1_src_fch_signals),
 };
 
+enum {
+	AUDSS_SW_RST = 0x78,
+};
+
+static const struct sky1_src_signal sky1_audss_signals[] = {
+	[AUDSS_I2S0_SW_RST]   = { AUDSS_SW_RST, BIT(0) },
+	[AUDSS_I2S1_SW_RST]   = { AUDSS_SW_RST, BIT(1) },
+	[AUDSS_I2S2_SW_RST]   = { AUDSS_SW_RST, BIT(2) },
+	[AUDSS_I2S3_SW_RST]   = { AUDSS_SW_RST, BIT(3) },
+	[AUDSS_I2S4_SW_RST]   = { AUDSS_SW_RST, BIT(4) },
+	[AUDSS_I2S5_SW_RST]   = { AUDSS_SW_RST, BIT(5) },
+	[AUDSS_I2S6_SW_RST]   = { AUDSS_SW_RST, BIT(6) },
+	[AUDSS_I2S7_SW_RST]   = { AUDSS_SW_RST, BIT(7) },
+	[AUDSS_I2S8_SW_RST]   = { AUDSS_SW_RST, BIT(8) },
+	[AUDSS_I2S9_SW_RST]   = { AUDSS_SW_RST, BIT(9) },
+	[AUDSS_WDT_SW_RST]    = { AUDSS_SW_RST, BIT(10) },
+	[AUDSS_TIMER_SW_RST]  = { AUDSS_SW_RST, BIT(11) },
+	[AUDSS_MB0_SW_RST]    = { AUDSS_SW_RST, BIT(12) },
+	[AUDSS_MB1_SW_RST]    = { AUDSS_SW_RST, BIT(13) },
+	[AUDSS_HDA_SW_RST]    = { AUDSS_SW_RST, BIT(14) },
+	[AUDSS_DMAC_SW_RST]   = { AUDSS_SW_RST, BIT(15) },
+};
+
+static const struct sky1_src_variant variant_sky1_audss = {
+	.signals = sky1_audss_signals,
+	.signals_num = ARRAY_SIZE(sky1_audss_signals),
+};
+
 static struct sky1_src *to_sky1_src(struct reset_controller_dev *rcdev)
 {
 	return container_of(rcdev, struct sky1_src, rcdev);
@@ -329,6 +358,8 @@ static int sky1_reset_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	variant = of_device_get_match_data(dev);
+	if (!variant)
+		return -ENODEV;
 
 	sky1src->regmap = device_node_to_regmap(dev->of_node);
 	if (IS_ERR(sky1src->regmap)) {
@@ -347,8 +378,9 @@ static int sky1_reset_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id sky1_sysreg_of_match[] = {
-	{ .compatible = "cix,sky1-system-control", .data = &variant_sky1_fch},
-	{ .compatible = "cix,sky1-s5-system-control", .data = &variant_sky1},
+	{ .compatible = "cix,sky1-system-control", .data = &variant_sky1_fch },
+	{ .compatible = "cix,sky1-s5-system-control", .data = &variant_sky1 },
+	{ .compatible = "cix,sky1-audss-system-control", .data = &variant_sky1_audss },
 	{},
 };
 MODULE_DEVICE_TABLE(of, sky1_sysreg_of_match);
-- 
2.50.1

