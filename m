Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792489742;
	b=c+VK979KKDqMWH5iKFudnAFqAtszH5t3GBEYRNctts//IvJvSj/5f1kn0J3WLQE9IXSx
	 KeFJ2g5d0x+5FEKSEchICNeMbzMNF7IgQX43qbbdRe9eJTo2436N6xsDJJJKJKO+xKakH
	 T2IgRpneSWXGHwNy6yPeVqtd9v0SVgJye6x91KU+kK061MfuRX4NW672e3ZhwQEhIBns4
	 pFtDZHPvIHIkfKTRtaIkndLlIiGBLSapyQWsvTI3+HUu5OoGAwXHEuhW6g57GgfJpl2CO
	 NHjwxDgzdMaNkT4HHVG6Cpnp0YF+H4jzYUyZ9g59gzcjnbn0NEHBbVNX5nHK2npAlGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489742;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=tGUbwfpfWE487b540+iRyqIeJhwi6jzUOfAxipvlntQ=;
	b=24uEqtpwIdDN36P+HSBpL1A3oBBx8cnPrVh7EcetZdZ9Y9TqQw7zY3BmnAfoOALxAoi8
	 HZoJNWGVPZcAujoDbzbnxPUF9rBrGT2MFPnhacUq6Oa207pzyJGV1jC6e56a0Hz9Bj0ty
	 gXB9wd+LMxmRAdix4QLAHfohz2Fk9z5jPgW2shtapW3C13A9NeXWLwcUtTA4eoUitn7MM
	 r035x2SI8nyTaHObktr1JwwhsffL/EzIvt6cka4Ovg6W86PPoHUo/ryjuTm/07NXxyUHB
	 nJ7LWW4iIVjTbdR+q7qhL1CsVWed4jVedy4xZqaa0tEVCa1FnYlBLKPak9C/7M5lcdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=UzoS21FR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.39
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013039.outbound.protection.outlook.com [52.101.83.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD956606A31A;
	Tue, 20 Oct 2026 09:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD956606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=UzoS21FR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZoO1lvsvgkxVG79ryASFB1YhZx3g/fgsJK/Ox+3JfNrg7/zxwy/9lk9bgbyTiYZ/Gu+ZlhjXaQFGagAj3r5nH6aaYc2BeT/aFzmATMIvSo6z/03AvgfadIyfThV23ziQgpJzDIgr/M7Fwj1KfiWIrbNoAG6DlMKZZPFxWONQk0y7ZRESLMDi0X/LpRjbjqy9IQVoUsqIrXa9YfPhUA031kpa1RZzYyjmRnYYXu4i9sx+tNG19mOlIaKIUl3y6oRm4mRsbvt1K//oiov4BuknDJYSlcykH8b1zXKokGtoMMM43E92aH++6T7MJnSxzTPWES7e8MJyBcPiZ4v/Og6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGUbwfpfWE487b540+iRyqIeJhwi6jzUOfAxipvlntQ=;
 b=RZk97VISBY/2CamJK0UW8voW3N/JHdXrWBNabOyGIzVl/WXKkv8bXcXvfSnooSCCApkmwAY/1LA6ttVl69qiD6rB/P/J7OrGJkmCJHztWqEXhb6jJcnYcU9p5P/rnaA/M9HCXRtpg0HZghS7ZFw8KhojBJwOYnO1hahRNUmHFh01CveamW41oJYPZtKmdY0tiC56hyI2mnZsjcKkjfLo4IZiW2pjXfuJNi32VbtkQBWOxGBve3vZwP57LdASHDqBnoxGDSsQ4FNfCMuYTcnVZRy4AIeZTQb9GoXQmY2yz22wsD1vfNV2WbFHSMBVLIrg7+C1roL1G3VzPuREqsjN4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=redhat.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGUbwfpfWE487b540+iRyqIeJhwi6jzUOfAxipvlntQ=;
 b=UzoS21FRL+X/G2k8dZAEHSlHAtQaE4/nfd6AGnh/E5sfVyrcjRPD9idLkR8I12gSvSLu2FvVCLpPg4duBfT66TYjoo7pyND9Os+z6qaGQLQK6uvDoty5BUD+F6EjKkNGphU70a8rTQoD4xMQP5ptByojySuTILFxhbxy/InAjFsw1u1Kzon1kcBcsV4D0T5pa/DRNOQIMnz8i/2Hs2BZYsbYYRR79CuYxO+cggZmcyrC5uLHD1X0a9u2CpXL3mhdTvve3pICQKUaxPuFR6nBnjQYRtc+lhGcydH/cAvks/VO1rxaidKTKgCLJrsPicxbutVNt+q1lzste7xV88BIuw==
Received: from FR2P281CA0099.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:9c::9) by
 AMDPR10MB992223.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:70d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 09:48:58 +0000
