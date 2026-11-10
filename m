Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794316239;
	b=Tmt4Bv5ZU9MsDHsK7eUSkLjfQwYa4UDrx7cjXPv6w8Yywzd9MLfNW9oDaXIVZsDgU1VJ
	 CMFEmWfwvA1SVwQnX0BABc8p8q/QqjQXGTK5NdDdFcGZgzX7tfbbK1U4zdL/PPz60nJyI
	 IZb8y5bX1fvvHJhcDcA6tfgpS9GvLidLqtNEkRAzC2Pw6R8in3BGXBhW6EgjKiSrKNvcJ
	 rJaGJUGNqTd+YifOsQ+CZDK1cDbsSw12Vxy4m7e4awLb2Xf0y8ma6AX0AF+AHoh+aFjGL
	 Q1Iu7iYhMd/jYkSUyMYT2dduCBCYHeKzAJza7/yes27vDQObIxE5q9wdxXWSkKc1b3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316239;
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
	bh=nXR9zHjXTCFr+RyqTc4pwO+5KFZ7+50bc19oxAmXY2Q=;
	b=1tu+5jtgm4r1UuntE3hqk6fO/ns8597SFcGvUhM9J4OHRRLzVbR4vedSQrmu4f39Q/1B
	 9N0gdHT9qWlcv7OGDsfrMA6iyljbwQqnIQM94hb8zeZkyLiLsJsvyEIG0K08YUx5DXWDx
	 0kr0nN2uORLA7wORnk4fKxkX0cbrdZaP5qr22X8cTFN/2t9zzgS7zaqZt6fhmLsZcPOFW
	 vkuvWkL75WiVBLVd9McQev62ER7XV1lqHzlzoeKtjepGJws2c/uS5C1RF8GhC81FvY6EN
	 jNPOyNdclbImbyvLKPfcFD/pJmCPC5DUNxi2KXcQbnahDQynoNcOR7FVqvC1Cpj3O1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=mrwv3pgU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.41
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011041.outbound.protection.outlook.com [52.101.70.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E3460A382C;
	Tue, 10 Nov 2026 13:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55E3460A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=mrwv3pgU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2C4IHY8wn3LfgOizzfI9TL6SGjIX87i6XqGih9ACqPLHphnR41r/eY1KJh4xWzabrGsx+47p216yW4ICU2W0G/6exV67UoFUXwwqXhS3B0MOkFUHK2NcH7UToLtAxfcDQjIo/AAEAt03+WcNPEib+FD76bQkN0dshB2MNMTYWtDeT/skDMMxJ2PfIBdQryF38TD5MpL4fLGfQlrbAg0g/4LYg51RB+weQmOz1BkeMlWMXuFBIUU8OBpMqa0KAd5BZqlw1hfU6JyvRySKI0x4OtOKfqhNGfX8HRZ9yIC/Jwqhouk2rILdMJrNZwqnYej0fe3sQjj704iC7DeAN1vgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXR9zHjXTCFr+RyqTc4pwO+5KFZ7+50bc19oxAmXY2Q=;
 b=g6GD5DYD8hYSnzs2pxJfada9IVilmfUIJTJkqaDdYWu4BXyuQdMYAwXckchU2eJ99JVPQQdOgJjNpHIB8+7TOoORl+cPTSvnT4cs6BIdOXQD92FQ0Kr1Eiy4o6H3QtnvI6Ee4da+Tsx9hazu3ZENx1qVGDPpypuEpLqywu5yPvXKlpW4MT53BTwQbwttLHOVrHvs0148irF8RkE+xzRbjy1BBVXobd+JSSQ9dMQGDuj/28EWEP7S0YYmQOrZ2UsNpiUV/XEMf67vILvXH/Y2jSv2Ahnz0TWtCUyqLQI2U19Q+d5hCmrE+LBdP6KJLgtKa7pmgQKyPG/rfGXkLH7jNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXR9zHjXTCFr+RyqTc4pwO+5KFZ7+50bc19oxAmXY2Q=;
 b=mrwv3pgUQCHzN9jPtDtCAFMbee45xsNlipuyc5jHa/QVHZY44OkMikZoPuUg3W0eMVdCrKS9Pkt6RlJ0XJuYMN61HHg6JHgY0MlHM+rwCQJzmwFIYVVbuxgzJgK34ciHxrXVQJRXP9Mu8++DnQONWup8opH6zWBSfJMJPsJ1pOTHV4GVRZWEnx005hRSjMSrVPhMeeR6y8jB735Kv4EsOdN9HXP+3k9GEEbdGmZRau/o1ogxcwRxtSKvH5uiPmFYdVrvWyN9njwQGWQdErAkwQL1a9sE+KJmr6Acq5dI6w1JjRAZnevI9CQsvMyFXDJnpgRBpUlKL7h0a3OVfLbORg==
Received: from DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) by GVXPR10MB8344.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1e9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 10 Nov
 2026 13:10:23 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::8c) by DUZPR01CA0055.outlook.office365.com
 (2603:10a6:10:469::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 13:10:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 13:10:22 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 14:11:18 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 10 Nov
 2026 14:10:21 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH v2 0/5] clk: stm32: Add the STM32MP2 SYSCFG LTDC pixel
 clock mux
