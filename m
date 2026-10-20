Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792489745;
	b=YQO5cWe/dAuOL1GppH6stQ3d7/TwYQF8zwcKoRb/kLWqINyz+XSbYcuJQn6+8rP0MGru
	 FJno0JFPFLSrX92uxQPdSRuYlMPb8/Zl7SbqSMGkqFznevekghwEX6LEKHkHWuI4DscEN
	 W6PrJTpDqh75ju9uesE5J43/zE1EdrbqmC/ipxI5ljSuMcNMLMyFTpw511/xG1uhqVVPl
	 sx5XOgBJCxeCvN67uZzXhJ9tnu+xoGzUInW54WaEM2cMvxVU+orq23+Bd9j0GtrLxcSss
	 VA4s092S/E5hwQGj+w/uisv6OOPwjDafeIF0mR4WEhlwN5Mxm6TBwV+I+u53oJm37KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489745;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
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
	bh=eAQMuCFqkm5Iw0rXx0pdSKd5pgC3Sd14wvjoDtrNkko=;
	b=d03LG/m6k0xDbnVrdHx0lpzO8e0I6CYwpdzDn5ycDQxp4uPA/gSf6x1Myh+KVzeAW86c
	 HWrgBM/Jbi2eTKDtKjuwQ9CzJVaFLnx8hqztC+naD4AGBI8qlJGkxbp5KwUHngeFloumB
	 X9MZ1sBDKhjXSih4wuO9cBwiUU3vqIbJ7BsNP3QJhJs5iLYQaVOM2IEJxSKMETArmLhcJ
	 89Awz0ExIDO+GfEzsbjEyyW8f4ysBFMc7uBDGqXlkUOgyuXAy2vh+Z6d58RfOVSau3ZgH
	 lD8prKVHaS8yzaWaCsl7ElJ9w06rJkHqc/6LWdQ7d0Y9dAUpIkwgEij6hWZbu+AkkxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=c02t5SUD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.0
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013000.outbound.protection.outlook.com [52.101.83.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76AD606A331;
	Tue, 20 Oct 2026 09:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A76AD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=c02t5SUD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUNvR2yEMcjm2YCbkw8455PGdDRJzSmaWlp79oo0lMLW4WxmjEPZHACriNVYdHdFssv5heZJ5ugw8BpnhsL+QR/AzkFkLPINGwkyeDPwV+IW3IZFrJNNi8bhig9GfVdlTbIVsIgcP4sSqGfR/X0eGAEPsrkxJxR560ckJR6qGHMMr5W+yViSl5CoBboxbLs45okfMpKVKlx1/cAUHlnecgzcvWnsvcm1AiajEcsDo0aX3IZwgEGQ8UVNRlm+l/RZ6M1tFRlVZni+/M5/WqkfGBaCVI4IuDHG7yLTumJzh+ZjaWtmzMgzP+wftv5BAFBIp4W6TGq+fX9SdYWeLp24FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAQMuCFqkm5Iw0rXx0pdSKd5pgC3Sd14wvjoDtrNkko=;
 b=KBtnbty0hrv2fCPo7TgP6KjhYzAxEguBufLmVahOVPfE5j7iaymDx1cycYA6y1aQwpvnkK28RTplMrvkoMB/kf2KAVu6cPXGgPgOIIBmVTsFOeFCg3EJ49zr/RrKu+LJ/XpioUuUukKFOFlb4rJQJkM+qZ0QsoKjry3mef0Ll6KRECCio/458NYZSyLZvYi6iZ1Z74++nyOdfkQl/aAtZo37RjLM/b2mp0rIXzqGA74lwtomez0wGSJlozdRKyniypA0WCAxhJLrec3P4gMrh4JwZDnN/Tph0hlRkovXa+z3hbPhWKfpyN9uZf7+Ik1YXM09aHnqS8hJs6T50pO75w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=redhat.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAQMuCFqkm5Iw0rXx0pdSKd5pgC3Sd14wvjoDtrNkko=;
 b=c02t5SUDdMAElkoqJMvgszhkqEPjAj/OU2+X6T+tlQ3N97licYtYOMMifSFBftAmurvzfCWP3KOyxeGbHWYROUtnKHUQg8iB1hlW7Jffol7wY5QbUB6S6/FA+2G/IwXIbdKlanJ80GeHx0EyfD0zppX4QRllNkh1BEKCzdUTjAAd3C+MWU3y4ehVd2SLucFZeeQfouuf3CqZ8TTjUK5NxQ6Oxx9EDGE9GS58ewTt9METI6YmsvPap+6avfipIOdw/8uVDnHqaLhIzqtdfFoPi7RZ7IF7hzBArCe09RTQ2m7GbaJbXzFejPQmmZDqXsIt99kL4DPkf9kyuJ4uGmzV/g==
Received: from GV2PEPF0001A32B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::697) by DU0PR10MB6852.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:47f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:48:59 +0000
Received: from CPH1EPF0000052D.eurprd05.prod.outlook.com (2603:10a6:388::188)
 by GV2PEPF0001A32B.outlook.office365.com (2603:10a6:158:401::697) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.406.12 via Frontend Transport; Tue, 20 Oct 2026 09:48:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 CPH1EPF0000052D.mail.protection.outlook.com (10.167.241.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 09:48:57 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 11:49:13 +0200
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 11:48:54 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH 0/3] Subject: [PATCH 0/3] clk: stm32mp1: add I2S_CKIN as
 PLL4 source and keep boot-enabled clocks running
