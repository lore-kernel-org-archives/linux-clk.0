Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793981805;
	b=tPNCph2VpzhwUKgdK8U7TDg4OM6t1wJUAfenvaNaXsy4zoOhcq9Ov0fTIQWP3onKF7lH
	 JwmxrJFT+b8yRdKa6BTjLtIvVV8gQCmWOfA9Wq3sfEA4fvbu9IwW5DWHZZvgg3JvjH5td
	 z22gNCTM/EGq0Rlq8QkSnAePFM2z9PKh9Qr4Mtpqx0hYopem/sNo7e4utm1l0s5lchuhY
	 ie+if9Rq0wCJASFnilvOZcmr0HVm/ZzXXuydPUZUVVtlVuUup8p3Ru1M+mwDkwXFKxQ7B
	 lsxtOgRwLR2nqsb2U9hYCHkxvf3B6TBIHMRZDZcWK7Hk/QGm2WWeZkT03wf349g8B9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981805;
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
	bh=Oct7crPAx+5VdJ1/G9PKgpOdQz5b23KsddOolPSKnwg=;
	b=l0QfDbsIUFRq7Ycb3rsYGg+N9E6FQeP+VVyAYzrvWAoJvTnFFwCJcWq2NdtmN2ny8aj1
	 c5T+9fVPrv8hoysDQv29v8TSyGWjc2SK3OeS4ZHVI3G7UKAVW3A/7J0ys7xcC0Rk2BIaA
	 QUm9q/NfLdqdbXOVUwsUY7MtdN2Ty84TV2B0XCoCaGJ5NiByNtqTpMnYA7Cpghug8nxxk
	 WBNAsrwOBo+RpUdraed9JQiY2klk9a4LM39o5rpo79j4gBeUgV/yWCHzZAsTz5DUP/sWY
	 R4pWIgV03yhdpGuEtYWUNXBsMpdE1Fo7qoN4/5VNFqUd5MStmg7ZHxlWQP9M+YlqGLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=YVgOm8P6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.7
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011007.outbound.protection.outlook.com [52.101.65.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1B8606D830;
	Fri,  6 Nov 2026 16:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB1B8606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=YVgOm8P6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gv1ZQVqZbtQxp/iLtvRmjLEB3JG3lg8HXzVcTiFNGgt/Wcc2Bjbr0BeR3iS2vvUhKEmDnDuJbTsKhXFuLUFsqSWxBFnAQxdwxhqJ+n0JVxJ1euogMd3RHjeMU+No7NL/Gq9h2ixNArladAk03PLvREH4N8oM1cPmgOujC3V7H2RPPEy3el42B/fZIiHx+Z6Dpslv3zm7BZe0OddKZ/+WldODmMKgLe5mVEnWP/83+4Siv1b4c9eC6QAcDKNUDXFAaQqrkCZkh0uttbLUB+TbHK6IrtpKoD7YkykuYlaU8Kwai5u8KiUoyj4eUJ3w+aE3V76KBRPve0slldJlpxCfgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oct7crPAx+5VdJ1/G9PKgpOdQz5b23KsddOolPSKnwg=;
 b=abPQ2w6Knck2WYOFY5TdO3oy+OMKxoOzrWYnmlaOR2LtfC9eB2xQQMNgAcfavCkF7YwBwArFxZ1KjrhEymD4tysXtKn1n5VkCKOmGlutSgFXXtJNthr2x27XmWkWhL2l3rEiZn7ifnDvJcHoyB5bNBwfW3ypO8O6gaDaN1UuVfSUrxQu6zuKQ8xahB8fMHQ27k0+ehj1NbWUW0SFbGrr4NwhSmGqfUvwwCK3VmMqHvJ77cRXhuBJwCou0VbriD2M3j7ja2xnQ8kDJGjLzvXXd802MV7/1v0UUhymDOwDY2oOT0OjyoH3HchVkKH+FXiSlE94lPR01LEXUUNJDEpvzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oct7crPAx+5VdJ1/G9PKgpOdQz5b23KsddOolPSKnwg=;
 b=YVgOm8P6SDR2hboyFMriQBorlX/MoTl0IXjrrfTo4SPrwc2XZcGIc8ekBTkM0MaXnpW/fm8JnvH67ljnlTq9fo3B1PM5xaeEjO1EUryijEe9QX1coRBl1Nf3h+yjGllypOckUlvE7zDfrmVS447F8Gr8mNbpG9CwVbF/32/Ms++X6DX2r57NCZoIYZTpSc9oyARnQHr87MCtZN8sq4XSqEUlBWsQAVdFy37YK7Rs18DJZvJWUfnAOkvz9APQr+IDNnwAdpqVf9O0XDArz2IV8boN6Izvf/B8JFl5nUJ8XsXYt/ol88gDkr2F76DoAX3fityEnRJo+bANt+K0yzoPkg==
Received: from PAZP264CA0231.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:238::13)
 by GVXPR10MB8455.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 16:16:40 +0000
