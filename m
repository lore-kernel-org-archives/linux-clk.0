Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.107
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793796630;
	b=ibGNQE167OQe0NWpZAt7PWDkXGoS5pSegP4J50wm9wriCSqNTTnAzYo3rdwyk6hh4GzR
	 LO3dJGN7efZvhbbMj9qNlRLGk9Lk1o3qkr9B3sCWC/okQYdU4PBAR7u/SaNUYMXAxkUYc
	 WrzIdSosbiXrJZZC6QAWMqW66MUn5V6+EnHQgbujjZHUgF+u2utcp3zq9bOZqyrA/E8Na
	 j8uPmRjcP1jO3yASMhbOpRiZ60x1/5OxN+bD8Rnc5jFoSt98motFoAbehL1X4wEMwH39h
	 Uwx/dJHmo9CckvK3YHKXLFczRE4eTk6/ropZAKuWspShZX+fexn+Vu7vk8KDTEWbGrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796630;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vVcNYcU/AT2kNVO+mwby0yuY6ThYwX6Op4c85Ipd3hs=;
	b=jaAqo4yQuK2diTboRn7RFDlUcWpfUl7LDYrmqV8ffCXtwR2G++vDNvKdZF+ityfZLGNR
	 cNqoc8kLFTAcT7kdI9rRkwlFRr3Kz0+i0RYgE7eatLZ3Y6QMhAbzwGUIdN9BtRA5Cz6dO
	 yjr3URvU1oXbgLhfh6Gy94HMS+zNmSiYxUDtGMnfNlP1f0qx1j3XWS893c78p/bTYEu2j
	 6tfTn9LmMMZZKAURG+zxZR3QEJltzt5/VF4jos3SJ1d9sXonqz/hIJYaLyOUSgvA/vejh
	 5LxC1Rkc8j5YwXpz6Awvh3MfFSc7qoniHJYnmLcyl741Fq1nkf55ruIHj+DYt+GPqbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.107
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023107.outbound.protection.outlook.com [52.101.127.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F96606D812;
	Wed,  4 Nov 2026 12:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5F96606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgpJVad8qkBGRH6GBxI5Z4vRti7ysxgzxMfuD4Cciv79KgxTFESgWNqasCP6wqv3KBvUVGM9XYM3J/YQcmTIXfmT346BLyH20NMmDNpw3DOp3ecFV3G3c5wmEwW0C3o2ElnWtRCaMwmfWJSFdgLAgs7YoYRkrdNrR1lGop0pHlLr7QvvcIQPIq5znFzECZHVqQw1xSyhWJWEfBn0nlRArMF3abaIo+s0Z7KGvCMBPddYoTLMP4r67GOrmtlQBpqup/5E8N1Aoi2sM6vOOGiGwVgPFIhX4OKFEa49b1KpCqYPPw9FjRKnxgREsj9hte4yiAHu14oPW9POa8TTmngY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVcNYcU/AT2kNVO+mwby0yuY6ThYwX6Op4c85Ipd3hs=;
 b=y264b6HMwG/MZCjGm2t1ISoxU65b9cbxv4wI+PiAzU33OF+bxstS0FzgB4EqtFfANdY0S0pZk8y9Aaa1Kye4gSlBkmdv9C9rFkpLPvcqDENmpOWm2ipuwd3EqvXxS3yPLI4gTnJAOQJE1GqqfvLzLhfkM34v3nFMPEZuABRCJO5sAvEEr9dMhaAQ//PI979mFuBoa/BNJhV8G75fQFKH9j+nED8Y8AvEOUqQMFFxK2wVG+OjUyrVU+9xiS3sfJBskUZvwjOjdN/TWcKcZBwI1wQu+Q7qe/GDsBT3FMLRUlFcTV2gZqY/17Kjf95BSd6NeZY3yNf3cLECesJl965/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR04CA0018.apcprd04.prod.outlook.com (2603:1096:4:197::9) by
 SI4PR06MB8922.apcprd06.prod.outlook.com (2603:1096:4:2ac::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.8; Wed, 4 Nov 2026 12:50:22 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:4:197:cafe::3d) by SI2PR04CA0018.outlook.office365.com
 (2603:1096:4:197::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 12:50:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:50:21 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2D10A40E6389;
	Wed,  4 Nov 2026 20:44:40 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com
Subject: [PATCH v2 5/5] arm64: dts: cix: Add the Sky1 AUDSS DMA-350 integration
Date: Wed,  4 Nov 2026 20:44:37 +0800
Message-ID: <20261104124437.296753-6-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104124437.296753-1-Jelly.Jia@cixtech.com>
References: <20261104124437.296753-1-Jelly.Jia@cixtech.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|SI4PR06MB8922:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bf572583-df46-48fa-ee06-08df3a723033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|82310400026|376014|1800799024|23010399003|10067099003|18002099003|22082099003|261102123227099003|56012099006|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261009223027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	l/T+2e0C/HFRDZ4RUjMjepDz6VzlVfdQDSwQ/lT6VqbDNIr2KGE8hS3zcI81vlgkY9upujgDfvzMVYInZVjGi+aQQBNU4vL+ElCoV6IaNC4fxzBk/BrUt493Cymeyg8nHOVDrfnkN5xbP8wXjEH7txQs9SfcnmAyjfNPIHiexS8MsVYFe+TD5ULwMOtp3y5Y0lzSwmvV2kEAfthYC8QNujr4kyQDiWH3BSNv7OKC13dG8he4e+otDDoOwRvzoGxOhseVT8ZHZMMUBbgyWUdj9GjJcDmm4tnFHpZ1NhZQvFTXJhabeqlnUjGAjKK2/i59FnA1nQhSi2OpRRE/AEVWAjf7fQVkwcuRARYjbqBWu9vI3WE4kGwYkxCufFTlGfvoh+qJc42evhIWzL3VRp3/hsiU6eusAhvGmqDpl922fW0Wc2fNdFIhv5eOGrhfgCwpLZRVhvHZCXZz6bSnzTCZNIJgLXBiPNI9I60/Txh4moPn4+5yPsve4cAwMQibYnpQikVeYLxW50mdFMmnqPpP1KqRCS3XRbHjME4TcPT6sQ+WVdBRrr0CSbIJ2MjQIWFrEDU1tNkpjBlpO2REY+OeLzF05BlTo3Va1vcHswsI4pGza2G/lCHUkLYK++AYbm7Dsqhi/40kB69BZtmK4d+jMSJmHsPj2rDBkxfE7YsMDXtx8tlCTIwT/ip403+3ZQK+QWmqnJC4m2uSwhQdQnJRtQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(261102123227099003)(56012099006)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261009223027099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IWcDXH+zRxQyHdv+Tdjmgz9hgCmEQRnlWMBGg+PsmWqbU7hCUvnBAlgVt6SO9433wQQ2XItASnGTKD8uh4TzyjL7ha3za6KPoz3jcQWDtfgYaRvVC246qPbsSxf5Rj1XlIlQz3D08RsCtr9YlgsbJTi7++oiqWkj/ZHU+semr7xo0SRoXca1DW0KKyH7l0lNdTceJ1eLGlJWg9a1vYrw0KXQmo3LnXaLzxTJehZvt2lq+c7untqS8I5xXWbbv7jNtRkkpjGEHIPGQItGY73F+vInzQJeIWQoTiRhwRCpcfCx0aK/xux4dWorq5KidrN0xKYRS3YmeT1gWiOhNl+Fg7pHIUa8SvtoOUI+g0Sk3CdmU6YIRJZO6WdpR2RwMmH+uvMB9NJM9CBYIn2q0yUwy9QaZkD0YG8GF3+Sage/OdUMOTMGjRjZHHEh/xcy9Pk3
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:50:21.7605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf572583-df46-48fa-ee06-08df3a723033
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR06MB8922

The AUDSS DMA-350 master sees the CPU physical peripheral window at
0x07010000 through DMA address 0x20000000, and DRAM at CPU physical
0xc0000000 through DMA address 0x30000000. Describe the 1 MiB peripheral
window and 512 MiB DRAM window with dma-ranges on the parent bus, and add
the controller's clock and reset.

Route the eight channel interrupts through the AUDSS CRU, whose AP gates
combine them onto GIC SPI 230. List child interrupts in hardware channel
order and set dma-channel-mask to 0xff to make all eight channels
available to Linux.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index cd498ee7e9a7..6ca94f606463 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -588,17 +588,41 @@ mbox_pm2ap: mailbox@65a0080 {
 			cix,mbox-dir = "rx";
 		};
 
+		audss-dma-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			dma-ranges = <0x0 0x20000000 0x0 0x07010000 0x0 0x00100000>,
+				     <0x0 0x30000000 0x0 0xc0000000 0x0 0x20000000>;
+			#size-cells = <2>;
+
+			audss_dmac: dma-controller@7010000 {
+				compatible = "arm,dma-350";
+				reg = <0x0 0x07010000 0x0 0x10000>;
+				clocks = <&audss_cru CLK_DMAC_AXI>;
+				#dma-cells = <1>;
+				dma-channel-mask = <0xff>;
+				interrupt-parent = <&audss_cru>;
+				interrupts = <0>, <1>, <2>, <3>,
+					     <4>, <5>, <6>, <7>;
+				resets = <&audss_cru AUDSS_DMAC_SW_RST>;
+			};
+		};
+
 		audss_cru: clock-controller@7110000 {
 			compatible = "cix,sky1-audss-cru";
 			reg = <0x0 0x07110000 0x0 0x10000>;
 			#clock-cells = <1>;
-			#reset-cells = <1>;
 			clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>,
 				 <&scmi_clk CLK_TREE_AUDIO_CLK2>,
 				 <&scmi_clk CLK_TREE_AUDIO_CLK4>,
 				 <&scmi_clk CLK_TREE_AUDIO_CLK5>;
 			clock-names = "x8k", "x11k", "sys", "48m";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&smc_devpd SKY1_PD_AUDIO>;
+			#reset-cells = <1>;
 			resets = <&s5_syscon SKY1_AUDIO_HIFI5_NOC_RESET_N>;
 		};
 
-- 
2.54.0

