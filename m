Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795003170;
	b=LmelfmbR0wlzNJ3UmDEKswPGDvE8iK6mJGN48FeDVml0hGG31W+hQA0Lvz6iLqkD5qDH
	 BIOI0Nwaw518yYSCawNODcs7poVL4UD3AhpbalWvE5zUxlWcf1Ow/HwSOhhBDILQL5v70
	 1mZT+oo4OjhjJq6of/zWI62qZCnByOshyuCy0zqlRq9vLO0EPwRsEieNJZtovH2zxztHo
	 3HDbcfZxi1PXQEHt3yBvvSXttmNy3D5vsxQmq+ex1Xgpjlx2jh+hSzFvdKhiUQiMb9DCg
	 x2TxzTbNmTq4oSFeetECnTXQ9dTcwJI/sK8ZEPLCdD0eYgTbbtx/e3Gcw+I7gMChrVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003170;
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
	bh=nD0UkNIriLo4bNI+wkDrqF8V6J7CcTcS7zPS3pbzFZA=;
	b=xwKsIBaxzvV4hFgK2z4OiNZ3GnBVA9zpLM0bMI1KA2zfMhLnklvgrBLBbnJ/ODivf8Rv
	 mNvcZ3YMeOJxcDAPVlFuGzsPc3tgFeB8MUqKLeMQhZgxPJApD0kNIede4GS89yQQbya87
	 VuT7YSdo+0b58+CeSwGS8Yl8NSSkrnkUjuteIcJbdZTieT3qGqkLbeqNR30C+UO6jgbvp
	 h8C2fLA83HTXPFx7sRuE/1aW1cd9RY5zRgIrvVfYAeqaZf67vbDuUCa4svExZ/BCg3Y1l
	 uFmEFWQlSC2Omn7S3x7sFUqVNFBwTd0q+a6NEEupZzOcswIB+L5m8Sy717r66bxrXOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=QdkoMVwN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.53
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013053.outbound.protection.outlook.com [40.107.159.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46047606A31C;
	Wed, 18 Nov 2026 11:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46047606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=QdkoMVwN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNzoqI0ZJuTvqA+biT7YI2ie6QVFj6l7zFvgOqX4XG7/kzDqq0yypO1yRBsZpjStVyBchRUSFjZEJMhz2ijinLHSzcJTXcHA99R4eLxCuMlF8iKAqgQhJrdRr+gIX6q966OnaaWag+srYjfAvoKSdbPGzBymMLvY7JOj06jqR6KYCAKYDoGi0Gav3CUkanko6AMfS2nFOgoxZajINcLN+RiOqS9uUgTKPFjCglav3EwTOmIcmXcbdVgZeqAa1CJFNXMX5N7sNuOjpwkGvkLT6qYBA9Y2CI4E9LAPh5GvlqHtaXoHgkzvZI6LnJwj7HVkQkMT6+dKbJJbPdOk46+2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nD0UkNIriLo4bNI+wkDrqF8V6J7CcTcS7zPS3pbzFZA=;
 b=iYdohwgzxaC1HXnrK/oiYqb8BCytDjdKPTcKDO7zhwe/6Ax1B/pifD05vM0kl8W09dH4GnEudZRMP1SD55L8WdaWBqyeRC3lkyDUwLvpCJ2WntVC+9v6FPfPOAgBbn95zm6d61pU7lDTb4UYB/RuqWNWm8iUpnpz9cz84PNRFI1Iy927MpOMhcP2rKNkWc30Rc9kFvfW5oqynN1kyOs30rSk5UQLg8HVKrXLEXH2fneEj/Er1U7Zdnit4wmSNt/LaISC3KfAQTUYO4mA5eaAdBGT2HLQ5OLqfq2S+faoFOM8otNR8C9luoLqRZNHDrx2B0PWEtg37ye/t/hpWHtJcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nD0UkNIriLo4bNI+wkDrqF8V6J7CcTcS7zPS3pbzFZA=;
 b=QdkoMVwNPZ7eMdf0qFnZF0rEsBLKnKKqf4irH1TKKXP5l0gDnYtFzkUEnt8IkaR7HnC13lsUpQxdJqesJm2rLqk6Oi+8Uksp9ZQEacknapZLcHIdtfvbX7ys4xu+xld+OQZnV6jXjXgM3Cnw+x3ZALzNUtghmWkGuoWbTgTuBcYHAPxcvMDsCrbrU44GCuRWR6vi9Ic2qB4ZGgGXripVGg17TNaDgOcSSHxm1SPM/GXbq0eXOm4VkpGcWNOVhWVv+uCyMBNOuqd4f1ljxEHVlMKeW0HaNoJF218v+zBMWIhtQukmQj2nL3Q2S1yVnVKBW5W3Xie3dN/0Agf+Ayrj9w==
Received: from DUZPR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::11) by PA2PR10MB8650.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:421::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.4; Wed, 18 Nov
 2026 11:59:22 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::87) by DUZPR01CA0007.outlook.office365.com
 (2603:10a6:10:3c3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 11:59:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 11:59:20 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 18 Nov
 2026 13:00:04 +0100
Received: from localhost (10.252.6.76) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 18 Nov
 2026 12:59:19 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH v3 0/6] clk: stm32: Add the STM32MP2 SYSCFG LTDC pixel
 clock mux
