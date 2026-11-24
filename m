Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795527706;
	b=ed9niCw7T7KoN4BPn0m1wfElgPjl5CFKIc8FxazgvLIDHJtwcGIBiOzf83HcSrde+Y2E
	 1NJpm8z0jkFuNkqkMn/ox/Cw5rQnuyvfVAynawx/VAbFBaqiv8X90koStVVhhUFJuGkJp
	 F9BExOanxOsZYBiIhIfp9i7hDqugE6kypBcd4zMth+kiQwSNWNclFchSN6L2/AR5rRf/Y
	 J5WKKcRBfWw7CvDvGPYXxC4XcgpytwkqrIuifGd1SMBQt0AX6Zy8n8v8ZDEgKiGFnrKlw
	 lEdO0qAFf/MWdUz78L7ET89mDyvBs5/rpk78HLOO6eNvb1ePBhA+U4mNxraI7oMQiVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527706;
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
	bh=tLSxwasaFh1HLpCeeqfX2Ghh4EldAP/IJfCoLGH2pNc=;
	b=hcMjIUdCFr+M5DpROUifdrZwjGaWm5WgCrFijG1ZQoK830bVCV2sGd+Hs4gUmHksp08U
	 LN6EZORMMNe+1htsPLKjvoXK/ZSMpj0zoOK41arubCiff5OR9eqRbyVPs3bhRhhxa8bWs
	 1Kuiu9dmBb87BJXy2kcK6vc2JVhC5FkJigR/QEKIAHNgT+TGhWk8p5EDy/4k28T69WzxE
	 dRnELNu/PueW0CGuXESCqWMyYfaXAJZZuMMeCYYUkPd6JGuMKv837Rgi6A0G1dgF+VcRn
	 FQzNQq2l4Cn25m0m8WbUYH27H9As/BYkZm2Shj8TrEiHImK6uMweFVvCFagKP5na6qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=IGAYUeD9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.43
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011043.outbound.protection.outlook.com [52.101.70.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340FD606A691;
	Tue, 24 Nov 2026 13:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 340FD606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=IGAYUeD9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+x1eqpNcGuXcUf5PhBfZXrP9V6bQaEDbS3r5daPBRDqZ96jlpKymKfPeJA5FNwihslskPlUZ/Q2GThlHaaeq2JUzC3KkLFe0LP3G9eJXLMa1zEV49wMz/CkN6DhaMCoU8RQ3OA+ed4aiiL8h6GwcKaf4OOMy507ZgxMImcJDSyIE5JEpxBYnWqKQ2Oj+IqhwAEKYmbha2ttHAUmtbMdZKSZbn3CpaujN0/Bdnodhd+n7uwRipXNPCmINHqzQLlwaG7bLofhWWAXRCS70IKqFeYsFNjHzRABiJamQ5QRQx4JKC6PCY9E5lePV/vTFhYso+dhWkUyf1339iFTVA4kww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLSxwasaFh1HLpCeeqfX2Ghh4EldAP/IJfCoLGH2pNc=;
 b=p2t1pD8wSIrzLkvEbjkFpAR5WJJ1e6pfOSj4Axj2BsH3UZEs2vj6FtGCh2O1c3ZOxBPMc+BFqMfigDdReSlTJqHLi4IVp0ea8gWFYksU8bL44lCXJW5DK2Y6ZqMCPJIbTT+sNODjlejhnejDO+62ZlUQJRG4+bEpynuJDVVWkhN6F4+EV3GAmPP7BN5AlTzas2CRP0qBOttgnW9+rNBEnD5Efw8oDbca3+UGaTQDAdN0NP2fBvPaVjvxOIk9X0LAHGRJ81ERxo13JtYVyP21wIwlw1S9oLixRYA8uE96SIqbdcGm7YW93JZuDhJRRY/MOA7Gk5QsA3GPW1tQXAycug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLSxwasaFh1HLpCeeqfX2Ghh4EldAP/IJfCoLGH2pNc=;
 b=IGAYUeD9h4Ydf89CzUOEBmrxEa3Yb5euVJSwbG3bbsGJHQuuJCOeQj2xG2QGFYH2yWklgSHh8HTFFolNFSQuFdAiDYIVUAdSsYDhbj2qQ+aOeFNVjhN5tPpkrObPLKW/y7jBtAbobyutf7cQJgDFnU79zLtllvu2uNydI/guekKLBXSq6BDifnnFwssWNjKi8YF/gdyeKBSn9UOoD1ebuWRsPuRZMDMJi8CHQI6EVK6mJ4anqL49HAgIYDrynaDRrTR8+qJoZtVUHT0sRwKyL6Vju1Ip1bkhoxHGi7Kd+MNbRNN5ZADsgocPcVKoCtPaHA68falSXluHDDWefv27UQ==
Received: from MI1P293CA0010.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::7) by
 DU4PR10MB8889.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:56c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.4; Tue, 24 Nov 2026 13:41:41 +0000
