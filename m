Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792762097;
	b=tcMGreZU3eSXegyofzZTTH4mpPETMpByMckpfWEAwEX8Ru3GGtUSpqtsuq/HG5gxy9KU
	 3kRLGE8JtPbmjBfl7UXlbXiiAxqn2DnhhlYlpdjuTEJQ2dh6MXhVtUx1Xwm588ettAnq8
	 FnJKxWIh8JQB3GqsZnh8OL/59jfZz3OMs7HmcUJJ++l39h4M2CJ0E9Ipa2srjIXi0hilN
	 IBDG3qsjGKgczbddoTrkEC4OtOazXyRQnw7/sB0Ug4Nyz7ibnKKT9YuV+4NX2URd/1pME
	 2z2nucFbFpgGcbC0EoCAHIS1mL1mFw2RhmhTG/WGKR72K/tIFwqZbwQF6hTT/KUDTtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762097;
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
	bh=K3qvdZEbe9enl6/OgzNx29PXWLOaXXolNcKLq1YCZJc=;
	b=YB8nPF+t5wv3sTIb/9NXvgLBuvngxPhYDa8ttHlb/eGsLq1MWrOdG/HzKG6OXc9I3W32
	 QSc0zaPhRgGKdAQxXiin4SWiaYYnJiYjY0WDxLXSUzaNhxR5ByHBninCMTF/vQ7QuN71p
	 uwkdKblgyWIEKycvV4YFixBXSTIEUWJiV6ZvyVmRoIv2lG2r48vmLJ8fI0EJjcyKc5DYo
	 ZBCJHZkRy7uMQ85wTZhsp8LW5w25XlELIi8MWqxCjrqpKX/TNYywmemWCwuF9gw94m48j
	 DiYdcpxlSdF8ImzPw2/ay0ZXrOo3jPj/+1B54FwYNi0FiAuDTlEn74nbIv2QXfuoAJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=FzO2UXAu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.27
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013027.outbound.protection.outlook.com [40.107.162.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302CE606A326;
	Fri, 23 Oct 2026 13:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 302CE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=FzO2UXAu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFyqQpwgcZmH3k9L1UJYnl6BczqWCWYtbxRqlTzqu7epn4vclntMmSmq6XwBtyrrvYKA9a0mVajLlRe9tkay/gLgYElwWk9KD35H8k4DXinjBJF4eFGYii4NMZgn7aFWZgNCuWIHoP1kjNq4nPOTAkjTC2fReArMNTnPWbbmSPTtxb17HdGKkB5x6/B6viM180M/VUASeUyCgW2l1gOZff2gEC7rKkxUMEcBDmfxDUersOZSCj1ULA67HRFYcuoJz0WOJjtaJxy2A9jlrHzaPqnkntTtz0N0O5AF5ZHJZ2qLKOzUuqkWsVL8hXxIzzK6V3iuTuQ0QZk1vYWsk45mUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3qvdZEbe9enl6/OgzNx29PXWLOaXXolNcKLq1YCZJc=;
 b=CFyu9TWWGh6h5UVEQhEwVJS3FS8ipQSWIYF8ZiZCSZpLQzfIybW6xt96csUf2lEkX7KTVKGBPYYrKoYQ541e7keHT3TJ8VoLT1iwpuwo2PJJHEntU7DQvLCBNzr8E80JOiEPG77ZEsDBdEi/m8/liUjRGJoeuDkeGIv0ewyglLFHqeyyexE8zsrlh7VvZWI/DaIq1J9JEzb+goaWbipnBQKTJhQpVL+MWBmNCnacqsTD6JjftPL/3y1rts8YxadDkU4CwqZfxhi+VZ4LdsAQ9H9JsQHi/r1rmgcTIPWbQzUulcQ+hdskjwvE5ao1pVE5tOAU1s4bchTIXIUlDxK2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3qvdZEbe9enl6/OgzNx29PXWLOaXXolNcKLq1YCZJc=;
 b=FzO2UXAuD/lz4zl5HzdHWFOVuMC4bQPjQbiE4OEwgzyOiSBkD7ZYsdahC35bRizevQImU2kc293bUgigaAHi+gs08/PzFd5LHrgJIwyf4UP5dKvSREUCpyeYG1GCNOkt7sqjuRrb79udMNx5Ft9Up9GxVIwINwYTMtCtmp+7qLrmsbsCUEpB3XPHwTq0dmkBiWiGKCbKJGxLhWAxdvcEcJictpx00CzCm+H/H8iho8hz9nntKA0pmgITixwW7tQXfNzk/moKo3REhqooBVn3EUvt6bglZ6SV9CGIx3hWPXMTQUWj+zKGEJsf0SY3k9e9FwBI/DsV/WiQYrpDykcLyg==
Received: from AS4P192CA0025.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::19)
 by VI1PR10MB8062.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.2; Fri, 23 Oct
 2026 13:28:11 +0000
