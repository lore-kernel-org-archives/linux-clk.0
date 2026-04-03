Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB05B35FF57;
	Fri,  3 Apr 2026 05:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195419; cv=fail; b=PUJ1vIup1fB60C1aT4t4PFUYpKwA2pj4XeNankrG/XBjwRP+mNQgorYyzq77dMmzbApOecfEuh977z2STecntFD6eRycEUxj7TcZ09teBYWUr7JZJfrY5SUN1f6DPdUQHS4SCIDqODNWPooRYkjU7t9f+NDiC8pFWlIK/yF6+3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195419; c=relaxed/simple;
	bh=qn4rxi+6qSNSSFpiid4MzuED5ngCyJ6giEmjd7SvAzU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jYIAOXuNQHNjp4ZwSUYWGC9GPM2FNtzSqDiGpER4HnuwaHOZq/KYMLLJo8se25DdRCVln8brpRPLXWO24yYMuHQC/XkCxQbVngUA8FRhpsYEfNF/yfs5vp9ou2crRbNA0irBoVnIXFVVAqbH1KSflrKCL2fDgdAtsfJAc9ePDts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AK8bUpV7j76x1Qa7b/cvF1/w25d3yhmROJ74Ur2JTbycdoZdS4zssg/5FD1KoMEmk3pExKK4DTkmmnSwuP9yQZrySFnLgdhwBPhad37Y3pjkkxrdk5OTlig8KS4VoHmfYmCppGdSX5MzKcS/OceorgngLvF75MqBJ4W6nY+6UrBZx4H6WwDNiFAhQDzB1a1G0mlSf5+mnqsWuFLLlf2lWhEQ0G+6mdD9vtnvnF0NO4Evw7R2c1JUOxYS5yQWCu3+Fe5rWU40p1qh2Mp4jDGHSEjaOabcq9IDfG+d2RdRwxxJh9if/46CiBu9g4DzPFjRHSJpQLXhYpwCL21b/SXZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DetQj+6AxeKu3Tn/3HofGb1J/azPVliqtmT7Owb8/c=;
 b=agfXXn44075oVOyBbQf3Ip5X++oTyBwyXyTKIIbzJtdfASkKLN1r483vVY2+Jckfg6V27e0ZYsB9U6tdoPcS7VnuUVfj/cae3FUPbGRu2kqwDR4RYYIMHQX0cgpWOgrI3txmp+jzBOHVqwvrnlyrYxVplrYWyfCckqF0oOQl54Rjnv6rc7hd2F1fokHJMawRpEpkzARMlNxqIjrPzq+q7xBH4TccG/XpTz8li3DacYPNSFRYt+JXMA5yeb35onPtXXlx9D9C4GQoFmCwfQ27Sbhdff8/PCiSdKLgrwE/1omeaK+W8DmYj8tEveSdCswbNpNI3Zba58sbcp2Sg+LseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 05:50:10 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 3 Apr 2026 05:50:09 +0000
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
Subject: [PATCH v1 08/13] dt-bindings: reset: Add StarFive JHB100 reset generator
Date: Thu,  2 Apr 2026 22:49:40 -0700
Message-Id: <20260403054945.467700-9-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 00057ffb-a129-4d15-ff54-08de9144ddc3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zP9DM9lmDL378CgaiybEQj4Fq+02QUngtMkIhtT49iKDXBIEmEoasvNFQvAWaVrlZM6iHwSX0TV9vATGL1egbookLoX9OuyQ8y4R9EaMu1NSCF3nWXoLZVXH44tj791369L+Qz8G+qxqsv3PE6VhyDyDUlo74U8djibiE/QDt4+heWJ9VPugaNF4cZ2WznNOe7S7loS0i+fCiMO0n92Mlkpy2cswaGlllNbudHFOd7o2voA6smCHpQD5ujeh/6GdPHGIs5wiTid7JS+MBqECi+t6jnsn8OEfbgayS7HaPG9eg4hbwAcjK1cuDSTZVuKoAYB8zRwBwYxdspWtYPRiNTzvDNXq1eRbN950M/Up98Gs+cOdhp5rkqzqeFWLwqOywQJA55znvAhNnZxg/DkSrR+IljUfPmTuny3SVshjiH6rhwpjJ27J30THypnJVJYCPxzIR4himpM+JzWVom2WrLZS/S8pvATnKupNfwa/z7jEHP2CQr1r41Fygy5nz0bN2EPpxwcNAMjH63pV5uBscoXccqoFkzCg2cTO8XdG74hIarKWCZa9ja7n9vb5jUdXp4LuHRwdx8p0pKZYA5+oxz0WfMHybhuM/YhN4jdcubk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a+5OVhIt6sE/SW42CATzb27wMm9L6AUUoiYgNt0Ajke4oZX+0zDU0rQdcubW?=
 =?us-ascii?Q?EU1TAQtxNNO7TrVN1WM1YVmtFZ9ybfG1yWWfjZ3OPlXbycNmZhhbEDS4UcXZ?=
 =?us-ascii?Q?6sr7DfKdY+KGZs/5UILNMki6F/QU46x8tJ+Ux5+H4ED7AMmFo4EbmHWkiv98?=
 =?us-ascii?Q?ENP/l4wt4tNK80ZNADZEjgmZhdQBNOJw/QQ8ryJNP7lz3/MHSxedIpNYKaLr?=
 =?us-ascii?Q?lJecvmf6nDpVzlqPf8l9thJz19eLBRIv/irfTzVPR22pLyCN/y9lOIeER+4i?=
 =?us-ascii?Q?bJ6jqdAMFq4MK4zSHGVL316SHl0X/pc336b8Sm1PrFxALSAWkP24jn7ziByB?=
 =?us-ascii?Q?GKxjpYQG7Nwlw+IJq3oKyjFC0VnZNQS92B6N/EF9G6R57wJoVZM0AmCiJeIS?=
 =?us-ascii?Q?JWHRPyM2JgGiSPjNUVrBYxMuT+rFyA7FrOjmaihVOhinhmY4Zr0ktUZgUBMn?=
 =?us-ascii?Q?1VRIkdLWbJg57K7Dhw3MoSFoC5WpAvtXze2BJcni2l9yFq9b5bkaj5YKjRka?=
 =?us-ascii?Q?LLZmABNw0XWZ5sqgE/hmr6/9b2pAKksyeMytCsQ/8d+VLoUO5eX88jZcqxYU?=
 =?us-ascii?Q?C4WlP8l9xliAsBeKiRQrADKvMp2RsT6ol9c9jSJWpxtZqwai9ZhDPA8k/U71?=
 =?us-ascii?Q?BsrVx7IhuzLIk9GvWACDrBFJNvZCT6DEzHJ/3o9V5pKR+M7zg7U0zBmLCB6z?=
 =?us-ascii?Q?RrZ4W7HkOYEZDumcZX8DmNcFN0yuxJaMCVvw4ptzrEeQPr74sB5sRH5GQiGy?=
 =?us-ascii?Q?ltPc9sIqhGmyjV7+rOGTZa4EGGQRa8wmrQEf+/E6HomfVZv65o4jiJfeH91n?=
 =?us-ascii?Q?fDtnoFu2rixwLBA+vY50pG7Tw7vp2EQ10B2S9g9xOoXYxq+3B6djPUHkIK2h?=
 =?us-ascii?Q?goVWuTvt6ofX6BoavOdQIrIc4lmdkqN36eGaq0Cx9KLBXmYsfffkNGoMtPrY?=
 =?us-ascii?Q?qmUZruwTbeq8HaTRfDT55UY5vwGNvplD9dPnNTFh+4XTkeEYjj0f0EM+DfMZ?=
 =?us-ascii?Q?uWT6tEIiW5psXrqo7JMgVReZ5yCz1oJdLQNq8TJ3FAp9UEaqfLEpIxvkZHV0?=
 =?us-ascii?Q?z8hG1d/XSB/WZnHdFhRok+/moJ/BB8xDxEH5ly5lbmfVX7w2Hi/ywDQuCVbK?=
 =?us-ascii?Q?lyIvN30te8EH572MsxG5M3UDytmWUeS0mYcBG5ZPzOhvwQYEwf+ICqRLfhw8?=
 =?us-ascii?Q?dostL7Dq6c1OT/jDe7BgFlYY8MAH8+z7rNeQ4UhDzt3xyBKU/ANPdVv2/AuQ?=
 =?us-ascii?Q?L/U6KE/nAuX4g6KyytyEMUID2IO/oMAgqstp9QN1AgDbhmteFanCEoVxUO6A?=
 =?us-ascii?Q?zt3YqWPYI65xZgKvDaigAnS9zP94U6GGJdHHZwK7mJgmoBFSDzZh6+gEFeg4?=
 =?us-ascii?Q?TrXf+ymBU5tfGJfC77nzXtulxXOPeToyTsmz62bCOFFr24cYckjskX3GqqHa?=
 =?us-ascii?Q?94jzCDi1vVDZ4UDHOJXpvYxmrSMH1/fFP5L21+2eP0xFNktKTWHGORE94brN?=
 =?us-ascii?Q?XRGZ73er3uc+y/1dzzDDbFR2dOiildpMWEqc7iHJn6l6nGDlnaqeCx+3m3Xj?=
 =?us-ascii?Q?LHBUVS15JEsnBVODRnHdHlZQmniMHR5nibI6iJqs0khKBShM22zh4SppUZoj?=
 =?us-ascii?Q?9trcB6DiPF1FizF0fnn587nf/FulgVF318o8lQOAzgQojygDC3MWMQiVETwC?=
 =?us-ascii?Q?AJ6+v8mwbxgnd7rLrhkI8VgzSMRNv8Hmd2cyihtsbXtQT9ySbNxp6yysrwtV?=
 =?us-ascii?Q?Lk7HM5W6iIlLJ/Q1+4yBBYKgruGmVxOvldUIrqCQO40cvVfjxAr6?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00057ffb-a129-4d15-ff54-08de9144ddc3
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:50:09.9020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uboCsp+FK2H3RCF5g/ZX8u8TzrhaLSQLp8ifJp+xYU7aWveTcXCG2LyBXVh/WZzGxebZaYbW7dMv7bznLpYdts2zqBS6xF89LqghLLAChRQ7WikTOS2ILzSlI0OkJnIN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

