Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795003170;
	b=LKO91hdoaeozUkuweB1hs1gqnIzqq6w44TCcM2amRnlmIlPqThPSvvPwxXXmaiM3f2Ko
	 Qdw5X2B3m5ODiOgxqUUkmCVEos43GKATeljFn/6twG2tKN4c/Pln8iyM4Sr6ky25RVrvD
	 L7WgeS4yy4pXRqm6SngaxHdVYoEEeqeFxtYnQRPia4eoQX2mWCUn/O34UYk49NKiLdMdy
	 LXkkpBNxVXZlwgQwfdiBndtiPPD3QVCwwyF26KKrfpeb4Mx2arP8KhZfD8fYiXEweGS2Y
	 cjPSw4/TyH0QQIPm2hpl0xr6Cjw2WiqYeYM8yHzrd4zENkiqoqlBUUy5UDjoOiiacqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003170;
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
	bh=RDUvaSE4Tz7zycrw73pw5RDBmmiHdRByI1v42Li/WDM=;
	b=LBTFWEHoC6gfwTqnrAE+343PwpszZYexCuxL2P2OLi36MpZMDuZr/Ab2YTECB3qw0NcH
	 s/bSyLU+cis24PriQqj/80ZZf9CGq54M4V0hafInXvq11W3zbWfmI7DP5e5fixnVXHdWV
	 RuUTEpT31GOsbP5b0osYiIY6ODEf1FR+3h1fuamRcSUAbznZGCXXcVrmSse4izbDnKcyo
	 xLG0IAsj5647zosB8pykjUVBj33TQqfNJlF1GGXFHz1DDO70woAGWK2gltHB2+jgkfeyI
	 Tkkw+AlTjytCMNBnduEm7V+E3xRWnKzhEXafAG2nDF7ukTad2jmtUU6ztO7ya+vUKNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b="Xq0Bw/eb";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.2
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C016B606A325;
	Wed, 18 Nov 2026 11:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C016B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Xq0Bw/eb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4eXOnHWCRDgMJDxlLa2+cXxXd4teJMpb6+aAv4BVmMtJYc7M3pK13IsUDFKehsYaXBaeZv17lbolKaBDQnKLcgkjRUScQ7vXo5YNLswVyuH51Xa+KphsfOeiY2U28wrfSAEc6792LfKxvCvdGAvNt4aRIwtc9iXMPIsv+9Y5auHh39mKAqrSGPolArKWgg9GqnvdL7JQGoXGKQYlAwp9emaYWOAnkA/N3W/6wttKJQp8eD9kQeS9Wv/pmNbj6VOBvUH2jsHWuQC3O5SNNR2wVkWGy+a6XJPVepEI9bBpVZQQVbkUi/vkg2FV9+X56NS+1b83RWL0MeetOyjfC4P6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDUvaSE4Tz7zycrw73pw5RDBmmiHdRByI1v42Li/WDM=;
 b=zR9KgJfqcZlpdbH6hfjKw1O4rBEP/HVwIECoAdJHGfX7dlzlNO7clDv9+4hdM7J/Yt1ZM83d8gw6i3Rdvs6A7BHpBalA4aRvzQ4vEF563YCKjzGN1aTguMZUnYMzt8Adig4ggPwIa/xF8ndU01tXgWkueK9gC5TxmOG6Z11p4VNSvGy6GPBLvZSvS/2KBfFYEgATxrwvJvNejVqe4ItznZdWD7egAyxmFpVUq3Qmx23XFzqml1PcZDcTHIySH8NlJ05d84MD/vd+q4qYX+DNmJMg8pyoqk0YicFqrqyCwRH/0D7p2ladfjuvOkkLeRZODbycfv0AfJpDoFNC0zW/3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDUvaSE4Tz7zycrw73pw5RDBmmiHdRByI1v42Li/WDM=;
 b=Xq0Bw/ebTr5ZweXvf1a78Kf4UhL2gtB4rxNRTXmse4YWZ0C6SNzcXnH68LlJRk8QA/ckOhUup19g4USlYCTOtAYHB+y9SZJvWY6XziwBI1Yw9oI9kMvNEOU+Ayx085k68OamRXdmcm4ILYRvjABoQplC08/ehqWZfa38a9um90JNQ4Qxy3qxBKPSq7R7M+9kFPOQHPNNoEZ0IJnZtJfnPWUzxFXWOHyHk4t47ts0HpQ9pIkkM6YPOEPhzS2bZ6pJvJF3h6HW8fRHvSP1CqqjV7FKpD/JkgSP24z/l5bHsoq2FLh/afLoC6Vf0XrEr9T4wrmsB5ZatugyCJaJbOT5jQ==
