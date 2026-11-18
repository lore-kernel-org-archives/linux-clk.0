Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795003170;
	b=dp3/K60NLpjQzlgu7gX0GG+RcBSJwqsRrAZRI4MZOsmAcxv5kN2v14cqK+ivmPv4k+1k
	 lbR7fhT5BDs4i+rLZDWHj9RD0DatATaP+T8PLotnMA4ZH2e5Q10iDYXgv+pAfpjDxAwOc
	 2kxLAW0HzxLafZK+vFhg5g0v201pGOwx1Hg+07mIKLSfr8SPYiTCAsNjPWoc65iklqU3D
	 gkdL4ZLIdOfidr/CyugAziCiJlk9kSxHvEuhx9JRYlpFKNodMKFhxiyuKvPpRS4FHuXNT
	 ktuigIOQklDpj+d/x8rle2aViTzYWEm8V/VbJF1SulLGuFmFBZCf8CXOmvpfCT3uRKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003170;
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
	bh=Aeoj9Aug6pPFKSq+h9xfGYr15hU+9V85q5aPZ5EBX1o=;
	b=JPT6ipgB149Ey3XypCxlY4xxIDRE7LJRCFPPw8FHYMZonOqYNLAaSLtxr9fGBvZqEWw0
	 3MZ4aOPL/uLQ4fafKfmvpUyVMQqNtXhVeHTh0oXRewM4IaQBgxoolEf2lCey0/XfXpO/O
	 1eISrMi0Vp93idOc8w7EfKeXKvy9RpQnKnEelll1X9SqLjSA0WDoGp54FmrgD+bE6zHDe
	 UYbzz90tg6SaePUWGFWuKy29CY8TtZEEnncK5CEvtgn/zGIj3zS8j5/sZ5QY/jCEdLPL5
	 DtZUKVxbdLCmwtKJnzLRmw4iyZ6YjWKTZ5gBfgxCfhXOaQG5vU/o+4Znc3F5+9Y6DiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=SzOd0eSp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.11
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D62606A320;
	Wed, 18 Nov 2026 11:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48D62606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=SzOd0eSp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vc6psLQ7vhROudF9dUqQJi5DpSEOBGsM24zz25c/CFznrF52+hXPKJk4+Mjjq8loxHw6L0Y+3bvNMsHcJ9yRgrLR9LctxzAe9RlrptNMshZCi10XIsyL2y02XgHNbCEObwp92f3QzISx2YNtgfzOfPDZ2xco8cA6OA84FnmRnKttVsAPDDjUQ9uMDYRvVVV3HAj9Pqq8WGdfdyr89TzbXJSEZxttkopWL08p1MjNvKNy86lKUCS24SdzjxB7qhKesE6QgzI3bNo6L/sOU+fEOtDjXjKKmP9aw68s0BSYVRGPkFDVu2pBoGpzOLRSXanxuu64uiZ6ETKGR5kkjwzPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aeoj9Aug6pPFKSq+h9xfGYr15hU+9V85q5aPZ5EBX1o=;
 b=b2pVM0zKDw4VBnM+Llbg1JmT1HOBqyIRfaLWVl7IQ6DHyi36EhUB4RESsmMJgR/y8uGcdMp0WhVCpt+uXhvgYUP84i15VA/Oq5pE6Be6CaiBnlETYwMgICh9jbns5tUdchiQ2PUtEuvw8QMnCuTCwX4T2QJr5esu3LysE1LnY9tlPU0yFdog1czgZPzuytte8z3NWUuxtiHUrgHT3Gl5Jx4iXFSuzqpTuANzk+kur6gIRYByfUNe9U2HuFsAGIJOfGo8Q1TXefKCjdc/BoEqxYpmZ+wqmcynohhZh6FAbg144y7tlufPTzjuMKc4mFIg9LEHjzbZUg/+2DaCOcJMsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aeoj9Aug6pPFKSq+h9xfGYr15hU+9V85q5aPZ5EBX1o=;
 b=SzOd0eSpPOXqzWaWYGGIuJZEUoaOTuILsf06zgtmjqbA3Ap6nzBel8Y8Nah5t8gkOOJuvt3cNrePApf7WyS0DylEXRHmCWTSaElTDRTO71c9BCebbJusWKC0fVUlDH17X1sHXwaV6XSZuYLr7g/DG24Y7l4qS62a67SJ17fvrV9ObuPCjfPXtJSl6WhqS9rh/klwOedXcNjhOPP54SfSeefopopRsWZoTpL5OuHrK/hYtB2KjpEiZnw3fSQov7j+sOo8dJ0BZFhz4/B+NGpc3oI/9tS+WlbsIetT/og8OJc7YDknJ9jl/0DbrL8DgGkXs943jm24e6ANuXe4fe8nEg==
