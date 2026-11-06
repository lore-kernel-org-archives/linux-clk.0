Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793981798;
	b=u4bNfgjlCpo/t3y+ly37cXWeoeGeLfBC0Ti33cMXzkEF0y6Z7H+0f1Ai0J/5DbMlgYNU
	 GlhtvB4ZmUkWJC9D92pHvFkorrsFRnaDGRwfHhr6+x2Z4UJCZVvrHaECcKJLUsZncRUUb
	 MdW89qe66qe3/U60Lf3gBanpFb7u0kCD7mRP5893THU7iWQEn2Pj+MCtl3UPFGJkduFUV
	 Af9pRMiVe+lpXrvCL4a0AtQDhrJ3H4nd4vrKFc5+gOqlCp4D8R+XCCdAJ6kbUhsQYeK/v
	 jnSRd58GfmA13CnhAOlOC2uczqdvOigiJ10K6xmlzWYbpCnflrqV5W3b0HP9Y00ziTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981798;
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
	bh=UO2OqNWinLQoAPIlh9E38gj+Hy0J/lAlF+E9uSehgng=;
	b=l3sTxyka8aXqvuiGEkBLV69UsMQWBYlyjkpJqg8SKnqcsDBUk+kbiP3RHoyCD/9uVN2b
	 2R3bFLz7VFEHEOP3VHOqu60vairHavlQZZgI+uXtfjw9YPx7Br8fCOBcs/sSvLsdD1i3I
	 IEk9pElOWHvT8yrHRNLr5exMjVt4S2BFfRzuP73CkSngXY2eXqnTmfuY5gq6fSDLhS3Fe
	 /M7deLGWw534YiREYU6qMcqr+o1UawBq2vyo4vvvSzKE2LA3JWl7e4GMMKwdOhuzlnnnA
	 MgUESnSRU5mtT0QHwRtkR1v0EJhfNKy/xJDJa4WqI8TFlMBtacOTl7dIX90IWuM29Zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Xdev2NUd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.52
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013052.outbound.protection.outlook.com [52.101.72.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64992606A32C;
	Fri,  6 Nov 2026 16:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64992606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Xdev2NUd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5MGRgWGFBK5mtwgZltxkchdz0H4yxqLNvd7aoBmVEHqq5IX8piaGyF0W72fbdm9UUU4+Mmm90GUrzCcaIYex8dGjSfJWVgPH1cUqPC9CWDQq4aKBH1f8PquDDkQPRXJFprY2O/kUxDkp5BFaiKEXC9Jfjv/y0IYJWf0EAayTTjZU48oFm8aheiEYT7ATVc6ARQZQR9WCohwLybpGOZYrS7fbZcoC/UDdow+o5Qf5Lz5FVViaw5iJugBlpzacPDtQH7lZFIwaC34NzCXPIXv2usGjXYZkINQ9zDjZlkJ9Nwc+gerHJ3D/rwYrY1rT+lAmTdmL802GZpap9DISIcVIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UO2OqNWinLQoAPIlh9E38gj+Hy0J/lAlF+E9uSehgng=;
 b=xEVechcHiLI2vnadDMu/ydgK4wPYThrAJ9N9k2/bW7tgwOHdv2jl2EjeUzfT5DfXJx6q9thETObS+wIsX78kQZX8hiGpfIuKwmxQcZGP2k7YcpGwnQgn1FrW2oGTMXzpev2iLYTLhvatPDwU9YdKCwsKeVHTR4yhqDqD53kwncFtgGE44LT34E1vE/Hst5PB8qSCpiAyOzoGvevIRHNgzyeF+I0nzeSCscbDsWVQBbCYVqMj8wU0xJgX/jTPVJwNx3Qt1+lUdukcShiL5L6JnKaHhpYMvxHM+yorWpOCjXgM9oZy3KAXx5sG2Km/mCDqZ3M6/4m1h+psjDErzWsVPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UO2OqNWinLQoAPIlh9E38gj+Hy0J/lAlF+E9uSehgng=;
 b=Xdev2NUdw0z14fAP42r857UcJM9zJXORpHH+vVwZKyYOYMv5W2qZUcKqR/1SvT6qm2WZ1qLy8vMnjhnE4cw05kaAveikoRe8EXJlHAjc2MYKn8wozK8LJ3chEsDZLLb3QgDkQfUdSocqeBxnHlpb+IqFooXGcuBiCKOXSipfYmi756Busp+SEna6qGrpbdNIGR0AUoq3Qv/G9n4Gac5iNrsEFFBdmyNuWj3dO98KxZBZ6MUTSFy8mWZgBAFHyqWGuAGki30p+CRCwWUeYqHDtNBmILPXSTBd59hl14U6aXmfKCbIl/R8LeT/Q7kKqtOEpbQM/UVOdHhujOTqHcu5eQ==
Received: from DU2PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:10:3b::34)
 by ZR6PR10MB992253.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:910:d3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 16:16:33 +0000
