Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793979362;
	b=AR/qRUUbDRQsiVY8HDrltkVUKQ640vEyRQeiWNo1WlIzgVFukrSCGHL9zUfe1P9UzReY
	 u4/EHXVPDQQ56E9V6KnML9AJkxwB7xYkaLYDARY/Znp25hEe4vBbbRq46fAXMZ/SJsHM3
	 eLsTo+Gy+oJghjU6zSix4IxEQZJNnRLQ2zE3NTIbUO39cMe0z5aZr1puJd5MvNxJHImVr
	 RSptM0avqkOCPk9ZasxWxup9PlTKqRqQlIkQ0zt/cGq+k3kgwiNLkXv8iNUbmd+v0enM0
	 m4jeCZD2fZx1n6v5M83hz4vkmuwucnE9J7wZDb5f2rYEMpVPcmS6/Mks3a43eL+LsWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979362;
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
	bh=ycJ4V2KYOSDC9vxajOLoms8rd3FqlmvZGzc7iSgYJrs=;
	b=KBiI1Wc+wyNzxcXESDVBCplb5Qs+fBb7V5MISi4ArtHJTmlx/Qm3/lnZ4IQLNMykGKdb
	 Q8lcaclbebC09f+/hkAhlFL1aIf65FIiJc13Bzq8Z7qMsFBxID+PlZXDnbBiRAxyDdQCN
	 WGefanqgfB/RBBncQvryCdrQxTrCVRNibs3nuxzz4AW3HOK74DCCWbrhMToYEj6/5peCX
	 xP78N0hUyC9Z/blkwnXRdAAC4abPGzDCnBjsdZoPErK60O3UBmn4sT+fogEAz22PIStpi
	 a/x/QQ7EQdsGsKF0zs4pS/gG0+0+M2k55QETXr9QK3RpwUTMFg5uur/4hk3VEBSYvAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Dysud9eh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.38
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011038.outbound.protection.outlook.com [40.107.130.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C75606D81F;
	Fri,  6 Nov 2026 15:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C75606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Dysud9eh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMDkcc69eLTOS1aGCLgC1RAaMbVD4HiYmd8t2gm+Q0vvAJek7RU/YsuXJuyE272kpTbN5VtiAr/ar0KhRyvs4APXjY9TxQnljk1rozxozev3K8u9/YJRspSzIuUPSKscVj+e5u7/vb2gp+PzGLVBdeKQ6WUShDasoyeQ7K3fm7QjkVWAFqN61ysXZSnt1f7DY4/5HvFAFeSbsh9ET55SGzx3LynVAXaSqwzApJJoJalmoXhPRcS3BhBM/lWbRzZuimHZEUkVavwIT+05R48o7zOQWd0oO+QpUX7IdV/jnHlSf5y30KFYaKChe/6kY1wXNfmNwUndLkASnO7WiocgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycJ4V2KYOSDC9vxajOLoms8rd3FqlmvZGzc7iSgYJrs=;
 b=m77hzVjKXiir9Wf0eBWBQyy6iUXMtIPZSFuBvwIZhRGJ7AnhOuniy4/IAQEpH/tmO5I3es8Bb3B0ERuXBotzkoQfNYUGsdJy289Tps4/7ejXWBQ/E/b4SY7YejUdahFN8duo/6/rVBWlLu7s6CJPqkFL/xKO61//NhKiP+mttxdsKxRUNnN/T36rUGOETFdPi9W5TPxb7BKK14FzCckaQoH+U8G8JzjkGxvuEFatnjeQMFLv+ZFjHY3jhuQTu7GIzfu/l0V/OS9JXuXLbuYBIQnYhYecgs+IXxLugM4PX4DK1MnOaE4LQPZJNA8uZMfmX27kEJykUkWhjCcS4t2Nlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycJ4V2KYOSDC9vxajOLoms8rd3FqlmvZGzc7iSgYJrs=;
 b=Dysud9ehXQIuPEuQI8ikyBIqrQBViCbTCcrk2RtfBeJbd8yVgQspHQ8pdOgOUp2nAbyPwp1caaQUIwrLvCpDkHcAoL08vGfC2Lyl3ABbEGYj5JCBriFkTDfObVZk/xtbL9vkmiym0SPbArDRrw6wzUh4cSB8JIwzrRmFvlaRl8690MUd5Qg5ZQTMC57y7v/tFGue6O8YwYSWhrvAY6shTtcvY78BLga1HyDwPI2CgsFbmWzwetIjHmP7ApfMX6NNowXki34ioRyM+Y6RqoaqkF4CqN1/5H+9GCoBh8ngReu7L42kSz/uNO3hITBUEQneSzrUCsx3NQncjUSk/vtYKA==
Received: from PA7P264CA0170.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36f::7)
 by AS1PR10MB7617.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 15:35:58 +0000
