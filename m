Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792762093;
	b=5bMKEqptdpRsxA3lG5xtyL9LTm8qVeP0FWp1lZAJGfA5QqL/3ZXGyhhEUlB1LAhs2D9G
	 ActJ+SMW9PI3oy+HALNyEu9juc7Qe+W+7EodAFgkPsseWu6cda+Ufhj9x7HbWTzII83ls
	 jZVfjyKxZDuuRwI4ufH34tz4pgZLi+7E/qwJdaKPcRR7ZDJpd+9GZAgasO0O3slsoXV8a
	 CLhq+TmyYotNcysVvTPvLJbq0VKm089jAIEanqXFphrU3m/ISP1A8CtNPOsl9gsLAmFRZ
	 /EZ8u0cIuvVEjs5lEN0+JC0c1JVijAhHzVGdp1x4be44OLxyIUm5rTbr3rE1RSK8y3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762093;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
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
	bh=FjUrVnrHPFlXsLdnA9A0uf81gk1RHIzwW1P4obxEmyA=;
	b=A3peLNt3mGJJwkiD1BPmB6bMerqmsYzbzahmC9iFbJzf61lvodkJI5P1f38jqMRRwKrj
	 zncaCQq/VpHgnnbYwI8wX5gPI2uH+ypUPy2FbVxke372RfoRx8Zl09ha5LUYzM4VkxUzU
	 rqlbCz+KGgeohSQ+SOJmtcM1TxB5aFRnTJoty+Jg79boNjJbLk1v6ETuyfMoy+oGEq184
	 XKlp6REWFNfpPTDRtviBHCDT7vHPvJCXQ/rZ2c5wyxO5L7LWm8hrsQUCwoQnJD7/mYDr6
	 FBTGKC8hA0V+5cWSgo8UnQxg/xl60XudySLRDEVvldET2/GqHUjgMeA9b1pGzppwsqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=bYOfm6EE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.6
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C69606A320;
	Fri, 23 Oct 2026 13:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C69606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=bYOfm6EE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4XUyF8Z8r0TxYfEApdgdpuWTMvVm94WhdRFD+S2om89/K6yjOuXxEOlG+B2tdQZTfqi/GunCkoDbuNUqyMFtom8VbeH5BmU2avJiBsfw//Q60nPP5pIaOJAyZFJo3Lu9yH0jWbZFRZWbe8xoaWpGz2CwO1PtVl7sg6uO62kVjWmYdmsOcnVxhMIs+580RNL+bTuHALUokNo1iuyD341ambAuvLvZuJVltdHF8F3/TS8jrr8cuK/AAvWIcMhzWLxtCAu/+R6SEjgIHLdYCZGbw8JXNMmYgyYnJJcTLOKlG+r8IajPb/J+2GTujsXa6a/Ni8pMuAplHJeSIMILyKoVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjUrVnrHPFlXsLdnA9A0uf81gk1RHIzwW1P4obxEmyA=;
 b=NC+tvxJ9mU3EJTcjNhETU4iIcbCjeitSJi9GwZSVX1geZlQ5AP0iI+Bcn32MEjz8pMhkpMCHHqmi+l63A6NCnmC+S6/SftJN08+HOBtzurEI5XWzdhtmSS2KGdSn1QB/YBaTbVzxzadI1J87y4WrPKYpqOTNL71zbEPF3edlfHV5IYEHuI6EOId3AJWafl42o9I/3MrqCfL2QZydV34ZWc9+oK25xGTPEQ6XL7o2XGC8b4OMH6URISJW9uYNojM1Se1yK9icULJrjcZmTOaR+b6v8ytki+9cMd79fDOJxhj5PDPPVyt30d6oh5GzVTJO2GhM+pHTuBAqjHaIVwa6wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjUrVnrHPFlXsLdnA9A0uf81gk1RHIzwW1P4obxEmyA=;
 b=bYOfm6EE35kH/Ac0y1rlj0WQF1h+jrTSSJY2GbClElxScRRUfBKO2veEfXdDO9H/yREGbOWes9q6NC2MCPhURkym1Au/AB27OUTSZ+APJxSF9V2afAg7s2rZtQEZPxSkp81e9NnWOdj/KtrnrhJxUozMONeym4Rhl6uczk1Dg4pnYGYWNbnP2gquMLY4yXrHiLvtBELUx9l5/59XoGD6866XhvzENgDbx5w3KwrISH70zuBOJe/byhV6rRcSraFvJxFy4REusCjKOJT3ed7/eilMY9DMbMz7PwnTm97HKy3pf+FQPbtGsfjIm2BvVPdC0cP3N3QrkYgKFcVlq0j6SQ==