Date: Tue, 10 Nov 2026 14:10:20 +0100
Message-ID: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
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
X-B4-Tracking: v=1; b=H4sIALwX82oC/22NQQ6CMBBFr0JmbUlngCquvIchhJQCjUKbDhIJ4
 e5W4tLle8l/fwM2wRqGa7JBMItl66YIdEpAD83UG2HbyECSFKLMxMtzPXoqav181Lyy7nqhmpw
 ox0LlGUJc+mA6+z6q9yryYHl2YT1OFvzaXw/l396CQgqlzhcqdUulbG6dY055TrUbodr3/QPac
 ARwuAAAAA==
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
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794316221; l=3664;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=SQLICHhGQFco3c2ZsY8T9yXQ/Z7uVyEOLLivBoFFOUI=;
 b=wthAJ8oimJle48myhocXuaG5yYmz8Ro7RrY4AX+9PYa9ZfG9aSLxj4/h3eJ9m5qM85/GEs0lQ
 MWCon0hAsKkAHe9XSpWyVlWzZkq9S/SDfTgoxTMI/UBakksX0JNYDYA
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D04:EE_|GVXPR10MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 90625dcb-e27b-459f-9b67-08df3f2bfa4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|7416014|376014|3023799007|10067099003|18002099003|13003099007|261028144727099003|11063799006|261026140227099003|261026121527099003|261102123227099003|261009223027099003|261009221227099003|261021121427099003|261021123027099003|261022105027099003|260925021311599003|260925022911599003|56012099006|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	VfExlg79mep343CwWgR/iQHwdJ/2+KvJl3c46Wobwgq0SjOG5n9Lzv9rxQRc1VMta2ailFhWrYCsJZeGcEouUizFzE7QJh6SkbCPPOQEiKKoyVcFiSxe4+HojP7lPup0NHkTUIyKYeEW5gtQP0kjhYJxhSZoPutvtuOUbHE4wBp9tP6kt81Mux8wNE4yBSlBnUnzv3rGHRNCmDj3o8UFae+yGwexjVPmQb8vS8XxR0E1EpRqsMhWlq9VrwJJ4tgALDDaP7aEK2ewvnacXbecR0QXrwQMSF5+kW8NIsIPmHpNpSN6OVoxNX1FhSpjhSol/FgPQXmSdNxI2++xCquxattJdcmLjiXRsH00P/E2r0mOMHjUDW/g4ByeTxNUZL6TPtjLTfSaa0+qTqLxgUOsHZCLWlxKq9bfpi/obdtGa8DnSfS374U+H7BJ+w7JGPyoK4i3D2PeDIE9zBDNdxujJW90CH1VNqhDH4jSEmGjKw5FyEyUBInj6e34T5/+p1nRaMRvgxcfomsS8aVVz/T3pD2qdpFKXGlPqNGDMHegourR1zy09asHCZ1+j5czGoVTp+zgB6ZsXxWD0eeJi5nInWgTs/PoQRV8Kp/cPySgphccl5N20lVwEo7JD7FmQ7pCbkHesn7toqeRGA/57Y6fIIrTU/RunsPchm9oNN+arkE=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(7416014)(376014)(3023799007)(10067099003)(18002099003)(13003099007)(261028144727099003)(11063799006)(261026140227099003)(261026121527099003)(261102123227099003)(261009223027099003)(261009221227099003)(261021121427099003)(261021123027099003)(261022105027099003)(260925021311599003)(260925022911599003)(56012099006)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g7hMJMdCMmPrB3dtcwYyk1Yrpas5+qVMEWgiB0+7YqKAiyJg1lQxo6SlXvvXs6rJtj+XKbMcHZ1ypfDFkDGRBeDWo3PKyEBNKUVSpgjlc/kQxUORFedr/vTVXv8HliXhVud7PFSSiVlXtvnxRA6LogCgYYm7IAS60gUfg2BXzPmEXJrJzoozcNjPCyeXH+uQ3Pq5fuLA2jdsFMuqhEGOLy7VNRMUxCrYPL3e5P8I/O76Ci8Xt28Lh00CpGdCFevbSBf3thXwc0neHic2FPYlUgjvmGk9pd7Bv6vauHpkqIBjLlSLEtwFfmqcfEDI2imFXs7c61quQo2nyPPbF8ox9oOZnq1UYBhvlqYg6NXiLzGkp0Vb137XQrDr4jYoIHEvGkzCU0vk+buONqpTyMQUaqlBO30Xp2bhVSg0CLPnpv0ss7c1GZDW7YKz9C3YP6rs
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:10:22.4424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90625dcb-e27b-459f-9b67-08df3f2bfa4f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8344