Received: from AM7PEPF00000052.EURPRD83.prod.outlook.com
 (2603:10a6:d10:9c:cafe::6e) by FR2P281CA0099.outlook.office365.com
 (2603:10a6:d10:9c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Tue,
 20 Oct 2026 09:48:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM7PEPF00000052.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Tue, 20 Oct 2026 09:48:57 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 11:49:27 +0200
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 11:48:57 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 20 Oct 2026 11:48:55 +0200
Subject: [PATCH 3/3] clk: stm32mp1: don't disable the ck_trace clock when
 unused
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261020-ups_mp15_clk_update-v1-3-67da20111b08@foss.st.com>
References: <20261020-ups_mp15_clk_update-v1-0-67da20111b08@foss.st.com>
In-Reply-To: <20261020-ups_mp15_clk_update-v1-0-67da20111b08@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Antonio Borneo
	<antonio.borneo@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792489734; l=1193;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=CGoTvN4AgYcF8N9Hw3ydcnZ6zpIlHH1rXby3jhF80GQ=;
 b=3Jv3Y9/ZX+xplMJqk54kivArxK3wLZvgl9JYkCZSqm7h23lIX4PPytRS6vka1hxVsRWmCiu1s
 qP6vWn1NO+jC5ew2uCkNZrb8iB5fVrEHwDcDoAtqegm47mIKVRjMi7d
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PEPF00000052:EE_|AMDPR10MB992223:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a522a8-91da-493f-584d-08df2e8f5ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|11063799006|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8JnptnE3kPOrjjVQTidKWfrkx9FitW2cNUP0ZKcqMKODgzRc5V+PDp7/4mutEjXcFgMxTzuMZ9LhiRvR+1R4fNuewo3rt3Phd7MlhXr4OMgslg1kTLnsJlX6LG1arYaUZ/c2tI3cSN3rzuuAgUXR/8hLWR/sAuLxqGzEO4U02CHe956ThQjMqDGPMVI+oSHTsj+qB63DtJAbgAfWBMjExvt2Bln2ofhCeH8SX7ao1zmBRJ9D74efdShjhYM1LXVXJCz3PCNR2RBjaTnHpZReKgdA4RAnmMdE7BTKqxckVGIZl0+zQvWLyOx39cIECjVtNKj5wA4184rqbgnU4GIwoMPhRiKv8DCZbcjwu7MHColkWJbRK1Hj/KW4HsShzCEqbr0xGCdBLs1ZJyg6L4fi6PsJdAgGGZsYL2InFWZi+PiEm8EwYkI0gWblF0YgX0x2Ub9YCjDf9PxEJKlFfFkFAbU5ceXm3igWRBWnlARkG5NxvrkyKb4ecG2UPWFkxF0OS9PtPwN0S4anU6GXKDfeak2RslUxizxOc11zewIvteISq6HwQWZOe9NWfZINGQcOsTUVtqOelMhGXMa6+333VowYOjE3rRk+aryIhbuvUX7ZVcfShYVRhQUCoQgIsfnTq5S2q9T7QbSZdoSPkCpkjT/ZzE8zJrVplnBIxKfsM+OfPi+g8axJUiMKgEQksg0LxcFkK+Je45kmpZNrk2qm9g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(11063799006)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+yBOGdsNV3o5giEYKxZkg5E6S6a/qiC64zyN0BJC36iFbNldC1ULML51prkKbXXaAo1CLe43MoZZs/nGcz5PAuEP5ZJie8XNYYekNsC2EUyy5oc513Z/PgXtr/2K3p7Z8uEuEQwmV9w74tBn8rZi1BWP7vJsvjYetSj9oqQ5gULshUgqf8/ftG9DysuDnOzFjY37smSR9Ra+1RTSeetQbA1gzX4sf2JduF9hVvrehEhIDRxpb08ersEPHgAveUfG29qrisuyKJz6V1NZYUcB4i5opIlLcrI85nGczfMT/LlyxAFvumoNyeWngxiPK04sG9I1zg4CRb3PcD7f6L5kmnbYmnqrxNolplxEitB5+A4EEGBF2M8wDRspSYI0R71Ftg8LPmOH0BiXbQq+7+UyCS3XkGYibsJzjaLuWD10F5BYWZtnJhw02/Lm1pwhFaVm
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:48:57.8611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a522a8-91da-493f-584d-08df2e8f5ca5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7PEPF00000052.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR10MB992223

From: Antonio Borneo <antonio.borneo@foss.st.com>

The trace clock may have been enabled by the bootloader or by an
external debugger tool. Linux has no consumer for it, so the clock
framework would turn it off at the end of the boot as an unused clock
and break the trace session.

Add CLK_IGNORE_UNUSED to ck_trace, as already done for ck_sys_dbg.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp1.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
index 077dd3342911..6fe0b901b063 100644
--- a/drivers/clk/stm32/clk-stm32mp1.c
+++ b/drivers/clk/stm32/clk-stm32mp1.c
@@ -2090,7 +2090,8 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
 	GATE(CK_DBG, "ck_sys_dbg", "ck_axi", CLK_IGNORE_UNUSED,
 	     RCC_DBGCFGR, 8, 0),
 
-	COMPOSITE(CK_TRACE, "ck_trace", ck_trace_src, CLK_OPS_PARENT_ENABLE,
+	COMPOSITE(CK_TRACE, "ck_trace", ck_trace_src,
+		  CLK_OPS_PARENT_ENABLE | CLK_IGNORE_UNUSED,
 		  _GATE(RCC_DBGCFGR, 9, 0),
 		  _NO_MUX,
 		  _DIV(RCC_DBGCFGR, 0, 3, 0, ck_trace_div_table)),

-- 
2.43.0

