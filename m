Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7954F36607C;
	Fri,  3 Apr 2026 05:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195416; cv=fail; b=IzuGpxLTh3liauprNUjsbIf5Ryl4JAiyY9ViBPADiQXdh4hClwC4BF/ubG9OQCN1xzTQRSru9uZKkA8WbTlqm7m2iAkrHFaX73ysfxFPFSc0pW4ub+vjZ3UBQXySxnQxVcqj7GWPqxmGsA/FKapjxUdRhFVtYTFbRaDnCqWbogU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195416; c=relaxed/simple;
	bh=hxRRR0084BLIdry+fCfbGTyAaLwfAGUJoU1XkMA6S5g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dJ8ZgXRDwm343rBbZA2kw9sozDOgFev1TbT9fGzYiZMSvQpfgR6K68Ey8uH64/KWmIigsC2pTYlGHbNvOEHyGFTpsV+6Uv2XSLR3d3v6IWkwa+HftZX/LcsN+PVAiCE/97THNBuNjo3vXNsdOas3bMAMdDlL3PGi9zAgHanZLkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwHGCQgEmPNCcdvndIzlTbDs6a9VU3cCnWJhx5jOs/DH4qRGD/BS4ULcBYIZCHHGKtqze5apT0P1gWwDQhiX8iCU+ewLF0ApGTRfWO5v6yFjuc4IC7Na061JFpFD3g6+Jpbv/7aZ9vTve6qtwNQ2KhIjVe9kwBpuSpfFMtcGMnavtB1VPW+xBEPA+miiCmwryGcygOl5vR75kNDvhzhtPzp5lSRTbktLZ85v+0VWz2QhdggQy7p1C4nVEESXohAUu6cZW//TZutLcmKT6SdUaLEXdcfeMk4nVPVUPn2gV4KLPI0Wt4znvp853BFILUExDDWYvLd9OEkB0JZUfC9XEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTUQOViuBUTbDKHXwNfc6CN0rH3PKBtsmYyC+uPOem4=;
 b=fwzLzqJW+PpUxKu03/UZANeMgplpF9JXHrAPQu3Zo0epyF/9hTtSyZHx0F4DIqFp+YLcpi7UR1LBr4BouvazEv6QfBpn5ztrWW8jW0IU58ROr0Qu6hIC7fUQkl4Qpd9+YnkC5SyoUs7MDBsybMc+/GSgCUQgfcGlK7DJnvs7dt/03yle7TWern+XP4hXDMkI7NBIHooy4H8Kiog3cSeP2CE5N/nup9Bug7lYaS4m2JOae6PfJAYvX12A7HM9UhkAdO7xcXA99bid0B8NjBVv0w/1BgMdx2LWGAxwMBp9Xh90V5qQNzL7+67f8x5+L+lxWizx9ciSur9B07cXccW8mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 05:50:07 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 3 Apr 2026 05:50:07 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 06/13] dt-bindings: clock: Add peripheral-1 domain PLL clock
