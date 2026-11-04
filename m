Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.79
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793796626;
	b=oslyjjJL3q+aDos6uaX+9J2ufa2KQPbGN9lg+8tXSvNKUIlF0/f363D879iTdkWyGMav
	 EFKmzs0d7ZRxbZXDW5sbJ14DSY71EZr192iDzDpp8G2MJ4qcvhKbpzSEw9i7zOnMEKhF/
	 L7TBdWd1gwIeDSvMZaQsE0IdCsJgaGMXLp5qcXaqI6xrZFWNYFhoRfraJogqGV3t54TmP
	 VJ/QOEEvsuruy9cF62zcIJDIf83dI77M85Aju4SSaay1dPBTot9OjwyRYVrbwNU16MBXj
	 GtyWOeR0KNpZBOjRRfxhbcaJ+P0w+0Ykiewlf7L00YhuPBjh0h5lp93IZC6wepOcnOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796626;
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
	bh=xVK4Bu9UYvmBrhVxIppgDvWMYL7Cu53nffoa0XQ6rgs=;
	b=ADjdFo7XzBZwioi4u9+Hqga854YyGktieM9/dninVcFH8U+jed9GTayKT+B5jhAwbQD8
	 1dxhLB76nY2oGfbypyCsraFNy5ltorCQ/VDdtN07oZQwZJT0TA0fe06kZ8QDZ4zfJ50km
	 E6CWD9lSwoN1aGILvD+Y24NMYXrpMt9F2usLIUDxFpbAo8PEF7/DvZc6DVh57lPYCGPg5
	 3QTaNI6bkAW5JScMT4NaQuw9wg9urqs0xp+copd/UKvK1jW9E5iYkYf9hqgfnQJwMzT7E
	 tblFGPx1tkzt86oBbkCiE4sCv7mSey23R/JiqaxHOW55vCLvCfK0qNn+jZonioAJ+iA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.79
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022079.outbound.protection.outlook.com [52.101.126.79])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48142606A32E;
	Wed,  4 Nov 2026 12:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48142606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxPu1rm2C02hd/woLxW8Aw0WExz9Jgcu8Ypm8aGVdM3TF8KGbkw/w02d404HyX04zeyQRoyFx7lErvNLbrBQLtVZ5EUohSqynQEd57+PG88y1cAb2u11d7DHpL06kljSctD3W/PSD7lUounBYAquJvzMm307Y+57H8449miUC/1nvq6l4bWCek6h7rUlWjGtChaRQ1BlY4cGmkml2i0ANBrKPha0Dw0QeGqPrFmlWSCFZvplAC83DXNkbC4Cc/YIZIM8OuGHcDXRsbA9detjnnWkX4XHHqriJt0HlA+7BIqTZ/bN1G07wQO3xo6GADsZuC5GCRIAF4+Ms9/ktrIGVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVK4Bu9UYvmBrhVxIppgDvWMYL7Cu53nffoa0XQ6rgs=;
 b=kFelaLtoLIlz4MJIYMUQ8x8FTGgSv8oMcY85pE4/Vqys3giWW+1T+ueWM/WSt+hYCylejIpyNwle6PkpimqKy+37QyarhvhGBimiHej8UArnxt4hBdF9tx8/S4O72gLEib0XxQ20tRVKsTSED3PIIMe2BOP3Wqjm8KjIwusHkpo5HhyCW5mE/7WAQ5XmyfdJii0pfOOi5VCBRglRrIsuVvpnh5jkCuwnbmzucH10cF/0SV3bwTqCxAaRxm5y2BVxQTrdytnMbvf8citAm3DNJzW4aj8QqFyYYJZnyRFFQPpjSIJa4NVUobAmG7tMY6I4tzSDrUFbOb3hVN68bcnIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::9) by
 KL1PR06MB6180.apcprd06.prod.outlook.com (2603:1096:820:d7::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.9; Wed, 4 Nov 2026 12:50:22 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:140:cafe::78) by SI2P153CA0018.outlook.office365.com
 (2603:1096:4:140::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Wed, 4
 Nov 2026 12:50:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:50:21 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BE49940E6386;
	Wed,  4 Nov 2026 20:44:39 +0800 (CST)
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
Subject: [PATCH v2 4/5] dmaengine: arm-dma350: Honour dma-channel-mask
Date: Wed,  4 Nov 2026 20:44:36 +0800
Message-ID: <20261104124437.296753-5-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|KL1PR06MB6180:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 45975e97-0b6f-4625-c698-08df3a723040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|82310400026|36860700016|261021123027099003|56012099006|261102123227099003|261009223027099003|261022105027099003|261028144727099003|261021121427099003|261026140227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	mt6qAVWakX+J8TZy4jwuPJB7/wa7/wH4blR4d+jRO1HQi1Mjn+KDHHRSHohBZKvFZxndcYuOcVumOySxut/dxBUjzH3gNkuO/5PCmlahSGoGlnCOubXdLbvr1X78gVBXdIZ7cWjI8YYAaAf36S8x3iubdtUFF3WHjpBKVpkT+OQexvuV8MLzTeeZ5Xu3eYPJp3SGvJcWB//Z2a2pV2aA7oi4wnKt76JXfex9qzDK6w6v75/H2FmBlFTUWQoJMC18FRIulX+Z6etpdlCLm/2llDkDnnI1Gw8yqgt/i53c1r2eEl15kGhUsGkjcA5n7CfHPrJFiYTcGf2Kn1/shKbwePnZVmH+mBkb8URheW1Lhd9w6jsfU7yZKTs51NHS8/Y9ZU4s+TPgH5KeNuYaxXRvkp6J2qKYl2fbu1JdW8J4X6R6pIEfsjo/HPVMUT6jDBZfb6eU2vAo/YsD5imcIqx2phD7JuD9i4H5Dh6mBDsP9waOtSWsgORjSNnrFLnhSaRjDDiAPwuDxU5zQnOSs2RYsqtfu2XsC7XfgvsPFgbBSd5YJ6IdBmzIb1WRBxxclt3GJpE3b//oCDcvV9F8+YuEII9FoxglTFS8w1FJTJzn1E82d8WLKsjgqvDY93g5dKvAqERQA8PRjutCMjmlWPohixiEnUi5UTxQk+Rx/H4xCTPhFr7q2c8DkVbH1F7tYwCQqlWHUzx3bSX7B9SCqT9W3A==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(82310400026)(36860700016)(261021123027099003)(56012099006)(261102123227099003)(261009223027099003)(261022105027099003)(261028144727099003)(261021121427099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n4+rTiqRaQoHWcSevZA6a/45wZjFg34vExIYMppPLqOERUaqITM1ABJonGUI/PSBZN8WXRXy5ocszdWRmNvK1aOHm0qoJ9Fetzr7cCAvk36EBt0B1OpgEozmtrRrANerUto/gUfNpam8G3iTBdXhATd4qz0cKqHwTdjEV8ER9Um28+0KAKJYJIL8in8SbUgBtRS58mjcwQJBLXnLwlx+MU1XblSf80W1xnPqZ+Ku6UZQtei+sGQvbackoP815D1wP14+gR6DtlxkFnn3S74jfeJdzfRgvSutvv4yUmpq+HIVb1gpFeBQ701Ku0MP/YW4rUyjM0CAcnIaM/7k3SojNEVFYrxvrfG3TjOXTsWWutN+/CIP4U0uIot9kYz2JLR7bF6XoIu2L4MCckwp9iXKWokwE7xerW2kcxAqBVNtNNk8j+FuAjTUc/CdnMHY+hUj
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:50:21.8445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45975e97-0b6f-4625-c698-08df3a723040
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6180

DMA-350 channels may be reserved for firmware or another processor.
Read the optional dma-channel-mask property and register only the channels
whose bits are set. If the property is absent, preserve the existing
behaviour and expose every hardware channel.

Skip masked channels before accessing their channel registers or
initializing their interrupts and virt-dma state. This avoids clearing
or configuring channels reserved for firmware or another processor.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 2f22f8a0ab47..b24e569a1dd8 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -1253,9 +1253,10 @@ static int d350_probe(struct platform_device *pdev)
 	struct clk *clk;
 	struct d350 *dmac;
 	void __iomem *base;
+	u32 chan_mask = U32_MAX;
 	u32 reg;
 	int ret, nchan, dw, aw, r, p;
-	bool coherent, memset;
+	bool coherent, has_chan_mask, memset;
 
 	clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(clk))
