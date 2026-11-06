Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.90
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928929;
	b=DIWFE/NQOUD48Yl5Cv20n8mAyAT/fP49iM5xg4E0tx7ogRcjteYYO57nJx5ChFhayKT2
	 YRyELwS7q4v1cvHRgydG1nT54JTZzdJPIyD7mGUhDx/SkHG2VSWQWrKisQMokCjXtSJLg
	 E3AnTSp/cNQjO75l+SKzzIi7rCRWkHtxmOaWZa7+iLdRjuLlb1IJpWJ+MB0+7BKecivrp
	 bI1I7zfH88RDRzuEt2LpjWIP50fIgmP3wGU4HJTnrCVbFG5rfSAq/fKnHOuv29TWv6/Sa
	 QkJyS/l5jw8Dj2IylCGVcYX2P9a9j+zifmhhgnhYvnU1hrpdtf0mLKv9djpziuFMTFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928929;
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
	bh=HmNyehJOmXwQkRUSz45PQ/GbByBv8N/MbDAS4mYE0Dk=;
	b=g1nn5YkHDnaeh4SBiSgS53BcQU7dlytfGqXR+Uzb1d2LB+zEYJcQjUA6l3Mb7ksGSJYA
	 Y6zzIpIXkFiESu5WKsM6pjxM+T8qR81p5vhox6GAa889++DcNa6MOyrQR8zx5Llix0OZ9
	 jDI6iswZT+qABFI3GBkChQP4Nb6iPnp/rLiP24ys1BfKNmZy+YD3sQAKGmdsPOnyi8Sn0
	 GJSv5qOUi27QK8nNUxXGJKrF/BRAvH9/yDbO2sGQAHAoresUPFDj4lt+qQpfzgiOoyPYe
	 ddnJZsMyCvl1ti6wqZKvicXgOlpjzcyGaaezVlxX+8CDCuuMDElCu9AEKXITCJEAUuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.90
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022090.outbound.protection.outlook.com [40.107.75.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF528606A333;
	Fri,  6 Nov 2026 01:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF528606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZH4Kvrw623144/pr0x04QBtSg8NsXpPhKG2d+2cqT0irxtMRXa5vGaMstTp6Ceio2gGTOvXy/n/aQoZmAgBmkBcLA23dUhEJHH3Wk5R0AD9njvEK+VyVqJcNIyuOElZjH6437MFAA5z7IqwDBMVxZcFb6xktA34uEUS5vUiDybG/mrX3bPD81r7sRoQ7Xg+yA3Wb/FbatMQDd8LK3fJvF8+pLm3lSrEiaabYNNFu6OacLL0xMbHJPT6z2EuHKyvwzR1H/vyBCxCJXRWXV7k87acgnIlEnWc8yOmWSJhDDIE5P+NeBM5Qh6IJmOPYkAKuuuZCgNwbXfuFMgCluYtbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmNyehJOmXwQkRUSz45PQ/GbByBv8N/MbDAS4mYE0Dk=;
 b=NQ7AslPwKvKXKRshxpa/HN0Qc3FQh7X7PGvIncYeQWaA1KZ20CH1aiGdR+JHRHe9ebVtGLCXg7lfj2xG+t6dvPM2ru7qk/M1ewZid/MWkN+J2tuYl3iBM1dmVt8U6Lls+QM9cl/LOm7ag2YvNq6hup8aRJcA/91jXhXcOaV4n21Z90ROwcKD5Cw15ghwARhrwnM+2FmrMdsdhlUZ1lo4zrIRqYN+DACscveUKm6M9sx37TcbY2Hxo7P6cdHL17+hNsRVT/yb9LcPytAJ2uCLdmpZotpHCsW/oouYaD7pXAirg02Jgvcxsiy4A9vARY8sUqSbe9uTx+3EzVndjd75xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::16) by OSQPR06MB7990.apcprd06.prod.outlook.com
 (2603:1096:604:426::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 01:35:25 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:191:cafe::ae) by SI2PR01CA0003.outlook.office365.com
 (2603:1096:4:191::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 01:35:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:35:23 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 70FC540920E7;
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
Subject: [PATCH v3 4/5] dmaengine: arm-dma350: Honour dma-channel-mask
Date: Fri,  6 Nov 2026 09:35:19 +0800
Message-ID: <20261106013520.1134450-5-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|OSQPR06MB7990:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a473a0b6-f603-4758-5d3c-08df3ba63a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|7416014|1800799024|6133799003|10067099003|18002099003|22082099003|261026140227099003|261021121427099003|261028144727099003|261022105027099003|261021123027099003|261102123227099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	qeG80kQi91Up9dYuqdFCvZBdpUcHDbV7MonUOzVk7MgHuW96VmdiOv1UKLe0F/+wf6n5PTrQqH7k2x5cWVEmron2QGttzrl5j2xrA9jqwM/dxSbtInESEwBd/kygJQuXmVZ3mRA6jent/wJz/h9q11G40eGTGwihTThohlg3yp+sTEKHsJLNvVcI1tvAbLh8Q5tJ/RElcEqzr7JtF+lzvYDSIWNcRn9Mjpxjh70OVvUlbk2cLLVoXYFEQ67ETeZ+iW1kQdzCdnQfdG+eVp3um8gyLD/I2urNoOu7YHDOSShLvcJUOkAb5dsMBiP0usFM5PauO6sck7vGUo8sZhQIYA7fc3/zmGWhXGo+noG64+V6DR8MgBbJbuPy0Yed+E36tZCiNxCgs6I1ve96GmJ75x1TjolaJXcWa3lVB1p0KNNK6wzPL0uY6Cs/tbvnrDvOCabWLvenhn6zF/1tNMnlf3gkjXOBNkUsf1mLtCoHuDVQT3x29pNbE7cy5Z2OAK1RSO2Ztjg5WArBzHP92uRdm6xURXsQqfl3JET5qjRfI534hPXj090GlhhrswY9oS4FiIM2VXmaGVlL3BFh7wf3++8Q1sYO5FtWnR0lbrtC2s+5MoxnbYIyEOuz0Ni2Y9aeqX1X3XiaZyOp8nbpPsr8Z4TXZG+ccUeijyPRC3I1pojJG959BzXcI4pQ2hH0g2QV
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(7416014)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(261026140227099003)(261021121427099003)(261028144727099003)(261022105027099003)(261021123027099003)(261102123227099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xox/wfOnLJzqFBf77bosJekSohHumNMTK6PyNSkWB5z+YWB2IATTMWZDTIUizpmJmQ7JuIw7Gz7NemiGH6tAEnFUk4015ZcBx9TG/dLCYBinAaFQEDdvMMiEfq7zz/EFKRW/cq/w/mQlDrcQ7wfZ/kRl47mend6f1KYEchM9VyuE4DzXBgFlnLSV6PWS3gsQ6PUCK7f2oFWU5Eb5B9Obwhkwpipa9TGn3HLMX+4yZqw1fF+8XUq0HkyYlMZDdXXtCAQ4XWNhEAsFFQf69faMiNZ33G/i6mRRUKR53ZLRbSmvD1q+Yn2xKsWGSdq3d+9xqfGv0YYFE58z3+IDXJgfPN/Ua8FtksOH5Vp2PSsQvyAPN8rIeoBj59+BX8VTfgoB0htyV69x9wkG7DpvVLfAWR6BnY9kqTPYat6ag7v40iXkSvlsooFe4ViR9xSJIBAa
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:35:23.7978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a473a0b6-f603-4758-5d3c-08df3ba63a5f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7990

DMA-350 channels may be reserved for firmware or another processor.
Read the optional dma-channel-mask property and register only the channels
whose bits are set. If the property is absent, preserve the existing
behaviour and expose every hardware channel.

Skip masked channels before accessing their channel registers or
initializing their interrupts and virt-dma state. This avoids clearing
or configuring channels reserved for firmware or another processor.

DMA-350 supports at most eight channels, so a single u32 covers every
hardware channel without an additional 32-channel guard.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index c0ed7e86a269..6f26d74295a1 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -1265,9 +1265,10 @@ static int d350_probe(struct platform_device *pdev)
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
@@ -1340,6 +1341,19 @@ static int d350_probe(struct platform_device *pdev)
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
@@ -1349,6 +1363,9 @@ static int d350_probe(struct platform_device *pdev)
 	for (int i = 0; i < nchan; i++) {
 		struct d350_chan *dch = &dmac->channels[i];
 
+		if (has_chan_mask && !(chan_mask & BIT(i)))
+			continue;
+
 		dch->base = base + DMACH(i);
 		writel_relaxed(CH_CMD_CLEAR, dch->base + CH_CMD);
 
-- 
2.54.0

