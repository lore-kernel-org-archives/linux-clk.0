Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792489742;
	b=Yp79VLv6bEH9t/JbyzlT7+hUsd/huecRFvnnKRVbdK5wrvimvHlA2z0h3eJT040GF0Te
	 wFJZRBxS8ouY1GntljFDbcOmD2BYOU2mqY0XJeriaP6e1ejWpCAaMkCum43yU70L3YkLt
	 nUQQMWysSK7RhxLlmpBlc87u2uebQXXRHoBV+rHh6gWmgNXlz4Oe78jEcyIEWypm0RdKS
	 pB2tobZnGXU7Yyl6yRU4k3BE87L1O++JKmLX9bmkacZAU4HWAjHJtW4YLCmA+JeyKInAk
	 xl+jMR7SB7CFpQgcvwNtYDkeV3vUV6cwkm6EN901G6iav+1ExhnmFIdG+UlcF0l7P9A==
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
	bh=iCZMgDNHJnyVkTmzhS00C7Ww+TVIIt4Gb4tn9ijL2aY=;
	b=Ux85/by19uqr89XqGSk6Y3Pc9y1OuW+fXSKH7Pdc7q/2G85RDdrczPP/C5/rOyWEwzAj
	 ahvKUO81SK6p0wexxHfv9bLdAeFIp6VN71SRuzZBOTgcyfOrDXATeiPjMta8QQJpEOQMk
	 qlthiHU1tlAHdTy1DqVGuK/6d1s0iUxLhPMbb/nPPIx2U9Tfoz+P73DRMMRXgybHOULpy
	 vAZ1iNTcUWilbsT9aSfMUxbIlprUZea95N3CwYZvZ26HPW6lhFNVK19tWsIJfmQtgWkNn
	 Vry4JbRKbKKGiolE8uRE3uU3dv6mBQKz8a+eBZGVjJZbrKY2nbK8xo97vVrdV0e6Kjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b="kUsG+/9P";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.62
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012062.outbound.protection.outlook.com [52.101.66.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C137606A31B;
	Tue, 20 Oct 2026 09:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C137606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=kUsG+/9P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2qoT0ldPPtTW4+8q1yiyvZMI1+Ktmy2v7MUhs2i0b2Q5+gCouyhVd3HGKXk/VgMeDmGbT0CAHodQDJkjtMw60WPEnT1tiZPduWs+5sOz0L76CL7iJxQZaC+FczNYnApD/oGRUtj35yN3JjoZeeaKMlBuT/2UM77wDNFTivXGT11nfGxggBDXQ5EHbxw4NpjDMwYKh54bk5hL57JwR13JBlD6t3iWxJXrGoFQwdp10kwgWrU0dYSEbaPwGcgaNYODGemvlqfKEs90q051uNSZ27rXj5SCA3h8dBXGSvivdCXd3r454hZkWYx7s3wZrS/FY66B+7FcHNcf3IotV/w7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCZMgDNHJnyVkTmzhS00C7Ww+TVIIt4Gb4tn9ijL2aY=;
 b=MOtkNFpsbRSZMtstOiv3oZCQQswLHYhWAUHwe24Z0aIJYUtuUtRA0B8V3r31TWWWZbFzvYyWB8tve2VMOyJ2QWFeqIyhdJbtEad9gql9jEK97q/j9ij5+1Qq/st/zfna1KmYlr86JLpBxdxXrN+W7LJ6IpESfUQEigoxdtfXuRuFwssjHfK9U1TW0JEbhTdd8HTaRheCjSm5tVxLbUir3noCWsi2U8yU/b/aURjo3MhPJhfYpZ0CDQzVgquog+61aMyc8ybeB0/zrfWS7QSxJEp+4CvkKrSJKwaIgMKMAam+gXdJ+hIUw/v/Ga5Pzz5Br5km1qVfYsrw+0MESufuYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=redhat.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCZMgDNHJnyVkTmzhS00C7Ww+TVIIt4Gb4tn9ijL2aY=;
 b=kUsG+/9PhYSPAph27uRpGogzgQez7b6JHKjrtYnT178g13Y0/nIlLnildQPzcd/jrwdRT9fc3QpESER3CLHYrvCBlrfI214hB0WIjZ4fCelPvDC5PTStFgZpES8Wj+iK1+W00w91C0PZ3miCEFiTwK3lh9x7pnVcyR4KN4NXNck4rgLFvr3UrANZEALv3+vYoXiz9JHugW+kXc9ziWBErxn5WyieKxUlfbEQuZwibiiC2jQXQnzqE+MbjZndiF8K4TykVYS/v4B+1Qg037VBjXPJstuOuUx/Ndb3vRwxJBhV8R4U6dwTGVuhNAZp/YaezstIjqpz5DYli2N22v2vIQ==
Received: from MR1P264CA0152.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:54::14)
 by PR3PR10MB4064.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:48:56 +0000
