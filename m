Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792762102;
	b=2YqzKTFCV/qcqvT2z1vMxLeBG5Y8nDkcWDXWNSi3nQ6jrA+0i94gaVH46Q0x/VzVBdaw
	 U0xLj7WDhMZWnWIy8Pp2jA4yIxD4DoFkG7qm3IXvDoaEXX1uCnzEayQdMvNFpUMyFydWt
	 RrWJkExxCjArXBfvrRDuV8fzeJXPLbRNuSN6VV3YJkJfmZO1s7or9LZIGVQeqlxXRyyrf
	 EAWg+BMno/Y7DXD7zDzpeBcWMcBsCuu2Mny7X1Mu24NGkn0jxfSzzWBXkOg0flibc1p0i
	 uo7WIqXZ/GDPZ/n1lHuW6pOCsfTtLi3LiWHTLuilb1s3vRUTmEhTA2D4+9doiYyLorg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762102;
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
	bh=byrIe/i/ovNOTBYnd6dtCoSmve/s1vFKaUDDoCan9KQ=;
	b=R3rBgXgqwu7/JGgsqzbKsoU4QQaeDHmFo5Hg5dcmlACMe4p/XeuEpONyPrqL+xgj/Hbz
	 mYGaYdzglFOuq0S8u7h/YMU2cGql3qXv0OFjjwuA7PrNmBYDAGmwI24NZpP2mbS97fNIh
	 fR1IiPQnTXG+771b1LIR4ft8oprQkQmLiuVtrmk4+vHqnY+X2Caf2ZeGvQWId8S23cjv/
	 Ek2ZsM/kWO0v4aZMPxua33xrb526nzY/eDi9rERfwzPzzIBJQQmysg3RsE93O+B92SKAJ
	 OJ9Xebt0B454C4xM0gCtHSpA6UtgEzdydW5gQJa6Wnm9GPLHAY35hRxNJiDqGgYPJPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=C7926gBA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.42
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012042.outbound.protection.outlook.com [52.101.66.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA618606A33B;
	Fri, 23 Oct 2026 13:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA618606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=C7926gBA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9uAsv5/iFAO7tT9VynYmeWdgHYvCXwQ1GJL4460Dm6eIypS9+yKvuPE6fXKIhrzPFTNhpPYKlm3WHT9ovWBOTbEvQq7DVk0OVlsdqgFlFXJLJiOazTqmPwOGX9g87jnHy0nonA9j9F3FhKejtLxChFnwxNtTKoiHfLSZZX86FEVkPhtHu3u5UIPhe0yOaktZA7l0Soy1wHpSsBtH9aC3jV8oTbCZBAvXxS8fNaEz1DLMe8kEtyIy7jqkW9N3Zrh93voq/SF7Mbg8Yqtk5CzNsjbntaJu8kOVQUx/NePVB0xdB2dyvGBsN6xSnARJhepxpSiMhFGHgrgNTNEt5+8lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byrIe/i/ovNOTBYnd6dtCoSmve/s1vFKaUDDoCan9KQ=;
 b=kUPqMjR0RfWrBxpVJloXLsJeUJpsj4Cjl2vBkfqRSImdNA2uS0/lbEEi8cAiA5mcw0Uc85aCjGRdIglyvvPtz4Qp7Ao3tPua/oZQdLb7himV4kCJBIEiEiLJC+9rsmwIWWEYrwNB/2usTDxZLLNJZX/ibMS6KpcMt3nwanBMqSqqdtIMi54SsE2vV064wA9yrK43RdLvAS4yOcwxTPXusSB5CBR6mA1c6Ea4ffU6y2KQHBr6zI84e1eryoee1cSWZqiRuihBXGP7vwDFN1tMpA0AXrRjIpC3+aWySn/gXjplAt/cLBkND6CHrN4M6PNmgY2M7wwMKByQvQS5D1Uv7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byrIe/i/ovNOTBYnd6dtCoSmve/s1vFKaUDDoCan9KQ=;
 b=C7926gBAX1AvO3oJSe518+uWellH0JqpIL6bLUWoI8GqUckBq7ky4EifO4w58xA0SGClIjjiGiBx81CDu4+7r3ZPFBpQChqJtL1taETfOwGpRrzrWJw7dR4Ih59/J8ZGDpiAyHGZXxHlB8HTpHuOIBmeIA/7E53uYlbwM5t7bGjg99uv2VOs9HF/Hn4Hj/N0iawmA3wqX8lEgU51jzq0Rw+RB05tVNAyahHLNLVwh+g5PwLsySvCKpqh/GJMBkW4QB+CD9m1UoyOJqfyqc6nyAjGxgW6X1X1mSV7Wal0YRFKikivmkuACQW+q7QuGJznPdR/3eOwSXzmLNED5kV6hA==
Received: from PR1P264CA0105.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cf::18)
 by VI1PR10MB7911.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.2; Fri, 23 Oct
 2026 13:28:14 +0000
