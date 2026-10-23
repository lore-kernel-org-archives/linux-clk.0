Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792773831;
	b=jhLOhHmqW/Sp0pjP64TUO19d3Xn14wASU7uD28O5DkSYbZDMTU/mmCY9loTek+wRJd8D
	 KQQAtyvdipcxJOCM6MXDB4HjfVB/TVx3O+q3hnLa4fQ2PoHI1w12h76aTokngUkjaGNCK
	 QR2cMZLzlrHjuGiLHnhynl5y3KYuy5ER3zAQCIkr2HpZNll9J1DDnvyEaZOxYHTojcJpY
	 i+9ZKis9T2FHfxQfasD5NoQwWjVmOhSIU3weAFRINdljgZlsj2d+T2NldWuv6sPbtd5Xr
	 9dYGyACNV8ZhufGZ79OvVTKPQxVFLxp5Z17GvEG8nhLWq3rP/jqxLnDORBXIqwUtK3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773831;
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
	b=EFDEFMG2R8J9sLaX6DEx0x/DZbifKCrrz8ld9emGRN/+dQHLedFk0yYTSITVu3A3PhkY
	 TwK3vChepBaCVlyOFOLkZByG88eqsSlnyaBuj4RvHfLyo1n/zXrdPpp5dbb1nJNBgKTcG
	 w+3UJxQzy4iGcmsjRXitw77B70kYmL5+rQW6ywOY/ySnVMSBn+qNeGPiZDQKA4Hg3UIIM
	 d9vPqZspoKTVhCZKCWWmngi8vK8bvXX6SEqWIq7Ykp6XP1En8WMz7qI4gL5pnhdc1N0IO
	 2m7pP5GFJV0LBLISc/ICLIcmdWvHJ+eaZX1Pk10qTbxd/A+3XWAApzkGgaeIR9hUavQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=l2RDBzsR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.3
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013003.outbound.protection.outlook.com [52.101.72.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F180D606A31F;
	Fri, 23 Oct 2026 16:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F180D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=l2RDBzsR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiCkpvJRcww1eI3weDuxu7Nc+hS8hMWYlYiHjY/KQ6e3JgB4bK3nIT7ywDEf44wzPDCuvTJb6NMV8oOtzF8gwb5ARYHJLkvrSMOAJd6M4TZR7XlhlGFnP97QOiffnegtY/apxaFCMHfwLkFvvmx0QJZYTlvq1/FKVb2zLoOKLxg9/dmf/bO73SqwaXBUG0MYXE8XhXN2xkedScvOSYH+XhREBiiB1GyzxgqvKcxKJIc2Bm0gr+LW+QdHvoEfXkgZHP8yFpT1pB7gWzhsxxN0CbGQvPBaX0uXSttS+/7UAwbbQcq6fC2TY2PFRgftoD8bHlQ9/SurdZ95RWv8K1QFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byrIe/i/ovNOTBYnd6dtCoSmve/s1vFKaUDDoCan9KQ=;
 b=NDNbUdV9bYSy2u7ZbiZU6ne2b7zoXJdk/L6DOqC1tTaNklcynPcmQxz1QWR0SiWt+usydU76//OLCmgakgUkcQvv3tVGPM0ogjN1nbj03M25jJJq9usinv7Uh5GDHdGZjSh6qzwMoKu0Q1J1/LAbMjO2DYA9MNlN59Dx/7jPuzaaiq5VwNCKFQa8oYvzGOLVFm+j/oWs0srtsGSJRI5mfI+h1xY74Bv9gJoezS/n98AGH3SfqIsKo66TPfpWhWfwtasf9Y+j7LTOuyj8OkBLvDCRR6i9s9kPDZOCa20UHBStrHTJK1GEmVSnzryD9ijA0gmaeUm0N2qbZwDzyQUUNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byrIe/i/ovNOTBYnd6dtCoSmve/s1vFKaUDDoCan9KQ=;
 b=l2RDBzsRkhmJ6LZbfvvXgirj8D0AxeJcJXEiNtY27PJLxvW/JkRizqIP73zxPaSV0Bcuf/jT71yrXZ9We3V1FkZH0NwOHH6O7wPLj4WSEnTqvMT7FfS8hsegDJCtL7NyiRm6Ujjg+E4rgSXQjP8WyWYrIXJmRCEjOTpeLiyj6rm4q+NVbP2zmkWr0LxtDjJNeOanWlTQ/+2r335XaDv0PE5lne1x6Afo2h4x/5eCa1hCKMT7tQftjDRu6D3JkJehIQY6FKco26mLZgwZjfTa2uihdU9ccWGQ2w8vbZ3LRcIF4niCCd9SPVs52QxjdRCg/q7idkPlbePoLf2o24xQRw==
Received: from AS4P192CA0039.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::20)
 by VI0PR10MB9378.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.2; Fri, 23 Oct
 2026 16:43:32 +0000