Received: from AM7PEPF00000051.EURPRD83.prod.outlook.com
 (2603:10a6:501:54:cafe::a8) by MR1P264CA0152.outlook.office365.com
 (2603:10a6:501:54::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 20
 Oct 2026 09:48:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM7PEPF00000051.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Tue, 20 Oct 2026 09:48:56 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 11:49:26 +0200
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 11:48:55 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 20 Oct 2026 11:48:53 +0200
Subject: [PATCH 1/3] clk: stm32mp1: add i2s_ckin as a clock source of PLL4
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
Message-ID: <20261020-ups_mp15_clk_update-v1-1-67da20111b08@foss.st.com>
References: <20261020-ups_mp15_clk_update-v1-0-67da20111b08@foss.st.com>
In-Reply-To: <20261020-ups_mp15_clk_update-v1-0-67da20111b08@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792489734; l=995;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=HWVjWVAmDMqPHrrh9MywQx6QVwXoaZX6I/UMJc3VcRg=;
 b=pZhqxsSzzT/v3MWGIAf4CCEOg+UvqqR0OgifmXtFb8ksgI3th73S7h/FdYPBxzt8ZzOBrq/Tq
 zU3JcVYjfusDr028nvsrmGZvl4+zMFq6qjK3fED/FIzyYf5eMwTyLkz
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PEPF00000051:EE_|PR3PR10MB4064:EE_
X-MS-Office365-Filtering-Correlation-Id: 9656cbb7-6b9c-4642-83eb-08df2e8f5bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|261009223027099003|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	cYSpV6y2sskDn5cSd1SwzCfnPDAM+SBuDuUcGM9EpoJDvqx6Mmab1/G9/9q1w1+wN9Yp+BsLi+iuWbBWziYcf2/dNF0/DBLWzCpleEiCfdVgPHqGF92btoVTDC2ZSkZ5jKodDt4639wpqE/6j4w2D/V6reNGVdhvv14+Kjel72Ek+AmPrqEkXJeYvcKxKqqzlJ/6mL08kf2gmYic+Etzw1DxVK0fT/kmY3+iFXk1iNkgUivlrWOr4vnM9gfhbR/UEhV+kOHKHHmLUa4AsSd8atw4bR/ua0lfC8vpjPvfMn7DnbWDm9HLOcSwRlIIhJF/ksSj0jBudik4RrqexKjiaDgZXFtMpf/wZ96rmtaZk7h6HjPGGsvSLlXqzGhaNfA63JKYwbI9vIjYwt070Jf08kRgjm7XnSH5DR4HTPbJuLmz6kDT5lHDRayYCEV8H9s230qUOYktUmrtochYHPwhCcLwjhLfocQtq9xPF5CccHrPMdBUrG73EXs2UGIXstUQmxvJO25EyNxSAhxPjVc0QgZh0ACmUEcfb++NBuA8oMkVthKIAEM87SoegB6KnM053OBKBgjecfYGo4pJXW9BfvzC5JR0F04A4pEKXEi5pJKEGFIjUxTeRCMiq5aDaAummEZ97lHGim7Kqk2t/S12fVe5h+jR6BGNl+ypudea33FQjwid9JwFx+7G3nDMoA8/TxVCcN6RaL0L9/kL6HQZBA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3bUY30cazKuoY0cQ7sfS9q0HWDGETGvzuWTTgNJoUvz6Y/DEBjovg5IHHTdRfHLr4j2cRGOf1xSsUt5ddWEHA4vcdVtPsbrDQaeFlg4csRd7MQpyu9bzdTkzi8Wc4z0q3/2hGVKfrHF7U2RcRVhHc5uIMjs29FZBwnv6hL0TlRW45ZJkMs9DqLcrZ6RSnmNA802vm7eMX5Ajydnxr6I6QydNjAag30q6OH8UdE8FnNxa6OFFgRVCVZyDaHkGy34OkAJf5YUCG5wTs37LntRoiw3Vsu5LYC6HmqPDgrRFEjlZs1oMP6AHXtcaJjd+e+iJUIKp4UvPb0Rh6QNVx/8kCz92gZQU5wirgRzKKML49P4FGAoIFIuXAy+6p6HVdK8HDdIVtFQPAYEqqu3ODx6SG/pT0SAIfhCSUeoJTG+IyhGOXWYIwRI0DuYeIg8Pb2Bt
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:48:56.3649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9656cbb7-6b9c-4642-83eb-08df2e8f5bc0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7PEPF00000051.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4064

The PLL4SRC field of RCC_RCK4SELR selects the PLL4 reference clock
among HSI, HSE, CSI and I2S_CKIN. The driver only lists the first three
as parents of PLL4.

Add "i2s_ckin" to the PLL4 parents. This clock name is already used as
a parent by other clocks of this driver (I2S/SAI/SPDIF kernel clocks)
and is expected to be provided by the board device tree.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
index 2d9ccd96ec98..8f7bb2c31809 100644
--- a/drivers/clk/stm32/clk-stm32mp1.c
+++ b/drivers/clk/stm32/clk-stm32mp1.c
@@ -120,7 +120,7 @@ static const char * const ref3_parents[] = {
 };
 
 static const char * const ref4_parents[] = {
-	"ck_hsi", "ck_hse", "ck_csi"
+	"ck_hsi", "ck_hse", "ck_csi", "i2s_ckin"
 };
 
 static const char * const cpu_src[] = {

-- 
2.43.0