Date: Wed, 18 Nov 2026 12:59:05 +0100
Message-ID: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
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
X-B4-Tracking: v=1; b=H4sIAAqT/WoC/43NQQqDMBCF4atI1o0kY4zaVe9RimiMGlqNZGyoi
 HdvlG4KXXT5P5hvVoLaGY3kHK3EaW/Q2DFEcoqI6qux09Q0oQkwkJyzhD4nLIcJ0lI97iUuqNq
 OykoACJ5KkXASLienW/M61OstdG9wtm45nni+rx+Ps5+e55RRKbMcCtVAwapLaxFjnGNlB7KLH
 v5QYFdApGlR17lW2beybdsbX6SVEv4AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795003158; l=4495;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=ShuTmyGd7b3XXR2Lzmgt88GoUSSfHsQcnJeVCRG3xAE=;
 b=pb+D/ySRJvRZRyVOMZoAEVMFtZIU+WB8NfIjp8NH+5b2DfXjr9CGoVtaULCZa6hKbkcQeY3Rx
 xZHrSjAAxt/Bx4ltRK6QYOuVXX08ZSRxZ5kfR68XJ0+88oZN2h1td9j
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0E:EE_|PA2PR10MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: 625d1399-d5e3-435a-64db-08df456b6114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|23010399003|36860700016|921020|261102123227099003|261022075727099003|10067099003|260925022911599003|260925021311599003|11063799006|5023799004|260925021911599003|261026121527099003|261028144727099003|56012099006|261021123027099003|261026140227099003|261022105027099003|261021121427099003|261009223027099003|261009221227099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	WbZwpxKJATgjhl6G9C0PPSbO6cDQzGZwxEbU4Yep3IUlWr3Aq52SDJg7jTqwp2Vs/EVi/Bum7vpBmULvVgeynFbpQrUhig9oh61EYfo4DZsY0BJqvY+LQi79kpM5J/uM1S8l9N9QmQH3OWNqtjoTVsEa2PGVhI36SQHjGuhGJxZCMzG8I1MZbibcr1AF8WvsCEtnP4CT/an/EVrRTNL+FhHQoTiynYfUh8vpORA/0L+MmH2g4XteBvZFkK6EQNG7Y2x2zCZmeG37vk+9iuo3ls25p5HVdrdsci/xDsZzY/MlqmfibdvIw6euKLFFI6oFCZPBRz94/ywoTVePuJu7bbplCZm0Q8kPYMSe9hFBRhDEp/X64232uRBp/c+VjZf0+I4Wf+QFDGhcBdbWCq5p+/RV3vvD0w+HZa0ANYBBBzOKxvrEc/F4peTh5n91TOf2qhb7SUPGDrUD7mdvCr4z/m1X9Y4wiFdZ2YU9AKxm7F1rt9B0w4J1fj/QAzkN4PYwpfHvU10D/E7uO+pfSK16CtvyC2r5l39NgF5Fpgbulx6w40o+UVssaDItjjoQMiIdDmxw8TiktEkuhc6ZHP0rIPeNC3qQCi94tvgxM1uke7HTL/2EznT6uYSuNFlcXOB+hSETMUbi3WIxpx4uTiAx1VsEIk4NAEnD/Cig63o3EAZZUeZevelBOVHavxPgjvsc
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(23010399003)(36860700016)(921020)(261102123227099003)(261022075727099003)(10067099003)(260925022911599003)(260925021311599003)(11063799006)(5023799004)(260925021911599003)(261026121527099003)(261028144727099003)(56012099006)(261021123027099003)(261026140227099003)(261022105027099003)(261021121427099003)(261009223027099003)(261009221227099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RKbQbXlQLbk+XZFD+UBBEjMnTaqzjaE2udPHvmAvAN2k3RbFt1ZB1ZgKp3i0EbSskXz6wIzPWeM3MnNuhj2MbvK761syq6QHR9Ef9/RRFCtbW5Oz6XiEY0OGLey2JbDOc/0FgaMJBX0QjEKJSHYXzswhz2yCbdEox0/Pur2XRU+VFebcnJVcD+rDzvXxXvUFJSRVXujHd/VRMMAeEky5uL4an5C8pz1kAN6yNoqE/etmjyewSXmU4ZlpoHGGltiEzSZu2rc30c1iSoMsmBxhjEo6EwkVP53gckiVtQ+sdt7rGdfajPiQqD3RuCBvNl14rvd2ImRh17EoNoptIwR2Xf9tlD+BUWFWtMZ1GUVH5AM2eF7djmDKRx9KDuY5wYIbLknbWxjh8eJnhf892sNIaNvS+UlA0g3pgjeEu3BeDkc6wwEP7lKTRpmBgf3CU8ac
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:59:20.1303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 625d1399-d5e3-435a-64db-08df456b6114
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8650

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
the inputs of the mux are described by its "clocks" property, so the
ones which don't exist on a SoC (no LVDS/DSI on STM32MP231/233 and
STM32MP251/253) are simply omitted. As the SYSCFG node is bound to the
STM32MP2 SYSCFG driver, the clock driver is an auxiliary driver, whose
device is created by the SYSCFG driver. The LTDC "ref" clock is left
unchanged.