Received: from DU7P194CA0012.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::18)
 by BESPR10MB992297.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:b10:108::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Wed, 18 Nov
 2026 11:59:25 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::30) by DU7P194CA0012.outlook.office365.com
 (2603:10a6:10:553::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 11:59:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 11:59:25 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 18 Nov
 2026 13:00:08 +0100
Received: from localhost (10.252.6.76) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 18 Nov
 2026 12:59:23 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Wed, 18 Nov 2026 12:59:09 +0100
Subject: [PATCH v3 4/6] soc: st: stm32mp2-syscfg: register the clock device
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
Message-ID: <20261118-ups_mp25_clk_syscfg-v3-4-935de791a4ce@foss.st.com>
References: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
In-Reply-To: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, <patrick.delaunay@foss.st.com>,
	<yannick.fertre@foss.st.com>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795003158; l=1823;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=iaeLwi56RxrXNpFucs5d1ZeU69yHZZ7NfSr4MxhSJcc=;
 b=7+5oFrkPR+6qF1xf7Jz1xdeVpvxjR4SSwxQ8qnI0Kj24ji1SC6Pue+uP/btBbrWQD90JRkZ8c
 8MLgv4b+rQPCb4YUO6u2SVX1536RcCJ+ELSPorEV7t7oMuHMMsMLgtp
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0E:EE_|BESPR10MB992297:EE_
X-MS-Office365-Filtering-Correlation-Id: b10e7774-45bb-4de3-9022-08df456b644c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|23010399003|82310400026|921020|11063799006|56012099006|261026140227099003|261028144727099003|10067099003|261022105027099003|261021123027099003|261021121427099003|261022075727099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zrQnPVoOM6htZmFWk5DHuqDmw3ILELNR6scM2fPUL4thdDdiW8NBap68xmE8/ybzAkhmhadwn2a4zcsa8bqY2eh9bsEZ7ge40i6Z33hA/BDbdCKJ3+UmVj8V4eYspkZ9b7wr9+rjfSHSL3teuijVNpA5NgHerQfKtBvtTFgseqMlO/q+m5fCRgNTIOG5bDMIoPlC0VoBjy49Zr/OqxKzQ68yIyAZ6OW25MlKGH7lX+pRVa4U9xP7OjRLLO2e7ovRboe5E7iIE30bbcI6/IRqWc3EAsk5FRY2P3QGWczYwsolZJC+ZkxSssUFF3FfWXKfzsxpQIHoll68A4XyX92PAFd0d3HNb5El6a8dTjs/FX6SChN4CNYHjpa4ctDA6JvgnI4OyLAEbAZC73Q/+/8a2shJeSbi9Yse7D5KDbMB/Yq9+12PTyAA7xdHwgd5hvlCf1E5+CUa6HV6H0nQaeZcuoEOV+adQVhAWlj6lHokICgwiExNIVCV/mgtsvfVthDPzMJxvqgIOL6Ho1pTrJ3b/aQwAKiQO1gYZav5JeOftjvSJNStVG14BsOutLKalgdVycoD+QjZqSbQSD5vJfxT9J9XFfyNVTBfYjrN9GVCZL5E3hG2mOv8y+imRS9dbZQs+3LXoNqmXk0A9V5gV1z46A6+QtM9h+fXnnbyTuz7S1va4mztGr5fIQcVHdlfVPP4YqO/6jg6FjOGsYBr6uDmdyZFDf9+pjSesFt8IaBcu/nUqd1iYsWadmOfXN22tk9H
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(23010399003)(82310400026)(921020)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(10067099003)(261022105027099003)(261021123027099003)(261021121427099003)(261022075727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GRj8+mC66duE8RrB4ETqtNyvILz3QkV7i4/UyR5Dk0t6uBouTzWz6Rop9O88pTB+1MLLG0vUnE7LjdOtagGA+YXylT41Q6ZiOLjhqxZOGt8wi8weHVHnBKQd+/uIYXAahrrQnJ0o0CGhPgK7iFTGubAoXyQc+qoxJESrncVJ5Ny6kXZg/zE9L2ID6Ujh2vCyQwTYOGPF2+eBTzbSiXZpPMIb+KEM9Y+FVlD/ZdusbMWf3HmFmmN8ERB2G8b/a2XyUxX0+N2mAfRiegCJuf9Jaad38s9hRLSkDSWZADmz4ytAjvyA9GXFnjxR7Z7F/ha+IUO5HjIh3S9lHrYugISISuSxyveAdm5JpbpiJbbVjb2uEWsqceE96UQ7Y8lM7KYBntwJB65G8E8xu29z+2QuuZRG8ldFgj66eANcYKwoHcMWRO48rDszh40AnupsIdVA
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:59:25.5198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b10e7774-45bb-4de3-9022-08df456b644c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR10MB992297

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

The STM32MP23x and STM32MP25x SYSCFG provides the LTDC pixel clock mux,
whose driver is an auxiliary driver since the SYSCFG node is bound to
this driver.

Create the auxiliary device for the clock driver.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[gabriel.fernandez@foss.st.com: create the device on STM32MP23x too]
---
 drivers/soc/st/Kconfig           |  1 +
 drivers/soc/st/stm32mp2-syscfg.c | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/st/Kconfig b/drivers/soc/st/Kconfig
index db3ce8e8111f..c132a6a1334e 100644
--- a/drivers/soc/st/Kconfig
+++ b/drivers/soc/st/Kconfig
@@ -5,6 +5,7 @@ config SOC_STM32MP2
 	bool "STM32MP2 SoC family support"
 	depends on ARCH_STM32 || COMPILE_TEST
 	default ARCH_STM32 && ARM64
+	select AUXILIARY_BUS
 	select MFD_SYSCON
 	select REGMAP_MMIO
 	select SOC_BUS
diff --git a/drivers/soc/st/stm32mp2-syscfg.c b/drivers/soc/st/stm32mp2-syscfg.c
index 0d45fdef46b7..285561fb9f17 100644
--- a/drivers/soc/st/stm32mp2-syscfg.c
+++ b/drivers/soc/st/stm32mp2-syscfg.c
@@ -3,6 +3,7 @@
  * Copyright 2026 Marek Vasut
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
@@ -51,7 +52,15 @@ static int stm32mp2_syscfg_probe(struct platform_device *pdev)
 	else if (ret)
 		return dev_err_probe(dev, ret, "failed to register the regmap\n");
 
-	return devm_of_platform_populate(dev);
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return ret;
+
+	if (!devm_auxiliary_device_create(dev, "clk", NULL))
+		return dev_err_probe(dev, -ENODEV,
+				     "failed to register the clock device\n");
+
+	return 0;
 }
 
 static const struct of_device_id stm32mp2_syscfg_ids[] = {

-- 
2.43.0

