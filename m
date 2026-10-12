Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazhn15010000.outbound.protection.outlook.com [52.102.160.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFEA2D738F;
	Mon, 12 Oct 2026 13:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.160.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811189; cv=fail; b=u1eCqh6VmW1h78Odl9JPYpcSmsuabX+fEpLBY4P35Df49mqIKQcP6JYXdyWPDgunrDOe4TpHKlv4jWAXVUBoq5wvFimkWPHMQesnO1W0XjvI9JdsCUQYX6CP0uSxpCma2Nxhm5uUq7J8MikmE8muflsuoWa3uP8UkteOBGTPPGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811189; c=relaxed/simple;
	bh=4q8nIsMBMtR+GBz5QZ4/OwKVGN+61PMo2+tkwz+VE4M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZrwLT/xJS4w0fRTMqafQRzTOD5R0C6e8T9+bIxiTuwbWxtLMIryeXgl1rgMOa7TzlPppySVtnnnpbMnXTUumdY922whrvug4MgHcFdVhTisqrPUtTgN7S7UEOQOf2vUqsGYM561dELEfHPRjoF1dlu3yXwLuazH1WbYoSATLPKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ooQgNwnQ; arc=fail smtp.client-ip=52.102.160.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ooQgNwnQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZQqFbP77l/GdgOwoMnzX5Td3d5h2VNpsIkFrpLfxTm9XNnGqGv0+Rmutz4/bdbVdL5F/ewFFr9YmigD0jd86VxtZiUY+7UtbWUDEtTDrJmSS3quXaND2PuQZlVhOsZjL26LvbRQaqq4LqjSAg0OEOGSda7E0BaswZBdZO8JGqI9rl3wHesfzBssODV10gFeGrrUeH0OAAL51qyMhHF1F2l7hKwXfC1UlKkVdn7nBp/8Whd7ESm8LSrbuDlYev86V14pUGa8z+NgFx2yDjqvoarD/ssuK8Wtav2K0j0DVd1vWKCNJqHVtcnjzJ4GQEStuzZYNFEh5leDbnW4SFVTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGFU23QuspVLvrOZDrMXylVmnar0KWTHEnYl8PArbYI=;
 b=K6Kf8fQ59lRblhW0X0jFT6bvsvRaclGmpE3Gz4yll2+jnPlvhAB0yX3elkNP5g995SXMvmd9xy9m/aG9CyoxF2UFilr9I7MURDI57QP739loL/TT9X5P/0mmuVX54aAU7xjZxSgJPaldLQDmgfq/Q8BtBWkcbrJypadNdlTKLFY7vSc5oe6DmwHn5+Fjv5jLoqFtezk19oRIT0+KAP3o9XK79fV6wytk/b5mz8odjwRp3jOtDjZRvyDn8oBf3FLtd9lydzLnujXpS0eYIaH4xt3tFVJnW1EBcikUT6M5NUOejQyPy0vDqRBNcmH4pN1WryxUtAoHeW6/4NCGJ9HIhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGFU23QuspVLvrOZDrMXylVmnar0KWTHEnYl8PArbYI=;
 b=ooQgNwnQfrp4wQjFhHEW49kd89te0mnSGP2VyRk8Aqlp7G7WtIRSBwg1rrMHr8uH6mxKRPEiKbwaX0qR8pTXSja8+pOvlEaWvcfFvK3RRaxyCDYD/WpAIdueuLQZIxdj/SvbGydZmSajFxGVahnQv4iAjMoBuxBfRTAg+EP1ZDfQ1diJyHf4R02IrzKUGxFvwiWv/oWTiTsbSSyfV6Cw7+dsi5asK2+lnZX56haQbisigdnsdi19J3yc3tsZNJbgwrPeb8JcT82pJPV2Ns4wA8yZN2o0WvyXYbSIqntBbsjrle85JDCLnpO12bGUJ5H0KRs1ak6WMNVDZ4qYYVsDxA==
Received: from GV3P280CA0103.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::8) by
 PA1PR10MB8691.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:445::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Mon, 12 Oct
 2026 13:19:44 +0000
