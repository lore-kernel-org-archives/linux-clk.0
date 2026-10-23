Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792773811;
	b=NUtg80ujPIrrZHo9sxMlV2iSKbo0aFgPy/AQdBHb963GkHSqQodXCj0lBbikAHzczcfq
	 VeXEy2TB+4108XrCoUfsjHJ/VSTGRP9qK5FL1eRbmkuPt2j8BlyQYMIHFJNQErrvvflhb
	 rjasUf0aaCX0ACViVl5wkWps8liMLKBfyz0YKQfqt8r4gx2/NWH4BVXsPtd+ulSTpHUlz
	 RqrYcKdgb2CfQj6fy0BphEV0yCUmtcLUcj12BnigTzkej9nYaTazMhqVn3LGzeogpPst4
	 aAuFkHjSwaulgS4NIFdX7Y8x+2Q63ritVcJKvBZI86EQueDe5cxobnpzJMaWHhnvPqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773811;
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
	bh=WsVozoYU9DTPR5CEQqdsbuDUbyWcak/nZfWgADgvSnc=;
	b=HznEAAocwunfWqPY7LB8hAyNKn/MHBkgxLsxuoKikDDKm6FzhpnMZdbRGuTGYiiqGnOC
	 hvaLOz3BYUntwCB6jt9LjMp7xN2W/ezbEtYNCcE/QLw+icpogu6Sn9b+5uC23jQ8MFsFP
	 RJmgiSikD0nGBG1A1MJoJ5Zw1gjv9iRzka48WoZX2Lr0INcB+orQ20JDw9hT/DOBpxpIU
	 oqTy9EBYskxyZ6ME3Mdenj9AEubBmkb1jCBOVnmzNqhKXMjX6aNv9dZ0cE0NL2ghF50Cc
	 sHiiBWMMSYmeh2j6KvbRsIRkpqU8UMguYUeLg4+AXcgeHZSyuSQ9jgLA4cZWj5w//iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=ifllSanh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.54
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011054.outbound.protection.outlook.com [52.101.65.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D15606A31B;
	Fri, 23 Oct 2026 16:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32D15606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=ifllSanh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6zDoK4drsCFrcdp7o+i7s0DF9Gju+h0DHe7CTQDvP26IIPueKX4f2EDlSv9Sc3NO0rrx5ergaAI6RZb8gcIk2xy5xYKhzigtlH03ajM4gQuJc6Hak8WDGmBey6EtiiyMTde1c6QEf0xtOPGRA3X9Yf16Ungr+kGtMc9HqobIZNPmSnFC8j99YoB1hldVMvAHBH4gPJBWTXBRTqBjDEmSOArxGUkOMgxfuf4SIvl4iUenANo/s9ZajwHjaAzyUc7/q67oOhHX/csYESpb5ovtCdnxFu3ALSvZ1b1ewT1VHpidjY2BSR1lQbXWAGSFlIHPnzzX0N4XMdhMKh9MSU8Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsVozoYU9DTPR5CEQqdsbuDUbyWcak/nZfWgADgvSnc=;
 b=ZvVC5tbYbeVtlM3wHNcrHD3qS6upI25Z089j+aE+Eyf+rl9tkqNQRL5hfYsSMdWvUIOitveql/H2ae0AhIXWi1o7t4LRne66pHNHEP48srkcESz0oK5p/pojwLz5oxg/SS/EQXiRQGVQ4Hofhpi0uDohDnouOg9wCXmIxf7yeXi2xKRSewSEUheBc5kPOHHGfcHeU9d6JHSzGKPz/chTs+CgpjeEYaBwn504X9r0uSoqUi4u0p2A1z2xrvvYb3cCuyuVb3jTr5a0w0KljqHAC5XuyVZZQA0DUoFA0PVCcR/4YprJQhpB/uD7d6nTEyLwIiZawlG1jyQ1/iGKtUXFcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsVozoYU9DTPR5CEQqdsbuDUbyWcak/nZfWgADgvSnc=;
 b=ifllSanhCmlrLcRdxoa/T+HJzS2RAiLwhg3t/2zOrA29EQeiCKcxU4V2NSeXk2YXmqwL+I0tezJ6+wqeEHtiZAe7+MKOaMt4HpSA1b7C07Vfc2ze72A+l9P6dSrO46xqFaL72vRbAWUHlXipWvcgdtOlGAoJ54WYS6dl+MYWlxcxNrety+f2u4gO9VBj6QIQt/YcVyIx6JP+vXcE5CFWaCoHL5LWzcLbYLW94wP8Si3waxm5zatoeReWsd9kdepPPZssnJ5w3IyZWXYmB3Ynioqmog5tzyFR2UBr1Y+0NGrKNS/peKiH58wwL72tXt9teA+t62R7ZUhmOrDtzd1/RQ==
Received: from AM0PR02CA0163.eurprd02.prod.outlook.com (2603:10a6:20b:28d::30)
 by AM7PR10MB3720.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.4; Fri, 23 Oct
 2026 16:43:26 +0000
Received: from AM2PEPF00070CF3.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d:cafe::55) by AM0PR02CA0163.outlook.office365.com
 (2603:10a6:20b:28d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Fri,
 23 Oct 2026 16:43:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF00070CF3.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 23 Oct 2026 16:43:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 18:43:46 +0200
Received: from localhost (10.252.9.175) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 18:43:25 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH v2 0/7] clk: stm32mp25: add Cortex-M0 D3 clocks, ETR/STM
 and USB2PHY1 STP
