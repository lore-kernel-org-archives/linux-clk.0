Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795527705;
	b=HZFj5d9FbYHosN/yNNa16/lSvOvTBQOPc7EkMbwvp9QZAUdFpfziIMeG+Hu/PqRAWUFg
	 zMI3aC8E8kFC1nxZ7K3HiSB38IbwcW/ktpKzZ3+6e5noAfUNNVzUld1KthHUh4kOUTEXH
	 w64xngCXL6+XRZGBj2FfYrjtj8eFFNmJuFPBuYn7Gk4NZOYjnnVfrVODfwGVubGfzLLNF
	 plSvM9H5c2Xpr37+yWiH0jSdS9SOaXVA0m3jVfrXMtPIS4XWMFEPKhh5lYbo9bL0AtYFq
	 vA7Df9gCpu6aBkUnci1zUQMKCzCkIpNv6zFO4hjhwXSHJ7ZoALWaSllVZRefP8ow1kA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527705;
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
	bh=LVf1Cqyp+O0DBMSNNUmPS5W8azN+XeJChO3ZvfQITRg=;
	b=y9KPLor2DfbqVKmyezDHfwjHcz+8zqR796H7eWliwPEd6MGkfffT3DEAmlT2Mdfwrl42
	 Yy+dbFVigBilqT6mETcH6I4eirMUR7pCvHt6mgLZPa9+75G5I8WGN3+XtoFUK2XR3gEZs
	 oCuIqgc+AdORsCQnxEswmtahfEKcHC+YeWkZjvqpf75aERF1w7LT+FCxlcWfCq7hzB8wS
	 anff6vtHFJW0jH5YSckHe7IvodQsIu/1tjiMe5heq1HXg9WekIyn362tC0ctGtOxTPVyb
	 sug7AO96paw6JALCG5U4j0ESrSaEQQhjVRWZS7xAOFQB9tIfPXXOGFJKW5YGJ5geT4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=UJLwSqDG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.32
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013032.outbound.protection.outlook.com [52.101.83.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A82606A32D;
	Tue, 24 Nov 2026 13:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A82606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=UJLwSqDG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgzNeyZ94oarS7sj0ADTO/WwI6lluDtH5/XwwP5IJ24t+G6dsic1DeskoKpzjLKKQVdZhEOaqpGr7q4WJZ0tp4xZ7+V3kFF0MOFBMWnrJ7qaopLRyzC6DkWjq5NwKcjcRS/UK70T21QbCe3MRLJZ7Vj8R/ALWVGUFnP7JsxHMy7t9btypmwjOFLXBEODZR66VBEO+n+G3XUV+/TeCZQQq2IT14jkpg/Ti3kupTKi8V8OhtCGyERAJytczJ65Du7lWNnPY4aOBvbHRbpuQkn487DV9Zm7TmIdaZ8V9aQ7TtdkPHVcvFsx2c1VCqohEWOlnRDbyjJJlqDEa2b3slYHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVf1Cqyp+O0DBMSNNUmPS5W8azN+XeJChO3ZvfQITRg=;
 b=WtM9otUS6wcVRfsgFe0NOkQgoJTB3A/qj0IF1OkS1SBZcGYhz1Uv3vZSGdh8ndyNJIUWo3O8bntGMMN85oKt9vKLXvsbyTF3IelQkuFDkCtJNpMc9xsdeX0aIrUZEyHEK4d+ZTdeYc2M0wFHAaMQteQKttsgpghZVGzVqarHoZ7oaaZD45TeNBWoa6EC3bPpo8IEPSYldMpMOmz7F6ind4K395jUBCRHI7W/hZAoN4uRR537fFS+ivwY6yJMdHqJ4kw0RDlxvYus+HVec9F0eUFejuPfs9z/kXgiNA6GsgnIYCxyjzTUkTlEFmwTSf5M811bXoF2ZZ3qr03ItlK5UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVf1Cqyp+O0DBMSNNUmPS5W8azN+XeJChO3ZvfQITRg=;
 b=UJLwSqDGdIfJ1S9nVWKTghMv6sviCiH75wr44U9/KlMeGx8iEtM7inSSp7fqrknugvJA957KshgtM3Ogjoq/TGntBGLsFZwIze+x/NcDyqtbJpSX2mu+58jDRiprwtphRochjblSrpv5Sq4L5L0Or0VIMnZRLS7bH9VpZi60IaE89HMtfouzK8JkaCTItAhjvPmoXMviIZD4rfQFX3Iw6yfifxJdlbQ63FStx09/tzwIuYPNxCGIuGKoeYlU7dY4JWmr6qoWHESJqI0jFEJ/xHHntlCm1D2bzmX82lBG5grjApLvTZro4jp7znfSPx+09BOTW9wUOZxwHY933hRGPA==
Received: from MI1P293CA0003.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::19) by
 DB9PR10MB5737.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:2ec::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.4; Tue, 24 Nov 2026 13:41:38 +0000
