Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022092.outbound.protection.outlook.com [40.107.75.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80805317161;
	Sat, 30 May 2026 02:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780107416; cv=fail; b=PlG5Aycw+7+8MN/bd5dEl87F9GWVg5/gYmdRY6HAF3EWb26cVRZQhA44tknuSMSbxbAG+Dv0t5FqY8748uXoywTcPAx/ow46ob+f2QoUFX1lbE0UREKb1WnO3wZMtompPxseR7w7qHgU5TE0Muo7sYnbYp/3f72UjavveXDlr9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780107416; c=relaxed/simple;
	bh=Ldh8eJPTAu/O0UCsEYFw6q3BMharNq+gOjt2vpZFWF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hxkBvIVsqPzmr4SxXYlU0rg8pWaVV4q5SDVwgTimSdDig8XXh9rsD0dc2aNaQafbR/phWx/XKAZIat7KMGVZkyhYYFP5pwoTcteT5wXBmPJfYy9/DU7YuNbJzKDXO2/RplL28WBK0es58DJuTjZucWuigX/kQYsDRi84Li9pMQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gu4UKUAqOotYhN5YaB+mpLgKRj/cWqZJFGnftTzgfkVKJZvB4ODz8uNJEC6Fhbo5/cn1SPL2P8HStzLsjmTqFxfBJ4zqKcZfFZZrAfgE1nHBAWI0PJ/ZYLd9GDhzNpWYKtGhObCM6TaPE8m1kcMqgTR0vzWRv+LXwAw/pSqo7K+d/Xnd5wAJqWxa+TBxt8v7OzOiLQLqEhlkNSoGBIIyMuzrQh+frDsahMDabjBGgkyEJlIRJ1nVaqANOpszbv0hRTgI9iFuAxODuh23IQa2zvPJs9c3vO1UsKSf1DRJCwmEPUso70/49DQRLbz0OJ0S5SqXHyyopXxtVtm+J1U5pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXh3Wti8eKnuCMAC9ieYkoT+PIOonInKzjyxMon3bR0=;
 b=K2dfPAAN/Z10K2grPa0SHHjRnad4JcbFhhGdjGTWcINLPfI5Rxop+B91dhtC841I/D9GkFjFyUmDFXERrPr8FONGVPCmZWEbkuNxA9iLvcVqLzXjzmnq+ZZvOrTO+A02TSumKRH/224IcjyR+qsPPvrQSIpMUfrRogu8/mrX9GEEbUmLg1rAEhOPstUcKx/PsGTzYA1eiEIxMPUxsZs6+oYuIK7vCctjqL/Nnef97uI7YGqkpc+GP/4cMZmhw33VI3PIqkovecLd/cshAoGfaGJNOFKz5Xw/C8EoyKpGt+R2fvEaZC3Lkz4eT6vFea0A8da5SvM8fpPzWmneGQjp7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) by SEYPR06MB5985.apcprd06.prod.outlook.com
 (2603:1096:101:de::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 02:16:52 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:191:cafe::87) by SI2PR01CA0001.outlook.office365.com
 (2603:1096:4:191::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.15 via Frontend Transport; Sat, 30
 May 2026 02:16:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Sat, 30 May 2026 02:16:50 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B471940A5A03;
	Sat, 30 May 2026 10:16:47 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v1 6/7] dt-bindings: sound: cix,sky1-ipbloq-hda: add hda dma memory-region
Date: Sat, 30 May 2026 10:16:41 +0800
Message-ID: <20260530021642.64059-7-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530021642.64059-1-joakim.zhang@cixtech.com>
References: <20260530021642.64059-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|SEYPR06MB5985:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6ffe7d3f-d4da-48e2-7533-08debdf1828f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700016|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ht1O4gv16uLmphr/MmTo4TQDq7qAF38Mq7TygX6C5n38THgqkcceNbSpSxIu05wGU2vYmerNkPGrkhIXRCljDoZBv5X+cJtdEGPpDL0tVAMR43+wWkYZ4GGE562IKQXoQ8RaAG4GaI2v66f8ZlXAdD1EFt7EfYwgJhVbLca6IEyhVO2rNcmTZ2/21yg2ApMK4WbjakIMc7AtBrF3E91STTqqxrxCLBUj1iQ/e484xezaFB3LV7WIXJtelw8Fev1n8hjO6ltlZ7GZzQkSlqnxzoCJvyHQM3mOjs6+Ck2m8wY/AECW08DfSwEronaJqbMnzvHCKRsxN5lCEVX+F105SnOLEKzsoFs5CEcQ8X6p669E9PkAqeF05F5lVi62lpHLeQNKDPAjOBp2woK+xe5c9jKhQamNVbhmHVXoSxT4SkUn2rMvjhEr0Mu1jIF+JFuGlTiGIm1Rf5Y5NCvT0zsj1y1v7N38eDMJOywENzhbOQOKYHdL89Tqop4JBb2Mc88sZ6c9RtnZ+zT5u7WgVcyO5GQE69cVr3+8UTOL6PAq9uinnq5USTXO31em0iDWMsK0uk/XfonHRsJtbcdGkbyRuiEzDt/gPD+CXh4ZYv4/RQyLw0vS7K3TzYmXyNI6dZRVVbX/sQ7cuBJuSE7V6BiyKBmHnF6XyEZMBHHZkzEqtGHK9IOnbFXo87qEOyV9m4DgOPDUH/c8MlV9IR3kwpT6AS7eu+2mJx4XlEnrzxlAAvI=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MBdzi/0htgt2MDI0PKSjc5EQr1SyCH3LxlZt/f2nDXlfIfms56JunA+2j5g8R67nasvgSM2Q2DlzaVlYdSJyftDyNMAheyiSCpLAUdmJmCFXxHqo0wzkIbLlan9q+JrTgkKz6SZjJ4JZ6zVGab2rx8ycie+q7TMfys+Petl61z/K1xFgWyxm7N47suci/3DXiS3dmFr4ZVnBjtSk0RjOSBmx63DymDQnIlS9z8iFySnhzIupiClpIDhyXYV4dJVBi4l+q/ewBaSHnTFw5sg/1g1K/TlKYNx5ugs7DL83xABmSr7Wmj7lxRs6+KJf6gf1600vhQcET3RT8AQRzSNKVV3JpVc5oX6ImIiav+8YNfg71PwpxuzHMSWMnEdiamDfkzc64aoTYpcpm5R+HlJTjSYkd+aNs9OuxqzqXoE939XR8sX4rNEFZ2q4EpS4QlYu
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 02:16:50.6525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffe7d3f-d4da-48e2-7533-08debdf1828f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5985

From: Joakim Zhang <joakim.zhang@cixtech.com>

Document the reserved memory region used for IPBLOQ HDA DMA buffers and
require it in board DTS.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
index 02ac5f1aa926..512250290ca3 100644
--- a/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
+++ b/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
@@ -36,6 +36,10 @@ properties:
   resets:
     maxItems: 1
 
+  memory-region:
+    maxItems: 1
+    description: Reserved memory region used for HDA DMA buffers.
+
 required:
   - compatible
   - reg
@@ -43,6 +47,7 @@ required:
   - clocks
   - clock-names
   - resets
+  - memory-region
 
 unevaluatedProperties: false
 
@@ -59,4 +64,5 @@ examples:
         clock-names = "ipg", "per";
         resets = <&audss_rst 14>;
         model = "CIX SKY1 EVB HDA";
+        memory-region = <&audio_alsa_hda>;
     };
-- 
2.50.1

