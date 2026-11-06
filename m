Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793979361;
	b=CD+Gqjpqfrieyk9AkfzS9qukDm0Nj+BxCavGBVSaLLZACLR8hLrwcOtK64ruwtHOCr0E
	 96d61dBC9LM4/oUwoN1DYLKOQHPHZ4Iao8oBcHXMqQv+Y3kWAd+TqnMpZ2ikY24OWBmV0
	 m9iRnW77i7xZmEbK5MOjEJnsMrET9K3A1l3mmsvLk/m9FO1qb3HZCE5LBle37SX1dRoDk
	 uHsftJUT9u/k/Jd7GTlN4Zd3ZWyZuWcpxoBciZWONqEfZWnnds4PmpctDSeCCj0rosKcO
	 7rlXL7pv15nMm8KFuAOZXhCsaTVEdio6CrHxf7ESXNxTrGMIRl00v+kUULpiW2KZUPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979361;
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
	bh=x+x3myP3dhgp56Q/KxWhhIcXg+i8PROVfJPxptEdG3Y=;
	b=t47AuUBMUkRCukRJNHLO4L9j+OQlQSyq2iR8tQVIsXgy6f9BXhclyFgZdhiXbsi5WE7/
	 a+zKD1mD0IsxC+9kf4PY9h1MFSF5OTUtppmTzZYCuJT3nr/1SSurkTfY43/X9MW48ORDW
	 0xj/553fqE2RLtpiN5VnW9OA+Jg220LUH8yt6Ao1Cv1pH2+rdJFpPSFHosDEamoSdDDKa
	 Dq1s2Rl4DfCmUDOGLxoF7Fi0oaU5uZ9hm84pHy+AoP8s2A+PQ/0dKXmnjG4Epe/YGYNK6
	 BNDWfqRSL6E6+KC34IuHjbKFp1YsIgbsMxsyFic+StX6Q5/hIYxiqUiwo3clpGL3iOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.14
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010014.outbound.protection.outlook.com [52.101.84.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA32D606A32F;
	Fri,  6 Nov 2026 15:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA32D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fz2xWbbhWsQgho9enBmnfttGcPn5Tx7k4fZQH/xFSuTfzJPtCmuZAAuj+BewkdkcE//zzLbZ/RQDKInImG5XHolDKM+2PfQSkkBAg2UL8dl7GCg/qBtgDiEP2iDf4M+PhvddSqYQh8l14nsVyCoc5yaMK6VnZ/5zjaa3mA3tcmJA762FbUF+JBs/TEltqApSfopZzBQFVnrI5KuEhB6W1R2kNNGDmDwtJd/JnXhREhNALHySvo+7EfmMr5MQnKmI0mqJovlHH18kKJ6F4q2Ep8PlcelVqJRYjQh6MZ8Zz5uXbx6cRYyWDkiBEeo6SqhkyISlY9FU0No75WsxyhTdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+x3myP3dhgp56Q/KxWhhIcXg+i8PROVfJPxptEdG3Y=;
 b=NAHzzQDZM4jAzzyy2/30U5RY8N87o0Qps+03ksbw7cay8iYhg8oOvGN0xMiFt1ELwCPn7JYWM62qp93JruVPBXW0E80IGkJeRrgKdVUqBDkf0Gkq1rDzsA8fxePQb8P0dXxrQZYkp1saBmdDgCeHbl/5SZxdJhsfH527/wFJvMOfM17qBXtclthcEhTzD/iNmzZ8NayaTOs8ocgvVKtFeiGfG+G2nISX9cjP7k8boB1SY/Px1Ql74+yIBdjNL7ox8MzlqBE74tjYSO556tRuywZCJAw/vW3vqpmLuXE4QNpZiMspfc8pkGOauMn9f8nunPNSIkcIaFghom+gZXMXFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+x3myP3dhgp56Q/KxWhhIcXg+i8PROVfJPxptEdG3Y=;
 b=msbo50dbgRPp6e9B0HvO++kym7KqDn7gJ9ovswTA0aZoj41yfC8zeIoO+g0e1tm1l8aSZ+PtZZkX7zuiIBQ5nLqRv5goOwuW8lS742cTPmdxSuqa3M7geUC190VOg3CHqaWk/p1rLvvUYxx3/bdrP1I28FU9pSTdzK74KWq0TnQjrlzMEMyXXnU00+mLdDqMws7LzergbDfPVEdih1e92WRek/kMSp15MbFv3f9sOMHS/9zwDJbL2nKkMS8t8kELxJBFE1ARkwHZwguYEGAhaIlz8flzsNAoA/dqFCMkjPjj559cPg4zjmxAw80MFMZu74sF4Y4sWpGqd1bw+l/GXw==
Received: from PA7P264CA0466.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:398::13)
 by DB5PR10MB402168.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:5db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Fri, 6 Nov 2026
 15:35:52 +0000