Received: from ZR1PEPF0000E6B8.eurprd07.prod.outlook.com
 (2603:10a6:102:2cf:cafe::6b) by PR1P264CA0105.outlook.office365.com
 (2603:10a6:102:2cf::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 13:28:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E6B8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 23 Oct 2026 13:28:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 15:28:45 +0200
Received: from localhost (10.252.9.175) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 15:28:13 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 23 Oct 2026 15:28:11 +0200
Subject: [PATCH 6/7] dt-bindings: stm32: add binding for usb2phy1stp clock
 on stm32mp25
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
Message-ID: <20261023-ups_mp25_clk_update-v1-6-e906e7a38cb3@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792762086; l=730;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=YXKaTH14Rb1TWwlpLXpat6SYw9nKtCC+84liIfn2020=;
 b=gc+9muRxvA3EJ4YPCKvyL8HcxqghXzeuTlspgYxtY6iIs9OD/on889F0pykUeT9bYto7Lv0qP
 sEtYUi8klkUDH079kHlQQ8iLw1ff7TdcDFFdQnVtVU/7avaqzKrpr7Z
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6B8:EE_|VI1PR10MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d9b293-cc0b-46c1-181a-08df31097d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|7416014|261021121427099003|22082099003|18002099003|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	9rwezjvJYdPrq59TCVEH0tCZ5Bc4woaBxX9jOQPdsZXubkH3WkaNUbj0/t3BOSwpfslwPx7U5sQBAoShevuEP+RyiKFLnI6BUeNCs2LUHPiFSGb0R7mdvnMLzLhNpShye2Vd4mfOPYXvrEFEl5bm9nQd8c8gqNRtoHwOOB7M2bMGQuqyYLNZ9i9K0xlbI11f0kgx0BGueKVkiwXFoowq2vrvkIsOFTp2qh1HbouTxI0fbAkO8zvMIa95hjHq/rOEZAPevNB8dQkeTOSeaJWm00Xr61/wsQZuwjMlhFH3qM17J1LTxJ/IdKtXQnsIobgHJi42O4w/GbeXiyu7DsSNgsiUU2iwj0cMFKDGdUWgZmmKkHsfobex3JKRlx2GaFc5aC00pTqmM942RwxJZjan18msAXdVk2e9m3XP9FU+BkxV+MRNwJkEQWCAVqvO+9FJJZIGFDu3qzcF3uz0N76rImfRdVAi9AjyAi2VWt5BmltWFTGzYmfFQ9jQWN2MUlMBoE7f+C4bCf6C5xVFK/Jv9WkiuIR3PNYoX6p5Vm8FV31JgAtw6xLFMhPfTj8jfZ7mG0qE1oQZ2e3VpnIVsNvzrlRcvdWDFol3cId+gfFu1w3mNun2Z38kyhwt+m2K/SI6C3ruttPrAq9/B3gCmuUuY1+M07WvKj+b/+smz2BUGT7E89Iek6Z5sZlXkkfgJi3RhsITFYDkaQt1AbKC/mv20g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(7416014)(261021121427099003)(22082099003)(18002099003)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PAqtXJzFU+PelNRfVXMMv7OzJgRIY1z4x2AIevDtxE9KrVk58Tg7nHOpH6zPiCMrg6wDQMfXachp9gF4zQ/m8a1gpQPXxRenJ3UWLE/c3WxtLrZqvQGgDjpTS/WBYL1xTEgNXJ9ZDo5Nr8JB7qOYCal4VzbnSiySLTTQ5il0yavJb2Cs2cn+kTP3p5vJCggCeG0PR4gPiCU1q8Aji3ssCb18flRdx2WzlKOuEkvdvpdR4f0Rc1g2xPbGL/X/kPm0cRG+8Cu19nyZ9IQh2sALeoMSHxUohEWCAKWhcImByrrarEjmvbzJaskWA/CK1Q0Oq9iQZ/4a3EP+sLnEL2Jy1GJYkcKYJ9/XDu2KMcE0U+fR2QJyPrWeP6TvhJkLcZ72SMmi37Ohs5rFiPJ27A8lIk5RKufJqVNSxc0ol0GqcRh2ksyx5DAAsmBWyWyp6Cea
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 13:28:13.8158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d9b293-cc0b-46c1-181a-08df31097d72
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6B8.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7911

Add the ck_ker_usb2phy1_stp clock binding required for USB Host (USBH)
low power support on STM32MP25.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 include/dt-bindings/clock/st,stm32mp25-rcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
index 53c65e9a12f6..1b0492ac31c5 100644
--- a/include/dt-bindings/clock/st,stm32mp25-rcc.h
+++ b/include/dt-bindings/clock/st,stm32mp25-rcc.h
@@ -393,6 +393,7 @@
 #define CK_LPUART1_AM		371
 #define CK_RTC_AM		372
 #define CK_SPI8_AM		373
+#define CK_KER_USB2PHY1STP	374
 
 #define CK_SCMI_ICN_HS_MCU	0
 #define CK_SCMI_ICN_SDMMC	1

-- 
2.43.0

