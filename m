Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.132
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792747852;
	b=fthV0bJAqlBf5A7enZbHxQULHkajbMiDI6yT0KIwUF1ikvFlCF2D6j1cbvrTPX8UjNp/
	 4NzNbtv2j/7Ub3z/7o8zQwKu9IpiEnjHrJ5WejdpHN/A+TkQd8m2kzFiTvBuZQ6sFQgos
	 P3Vco/N8KCGyjmmpDVPAGS0nbC0Wncc16DWz9QJUpeYPSNnZewWz0hn8BPp/a1KS3gv6s
	 YhUrArWS8jbdh1tYVrOUV8jNYm9kZ7X9jXF7X9tLEGENj7OqKh61xuvW9kv1IBslRwexF
	 qNXvVJekDGHE8z5n5pQLVnqGezifXAglKWZFOoWy19ntk87trRr+ErP1EDQhWP0BUnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747852;
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
	b=BW50fpyUyH7vLLd1nMWrCZOl+ZzBXfRXduUBIbqAmGl2mDrlUUeIO8NEHSfy9K/LbpOP
	 eL1dVJ6gK48RTnt6zZGVr/g15uJJemzaey4zp4iqbMS30Ofs1aG+SvKsgyJEMvVvWvDvE
	 2fy0/EnSyZTRr9XRjmOPFLggvV+PqfujWmHSb89BL7kQVZHwt1dPzSPxP6FeCyNEnNzyI
	 X2DEhdk+VTUUl7MRALMZljxlp/fDtKp4roW5dNXt5NtgiOusgZng6AVs7VaGe8rVJJ0NU
	 MNqWMcbPsvwTQGy+uGioH5FM9QmZngwTisrJUIG2YRVbV5OTHMSzcK9Bu3lhSXpEJ9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.132
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022132.outbound.protection.outlook.com [40.107.75.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F4B60A3815;
	Fri, 23 Oct 2026 09:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F4B60A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XK4wvSYgAPgAevDX4hCkVMyc8dor24Fk1HBkOCE5BmcuEvEVfQj5yhLTCVXs/4RI1D9xhbzp2LTZCfzdRTBBvI269dwyMORYY2ucSItN45gprrc/4H1FPWQTEVKlFg0o09inL+DriDAC+DwDZGPMlaKBY4m1efloF6k+rsoYXx7J5BAR1sgzsHuaWhcN958/bWKlovXeg0KTFZC8Quup8PVZe40fXis3QGzxHeqM1eCjXgjYRwK6k9ZHv9V1mrHDP/bI08X+eu0L0sgRrBsIiVJCk/Q0s18lbNqyn+OSa7QqKhjmb6f7CtrrJRa12dvIA80uJYJtSupYx2GAG2MS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVcNYcU/AT2kNVO+mwby0yuY6ThYwX6Op4c85Ipd3hs=;
 b=ds0SIhF7eRfsG0FWRRyGzZbjMk6Uh52+QJ9yGfboCWB0+4Z1lAGDcO78/bKDvOn+XbeP59z3VlYoyXbTd6sWOHskSRkXDojgmIulxqenJO63LlUg3PyhFQX6BDP5/XpXK174jQwc9I0rGtBJ+KqY5lVxwhKWVf7BUCoVhetfua2+U2PW29oiOoB9vURQ5VfvRr4Wgo84/huDWRWQg7EbA2G/f4oF7zczDL8r5rbrQsX9++zIkjhSk8efN5xKHx3iJzk4n7b+oh+d81TgZ21i1I14Rg696jrznkS45tRfFDHd33yhO1VehSw2ZSSsi+NA5XpGTIm/Ms2eYwgCKjl/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SGAP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::21) by
 TY8PR06MB9176.apcprd06.prod.outlook.com (2603:1096:405:3aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.2; Fri, 23 Oct
 2026 09:30:49 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:b6:cafe::9a) by SGAP274CA0009.outlook.office365.com
 (2603:1096:4:b6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 09:30:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 09:30:48 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B37C04102B4C;
	Fri, 23 Oct 2026 17:30:47 +0800 (CST)
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
Subject: [PATCH v1 5/5] arm64: dts: cix: Add the Sky1 AUDSS DMA-350 integration
Date: Fri, 23 Oct 2026 17:30:45 +0800
Message-ID: <20261023093045.3248630-6-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
References: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|TY8PR06MB9176:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f66db195-85df-4c0c-5f1b-08df30e852ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|7416014|376014|82310400026|261021123027099003|261022105027099003|56012099006|261009223027099003|18002099003|10067099003|22082099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	ZyU3UA7ZUBsD/7rfIT+NNNhlbVCGiH0QFo9n6AunEQAQAaiUZ9jlBZilpSEm9DHDO93pV6RYHVNXx1JCJGEDQAEsm4Y6bbTbeIhGH7UaRO6w6ddQVyk7yDi4l95NHAF7/eZJww/BhONU36nPajgWwlhPGHMU7UUcidXkgr9iaHFv1Vn3RHB/z2DRoF/GJbR0+B+0zSI4TerReTYYTyh3QAF2yDwJtedMD9y/108ZZoQMFns7TF0djLk2OepxAEB4X145KqIqm44FfH8kVV7aPTEHhNBzghKAq8OFE9U9RxbfC7xWsHMNHwt+djNcHYrF9J/+QLRmc62koDfUnRff10vq1a5IeejX9Y+Z3jgs//sOL6zjrWU8vB1x4acpEgjkv2rR9tjTuxf4VQUCZ/AaK3HtaEHiJb77GZyyFLEL7QYWRqHOjNW0i/KlCT3lfkoogskHADzFwcC8KCqvovPpDYG+5lEulZkUzgHhNl2YupPFl4qSu67f8zk9kuw0bc5Qd0e0PA8WGSp7JnZvFv0CgjF72Tr6y6tDGBGWXv3Y4kGx+HMf2HrJwrcv1AmsCMJ2g5YqwZs/res3IFlkPoCFElP7yk0F8PbK9u6AVAlzVw0JfH8Mc7xPyngjMRoYSd+n3oEsOgthIyzRj+TtIrju185oT4oglr0H8iHgtKNQqWjsImAdyapY7QSvoxfLrq7tlEURpuewvOe4AW+USL9lNQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(7416014)(376014)(82310400026)(261021123027099003)(261022105027099003)(56012099006)(261009223027099003)(18002099003)(10067099003)(22082099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6PMMj07rjp+jwHSBemNNzV0rsD++gNCe6Paqv7a1brk5FsHLQTUPgn6brEH/8zHnQlRE1CQ7++11hD+wVg8ruNK1NLsK6Mm+ZzsDdZb6OQUzBA5hl08F3xZFYSPAmaq1jkq73NGj55ROpnb9+zp9Lyicc8hKxAEXGAV17EYvAoxbuuYTWv/vlPg5qRs2iQMcEV5DW5KTjjZFunI794hf0bu3+bvGdTX49KX++UF1tl+5qK/18jWVAmGN617089y4tiw3EEyYK2WjtTjvP2JBLZoOqpsr3vWCfU2K04PC523wRk99AcPzjnr1P1lFkZI7LAp3owXY4kmtLX2knFyTdzuRBFy3A+g3SfXXRvfCac1P/tKAj57VCKXSZ+TvfqS6c7LHDAjJtfke8q6RuNtghaj4M3LuGY+tZ2AfrWGXXNvUbj7h3A/l5bmcjbJ5K7no
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:48.6750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f66db195-85df-4c0c-5f1b-08df30e852ba
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY8PR06MB9176

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