As the SYSCFG node is a syscon, the syscon core would take the first
clock of the node, i.e. the LTDC kernel clock, as the clock of the SYSCFG
registers. The SYSCFG driver therefore creates the SYSCFG regmap itself
and registers it with the syscon core, without any clock.

Changes compared to the RFC [1]:
- parents described by clocks/clock-names instead of global names
- auxiliary device created on STM32MP23x too
- SoC devicetrees updated, Engicam board patches dropped

[1] https://lore.kernel.org/all/20261028135915.2665857-1-dario.binacchi@amarulasolutions.com/

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
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

Gabriel Fernandez (5):
      dt-bindings: arm: stm32: Add clock inputs to STM32MP2 SYSCFG
      soc: st: stm32mp2-syscfg: register the syscon regmap
      clk: stm32: Add STM32MP25 SYSCFG clock driver
      arm64: dts: st: add LTDC pixel clock mux inputs on stm32mp23
      arm64: dts: st: add LTDC pixel clock mux inputs on stm32mp25

 .../bindings/arm/stm32/st,stm32-syscon.yaml        |  28 ++++-
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |   2 +
 arch/arm64/boot/dts/st/stm32mp235.dtsi             |   5 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   2 +
 arch/arm64/boot/dts/st/stm32mp255.dtsi             |   7 +-
 drivers/clk/stm32/Kconfig                          |  13 +++
 drivers/clk/stm32/Makefile                         |   1 +
 drivers/clk/stm32/clk-stm32mp25-syscfg.c           | 125 +++++++++++++++++++++
 drivers/soc/st/Kconfig                             |   5 +-
 drivers/soc/st/stm32mp2-syscfg.c                   |  57 +++++++++-
 10 files changed, 240 insertions(+), 5 deletions(-)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261103-ups_mp25_clk_syscfg-6a4224156431

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>