Date: Thu,  2 Apr 2026 22:49:38 -0700
Message-Id: <20260403054945.467700-7-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0052.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::19) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1252:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e137d59-317f-45d2-e09d-08de9144dc06
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Mk7zObzh2tqumR6PI/QcpSFFdV9CtLQwgIyZC+0jY+C5S1ne/JgQvkNhjjRYwRQl76xXDUeZXT1gxbx2vvDVu8j/Y29/e4kblUUKYTw4u9R/E500imNk/CvwBmazbZ3kVMdcC2HOIZT8mhiwKzqeieofrwuT+Avs/hndyG7qWi34iQZU9HtWsz91YJbjRL90v9ugvWFnv4Ou4fgqof7l08XVHMH0b+XCMjc83AGQsAn+2e1NSC3qcsoC7w+w47a6ndor9QgjO2RcTg/ChggjEknvW2WA1u9VJxYLT7vSZNObVHO/5lxLPOtG/UxJZwE4VFtREXH12o0566U6J1e78luVFTPAgjIOX6y3R3sy2s6LY6tTMufqujyU/apXQ5yHT80QyGMF2XOYf+byPTMIWd80vZb/UjGfTlFEvrsjQFJdYsiQaYsrCd1xza/JESzn3f39ONcRXqeHmz1xoqiSkQ9auYgxccDlpIrg1UGcZ/tnH5a2PeierxLrtaoJAygHl1rPTBfAFcKNCjdiMjshMCYCFHilh8NH3uFNUE4OOBOPI9maEK9h3oYZkHNDznTy/OJwWgl4ASlmooqsvJTNroUZfUPduhqZTcKPf0NCb7Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J7SXPol8YG+MCwk4Dqggn16T7gBDyT+FyWcndpkyjCQGrmuM/txBH8yY7c+v?=
 =?us-ascii?Q?KdmFBtbamY7guqE51dwBmtFoX8Cb/ZtkH4wOiBG6WvSOvHfyB53heM9bd1/0?=
 =?us-ascii?Q?XToyM+9L5FfLKcg/qPshuH6N92joLlIBRnUChq1qONJn603hwp4/jE0ixMRh?=
 =?us-ascii?Q?amQr0dl2qCqu8hXMNvqieQu1fgOXgstAeyrVeR/dMB3hqPH7hSNQaSyukZq/?=
 =?us-ascii?Q?oRqVQBF7lCJvMjWqxS3DBFkrFrNPNJeSKag7hESxr1To7tk6JAeSWUWa+d/T?=
 =?us-ascii?Q?plvVnrcrx9iB1mVPiuW94jdr2jPz4ukMTlF81OTbIVRBkdcNDhtHb6C9Y002?=
 =?us-ascii?Q?ld8N60ZkH0rqtsanjkg/qGpI2jIAxPIGBCZZwN7q8I8m2GsJP8U8pt+aMofw?=
 =?us-ascii?Q?mwsJjvzc0Xx22w9xk++4eIl0X+pPHb7ZkDKWOoidUxDiIMIc3+6OzGLoWhKn?=
 =?us-ascii?Q?RbetxmXAzcLeyoGkNflVA4OpQueVLe6KEZ73x95x/e/Yn+4MacG/DueOERr4?=
 =?us-ascii?Q?fLVRdLioVbuoKadCC+pJu8UxKci9g6uc94xYTOoGyKBBjKrgkGlVkDoncAJa?=
 =?us-ascii?Q?ASEMRoQXo0d3gxQp2wTiVZAHRhTfh/dR3MawaaPZNqrL9kD2LPjsX/jLjyQu?=
 =?us-ascii?Q?0PnQeQRdqORPcqr1yByKflfnnHzu52P3OTW+V/zN4bsrPXCl38lfuwDFPX5p?=
 =?us-ascii?Q?omHQlWgfCVo8tCOIVX/diRkd/gmr9oc4oXIn/G49eLRQBCAhLM4NWNMRZiMv?=
 =?us-ascii?Q?W1CmEvyYBbjgncjvXT3iSa0gAIVfFfYTVc2Lw/KUU+ov+McqHAUGoRUHQdRt?=
 =?us-ascii?Q?Dqv9a29gXKe4Cd/ufgQs1miDQPh0h7hgCSxF3WLgzooKiLWF/5dgTQJ6JsXM?=
 =?us-ascii?Q?X6T5409BsGEQyevwXmHV+8oA+1JlP/PLxpNxwpPq+R3x5XAvSB/cfC5Dre2C?=
 =?us-ascii?Q?GVA+M310IDQBGpFrHXNUoimjmBH01XdoCn5RYwOC538F6Y87p/RFwohce/SL?=
 =?us-ascii?Q?vw9oD+yb3ss8RBtVR/5fAjDjd7Tz0QE90BTovZwNunrl8KdIz3gVDZV4BVEm?=
 =?us-ascii?Q?kPtvSxHk9PR9mHmHFTsDDVHm77XI3LlTSkHXY3t6IJB+DQYvSIn1Uk40bx7q?=
 =?us-ascii?Q?cp/ZZOE1wPc79qmcrtYS1Vvosso/r3cu9pD+62FDmU1cYmO8GZJEvAUgDypj?=
 =?us-ascii?Q?PnWxr9xEyBDjO15iYZYi/Myl48KarH2dhv0bZl4wgty0DMLV4YsMoLor66Uy?=
 =?us-ascii?Q?9C+u7rGicKbvGyjBTf2FudHK3fxMl+yoA4wNdbjR7jOMDPsfaV+5KuHGeYBJ?=
 =?us-ascii?Q?iZe3QUTgAZ5rrzH+La7mnzQBIdCC3TC8xAWFlGsCKAZ+Cs0LVQAWX5NVcuE3?=
 =?us-ascii?Q?oRfDKXYYm0phtdS8wP7Ds0BiHV8jQlH10B4+Je3wUlB4y3MxbpxEgExlzaav?=
 =?us-ascii?Q?ZWwutW/0lzk1P5gQDUQe/pAlv3KYTfV2w652Plc0Wmoo7X9ai6roxjiZBpps?=
 =?us-ascii?Q?/7Yxe7KF0+MIVe5IVXHWqf33wtYrTHoUeueaUdIVMwc/SlrfYRO0azlae+v9?=
 =?us-ascii?Q?cpPG1KbGFUqszRWsLfa7N4CvnspFqKWqrno/r7HIUQvkENkaia93bWkUwQOw?=
 =?us-ascii?Q?bEGtNqqLuU6+uLqeG+ZyqXj8xH29fEFrVVbzs1ptEWC9af5SeqpaQJp/KKiR?=
 =?us-ascii?Q?8Iz6P+5ewvAzcgcplUeAkp5sgzk7IOZsSrVu33isNR/x8EYR8Fovlz78WKu/?=
 =?us-ascii?Q?GLcHXYMxOn5C7KzBWVgHjNZhc9Vmxyj9FkGQub9bEgN3HTGyRrDG?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e137d59-317f-45d2-e09d-08de9144dc06
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:50:06.9855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Be7vRjjs83Du5pHdNBeg5Ydy1lp1ECrnoVw1lClX6cVuV6uSUD4XUY9VgYBTQfhRnFxdEdANWkEuNuBk4lrkFc6NWWkk34yGFA+9durilRYeuQ/qginO493aTCTjBBQ2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

