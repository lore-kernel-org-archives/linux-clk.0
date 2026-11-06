Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793979355;
	b=PjlrkIbLpMg2G4RGYN7GF96LG8ulLhPYgar30vKMszKIUMvhi2klXqS5wsSDS4grpwhF
	 3QPigD32XVn6VwG+J0W7xglgsWYssiVyKy8Xqa7Z3UWWM/5SOhqgy32LsN/lrVVWdgiOB
	 jYvqVUXXnALwtbj7Mw/1RYkUqU90JD9j+Q3Hv694hGPbOrr7dXJ1NFi9aRNROR0bO8mf0
	 DGmMFIDfI4A2N48dPMUPTLk+rU05d4CNUUaWy7s4YTsJ/e/JKXexRJ9ymiA86oiN7Zr8k
	 AbokGOygv3wq2sZ0Q8jTR0cCs+Ef3Hs5VrXX1E/m67cwSa1KGXl05KyiThU5S7ARTLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979355;
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
	bh=Oct7crPAx+5VdJ1/G9PKgpOdQz5b23KsddOolPSKnwg=;
	b=ppnqtOtbK3olU0Zt3GHcKgy7k2kakCwXH8MYDv3S+flPRaksibDPmIgwYic/x/ONCUOv
	 Kpn+DPEG1C8NdneivdE1lOEcHSCyGEPdb/FHc150vEG8kgs5ytHHUKqbvOxPstEqUpmaU
	 HBu/QlZFQve5innnXFb2s+hlGzVLiTaPv7pT+wdXEZQ7F9duR5jjU62xU3RXG+NqYhCZa
	 spQ++ZVtECYFuXslTsqigqLzRQvvj4duoBrIJsdn+aFN+y0R8RkDEW3nP1N8QDaxmM97i
	 ExpjYFtfo1TrekPZQKJco5s7F0BXyTdrABjg4z4zf6Jl2Dvc5mhg21iNuN0BTp1Itgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=D09j6SRd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.24
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013024.outbound.protection.outlook.com [52.101.83.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE09E606A326;
	Fri,  6 Nov 2026 15:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE09E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=D09j6SRd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WU/gIEhYS8eKEa8/aIk54akNwzOxJHGiiwZg3/egSiMF8t5gfkqwFD89sHeLO0jDS2MH9TkiZj4d8rq8hZKoFH7XObd0vUqrrxcpZK0IqU8wZ/wc07wPT8hNmyaqTpEvQ7QuZEAoI57exGGS/c/ph0CWMWElKAbPz51oXtyd6e9odZeTMo+FXiztw+B1YEa+j9BVwQJdx8+DScggM3LtUiN1fw6Ext+8OakPY7qcSdgFmxhTzMkf/pMub17MEfH/a4Q/qP51fedbZ3VbciD2EeWIpL2/SnfmZMRuUBbMudIpRzL2VCbd8d5jd/aRCLFYWYtmuzV7lod7BvxltwLXHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oct7crPAx+5VdJ1/G9PKgpOdQz5b23KsddOolPSKnwg=;
 b=Z5sPGTp9b3jwt5pCM0C3imPORV2oB+Lq8GzU7JLSVW7J3yUztuJNacVRcl2Pf/Prl0D/eqk6LXWBRDl+AAf6JIWXFqV87lHrXiM56vuOdqHFA3LuS8J08hBkAPBpO66cm4iatIi46zAYkchWDxUFV9mJICM5PiM+NxHG5tL6b2Keq8pd06ARn0oq81W6Mixty1cJd1qfIQCwfj5cbvfEA2HnrgCoDAysIky7kQP4PHSg0x0AaVA4F5ynGoaaJkMqvspTm3BDTVsYDEoboonH+PVJEussz/AwvGuVhm6fYhZD8e6UzQTyjLm+uxansxBqCnstpxT8ghL70luu+O8UdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oct7crPAx+5VdJ1/G9PKgpOdQz5b23KsddOolPSKnwg=;
 b=D09j6SRdZTv7nNN3d7hLK6jPAtMktsFCbTlQsBlhLpEHi7ZL7a94l1bJZK+Z/usHEJ8rBif/YxCgQrSCxnTtYh3AOp6WeRDoAgUxpbMDG5zrYW7e6MfKOY8XJjh7W4WPEgJovB/MMfV2SNHR55pZH0WI6Oz7I9LbYWaz++JL0CofLjlT4Yjq9vJeE2esW0IXBMmtV2YnWUfZzWkYh1ytSJdhoJF2RXNqd5hJqWLZUR8lMtJJgBESGEVqVkacs/gEARtU115cFwmCYlougvfaI1HOTy6SoCnTV6ApI39PGNbY9Q4F9JgkZzRMabIbIrBJ8pVSK6jnQJkAjI27mGHfvg==
Received: from PA7P264CA0452.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:398::23)
 by DU0PR10MB7003.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Fri, 6 Nov 2026
 15:35:50 +0000
