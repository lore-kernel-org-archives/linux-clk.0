Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.96
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928927;
	b=r6Rua1KoaeWMWyhuYOF1PZ2OPu0MSko0SiQgVNCY8qz9YyaeRjSZa9orAih8CpW0huna
	 +9rsF4l+dTsNb9aBDtk0UTXIyb8hACUosgezr//ImHhz+nAvYS8osYIk6Bhpx4VK8RB1I
	 Nn75tGSAbSA1V/Gvt2xEsv9ZB44zoPd1ISjU6O5XFtcyLqgVGxurxxhdVFkjSvhktzt7R
	 wyJWmSDiwNvpLAwmFBre0cPkAokMxcE/jgX2kQRPnJIsgQ9mevXEZytCzCCNrqlZLUfIO
	 3wrOe2C1k3N1465cgB6OQcxLo+5/zWRipMePrNyCAveZZMgvH3x3wq5DgjVWKoVsKYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928927;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=XRoFd/m85eaWjHlloQtRoyaOJBTKYVcEEr22uvL2JqI=;
	b=E5eF19oK3He+rxMtgE8tY3icxnc7nT6o4RPSW/EhikI/Lzqb9fAHXIRWRVxHo/Umj61T
	 Zx/JIADum7qNPvR9gMPc8+M0drqYUUnkPL8N5la6uB+/W9DMIGigEm9hF0VTvQ0CtXI0P
	 FU6l/fIR2TxAJw20n3xW/jEnNk5nPf1nReQa6Wimw7vpMCQnz0iEkl6B2OA8HROGXqkYA
	 6wxzwfED3xSicL7YRk55XbyWKKMQbepKHKdiZWxrtaaURgdBIRcjKMn26tVVyfBONBZpU
	 kOZ5Ts2cNpAB+G1Mo+8wp/BPMrq9e2rEnXGoaCDgn8pEHrSnHfXGzCqu8Ow2y+WUimw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.96
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022096.outbound.protection.outlook.com [40.107.75.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5D8606A326;
	Fri,  6 Nov 2026 01:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E5D8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocZ951h8LnqQd/15AOBDhNOE4L5jhDPuTi3nY0ABswjPhL4CxegyCd3cLcGwAmOxtX85lQjd51QjTeehDe4FFoKZmhobcfAM/6Vriak76R4B5OmRjqLZ5EtFko68agW8qIN8L/7J/g0bmbj4yOc8d2h+8qDt0ijtszETY1P6VDcZaibqG+vVTDwiLkAmR1rS1z7trbdMR0evKkOL7Jhm3/TEQKqWoDJbgg4OeN2vgmTsPJRzBSwp5UhFWK3CKLrkckQxtwHpUIBgwn0E849K86Ja56Uv2nGDpomInsJFFTEF9mGX0XMhIpbFhVPiZAuyRka+dvnfhKA8q9T23Mor+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRoFd/m85eaWjHlloQtRoyaOJBTKYVcEEr22uvL2JqI=;
 b=jwAzzgRaThfK0FOgZ03WZiPAWsNJvpA0lDEtIHHzqeP+/tigGOLryj8hvw3GiF9Xm9Pr/8iKp9oXgMDswz0kLUzqRKq7smfXGf5FZUFAQA8Y8uOkoexLozi+JLLXdI+GGeWVEqUFivROirY9rDBH1av67XCmyr6mkGLYMVstNfpUPywf/zw9dNM3tNets83rGsTU3871cIYwB03i+Rb6mbFznem5s8FeQK41BbokVbx3msszZZfP8eT7tRYM/Ah/FZ+uWHZbvHW3LbsWDYgEqgx26U8LsKK/8KkC04wnokC9m65DpqBw1QzcgFt1DFnHAJ3ONgFa1x0R87LbdNH2BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0029.KORP216.PROD.OUTLOOK.COM (2603:1096:101:114::6)
 by TYNPR06MB8808.apcprd06.prod.outlook.com (2603:1096:405:3c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 01:35:22 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:101:114:cafe::19) by SE2P216CA0029.outlook.office365.com
 (2603:1096:101:114::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 01:35:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:35:21 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B3FE74102E60;
	Fri,  6 Nov 2026 09:35:20 +0800 (CST)
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
Subject: [PATCH v3 0/5] soc: cix: Add the Sky1 AUDSS DMA-350 interrupt path
Date: Fri,  6 Nov 2026 09:35:15 +0800
Message-ID: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|TYNPR06MB8808:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4cc1ef41-8bb4-4d08-ed53-08df3ba6392d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|23010399003|1800799024|6133799003|18002099003|3023799007|10067099003|261026140227099003|261028144727099003|261022105027099003|5023799004|261102123227099003|56012099006|261026121527099003|261021121427099003|261009223027099003|261021123027099003|260925021911599003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	3ZuoOmhcy+NKjdIr6PxofGpRSxW2kaI/Z+qyPqsrhdzX+maDXQ1K9poF2lLyYAL99zeJ1uohj2PlAdUzWNzFQUgRe6XH7dOgCclRpj2veFiM92P7QtIXWbw03MeB6w1ucDGQvH+oAQmU99U2F8/ZPla9sOqUpdFmviNXFiYDPh1kaqAhhaB4iNMiwN33A9Jp/8ZIM6YMaN3lcOpaIY5C6XR6+PUDDSvoaqeeiVyx2Fq0MxkN4MxEWuisUDwnD4WRhppi28jNnvUowvBMgj7x7FSLGVB6fW7n5Q/m2dz6WuBPgkIG1yWXQeceTlBYouI7BAhq5KqV/puzCh4MufejJjkPG3fGzLWHzDiyXG/iiU4cR2RfLkcnYFTJHVC0QQJ1/yjxso8ajMTaMJz9HzjEVo9e0e32w2SuZR4zrWvKcvjs/sTfeYcTjI/7AjZgACvRHJWFaXDxavSUBXuSAPxvmfl4h37qPoloF+rqmWarXd8kb1o9W2xrHGj4UXu9pb3SGaZuzk9uBnTHOXEmvb3KLPn8EcrxFS+t+usx0CiSwi6UqWmSQAxhIFlBvChds8IRP3doBUxUzAiaw8pHUOHQPbdPciqEeMCdfQNFGl1BVCH7Ycqj7yIQucsLG6+iBInQkM9iNs9RREbeJ/kxXm7nxQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(23010399003)(1800799024)(6133799003)(18002099003)(3023799007)(10067099003)(261026140227099003)(261028144727099003)(261022105027099003)(5023799004)(261102123227099003)(56012099006)(261026121527099003)(261021121427099003)(261009223027099003)(261021123027099003)(260925021911599003)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O3zafAn6GvIU8Wo4FR6zqw+SoaDf/w+4OGSi5OjlCOdXplgDQJxRB+/NbRQ5tl6uVI1JuJxe5Qx7CLFbdMMdJmYpjkYSQHm22dOEhkdyzEpewycH3/plI7rvKcHhi4NlST2ArQT6rpkzfQLfjBfJ/AKQ/IT/jLUX+Y+6hmm3xSP9xoRhRm7CyRyxT/+Rie98+X+V8H7gD6NiVGjyoXaXJxcRuWvvk6qVIusj8gvW7jiZYV7JEZhAqy0YvG8jXT5pH1BdTAqBkXd/6BL8AmQPgxpP2O9Ft91kU3fCbbtqrze/kvAd4II17NRRyhvJLrffdIeTPd3vBz9lETpkRlvTMyifGe/b+FUxhwyDAuGedUbzxxW6an+XGMeoo3AyXsb6ekVEYpXeiM+A4MhkANF12bxdpw8KeFnRrtZ6mr+j4sBjD+THqFu7tn6ammbfk0Vv
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:35:21.7843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc1ef41-8bb4-4d08-ed53-08df3ba6392d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8808

Hello,

This series adds the CIX Sky1 AUDSS DMA-350 and its interrupt path through
the audio subsystem CRU. The DMA, CRU and DT changes are posted together
because the controller depends on the CRU interrupt gates, while
dma-channel-mask describes which channels Linux may use. Keeping them
together allows the complete interrupt path to be reviewed. If separate
submissions are preferred, they can be split in the next revision. No
audio client drivers are added here.

It depends on the companion v6 series, "dmaengine: arm-dma350: Add slave
support and Sky1 integration", for slave/cyclic transfers and integration
clock and reset support. Apply that series first.

The CRU gates the AP interrupt path for each of the eight DMA channels
and combines enabled inputs onto GIC SPI 230. Channels may be reserved
for firmware or the DSP; dma-channel-mask limits those available to Linux.
The AP gate bits control interrupt delivery, not channel ownership, and
this series does not implement runtime AP/DSP ownership transfer.

Conor suggested interrupt-map when the routing was described as being
configured by firmware. This series instead manages each AP gate via
irq_mask and irq_unmask. A static interrupt-map alone would translate
child specifiers to the shared GIC SPI but would not provide that gate
control. Model the CRU as an irqchip so the register owner manages the
gates, without CRU register accesses in the DMA driver. Feedback on this
choice of irqchip rather than a static interrupt-map is welcome.

The gate register exposes no per-channel pending status. The chained
handler polls every enabled child, and each DMA channel handler checks
its own status. The children use level flow handling with IRQ_IS_POLLED
so disabled and oneshot-threaded interrupts remain masked, while inactive
channels returning IRQ_NONE do not accumulate spurious-IRQ counts.

The AUDSS DT describes a 1 MiB peripheral window and a 512 MiB DRAM window
with dma-ranges. The prerequisite series allocates linked commands from
a coherent DMA pool, so successfully allocated commands are reachable
through the controller's DMA address windows.

Changes since v2:
- Drop the unnecessary 32-channel guard from the channel-mask check:
  DMA-350 implements at most eight channels. (Frank.)
- Use cix,sky1-dma350 with an arm,dma-350 fallback in the AUDSS node,
  matching the companion binding update. (Frank.)
- Update the prerequisite to DMA v6. The CRU irqchip and both AUDSS
  bindings are unchanged; retain Krzysztof's Reviewed-by for the mask
  binding.

Previous version:
https://lore.kernel.org/r/20261104124437.296753-1-Jelly.Jia@cixtech.com

Jelly Jia (5):
  dt-bindings: soc: cix: Describe the Sky1 AUDSS DMA IRQ controller
  clk: cix: Handle Sky1 AUDSS DMA interrupt gates as an irqchip
  dt-bindings: dma: arm,dma-350: Document dma-channel-mask
  dmaengine: arm-dma350: Honour dma-channel-mask
  arm64: dts: cix: Add the Sky1 AUDSS DMA-350 integration

 .../devicetree/bindings/dma/arm,dma-350.yaml  |   3 +
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  |  37 +++-
 arch/arm64/boot/dts/cix/sky1.dtsi             |  26 ++-
 drivers/clk/cix/Kconfig                       |   1 +
 drivers/clk/cix/clk-sky1-audss.c              | 181 +++++++++++++++++-
 drivers/dma/arm-dma350.c                      |  19 +-
 6 files changed, 260 insertions(+), 7 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: aad1bc3c30a4825048143a3e0395e696201548e9
prerequisite-patch-id: 2185a7427f3937ac50c3a68c96eb5494e29f027e
prerequisite-patch-id: 62385082b538a0f354f44a70c2c251771238e047
prerequisite-patch-id: fe66cae6b72d01c2e405e991bbd49b519f8bf577
prerequisite-patch-id: 4db79975ed1255550e9a7712354a9db233257c09
-- 
2.54.0