Add peripheral-1 domain PLL clock for StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../devicetree/bindings/clock/starfive,jhb100-pll.yaml         | 1 +
 include/dt-bindings/clock/starfive,jhb100-crg.h                | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/starfive,jhb100-pll.yaml b/Documentation/devicetree/bindings/clock/starfive,jhb100-pll.yaml
index 920fde5e1b0a..1f619adb30a1 100644
--- a/Documentation/devicetree/bindings/clock/starfive,jhb100-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/starfive,jhb100-pll.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - starfive,jhb100-sys0-pll
       - starfive,jhb100-per0-pll
+      - starfive,jhb100-per1-pll
 
   clocks:
     maxItems: 1
diff --git a/include/dt-bindings/clock/starfive,jhb100-crg.h b/include/dt-bindings/clock/starfive,jhb100-crg.h
index 55e91ede977e..49fb1694bc79 100644
--- a/include/dt-bindings/clock/starfive,jhb100-crg.h
+++ b/include/dt-bindings/clock/starfive,jhb100-crg.h
@@ -17,6 +17,9 @@
 /* PER0PLL clocks */
 #define JHB100_PER0PLL_PLL6_OUT				0
 
+/* PER1PLL clocks */
+#define JHB100_PER1PLL_PLL7_OUT				0
+
 /* SYS0CRG clocks */
 #define JHB100_SYS0CLK_BMCPCIERP_600			17
 #define JHB100_SYS0CLK_BMCPCIERP_100			18
-- 
2.25.1