Received: from MI3PEPF0000848C.eurprd02.prod.outlook.com
 (2603:10a6:102:398:cafe::aa) by PA7P264CA0466.outlook.office365.com
 (2603:10a6:102:398::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 15:35:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000848C.mail.protection.outlook.com (10.167.240.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 15:35:51 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:36:21 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:35:50 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 16:35:32 +0100
Subject: [PATCH v3 3/8] clk: stm32mp25: update register with reference
 manual
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
Message-ID: <20261106-ups_mp25_clk_update-v3-3-4a32f68119ed@foss.st.com>
References: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
In-Reply-To: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793979349; l=760;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=IR7Qf83XRHd9KKifUWIA16iA5fTVyfnLbI2U7E5fr7U=;
 b=aYL8UWpyXjE+5fbIzRJVzqsBKK2YMgdgDM12RWO4uii4dkFlcc0YrCv290paz0JcfihQJj3A6
 k4iesAuR0N5CQ2Z/ckpACOSuHI3nzYpPF6uMb+RGMeIRatycfSHvrCZ
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848C:EE_|DB5PR10MB402168:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d2e972-e232-4a63-bc32-08df3c1ba3cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|22082099003|10067099003|18002099003|56012099006|11063799006|261102123227099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	hxuL4Lyt34Cfw4e+OH0kZiyhSajC/xJWWyKd2A7kwZQx9+EgfbNGP0oMoLhFGdLKT0+mha31bhoV2eObBHIQ7sthzT7UqH/2+wKtoWBS1+UUFD/TmTUlk5Vf8Qq77FF/nUDOFfSqsvDS4J98FMlDHL71WbODvgasQBxEg/m9hBpfeKqm5FYSfTYsux7qBxRDVqS0ZVpwUJOhQdx287OSDMEVOtcaGhSfA2Fgb46RJuqCtNYpnCGSqNw2+jHIfHSz6Gt/+FX49b54AbHnVOJcKdRyIu2kK5DNDrJ5q/whixe8OE0nEsjsQLONPbkMwwYb6ipR2buJVkulpqNU7PNH4BdkBubd0dSBLI4ah/vAAsR3nuLFlQBVmaeUWb2hgGrOLxFvd89bc4nD9aWTR1mTTmr28XSSz/f/NUvKa3NZu8mSkaJJsNcMoUddwobLRsDfMBPgHHpilNDE1By+tyR5gVAZl73n4BnfKxEC6iMqn5kJNonvv4m2EEbJQbzJ0sn+ujE7UaDuehTdr6g7LHmz4wUh+ucbpjMUi2X1phIIgnWml63XfMx5iUMQIEHy8F2HU9cwHsn9f9ROAS9xBQG5AroPExUqowqYh6YzVvlcDp3Lfc3DeoIYFvYd/VdVobXUSj6cv9BfXJCIpMqDFsoPG9q8a6gE7qw2tS4h7eXQoRGveDWtxcsiWWFInUbBoBd7OwfDmwEiUZnpLd7OPdHR3w==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(22082099003)(10067099003)(18002099003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bIqLpkXpLDOq4zKPFYa1HcwZSZ3q6vn4GX97XTwpELY+s6dAeY12coCZA59yY52yn2XPafDIi6Q6tIEqK3D9JVdXPKn0TX3DXgpTL3ssIcY2npJzwOmgXC+0vHxAi/U4myCEXuVVISSnY5f/oZ0x8ZTpuVV3+bfN3ZrgPPtQB1cYwioyGEpHaqve0Coq6/QeF88HZcsqoGvlFpiY35snhUi+eVycop751i8Sr/s29/xz3iXgnjZz/h2enlnspKTGGHzVlD+EMZo/yeLXwfT18Cc3a0dOnLWGck/DPcPeMPDUsXO12UphnD8yw+Vddw4ZHfORo0jC0kybfVg/Q15RiVxxlGZkCHyljWVrmVLkkkC+ni82Zk1Ka0IBt8POUrNoFcZod7ZsARTZFw5hdGZVNr5EhlgdOQiBjJWWe5AeflrrLpaMUVyD42sJzDZfahwc
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:35:51.9052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d2e972-e232-4a63-bc32-08df3c1ba3cc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000848C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB402168

Rename RCC_STM500CFGR into RCC_STMCFGR to match the reference manual.
No functional change.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/stm32mp25_rcc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/stm32mp25_rcc.h b/drivers/clk/stm32/stm32mp25_rcc.h
index 687bc6a78627..421c74dadf8c 100644
--- a/drivers/clk/stm32/stm32mp25_rcc.h
+++ b/drivers/clk/stm32/stm32mp25_rcc.h
@@ -319,7 +319,7 @@
 #define RCC_OSPI2CFGR				0x518
 #define RCC_FMCCFGR				0x51C
 #define RCC_DBGCFGR				0x520
-#define RCC_STM500CFGR				0x524
+#define RCC_STMCFGR				0x524
 #define RCC_ETRCFGR				0x528
 #define RCC_GPIOACFGR				0x52C
 #define RCC_GPIOBCFGR				0x530

-- 
2.43.0

