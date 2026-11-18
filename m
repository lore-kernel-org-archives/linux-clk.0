Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795003178;
	b=AMaHaZQwZJUqILKVPtb1MawoTy8jcbQyvHgBZMluBdaViOTc4Fg9zp3a6B08SNLfNxG6
	 6csZUOglp1Giw26ce1fW/qGMvHRDdpcaEYqsJP3ikKn0IvQY6r8pwLgs5HLRxKjkfxV46
	 Cw0obTPBNVOTUQCD5blhme29jDf+BkNZR+gEnqQK2dbZE6f0HXLyzGuZpezwxmBGQWKIe
	 d9gOWQ6r6J7Ktr9Yz58cxd483wJALuWF/6sIJhVtIVuncWBwGfy452j2mlbglutWDeXeY
	 XCyYrIdaCCEd0b4wZClKJ9W+LCglq3B57IgWQhGrGpn7McHQq9lX9uG3O2zQqLVaA1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003178;
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
	bh=Te2tqa2UGx5NP0LT4yvQMRyrSCQPCV1I5I7fyIoBAU0=;
	b=vGjji2JWCy3WdRhdmBlLaMuBZmrUWGCn+9pKZbOiUZpFiwnta6Ny1LP9Le+9CuHuTnHm
	 TwO3dls7cwdN6xdVytj+d/7f8/ljT0f0C6UZ+AJ2SfCSZH80CycSCHTbPKCPaN9iBpOq2
	 za5tPIjjUmFsP4p15GA9inNg68GofBkytH8tSOPsnM9dSwK8wVcyhk5LzZt6P6I8zYfJD
	 R8NmcJuDFmH4LGjRYb0z/ZWuFpYRMydKzkNPz3Bj+Ic/+Ond4IPdBEn5k9jYfqkoNrJRW
	 4AbTbZ5miBI6djroem79Z3JWoeRpI0zt06v3thjF/Db902XULH1wQ7rDNQg08VEbTBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=jc2zj8hd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.51
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013051.outbound.protection.outlook.com [52.101.83.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0A660A3819;
	Wed, 18 Nov 2026 11:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D0A660A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=jc2zj8hd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMG/ao/26puVR5KwnabtVIrPkDRuFoiVQa+UXFdxCrHaXDTMPRpKSLeJ1efHkz7OAqUF4IuIfyrKHJuSu6JxA73hyIBqZ4Uy2cBayJ597K4u6Vtlldv9VU3mdjzc7VfXaW2IXU8fP+TxifzNBIMYemRXGc1AUmFkb/znTeEXxNBOHb4ecxbtAXnhOgCBpiL3WyIaHbra80QU7pbTx6Jj1hhtd0RRciPbNJPuQc7xQgXt9Qet89z/70P8fR2IA5f/nTdM9RvgZhXHqTIV8brX1zmtElvMlpeESY2IDwonvdaamB25+roS+xRqSEA8b3POOD3BB8lVgonRFnFk+60vhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Te2tqa2UGx5NP0LT4yvQMRyrSCQPCV1I5I7fyIoBAU0=;
 b=GA7l6hbTHv/aEcj8UlXLjd1n2yj3wUlWA6f1r2o6YBDV0sTJH83Ucm8NnbyKcmBCmyir6Sq395iJxXJ4IhZEPsIDGDo1K6xN6bytapfb6G4Uzzw2eTKYKG5H9iiLCv39tivhquq33XDBIeUsx+HqTf+Fe1kATzHmXe+t4V+Jo4aFLjOqxbrc64OPa2GHDNC3GT9TbmZDSN3u61004Agbn7PUajld8e6jdbKR6Jp9hoG0IyCP4JV2ezCTM0xfyu4Qd7U2Au262xUubvc0XtBFilOjo9F9CVj6xggJ0K7k/cKzv1jiJErFVxBg+RUZ/toWQZqMZ2GzpT0BwHAhtJlBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Te2tqa2UGx5NP0LT4yvQMRyrSCQPCV1I5I7fyIoBAU0=;
 b=jc2zj8hdWvOLmQ6BEvH4ZLe5Ha8z95gaKDnuvcQS1EKFKccWi2wLaerhO/Bz7nN49bbc84Pcr2amaiCgZqCXkbuzkyTEJ4DmI7BBoqHc906krwrvabYgxKTPyVYi+nWZFsr3QnrRIRWf8cBpg3w2Gz7iDxAg8XH+LKZ/O2OlIWjj3VqMhuyO0MaYZz9xiy5pImB4j7hAUaV118RnzExdgaHhBi7IHmwx7u5unNb7fEC5YDiNc6J/T5CwFtjLwTLGBEYx7xFiOXnm9KpzvE6YIIOJ9OnsiMR8FhbJlbN2RXwC11bkiKHiIA1hcvGGQ5y00QR5r4iVravWwBVDaSvKqg==
Received: from MA3P292CA0060.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:49::19)
 by PAVPR10MB7308.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 11:59:31 +0000