@@ -1328,6 +1329,19 @@ static int d350_probe(struct platform_device *pdev)
 	dmac->dma.device_caps = d350_caps;
 	INIT_LIST_HEAD(&dmac->dma.channels);
 
+	/*
+	 * dma-channel-mask is optional. Firmware-reserved channels stay
+	 * clear; if the property is absent, Linux may use every channel.
+	 */
+	has_chan_mask = device_property_present(dev, "dma-channel-mask");
+	if (has_chan_mask) {
+		ret = device_property_read_u32(dev, "dma-channel-mask",
+					       &chan_mask);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to read dma-channel-mask\n");
+	}
+
 	reg = readl_relaxed(base + DMANSECCTRL + NSEC_CTRL);
 	writel_relaxed(reg | INTREN_ANYCHINTR_EN,
 		       base + DMANSECCTRL + NSEC_CTRL);
@@ -1337,6 +1351,10 @@ static int d350_probe(struct platform_device *pdev)
 	for (int i = 0; i < nchan; i++) {
 		struct d350_chan *dch = &dmac->channels[i];
 
+		if (has_chan_mask &&
+		    (i >= 32 || !(chan_mask & BIT(i))))
+			continue;
+
 		dch->base = base + DMACH(i);
 		writel_relaxed(CH_CMD_CLEAR, dch->base + CH_CMD);
 
-- 
2.54.0