On STM32MP23x and STM32MP25x, the LTDC pixel clock is selected in the
SYSCFG DISPLAYCLKCR register among the LTDC kernel clock (RGB output),
the LVDS PHY pixel clock (reset value) and the DSI PHY byte lane clock.
The SYSCFG node is already referenced as the LTDC "ref" clock, but no
driver registers this clock, so the RGB output can't be used.

This series adds a clock driver for this mux. It is based on the RFC
sent by Dario [1] and on the driver delivered in the ST downstream
kernel.

The inputs of the mux can't be described by the "clocks" property of
the SYSCFG node: the SYSCFG is a syscon, whose first clock is taken as
the clock of its registers and enabled around each register access. So
the mux is described by a clock-controller sub-node of the SYSCFG node,
populated by the STM32MP2 SYSCFG driver:
- the mux parents are taken from its "clocks" property, so the inputs
  which don't exist on a SoC (no LVDS/DSI on STM32MP231/233 and
  STM32MP251/253) are simply omitted,
- it uses "#clock-cells = <1>" with a onecell provider, so the other
  clock selections of the SYSCFG can be added later without changing
  the binding.

The SoC devicetrees now use the clock-controller sub-node as the LTDC
"ref" clock instead of the SYSCFG node, whose "#clock-cells" property
is deprecated. Since no driver ever registered a clock on the SYSCFG
node, there is no functional change for existing devicetrees.

Changes compared to the RFC [1]:
- clock-controller sub-node populated by the SYSCFG driver instead of
  an auxiliary device (RFC patch 3/4 dropped)
- parents described by clocks/clock-names instead of global names
- onecell provider and dt-bindings header for the SYSCFG clocks
- SoC devicetrees updated, Engicam board patches dropped

[1] https://lore.kernel.org/all/20261028135915.2665857-1-dario.binacchi@amarulasolutions.com/

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
Changes in v2:
- Deprecate the '#clock-cells' property of the SYSCFG node and remove it
  from the SoC devicetrees, the clock-controller sub-node being the only
  provider of the LTDC pixel clock (Sashiko)
- Explain why the mux needs a sub-node: its inputs can't be described by
  the "clocks" property of the SYSCFG node, which is a syscon (Sashiko)
- Link to v1: https://lore.kernel.org/r/20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com

---
Gabriel Fernandez (5):
      dt-bindings: clock: Add STM32MP25 SYSCFG clock controller
      dt-bindings: arm: stm32: Add clock-controller sub-node to STM32MP2 SYSCFG
      clk: stm32: Add STM32MP25 SYSCFG clock driver
      arm64: dts: st: add LTDC pixel clock controller on stm32mp23
      arm64: dts: st: add LTDC pixel clock controller on stm32mp25

 .../bindings/arm/stm32/st,stm32-syscon.yaml        |  11 +-
 .../bindings/clock/st,stm32mp25-syscfg-clk.yaml    |  61 ++++++++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |   9 +-
 arch/arm64/boot/dts/st/stm32mp235.dtsi             |   8 +-
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   9 +-
 arch/arm64/boot/dts/st/stm32mp255.dtsi             |   8 +-
 drivers/clk/stm32/Kconfig                          |  11 ++
 drivers/clk/stm32/Makefile                         |   1 +
 drivers/clk/stm32/clk-stm32mp25-syscfg.c           | 134 +++++++++++++++++++++
 .../dt-bindings/clock/st,stm32mp25-syscfg-clk.h    |  12 ++
 10 files changed, 259 insertions(+), 5 deletions(-)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261103-ups_mp25_clk_syscfg-6a4224156431

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>