Received: from MAD0EPF000008B6.eurprd04.prod.outlook.com
 (2603:10a6:250:49:cafe::2e) by MA3P292CA0060.outlook.office365.com
 (2603:10a6:250:49::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 11:59:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008B6.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 11:59:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 18 Nov
 2026 13:00:25 +0100
Received: from localhost (10.252.6.76) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 18 Nov
 2026 12:59:24 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Wed, 18 Nov 2026 12:59:10 +0100
Subject: [PATCH v3 5/6] arm64: dts: st: add LTDC pixel clock mux inputs on
 stm32mp23
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
Message-ID: <20261118-ups_mp25_clk_syscfg-v3-5-935de791a4ce@foss.st.com>
References: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
In-Reply-To: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, <patrick.delaunay@foss.st.com>,
	<yannick.fertre@foss.st.com>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795003158; l=1426;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=tL+ZahkUamPkYRVwlsRuYKNAH4UOKfC+bI3kNfkpOTE=;
 b=Tg58s9Ia2zSrWKoSc0Lp8gnzKg5g9xnn1u3ihxIYF6gHKwzehydPnLtYd2SGPKxoQDQj9Yv1X
 GtxWK8HWhG6DS9f/UVFBTR9iGuYNChfEQmGtfmpQqWP3d3KsA0qxzIO
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B6:EE_|PAVPR10MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: b79ea3b9-b35f-4810-8108-08df456b67c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|82310400026|1800799024|921020|10067099003|11063799006|56012099006|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1OIQRJ89fY/Cv2EMt3DZ3lVNDBm4FZCLNuHX0O9anKiBba8UQG3ELmpdhFh0qa7yGuhz1f7hJfZlCGVK5/ApDJGWSidi6vz2G0SxVOYt2kLrdJRjl5k+kQ9/730JM7u+vc3RRQlva6d42ix0+FnXHOeUm7qVA68UEfPmEWYlufoO/eJV19wG1kLR3rLvxw5SRVILjek4CMASJrXhKz7yxYrlT0V3cpCofm4oG0EZbv2KeGe7etoI1sPMZgWkkHcwgDY6PkwhADGbSRcQwCxkIjKkwpA3cBVpmzw2+V1kPK/uZSiTKOKxGpA2S8AMEOeHOnb5tYUc/wDwQcnA85l2cuTNdL3fikqYqLWPSO10c177DLbdoPQlj1zNBxQ5gRb//YVSLOxQMQ1A2HgRkhiITtrG8HTc9ST3QRSV1YubHKtxtkhTfGll1s8CC5MLt7u+peOBBVTFyfz8qNJ2r3nJeLW6vY9AIhS+RSaqn3Usu5ilCJ4pgIutrDT+EAmk7BLogYI2fsl7RmG53bk1nMePyyFdqQ5x0WZD+wPTuRJDjEeuNMvIPMJz++Urwwj5pSA5IGprF0sD3WvrZpgt12ZaLyrwDDRtVWeIeHdT81dBwvoQffAZbm8EWqJCPmub5txJlklfoy5fkt2NXa+aQJfS0kM5lAbLFDakbEbCyNa/xzx052KI+Gkzn+qYs4p+h+qPUzzqf3LVoqObHbfHCPu9llEhT9a6E4pPn+4EikuQq5X0RYVNGBCZEEjt1L99rGZp
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(82310400026)(1800799024)(921020)(10067099003)(11063799006)(56012099006)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JEGhSBc77FFD0jcF8h1L3KAKAZYv0VnY8uZ2tlg2uhfho4HESo6qGPhwQXT9Cu1UrrRDPM8xy9UWX/Hb2hCLKHbUEhw40yJSZtC0yO5IcStel0AEa3nKKPLJRICOSH5lx0IIYDUTp93IMSo6mKg/9Fw4d6QXf8stT8yR5oQ7B6qeBS8mUS0su1sdG455jOe8bxgDMP6wfn/Q5W7TzK7416bS29C6Pix90jMfQWzFpn7i39KaOvqp7/xPPcos5qoVeK8dw+ZZ6dY7vDs/ltgzcJ9bg6KqWx3RwQKQ+69VuS67CYJqGRqvkcf4+WKojdG0pjk9AyVGPtK+sxbCmQYTMuN1yFx1KxreOSuy/x/woYlKSs29g5o+bp7rKsSNSWRk/9Yw2RMwQEDV7jPVQ0/GC5+MPjIr782++wFy3W0w/Pxa/p7QjthP75jFGSwz5Cfe
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:59:31.3605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b79ea3b9-b35f-4810-8108-08df456b67c5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B6.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7308

Describe the inputs of the LTDC pixel clock mux in the SYSCFG node,
which is the provider of the LTDC "ref" clock.

Only the LTDC kernel clock is available on STM32MP231; the LVDS and DSI
clocks are added on STM32MP235.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 ++
 arch/arm64/boot/dts/st/stm32mp235.dtsi | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index fefbf6f4f153..128b14ecd353 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -1121,6 +1121,8 @@ exti1: interrupt-controller@44220000 {
 		syscfg: syscon@44230000 {
 			compatible = "st,stm32mp23-syscfg", "syscon";
 			reg = <0x44230000 0x10000>;
+			clocks = <&rcc CK_KER_LTDC>;
+			clock-names = "ltdc";
 			#clock-cells = <0>;
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/st/stm32mp235.dtsi b/arch/arm64/boot/dts/st/stm32mp235.dtsi
index 7a87c344a4fe..d974f979330a 100644
--- a/arch/arm64/boot/dts/st/stm32mp235.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp235.dtsi
@@ -32,3 +32,8 @@ vdec: vdec@480d0000 {
 		access-controllers = <&rifsc 89>;
 	};
 };
+
+&syscfg {
+	clocks = <&rcc CK_KER_LTDC>, <&lvds>, <&clk_dsi_txbyte>;
+	clock-names = "ltdc", "lvds", "dsi";
+};

-- 
2.43.0

