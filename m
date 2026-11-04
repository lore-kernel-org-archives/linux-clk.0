Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793796627;
	b=hd2WzNXCJLOO/igtVGjRU37SYUv/snI16T45Hv7s3tA6PZvPzNToP0ukrg0WfJN6Wqj/
	 GO+krnG7VkcfhX+5KfW6ypmdClkbaPSY9JBXj27z6G8Dp7dTGKc5sb/u+ngbvaAZMnjAG
	 FV9CwOUrq9c695F3WEyBtGUJ3MoTGP4b5dRzjtE7gT8yKDZaPr28N+y3D3jSN9Bc+ahef
	 8c00dwwv+HKrOPbMRwK0XRyNu4w/ehJOZFnrm9oMcJiCh3qVyqs8J6xg+6il/amiO9AFI
	 Pcj5s1gPma1wUbEZC4ubWSocErpyRs07KLZWu4oA2INTHK/GPSzvemJTd5i0Iqgepfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796627;
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
	bh=yDZPcnE1uFPGSiI0MS8aKMlU2GHR0GHCdoJTfCo3Xdg=;
	b=jzj7LxsBCNpwXKVhV/TTTJxW3QSec6HRN+vdJMO3y/Mqf7VXTqCNbmQVNhKZ80axZpUh
	 /5Dlz2VtMMhP05xHIB35wUy6NphiEbbGvA5PspdKBG0oy6J09vPIsEGrXtbBfV61ne6lC
	 TWkF7q17EOK8lETgQqKXCAxb518Laq24n/ngJMHpmBua35c6J+BAuLgG1gNGsfn8mvljX
	 clyQ3Rkq+SbuZQrrLmuQ+UGRcv5h3ZVJcGyBUq8ccoXMshhhQjD3CPmwneIg6lAbdd+Fe
	 5oCAbQybixvDGX4h3xMq7CJlNY51wiuvv/u7PtLTSm41wSZTXXY/+7futskUo1oZWKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.86
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022086.outbound.protection.outlook.com [52.101.126.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC3B606A336;
	Wed,  4 Nov 2026 12:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC3B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgn12F3J9jNMrtTqITPxFo1mrHXRFJWDan+PcWCpvdHYyGpt0FMpZYyhwjg3720JSLHosMD7BiD35YtwjCsMvDRODVS5M9IHt9hp+EYDoR7Yeif+zSB6cLNyEnLY+9woWu3On6F6Ht1ONbCv9snGVOZ30bQdnl9yfwd3lpIPE+8QZqR/VhW+MHR7/3N2bgYH7Xk05ezorndEvtqBd9POCgGIY6AGhD32EH3DQ40lDPtRKxuJA+lcZdh7ax+qrhUGt9WBuZibsv56F09hSf+OX9ZXcM35eNZwezk8kpx4tqI1F9+2vgmzpgzhybAyuBS+yyNZj+7B32tj5AYSBA8Ehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDZPcnE1uFPGSiI0MS8aKMlU2GHR0GHCdoJTfCo3Xdg=;
 b=kr4eJGH2iZtdFE2HxhnXb+E0r3jv/Y0sKXKu6mGaWc7dPrQIRKZcNrUX/ryy6cLL/J7Lw++7mpNluYGPLE+IXqEeWt6FhQYBqyN1WSR9CimRoQEeW0KtQcldOaiN4Dd7/gyDbwHXxiLZQl7Qj+S9dHZAj7BvDlWAYUZsms2WoGKycvd2hcWQQSI+kAdf5Y/l3atfUeUODvBpPaT3Lxhjo/3m/vTiQLCBTLKIa3oacDPOtK/LVeTg9xxRvoh80TZhZY/darV8SZe0d58LUBjHuAZ81Zp3MFWgNfV4RyD7oy8oHveGtHmcSb0m58mJc6TO/vvVIp/rD0j8JOdmKsFoog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) by SEZPR06MB6551.apcprd06.prod.outlook.com
 (2603:1096:101:187::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 12:50:23 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::f) by SI2PR01CA0046.outlook.office365.com
 (2603:1096:4:193::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 12:50:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:50:22 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 574F140920F9;
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
	joakim.zhang@cixtech.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 3/5] dt-bindings: dma: arm,dma-350: Document dma-channel-mask
