Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.132
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792747853;
	b=o8i58Gzm3LjS7XC7zBlqbMMpDM0k1cT68jir/kog2g9s8qM46SVfKYwkVLVtPq4vx/Qd
	 555ZarfI7sq6KUNBGwiSD5SWnGy+PUcW04xffPhRWZGLrm+QSSTOx4dYmAd0a3nd7tiwB
	 JIlYqAMGqwqaJKNAClre4s2nvkETJLK0iz4UGaePYQn0P1LSCyEPtgTc3Xp7zd78k1fIE
	 CetED7Fk8cirhqkBN63GXLoLMQwuAsBNHX8otrPboW+h9kX7ynbi0YDQTuCGSPBt2m/TW
	 G7NR0yJYCiuSBdU2UGDpPJXPdnWxgTGTlAuF6G7YSIIzkGPzbqrh1aVCKn4QG1nmYWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747853;
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
	bh=h3Psh2Ln79XIDklh26NgvODE+n0LcA6EzIdhkNIDRFg=;
	b=gqfg4yQ/DfznmjH375MVph0ujVeMTz7ZLi1e6hNjuEOePRYEEKNGOa3TDU9QL0CQzgGd
	 rCKGR1xp2wkGEh8EC/qnj3bir1c4l2CRtf6MCRYyB67K92JdezJs2dHJggX1Ey6T6Lh2Z
	 ga6wmZeVk8HcLmQ4+H5YiixqgK70jNQRVmFCpPZhiZI/H+o6oySRsqhZnXjEV7vQqDmSV
	 Y/FZfa50r5RFo7cSfTpeGa2U2d9qGyqSUksNS5/ON+bnoNvhVdm76bH3t8IDZjwI+kW4C
	 hAsH4QMWfPx2/iCFM/mlvmw6b/GB/cM3wsYshcck0gVHLNPKTc3QDJFISRilpuB0NSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.132
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022132.outbound.protection.outlook.com [40.107.75.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE41606AD05;
	Fri, 23 Oct 2026 09:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE41606AD05
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4/G51JrWYXveLLOw4MonyVAx1Jhv9fcRDgEmWBVnJ2gyiGWKlUWZuI6LvLIaRWJRDiP8Syl5NpMTPiNHigbNH38AoO5oQvyqCD5xOVWzK/1amyCAIOQVoPmS1Yo8RxzkGk2+sqTAxowLxbjPfXBguPDwKrBR40ecmKoUDozQyoKPVLjCbPGLjwkkkHmwIA2FEToMXTu+7UGJLVv4BQZM1glHDwb7SHL5E5mqb88WqtftZbbfcXDXnLZ3NSoMhjhhp6IxTXPKmi9fojTSTPRgXrhwJimUzCd8g7XISOTdmoAzWhds3z3shXcjqkD1QLD3YA0Bm4Y5WxWWKcLvhvwEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3Psh2Ln79XIDklh26NgvODE+n0LcA6EzIdhkNIDRFg=;
 b=CuT7/qhl7fSs6kH9i+vAprHHU97ZC90bGb6DFKwIpbaAhCpwNYHRQFCgXASwqg3QcenCJrJty611mil8U0tp70yV4jOeRjws8ArnPktIth6pRSbBGOPyoRaDKXkkmhRCoOzfTXkd1UQU1PFgnjRRh0m6g5dS1c8R5Gp1hW8JXaqJWzjucVeZvwB1RO6cLmBfAXXBbTbDCiS/Y9XFsYBGFmk3xJkIZSrlt8lmB5AqiJOrBwjQt+lLScVlOUHWaWMaVFM6A2PC3tEyp4De/Bzyqg8wSmFjPZ2VMoNFVqV5q674DozMe1DtNaDnQHlW/12fCJR8scG1/PqyuTde9ha3UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SGAP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::21) by
 TY8PR06MB9176.apcprd06.prod.outlook.com (2603:1096:405:3aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.2; Fri, 23 Oct
 2026 09:30:48 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:b6:cafe::8d) by SGAP274CA0009.outlook.office365.com
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
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 09:30:47 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E73FF40920E2;
	Fri, 23 Oct 2026 17:30:46 +0800 (CST)
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
Subject: [PATCH v1 3/5] dt-bindings: dma: arm,dma-350: Document dma-channel-mask
Date: Fri, 23 Oct 2026 17:30:43 +0800
Message-ID: <20261023093045.3248630-4-Jelly.Jia@cixtech.com>
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
X-MS-Office365-Filtering-Correlation-Id: c24db466-c210-4e00-5d7b-08df30e8523a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|7416014|376014|82310400026|56012099006|261009223027099003|18002099003|10067099003|22082099003|261021121427099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	WriKSUVKDZ1GW3bCyYFGSPu1L6zA5reXEsASkpjUasKOcWLUxfRbYN+8FzW5FJCZxjYhQIyjT4CKvC6an3Dz0nSRrOZLjEF6KuFHNJJqdMeoc1JHIbFSQ02Ct94UXX5xJjVGNffxCxD855tW6ofnBLCN6yCB6mbT3QaZ44dhZBNTkRX1DmoqhliUH8Ie3YVHNbIxkbfWkU7an1SNt9QduDoTRyAs/ur5R/xNsAOjh9oZCJtcfXfR2DMIqDCxnDFuEkcPRvRQM3AfLTQS6hGLasiCXrAp9G5HAf1nIxed43nYcg17rWl7dfnleN4DDVBMCIRUV5ZUa1U7AkOwT0ccN/8lizdELlo+d6A0NHbzaR+nsGQVc62t6sXMBKEG2bLcaC6APm1ZQjMXpJZZ5L+GR+w9UosFEXLQ6mSIs/NE+qt8Kalq90Dcyxb99/K4H+9+B+7DyLNKddc/TI/jRzWrurjEAcu0kjSp/HJksPvVJ6cWQJjGr2CWkqCfgA711CQR24IbQI5fOtXZFX7bRO26dZZeHRX8BXCEC9GllwZD+5YmQnu8fqITsQvg5+p5ykCY1fty+cPKif0kBngMysb+NPifIHHr6yqUz96hoiU5WT6Bm6oshF6PNIbbX8S5yIMymzvZVFZYl1m2zGk3Ym7cWixxu43hVmQ9WglafgtKwAMe+8OVBU9AF1C4VObPBm/410YOUwh8h0r+IbgRycDXUg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(7416014)(376014)(82310400026)(56012099006)(261009223027099003)(18002099003)(10067099003)(22082099003)(261021121427099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hgLZkeYiECfVMmGm7RPMR6CujAf/NZDQXIHEArw8gYb7Et1Wlrgyk2xLtSopMELRMnmFxTYQbWnmUg+117FGqyJgnRHjUOPr8r3SWkthRlMTZPhzZgoVvEpaeqEHycRf/DY2zxq/14AwPykUwQ/ze+RYCIK/hVG9ZOUGA3uavsOQ3WkOjS29BmL82fWO74UYJfYeB7JXQs8kxxFc5HOj8dFCdFofCl9+tQEgxueUL2nvv+lV2d/ZGp/FoHIWXT53Ymrdxp+7/U3qyRl80Y9OsMZ24Cxr+dAWr2nu3t1cU5lVI2O+m1hpqlBEKkIsKpuDvS/oln+Z3ucMARTrbLmMKklJpuWIM0lzxY8+hjdUBdnxw4rsad4tgz7O1FhCkXxm8FuMYGOJxCChr7qfomZ2p9EZBFH5O9A+x1Vz2uJDRh03JUtQElBwTz2zYFZXr+54
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:47.8369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c24db466-c210-4e00-5d7b-08df30e8523a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY8PR06MB9176

Some DMA-350 integrations reserve channels for firmware or another
processor. Allow the standard dma-channel-mask property so firmware can
describe which channels Linux may use.

DMA-350 implements at most eight channels, so one 32-bit cell is enough;
limit the property to a single cell.

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

