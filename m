Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.76
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792747852;
	b=hDzpD7y3JjUuW3fGpSrIQq7vEHu+z5filio/vBx9X6bLhOXR6TLCVMHSFNoKZJ9lngAy
	 nYHqytqJ1tLj7W5FEatcrzWTwfEOXze4FAG3u1S2KFYJjnw1pkCtUkHd9RF/zUhaI4kB9
	 jz7de0TfyA7VH9STG08XPX1V8pnMHYBAa0Baf8gvxNRi7Y5pqQA+sps0SE7Yx8xjKwDyp
	 kp4nTBo2gxgp62gOGnvxLcNVfSMXBcUVQQWA+E1cpDB7R+EooS1Ptl89EjlO3Jl18Z7M+
	 XsS6OFWqhOgrwC+ib7KVh93PuNLNkJNTEBES7BnnClhImJ1p54JMYAmQiREdNA2fqjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747852;
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
	bh=jW9kR2lEXQb0hBZn+TtkIgksE9/NVJy4IiJNPlEgiLM=;
	b=ifmcEuN/MaI+R8/sETKzVzkz9ebTWmpmjIKkxmnY0aX4lPDo9NKSs8WLGvpFSDtT52Jj
	 Td8wKqpnCsgpMzMbWEk7nzEMVLCfRfYrVo8DfsV8w+MwEViD8mpozEZP9VsloyhGfATqu
	 OAyG0TsB1fPhSwP3UG5yxnYtjVjNfV+Zcz0F1NNKYE5/HQLoE0UclOLOfvs32KSgAa7PO
	 FlqSWzaLUNX+FEKVGtQTrtof4xt8W0uPt3SMRqdbHyfldJMfYNC+niIYj1NCD5rGgxT5r
	 CbePY2QDw1QStaAp9MW1+EaSqN68SzkNjrvqDXt0a4esYIiRMGGrHP0x0cLWoRhkDdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.76
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023076.outbound.protection.outlook.com [52.101.127.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D53060A3818;
	Fri, 23 Oct 2026 09:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D53060A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/rBwmfE1/XZI16/0ZIUjXMznEZs2RXbQDImHOs4/e3pB9fsX24qtyuRctQ+KiHQBZdTTdf+SoyW+H+o8MFBopLJ9bKSccGkxnNPyOCcgLnNhCGmQ+w7ydMZlzoJiTG9D2k/wD1QyWbJ2KqNRrx6o36I/9dFoVz8WX32qGzNLS7PIShaFddMdf6BUTVa7KZj4OmrdYpXA0yPrYS8uYLbi/FX7bFcKMbLC/PsDUcL9udadG93fX010/e+bo16F5NBcx7r5ZJdF6YoAgQNo2WuMX6VvyFrJeCQ7oBvLmGPpbqbqD9PXwzTDGrPW1FumR/VfSvuSY1x85db95OgcSjT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jW9kR2lEXQb0hBZn+TtkIgksE9/NVJy4IiJNPlEgiLM=;
 b=Lk07V9QSgKHrCrLv4uSLwc7cSEIUfZk2jbsl1bLx9Eva9/rdqJ0xD4e88IFjNCD6kjcN5D5ENbW8yB+MqSCApLPiy4PVO2j7bWtwHu4bOEzgFUZeYIuEHt/KntqSPxNLORoj0CvRnSNI11kBsHIaqnSQiVjP8ATPmiRs6VAa7IcqeNVB+/Cz16BYtfv5/r/wyq1sJQvY9UEZymQAWnmi97UNEuefds1MTfYdk/xtSI6BAJUF+rvhC4jEVT4YJhIN5naw79J2a3xu19NhX+DFpqjpChEEKY+lHz+DQ7jtQS4PjcVTh5HxkbXkt2kcWFmHJnRji86eCDqQ8CjxGP0umw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SGAP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::28) by
 KL1PR06MB7317.apcprd06.prod.outlook.com (2603:1096:820:145::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.2; Fri, 23 Oct 2026 09:30:47 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:b6:cafe::68) by SGAP274CA0016.outlook.office365.com
 (2603:1096:4:b6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.18 via Frontend Transport; Fri,
 23 Oct 2026 09:30:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 09:30:46 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B5DC54102B40;
	Fri, 23 Oct 2026 17:30:45 +0800 (CST)
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
Subject: [PATCH v1 0/5] soc: cix: Add the Sky1 AUDSS DMA-350 interrupt path
Date: Fri, 23 Oct 2026 17:30:40 +0800
Message-ID: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|KL1PR06MB7317:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 66f3c66d-97d8-4b96-dd52-08df30e851b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|6133799003|3023799007|18002099003|10067099003|261022105027099003|260925021911599003|260925021311599003|260925022911599003|261021121427099003|261009223027099003|5023799004|261021123027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	J5GgZa635w5b8yAA6FG5/DWzGxTVcoWJ8vLLjg9d7epRQOs2UiKEuN4VHPDlIgV8X5LtSaSxr29vpnT+Fja8ac/jpRQW2oczOY9jvo0vbmXgI94fL3pDgALpkeumLFByDHTHVJKp4us17AVVN1OFAkvimJ93aTFEOaeYWtBUCHEWDjANVOeZaD6PS8O58bUlGm9ASRWf/65rmAIqEtvPj5fncBWfEXLCZ0pidkUUzry01KdRC4zSX7vbR3SHGthTqC/3EDSQ3pdGuEi4xqtg8IeJCAURCBZ13p8+DqXxrhtJ57pjuTdpbPdefvHds1PkmWr3GNOjT0iljVk1nRzlfvQ1t9m2QAut6HZwCWuNvGKbARmTRU+SDD+lxxBl/rfLRrOx3S8Quh/ZGyWGJBUm4W9VOrqt/Yf7qcV90iB3GpX4/JBLFa/BIlnTD53mY65LFdHvelr7ArLnohuv6a/cEiX0aQOdcPydLhIZKL/0d6bISUGeUIbimZz33JMy6vJJxM+RnYQ+dEZ7MDmB6fNQJB5oKAZ8jcGbghzPGelrajKprN78bjr6mqCMCw9r1ekdchmdC+ZcEY85HCAkoGi37Sy46CLSF0FqUmyK5uKoH3dmmgkX0Jd5gIJYEXHXsipxPZQva/LMBQDViNNh/CAt3UugchJBTGfAYqS8+oCMTegbQV5kcvQO+biCzk/btK6IY3Aptnobh0SuzmV3SZwHEg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(6133799003)(3023799007)(18002099003)(10067099003)(261022105027099003)(260925021911599003)(260925021311599003)(260925022911599003)(261021121427099003)(261009223027099003)(5023799004)(261021123027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JYfUByImXIrTlHZDK+gmchZN0NRxhPNJ/+V6QeWOE1BqE/o0retFq0hbOqBUdjQxN3i83IuloVJ9HtGMevGshKrU+ZRAWDLkcrw+e0C4GsC+gZYLQxE0DWd/Oaq+oahcew4h7XJARq+apv/sRZU2VlRS+IEkxpw857VDKSmK+fy+oie9CblQQmfynOwstHrzjGrWvc970v0Bc3Zm2BfaS9JSjm7DCf6BcrNchPuE9o8KYxJozGqx+Vs96U2qlg/Jt/aS9rHX4BuPagd66PSkraeKRzhSNFaH03Ikb1ns+js23902SoZ3T48CyJF0mDo6iDCF4R/i/NwJDVn9j6LlMxrdLACgLKdrkSw+KCjrNJaHCV6AwIwBurcnq7rVw/rZKvwIoZhGaLbbLFkkgx18nHPPxG/SN+1GRjWpmepgusldfcTFeB4Smn9D+FdZ4H/t
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:46.6610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f3c66d-97d8-4b96-dd52-08df30e851b5
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7317

Hello,

This series adds the CIX Sky1 AUDSS DMA-350 and its interrupt path through
the audio subsystem CRU. The DMA, CRU and DT changes are posted together
because the controller depends on the CRU interrupt gates, while
dma-channel-mask describes which channels Linux may use. Keeping them
together allows the complete interrupt path to be reviewed. If separate
submissions are preferred, they can be split in the next revision. No
audio client drivers are added here.

It depends on the companion v4 series, "dmaengine: arm-dma350: Add slave
support and Sky1 integration", for slave/cyclic transfers and optional
clock and reset support. Apply that series first.

The CRU gates the AP interrupt path for each of the eight DMA channels
and combines enabled inputs onto GIC SPI 230. Channels may be reserved
for firmware or the DSP; dma-channel-mask limits those available to Linux.
The AP gate bits control interrupt delivery, not channel ownership, and
this series does not implement runtime AP/DSP ownership transfer.

Conor suggested interrupt-map when the routing was described as being
configured by firmware. This revision instead manages each AP gate via
irq_mask and irq_unmask. A static interrupt-map alone would translate
child specifiers to the shared GIC SPI but would not provide that gate
control. Model the CRU as an irqchip so the register owner manages the
gates, without CRU register accesses in the DMA driver. Feedback on this
choice of irqchip rather than a static interrupt-map is welcome.

The gate register exposes no per-channel pending status. The chained
handler dispatches every enabled child, and each DMA channel handler
checks its own status. The children use the untracked flow handler so
inactive channels returning IRQ_NONE do not accumulate spurious-IRQ
counts.

The AUDSS DT describes a 1 MiB peripheral window and a 512 MiB DRAM window
with dma-ranges. The prerequisite series allocates linked commands from
a coherent DMA pool, so successfully allocated commands are reachable
through the controller's DMA address windows.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>

Jelly Jia (5):
  dt-bindings: soc: cix: Describe the Sky1 AUDSS DMA IRQ controller
  clk: cix: Handle Sky1 AUDSS DMA interrupt gates as an irqchip
  dt-bindings: dma: arm,dma-350: Document dma-channel-mask
  dmaengine: arm-dma350: Honour dma-channel-mask
  arm64: dts: cix: Add the Sky1 AUDSS DMA-350 integration

 .../devicetree/bindings/dma/arm,dma-350.yaml  |   3 +
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  |  44 ++++++-
 arch/arm64/boot/dts/cix/sky1.dtsi             |  26 +++-
 drivers/clk/cix/clk-sky1-audss.c              | 122 ++++++++++++++++++
 drivers/dma/arm-dma350.c                      |  20 ++-
 5 files changed, 211 insertions(+), 4 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
prerequisite-patch-id: aad1bc3c30a4825048143a3e0395e696201548e9
prerequisite-patch-id: ac69e4704329a579e556880cffc061b2743e30af
prerequisite-patch-id: ddc9ee115f12a7d2ee7ceff7e0485e7166581756
prerequisite-patch-id: 3d5fb2f7a5b2da42cb013d1c2e0a6e5eac5ffd6a
prerequisite-patch-id: 0e54074dcfd104480233bb076d2424e6ba1bd25e
-- 
2.54.0