Received: from WA1PEPF000099CE.eurprd04.prod.outlook.com
 (2603:10a6:150:8:cafe::8e) by GV3P280CA0103.outlook.office365.com
 (2603:10a6:150:8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 13:19:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF000099CE.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 13:19:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 12 Oct
 2026 15:20:09 +0200
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 12 Oct
 2026 15:19:43 +0200
From: <gabriel.fernandez@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<gabriel.fernandez@foss.st.com>
Subject: [PATCH] clk: stm32: fix clock array size for STM32MP21
Date: Mon, 12 Oct 2026 15:18:59 +0200
Message-ID: <20261012131859.215240-1-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099CE:EE_|PA1PR10MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: bc0b5103-c1b5-4d77-a2a7-08df28637b12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|34020700016|376014|10067099003|261009223027099003|11063799006|18002099003|56012099006|12100799066;
X-Microsoft-Antispam-Message-Info:
	5Nm8ccjCL6XSW8CKI7bfmXcpNnqEUEyLYyxJ7LUXzbScWDWXg5mPmWExxhq2ClG7gNfs+Esni1Ck5MQH/27ngJufnwTOMdi1wX5h59OaO0LOq33j8jTl2W42sMOy+N1VPE1sxd6aLTfDs7dxujLsgfiDRPDl//FcJVpSGsUYPovWJloJQSNxMRtOKg8DX3HGIQKtwooxtUPRf6s9OC2uZg4wgLJVBF3Oj7gin6YbiN5PSCm7/1XQRV0FFhJSJvEh/dVARjOoIbOPA1/5VFvqVnMxTemA7mUcJnUnYixh7+Lcz/YdPcrzZh7aA11oJkMtEHAyb5/L7MbaIsHxDh9VRCRO4cSI/Xx+w/5EsYULwGopoieG3zB6AL9T4slFGhChNgyOMf7MVyhFsBsxmkTDjshxvAlUoZsKScn5FCxmhgdm0CF3Ac1NaV8uZD3wvZxZ5wU1uNcxHA947owsrIX8N6MowQiUgNjaSnarb9gdDZaYtYeckPfytG03RkK5wED4mNFDyy7WnB2Xln+dhkkqxMqop7VxNre/TJr6semiPp5poQqYCRpgnk/dT7uUcPJ/9OM29RCpCVqsnh4a6Xcz7DzV8DDePtB4lOQx6Jmw5EOPjP3/H+cf4iYkrGtHjr1DjiIwKL2uQN6DzkyjdQv+r0xt3rhCcjiMZkAHBhwAC6xt+ovrUNmow4b3IqkC7aQr4eorl4kVYGu2zZtM1Ja+dA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(34020700016)(376014)(10067099003)(261009223027099003)(11063799006)(18002099003)(56012099006)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EJw8yYpG6c2AQEbaOjwwVFUgfQ9qA+VQniceIRirMgTXgqVkVExHd9trW9sTlroJDAz7tBjOZ8o5B5i8tY54ufpGbKbE/VfoEPf4256jVXW84TagS0tYaK1ObZavTm8TAJRSDmicQJDgvjn+yRRrNkqRHsWp1RdDjeRmS+LnPis+UeHQvRDQdW5TiJkY5ygAcfNMOuTF2Ae2avUzwuTdFFmaHVGhOe8fV88RKPtu3tMb5hm+RbwAjpoM2f9h7t/EOg6nvFTFn/fakIidMGOzBcO/cUp+Eee9LQXjHbwxsn2YEmQi21jbk7SQS72edSrxI0wdxw2NGJ3/3I7e1udn6/EXxAeEGmPdo+zxwbe7TXzCbyfE7XJXgFJWP+fkhwZ4iGUXjnM6MjVvohwtKD+ylnj+zbuxHf1eWeHKXYazxFKKEnLgeWAgsyAf2qdHQC+R
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:19:44.0524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0b5103-c1b5-4d77-a2a7-08df28637b12
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF000099CE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8691

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

STM32MP21_LAST_CLK is used as the number of entries of the onecell
clk_hw array allocated in stm32_rcc_clock_init(), and as the bound of
the clock IDs it can hold. It was wrongly set to CK_SCMI_KER_ETR (112),
which belongs to the SCMI clock ID range, whereas the RCC clock IDs
go up to CK_KER_STM (289).

As a result the array is too small, and registering a clock whose ID
is greater than 111 writes past the end of the allocated clk_hw array
(hws[cfg_clock->id] = hw), and consumers requesting such a clock
get rejected or read out of bounds.

Define STM32MP21_LAST_CLK as CK_KER_STM + 1 so that the array covers
all the RCC clock IDs.

No device tree node uses the STM32MP21 RCC driver yet, so there is no
need to backport this patch to stable kernels.

Fixes: 37ae8501cdb0 ("clk: stm32: introduce clocks for STM32MP21 platform")
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp21.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
index bdb17419908c..961a228d8c64 100644
--- a/drivers/clk/stm32/clk-stm32mp21.c
+++ b/drivers/clk/stm32/clk-stm32mp21.c
@@ -17,8 +17,8 @@
 #include <dt-bindings/clock/st,stm32mp21-rcc.h>
 #include <dt-bindings/reset/st,stm32mp21-rcc.h>
 
-/* Max clock binding value */
-#define STM32MP21_LAST_CLK	CK_SCMI_KER_ETR
+/* Number of RCC clock bindings (highest RCC clock ID + 1) */
+#define STM32MP21_LAST_CLK	(CK_KER_STM + 1)
 
 /* Clock security definition */
 #define SECF_NONE		-1

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.43.0

