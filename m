Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.90
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795152937;
	b=gY2G4BL2pt1DnsS5TKLtVtbdu9s+t4OdlWvuBncsindbZlYxmiOFyu+FLUv0gCnhP6kg
	 StYbGqxLKHMDshXiZOtt8FUH0eWzsItT1yLpkHTrkC/FEXb3Bgo458KQI12dQBohoxXay
	 NVtp1iwsB1qGVjjHBQRkyeI5r5v3gHk7+VuXvJDJ9NBueXorQOUPtSceN0JItFtyD3vTr
	 Iw6AHTg3WCezXZGjSYw0LltTb4/Ti3E9TPdCDj0rwumOTreoAfLQmo3ESai40Nzp/sVSR
	 UfTnDjJ/T96qYeusY+4rgyi5e01eVkeIZ6WWM+ujqMBHJYiQQ//Z+usZPYe3EmnTzBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795152937;
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
	bh=fc2FjSAbeBgBGMd7hYrFqsQHMb5zcMBQtbxQ3FqNwis=;
	b=cmPmJCZICzPMCBX0yQ61VdxBgi7Ce28eOGGujUsSg52YpQL7wkjoQ+mSKVaYtfuxOgAW
	 wGCg2XrItArlcZOQNj0qxhuH1ZfO0J14UGmbfH3pCWhH1QxQ+b1U87H1AoO0UKLe89sCr
	 dF2IR3I4kzr+/xqg4zJWS4KdYiBKtmWIGOhu1Erqpc8refsIVHq2j8uAm4bN5NadRwUgO
	 Q6GQ/7wNxMqvLDD47lZ18dvJ7WVLE1k2/XVyiXtewkaDQcnPHT0TjE5PMEe9ECsJhI2SJ
	 z3QbdUmozklIUcP3q4OgMaRYbTpfeb9l+vfJdhrRUHHPba1Db/WxJN+dDl8sv4/JHiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.90
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022090.outbound.protection.outlook.com [40.107.75.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8187E606A32A;
	Fri, 20 Nov 2026 05:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8187E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iu0IdgpzIGymQlJzyKu1OubDNyB+Vq531Dh4juE2PF1t6gtpDL+8LP3IpSoghXfNMaM+u/ruRZyEjT6uP4J7TfZv8RLhd4JfQjQATT1KSL111kMMnhE4OEMLEz31HUkFGltnDwMF69LinDARA3CpcT+dxw+NTu1rDu5KZImvSaI/v4D4a+X/gKrZ/uGCBJtAMRli7r3tT8n+oXmtiDu0mjnWbmKd1T5W5K80YBQYVKxwK2tK+Yun3FAwSUz/uwOMx1NFYRrojz7+EVpfksQygwLBVn8VtWHJcU/OCcq9Jokzfrheuwvn5xCkB/MUrG45BUbhGdvQ2ja8yDyeOeOWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fc2FjSAbeBgBGMd7hYrFqsQHMb5zcMBQtbxQ3FqNwis=;
 b=nQt4CE8DI/kssuVey+tyF2ma8QfVHIIlRJiN6BSY8xeOqh9k2QB9Drw469+A7bIhxfz2kO6McxP6e8mZJOC+k4NK+zF3lleuorG1L8UL1N+PzrGbg7aywK0H4VlfRNDBcgzcfj4Rpg79/0vCLedYv9q/irH/rRhmHELacGJ7JvHbvuRN1bos2hOmpgi7qDlU0g9k5gbAd/ZchowZls7aVw/1xEkzj8lPmNT8Hd8hzP0zabOrWOEszkwYbU4IJMM4zBw4/uLzDZesv39l55JNKAKae9rBhX7TLR9jhD4MSQGwEBlZ8Mh8XXdLIv9G5sr+KNfG5qgT47Brv0qfcULXpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096::21) by
 PU5PR06MB399494.apcprd06.prod.outlook.com (2603:1096:301:161::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 05:35:32 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096::cafe:0:0:8c) by SG2P153CA0011.outlook.office365.com
 (2603:1096::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.2 via Frontend Transport; Fri, 20
 Nov 2026 05:35:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 05:35:31 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 87253427EFC2;
	Fri, 20 Nov 2026 13:35:29 +0800 (CST)
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
Subject: [PATCH v5 0/6] soc: cix: Add the Sky1 AUDSS DMA-350 interrupt path
Date: Fri, 20 Nov 2026 13:35:23 +0800
Message-ID: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|PU5PR06MB399494:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cc3208c9-38dc-4dee-7851-08df46c81787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|7416014|261102123227099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|921020|56012099006|10067099003|260925021311599003|260925021911599003|260925022911599003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	aLf8SnGOFqzeXp90AzzR3+qXZpe8lLgSI4dp+gJOBFhPDIOgxg4Ql8qbxTKeqArUDawLeXhNQCQdMUyRkvJ9t1119BK7/dieetYOipIoSqoiyOr2sjVygr6s8iFnXrcEhZClwhKPiovv2/4XiuN4aw2E9ec0ENLQpxsoCllLNiEcWjucj8PNnCklTOCS7OW1W1T8LVxLT8mbrehI3y9k5Iy3EZ1Srqr+J24sI0G8nNrCPoNJqiAvkEGa+CVp9lO+2fsbR8oqh+oKUi/N10Cj+cVl0MCubYdA/ZWBz1TIy9l7ntMJMstbNEp/Lkk8RTrJd69cFCQ7zNpaF48R6LTbMznysbb/LgExNHb9d61YkPsT0Ef4bD73vtK7/HCm4+GpXbaeyhbg9/mvFwaLHN0MW3LMav43T6qXCFCyt0mTLWTP632y6c1Wa+xLmnUiuIzT3Ity3T6cVmi/W84PE4NWa4cn7oOxlssRBE/Caba+/ahi2URIJpdREOuxajG1D35vRNRTGWOd1DoHWvNq3r7DXqxeqz34XecsHcIg6Fs3Owgeo0np0gEh1V/qTP/pPUtDieaR7OHyBWKu1kkS9c5u+3jugf8B2RiATx1rwA7inb4JLDz73lAwoyzad+q9kevgW8uWj32982rBQapirE9IZvP+mEFR0P7u/KwKVccAvT/ft24gY58jyTRQ8ADJmXaeAUyA35fG8sITJulRrckH8A==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(7416014)(261102123227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(921020)(56012099006)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(18002099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P/hFhxNA6Bd5dLR3Js2ni7udPN1M4zTl0xU+W3b2DsYxZ48khZSjj/0vgVjgmhUIVXH2CDcNq5Ivqwl/DKyiNxeJgqcsTLvsiD69G/5DGv68sn78Z4DNxFhiHltdmK35BzmG84/iSM5b9/MIqTYeUpxrDaK9WepTRz3zNNEc48yVhRPWDyM598YeM+LnMn8CrMdOoNggV1Mlkz15rA0ec1J0o7RpuMHLk+MFqmjMSxBfrT9UII+mYUHBtzIVQBiGTrNdY2qo09i9QzNzK5MvXO7ub3SfAdUwzYN455kepuIIbeNJ/GF5gxsguezvSROQ5+hMQLgRI/16NymFPmg5bpgxBKz7ZT74OzeKBU+U8gAUbv3dkSku8Eexwp9/5eNrZMPCCgAWpYmQxEP+Q8yi9SXs5rB0/U6wAYCDHdGy6VUug7+vdz3bFxvtras3+k3u
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:35:31.0222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3208c9-38dc-4dee-7851-08df46c81787
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU5PR06MB399494

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

Changes since v4:
- Split CRU interrupt/reset context preservation into a separate patch.
  (Brian.)
- Drop the unrelated reset-assert error-handling change from this series.
  (Brian.)
- Match the IRQ registration helper to the existing reset helper's
  conditional-compilation pattern and remove the added bits.h include.
  (Brian.)
- Use the same modern PM macros as the IRQ driver, retaining noirq
  ordering and the existing pm_ptr() pointer. (Brian.)
- Collect Rob's Reviewed-by for the unchanged CRU binding; retain the
  existing channel-mask review tags.

Previous version:
https://lore.kernel.org/r/20261117094408.1393837-1-Jelly.Jia@cixtech.com

Jelly Jia (6):
  dt-bindings: soc: cix: Describe the Sky1 AUDSS DMA IRQ controller
  irqchip: Add the Sky1 AUDSS auxiliary interrupt controller
  clk: cix: Preserve Sky1 AUDSS interrupt and reset context
  clk: cix: Register the Sky1 AUDSS IRQ auxiliary device
  dt-bindings: dma: arm,dma-350: Document dma-channel-mask
  dmaengine: arm-dma350: Honour dma-channel-mask

 .../devicetree/bindings/dma/arm,dma-350.yaml  |   3 +
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  |  31 ++-
 MAINTAINERS                                   |   1 +
 drivers/clk/cix/clk-sky1-audss.c              |  49 +++-
 drivers/dma/arm-dma350.c                      |  16 +-
 drivers/irqchip/Kconfig                       |  16 ++
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-sky1-audss.c              | 255 ++++++++++++++++++
 8 files changed, 363 insertions(+), 9 deletions(-)
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