Received: from ZR1PEPF0000E45E.eurprd04.prod.outlook.com
 (2603:10a6:102:238:cafe::52) by PAZP264CA0231.outlook.office365.com
 (2603:10a6:102:238::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 16:16:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E45E.mail.protection.outlook.com (10.167.241.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:16:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:17:19 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:16:32 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 17:16:31 +0100
Subject: [PATCH v4 1/8] clk: stm32mp25: define the number of clocks in the
 driver
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
Message-ID: <20261106-ups_mp25_clk_update-v4-1-9e32b817c38d@foss.st.com>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
In-Reply-To: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793981792; l=1835;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=KNz1PZCl4zM7ntbYiCIpnAt3EHPojWQTAKZ2hi6v3bY=;
 b=whr2Oj9W+udz8tq75TILooRhK+5Xfimg3wWgPSULLKOuMD5oRX5TSxRLeuLPtHxOjhmfqzJzn
 4c7/x5oWA0sAMYr+rKNFf+ckvLgavB66OBVXa40sPddkhAw46BRX+i2
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E45E:EE_|GVXPR10MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7d7ec8-190b-4936-3730-08df3c21564d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|261009223027099003|11063799006|56012099006|261021121427099003|261021123027099003|261026121527099003|261102123227099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	1+UqSdk8JI77Hm+21fgCsSqbK0ZKOi3fMCgYyYTDZf/+IXgsAY1oA1P9SnQegPk4auX657YQGnPfUtEnecO5DyEo/hiEFj367Ko0wKlxkNqs3yQEo0ccvLnHGwguh/3wLEwPf9HOOz5YCQ7J5wJReNhlNvI1ZIxroUi6j8rKm+9JZcxNHO/6kdJrjy2010JAPTv74K2XOymc/ScmJarPfDKzx5FKqL2sSBapLtcwyEdDmqNEnigrD20nBNIqLhY1PQxDIDrnKU9FBTw2WO6pQpfLbHmCTr5tWR5pCMY0Y0kEIF5+cgPD/42DABHjLpX1bn+2xZJYrFwYn8YjxmY5dIEKSCJmG9tmq64ViJZzjBVh3ATRfgYbzGB+XIAoZ99s3zay4CWB1UqAYFu6cGXUCQkHk5Z0wvj2hlj01aaUsmiZuLSoTQxG6rWxqxxBXLChNXODzSjvCyyCdEc1XsI0Qj1RRHTWyXpIn44LZDlpbRA56DUrzzBhw+ANRojJem9pj7F7M93cFl0E3VqlcjXvsrOE1P4fT94v7AQgMHJnr+JmtiTP71L6TPsjmazsjR0W9S3ykIodrzWxklSnnKxa6zUH0QtAIl8saoZF5sfVYpzYvtchdvbogyOpRqEAhISsyCkuQILsCV3bIjP2DY288XFZ7y0cyuZnun9+DdM2TjVG28bbEzTuiyVo3yfnU9QC6HAowceGKjr5vQ1TWWF85A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(261009223027099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ll8UkpGOIQombKxErPy88TOc/y2+PJzCS4YADtyaIUu8pl2qsUwuCW88ih51q08sR/Auh5IG2hhf9+Ap50wqONc8f+1wrPPIpHlNhJKVmfbvGzpOqdV5QES3KzTfZOqFttJojYH28JfEj/g90qYah+H1zNFKza/XvajAqHdx3BOny2FMnv0eCMxWOlzK+jnha6s+JnipcvaK5KufcgJzEdP5nkhJ3Eg4S/ziJlzk1nWIl3h2PbjwQK1lztEYQLSvmpZmheAujM7ke2cU0rXKJYVDugeRaLyRbzMxTzgHYdYp5N31YGPBFqRXpTxdoWX8dYobOVV7sruWZHbLSK5kqL4IyjJXZ0AFegPrJ89W+seKaWamWs3tNeulhrzdnzOLCXJzkoTKT54nlpjqOx5q7v3L9IYeIwKGqtGRUU1QZ9ASrs13CDF320U5pncOaN9z
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:16:38.9035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7d7ec8-190b-4936-3730-08df3c21564d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E45E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8455

The size of the clock provider is given by STM32MP25_LAST_CLK, defined in
the binding header. This is not part of the binding ABI: it has to be
updated each time an ID is added, and the number of clocks handled by a
given driver does not belong to a binding.

Define the number of clocks in the driver instead, as done for the
STM32MP21 driver, and drop it from the binding header. Both are done in
the same patch as the macro has the same name in the two places.

No functional change, the value is unchanged (344).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp25.c            | 3 +++
 include/dt-bindings/clock/st,stm32mp25-rcc.h | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index eb0bc918ecee..fa025a9f3f37 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -17,6 +17,9 @@
 #include <dt-bindings/clock/st,stm32mp25-rcc.h>
 #include <dt-bindings/reset/st,stm32mp25-rcc.h>
 
+/* Number of clock identifiers of the binding, SCMI ones excluded: highest ID + 1 */
+#define STM32MP25_LAST_CLK	(HSE_DIV2_CK + 1)
+
 /* Clock security definition */
 #define SECF_NONE		-1
 
diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
index b6cf05ad4be6..242f61205a9f 100644
--- a/include/dt-bindings/clock/st,stm32mp25-rcc.h
+++ b/include/dt-bindings/clock/st,stm32mp25-rcc.h
@@ -364,8 +364,6 @@
 #define CK_BUS_ETHSWACMMSG	342
 #define HSE_DIV2_CK		343
 
-#define STM32MP25_LAST_CLK	344
-
 #define CK_SCMI_ICN_HS_MCU	0
 #define CK_SCMI_ICN_SDMMC	1
 #define CK_SCMI_ICN_DDR		2

-- 
2.43.0