Date: Fri, 23 Oct 2026 18:43:16 +0200
Message-ID: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
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
X-B4-Tracking: v=1; b=H4sIAKSO22oC/22Nyw6CMBBFf4XM2pI+Iqgr/8MQUspUGoU2HSAa0
 n+3krhzeU5yz92AMDokuBQbRFwdOT9lkIcCzKCnOzLXZwbJZSW4lGwJ1I5BHlvzfLRL6PWMrLZ
 Cc9UJU1kJeRkiWvfaq7cm8+Bo9vG9n6zia3899be3CsYZnnmFtVYn06mr9UQlzaXxIzQppQ+AC
 I5SuAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792773804; l=3216;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=yI8fADDdT9rYFpoG5wC5BDy8fnO0ldRWlr6AB2M1lFY=;
 b=vTQtJqt74Xs3EdBxqwcXuF0dDSYDF0ieUfwqn6O09NfO5wwFJkNE6ieK6y7Lo9JTrt4cl9Fby
 UQrq+jcm5w/DP/vncSXNb7Zbf7ccHp1eQXUriTOA4LUCXJnlhOym6l6
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF3:EE_|AM7PR10MB3720:EE_
X-MS-Office365-Filtering-Correlation-Id: 1941abb4-89c8-4695-28ce-08df3124c284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|82310400026|36860700016|13003099007|11063799006|56012099006|10067099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	T30WLGdUO2oTwA6eqZnAJg1VXo6/Y+DZ5xntOrLACCh2dTWJ9quybeLorQye1iNKrlfrPZbrJcagUGRRfqFNKdj1NiB7IeJ+fs6Ykuzi82kNAmZPhZmhMlwNukT+QHuLXBGASF1kOCQZD4JVGhPB1C6nOWFrROUFDwGWQcAR+xlBsBAKRrV2e6fqHqpx1YzWzLD2u3NAvmckKtQ7JRhNPewXP0ObDeprY5mIIG0QY5U5wC1z2+OuiAohbq+ozIVKq+uIpxTYfBnSOpcSp6F1p3En2vEcRUIDTAxYU+AwtDik1hRy2u1/SRtBN/iTPBmwDzqEXSJIbrk4nU5NVF+Re2Y/NeOik0RKZHHc3q3kusH3QH/fFsz93yQj3wbBHjISpjvpxdorU5qObyuGhEt4xeaE3FDPOxC5Y7GsEppSOaP4dTATO3CbiLz6S3ig/ENnX7qKooyqMqRS7lZK/U6zOMOfe5Kp9sRkkyp2giXufytm+5YIUtUha5Hh+JPzVfyDU7X4Qhi/JF9g/Bp3iMbSatmpEgJetyNjMr9zkPj8RD1/KpNgX1R7y7Vgur2OT8dKWw3mjPrIYWNyngRZgw7o/gr5oJPPA/XYofSTRW9KpBTIjb+foozLgkR2w3OXpSIbhp5IXF3qdVoQUm6HGx0YLqvP1tbQWtGvCSuf4KA6nkQ=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(82310400026)(36860700016)(13003099007)(11063799006)(56012099006)(10067099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j2Ecz2dNuNTLw6pNW7gLa5LvPkSssWQ2ZTvN9hA8ermwI1XK/qf6LyjKvzft7TC2rynIIYqF++D+0lrAFTJKHgtLSx6Jk90i3eiIxy/SmWtDcQvnF0xtRI8NB4vXTMGMURLYdSRgDghfAW1Nq/jBdQzzURoXcllFxLMPuh2M1pID2JzV7XufFuP15FRaoJxbWzZPmA2AL2UXYUyiocmzE08rM5elVdfeS+LDWWdJAstx85yWUQeogEAneOoSqARjyjFe+7cDL7FHX5LGgjyTlI8RehoAhrXjp1gc5nBlN7EgVuy2Sq/X2OwspV8KwQUM1xhhDIvOwIdiFLSYp/akAlOUzzyoevEB+CZs9vKoHGu7tZ/GaZXfY9mfiwlRewtIbSDIxjj0Ga+VUo8GKOcyz5dDD6bBkcbV50dKIQyMajakngZ3DClHK7kHfWyrK5lV
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 16:43:26.1033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1941abb4-89c8-4695-28ce-08df3124c284
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3720

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
Changes in v2:
- Patch 7: drop the custom clock ops and the recalc_rate reading
  ck_ker_usb2phy1, and use clk_stm32_gate_ops directly. This fixes the
  missing .disable_unused (gate counter underflow in
  clk_disable_unused()) and the stale cached rate, as the rate is now
  derived by the CCF from the real parent. Both reported by the Sashiko
  AI review.
- Patch 7: update the commit message accordingly.
- Other patches are unchanged.
- Link to v1: https://lore.kernel.org/r/20261023-ups_mp25_clk_update-v1-0-e906e7a38cb3@foss.st.com

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
 drivers/clk/stm32/clk-stm32mp25.c                  | 187 +++++++++++++++++++++
 drivers/clk/stm32/stm32mp25_rcc.h                  |   2 +-
 include/dt-bindings/clock/st,stm32mp25-rcc.h       |  48 +++++-
 4 files changed, 239 insertions(+), 7 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261022-ups_mp25_clk_update-7f1a03b1c6f2

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>

