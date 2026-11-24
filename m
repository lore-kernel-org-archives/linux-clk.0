Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795527707;
	b=t864P9izuP1db+EX9vgmwsUTd3ihCmN5e++vQnubyVyaHteI16fIPe31GqtMLfuGnnmz
	 CMRZJZNfJE7mLSsMD7drG+PBbA9WxR/7Kn9EXI1nkGwL0I2h88LKkgyOsPY7YmscG/4bh
	 ttVVqhkDI+qVHZComao9YX59wUiYrg7dh0Y0eZfhyWt2qwpf96BT8jXBCux6snmdK1nxG
	 eJDYkI7ldAmTDO91zzBGXz8i/AovoexpjGW6qdpN0TcORF97UyeTKXwMtCz/F+axIFPyL
	 iZtwBvPGi9G4WT8rqjeasjGS3EcuKHZiztCngLp+bDc7FwmCJtfFJkGVf0fZpizEWrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527707;
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
	bh=P/nXM10j6ULWI7FbigADtXC4dipwTIL5bgjP6+T+OZ8=;
	b=vTWhb+pZfjHrgk2TAMx99JkfRFlKOeDOhMfoWtv9vkhiVTewqpFDhFS5NGMJcDp8XzmB
	 26Kp1s/Z9Oo72SM5KJ4I7WSJm1UACHJy+rOuX8bgw6jflIo4nA8MrTdqenjvxRS8Y/81z
	 6B/TRfeGrkSAfrcrHY/GdZBsQta9iCQyuoBmEFO2FeoFTCNQ24tZqvmEFJ3F0wPTtSPJA
	 37O0Bs/tQYlgOzBXesniJ70tMBBuXnAz/ZK2NstRoF7K4H66/a5m0XEH17+hOWkGEXMhz
	 rsK/kADkL1pnv2QSF84a/fYKqLJ4/OeDr8PulE8Tz0J65UH+OtLhURRrz4O9ZEC/7Mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=XXaW0nCN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.49
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013049.outbound.protection.outlook.com [40.107.159.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A977A606A69D;
	Tue, 24 Nov 2026 13:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A977A606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=XXaW0nCN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWx4xwj8kfK4tw1HfKVgtKeiyPrIx7DCejRfKY6K+qDpDAnM0V5RGwk/d5zUynlnSW/9vXmKxIGxoDLUnVPSC1Ke2zULlOaDpkbAGI/Y1XSQ96CaNUC4HZCL/aQg/AE/Q+lsfYNGVvh3M9Ppu4aYo5nER3ey1qbKrCqKsEuaORIgC6OLvLNl8iTAZYuWoaQm1FltpzQjNVnobCiIEIsazegxe2Gro4zKkLYw9lN7eWRtJybbTtXMa9HdCZGj6oH060SPZtRx/iqS064jlU3iMKVwFFzwssHc/W5HICpUj8VrngQWP9zC2QapSWFM/M81cxhZch8B1PiqL5QkNRwdRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/nXM10j6ULWI7FbigADtXC4dipwTIL5bgjP6+T+OZ8=;
 b=hAHvH5aFUQNIQCK2+D9qj7uWuoO9uu1g+8nR+9Jtt7Bu2x22Piik2jH8kN8sW+5Mfg2jVVJOqifuo1WQcH0ezqA8Dq9LKRqoqj/1GlXMdcRuOtDulAMUSPoXz52iiD3gUc0AgzkDU4rVJyoYKxMzfACTDujaiTJtIflhxzB03pCCHMaIJSovLcS2r70OBPH2w9F9/Ni/4anz8cVQzUSbiVV3zUa9gjwRH48RgOjzqgjHWxnKnqORh+q0zIyvxvP7kwjObatdmo9bhICmY8Ro7I4pFrdZM7Qs2fRByoHSjZDQ1CRRAc+/9v87alxFczWHFZoS/BA22S8At+HPUI9I3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/nXM10j6ULWI7FbigADtXC4dipwTIL5bgjP6+T+OZ8=;
 b=XXaW0nCNbsqDhOwMBZzm6EbWPl3HSaVyxMth3Gkozi/h3vhTGibsE+DWTPRFoS9ZBN1lf6B9UK6x4PTAaW9UO1N7/RUzqvfoux1NR3vKv9iL2EI0T9OK0xBUAEKRW1hwk7H7ihDQXHDk9M6e/i2aOpdCKAc4BkST2YBIbgVQCzQ5W5ig0GQktIv8s4CqQivecF8/i4sfwQXsk3wqcmYNNx9GLmJmjQlVAsMVtdwWcC2MwXVWZ1Oszqp4PO0OnZVYQUBZj9hJzgo4n/d0LDb7s30SA6o6O+BrtvMgJxeLa3BEn3AL25DnauGUGmssyWINYcyifHMW17Qvdgd1esoGPQ==
Received: from AM9P195CA0017.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::22)
 by DB9PR10MB6315.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:39f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 13:41:41 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:20b:21f:cafe::16) by AM9P195CA0017.outlook.office365.com
 (2603:10a6:20b:21f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 13:41:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 13:41:41 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 14:42:45 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 14:41:40 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 24 Nov 2026 14:41:11 +0100
Subject: [PATCH v4 5/5] arm64: dts: st: add LTDC pixel clock mux inputs on
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
Message-ID: <20261124-ups_mp25_clk_syscfg-v4-5-894d95dffec4@foss.st.com>
References: <20261124-ups_mp25_clk_syscfg-v4-0-894d95dffec4@foss.st.com>
In-Reply-To: <20261124-ups_mp25_clk_syscfg-v4-0-894d95dffec4@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527696; l=1087;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=4dXblQTzCZM3TRWN7qnmeHjXClFZIU+VAyWz2uAcbG0=;
 b=NcODy4kE7zj4Y3dJuNwQn3N5adofEzainjM/fYJoIqph/ovsGdbS3NG2ihqu6L/la2dj7WbHK
 urzKWzBLeFWBZMmls1xivqZ/QkjIBwWxpDGGNdiDP19QycqBP6iVjBw
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F7:EE_|DB9PR10MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: efa6e481-ebdd-4686-778c-08df4a30abde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|23010399003|1800799024|82310400026|10067099003|56012099006|11063799006|261021123027099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BJKUNTgD/fWmUs+8N0BDOKp0K5L+Kxbqwi/ToQXxHSxsptXHYq8AGYCAVtLmWaXIUhJ8iApFKWseJVIvB1Ohp6XsEt3luVpP1f1hwJmr0rW7fNHNBrdvpltLI5P1BLYQ/NRBSj2fpvswz42UT59ptsGVgjCXtFuN+5UzmBJ/yroUWjWNSaO+SbZzG6lQDIA096ogtMlp5LbMKIZTIz+ZxVdMHygCakVScLn+WOVFlPQ1xdbxEUTNKwInrnz/p40WtDIkXzdw6xwE6bukTDM6DnN03AJltXvf/wGkDQ7WOzJUjgI3WjtpzekkBTcyqfotGdNH9SeeOrqJqcfvXpbRG6ZczgO96FWBtdzaFE32jOk4FdFHiHzKypPPepGLl7LoOLXUG2rpuhWRqjyZqM9qU/pMBL/sk+gT3F2v9WwSEA3wA6E+g3FMQmZzFfbTTWoWfDK1CL+hn5ee0+RfY6G3TkHc2B4VeoXtjLxKkget7Lb4MFFED1FIziFgnJTQFjAjzJNtXbcnf3FzqmbsSEQ0qjMMjy4/gkvS2c6xGQBzGF9YrOrR5dWFPRBtII1fdqot3p0JhKAvzbC6jqcXVKmKmSid8eEfuc6X+RfcpEPaMhO0ihqH4YHuczp3cW2IEP9K4hvMcGR/zTNcwhPruXrccSXHD8088BF+kX63NGMzMGW88oNeJxZ63QGlM2HgyjNMUWJQFJFCOO8jV9OWhoxuRQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(23010399003)(1800799024)(82310400026)(10067099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RfbmRp4gmfoEKxVI486vBgfHccs01FyG6MYFqhmAZvHevEX/kDeRLubZfCdkI4+EnEanm6LErlFvz10PSeUFmiDUiPv6GFzCkydA5dgaSOkfd3Lq6r5DQ4VPhylYoQpdhbhs6jLnh5HGuGof73U7XxxSSjMNUlKaYcj/oZ7LS5UM0Mntt4o651rsfveRgJZ1bxevuiIjhV8vYOI3iuz6TSiEc5bnLhrl+jUjR1jJlICxo7d70uq5rM+nd860uYIjvQXsLAz0A/s3Dwg8SWYyGY6jXnLRStozXw5QbGhoVChH2Ya+sHp6/HSV8+RJFkQG7nJEph6dTST2STpB+xrCAc3w21NWsw3610gFFyoRiGT9Cf3b+n96ZrAypaVdFOR2Q4/s+eeVcj99Gx3QJ+GxM3372Sdm2JiL3h0QQINupaaceVYYxrhr17426AjApA6y
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:41:41.1106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efa6e481-ebdd-4686-778c-08df4a30abde
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6315

Describe the inputs of the LTDC pixel clock mux in the SYSCFG node of
STM32MP255, which is the provider of the LTDC "ref" clock, and add its
SoC specific compatible.

The LTDC of STM32MP251 and STM32MP253 doesn't use this clock, it takes
the LTDC kernel clock directly, so their SYSCFG node is left unchanged.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp255.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
index 7a598f53a2a0..4d4d100d3f89 100644
--- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
@@ -40,4 +40,10 @@ venc: venc@480e0000 {
 		clocks = <&rcc CK_BUS_VENC>;
 		access-controllers = <&rifsc 90>;
 	};
-};
\ No newline at end of file
+};
+
+&syscfg {
+	compatible = "st,stm32mp255-syscfg", "st,stm32mp25-syscfg", "syscon";
+	clocks = <&rcc CK_KER_LTDC>, <&lvds>, <&clk_dsi_txbyte>;
+	clock-names = "ltdc", "lvds", "dsi";
+};

-- 
2.43.0