Received: from MAD0EPF000008B4.eurprd04.prod.outlook.com
 (2603:10a6:10:3b:cafe::74) by DU2PR04CA0029.outlook.office365.com
 (2603:10a6:10:3b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:16:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008B4.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:16:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:17:02 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:16:32 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH v4 0/8] clk: stm32mp25: add Cortex-M0 D3 clocks, ETR/STM
 and USB2PHY1 STP
Date: Fri, 6 Nov 2026 17:16:30 +0100
Message-ID: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
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
X-B4-Tracking: v=1; b=H4sIAF/97WoC/43N0QqCMBTG8VeJXTfZzrE5u+o9ImTOsxxlijMpx
 HdvBhFUF13+Pzi/M7FAvafAtquJ9TT64NtLjHS9YrY2lyNxX8VmIEBJAcCvXSiaDjaFPZ+Ka1e
 ZgXjmpBFYSqscsHjZ9eT87anuD7FrH4a2vz+fjHJZXx7+9EbJBadcKMoMalvizrUhJGFIbNuwR
 RzhDwWigrmuMNVktKu+FXwrUqjfCkYlNQhOaSlz+lDmeX4AStgp60QBAAA=
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, Gwenael Treuveur
	<gwenael.treuveur@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793981792; l=4535;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=4sVlRhfRLqLgrJ+z1HrovNNhDZRufe89wHWGB61GijU=;
 b=KMoUX8Tu2S7LVnItYxWlUNl0RdbWAD4ymDc+RWerG4etHIbfYoFyfS/FoTz3vzkfQPDb3nCVQ
 sJh0KbbsBvFBB+YdHQkN7uybUvjjKB8djzl0ZcRNu7KmgfWTLkbhxq2
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B4:EE_|ZR6PR10MB992253:EE_
X-MS-Office365-Filtering-Correlation-Id: 65cec658-c920-4aae-e6b2-08df3c2152a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|7416014|36860700016|1800799024|10067099003|18002099003|13003099007|11063799006|261026121527099003|261028144727099003|261021121427099003|261021123027099003|56012099006|261102123227099003|261022075727099003|261026140227099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	lbBqmeWWJEVrpd/Khzs9b5FZ8HvbB9vfgr5rhETLF7mTiJLIvZyQh1xO+oq1Kvp643RzUk2eJLMHHIr5DmNk7bbkcFS3ZTrAPo0zdkvc4QXwdhG2xKyQlRXTgIAEzwVcocwoWdLbWahNhPbXwvwTwrKdhc8DJmQgkd2Y+MQRE3CaUWoe+BUkmkIuKbmrNqC4Wi2cBvXPTR3Zh48Hfy47HZdkxTHxoZzz19WX+RRGLw9/2xuvf2Gtzw6+i5Ql/HkQPfpvq+9zyGeI1j4DZApv3wm16VmuI8yr++cVDWzO/oqs7G9oZyNhFHOVGoEph2M1cMzHB7ze66zABrsaUYKyqRo0scK1ScxIu1wU6WmXD3bHOgaTe9Lm63wTaVJViD66WOJCOVj5vV6efHacUK3hsNXg8/eb++5OwujWmGM9t4aT+cXK9NrPCENgk9RQ4zG8bA62nWDXVRitLiZhAekODEgs9mDTXVWSZ741JwlgrK9kWCOxZkVaP2r96+Z7kWfnWykV1aTO+1BGWKz5d0xlbUzOBQWe0u+GTIjoeGejO2lLIQNF2kyMJpAIVJvdW6DDyyxOuFBeEGIOzncHbLqRjH8exYpIxW616/KUvHpWFcqDXGEd82OVZVHDe+mAgj/NVJG/SlFiTBWqRVRn4x3EAeMdgi1nKbNm7v+TqtrOGWs=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(7416014)(36860700016)(1800799024)(10067099003)(18002099003)(13003099007)(11063799006)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(56012099006)(261102123227099003)(261022075727099003)(261026140227099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dWnlJ3eCOPmtVQr55R2deW9luB7rRl0sIgLNJVPcFdEkA3PdlZKKNEqu+BfsU8u1V/83NOi+Qinv8Y/Cu37wT8ORmuAFq7Ga0J5YoG6Yh08hAGwxTaxmGsaETRQ4xfVplnLv+/DwnwaLS8CJN+K9Yk5AtWMwx9AzhB31XRmgtc2bHcCITv97mXdTw+0JU0vD8LEvU4Mmw5p5hTaAAwDKioCauOIGHQvwt5yHiMGIVAptin6u+VJBNnuMk411Z6lCmgSs1uKcfQMzgUf6ReM+afAWm9GOTAJGAH2gElZsGw8di97FQMG1DEKeK079QD/v8LOEJuAUPz2eXEb+oCnvhv4wLW8C+g8fRYPmSDES6uWrssXhYSvIj0LL2lR8n31o+hl9x+HYe6VNnubmbeikXH8p2cyksoJb+1frc0tZJkMavbVs6Vj0UKA/IsrwxTDS
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:16:32.6842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cec658-c920-4aae-e6b2-08df3c2152a3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B4.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR10MB992253

This series updates the STM32MP25 RCC bindings and clock driver:

 - Patch 1 makes the driver define the number of clocks of its provider
   (STM32MP25_LAST_CLK) instead of taking it from the binding header,
   and drops it from that header. That value is not part of the binding
   ABI and would have to change each time an ID is added. This is
   already how the STM32MP21 clock driver does it. No functional
   change. The driver and the header are changed by the same patch,
   as the macro has the same name in both. The driver patches 5 and 7
   then update the number of clocks.

 - Patches 2-3 add the kernel clocks of the ETR and STM, and rename the
   RCC_STMCFGR register (driver internal) to match the reference manual.

 - Patches 4-5 add the clocks to allocate the D3 peripherals to the
   Cortex-M0 (CPU3) and to enable their autonomous mode. The binding
   patch also adds the HSI, HSE and MSI kernel clocks as three new RCC
   input clocks. They are optional (minItems), so that the existing
   device trees remain valid.

 - Patches 6-7 add the ck_ker_usb2phy1_stp clock needed by USB host
   low power support, with the HSE kernel clock introduced by patch 5
   as parent to keep it running in low power modes.

 - Patch 8 uses the reference manual names for the bus clocks of the ETR
   and STM (CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM), consistent
   with their new kernel clocks and with the STM32MP21 binding. The
   values are unchanged and the old names are kept as deprecated
   aliases, so existing users are not affected. It is the last patch
   so that it can be dropped independently.

The patches are kept in one series because the binding identifiers are
allocated sequentially in the same header, and patch 7 uses the HSE
kernel clock parent added by patch 5.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
Changes in v4:
- Patch 5: fix the commit message, the MSI KER clock is the parent of
  the CPU3 allocation clocks (GATE_<IP>C3), not of the autonomous mode
  clocks (GATE_<IP>AM). Reported by the Sashiko AI review. No code
  change.
- Link to v3: https://lore.kernel.org/r/20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com

Changes in v3:
- Patch 2: only add the kernel clocks, do not rename the existing bus
  clock identifiers anymore (Krzysztof).
- New patch 8: use the reference manual names for the ETR and STM bus
  clocks and keep the old names as deprecated aliases, so that
  existing users are not affected (Krzysztof).
- Patches 4 and 6: drop the redundant "binding" from the subject
  (Krzysztof).
- Patch 5: keep GATE_RTCC3 after GATE_RNG in stm32mp25_gates[], as in
  enum_gate_cfg (Brian).
- Patches 1 and 6: add Acked-by from Krzysztof.
- Link to v2: https://lore.kernel.org/r/20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com

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
Gabriel Fernandez (7):
      clk: stm32mp25: define the number of clocks in the driver
      dt-bindings: stm32: add kernel clocks for ETR and STM
      clk: stm32mp25: update register with reference manual
      clk: stm32mp25: add clock for D3 peripherals allocation for Cortex-CM0
      dt-bindings: stm32: add usb2phy1stp clock on stm32mp25
      clk: stm32mp25: add ck_ker_usb2phy1_stp clock
      dt-bindings: stm32: use reference manual names for ETR and STM bus clocks

Gwenael Treuveur (1):
      dt-bindings: stm32: add clocks for Cortex-CM0 on stm32mp25

 .../bindings/clock/st,stm32mp25-rcc.yaml           |   9 +-
 drivers/clk/stm32/clk-stm32mp25.c                  | 187 +++++++++++++++++++++
 drivers/clk/stm32/stm32mp25_rcc.h                  |   2 +-
 include/dt-bindings/clock/st,stm32mp25-rcc.h       |  53 +++++-
 4 files changed, 244 insertions(+), 7 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261022-ups_mp25_clk_update-7f1a03b1c6f2

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>