Received: from MI3PEPF00008557.eurprd05.prod.outlook.com
 (2603:10a6:290:2:cafe::9e) by MI1P293CA0003.outlook.office365.com
 (2603:10a6:290:2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 13:41:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008557.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 13:41:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 14:42:25 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 14:41:36 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH v4 0/5] clk: stm32: Add the STM32MP2 SYSCFG LTDC pixel
 clock mux
Date: Tue, 24 Nov 2026 14:41:06 +0100
Message-ID: <20261124-ups_mp25_clk_syscfg-v4-0-894d95dffec4@foss.st.com>
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
X-B4-Tracking: v=1; b=H4sIAPKTBWsC/43NTQrCMBCG4atI1kaSyU8bV95DpMQ0bYPWlIwWR
 Xp3U3Gh6MLl+8E8cyfoU/BI1os7SX4MGOIph1wuiOvsqfU01LkJMNCcM0EvA1b9AKpyx0OFN3R
 NS7WVAJIrLQUn+XJIvgnXp7rd5e4CnmO6PZ+MfF5fHmc/vZFTRrUuSjCuBsPspomIKzyvXOzJL
 I7whwKzAlIps9+X3hXfinhXyt+KyIoRqvaF4VY6/6lM0/QA4Dl0AEQBAAA=
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Brian Masney
	<masneyb@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527696; l=5923;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=Lir5ezBE/4p2YGeagHSXmYnnq3mWLsfYNnAuN2fs2rU=;
 b=HamOjYNEoILGJBb78s0mvnFaIy8YhdmTwr1SSE80BXty//bqqlnIdXj3vURAJT4+fu/p3YrM3
 AzzbHZbIsb7B7rVc4Jnm2mPw69tV4ulexmRdf/4lccigNfxtBnFvkVr
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008557:EE_|DB9PR10MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: fca49aca-bdb1-42ae-9c68-08df4a30a9ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|261028144727099003|10067099003|260925021311599003|11063799006|56012099006|261021121427099003|260925022911599003|260925021911599003|261021123027099003|261022105027099003|261009223027099003|261009221227099003|261022075727099003|261026140227099003|261026121527099003|261102123227099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	XiL47z52X0fANRgE6Xb8wDX37eQRd9CTBNsTDFOZERl0ThLVnc8CSx+5AxtClYRxRR0YpqhLnYXGngnoQrP4QGljy1K4hJWkSYUSzsqiFb71w1O9ps5R/Oil0SlyRyl8ftI6ZRMNPDk0oHHxNkVpYxQBnhkw+g7xdsxC8jBCaA/AcQJkmVCBMyGXOzmiRZFFpv4Me2qlhzcFPYi9AYqYRi7VUCH2s0E/Q4OxYv+1NV9gpoIMO2YUWSJADquB+7yiMxCa8nL8IaQCa9JCnsKgivRqcSupA8hquxVP0pWkp5RhTgvOSmRX2pJ+IwcQ3qV7mkkgE2BeCV0ouaQ94AudJPXndHgYULcvP427FALLEE9bKbY41kAzjQip20l6DP1FhWV4F5f+zxTGe8pd6Qzs3su0vUl76+ZE8Jtxbvpc5izCJRm1iVUOEejMIzacj7rZvLE50RGJ/I5PQ4qqweY8trtiWuRN+2DD8QZ/QTnTjIGobEkWjJsfecSuICCn2SDMDsZnl9dJcQWcVnRfT/Rm69BT1T64Xj/cclYpvMv+mgnkMGxgdPlDHERdnGHUUre7SRp0hpMDNQMXV9uaUkc5WYZuJHW9zPuprb+jSzUCthasFTzc3wZ2o12SlRCKWAXY6x9XiOzkc1L2nHJGtPjEDdnUq2s9kvtrS8clWMVb0PE=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(261028144727099003)(10067099003)(260925021311599003)(11063799006)(56012099006)(261021121427099003)(260925022911599003)(260925021911599003)(261021123027099003)(261022105027099003)(261009223027099003)(261009221227099003)(261022075727099003)(261026140227099003)(261026121527099003)(261102123227099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EncDgB1i56AOYwaEJoAbCuMGEkPx6QF7bEXn3sWnvuLT2vk+t4RjVsvbqxGZ34VSP1mxE2fxB9XeHZD6lmWyEEMEWUBaaU7EALoKx+ss811Dlhqt0blhVmSVPNIBc68sXV2IUekZosSVwQf9N+iJc2LMXTORTTprhCXh1GYEeALjERedZxAfRGBlLIaMslAYuYzudSSyApQ8qXhwCWLkzQq7aWGLXHAYih62DYvX4hxOCba3IMChFE5PSkFgqehJmtlq90Ff8HrMKCv81hyKbsBXvP4MgfwxP3ct7g8earXF7FXkUwG76bYt+udvnGCb8GbAVpxJyt4b4BLqfC1PgPXZ+ZSr6Rqx1dscN3ECI+ubMsYH7zsQVc/qPM4Xm2jMeFOvqROZw5cUEGszmK7VLja8NJQRyIYsS+LurcxshI7qUTqrG9oetREkpRVxDR5H
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:41:37.4803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fca49aca-bdb1-42ae-9c68-08df4a30a9ac
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008557.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5737

On STM32MP23x and STM32MP25x, the LTDC pixel clock is selected in the
SYSCFG DISPLAYCLKCR register among the LTDC kernel clock (RGB output),
the LVDS PHY pixel clock (reset value) and the DSI PHY byte lane clock.
The SYSCFG node is already described as the provider of this clock, used
as the LTDC "ref" clock, but no driver registers it, so the RGB output
can't be used.

This series adds a clock driver for this mux. It is based on the RFC
sent by Dario [1] and on the driver delivered in the ST downstream
kernel.

The SYSCFG node remains the clock provider ('#clock-cells = <0>'), and
the inputs of the mux are described by its "clocks" property. They are
only described on STM32MP235 and STM32MP255, which have the LVDS and the
DSI and whose LTDC uses this clock, with new SoC specific SYSCFG
compatibles. As the SYSCFG node is bound to the STM32MP2 SYSCFG driver,
the clock driver is an auxiliary driver, whose device is created by the
SYSCFG driver. The LTDC "ref" clock is left unchanged.

As the SYSCFG node is a syscon, the syscon core attaches its first
clock to the SYSCFG regmap, i.e. the LTDC kernel clock on STM32MP235 and
STM32MP255: this clock is kept prepared, with its parents, and enabled
around each register access. The SYSCFG registers don't need it, but
this has no functional impact. The LTDC kernel clock is listed first as
it is always provided by the RCC, while the LVDS may be disabled, which
would defer all the SYSCFG users.

v3 avoided this by registering the SYSCFG regmap from the SYSCFG
driver, but the syscon users could create it before, all the more as
fw_devlink defers the SYSCFG probe until its clocks are available. As
doing it reliably would require an early initcall, this patch is
dropped. Please let me know if you would prefer this approach.

Changes compared to the RFC [1]:
- parents described by clocks/clock-names instead of global names
- auxiliary device created on STM32MP23x too
- SoC devicetrees updated, Engicam board patches dropped

[1] https://lore.kernel.org/all/20261028135915.2665857-1-dario.binacchi@amarulasolutions.com/

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
Changes in v4:
- Describe the mux inputs only on STM32MP235 and STM32MP255, whose LTDC
  uses the SYSCFG clock, and make them fixed for each compatible instead
  of a variable minItems list (Krzysztof): add the "st,stm32mp235-syscfg"
  and "st,stm32mp255-syscfg" compatibles, the family ones being shared
  with the SoCs which don't have this mux
- dt-bindings: arm: stm32: drop Krzysztof's Reviewed-by from v3, as the
  binding changed substantially (minItems removed, SoC-specific
  compatibles added); it needs a new review
- Drop "soc: st: stm32mp2-syscfg: register the syscon regmap": the
  syscon users could create the SYSCFG regmap before the SYSCFG driver
  probes, and the regmap was leaked or left registered on errors
  (Sashiko). The syscon core thus attaches the LTDC kernel clock to the
  SYSCFG regmap, see above
- soc: st: stm32mp2-syscfg: add my missing Signed-off-by to the patch
  from Dario (Sashiko)
- Link to v3: https://lore.kernel.org/r/20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com

Changes in v3:
- Drop the clock-controller sub-node, its binding and the dt-bindings
  header: describe the mux inputs in the SYSCFG node, which remains the
  clock provider with '#clock-cells = <0>' (Krzysztof, Conor)
- Keep '#clock-cells' in the SoC devicetrees and the SYSCFG node as LTDC
  "ref" clock, not to break the existing users (Krzysztof)
- Make the clock driver an auxiliary driver, whose device is created by
  the STM32MP2 SYSCFG driver (RFC patch 3/4 from Dario)
- New patch: create the SYSCFG regmap in the STM32MP2 SYSCFG driver, so
  that the syscon core doesn't attach the LTDC kernel clock to it
- clk driver: depend on SOC_STM32MP2 || COMPILE_TEST, check the
  regmap_read() return value, drop the redundant CLK_SET_RATE_NO_REPARENT
  flag, fix the copyright year and the order of the local variables
  (Brian). The of_get_parent() change doesn't apply anymore, the driver
  using the SYSCFG node directly
- clk driver: drop <linux/mod_devicetable.h> (Uwe)
- Link to v2: https://lore.kernel.org/r/20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com

Changes in v2:
- Deprecate the '#clock-cells' property of the SYSCFG node and remove it
  from the SoC devicetrees, the clock-controller sub-node being the only
  provider of the LTDC pixel clock (Sashiko)
- Explain why the mux needs a sub-node: its inputs can't be described by
  the "clocks" property of the SYSCFG node, which is a syscon (Sashiko)
- Link to v1: https://lore.kernel.org/r/20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com

---
Dario Binacchi (1):
      soc: st: stm32mp2-syscfg: register the clock device

Gabriel Fernandez (4):
      dt-bindings: arm: stm32: Add clock inputs to STM32MP2 SYSCFG
      clk: stm32: Add STM32MP25 SYSCFG clock driver
      arm64: dts: st: add LTDC pixel clock mux inputs on stm32mp23
      arm64: dts: st: add LTDC pixel clock mux inputs on stm32mp25

 .../bindings/arm/stm32/st,stm32-syscon.yaml        |  40 ++++++-
 arch/arm64/boot/dts/st/stm32mp235.dtsi             |   6 +
 arch/arm64/boot/dts/st/stm32mp255.dtsi             |   8 +-
 drivers/clk/stm32/Kconfig                          |  13 +++
 drivers/clk/stm32/Makefile                         |   1 +
 drivers/clk/stm32/clk-stm32mp25-syscfg.c           | 127 +++++++++++++++++++++
 drivers/soc/st/Kconfig                             |   1 +
 drivers/soc/st/stm32mp2-syscfg.c                   |  14 ++-
 8 files changed, 207 insertions(+), 3 deletions(-)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261103-ups_mp25_clk_syscfg-6a4224156431

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>