Received: from DU7P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::34)
 by PAVPR10MB7012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:303::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 11:59:25 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::89) by DU7P194CA0019.outlook.office365.com
 (2603:10a6:10:553::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 11:59:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 11:59:24 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 18 Nov
 2026 13:00:06 +0100
Received: from localhost (10.252.6.76) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 18 Nov
 2026 12:59:21 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Wed, 18 Nov 2026 12:59:07 +0100
Subject: [PATCH v3 2/6] soc: st: stm32mp2-syscfg: register the syscon
 regmap
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
Message-ID: <20261118-ups_mp25_clk_syscfg-v3-2-935de791a4ce@foss.st.com>
References: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
In-Reply-To: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795003158; l=4273;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=BWavtDUCvnc3JNkS8Cdk1SPUy/Im+iOFy7cz+ZPIWjs=;
 b=mb+1b5OZ8VOpmfMP39qCN3X1ITs8+oHTlep1UHye06iiCYcIK8BQAzrXrtyAT4TbaI3tSu4JX
 D/gHsGng7P5Bed+nY37IuHQPztgqJWvOmZofMJGnrAxwtjU2sLNMOr+
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0E:EE_|PAVPR10MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: ce4bff73-a31d-48f4-7486-08df456b63e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|22082099003|18002099003|921020|11063799006|56012099006|10067099003|261026140227099003|261022105027099003|261026121527099003|261022075727099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	kb9vE1GHs/dN3Fd9oYQBDNAZq689mPlR5ouVCNfRuTVRLXfCy0ucSsiNSFzDqbZM9vK5vedqkJEIiae2NdzAzY+PKm4k32vm5Pel0pYabbUPg5OHxEOkgqlvKQfoIKk1PegC2W9mG4/g/EdkYF8xZG7j+iPpsjQQ6Z6NRR/aLrWCg9ofD0nhfRDTs3T3dZ/c8geMQAC4iRSAQhIpOimGQuAgMUIFuCWoOcgAEZ/rtbMnVT3SXcUMJAwvkgeLhL6lSjBX1xPdlnemWFBF1GcBAMG1ifDhJfRs+G/l19VZTJlrCPZs4gcA7zhqwb7XMad/pzjOr83QFs6K11jM1LxOJLByDPLKSMjYpR6v5HbNHQb5sqp186pUriYBbgqwh5bNR4gX3Avt3LyKNCvKnzdSk/ZoWfk9uZ8YQ5fh5bdU0/mnEeYtrE0UvwXTqPTXMbwDPx253IIGd3Cul3xg7Ee1KidMxmVS42wm2uAbhpt40TzoV8toGZUCqcoCZ3ShGq9A+nytdLE8ZqmMm0fDfQSq5dQPMWIqkRwPbhAFAq8Ly9Zq8CwkQB6aFM18Ior6q2e75OdG7Wrq/8PB2wzvZhKHdElpsNNacO6DpIbmweYnKVAsGIG/JtdXsNcjwY9dDnDcPc5RAtr8KsgMPFyyU6MdgeLBcXC8IUySYpLc6YH5StZUDpVp99WzfZJY5mKEFbs2SIAJNCQNqlKVglk74NYouHwSi0HS9Q28IBn+N6XxUodzzpp44qVIYO1j/xG2ue7V
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(921020)(11063799006)(56012099006)(10067099003)(261026140227099003)(261022105027099003)(261026121527099003)(261022075727099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zKEdLp6OkrtLxV4JpYJvoCDvz9rGGiHgZTsmyY+KyyOFm18vwq0QQrRXK8+M/M2Safp3W/C0thZlzqhk6wu9BZH/CgtgJWoiL0vVNy1vHWFdNimGetf+ZGQAW2i70jsItAQkUBhX6MGbclHEompfc2HBD7gggqzTq1XcEzEKFvGOQDPh0dd1Acba1bim+feoGrtejnVReSs1sYhj2liJebM3ItLcc2B6D6ZHtcEeAF9EeANFTWYGipIvBMFuxrrEkrpKjDG8rlRDH70XE1SKQ9SWxgqR37WEJogXAluMbsLk7wryAeeZ1K+XxoJmzzP5lcTRklXXbuQ62tM3FFOpiUb9mCzlDKErSZdOLDk+UJBix7i9Ja8JWTan3oOsWWcA1dO4c0nxQUsqHZWqgVcp6fS4LM7F+1NM8C/DoqCuEF2mYACSbsWgqYBqZo7pdNel
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:59:24.8286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4bff73-a31d-48f4-7486-08df456b63e9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7012

The "clocks" property of the SYSCFG node lists the parents of the LTDC
pixel clock mux. When the syscon core creates the regmap of the node, it
attaches the first one, the LTDC kernel clock, which then stays prepared
and gets enabled and disabled around each SYSCFG register access,
although the SYSCFG registers do not need any clock.

Create the MMIO regmap in the driver and register it with the syscon
core before populating the subnodes, so that syscon_node_to_regmap()
returns it instead of creating one with the clock attached. If a
consumer already created the regmap, keep it and warn since its clock
stays attached.

As the syscon core does, map the registers without requesting the
region: the SDMMC delay blocks lie in the SYSCFG range and are requested
by the SDMMC driver.

The regmap cannot be unregistered from the syscon core, so make the
driver built-in and suppress its bind attributes.

Select MFD_SYSCON, without which of_syscon_register_regmap() returns
-EOPNOTSUPP, and REGMAP_MMIO.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/soc/st/Kconfig           |  4 +++-
 drivers/soc/st/stm32mp2-syscfg.c | 48 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/st/Kconfig b/drivers/soc/st/Kconfig
index 2a9d6a77be45..db3ce8e8111f 100644
--- a/drivers/soc/st/Kconfig
+++ b/drivers/soc/st/Kconfig
@@ -2,9 +2,11 @@
 menu "ST SoC drivers"
 
 config SOC_STM32MP2
-	tristate "STM32MP2 SoC family support"
+	bool "STM32MP2 SoC family support"
 	depends on ARCH_STM32 || COMPILE_TEST
 	default ARCH_STM32 && ARM64
+	select MFD_SYSCON
+	select REGMAP_MMIO
 	select SOC_BUS
 	help
 	  If you say yes here, you get support for the ST STM32MP2 family
diff --git a/drivers/soc/st/stm32mp2-syscfg.c b/drivers/soc/st/stm32mp2-syscfg.c
index 770321a4a6f7..0d45fdef46b7 100644
--- a/drivers/soc/st/stm32mp2-syscfg.c
+++ b/drivers/soc/st/stm32mp2-syscfg.c
@@ -3,13 +3,55 @@
  * Copyright 2026 Marek Vasut
  */
 
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+static const struct regmap_config stm32mp2_syscfg_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
 
 static int stm32mp2_syscfg_probe(struct platform_device *pdev)
 {
-	return devm_of_platform_populate(&pdev->dev);
+	struct regmap_config config = stm32mp2_syscfg_regmap_config;
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	struct resource *res;
+	void __iomem *base;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	/* Not requested: the SDMMC delay blocks lie in the SYSCFG range */
+	base = devm_ioremap(dev, res->start, resource_size(res));
+	if (!base)
+		return -ENOMEM;
+
+	config.max_register = resource_size(res) - config.reg_stride;
+
+	regmap = devm_regmap_init_mmio(dev, base, &config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to init the regmap\n");
+
+	/*
+	 * The SYSCFG registers need no clock, but the generic syscon regmap
+	 * would enable the first clock of the node, the LTDC kernel clock
+	 * which is only a parent of the pixel clock mux, around each access.
+	 */
+	ret = of_syscon_register_regmap(dev->of_node, regmap);
+	if (ret == -EEXIST)
+		dev_warn(dev, "syscon regmap already created, its clock stays attached\n");
+	else if (ret)
+		return dev_err_probe(dev, ret, "failed to register the regmap\n");
+
+	return devm_of_platform_populate(dev);
 }
 
 static const struct of_device_id stm32mp2_syscfg_ids[] = {
@@ -23,10 +65,12 @@ static struct platform_driver stm32mp2_syscfg_driver = {
 	.driver = {
 		.name	= "stm32mp2_syscfg",
 		.of_match_table = stm32mp2_syscfg_ids,
+		/* The consumers keep using the regmap */
+		.suppress_bind_attrs = true,
 	},
 	.probe = stm32mp2_syscfg_probe,
 };
-module_platform_driver(stm32mp2_syscfg_driver);
+builtin_platform_driver(stm32mp2_syscfg_driver);
 
 MODULE_AUTHOR("Marek Vasut <marex@nabladev.com>");
 MODULE_DESCRIPTION("ST STM32MP2 SYSCFG driver");

-- 
2.43.0

