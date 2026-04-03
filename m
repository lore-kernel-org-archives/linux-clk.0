Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2139.outbound.protection.partner.outlook.cn [139.219.17.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4D7371867;
	Fri,  3 Apr 2026 05:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195421; cv=fail; b=Y1D4V6z7Wq6on+8VSbryaTj5eieRec0J9d3DqYe3yeEELqUyZTf7S/1dWYze+APRk1hkWcEAZitk1h3e8wsrPAOWgHYYtQ7/MVvowmsG2XbRsO68A0Y5m7nsFYWYYlWNnCcBVLy6LDc1OcL41sJQmDOM9ta4ktLpqg6ZpaU0Xwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195421; c=relaxed/simple;
	bh=mNPUy5d1OqmhDt5rourKDCYYMvTnwODfq9iKuuxbkVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MdOFWAvKZ5sj+1tcBmhyR5HjMVdsuBaaXIPHSHf3/ZY+lLSiiZYITHAJu/ySTl6I1AcZBNUpAgPucmPq+73T0z4n2rX4bl8Bwu6deA/7RyIINZ7Xo9sLSVhyNT3UZ5P+Ks7aZiVSDSGsd7ONUmKeo3gpL3J8Lb6QO3Aajg+svuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kncNkrBezyaDqGJFq6kVhXDBrLc4qFYO/TIMXlRGr40SmLGfXZTRnWXqgvj7/9bCGvErfnaAWDV12LcZrUGg8DHVDdvEOkcDSME8KnIy2dF9MTsWX8L3plk66QpisNQQNB10Ct/OD/g9j5v0YxPmpxQKuYO7ZVAJhNMXys9Np1/pnxn13aPuwVasy2Uw+uXf6OTwn3YDB7KVkn6ZbRVRUoV5sQe8mPJGIYpgRF7kSQ+VOArqNp6ztqpMqiOckp0suAY0KPdrev6TQYIBHO8bMvoRU5hHhHjBZ4F6kNP3FefD70HKXtJC/2sEb/KUurz6Mf4TBVYNrIf0XRfmimjIhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igoDAtvNT6L7FR0akbNeKgkXkUVlPOWNaj7BKUdXduI=;
 b=MjLftKJIxJF1qMVU6+PGHK8jBsGbTEpZFMyH4awD+bunKJhuRG7iGhIWbxY9i4xS/hy++dQhtC8XHk49XwdXp8Zro9+vQ1WMYwz1zqSJV3wkuovSq0UXTumx/KCINM8hKha7/EuNCXd4TMU5TIxK71Wot/nTzxhu2KpWR0dpzQxOy4vOeEEtSlyeVau31TpuRkwHsu6TIaIM5cMU2jYtdYxqzakUu+qd4I/eB/QKWiQdI+b1mjohb6A7DiANUpk1xsD10K5slvbJpF7G8+S019ww2TrsbsmTnzN/DrHvHRu9/BMCAaPK8LnFSxKseVxuZBCXYOhBzUkaEIB+9SAayg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 05:50:14 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 3 Apr 2026 05:50:14 +0000
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
Subject: [PATCH v1 11/13] dt-bindings: hwinfo: Add starfive,jhb100-socinfo
Date: Thu,  2 Apr 2026 22:49:43 -0700
Message-Id: <20260403054945.467700-12-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: da5f75f9-5346-4aa2-6ac2-08de9144e055
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ucbaJwFDUHsw1eEKibH1ZpM+Dako3bdUe/VDbTpvLjS0oRC/BKfA2WGmKwREwj673AdINyLRk4Nj+1ng5r2LrQm8mq56InsH+s/OvXe3CWHXYVC6q4ugvv2amTMLm07NR+LqVsaSRL0VyU6iPy+56dbqWX8umCsEMrdy5xUDcAdTMQNAN607rw/iFauknf+OAALdoD9G2NxhoVy8uV1tSLOBAirsO0hTgLvkoO9gg88jmVQSoQr6xnXxRLw7GROax/eJs2anb8vd7xcFUUNq21e+HO/u44weLeQreBgP/3IR8ocstexZsWlurcGhUoSQRzRbrsEkTpZvfZtidNuB4qoKq/W2JVLtfHzZuGT5h70r6JduDhJsGcA5Z9vkei87llros4J+YSLqdVw/VR4JcuwvhKepmwlAnOYa/bAqEcFrpcqHXYgSiu+fIkOMVckCOIK3CxB4HBB8MAOuASI4/mIQb9Pzmf+f8+6FZfqyMsOrMxcdN11rBSkgQpogB16FVnm3SwcgFGSJe4G6ybOT2mU29NAmsWskX030MxEaoY5Rg9ZtUmXmmJFr4ZR72iXkdpi40TT4giU6yXgVtlO8Z7mpVupxIpiwQzn+cnjP8pM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qy45AZSV+UpcPT9Y4Oe/iFpSYF4YKKNUuhVf6cXa0E6vvkTHkovkESGU5kqU?=
 =?us-ascii?Q?ihDbLIc0iVow3DX6u8QKc2LJTwogyKPL5oX/sUNMYkTYDzv8bpCG6Y9laSVg?=
 =?us-ascii?Q?lopl4eBgwJ6e1iTmE+tMonSauZx+XU1+A5uiMykmAXAMDxpWNLpZRhzW7xjl?=
 =?us-ascii?Q?923ELWoATU90Y+cMFsR6Z2SYyxC7Hy4/dN5yHCAoMlVnR2YxpJJjVwDP9s19?=
 =?us-ascii?Q?q2Tk+GouqwQSHUr3joHkwAt0oXmV1qrobRYGEQMpp9jpwftoDPTahQSMaqly?=
 =?us-ascii?Q?QmpFcOE9uAINhKZskok2r1nQweExGPZ8+m9FEVf0+gvrKM1//brIto2cNndC?=
 =?us-ascii?Q?VgSm8TtEM1geU6EaGlXghHtFLCXENLUdg6Il5BrQZWEGbWgRMCs/LoJDerbH?=
 =?us-ascii?Q?zKlnXUdI+3dc3nlSzhyi9BRZ8VJHjOKEyqMSdUyK8LanQ6eiNgGc19HI40oR?=
 =?us-ascii?Q?u14GTdgRCpIXjOCAoN7KSmoILHp0Zkxej5fQ69fOfH2hvE16skUyigLdc5Ne?=
 =?us-ascii?Q?3qMbcl+rnhcfkLLaLZ1bmJXS1wE1MlFm4xfw9EAtGNy9lTRBCD2GgEQASC9m?=
 =?us-ascii?Q?GPuBQVG3TjX1IA1pIqF4BgU0a/d+rQuZ0zw2M2tmvpXzAKeA6R9WPc56Blxs?=
 =?us-ascii?Q?gU3j2c0Uaa85QgTmttiJg5F4dkRNJNeaB9Zyo0GBs5SRcalJDldw7lf0W83X?=
 =?us-ascii?Q?54lOCrJgS24ULQxDuHmTCUMhDNZzuF8pNWWVLgSFksIKzoeSD7ho4OQ/4rW6?=
 =?us-ascii?Q?oBCjaSolIjwsiqPF5gghgpP1PWbA1iA6zcNIPqMrxLlUi5gepuXopNFqJsNW?=
 =?us-ascii?Q?6CAbOhLphFL8v3NxWn5tJVjKW8SuyW3GIxDZDYjNk4aZq/IQG+8g8FFGQryC?=
 =?us-ascii?Q?JXdaETLR+G48lWJtrCEy1uoqm0ofhPlNUslInrEGkMw00fZQag6/FPg/bYnx?=
 =?us-ascii?Q?0UCqW5h2wGDFCn19ne4FoU0oTWezu7qYSRx+NVNnWXYT1mRs9wsYNZJUUdwT?=
 =?us-ascii?Q?ohBp1JYbBvzZuJzDCKcX+vQb43q7f7AaFHOSG/+J1JuPHQ86bIrAd7sSPxXc?=
 =?us-ascii?Q?/E5Z2lwseMbexqaqOK+c9KhGsTOuEIvwCGDGC4ursVLxdIOwvofzcKXtJgte?=
 =?us-ascii?Q?oSlNTe/m3QgNAon01ovvzXUGf8RBzgm7yD8EyqiXPclRwCnCHHdMRiox92ua?=
 =?us-ascii?Q?q0IGnkCpSkqTevw1nK2mWKX7n0ERkIwjTosMwdCGvRQf8jmaV29d3wQpNVwG?=
 =?us-ascii?Q?sJkQsF3u19tDvjAjYtEtbMan+tBWDcmXSSmC7LkvpbGUhp62nDdKB8fPpFoe?=
 =?us-ascii?Q?YuO0jwZ1nH8JAmHKJeGNn98tLH2IS7wN51StTWbBq6VYSuJl6NcALUNSmA9T?=
 =?us-ascii?Q?UyjjLuNQEIIo+JtH6SLGD8NVXKWtM4NndQq5k4aoIgB47byHuLWsgU23gaUS?=
 =?us-ascii?Q?sF9fCCGHWb8WgkP0SmuDDyqSREaYuEpdWi+noSxosLQiiNppQS/Xz3abumZo?=
 =?us-ascii?Q?df6c+uuOZNpN4kFXdSgd+l69a8LjT+nC/AAlFWL1pr0MVIwfQbpsA4+eM08n?=
 =?us-ascii?Q?kkrq+cNWiWhrGMZDO4POXoFcrY7H7pCPc3vfyNpLqgBIA8wONS6u1PbxYDzn?=
 =?us-ascii?Q?b9PLLphYgiHhZymoh99MQywJN4BBc7nRO7XcnU2nUuXDoFxCPmSvPctwEj1D?=
 =?us-ascii?Q?NB7L1vlaAkR+fadnFzFsTLno+5X5QxRrPhq1qS7FAG39cVNsV2tzMyqtLicv?=
 =?us-ascii?Q?8/qIKNtl2CECayobfCel18o72A5KDASjMsuQ0Ea9tWFJ4Jj1WFXx?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5f75f9-5346-4aa2-6ac2-08de9144e055
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:50:14.2083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4vFJNkVp3s1PH0BJh9MJdFcWYPJPURKGUXAo11j3uTcUnIxbN23JRHStp0un7/KUk7GQ0HIa7NL7pkI2ZHh1KmEdCiphJ7CAuRutCfGt5lUCphIutzRha1Zzpc6fqM2y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

Add starfive,jhb100-socinfo for StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../hwinfo/starfive,jhb100-socinfo.yaml       | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml

diff --git a/Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml b/Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml
new file mode 100644
index 000000000000..cc6b7d5a4c91
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwinfo/starfive,jhb100-socinfo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 SoC platform chipid module
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+description:
+  StarFive JHB100 SoC platform chipid module is represented by JHB100_PRODUCT_ID
+  register which contains information about revision. This register is located
+  under the syscon.
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-socinfo
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    chipid@38 {
+        compatible = "starfive,jhb100-socinfo";
+        reg = <0x38 0x4>;
+    };
-- 
2.25.1