Add bindings for thr reset generator which locates in pcierp syscon.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../reset/starfive,jhb100-reset-pcierp.yaml   | 38 +++++++++++++++++++
 .../dt-bindings/reset/starfive,jhb100-crg.h   |  3 ++
 2 files changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/starfive,jhb100-reset-pcierp.yaml

diff --git a/Documentation/devicetree/bindings/reset/starfive,jhb100-reset-pcierp.yaml b/Documentation/devicetree/bindings/reset/starfive,jhb100-reset-pcierp.yaml
new file mode 100644
index 000000000000..fc6b0d1e64f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/starfive,jhb100-reset-pcierp.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/starfive,jhb100-reset-pcierp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 SoC PCIe root port Reset Controller
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+properties:
+  compatible:
+    enum:
+      - starfive,jhb100-reset-pcierp
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller@14c {
+        compatible = "starfive,jhb100-reset-pcierp";
+        reg = <0x14c 0x4>;
+        #reset-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/reset/starfive,jhb100-crg.h b/include/dt-bindings/reset/starfive,jhb100-crg.h
index 4b15e348e92f..49326b7f486f 100644
--- a/include/dt-bindings/reset/starfive,jhb100-crg.h
+++ b/include/dt-bindings/reset/starfive,jhb100-crg.h
@@ -190,4 +190,7 @@
 #define JHB100_PER3RST_MAIN_RSTN_PERIPH3_SENSORS			5
 #define JHB100_PER3RST_IOMUX_PRESETN					6
 
+/* PCIERP SYSCON resets */
+#define JHB100_PCIERP_SYSCONRST_PE2RST_OUT				0
+
 #endif /* __DT_BINDINGS_RESET_STARFIVE_JHB100_CRG_H__ */
-- 
2.25.1

