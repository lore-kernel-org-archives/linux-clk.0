Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792773814;
	b=iiqlm5qTtDAHOT2oSa03RtcU0leY4/YWEhlW6wuqwPdN5wJ7tsYjrIf+QqsMmg1gLCgW
	 RYsDWMwIyHiKYX2QGQruCA9XRv2zHs9Ts9OJ8lbs4hqB3ykcibRRGYS+Dr7Imjjv8F7bN
	 zHnBY39JhjHAO/w9Il2fHu7a4ZX89XDbCSStZvSbghCOfBqLBzreAqgID8Oyh1cNxbvlY
	 70gNCCe+mvmXY2cw1zWTsfYbv7YWRs9Uly/bqwA7hwW1bOKmpK/d3ALY3iL8ikETdQ8PP
	 6tenJM+knK2kZ+3reyk9l1EZPNWDWFdCMclPncnhtXu6Q9fP79wH8R1CWOYcKndzxpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773814;
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
	bh=x+x3myP3dhgp56Q/KxWhhIcXg+i8PROVfJPxptEdG3Y=;
	b=R5LaDpfyxd+FdiaakFeJwDIAHj6TwYpxLzZ82oQnjUtP6OgJEGvaJ44aIxnbiPzTwu5R
	 JK+DMf58g2dOfVINHn0KVaMlC38oJeZEqBb6Z37Se+EmXasxqMS+OrPKjHwtLIAn166Km
	 X3aIgfc6yR4SFmH/tqQIleFd6EuWc7Lhra/F79Fh4V1eKIABQus6sltVtIOZjjEE8/kmg
	 2EnJUHxXaMhi0bYbamhyjrBdonGiu/mSS+exNeHTKtOoFmwGmARAvq4sHp7GgfZg+O4UY
	 C9TC55ClSx902I8p30Szn9d3AxSGwgAZAfTLKH4OfpVhdwSuYH9hf5pow68qVH9nhdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b="lVghmkg/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.24
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013024.outbound.protection.outlook.com [40.107.159.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DF5606A320;
	Fri, 23 Oct 2026 16:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96DF5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=lVghmkg/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxAAD+rS43FeHy84dHnp16AChUHxuYU5jjzrFXwxk4mZBdBTdXvA4s94B99ZWQMH7D69bSymacExruiVvGh3VnLAWT2P+n5aTRfDveVACm+tYDtJyYo+BBSWaEjVZZ72NJMlWA9hSEtrtfDzK+8SCEp9D/c4TnW6TOhl9pVI19Ialt7OlAGDwwTYfKZ2kkd2nQABOUhoRAEgFyFOC9iA6Tcnqo1fdG/7PwB1pDm1xgRY6B2DZI3X2b2KccnH/XiNMmp5DOoEXMNVqhcrvkcPN/pZn+BgqSyuZlZAdnjQ7bZq0Xm4cThXlHLEGL8Gtzq01DDyyi03VL4GRrPq8DgDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+x3myP3dhgp56Q/KxWhhIcXg+i8PROVfJPxptEdG3Y=;
 b=fVdW+z/9f8MFg+ksV1z3omxndZg3gtnRHZiYqEK02LjVp9M/dpQ/C+5fZgH+XcogMWS3DAc6qmUiLysBa/MKoPOw1qkR2ylXYRwC+XCDgbKJ4GX4OOddDYDePSkAkDy8ohEJ4IFAiJRDk7FzOuNC5vGrfTSat23k/K9QNNZuKgC3/5w7J0M6AzzqPB1DkdewIxfSdGkxz6NGb10dv87iOzKQbtBBp6dyeEkmNEW/piLA7+CrFYTl0u+EH37K8LBj6svXclvFJAXxL6E6FZE0jdfF6s5x964/SY20zQdSkqSmWFDS2rgtha1haOGwNtyENYea0JeqrFok5S4YJ5Z4LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+x3myP3dhgp56Q/KxWhhIcXg+i8PROVfJPxptEdG3Y=;
 b=lVghmkg/AxfaBxFao+r63UR4p09AVXEPplRPHyQDPggBKC+7tvqNHDgnCQ1tqjJeIJj7clcLQVgtBXcBZ0VROOmxGJiqFW+pbsG9B78u4HgBjZR0+H/OwFrOHHofhqAs4OBuApJeg7cJixAm/ou4fqE1y5VBA1jBylHSHr6Tzvj2di8S1KW2f7wkibeFOGN5A3KwlvibDUIZBXWcTxMQjGjJcnxQaZfp92uE5R5ALI/HM1aakVF78c596B/RFurvgO46G8xl6JLtjvDZ2UrJQ7j6Cn9+zfa4Aa0WSjfgd7W+DVc4cjVHXDKySIA9g0w9hD95T+CgUgWj5bUUvrw78A==
Received: from DUZPR01CA0304.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::6) by AS8PR10MB6891.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5b3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.2; Fri, 23 Oct
 2026 16:43:29 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::d) by DUZPR01CA0304.outlook.office365.com
 (2603:10a6:10:4b7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 16:43:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 23 Oct 2026 16:43:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 18:44:00 +0200
Received: from localhost (10.252.9.175) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 18:43:28 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 23 Oct 2026 18:43:19 +0200
Subject: [PATCH v2 3/7] clk: stm32mp25: update register with reference
 manual
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
Message-ID: <20261023-ups_mp25_clk_update-v2-3-398d348ea8fd@foss.st.com>
References: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
In-Reply-To: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792773804; l=760;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=IR7Qf83XRHd9KKifUWIA16iA5fTVyfnLbI2U7E5fr7U=;
 b=B7pOmj8e2zxEfM3JSjQeoQJXbQjhwAhDPJj5WoTUGLPrLzXoztaKg1BILlFUmFGA+bw4qPpHA
 qTuudDdmzg2BGqUfQlG63TimMtWH+9EBfQ8aeaMH5psrvQXZHh6YVG0
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E4:EE_|AS8PR10MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dea3fa1-c8a6-420f-6bca-08df3124c436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|36860700016|1800799024|18002099003|22082099003|11063799006|261009223027099003|261021123027099003|261021121427099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	VbmFEc8sjc73GgKihByx08YJMzslUj8IAIt4EfVtlng7Y9LPLAZ+jJh/XUBKJ7JFqIseON5dd6BaAj1AskVdYxY/9Sefqoxe/KIJ0yQF2hxLPyDG9Vt+MK2pmJoXHyg+wVXadQuYUFSa/x/rakt4I49PJa4EIJ1onqLKajKrf93ME1+gXotK/RVa/NPci4VD6Izi44iAbcgsilgC2IXuoAav8qUhKdIdfPa7NCDU7NMtfS7mXJpE2J9U3m4GFLxql/TKivEQUVAMfbvl+tp03gO3yXcNSzdy59QVVpefeDIlc436gBaOPMyZEbcgJnOFYT2AZev9lVAVdHXE0zY6Sigcs0Whv0RGSv7kZo8XwmnqrtORpfL4QiYOPbpBsTHJPyBH7ga41FurqHtAYhW/LSY6grV0tq6o/rLqX7x41+4myWNL6tscfOs4/HsBg47qnCWjG1K5H+9fNNNDiVphG5BYVH48jlP+jQGa7bUQsCwlejY4xsl9NqyykmuHwIzdeJT8ll4IElAQJ7FP/m3RUewamGEQKxXZ2e2qkt/ummnBnA8jMixgXVKbuEFVrRWWU2ju2SLfFq7MGeu+FJVBkIeCs05rEbDddlMDNDDbxQCWiagU8hBq0NxlKry/QsCbiQpOlpaUDb1Go7/SRvl7SK1/8ywC+A4BJPe7dOUmfWjIyrIDU+n7wZEyddEj23WBtPk1XQP1ojUosYKLdvKu8g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(11063799006)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m4St2SuwDuPjswnqAMvApEldKr4Eh1WzmKjPH46M91pYebQIfQ3J7LuE2esMvsqWKqCC4nkZkfVD3oeqWMpGW+vlIATpUv3gmOP8t+suaK2tr6tsZvj2tYOtaejpL55AujPR2geC4EdeD7NjmxX2Q4nsuzZdrlHV5kyq9RjfmSQq7SjOk0aNpuGtmgjY7SVWPZLWHrkTbc7qu0IOJfFreohp5DIqsEXSYINClqXrJACrYHyf/5wWqMN52SPfzs+glSW9xanUXmrfm9L7sD2esckTeN5roPGaeabQ3opK9NNaoumDUxFaoBf/TiW1M364tCqcQqgLgEC4RMuL2a+DMEvAwGBKZmVoaeB0n+qBx0P406RFve76LUzn1JrhamqWZKVWewYyUdkFViANu+nuXmLQpy5NJEL7bset9nP6Wnfw/QuYzM6Jke6o3cQkLtYh
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 16:43:28.9196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dea3fa1-c8a6-420f-6bca-08df3124c436
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6891

Rename RCC_STM500CFGR into RCC_STMCFGR to match the reference manual.
No functional change.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/stm32mp25_rcc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/stm32mp25_rcc.h b/drivers/clk/stm32/stm32mp25_rcc.h
index 687bc6a78627..421c74dadf8c 100644
--- a/drivers/clk/stm32/stm32mp25_rcc.h
+++ b/drivers/clk/stm32/stm32mp25_rcc.h
@@ -319,7 +319,7 @@
 #define RCC_OSPI2CFGR				0x518
 #define RCC_FMCCFGR				0x51C
 #define RCC_DBGCFGR				0x520
-#define RCC_STM500CFGR				0x524
+#define RCC_STMCFGR				0x524
 #define RCC_ETRCFGR				0x528
 #define RCC_GPIOACFGR				0x52C
 #define RCC_GPIOBCFGR				0x530

-- 
2.43.0