Received: from MI3PEPF00008499.eurprd03.prod.outlook.com
 (2603:10a6:102:36f:cafe::1b) by PA7P264CA0170.outlook.office365.com
 (2603:10a6:102:36f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 15:35:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008499.mail.protection.outlook.com (10.167.240.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 15:35:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:36:39 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:35:52 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 16:35:35 +0100
Subject: [PATCH v3 6/8] dt-bindings: stm32: add usb2phy1stp clock on
 stm32mp25
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
Message-ID: <20261106-ups_mp25_clk_update-v3-6-4a32f68119ed@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793979349; l=800;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=1uz0HoDkpaORv5D7C6jF0IEFFUgf6oU2O5irmDVVAtc=;
 b=wuShiSA9stFnyP+khfYWnG05RVHfx0mBACsL0h+3d1zaNc8zmPgbzRwebEe1l9yxJVQ6KTqCT
 dO/ZBMwz+nSBqAVum4Y60ZukMjobrYsLuXpsYKzPzgu3DRC1f7N5WHO
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008499:EE_|AS1PR10MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: b2787e5d-98e2-4404-dc70-08df3c1ba789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|7416014|82310400026|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Pu8lvvX92+DNMcgzPu0wcTKnIDlxq+H296nZhBOnyiovYVyctXYMqVivRfDn6GrEaDJ8CtvnIjMWfiDy4fakzTyNq7kBjwP94JQ+SOzRitdhtlCFhSbrThHqP/rpYh32fpoiOPRyYouZI93vJbY9tePoXV7XVU82FqaZ403vMxBEZRBzPFfrMNpg1WYb/2mxyukUqzbtSqq90MlBd415W6+OMET5kAmJRvEmW1wTGL9ijRfUh/iD+Tl5Z4hRcca5v/cN3xQ5ZIXHLPFLaqKV/o9C78YZyb8kwSza+Sl9y3mQFUVzlgYdKkkoDcgnbVcA84ESyJggZR9tAitQdzHZHmPvWjTx/TBpYVA6Yom05Jl1cY0U6BdN2VhNBL+YdrOBUdcpjPzyuw57rxmLSn7RfwPe0biYf9HltlwutCo+AdBVgM1PRmnCSMqWWyKBriEz633DrbTtFMdnG0OMUlBYF6NH6BY1dtmxrxCQ9rjUGsE4BP/Xwtm2JtExtBWTGL7gBCfRg35E36Xwivl9wdtPlrd9IhWerk+7nKVALlKJGZRa9DFrxRlE0QyLA9x8Vn2pqDocXy3sZXZeRpBh5ZxjChU5g0N2vrzZfVe8+OL9fIGuIarjying12rXYO1dUJmaSTtnfdZSD5h2+I7yc9vtthq7AZVXt4epTvt8qC90Mre/B2FaGAo20tA7DN8ApCocPN5ZbXSwYl+xiBgY+kA/ig==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(7416014)(82310400026)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j694LotyozSkyEIIJcjAwYuOIZTg5hmbR620e+ltxyLtyl9En3QnCuGDDS6rVYZq19OBaoutL9MDRnrR3OXtrS88RqeQYtgLNLkUa+Z1pxAQ55cdKfktKIRL72zoUPgfVsb61Dt4XkLWhAVPTC98z9vbERscO2yvn83XC0hkfeMJEY0YASbrDWJViDoy1nkkur/ietcJAOSLD05igFuHBcp942KxeKqYcNUL2KIjT/B0cpRbWkf6jCZWrKMSUAiRYeADkd449SNCVzHkAtIoyZD2x7/L+nUd6e+KvzUWkSl8NknUxDu54bCkKIAe2KhecTOOC9LuBYy3CMbBcJV5YhrL+8DLL/zdxf5qm+YFHXD7gzvYAhHWQN5LRnnbtPcYuGN11G0TeCC+Qi//3uN2rHKqw/OuztR4t+FS5WJ3a6E73ZgGjbeOYSJmoW1BcyAy
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:35:58.2139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2787e5d-98e2-4404-dc70-08df3c1ba789
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008499.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB7617

Add the ck_ker_usb2phy1_stp clock binding required for USB Host (USBH)
low power support on STM32MP25.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 include/dt-bindings/clock/st,stm32mp25-rcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
index 7d25c2747a9f..166b4fa1ac2e 100644
--- a/include/dt-bindings/clock/st,stm32mp25-rcc.h
+++ b/include/dt-bindings/clock/st,stm32mp25-rcc.h
@@ -393,6 +393,7 @@
 #define CK_LPUART1_AM		371
 #define CK_RTC_AM		372
 #define CK_SPI8_AM		373
+#define CK_KER_USB2PHY1STP	374
 
 #define CK_SCMI_ICN_HS_MCU	0
 #define CK_SCMI_ICN_SDMMC	1

-- 
2.43.0