Received: from AM1PEPF000C1AD6.eurprd02.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::7) by AS4P192CA0025.outlook.office365.com
 (2603:10a6:20b:5e1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 13:28:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000C1AD6.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 13:28:09 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 15:28:28 +0200
Received: from localhost (10.252.9.175) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 15:28:08 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 23 Oct 2026 15:28:06 +0200
Subject: [PATCH 1/7] clk: stm32mp25: define the number of clocks in the
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
Message-ID: <20261023-ups_mp25_clk_update-v1-1-e906e7a38cb3@foss.st.com>
References: <20261023-ups_mp25_clk_update-v1-0-e906e7a38cb3@foss.st.com>
In-Reply-To: <20261023-ups_mp25_clk_update-v1-0-e906e7a38cb3@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792762086; l=1765;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=twnI4QR92BUewKdyoUDjAQ7Mve6tD53Osw5Y047pTZc=;
 b=5q9OgHNqff9Pe5OimAaxZkTLKm+1OWK5m8v8jIJpBp5ohL/rhBMIg5UnR1jAZa79nvUOqIYQc
 MCaVwIDB+cCC0K6H9C8VP59QPHNvZZXOZbdB8OInsDQUfTY4wKCd4dE
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1AD6:EE_|VI1PR10MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb17096-abd1-4aed-37fb-08df31097ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|7416014|1800799024|261021121427099003|18002099003|10067099003|22082099003|261021123027099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	0YTJ0p8Q8OIBtClh3a8tR5eeohq8wsziHhhRER8bgQgnBAfveex1SvHV9YlAwV7ypsetYAKCDHFZufQfRkz2xEzu+htmsPGa58yhhEMkbXbPxquIy+hcJqaoksCCnak3ZklbzjlDyto2stvJefDVtUr/sM4gmJdGEkIRPOmemD/0yUKDE1wKYNi8NW3nF5TZkVyb74r8AEVUvzsMasm0GuUnkOwV/3w3aNwE2amJ2Zhtq9qZZ+bH4asAfoqOz0ZB9z6AZaPP8gvu+PjngZvKdA3EGBpgXQ0kJjb5L3fkIq+cQYfZvB+sF86ypwdFNhBG8T9WMHYEuU7vgFgLdw0olZphJGRhQ5/r4GN53xqk9h0ic3DzrIK6GzfMBoz6ORkuxWUgBBZ7CUMlOg/+4wTKeFJ8KjZ3Sp9pybtkdDTfQw3AyDt6KyocOeLczYGXoyFd+nodau3rIYSZ7wtAs7Jwxwp4KRcwgrM8YjnMSMCTitbGe2l5UsKB0fOUw9NxfLEKVD6fzJ3bVgzSaPuo1r0OpnBaGYL+RHjPa54/bbqMscHraB01fHmE3hpdI+fE08BTRIRt3TIYH3gcA0MOZfwT/rBETTWaXni8tKK/bO13Hur4ncC/ux9L1QmVv/q/J4JjwXPnFAVKWnFbAAG8XHUHjX0v8gieTttwFkS7uL4Wg6dLtJo9HRaJSv0V4IWi+1aKTGalYgLqwEqlkWveF4UczQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(7416014)(1800799024)(261021121427099003)(18002099003)(10067099003)(22082099003)(261021123027099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JuD3YUp7+Yx9eRz5/il/r+cr7towZfHLFDybDHL36hoJI+47bYCEVjwlN4mQRNCQ5Cgj2sRic5Pz+0xB8V991F32pDnG126YfTyGm5n1jAP6L8jfKeqfyUyKREWbid0YHz1RXypojrL2lexWHgv1xD0OQetC1ZiGzy7EJZPKQcoS4GKwwuRHNy35PF+2ah+YQuADvPo/e5aGCUw6ECrHt3JZLnlJcFQ9joki/vutPUzYPscNLfdKasIMVnYbBWrglVzRKtdUDOoZfeohP8aka0VKEAlSAab53VoRRpvxJSDu93Iyb40vGt9rgdm4vkxQdUE1fuLSCVgCwHPowLknzk0VVwdZQHPtw5n4NJE8fLsKWm3TTb1lGKfLfKHv6iKDFg1X1ETgcq28nOioTsQe/WuYJ1He87RHfyOD8l74ZUnJwBP+V230NGTPA2l2wQBg
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 13:28:09.1916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb17096-abd1-4aed-37fb-08df31097ab0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000C1AD6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8062

The size of the clock provider is given by STM32MP25_LAST_CLK, defined in
the binding header. This is not part of the binding ABI: it has to be
updated each time an ID is added, and the number of clocks handled by a
given driver does not belong to a binding.

Define the number of clocks in the driver instead, as done for the
STM32MP21 driver, and drop it from the binding header. Both are done in
the same patch as the macro has the same name in the two places.

No functional change, the value is unchanged (344).

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

