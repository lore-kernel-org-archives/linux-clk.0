Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795082300;
	b=z584aJSZ+xoH3CV7ParqZHb1oiD82h4P8CZhK38LDumTiTMdZgg5aGfcnixAHO+MqCxs
	 T9P5L0R7MqjPnv1SLYr3LZy9OzxT0S8Oz/KFZ18YhrnuDVwCF+hU6f0zPIbIhH63JaN3Z
	 SCedHwIx6cYM9SFpJuGRC7k2io95eBmMSnyQb7goqGG3QHiJ56jvdip3Nv/MbvSe7k2DJ
	 Wj47Ly/zCuIhmJgu1PyzDAhDySp9KZAEL2EhUiWVvZgWk63AHEyJ+zKU8O/GyMJ3uV2pX
	 gRAJ4vgXG4ksP6pK7KnTnFWuZJU2BNo5NcSpEHG7U9zIdO08C7U8oBflKTiZkbgbrZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082300;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=b2QezWeiVFYsJboBAIsoq7MakzArc8NMkVawPLKeFdE=;
	b=AUiEegoLysLDH2koaKUVIGjx+sdYFV38LIS52FJXJenW/tkNtxX8jmAJbOh9svov+hL4
	 pzr9xXjL75e6u7kZ5V5gNEg8JfSUydL8XW/TA2vI6BDp+dHNUO+fiZ9x8IWD0pKXP1JiG
	 jU0IUoabSiSMPYibT4/mtFGETsaW+7HNWGR0YwxS+Zz2m9wMsq79Z/H65CQl31Ji1nev1
	 vAXJ3ebP7BOiIWwdt6Akl+emjpUvvSwrtEROFuxmWEtw3G5+b6fJR4XKTS8RGYTGDiPCz
	 2CMPohnJHTBBvValBYChE0RDirUEMx5MygrtFImXAxS06dR4K9cW4y8Grwio0Xj9Q9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Fv08jMWl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.45
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010045.outbound.protection.outlook.com [52.101.84.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D57606A336;
	Thu, 19 Nov 2026 09:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D57606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Fv08jMWl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeEe16Gog6CQHsiwpfrZkJ5SqeCuGkmPWV7r78YUu/rcCFZ45or9+fP1730kz4YxDGrchGO8oCq9c8c65ESZDckOuKfDNUUPSog1RgRrNB30B5UE87tbl/IB5g9PBBgUAZNBKYPTsMB9yN8clgtKzpLWxRG+yBDDYQbOsG2fMNi57asKQlNz67PUovf6+BvwYIoEXuo/EeMazTfsBiKL7irH7x6jDsdBVcsVtkLsiY5qenHETawEqjav0LWSj/C2a44uHZvAdw9XIrqN413q6KQ8VEgpvrISQvjC9Hm58rZftBOp4ebGuniwCp+Y6j/E1qfED/7hr4GqJvRCe+Mhvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2QezWeiVFYsJboBAIsoq7MakzArc8NMkVawPLKeFdE=;
 b=bzMQrujdLEQCQF9nFbtHK927bPSXqYUpxgqIg9VZNbBs3KgaSnkjtOffg/ucP8KlAFU0kBQ1IV/QEH0L9HmPo0FNzvWRkyxdpPOeqfC4/m272e9S1tOHTocN32qyYGCd9+Hp06XOJDy6BSKtFk5p/pxetwDohrMICvEh0FCfzU4XfYAhI0vB8BXMtHlGZIX2rfQt/6H+HOGPPBbQOjRMsSOM6iL9uaVMxPkC+I2zAW2joP/oBXy1OQh7F/gwGo5J/km9hxQvtve4UzKXDcXXQsGRCPjPr8GlsqrOMvMUwdaDHRth8+/XyVdi82CTcLfFjC3GxmI2p1Qxt+RsjSJHwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2QezWeiVFYsJboBAIsoq7MakzArc8NMkVawPLKeFdE=;
 b=Fv08jMWlblzr+nap+peUaiCtNwovhY6idLK9cn7n173OymnA2kXTk59ybG615k2te959ALNlckqtu0ddC34pHEwBWuylkMey31zmgfxGXC6yVocwAXmNGZUPIhHdhw2i9yl5ecc5bfyI//+f17ar4OKVgCzxocuvPFSMowjBrU3BfOyS2pyOdesFbaMFdrk0091CtJteTkpNP/1aYkCEPwLjX/8jIdQKoit1XaAStQOha3kuH1PcTu9LpoNbOzqfXzVvhzHGRqfTlHU1NlhW/69y73VCsrxeTcL8JHv14QIhFCNPB4f4ajNJGsRqYVzi1+zTGIVFWY70X8GlHCOJWw==
Received: from DUZPR01CA0182.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::16) by BR0PR10MB218156.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:2c8:62::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Thu, 19 Nov
 2026 09:58:12 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::7b) by DUZPR01CA0182.outlook.office365.com
 (2603:10a6:10:4b3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.10 via Frontend Transport; Thu,
 19 Nov 2026 09:58:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 09:58:11 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 19 Nov
 2026 10:58:55 +0100
Received: from [10.48.87.14] (10.48.87.14) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 19 Nov
 2026 10:58:09 +0100
Message-ID: <dd470f94-3082-4930-9d7e-25402e9c4456@foss.st.com>
Date: Thu, 19 Nov 2026 10:58:09 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] clk: stm32: Add the STM32MP2 SYSCFG LTDC pixel
 clock mux
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
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F6:EE_|BR0PR10MB218156:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ace7496-cce4-4569-4fff-08df46239f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|1800799024|82310400026|921020|260925021311599003|260925021911599003|261009221227099003|261022075727099003|260925022911599003|261022105027099003|5023799004|56012099006|11063799006|261026121527099003|261102123227099003|261021121427099003|10067099003|261009223027099003|261021123027099003|261026140227099003|261028144727099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Y7eX6SVE0Huqr0K5YDUXZoIYI2KNHCzHkTo4tYNylDrR+6HaGpWY3grAnIhMBwDCvXURM+LXWuUoSUnl9P3GAjys8mzl8dPTZM8qgvcU8jaSV7xqqP2iW6sAUmN0zMSTNs3PlcC9NISpMv/kXQWVED7xJ3bfGLIKr+igu5ZmXDXFpcgeJgOyzoeBdhD76C0uhCj5i3JOidMfb4WgG1aEc+ZeX7wGjmJj7eyWFpVvluyegUWh20uOP625tdGvqhTZpcNwSrkrva5abX+9b5bMnNxFhhRYkhRff+XDE9l3u6QytCMFjGk5Las95zxRtUXoSW8I9IEYbDm8ywh3+O5Gf8JS19J7VGZPV+SWiLgiYyCwKzgbzb5oh6smCFrwXjf+EOrqx6zUdGJnfQf9qEXYmZj0JM1Rd6+DMUASN1JOnpxk1PZ1ZNUdBGR1FVQiIHUK7Nc/ewkfvKIIxm9/6hqURHp1Zte6TUHDI/Mz5CMOR/he6n01WpxshBZKmZ2qZHmRHqxVnlcCapqirkrxuzfUoLiu0uisz6yj0v2jAmARkyVMf8v5CNvWBoLqx4YPt90/iXLMbGnpvfogkf7sqimX/TCJaGmjicAyFAq5bv7SMdXZwCHFqRZtfOk8iZsm8ULoPW1mtA0vD91Z6Dy1sAVanYZemjmaR4TaU992q9RwhBSaNLxlqQBql71itQujzRwteLKZshP/2PLSZULcjf1prQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(921020)(260925021311599003)(260925021911599003)(261009221227099003)(261022075727099003)(260925022911599003)(261022105027099003)(5023799004)(56012099006)(11063799006)(261026121527099003)(261102123227099003)(261021121427099003)(10067099003)(261009223027099003)(261021123027099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BgH9RL/pj/SGKo0mQMEIrowpJHK4BAA87mSELfe9WORAnh/xtO1dRbo8BUiD0cRrF25lq/eKVlG+snE6uMoiegvqSVayQbOuECuxVDZgbEy/rOfrQMD36TDGKO22J05J1/BaDjS3IIBISQv4KIjST9Qsj/fyrx7WHLkQARBOWu/bE9/yBCcA+Ek8xt833D/cS57CDigpxA+XJ8rcUlxu4rxg5025OhYeEQ3Fp71/hgWGa4EaEJ1Qkd5rEJqr6i96VkaOuqGKtLiI15d7t1s+BYrb5MSNusKn6D7q+cbHf9KYbsu7fmmEFjZnqVOciGHgY7HmUQClYOIsPooshJH320YMaLJkwm6NKYpVCMQcNv1Q5mI11HB5gWF74UkupeQo9Ggyi1DhocYEod2J1+NRBDuxUg8NuJQNfcuVbBErGkH+X52CZC/2BRL4aco2sFfj
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:58:11.8643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ace7496-cce4-4569-4fff-08df46239f44
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR10MB218156

Sorry, I made a mistake with |'b4 send'| and sent v3 too early. I’ll fix 
the issues flagged by sashiko-bot and send out v4.

Best Regards.

Gabriel






On 11/18/26 12:59, Gabriel Fernandez wrote:
> On STM32MP23x and STM32MP25x, the LTDC pixel clock is selected in the
> SYSCFG DISPLAYCLKCR register among the LTDC kernel clock (RGB output),
> the LVDS PHY pixel clock (reset value) and the DSI PHY byte lane clock.
> The SYSCFG node is already described as the provider of this clock, used
> as the LTDC "ref" clock, but no driver registers it, so the RGB output
> can't be used.
>
> This series adds a clock driver for this mux. It is based on the RFC
> sent by Dario [1] and on the driver delivered in the ST downstream
> kernel.
>
> The SYSCFG node remains the clock provider ('#clock-cells = <0>'), and
> the inputs of the mux are described by its "clocks" property, so the
> ones which don't exist on a SoC (no LVDS/DSI on STM32MP231/233 and
> STM32MP251/253) are simply omitted. As the SYSCFG node is bound to the
> STM32MP2 SYSCFG driver, the clock driver is an auxiliary driver, whose
> device is created by the SYSCFG driver. The LTDC "ref" clock is left
> unchanged.
>
> As the SYSCFG node is a syscon, the syscon core would take the first
> clock of the node, i.e. the LTDC kernel clock, as the clock of the SYSCFG
> registers. The SYSCFG driver therefore creates the SYSCFG regmap itself
> and registers it with the syscon core, without any clock.
>
> Changes compared to the RFC [1]:
> - parents described by clocks/clock-names instead of global names
> - auxiliary device created on STM32MP23x too
> - SoC devicetrees updated, Engicam board patches dropped
>
> [1] https://lore.kernel.org/all/20261028135915.2665857-1-dario.binacchi@amarulasolutions.com/
>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
> Changes in v3:
> - Drop the clock-controller sub-node, its binding and the dt-bindings
>    header: describe the mux inputs in the SYSCFG node, which remains the
>    clock provider with '#clock-cells = <0>' (Krzysztof, Conor)
> - Keep '#clock-cells' in the SoC devicetrees and the SYSCFG node as LTDC
>    "ref" clock, not to break the existing users (Krzysztof)
> - Make the clock driver an auxiliary driver, whose device is created by
>    the STM32MP2 SYSCFG driver (RFC patch 3/4 from Dario)
> - New patch: create the SYSCFG regmap in the STM32MP2 SYSCFG driver, so
>    that the syscon core doesn't attach the LTDC kernel clock to it
> - clk driver: depend on SOC_STM32MP2 || COMPILE_TEST, check the
>    regmap_read() return value, drop the redundant CLK_SET_RATE_NO_REPARENT
>    flag, fix the copyright year and the order of the local variables
>    (Brian). The of_get_parent() change doesn't apply anymore, the driver
>    using the SYSCFG node directly
> - clk driver: drop <linux/mod_devicetable.h> (Uwe)
> - Link to v2: https://lore.kernel.org/r/20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com
>
> Changes in v2:
> - Deprecate the '#clock-cells' property of the SYSCFG node and remove it
>    from the SoC devicetrees, the clock-controller sub-node being the only
>    provider of the LTDC pixel clock (Sashiko)
> - Explain why the mux needs a sub-node: its inputs can't be described by
>    the "clocks" property of the SYSCFG node, which is a syscon (Sashiko)
> - Link to v1: https://lore.kernel.org/r/20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com
>
> ---
> Dario Binacchi (1):
>        soc: st: stm32mp2-syscfg: register the clock device
>
> Gabriel Fernandez (5):
>        dt-bindings: arm: stm32: Add clock inputs to STM32MP2 SYSCFG
>        soc: st: stm32mp2-syscfg: register the syscon regmap
>        clk: stm32: Add STM32MP25 SYSCFG clock driver
>        arm64: dts: st: add LTDC pixel clock mux inputs on stm32mp23
>        arm64: dts: st: add LTDC pixel clock mux inputs on stm32mp25
>
>   .../bindings/arm/stm32/st,stm32-syscon.yaml        |  28 ++++-
>   arch/arm64/boot/dts/st/stm32mp231.dtsi             |   2 +
>   arch/arm64/boot/dts/st/stm32mp235.dtsi             |   5 +
>   arch/arm64/boot/dts/st/stm32mp251.dtsi             |   2 +
>   arch/arm64/boot/dts/st/stm32mp255.dtsi             |   7 +-
>   drivers/clk/stm32/Kconfig                          |  13 +++
>   drivers/clk/stm32/Makefile                         |   1 +
>   drivers/clk/stm32/clk-stm32mp25-syscfg.c           | 125 +++++++++++++++++++++
>   drivers/soc/st/Kconfig                             |   5 +-
>   drivers/soc/st/stm32mp2-syscfg.c                   |  57 +++++++++-
>   10 files changed, 240 insertions(+), 5 deletions(-)
> ---
> base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
> change-id: 20261103-ups_mp25_clk_syscfg-6a4224156431
>
> Best regards,