Date: Wed,  4 Nov 2026 20:44:35 +0800
Message-ID: <20261104124437.296753-4-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|SEZPR06MB6551:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1acc1b6d-6825-4287-ee5d-08df3a7230a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|82310400026|1800799024|376014|261021121427099003|261009223027099003|261026121527099003|18002099003|22082099003|261102123227099003|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	SMX9AAg5w0R6PUmCeND/FGWLycm0wjDzmAlvT3+/foUnmdFwuC5KZQDF6zZpdj1Wdlb2gmMxeAjAECgBdhwwEQQbw6/BcIfs2PiVe4vncdCxFK7/9YyiXLQS/Q2EUooR+c5vsjYsSU0jMVLzS8muWbwBvjwjI+BWZOaW8O3bphiIPi2gw2TQTFugXloX+oCFr5Rz10+NzOQuUepdr+vRAG+HdD6r79meZGMHP1vH1/llcCZ/vrkbkCyhPP6k4oimMiEHjAJvG2V2MIFt9oebOcn6XkoZE8AB0QRJyICOhc1KdrMpnBoaBywZZ8cWVIEtxOBqw/1uFC5mPG1vh6Eg4G88Bo/50wdgfXatpO0TbUJ+8etBQxXh4g4YkaeiY5apAvmeJfoCBRCVQ4iPn3Im72YURVk2c1X0bKirZ8echJT+BcIXbMfd5MTDDOsVIdl/ug4mJQLQVz+jtjm6RCnlhpTvCbpshTsITvl3zpsCJLD1jDQMV2MfprXwCuSx99WvX3o8dIZRXdVU4PJZ7ji4ib/dPFSOlF1a/N/OHfZxGBvgBaPXD7yUfoXfF9DE6MyxFTLRBjziJHDxTTiTB4ig0Qzz704PwZni2lJePq+dFvH3FZTpeh0/6qbo4sNK/mceyBVLsJS460bzNDViD9qzwk6Tf0Mo5C22RWwNOST1ymOCVP8fNKz6uEchrG1aC5THrOtubAd44FUhdjF6TGmVgQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(82310400026)(1800799024)(376014)(261021121427099003)(261009223027099003)(261026121527099003)(18002099003)(22082099003)(261102123227099003)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kwoGkAftb+tBTlsg+aM0p59u4QNwNL9fU7IFULVuWgLLjjCySf5QKLWf51OU98F7fjOncDQfeuOHFS93U0u1pYXLfR4ZuBjqlOew6CSj8JA1+Yj16y7BwOwO1kZ+KXgwvG+StaBosoWagYRSB0HuF7XNg2y6SlNWc3etesyrTOM+LgwJmhcDYxRYdLnuvVkwDOCudM/9pdgTxqbHq+3tJHNZTpajVMsKmxZhNY1LIj7riN8tlmxy6fEe+th2ukTdqX2WycNmMFu2Y9ntKEHmZ9HsAQOSK9WDizde8k6cihNZwpLxSwBl9sG0qyiIyWWzYPTc3ZaoEyM9rF0PobntkeD3XCQ9SZEdSsew6WdGNg4On2E+57A3Clq8tXt+vK4JSdw/guq4aQoHymu0cK+BPJePHx8Yvc6x6azypcrK3lDh06HSzBBfQhKC2gqpNv+i
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:50:22.1725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acc1b6d-6825-4287-ee5d-08df3a7230a2
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6551

Some DMA-350 integrations reserve channels for firmware or another
processor. Allow the standard dma-channel-mask property so firmware can
describe which channels Linux may use.

DMA-350 implements at most eight channels, so one 32-bit cell is enough;
limit the property to a single cell.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 Documentation/devicetree/bindings/dma/arm,dma-350.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
index 43279878207c..98e7bb651210 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -43,6 +43,9 @@ properties:
     description:
       Optional reset line, where the integration exposes one.
 
+  dma-channel-mask:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.54.0

