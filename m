Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.73
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908654;
	b=ymWALpblVdCB09URHmfXZyrzlUfimEfnCmwPuRJZI5fZ5/UAl5oS62AxzbELuIVVKyIX
	 vFoOdtMyYy9PF3/AiHjrS5/thivVyIJFA2T00Hk2N6Q2twkRcPSqoXihRB5CCE6G+DIkg
	 dUo5gc5iDKMMfDg0T2ccCCen4s+4bUJUvraphvU+fTVaAu1Ro7LtfnOFyUIzqH16dXuuK
	 UxUqIj8WXshG6lakWqZR+qFGm/dkRpSyRj0JrqfH2ZYhfb0EdXxSsTZpBOW4MmDPMLeif
	 FXMQHO3A3wHxji7smoeMYM5vcM8mw1zEtZiOjtWTrp2stsXMVZ9FVDDuGQiDNgVHeBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908654;
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
	bh=h2xoCu77JB2CKHqXFOK/9xN5zdGfQruJ6NkfVX2vsbs=;
	b=rer+YPPsdO1nOwtle+CJkVPSbiLDaBAuI7Of9yBPaZfkn/L3b1ABDQCtq2rF0epEQB/V
	 +SV/P+K9zSofx9jL9GeEejPnVqu+RhTu1bEL20TCqI3O1NvhlMIuUrvkfgv6e9IPa5RMH
	 s8vw1D4hTexXLybRTlQ4au/vr+NEaPGPNNF6hC21sIkFHsjmds6YD3svQK/eYByhdbKPp
	 VEcu+Wu6fFf7jczBiS0ZUuLsTOGNfyS8FHuPlKxs7TtJqRVahqKA2S7Iyq3l8D7A23hmg
	 xwJINeNCLJ0sSVyovp4mfBWS8wm1V8aFVub/ejoxF68mRW/T0qjBh1GhiS4Hl8kcZKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.73
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023073.outbound.protection.outlook.com [52.101.127.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2763606A329;
	Tue, 17 Nov 2026 09:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2763606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XbdzjUpm+Pcnx4wQRz/noYYnJXE4933ccjemi6/SUPUQvNCuFTg2Oi+aibwmpO6se87Sn39fTYIJr0me53IwbWcv6cQ91VND5jFOag1VtiBZdEJloqvG0E/Qn4/N4hO6nlXeHdbqvNjOzjd9w0Sz74pm8WTEEqy/fzqA0JstWHAGeFU/GlqOJCrnFy4cPKlmsS4qanSkEtbEkItm3Gqii6D62NzVl7Jq540BOy4GwsRwvKWR2ESWOdtQliZwwQuh8u6Q4OnjWscEZQL9Ajk66H9dCTt46NthNhvHGYxF+03k4KM/Ma/LVRt3cWLaBeex9zJ3SMEI26iQhthowr+F8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2xoCu77JB2CKHqXFOK/9xN5zdGfQruJ6NkfVX2vsbs=;
 b=msQdbIZG4T3G3Hk9OKPFdnexFuoki4KpNBAXfRVjTh1nD5gzUG5QQjlzEQK2Uwvr4+YDtn39tZTuctxfP3RjDajr0OV2iPoKlAl692vfpfqmk0E68sOhTblRUPvjRuRvBWmcGR7jm5fB3oCnGa4KcWrk7oEd0HFaMC8TDC4Wwfi14QuJUhVe3+V1bg43MX/6oOc6y5Fqmf+azRrshTiscxRToaOA8vNIaelPmuiTITY9U/aMZzmNqt6lLoxsHWzTDXNbA8fTjxXrclYaO4Gzt7Hc8eEDLLgdyWNQnon0htWbWzeh2mVGP5jYVCqDWJezDElw4XKsHCQdnUnwdw4U3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::7) by SE3PR06MB7960.apcprd06.prod.outlook.com
 (2603:1096:101:2ea::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:44:10 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:296:cafe::74) by SI3PR01CA0008.outlook.office365.com
 (2603:1096:4:296::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 09:44:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:44:09 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 69099427EFC5;
	Tue, 17 Nov 2026 17:44:08 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	tglx@kernel.org
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com,
	radu@rendec.net
Subject: [PATCH v4 0/5] soc: cix: Add the Sky1 AUDSS DMA-350 interrupt path
Date: Tue, 17 Nov 2026 17:44:03 +0800
Message-ID: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|SE3PR06MB7960:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 68a1f679-0a98-4676-a068-08df448f5467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|23010399003|36860700016|921020|10067099003|260925021911599003|260925021311599003|260925022911599003|261021121427099003|56012099006|261022075727099003|261021123027099003|261026121527099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mPy7c8QsqBIYz5lyBj6BPCMDkc1e9Ji31FFN9mZLWGxkuQDBUUCpRaaVbOV78UxkdiYL20JHGl6G9aekWVRA9gG8kly6gXAO9H+e8VHJvf2whtgdZp3YHIBEFYVig5MDwFtWswPnXblyrh2AFzOYa8DoRzWi59fJlW5ChE3eBDnsL6sDidBHjAGFTVIqeP1RObm+NWaFLTMelD1mnsrM/OnedcdZKL0qUojKDSwgMBiwIVoJUCI8xt0PbYrHycrL+qFaROK/xXJEtBUTA48lDAHC6U5uIaX48uWM2yGYT43HD60nJdQd/j0ljOLJMT5rr4X1CyC28VsvBQnfgMH8zSP9WoWFu8FBSGsV/9+X/v3ttgKysWCXfoO8yKDxs2dRd1AHU7tkYhGkv6gPmuK++XOF0ztIca7f7r0XVuk+jvkOZtyIpkRjNK20Y4VVt4tmJD0UqyTM90Rfb5b6YiMVxkx61XECkbvKujHq9YvWLY7LgeYcr971YbNwaOjB2nOKX6QDz4BGlvIvMgLx6ylOIjm3lgaEcu0oK6v7kTKJaIp4HNUPAgaJTrcmoCyLM7BI4p4GGoZ9KRSVEwaT0YM9by4RspOyfrrA9LI9LPYNJvL89x3Hebcz0OZR2z5X9Zon8KW8+1T3z4efv9WalrMTTSnVskrdZTl5wtklTNvXZn3yvXilR37WSkrzeCFv6W6BWWNVdhyhiQN5t3uEcG5c8A==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(921020)(10067099003)(260925021911599003)(260925021311599003)(260925022911599003)(261021121427099003)(56012099006)(261022075727099003)(261021123027099003)(261026121527099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QNd7NSAmig+j+WCs/Bu8380QTk3Fab8na7jAJ4j71KynooPSbOv8qmwklO/Rslg2rKWBRGGESdi1Bs1Ck5VFwDmXAIMal8OXaBFNMlUb3Z9qAgzIM3ovQl/W/HykZ2mOgQ8qO21y5bI93mpkbOFgX5HASpNJKOulyRxioXcMOEyK2VJypQyvwJz4fX+kSn+7y6qxjC0hUo6IcaSPdFMSxMqKJc6S2yuRFtQMIfFkOnucD5AAzf2/8jUg4yYteMMMQCWMJkTB/AODQs0cBLnj0FnyOR76bvbhi09mRrg0/xIMVbD7VjBt1HNmJKYePk6H5xkHluOtyxRti2ST+cxJUiAuPwxmiw3iGdmWRo53BGFJ0To19RFTuolOEDrqUdnj0mnXC650/RLiS3lIrQ/HCJsy2FCMxsw3iBgWNpBZkdEYjPSNW0gjevmRE8QIKU3C
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:44:09.5123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a1f679-0a98-4676-a068-08df448f5467
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB7960

Hello,

This series adds the CIX Sky1 AUDSS DMA-350 interrupt path through the
audio subsystem CRU and restricts DMA channel registration using the
optional dma-channel-mask property. No audio client drivers are added.
DTS enablement is kept separate from this revision.

It depends on the companion v7 series, "dmaengine: arm-dma350: Add slave
support and Sky1 integration". Apply that series first.

The CRU gates eight DMA channel inputs onto a shared GIC interrupt.
Implement the irqchip as an auxiliary driver under drivers/irqchip/,
following the existing reset auxiliary device pattern. It shares the
parent regmap and the same CRU DT node; no new hardware node is needed.
The existing reset driver is unchanged.

There is no per-channel pending status in the gate register. Poll enabled
children using level flow handling with IRQ_IS_POLLED, retaining masking
for disabled and oneshot-threaded children. The domain's PM device is
the IRQ child. Its PM callbacks quiesce the parent IRQ around parent CRU
power transitions; shared clock, reset and register context remain with
the CRU driver. Use noirq ordering for system sleep and dispose mappings
before removing the domain. No sleepable resume runs in hard IRQ context.

Changes since v3:
- Move the IRQ implementation out of the clock subsystem into a separate
  auxiliary irqchip driver; keep the parent-side registration and shared
  CRU context in the clock driver. (Brian.)
- Simplify the interrupt-controller dependency with dependentRequired
  and drop the redundant conditional #interrupt-cells requirement.
  (Krzysztof.)
- Retain the channel-mask binding and its Reviewed-by; collect Frank's
  Reviewed-by for the unchanged mask behaviour.

Previous version:
https://lore.kernel.org/r/20261106013520.1134450-1-Jelly.Jia@cixtech.com

Jelly Jia (5):
  dt-bindings: soc: cix: Describe the Sky1 AUDSS DMA IRQ controller
  irqchip: Add the Sky1 AUDSS auxiliary interrupt controller
  clk: cix: Register the Sky1 AUDSS IRQ auxiliary device
  dt-bindings: dma: arm,dma-350: Document dma-channel-mask
  dmaengine: arm-dma350: Honour dma-channel-mask

 .../devicetree/bindings/dma/arm,dma-350.yaml  |   3 +
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  |  31 ++-
 MAINTAINERS                                   |   1 +
 drivers/clk/cix/clk-sky1-audss.c              |  37 ++-
 drivers/dma/arm-dma350.c                      |  16 +-
 drivers/irqchip/Kconfig                       |  16 ++
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-sky1-audss.c              | 255 ++++++++++++++++++
 8 files changed, 354 insertions(+), 6 deletions(-)
 create mode 100644 drivers/irqchip/irq-sky1-audss.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: aad1bc3c30a4825048143a3e0395e696201548e9
prerequisite-patch-id: 2e9d1a314d10e25bcd4e2285b36471200a9f17e6
prerequisite-patch-id: cf5b4f0b15f7e217ded422fa78c169653004d70b
prerequisite-patch-id: b1a307c60ed1189999dbae31770cc5e4afe569e0
prerequisite-patch-id: b78624ba53dce6857d20b65d3393ca5c77fd2c6e
prerequisite-patch-id: d19a15bf5a6aed8ab078eab07594dbdfd81bbcaf
prerequisite-patch-id: ac650cba94ae1fc52c25e6e1cf67e3af38cf92fa
prerequisite-patch-id: 53807c6c2b9d9deef242023baf70ac7e9f73a87b
prerequisite-patch-id: 62385082b538a0f354f44a70c2c251771238e047
prerequisite-patch-id: caf492d9e693ce5901d8c4512906258607b435a6
-- 
2.54.0

