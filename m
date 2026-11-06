Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.126.130
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793928928;
	b=q3388vxCr0ROiA+atlVto0BoeS7w64uY7VSvl8e2MXUHsJRJPxra7iSXViGu/HzvsN1Y
	 WyPyddXMrx6SZDqVUchpthKId/CVf3NK5/XnmiEtk0cR1Y8IPG5NofG/XHtcL5sUPKRKO
	 PT9THtx+uMWe4X8ltmMpRWp3CQnyhU0nmx7RKsM2v77pISNg4kpxQjB7ykwHdFpFaScjB
	 AwO7JCUMa6wWgEfPEt1qXBFSROczb0f3102wFP0UkyuO5rBG1e7XEPT/LMlhdTRfGenIN
	 ls/uXw/ISPvC5W3MmyTrf/Ilqhzp5KrKtKHNoWeMdyQ52B0bmyhF7dzzstM8/4ALjCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928928;
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
	bh=9/Qx6qxUBJs47oWfsXb6FwWrl9mTlzB1y+GEf1YVQbY=;
	b=DPRCPg4Bybnv/dhkMdsGnKuc+mrgY3MiLwQ2grgKtL2yp8Dg+JvLiX23tD298b48H0mI
	 NHqYW5u17YeEFuKJSZ97qnVtZpKoxlwCEaGs2EzjvBr6rdR2slRonJElL5OIxEsDTvFFF
	 Yh9DnmEC+vI+t9DIPBLmVoW7ST+GtAK19WkhcPbWMNVkb4HxU5x9fkhYQniDhyJpE5+XC
	 IeTLExhvOpM4oT11YVj1gKNyzTeZ/C2NEQTfkz65vYmYR6PSua3onrWZ6L9LBhtCC9g0x
	 6b8n1Oz33gUqP8ANbgIgljLtNhf3z7up++Gr2a4njpgM0RAu+gmWW2+9qLRYzEOHESw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=fail smtp.remote-ip=52.101.126.130
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022130.outbound.protection.outlook.com [52.101.126.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A49606A337;
	Fri,  6 Nov 2026 01:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A49606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMWS9ov5tgPgbUCOoJVV4azAYB9Nh4oIXWG/fjS2c96kDaXE7yteT/Ck/ZGiPv6Y2SNHasVLfY+8M4hDAjblUtA+vECrkjDwdV20OY5BYsdz0IavuEajuVVubpScmMADw86G4wbrLcYnbEpu5f8FVO/SmsLA1PWgUHvn8UkRklu6TmEqB+IgIuOAg+Fsa/TC5W3bj78JJ/Du3l7R32UUcE+r9VVZUcS34NIOKNMFI5Q+uj0qZZdSDwdlFWxki7wPr/eOwTLHYB8CyAMDf+dT+Aid7m5/JZYVlHFi/EgdiuB38lFphHFsj2VU9ZnTwaDMSN4wfqIsMYiubLTy3y0rCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/Qx6qxUBJs47oWfsXb6FwWrl9mTlzB1y+GEf1YVQbY=;
 b=Xu+VSKC9TcoHoxH2XBshrmDPKF/wAveKPk99n1RoOQBVE52w9VF3sf4xtEQuHwES8KjmvIRT/Kva3e5agySp6JmJmvsHsEYufP14HK8EJyhbWIB9PM/+VR3yATyo0fY4fTNLWTx5rJxJ5ZqbgPxSBu45pjsN6iKwfla9xe44im6GStASDkAVZQEAbl54sX801kgDn068G8n7CzvIpKnhHhYf6eyzWpDJaEDQ61rWSO1jRTzC3aY1tPy8AqY7bn58BvErmve1zMtLRWZWDNFwyTyJIRF/cs9TEqH46LvRYeVh2BiM2OJGpKJIVFUvtMetOy617zHIe3zCVb2Pq2rb0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::22) by KUYPR06MB8604.apcprd06.prod.outlook.com
 (2603:1096:d10:8e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 01:35:24 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:300:58:cafe::5c) by PS2PR01CA0034.outlook.office365.com
 (2603:1096:300:58::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 01:35:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:35:23 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D588640920E8;
	Fri,  6 Nov 2026 09:35:22 +0800 (CST)
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
Subject: [PATCH v3 5/5] arm64: dts: cix: Add the Sky1 AUDSS DMA-350 integration
Date: Fri,  6 Nov 2026 09:35:20 +0800
Message-ID: <20261106013520.1134450-6-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
References: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|KUYPR06MB8604:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 14c296e6-33c5-4ce7-2a7c-08df3ba63a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|36860700016|376014|1800799024|82310400026|56012099006|261026121527099003|261026140227099003|261021123027099003|261102123227099003|261022105027099003|261021121427099003|261009223027099003|261028144727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ofpz+T/t8XMC1M4nMnTyhLkOPnpWNxsFIliHk0B184qC78MsbzR8sN4FTh3lZLEpvW45RR/WwkJ+dx+NyWCMNSQE8UGeqjVnwKKEKUiFXnHk/gqXIRtGekmr9Zi/9l+X4Z8F+S9eeh5qQUASvc8p/xOe7kNc1jHVeMsigWDxio8Jmtw/EbU9qGNxBIKX90fbBSrt5FbTfP5fhUrAXteDTW7VxhrwOyP/E6pl7HbpLsioa7dlP6+1eCDTb4YBVwttyNcQkOjWmZ/vnAqj8v5vWSrySyNLS91bfkjr7OBHs0u7+xO/+Xi0cIK17TQJrY/FTxHfTKM89DSmABdIEx57Crr93l93F6roiCvjEcQrkePKdj6BamTorzQP34YmSgxaZJI1NB6BAqN4OZVgqxbngWlt0N1Pa9HhfGZeZZy9XE/n71uEmMPPkMJ2aPg67Umzd6s29Jd2FxzlwLSHWBC0mggGEnO2boz8lzMfW2F94njNzONg6W+kjE1SQBez/3s+aobDgk6NNNX1pxAaBTtL0QVsvIz/znKLEPaW3hph+wXGHmMQTmzovkZgg9yEaP3xzmTuK3o2ESY9xapd1WEXVHxquyCHwG4n8EeDvT0lI6+C2Bq8ID5U0Clj/dm0GN0D2uOvd3U1jvOJ7yakVYEz6VHmaJlyCgylmtFeBQj8XBNn/Z6IVdx/eUZS89ixODYmH+S/2Zl2aA1JxJgq7A2+XA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(261026121527099003)(261026140227099003)(261021123027099003)(261102123227099003)(261022105027099003)(261021121427099003)(261009223027099003)(261028144727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WwFMagnphGl6wQrzRziw1VBLS+MbnxZcNZ5DsZAuby2tn66RelII7wEIs8wmNdclWRZHYRPMQuWvvPLvpc/x4xgcWUCIOQ9ISgn3i65ckE1z5Nqib73N/FTpdx+0aGfZqa9c1GPWDJdO2E62pnHWpM7DzJgp78XVrW2I7z/0YtaCdKkSRrI1ot3vGIhx1ja2Sc9R/uq/dcqdAvDkdH+Yiry8U2MnXYk0fr20UlXQS+zZq0sUpXN3FukCxqKFvex/pcRYydMjl7Za50N1yhkj3Mvxg3CzWgJ9+Qu16cWpeDkYQpXQ5/t8IDIvZitAvpvIAR/TJmo0tLtd6tc0VBaWjiAxdV7LfAwysRmyMlqwxHSRqfHn6gXzkkuADUWwffX1LINrUGpXd30dxgireRq1SLX/4LkVHYT4ZRE2TKr1muqt5CvaU60xJg+fXAJMkJoQ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:35:23.9260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c296e6-33c5-4ce7-2a7c-08df3ba63a76
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8604

The AUDSS DMA-350 master sees the CPU physical peripheral window at
0x07010000 through DMA address 0x20000000, and DRAM at CPU physical
0xc0000000 through DMA address 0x30000000. Describe the 1 MiB peripheral
window and 512 MiB DRAM window with dma-ranges on the parent bus, and add
the controller's clock and reset. Identify the Sky1 integration with its
compatible followed by the generic arm,dma-350 fallback.

Route the eight channel interrupts through the AUDSS CRU, whose AP gates
combine them onto GIC SPI 230. List child interrupts in hardware channel
order and set dma-channel-mask to 0xff to make all eight channels
available to Linux.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 5399eebe8eee..513f56eb1b6a 100644
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
+				compatible = "cix,sky1-dma350", "arm,dma-350";
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