Date: Tue, 20 Oct 2026 11:48:52 +0200
Message-ID: <20261020-ups_mp15_clk_update-v1-0-67da20111b08@foss.st.com>
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
X-B4-Tracking: v=1; b=H4sIAAQ512oC/x3MTQqAIBBA4avErBNGwaCuEiGDTTX0J1oRRHdPW
 n6L9x5IHIUTNMUDkS9Jsm8ZuizAT7SNrKTPBoOm0mhQnSG5NWjr/DK7M/R0sLJsa0SPRKQhlyH
 yIPd/bbv3/QB9jnLHZQAAAA==
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Antonio Borneo
	<antonio.borneo@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792489734; l=1348;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=A1qHQRtKEdraKSwbj8j0VQxnLx3MOwkpUdv/Y8I9eXc=;
 b=BgesUDmeoWS6KmKK9tu6+Ncq5Yyo0VV+WQ72AGK9K9/i9+onsRFJHI+3xU7gX31J71K8Z8mz3
 uv4tIaEiF+oAVQJ0fkGTRShR8Nrfk+2fEYjDmI02t+CzatOULxjkf82
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000052D:EE_|DU0PR10MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f082a3c-8abe-469d-22c0-08df2e8f5c4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|18002099003|3023799007|5023799004|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	kCbPlrzN1iYAFYuGuoQBYj9yZtPOc8hXOLLpyXGrzUtmPNDIF1j4pj4usrkirYN24Hd00o7NxBRFUqpGp+wgkzzhsbFwEgbpDMWqVzjTze+MOqwVnKfELk5UFZhHEhFya9fW1nSa/zyrzJsIrJ1aSqyGnNk2KZ2anDFobaBmcxozvRT6wCfpKjZsWu7OXlXKKuLZNov1c+bWdCG+RnP6Rsd73iO7sqt6iH+q16h9zgeqXwBcy0LY5b8K9SLsjf16WXssbp0EWPXBy5uiVyS8j3mgVDW88HZqTqe58gvsUGRnyRT663LaIB3MdZL/vjox74XuX2/4pLItU2dkdFCqpGnybRRZt6TuuwLHCysFpvDt1jzYpGhadWcip2iozoPasMIrxkCu0TE+9WSQod/KSvmqDJDqoIHH5YnNr0zWr4Bo+kamtP4QH9bCfZBnxLsb13nDDl0D28x9cLSlnNKA+hjXUtouf7YaP5myfK7v+nuOZZOXQ+FsuD/Q8VC4hyqCRPYG2xmWW21sXZrd+f74jrcGXOozDbpY94sM9fOVSNctcUHOdJU5I/6XT2heZdJqYkT5HE9M0YpOAopgG0mMKTxRFDRsJ8iLIU9WF8cZ4BPWI4wcN+aINIbtuvvz+UVAC9aZ3UX587CX+y27cTzmI7sq5jEDF983reTwiGE+D9gQowGCnGARkENKD1Hk8LSd7c7xgnVBm/uCy6Qu0iNzEQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(18002099003)(3023799007)(5023799004)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GkF1S5qkYwPoIQoUCU4NYtiu2+wns8lalOp9lHPOCVuZ+/9L0mtOUhECAx211dU4fIbQ3kCtDc4lURKyOGhs2rwme/JuHM/BQQycUaxum9jmZ35Qhnx2PPO6jVdzdRP3W7Y5xIJ9cBnJepkTUwt/J/DHGcrywOxGCiJn9aGyaLbkzBsuiH8uPTGAWFTaf2jC9kzuwCGntyIDXG5lW7K6pppVsA/MFOEYIA+Hiyp9BP5CMkREankBGc/oXTGzzODg1URnJNhSGjEmC9NSebqVeiBQQLuTlptxYmovR+oD93AdMy/jv0Vl8AYLdmOWtpYdiFVsK/CED+hX9kSq4qGa2dW3pcrY9Q5mkmpWFF/0eXpwg2VApa483kOanNNW2uT7DsG2FlUcupWSc0WVgzeP0+rxAx2w8A5YjskFuQ5QvLzB5nO4LHqTb5fbHVrarFX2
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:48:57.2769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f082a3c-8abe-469d-22c0-08df2e8f5c4e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000052D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6852

This series contains three small, independent improvements to the
STM32MP15 clock driver:

 - Patch 1 adds I2S_CKIN to the possible PLL4 reference clocks
   (PLL4SRC = 3).

 - Patch 2 makes pll_disable() keep PLLON set while one of the DIVPEN,
   DIVQEN or DIVREN bits is set. A P/Q/R output enabled by an earlier
   boot stage and not yet claimed by its consumer is unknown to the
   clock framework. Enabling and then disabling another output of the
   same PLL would otherwise switch the PLL off and cut that output.

- Patch 3 adds CLK_IGNORE_UNUSED to ck_trace, as already done for
   ck_sys_dbg, so that a trace session set up by the bootloader or a
   debugger is not stopped at the end of the boot.
   

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
Antonio Borneo (1):
      clk: stm32mp1: don't disable the ck_trace clock when unused

Gabriel Fernandez (2):
      clk: stm32mp1: add i2s_ckin as a clock source of PLL4
      clk: stm32mp1: don't disable a PLL while its P/Q/R outputs are enabled

 drivers/clk/stm32/clk-stm32mp1.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261020-ups_mp15_clk_update-5e5900c0aaa1

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>