Received: from MI3PEPF00008557.eurprd05.prod.outlook.com
 (2603:10a6:290:2:cafe::80) by MI1P293CA0010.outlook.office365.com
 (2603:10a6:290:2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.15 via Frontend Transport; Tue,
 24 Nov 2026 13:41:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008557.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 13:41:40 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 14:42:27 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 14:41:38 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 24 Nov 2026 14:41:08 +0100
Subject: [PATCH v4 2/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
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
Message-ID: <20261124-ups_mp25_clk_syscfg-v4-2-894d95dffec4@foss.st.com>
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
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Brian Masney
	<masneyb@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527696; l=7239;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=BRUI+ZpFLUANObI/QWzhjnA2boQHvb+yr0+/V6TgRIA=;
 b=wzvtsV/KPKgfeBPdOOuw7/CjmTnSEt6qFawX143PLAPRb3BwZRrwjeHBM/TDwIK6OQYlE6zRp
 UugXRAGo3qxDgOBwjkVDz0SR5iMDLCI9UDAV/xRqCvwGgYPk64aYoYI
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008557:EE_|DU4PR10MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4f5481-6f9e-459c-1da6-08df4a30abb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|23010399003|1800799024|82310400026|10067099003|11063799006|56012099006|261021135927099003|261021121427099003|261022105027099003|261022075727099003|261026121527099003|261009221227099003|261028144727099003|261102123227099003|261026140227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	gJvyXFN/LNHW3ATaH3pqZw1Kiv+RcHmbKQc4MdIyqEPRdwRqMxH4U2G22nVKaskEtKumkKIbIBsHEJCerTRSQaCdsW7dICNjP1QV+4K7nEBOJHTLX8ZISn38bUVtTNbXrtUq69W+V9K2v82c3AVMgfOAAHsHkiiw0Z+Ek9WBgKAdaklSQRC1zS3/9ugFe/6/eVYkIcNiMBbqGOrHaEwgXDlkY7pQ/SmP3pxWLnRA9obFRL1XOVTbon9Aoppms8phL2/PBeiddcTn9uC0KHdLgaIakBHfZjkZxBQqtgHcwqucEIuYJP6K6vZlL3UOM3zEQJGW0ILjoJRyP1FO5rxg7sxVtViPW9Xba3PLXOuDXCc4YnH0x6Jbhpbj7K0XIqyac/qsjPiLrj11SYizgkAxHdNjqGlsdg7/QJAniqmumLgVJsHSJvjLsAx4R3DD3akddTrnfO0J0tXNKuZQh2v5454fl0LTWwLBMuJtXUMVl+Qy2l4NNBD675MyhUfdZYtLkGmuJ8Wzs5Z6/V9wNRsjFnD4/rbEbBXdsiAq+muYtqmXdf0LPw8j4ah9cPP+Shxs0k8/oVsm68XIvbpAUKwc8nC9Ac6VEpY1z/yebckYV36b5nJ+sV9ae2G0uqTNYcSm1Z7UaCRsQvMJWo8uZS0ih2lvTaOeJQskas5zhaa68BnC1/liqP1P+7ZNfnr7YRsrBqu7dUBwLhXwRG5lrxa0mg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261021135927099003)(261021121427099003)(261022105027099003)(261022075727099003)(261026121527099003)(261009221227099003)(261028144727099003)(261102123227099003)(261026140227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	onSLQxUSJQ3crAccoq4551Gg4tKZ9+C/WNxkUT2RO9zYBv2VQxuFeJkpP2r4z12cZ1rNWcsSaEuZ8+V+MdH7rKuQF/wC0DUxzb9y0ZGQrnu9Kj/ypRFqG/lo4Iz8wUry9oZk6sCojA00Tv6HuMPLI+vvKoecoeJrSVABIuhNNxoWH0aFF0w6xvJD8WU1Qq3YebU4r5graF+2uxl74hnlL1PgIqZXM1CrJIg3Gr7OucBkX/B/JJDX0d3wQ1XEbKf8K7LFvh2kcX7mtLcpJAvoJCwC/JPC64Sdxk3szxM2JK4KqL+sjnrx7gFZiMS9zqBY5q7K+WE28KdtEHrGFL6a0Ftzqb2UobgXTHIGUUWdgGIHaBn2pQKyoNDb6lN+4JOhySqTz7xiEvRTjeoRUUC5Enm+WwqhZqh0gig3JDM/lhbmwI6f6GxP1UoZpEKDBaM1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:41:40.9151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4f5481-6f9e-459c-1da6-08df4a30abb9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008557.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8889

On STM32MP23x and STM32MP25x, the LTDC pixel clock is selected in the
SYSCFG DISPLAYCLKCR register among the DSI PHY byte lane clock, the LVDS
PHY pixel clock (reset value) and the LTDC kernel clock, the latter
being the one needed by the RGB (DPI) output.

The SYSCFG node is described as the provider of this clock, but no
driver registers it, so the selection can't be changed from its reset
value and a display connected to the LTDC RGB output can't work.

Add a driver registering this clock as a mux. The SYSCFG node is bound
to the STM32MP2 SYSCFG driver, so this driver is an auxiliary driver,
probed from an auxiliary device which shares the SYSCFG node. The mux
parents are taken from the "clocks" property of the SYSCFG node, which
remains the clock provider.

The DISPLAYCLKCR register is accessed through the syscon regmap of the
SYSCFG node. On STM32MP235 and STM32MP255, the syscon core attaches the
first clock of the node, the LTDC kernel clock, to this regmap: it is
kept prepared and enabled around each register access. The SYSCFG
registers don't need it, but this has no functional impact.

Co-developed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Reviewed-by: Brian Masney <masneyb@kernel.org>
---
 drivers/clk/stm32/Kconfig                |  13 ++++
 drivers/clk/stm32/Makefile               |   1 +
 drivers/clk/stm32/clk-stm32mp25-syscfg.c | 127 +++++++++++++++++++++++++++++++
 3 files changed, 141 insertions(+)

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index 5dbd75cde657..18289816f030 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -39,5 +39,18 @@ config COMMON_CLK_STM32MP257
 	help
 	  Support for stm32mp25x SoC family clocks.
 
+config COMMON_CLK_STM32MP25_SYSCFG
+	tristate "Clock driver for stm32mp25x SYSCFG clocks"
+	depends on COMMON_CLK_STM32MP257
+	depends on SOC_STM32MP2 || COMPILE_TEST
+	select AUXILIARY_BUS
+	select MFD_SYSCON
+	default COMMON_CLK_STM32MP257
+	help
+	  Support for the clocks provided by the stm32mp25x SYSCFG, i.e.
+	  the LTDC pixel clock source selection between the LTDC kernel
+	  clock (RGB output), the LVDS PHY pixel clock and the DSI byte
+	  lane clock.
+
 endif
 
diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
index e04727b59449..8088d172651f 100644
--- a/drivers/clk/stm32/Makefile
+++ b/drivers/clk/stm32/Makefile
@@ -2,3 +2,4 @@ obj-$(CONFIG_COMMON_CLK_STM32MP135)	+= clk-stm32mp13.o clk-stm32-core.o reset-st
 obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o reset-stm32.o
 obj-$(CONFIG_COMMON_CLK_STM32MP215)	+= clk-stm32mp21.o clk-stm32-core.o reset-stm32.o
 obj-$(CONFIG_COMMON_CLK_STM32MP257)	+= clk-stm32mp25.o clk-stm32-core.o reset-stm32.o
+obj-$(CONFIG_COMMON_CLK_STM32MP25_SYSCFG)	+= clk-stm32mp25-syscfg.o
diff --git a/drivers/clk/stm32/clk-stm32mp25-syscfg.c b/drivers/clk/stm32/clk-stm32mp25-syscfg.c
new file mode 100644
index 000000000000..c7e840fb2d95
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32mp25-syscfg.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) STMicroelectronics 2026 - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/limits.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#define SYSCFG_DISPLAYCLKCR		0x5000
+#define DISPLAYCLKCR_DPIVSLVDS		GENMASK(1, 0)
+
+/*
+ * The LTDC pixel clock source is selected in SYSCFG_DISPLAYCLKCR among
+ * the DSI byte lane clock, the LVDS PHY pixel clock (reset value) and
+ * the LTDC kernel clock, which is used with the RGB (DPI) output.
+ *
+ * The parents are listed in the DPIVSLVDS field order, while .index refers
+ * to the "clocks" property of the SYSCFG node, ordered "ltdc", "lvds", "dsi".
+ */
+static const struct clk_parent_data clk_pix_ltdc_parents[] = {
+	{ .index = 2 },	/* dsi */
+	{ .index = 1 },	/* lvds */
+	{ .index = 0 },	/* ltdc */
+};
+
+struct stm32mp25_syscfg_mux {
+	struct clk_hw hw;
+	struct device *dev;
+	struct regmap *regmap;
+};
+
+static inline struct stm32mp25_syscfg_mux *to_syscfg_mux(struct clk_hw *hw)
+{
+	return container_of(hw, struct stm32mp25_syscfg_mux, hw);
+}
+
+static u8 stm32mp25_syscfg_mux_get_parent(struct clk_hw *hw)
+{
+	struct stm32mp25_syscfg_mux *mux = to_syscfg_mux(hw);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(mux->regmap, SYSCFG_DISPLAYCLKCR, &val);
+	if (ret) {
+		dev_err(mux->dev, "%s: failed to read the parent: %pe\n",
+			clk_hw_get_name(hw), ERR_PTR(ret));
+		/* An out of range index leaves the clock orphan */
+		return U8_MAX;
+	}
+
+	return FIELD_GET(DISPLAYCLKCR_DPIVSLVDS, val);
+}
+
+static int stm32mp25_syscfg_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct stm32mp25_syscfg_mux *mux = to_syscfg_mux(hw);
+
+	return regmap_update_bits(mux->regmap, SYSCFG_DISPLAYCLKCR,
+				  DISPLAYCLKCR_DPIVSLVDS,
+				  FIELD_PREP(DISPLAYCLKCR_DPIVSLVDS, index));
+}
+
+static const struct clk_ops stm32mp25_syscfg_mux_ops = {
+	.get_parent = stm32mp25_syscfg_mux_get_parent,
+	.set_parent = stm32mp25_syscfg_mux_set_parent,
+	.determine_rate = clk_hw_determine_rate_no_reparent,
+};
+
+static int stm32mp25_syscfg_clk_probe(struct auxiliary_device *adev,
+				      const struct auxiliary_device_id *id)
+{
+	struct stm32mp25_syscfg_mux *mux;
+	struct device *dev = &adev->dev;
+	struct clk_init_data init = { };
+	int ret;
+
+	mux = devm_kzalloc_obj(dev, *mux);
+	if (!mux)
+		return -ENOMEM;
+
+	mux->dev = dev;
+
+	/* The auxiliary device shares the node of the SYSCFG */
+	mux->regmap = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(mux->regmap))
+		return dev_err_probe(dev, PTR_ERR(mux->regmap),
+				     "failed to get the SYSCFG regmap\n");
+
+	init.name = "clk_pix_ltdc";
+	init.ops = &stm32mp25_syscfg_mux_ops;
+	init.parent_data = clk_pix_ltdc_parents;
+	init.num_parents = ARRAY_SIZE(clk_pix_ltdc_parents);
+	init.flags = CLK_SET_RATE_PARENT;
+	mux->hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &mux->hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register %s\n",
+				     init.name);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &mux->hw);
+}
+
+static const struct auxiliary_device_id stm32mp25_syscfg_clk_ids[] = {
+	{ .name = "stm32mp2_syscfg.clk" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, stm32mp25_syscfg_clk_ids);
+
+static struct auxiliary_driver stm32mp25_syscfg_clk_driver = {
+	.probe = stm32mp25_syscfg_clk_probe,
+	.id_table = stm32mp25_syscfg_clk_ids,
+};
+module_auxiliary_driver(stm32mp25_syscfg_clk_driver);
+
+MODULE_AUTHOR("Gabriel Fernandez <gabriel.fernandez@foss.st.com>");
+MODULE_DESCRIPTION("STM32MP25 SYSCFG clock driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0

