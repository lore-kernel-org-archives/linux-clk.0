Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795527705;
	b=GvOQBVSYy853mjuxydxvJ05t0U4fqqQzXYqTLp/CydhszyVvsrXvmjLrA/eKl/z2WQQg
	 YnIKI3XCf61rOHL8sxxP3dCDl+77bCQ4uAc9Cq8zKxJMZjQLiVdHgB4KoErsUohv+VPIE
	 9ZG4PgfN1HqM+LVUi+DJKoMeCLVxLY3WSeT/INpezrBW6FJjGJfqPgP35ShW1zdfGRlzL
	 UTdhpZpdbhfC1ZkZ1RaIXo/QhYH6fe9gl7RZ6DqvznbxEZgUSR30/WfE1KGKBMHby5SsY
	 SGZTRrt60JxUfOlolRDpzeLJEIX8C0g2rLvuMQbcfOor8tIxwgWYGMcXdfhPQHN0SiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527705;
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
	bh=+/91Y5fguaLopYroiSlEK7CH7r/H9L4xjLPB5SVLcSA=;
	b=1SYjJGR/dsObzLllqhmvuJ5XQixSqwC8LcPJTYuRxT/x0FCEmXCylz+ftG624bt4jzK7
	 Dna2aBDC88TyXENB+c/btZHHFE/AYoTgCzi/MsHWCBMlyN4gNHmS0vUO7D6Lnc9/sMWC5
	 eo1GtxCf3BbG3AYLTehh0j8SV6j44lnSFs5+4OndQi0FqfK58gLeleGLHrUKLaSI9bXiy
	 vCqHlVhkorl4X+NpjDx/gi4A6DngsUc9MHCCJbePv4r0LggwewmPQdLxUOeQ3pklfN4W2
	 DqwJ3klLyRvZD+I4AbNiHxQnmS3r23sbRs43YkaAt2fXmWfY/a2fSNxNY/RC1SGoLHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=G2MOSQuP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.18
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010018.outbound.protection.outlook.com [52.101.69.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6246606A327;
	Tue, 24 Nov 2026 13:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6246606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=G2MOSQuP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qgHqAATazvQQr3HMCRk8LJ7g3YVVfcqrjh4AueqSiM+IQhiDXdyTB83/S4mpzuI4013NUtdZuJgpVK9L8caQN4zjZdwwmsJ7rjRaJTgLBhRmbSi1GO0TAvKeCzJIgf2vH4QTJ4oOAIYn0PEKiO8WxWDGtzYY5GQCYOrH0US329ePuWzUBLMcIERVIdcJZm416D+IdYs8nKzDWrwSAd9VW4yvOfgEL0QqfvGjCfdHwrdJR9/QpRIeN6j2ir9bQmvqJJzXbz/vz5P0vqK+cxd/T5xpZCaxi+dMUHlD+KXFms5o4in4VV7WTs8fAtrdrLhJCP8s5AhBr7/sXFKJL1KMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/91Y5fguaLopYroiSlEK7CH7r/H9L4xjLPB5SVLcSA=;
 b=iHwKG9H2+DZ2GaEvnadaGlRYFC3QN/2czUUeexsCcf4uVmD1iAcNfNyxfteifpRtjj4Yd79bFRN6yWb9qPhSgKsOFGcFEVPbMFJlOQTNMu4AFfKMBnAMbuxBUVkT1zc5Ut9DTRThKFoDIRSBpn6pkibb+mXxJvQ9fbWANx3BaFVJfGshUfcclvRjyzGCRxqX9CSkkaa1lM1Z7Ouv60+nosymPThW7WHDRSGXI/QF/RXdGzIZ/HsACKHXmGlWs6yGNTxyivCocqmmFFfRK6AVuHWMMN6dRpY07TCwcS2E77lDurCki/hlTO/ImULjCCBKS6CK7wDcWmObLytlY4cs5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/91Y5fguaLopYroiSlEK7CH7r/H9L4xjLPB5SVLcSA=;
 b=G2MOSQuPB8q0/pxAqGWZ/3Y28LjKlg6l2WKwn56OjIFP2iZuXB9/pGeijVSVBvHt/PptV7UA5+zyIbdMe280V91RjQ/E+W6I8UDnyZAXBETHsFftL0C9uIpZJysNCZ4IUtOsGgRMUBh9bHPboMt1V8jEeDQj5JjMGWJs/bekTAysZ2w9ETMkoy096un1xq+8OwYaRCxHlht0isYa0t/Xffk3/T/tqVrvplFxDywzVR0KHhB7ihB3i5U2dd6g+kQ4ZgiAUuXyJAKcYvAIhdO9AqhtXBFUqSN36YTctEO9ICgIM3KsCwmFrNfKSGqdyVzP7h8WU9otXxJSsZMFQvwssg==
Received: from AS4P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::18)
 by AM0PR10MB9623.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:73e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 13:41:39 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::7f) by AS4P195CA0012.outlook.office365.com
 (2603:10a6:20b:5e2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 13:41:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 13:41:39 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 14:42:44 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 14:41:38 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 24 Nov 2026 14:41:09 +0100
Subject: [PATCH v4 3/5] soc: st: stm32mp2-syscfg: register the clock device
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
Message-ID: <20261124-ups_mp25_clk_syscfg-v4-3-894d95dffec4@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527696; l=1893;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=tNrscNAoEj1P9e2hgIBXvrrKqfLmrSbQXWsp8KXf6EU=;
 b=NuMZpTkBsnBQy13Fc3RnFHP4Nnz5NWO9LpOiDVxMEDI69JZiIK2kLqiSKqkG5juq1QZskhgVt
 3T6Xc1GpR/qAkIeavN04ZB2xhqyLqhHa67x5/P0+1cwnY6n4amdh5Ob
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F3:EE_|AM0PR10MB9623:EE_
X-MS-Office365-Filtering-Correlation-Id: 3228bdfb-6fee-425f-0f47-08df4a30aadd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|23010399003|1800799024|82310400026|10067099003|11063799006|56012099006|261021121427099003|261022105027099003|261021123027099003|261022075727099003|261028144727099003|261102123227099003|261026140227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DJrBwt9rlPu8mDqFQvq5TRKguRHl2clHYxuLgixc7AW4jfjQMUuHSviYv3tBLf+PPXCr6N+hENbi9rRM+8XEyqXK+sTtH1MTcRDXYxdeddTLhpI7Mh/nkEak+Koqbqc4sw+NQlMvCYZBvyFnlZf9le9JtFTc8bmizHtPzylDs1dw36RIUOx/MuzeXpct+uCmU4+xoiooIJlZ45lKgtkeFjSbm3UlNHgQWz6p7qu/mU4K9U4EHyCPvN6rg3yDTwqh5SIvHBHOAgWeGqxL4CLpLexgCQQdOiSEAfEgc6mmEbf8IpdZSCktdoh67BhZ/bYJEp8LmVx0k2KZ4oMLc2JWknwh7PpbQo0apvQbgPtpZ34EAT196mi+RGp53kkCIPfnresWcZmy3l3ppzWigNFu0O7Ver/JYCI8seFiGfWtMWNS1ihi1JaIt4MNpf21nAYFsP3RL91iGICWfJzb8MXuhqTJe2C0fNbYhAi5H7C60eJLUhxJxm5pLjAggcYEqINByej4Ef5BpSFoMYfWUjiz1X22J4AGAzkgtD6rRMS1iWBmFOT1qCBJj0L5/tw3imVPXRxB2Fwl30A5MCqNeePDE+E1NFIPgVWVo1/9wcp/iVi1QS+NsNbH4FPNl1zf/Qd5q3WIcNQj+vW6aWa9k4cx2RE758CIRMoOS7oEeH7fJUbE29AjxnZ2wiGothEnRGpH3H0ysquu/DirmRFmKXiH3Q==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003)(261028144727099003)(261102123227099003)(261026140227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+37BLbgUrzO07RfsEMkuZAj4VE2ZdSdMXFYs+ykQFNroCJKphOSyRBMkq0r6EFcLoUc8Esj8562zuFSTvMiKmApnTFE5ATAAWY+RHV26NWj6TtDDkkbSdnXgANb6IFAuKCbwt7zpzG7dZA9P9I4MmuvhVLZdsJJ0Erpk2rx4WFigCfLWiokazwczir0J7Q0Bx1bhIwC7i076e/YAzqtWB7qwgjkYZjBu/r/Fe1g7frOT3x6dP9VWKPfOkmPlz444kavNzC1b5r0wZdTUPKGVtw5N0L0qnaOCghs6oxzY7C7XExYyxs0yZETpxxmL6JvVDezUBl2B8CNvfSOlAmzBb96Nn7r0cyPkzCtwr6yIizl1fIU/QiyZmM8JCXf3LcCWLVvDKKI3e0gNhEIl/iMwZYVqj2HPELjZYBJj4YCj5AY/q3E2LoHr4rayVBmmCsoh
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:41:39.4215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3228bdfb-6fee-425f-0f47-08df4a30aadd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB9623

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

The STM32MP23x and STM32MP25x SYSCFG provides the LTDC pixel clock mux,
whose driver is an auxiliary driver since the SYSCFG node is bound to
this driver.

Create the auxiliary device for the clock driver.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[gabriel.fernandez@foss.st.com: create the device on STM32MP23x too]
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/soc/st/Kconfig           |  1 +
 drivers/soc/st/stm32mp2-syscfg.c | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/st/Kconfig b/drivers/soc/st/Kconfig
index 2a9d6a77be45..62bbe8c63238 100644
--- a/drivers/soc/st/Kconfig
+++ b/drivers/soc/st/Kconfig
@@ -5,6 +5,7 @@ config SOC_STM32MP2
 	tristate "STM32MP2 SoC family support"
 	depends on ARCH_STM32 || COMPILE_TEST
 	default ARCH_STM32 && ARM64
+	select AUXILIARY_BUS
 	select SOC_BUS
 	help
 	  If you say yes here, you get support for the ST STM32MP2 family
diff --git a/drivers/soc/st/stm32mp2-syscfg.c b/drivers/soc/st/stm32mp2-syscfg.c
index 770321a4a6f7..1160b65d3dde 100644
--- a/drivers/soc/st/stm32mp2-syscfg.c
+++ b/drivers/soc/st/stm32mp2-syscfg.c
@@ -3,13 +3,25 @@
  * Copyright 2026 Marek Vasut
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
 static int stm32mp2_syscfg_probe(struct platform_device *pdev)
 {
-	return devm_of_platform_populate(&pdev->dev);
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return ret;
+
+	if (!devm_auxiliary_device_create(dev, "clk", NULL))
+		return dev_err_probe(dev, -ENODEV,
+				     "failed to register the clock device\n");
+
+	return 0;
 }
 
 static const struct of_device_id stm32mp2_syscfg_ids[] = {

-- 
2.43.0