Received: from MI3PEPF0000848C.eurprd02.prod.outlook.com
 (2603:10a6:102:398:cafe::6e) by PA7P264CA0452.outlook.office365.com
 (2603:10a6:102:398::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 15:35:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000848C.mail.protection.outlook.com (10.167.240.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 15:35:50 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:36:20 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:35:49 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 16:35:30 +0100
Subject: [PATCH v3 1/8] clk: stm32mp25: define the number of clocks in the
 driver
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
Message-ID: <20261106-ups_mp25_clk_update-v3-1-4a32f68119ed@foss.st.com>
References: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
In-Reply-To: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793979349; l=1835;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=KNz1PZCl4zM7ntbYiCIpnAt3EHPojWQTAKZ2hi6v3bY=;
 b=/okksgdztb1nCGp0EU5U/57VQ1HbHmM7/rCzeElVqMac7BSNh8Sffle84+kHaEN92atZlyUhs
 NNAczbaTG7ABh2v9G21wjDtenymgTYOEWSyQHXiV6Bvz2ExcNnodk8A
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848C:EE_|DU0PR10MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a012724-48bb-4fae-15a6-08df3c1ba2c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|82310400026|36860700016|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rKp1ZRd128if5lauyXAZelnPaWA7alL8GIDks/l8F0JyfIJgSHJidkZJLPh756MFJOY4aXM/nWM0v/oIHN+jaRL/9SVerPZXeMAlMr0pIDiqVa21RGlwWYKl1qpE1aonCafM/KT7lNlR0qpWr1rI0zRyIjupBBEZu9Mih6KEFpssb3gdS0QvrwcYNmKWQBhmaBjLW7kEhTOysNhAo0i8618sTJOti1+TsCv8lvLPsxGsvkBOWlvEzNdH1YpnAX3pKDKvIsC6zVXkn9gtaVBHiu6uvCijco2Qs/zzEPjh7YR2/YMjWFegdoSZqB0csZUtoAVfmYcl9eE+D+S5Kc4ZP8xkctoKTmC8kBS8dD2vRY0cl+CQNkKmH+IT76LH1eC0QJgiz7TfHnTN/jGuGG9d8dWzguLT0bt9Np1nKhPE2VyQzMflMiX294tWYhCNSV59v6TMHRqCBXVNCEIumCPE+lj/818sW8zZno52VW0kd7lj+urtZ35+CaEOx5npqFg+tT4R0W2LXS3ah1Yy3STfyIw32KrKSkekUzhXgeg2g+bRHGshov5DceRoU3pi+m4zdfhIMC6k9yR7BzCg4y/vyfUmegwBfXcUBov44Jv6cjWwCVsSixefQKVkXlYO6/U3qWwOJRrRxZqrVS2I2SFhwwlfHMRbkALiznjagUV6pgq/Gm6aiOZGOxEs1E9508jHe+hYu9wLGleuxa2Jy9RtfA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pfZme2Qwg+VH7oNR3y4oB4o20x2cQAbgDrCFlYPpZVSXajfcVL+S7nbS0EYMw+/QzHq5zIn0B1U1F2XcucVv8scnM7RGFM92Jb7gE1ie31fvR6q8Udklu8XgU0UTq1BNj/oxfrfwhBcsN1QZHVc5f2TivEEJBZhnfn1RiOvj/Bg69W0iUkYBDDVSfreCPO0eY3JtY1hd3wv5IVFgbpgvImBOIHaHwoSmTOiYMdWuosjIy5o69vfZPxBUXihRspgCcTvVNIN6COw47WSeqfF+qAhsYZd5utRQyhTlCRAQz5PZAqqitYnDAYqdczwOr8FL9ehCyLEOrPQOwtK3fhxSqDenxJTvSd2x2hgtSFFzLQM+CcH8CTaSQ4wwnBG0xEysP3chPblTjN0ZQ0X2dFBD+MoPEE4deW4cb6tHUXZ0hsxEimBtWJLyVUeEob9JbCnz
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:35:50.1748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a012724-48bb-4fae-15a6-08df3c1ba2c4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000848C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7003

The size of the clock provider is given by STM32MP25_LAST_CLK, defined in
the binding header. This is not part of the binding ABI: it has to be
updated each time an ID is added, and the number of clocks handled by a
given driver does not belong to a binding.

Define the number of clocks in the driver instead, as done for the
STM32MP21 driver, and drop it from the binding header. Both are done in
the same patch as the macro has the same name in the two places.

No functional change, the value is unchanged (344).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp25.c            | 3 +++
 include/dt-bindings/clock/st,stm32mp25-rcc.h | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index eb0bc918ecee..fa025a9f3f37 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -17,6 +17,9 @@
 #include <dt-bindings/clock/st,stm32mp25-rcc.h>
 #include <dt-bindings/reset/st,stm32mp25-rcc.h>
 
+/* Number of clock identifiers of the binding, SCMI ones excluded: highest ID + 1 */
+#define STM32MP25_LAST_CLK	(HSE_DIV2_CK + 1)
+
 /* Clock security definition */
 #define SECF_NONE		-1
 
diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
index b6cf05ad4be6..242f61205a9f 100644
--- a/include/dt-bindings/clock/st,stm32mp25-rcc.h
+++ b/include/dt-bindings/clock/st,stm32mp25-rcc.h
@@ -364,8 +364,6 @@
 #define CK_BUS_ETHSWACMMSG	342
 #define HSE_DIV2_CK		343
 
-#define STM32MP25_LAST_CLK	344
-
 #define CK_SCMI_ICN_HS_MCU	0
 #define CK_SCMI_ICN_SDMMC	1
 #define CK_SCMI_ICN_DDR		2

-- 
2.43.0

