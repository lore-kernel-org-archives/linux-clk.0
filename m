Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792762101;
	b=UPgt88T2SM+9cJaa50xrw8t6JXWa7CPlOdOEcv8AW/eAzZqYBIxiz+VpV4iOC2q7Y5BX
	 Nc/e8aSt9Ku6JU908uFZf5SlMFTtv8gKkcyaqkML0WBv6Y9CWFzGXIWhic6QWpsC3IUgn
	 vA3oiSU66G/kod3VsKMHNHqnbQdUcvxT4M0CP1ng9Tc37CSYZxo1a6VP0h5lzPMbqCChQ
	 SyWoddwLhrl1hbKzLH+g9sSFIXkYHzx3Jzgcn92W+DenjlIHtAuEWWOlU1DLGwXdu+mRu
	 Q/4b6AMe5OSXV3X0Te1cdVd/Ja6T5wSUTxpJYUScZ2uO2wqkzDJ6E+qRl+CKCwaBDJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762101;
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
	bh=Mnn5AsKkjp94XmpX7dcnWhqml3DxncdwZQGx+aG3d+E=;
	b=pSAyEH60yqAIiwJz7fYuJnGyk2PObfeg0ij/pAZXlUJrzqnRh3Go1ZdPjcVPuzsbbyff
	 KhyM465pElVdWrAo9tDfBdY1uwcp1pqfzSqLeslg1m1y7/DCNRP7Dj91wyfT3qg/ei2UT
	 gkoRL0auo9ET24aLYOeq1ic9pBHiMmiX/pcMMQRmZoLMUEIWiZYes4bohW9i9rtBuFMWJ
	 3uk772EDFre/sGacH9JWHfFYPNnzND3R8d8xKLc9+YBqT1WsEcOMHRf3fQWsyVkeDNkP4
	 /LiVhg5HpMo9ktIrSCBvG+ysLWNhh8peerNoBvDvNOiHmdnzNfU8N2XkYFpfexbXS/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=mqMhigcX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.18
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013018.outbound.protection.outlook.com [52.101.83.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D5E606A323;
	Fri, 23 Oct 2026 13:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D5E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=mqMhigcX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2yAMm5XUvz6lJcjG06Aq1F7yex6Ijyhg2c/6BjaMdT73QPG1PviAghuhGSuNpVQc4rlkPh4FB4ouBeU54/d0eYTbyWvATGWeQgArV0QKVfPq/YRkk1cf9x7KPJJs4MFEi6rMK8mt1JETDc5ldi4xzpkbXD68rm4KjcxTWAfAJaWkpRiQNkPrTzg2VI1vysonumorVd1wbMTSLgulMZaUNizoVg2oz3CkKVRg68R5znfgzLT+M6A2c0/Z8JePS1xXzx005gmYkI/UZ7CXeVyt8gw2mnm67e+YLxUzWHchR+GsfAN9BSP/9mU3TMgMxeTGk1SfoEIDj2qu+D8wOi6vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mnn5AsKkjp94XmpX7dcnWhqml3DxncdwZQGx+aG3d+E=;
 b=n6TgXkscPTF3CBla7XT4uLPBK6ffoHg7V31ajtUPxLp+ykZgT2/+jpZq7PfZWI/am9DsQ+4mL8pJ2RwO9YuOQReIOToNkqJSTCuYCAmr5/1TjikB7ObnzKMXp3sr99DwoNGu0vVtS1SKRgGaQgXaTnEEH1lOycnuv4Opj/KPY88E7AIXPzpfj4uZ8OoUj82cRW05Oi661Nyn3JVGIvcvhgMAtk+psnxnJgHhb49d98f2A3T841Ns1pv07eTWLs0jFMJbbNKizlBTWl2hIursKUfPZGV4ssH2ZqgahL9N9lEwratkkm1+QwMe0u3AY2YMm1yYOMMvEDE6ZeY8Rv6meA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mnn5AsKkjp94XmpX7dcnWhqml3DxncdwZQGx+aG3d+E=;
 b=mqMhigcXz52rYbmfRtVRhehoxpCkCeaoRNx5xekVWw9bSDt9ayHZX1KC8gVAhnHkOXW5mXQt3mYWVj2wkQ93DoCBbYV+kyrSAv3BTV+lHOg247Nm2q7fnTFxk+daXmMl7B9LC0DgccBhio0SSP/Myd6jM4bsSOEA6PCcdJwubsdadB0up5oWX7kN8NOkwLHZL1hvItdCWVw9YwgU1cWMuw/mOvwi4OLi4unsWWWJWHTl8uFQORjXKmZ0qGTvk8HQu4IwRxPbaCoPF4nsI06TvhoPWYs5wuTAhJGkxeRg/+z5bc9y1Tf0ZMrp/EkVkVYhlVmepMnkRXo3AeKuZHM+0A==
Received: from AS9PR06CA0071.eurprd06.prod.outlook.com (2603:10a6:20b:464::22)
 by VI3PR10MB035644.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:373::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.4; Fri, 23 Oct
 2026 13:28:15 +0000
Received: from AM1PEPF000C1ADA.eurprd02.prod.outlook.com
 (2603:10a6:20b:464:cafe::63) by AS9PR06CA0071.outlook.office365.com
 (2603:10a6:20b:464::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 13:28:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000C1ADA.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 13:28:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 15:28:34 +0200
Received: from localhost (10.252.9.175) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 15:28:14 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 23 Oct 2026 15:28:12 +0200
Subject: [PATCH 7/7] clk: stm32mp25: add ck_ker_usb2phy1_stp clock
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
Message-ID: <20261023-ups_mp25_clk_update-v1-7-e906e7a38cb3@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792762086; l=3648;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=+AhRabnDo2MOuethLXNTFERrr/TJJpG8wVLAlbjfjgE=;
 b=MFVIwtMbmfybJMX9CArjD6g3D/z0fktX08cyPvC4b1zpnBqx5xuJ4ibZNG5YuskJkIl2jr1Sp
 HVuQbqKemxMD2o9Hovbjn7lcsMJBukc6gTwaQBXPPJt6mrKG8HUvZON
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1ADA:EE_|VI3PR10MB035644:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e788e1e-edcd-4d89-dde9-08df31097e0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|82310400026|1800799024|261009223027099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	UDPWLzO+p1TRkdBPYVRiDyxPCC5Kh2NDVkVuNLrGOM84b6i3ck/dwbdaJ4ranwnRbcWZbna4OIodeNvb+/GRE2jFtaqxuoeQ1Ugz34txtPIpeqIoYJXpIzdUJCKUbA6JZhkdw85bKbjaIWPnJn/qBG+ntZ7obHwOszb1nntlQdqv62vQje7EgRNKE/Or3gOD3A73Z1GHcCbqPzGiwk90sREzE+tsD3RwR3ozO6ET9eh2AN1LNAPn7jUO1s3RikHixlh6mn8KbEeOEeWhrfYULHRigA8/4rWR02I2eMzXUAoH5iwpPCDy1f7kvfYuloxMxtikyeeuUPyEuXgFtratVyEjDn9a3m6Xs0PCpqeZsAEP55/Xi7x+k5rUtNo1JrFZsR5q48WBdbZ+E148/jcpD0JfojTb826Jyl6X+iAQDxBr6v3xL0RuUkLAexM8KmJREkXFgYh/sELcHqJTRUcm1efxkg3B9317uED7GUc9Qzp2EuyXj/eJsTkLTITce3fR/Mbs8cszjx+WmqgYGWeE/FJ6YtxrFGkWITc9R3bR0P/JT43beXrInCDcb/UZJtdsY+FYFdVDguneWyFj1suODfRDoeme8IzVD9Y6/a4yeWaUvIxOIq04fjNbpZJQtvRiHniNgKKppUW1HKz+v27Kb2s0+FUTyOF/Fm93fAwSzutOfywKxk76JMgWO7r+gD3PtpiOuo9gxQs+2d2n521S2Q==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(82310400026)(1800799024)(261009223027099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JIKB4lro+oRpUTm2fmmDvVgG4Ef3BEjpc0MPABYiH2Ks/b2Qa5mFYlv5bFSyfHvDM6uny2Q6JNskaZBm+kaeEl3Ae/IsXi4nI+J+braMYFjm4cWHGWTGHzWY1AdfUIYqRLL5nKkEykjhDLSEezWOa97L8pyem60/t9EhM+z9QBeEj8Yc6bfclzxzPiktI+llLhG8c7czN33HGTDo/muWY2a7SGPry5IuUXuZ4Siyy58RosFZk+vcXq+nQfHY9KWOLJDU0YtipnEmtzx6XGLbGLoggq0PCDOKHHCd6qysDjl5ybJxexsR44/YG93pyTiCDGy0TJuH4TqPx3irIhqoEXV7T7fvg6XYFa+WLE5ECqsGIbWR99vOyLeZXelwprs8SRQnHmyrR2hGIsw589KrDr5ENU17A38Y+CbHMvEEZdQejGUgY/UqaXqcJPmkPIgU
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 13:28:14.8347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e788e1e-edcd-4d89-dde9-08df31097e0d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000C1ADA.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI3PR10MB035644

Add the ck_ker_usb2phy1_stp clock required for USB Host (USBH) low power
support. Its rate is the one of ck_ker_usb2phy1.

Set hse_ker_ck as the parent clock of ck_ker_usb2phy1_stp to ensure it
remains active during the low power modes.

Update the number of clocks of the provider to cover the new ID.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp25.c | 41 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index a6a1293370eb..649af99680f4 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -18,7 +18,7 @@
 #include <dt-bindings/reset/st,stm32mp25-rcc.h>
 
 /* Number of clock identifiers of the binding, SCMI ones excluded: highest ID + 1 */
-#define STM32MP25_LAST_CLK	(CK_SPI8_AM + 1)
+#define STM32MP25_LAST_CLK	(CK_KER_USB2PHY1STP + 1)
 
 /* Clock security definition */
 #define SECF_NONE		-1
@@ -356,6 +356,7 @@ enum enum_gate_cfg {
 	GATE_USART6,
 	GATE_USBH,
 	GATE_USB2PHY1,
+	GATE_USB2PHY1STP,
 	GATE_USB2PHY2,
 	GATE_USB3DR,
 	GATE_USB3PCIEPHY,
@@ -506,6 +507,7 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
 	GATE_CFG(GATE_USART6,		RCC_USART6CFGR,		1,	0),
 	GATE_CFG(GATE_USBH,		RCC_USBHCFGR,		1,	0),
 	GATE_CFG(GATE_USB2PHY1,		RCC_USB2PHY1CFGR,	1,	0),
+	GATE_CFG(GATE_USB2PHY1STP,	RCC_USB2PHY1CFGR,	4,	0),
 	GATE_CFG(GATE_USB2PHY2,		RCC_USB2PHY2CFGR,	1,	0),
 	GATE_CFG(GATE_USB3DR,		RCC_USB3DRCFGR,		1,	0),
 	GATE_CFG(GATE_USB3PCIEPHY,	RCC_USB3PCIEPHYCFGR,	1,	0),
@@ -1635,6 +1637,42 @@ static struct clk_stm32_composite ck_ker_usb2phy1 = {
 					    &clk_stm32_composite_ops, 0),
 };
 
+static int clk_stm32_usb2phy1_stp_enable(struct clk_hw *hw)
+{
+	return clk_stm32_gate_ops.enable(hw);
+}
+
+static void clk_stm32_usb2phy1_stp_disable(struct clk_hw *hw)
+{
+	clk_stm32_gate_ops.disable(hw);
+}
+
+static int clk_stm32_usb2phy1_stp_is_enabled(struct clk_hw *hw)
+{
+	return clk_stm32_gate_ops.is_enabled(hw);
+}
+
+static unsigned long clk_stm32_usb2phy1_stp_recalc_rate(struct clk_hw *hw,
+							unsigned long parent_rate)
+{
+	/* The rate of ck_ker_usb2phy1_stp is the same as ck_ker_usb2phy1 */
+	return clk_hw_get_rate(&ck_ker_usb2phy1.hw);
+}
+
+static const struct clk_ops clk_stm32_usb2phy1_stp_ops = {
+	.enable		= clk_stm32_usb2phy1_stp_enable,
+	.disable	= clk_stm32_usb2phy1_stp_disable,
+	.is_enabled	= clk_stm32_usb2phy1_stp_is_enabled,
+	.recalc_rate	= clk_stm32_usb2phy1_stp_recalc_rate,
+};
+
+/* Parent clock of ck_ker_usb2phy1_stp is HSE_KER_ON to ensure it remains active during low power */
+static struct clk_stm32_gate ck_ker_usb2phy1_stp = {
+	.gate_id = GATE_USB2PHY1STP,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_usb2phy1_stp", HSE_KER_ON,
+				     &clk_stm32_usb2phy1_stp_ops, 0),
+};
+
 /* USB2H */
 static struct clk_stm32_gate ck_icn_m_usb2ehci = {
 	.gate_id = GATE_USBH,
@@ -1993,6 +2031,7 @@ static const struct clock_config stm32mp25_clock_cfg[] = {
 	STM32_COMPOSITE_CFG(CK_KER_ADC12,	ck_ker_adc12,		SEC_RIFSC(58)),
 	STM32_COMPOSITE_CFG(CK_KER_ADC3,	ck_ker_adc3,		SEC_RIFSC(59)),
 	STM32_COMPOSITE_CFG(CK_KER_USB2PHY1,	ck_ker_usb2phy1,	SEC_RIFSC(63)),
+	STM32_GATE_CFG(CK_KER_USB2PHY1STP,	ck_ker_usb2phy1_stp,	SEC_RIFSC(63)),
 	STM32_GATE_CFG(CK_KER_USB2PHY2,		ck_ker_usb2phy2,	SEC_RIFSC(63)),
 	STM32_COMPOSITE_CFG(CK_KER_USB2PHY2EN,	ck_ker_usb2phy2_en,	SEC_RIFSC(63)),
 	STM32_COMPOSITE_CFG(CK_KER_USB3PCIEPHY,	ck_ker_usb3pciephy,	SEC_RIFSC(67)),

-- 
2.43.0