Received: from PA7P264CA0285.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:373::6)
 by MRWPR10MB9651.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:501:99::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.2; Fri, 23 Oct
 2026 13:28:08 +0000
Received: from ZR1PEPF0000E6B9.eurprd07.prod.outlook.com
 (2603:10a6:102:373:cafe::64) by PA7P264CA0285.outlook.office365.com
 (2603:10a6:102:373::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 13:28:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E6B9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 13:28:07 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 15:28:39 +0200
Received: from localhost (10.252.9.175) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 15:28:07 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH 0/7] clk: stm32mp25: add Cortex-M0 D3 clocks, ETR/STM and
 USB2PHY1 STP
Date: Fri, 23 Oct 2026 15:28:05 +0200
Message-ID: <20261023-ups_mp25_clk_update-v1-0-e906e7a38cb3@foss.st.com>
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
X-B4-Tracking: v=1; b=H4sIAOVg22oC/x3MTQqAIBBA4avErBN0ooKuEiFmYw39iVYE0d2Tl
 t/ivQciBaYITfZAoIsj71uCyjOwk9lGEjwkA0qslEQUp4969Vhqu8z69IM5SNROGVn0ylYOIZU
 +kOP7v7bd+34VL8aLZQAAAA==
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Gwenael Treuveur
	<gwenael.treuveur@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792762086; l=2659;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=TaqbAeYl50yCbpBwSK+duNBtha0LRPrOjrXbaoSGBnk=;
 b=FUKeuKkg0yW0QAA5OJb18SVUIE89sNJT/wjjnY9bCvktR4/4+OGHkh/dzC5p5ZNqfGJweY0WP
 sAoVAK9rC99CnZYOpXAjuWDBjASP0Lsz/a2wVRelmKbBAnpM7I4v7WN
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6B9:EE_|MRWPR10MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: f0380ab9-4119-4774-8c75-08df310979ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|82310400026|36860700016|1800799024|376014|261021121427099003|10067099003|18002099003|261021123027099003|11063799006|261009223027099003|261022105027099003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	ue1NqDNsGECN3LmBmYPJGcIX5KnTXM+xL4w/gV6KqV1dydLIiBYw78RMnysNHMRIuwaJHmI8WDEppxWDXhuKtH1RifH1I23vzmX+PXo+ngKTl17LLjQQJO52XAnr2aUAhgxVLUx5z1MDyhZYRKifYEySNnpQ5F+XpuNNbwOUJrmRlHP6j6eaTW2Gz1FAHyRUTc0B18AsEwn78qwfWIMapBeVUJiPmALKCT2FjyQeXRnsIIb0vH169NJ6hHlg6YrefV19tUaqtMVnE5CBaJPCdLJUMbz4S+BVcs9ivRc9OpNx0vhBUhkPHUDG7Bdh7iBsxGfK8Ec7BH3KUsEgpEOhQga4/LdC0WFWwDTLhAA/YJOT19S0N/mPum+icvGXQcBriozDwFHgG3berBc0Qu+CtSmasgILKWfvfew0Pl152VLxvZHu0A410RZIesSZYZHcaDbGKUq1dwKelR8mu4KUmPR/ar9pnq+riUv6pID97zaMdwO0UNd0EBqfwkNfDQPLCJs8m/44V3BngKE9CDJPG1WU24RsxmKjz+bIULkGgfbZG9qp+SeTyHLpsb/R9c5q54pBa/9Hq1YSbLpcnoLPGbQCO58uUeN8vUoikO0+7Mnrj68HGWxLj8DTJ7IRum+v5vP+tvbHtTAhey0BlUWwZCOJC0sZRh3byf8pMBo8BAPD3G9phF2+xLfjCKAGdW7kTZqRvGrozbiKdQ08ls1yAg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(261021121427099003)(10067099003)(18002099003)(261021123027099003)(11063799006)(261009223027099003)(261022105027099003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OgmN9xT43nwoHW/PKuf+9L+11S50HE057uReAQ628BlltV2Z26LmqlT0y80NzhZsiB0XT8xOn5XM0UlUGI9YJxSTTd8zqfHOiLwWTCkXR6lzzXAYGwNqLiUUJVITjyoIOmKQcSbkBIFnSGoSSga8I+C0mnSnXde4O9doUwhoZDexBFm7YJQVE0Cd6pQxg74Q17aSEugV9Z80ILwdh6b/YwS5XUpUow6EvfTfHoYqxeLL5btEctlBItnmt1BqZ4aSTnpvc1avTuFvGHxj5C7/43yCVchYdBWMTyEvqN4q4g7B50JOxpng/2+ZUKxaI9vEkgHIK/SK8pripqnDJHdHR+Kk/LiwNW5UboJCcykGfVfQKP5r6grn7T7YNAa/hBQ47Txv9F6lIpjoENuIebTeir8XrS1+lTrPFZ5hIfa3dUnNuPOcCczyy3zDVhuEm/JQ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 13:28:07.9414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0380ab9-4119-4774-8c75-08df310979ea
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6B9.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR10MB9651

This series updates the STM32MP25 RCC bindings and clock driver:

 - Patch 1 makes the driver define the number of clocks of its provider
   (STM32MP25_LAST_CLK) instead of taking it from the binding header,
   and drops it from that header. That value is not part of the binding
   ABI and would have to change each time an ID is added. This is
   already how the STM32MP21 clock driver does it. No functional
   change. The driver and the header are changed by the same patch,
   as the macro has the same name in both. The driver patches 5 and 7
   then update the number of clocks.

 - Patches 2-3 align the ETR and STM clocks with the reference manual:
   add their kernel clocks and rename the bus clocks and the
   RCC_STMCFGR register accordingly. The values of the renamed
   identifiers are unchanged and they have no user in the tree.

 - Patches 4-5 add the clocks to allocate the D3 peripherals to the
   Cortex-M0 (CPU3) and to enable their autonomous mode. The binding
   patch also adds the HSI, HSE and MSI kernel clocks as three new RCC
   input clocks. They are optional (minItems), so that the existing
   device trees remain valid.

 - Patches 6-7 add the ck_ker_usb2phy1_stp clock needed by USB host
   low power support, with the HSE kernel clock introduced by patch 5
   as parent to keep it running in low power modes.

The patches are kept in one series because the binding identifiers are
allocated sequentially in the same header, and patch 7 uses the HSE
kernel clock parent added by patch 5.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
Gabriel Fernandez (6):
      clk: stm32mp25: define the number of clocks in the driver
      dt-bindings: stm32: add kernel clocks for ETR and STM
      clk: stm32mp25: update register with reference manual
      clk: stm32mp25: add clock for D3 peripherals allocation for Cortex-CM0
      dt-bindings: stm32: add binding for usb2phy1stp clock on stm32mp25
      clk: stm32mp25: add ck_ker_usb2phy1_stp clock

Gwenael Treuveur (1):
      dt-bindings: stm32: add clock binding for Cortex-CM0 on stm32mp25 platform

 .../bindings/clock/st,stm32mp25-rcc.yaml           |   9 +-
 drivers/clk/stm32/clk-stm32mp25.c                  | 216 +++++++++++++++++++++
 drivers/clk/stm32/stm32mp25_rcc.h                  |   2 +-
 include/dt-bindings/clock/st,stm32mp25-rcc.h       |  48 ++++-
 4 files changed, 268 insertions(+), 7 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261022-ups_mp25_clk_update-7f1a03b1c6f2

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>