Received: from AM2PEPF00070CF7.eurprd02.prod.outlook.com
 (2603:10a6:20b:658:cafe::86) by AS4P192CA0039.outlook.office365.com
 (2603:10a6:20b:658::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 16:43:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF00070CF7.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 16:43:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 18:43:51 +0200
Received: from localhost (10.252.9.175) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 18:43:30 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 23 Oct 2026 18:43:22 +0200
Subject: [PATCH v2 6/7] dt-bindings: stm32: add binding for usb2phy1stp
 clock on stm32mp25
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
Message-ID: <20261023-ups_mp25_clk_update-v2-6-398d348ea8fd@foss.st.com>
References: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
In-Reply-To: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792773804; l=730;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=YXKaTH14Rb1TWwlpLXpat6SYw9nKtCC+84liIfn2020=;
 b=kNNfF3HADBAPYR8Pqk0g4/qQ3yCr61jm0ybjxDlyKDfNjoEcwmQHWo2HNGPBSFg+DERmgtKm7
 pli4G4ITDizAsX9ZMUwLAUbGcpxljNgEDI1/MpTwgXaV7ChiracUenL
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF7:EE_|VI0PR10MB9378:EE_
X-MS-Office365-Filtering-Correlation-Id: 77cd0c2b-311b-4bf6-6744-08df3124c5c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|23010399003|36860700016|1800799024|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	VGMBYh6nEfIY4/Gjd+fWI/fyiaDaQppAetTVIN/LTD5PH43g5fi6TactYukslVkuvtVe1ZGE8sgg7eUN4+zAP0djeOV0ABJfqZa7SPqaW1rx6hut1XUw5cJaLobNzv+qkTTdjJLDO3I3SfOW36xR4L+YG6NmmL2LOqeJzwdctscu9teSzDMZ7Cjhxan12Pc1kGkealdMfL1v/YWOZk07rUjgeH0wF1lwl3R6bFjsZd/2VlCBUnURKyPJiatoy7HU7jKRE30psh99WceXBgKQ5g0B4zPL6jC22hTh1THqFu1YiWUQ4tcSP1NzWdtRswJWtDaSpZW/kS9dcUdEv+gvX81LfT/Ep3KQO2gBgPpMiE4qZ1LPgP2EuXdAV0QJDxph0CGRI/QNTttfkUX0P0Qk14FAKBW/qJNAXJcSnaYmL+bZGS+u8KDEDaN4CrfmSNARQcejtI9citWyZLQofJ8Ewsekke5y1/jpPnODCqSFA/VYtI/zdYugBAarh4OY5LwIlgTyt30l2vULTZQ1ErW83ZLqyuQc2/rDuojmQOOEt2mpfXdpp4VGZ7fuhPvjES6r5R3QkbPMcd8WNzfRoeRB5Je0n2owwh/N0XUt7VkjB4VpvdJDAG5TRg0rNu0Qez59eWNQrlw1KcfiLjzdzbMk0p4Ky+cHmcxReSfWVpNf9mkY2byCQRrJPRxpZVkPB4EMQXjxVh3BbI4Fol4oeNxMww==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xov+iOWrSZCXf7Pp5pF7mGOAFfoHS2AUsLJumzK8dbiFR4TqZB3+uoDvn6aJqICS1523hmNFweCh6j6z4Uqfefbtj8SS/7ThJw9+RPrXeqe7XK5U73S9pEUUYlKVUfBf2i6SqolV8QOF2MyKtgaXyC2T1q+/AClVv7gsWUJiftobe+YcEM6J2hTMXOOLFG42is8wvJ4XfYCS4A7zpSdsdACpGe97jetd8lRQz0x2m8GJfsR0IXnOsIXDUyTgaqgtWKIAP/XD5sMC29yyUoN8DyQ6KZKu6uVP3AoiPIHFfKRo+K7kC1KjLTdqbKTnbK5WNa2bS1OUioqX0A261I8QY0rA7+N5yrRaFTvPu84mpAiYPI6fJLn6cd3rOFe350pQOPdV3sbZx/aIAP99+vcvZ32vq9sYumgU8qwpYYDWBvDspDKb3iJ2v/zWgD6W8FFi
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 16:43:31.5718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cd0c2b-311b-4bf6-6744-08df3124c5c6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9378

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

