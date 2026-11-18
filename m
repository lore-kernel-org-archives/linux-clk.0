Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.117
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794996352;
	b=Ssr85dDd7ig8s+MMbZs76UdR/Hj1WxlP4jt8OUnzbhzMBt3ArjVt2oSiYNLjPslJSVkf
	 SvgyUFfytR8O1b1YFCz0wgV+uBNHXGLPqYocOuj/z+kMf+t1lAqGvAAK+wl1Kr0NagP/R
	 0uVmc5ACC1fidu7JUys7vocaUdD2lbDQCfuT/vPm0B0heJBRyN/K0L1F0nvyk/PKfxwNe
	 sU4jM0hSZrs3L2mg9g62wPdELXKxMtgIUDi0cG4UQ8BQb4f/HsRmYPr0Zo3DfzCYeaRwF
	 qr2FQ758fm2jWuEeLCTJG2wax/QF7fHFeGtkryk2ptPalqQoNNGyThME5JoChVOjAGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996352;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=a0qVNhXaxHDXTx/T9tURFvGZ03naqiAgqryPQ79mWGA=;
	b=Wvshg0TGFKEgWPWl5g++AgSAhuSnIYM50jBSgy5oqqZ8pjNwnbMpGjlov1eMD9+duw6P
	 4/f9ylRxUMEPwXjcvFbWS8sMcMSt6R2tcqVkMN06d4MpMJwZM6hrAK9KzgrxYlVWBnP+j
	 ZN2gR6blawNCf8vEhcLIPd/pf9EMP4+7mlihM7lwhTEBx4m68GhrNFki4qpo+iziOIoTI
	 M2eZM3lak9tNbjyCY06mkf/rOtmsUJHMygh5aO/k023pklvpxD/TrT4x22hV6MmOFxFAG
	 EJ0wbvhq3lbQ2kUG+I9mTyYqHv3umAwfx18DvUtWU1wKyB2mL9QBMqTEmH7xviQtkRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.117
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2117.outbound.protection.partner.outlook.cn [139.219.146.117])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A12E606A887;
	Wed, 18 Nov 2026 10:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A12E606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofQGjajZfNwFc74KMXkzPRa8urUHiahZLL17jjx2OhIq2a7/TswjUeTAUdbFFRxqZ0hUWSuJPYx8Rrl72LOONCYvjrcMFwJhKpSc2w0K3Z8U50wK12XNtXOl0dFDSLzShsHLpbD1nRXexx/Xzwd8jcpaEODVC5swQKhxjKuykQknmM/nlflBclv2Hldg3JO34q8of7xuwdUWEC7pE2n8D24uHVLeY7IqMs15DHK36mcVyj8HiLOAKxMpJnQ+YlE97f4vuwcUigTe7xJXJaWhJhVP4MLhUXbOLcTSPEmXDtrgdE2TrfBJW5C0ig4CxrfsmH059Jow1f3Ed4DGvgBYow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0qVNhXaxHDXTx/T9tURFvGZ03naqiAgqryPQ79mWGA=;
 b=FQN0XE6h7wupNemB48e1X6p4XZgtQS7HKYaaUwcJSOD7ZBmMsL6aUhnUxErSFgLOYJGGrSkSi9DQXWren8F2RqO9V95MeM9drgz/o37IgcdAtsF4zGRXwTtwqR6fdFQR20WQiKaapVZSg0UFNtRp/YNCPqi38q8FHjRmXIe0XDik4qgjcFsE7Iyne/eZ8XAvVQ25Wt3s8FdcAVov9q23qUAFnlLMMjdJ948XEQH2lrR5dH9PUjbplmndB7/+T+p/iqPaNusCxjcyxObvP5qZSHPcqW4d5Sp7aTR9yVdumCkNdzEiPmYt1EHYnR1EtAg9PDCiD5fCWJQdlaNWzd1TyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1170.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 10:05:41 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.009; Wed, 18 Nov 2026 10:05:41 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 5/6] reset: starfive: jh71x0: Support discontiguous reset IDs
Date: Wed, 18 Nov 2026 02:05:22 -0800
Message-Id: <20261118100523.11395-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::25) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1170:EE_
X-MS-Office365-Filtering-Correlation-Id: 425b34a5-dc09-4d92-0e6a-08df455b80bf
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|23010399003|1800799024|376014|366016|261009223027099003|261026140227099003|38350700014|10067099003|261021121427099003|56012099006|261022105027099003|261102123227099003|261022075727099003|261028144727099003|261102130727099003|261026121527099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	MUXRJZdTmB7K7IgwSCZxyHSit2QAX1VvSsiakddWBJB3U9qVMSSas9YGKXy0ZeKA0eDuJRJ4hOXB9aeH//mJ00edSIN3ZimC4PUP0CD0dWPSCWPSsgtBth9kY7mqu9UCSZLNDPrjrA4DI03IfIK7ViasihjHofOagQcApIL9JD3TuLB3xAY3Sjy03oJ8S+OdwwpNRvhOEwlI01NUsjy2EBX+p4CU60VYyuGuOFYMRMEfvs8FeuIhjcJdloNpHmc0L3bgSGALvI5WgJ/JoRpacwVxRvPjo1tOLzq4partFrNftfJzPXkSv7tItZfDTqQCtMmiA3ucaDNvTQ3O0HRCzbo/7Ha2wTUrdHn6WXvT0pv1A3PUqNhmBfKFw+CKjNjyKoUybZW5uFK7Qb8dSsh/IfaG6vQMGy62ZgkHXzOpadyb4v3/T2gLwgIdZYPq3IzqCs5q9Ddqg95Dy97ypoX9eArzDuBXURDneG7dxAuVQ8SyrJNSzbpWKCjA0OTSmfhe+tUrTeCa4a8hwLIACEV9PpN/003oNw2z7JrwAkJ5e7E3H59i+qU8VMlFOpislRPf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(23010399003)(1800799024)(376014)(366016)(261009223027099003)(261026140227099003)(38350700014)(10067099003)(261021121427099003)(56012099006)(261022105027099003)(261102123227099003)(261022075727099003)(261028144727099003)(261102130727099003)(261026121527099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HzuCuK+TxcvZ+IR0dnM72x1Q1aLFyflrdASlM7YPWaTdYPaVb5a2GiwsvboP?=
 =?us-ascii?Q?X1BRTDISsRobCPEgArD2PfyKPIn6eGwinW26V68UL7QvjEAo81OALOHK8sK8?=
 =?us-ascii?Q?jv9PvpFGRgc6LeS26b9Lg7uBuCzaaOQiBI8v3d390P4VknMqCuiqSTulB5rV?=
 =?us-ascii?Q?N5ZhDq5Di96NSAFw7I0WTLjSh8Y9xc5OyA8o9SM6WZ35fGgj2Q1o3HpfOQ1h?=
 =?us-ascii?Q?99rPeEAbZW5rLala8cxXASRKuXz8BBtT/s4mwqzDnLPOjq42s0CPricNn4lJ?=
 =?us-ascii?Q?cMNODzIHCw1X+NwjeCZa/p1t/aGgDncq5iEMHfD8/s+aD12LOkZF10OcHRWk?=
 =?us-ascii?Q?k6FX9dF8/ZKhl19SIPzZ8H+g6ZRMBZ/l6xD/7Aqich2JwkxIIedgeDvc5NSq?=
 =?us-ascii?Q?7vRxKv5zzExSLFExkFTRcXvxnfBNFmmqSiQzyEs5ZUwIZG1cwvQ9WDE6WufN?=
 =?us-ascii?Q?j2taL/WSzy8Idlxbn2tIxrkOIV32BuuAXKOitSA/cEFqkzGwpPEWesDigxgQ?=
 =?us-ascii?Q?8+kXA5MAGRISYfrUIFSMxsXdvTdmmBHlwhSd0tt63jgTIezwmkT/yglQipPz?=
 =?us-ascii?Q?deJ7zvMPBOuU7AtTVe6kMnrVvvYRUg6aR6EHFO+QYO/axKToe+Og+KQajSXE?=
 =?us-ascii?Q?dp9gYoajDGesvCoR5s0AfFngZxes6FY3eQI4S9zgRpj3tzFBxFemxAUL9s8a?=
 =?us-ascii?Q?hZCuUG0F/OIxlpfIsUH2ApRelcaelcOHzFdoV0sM2cUKNj5IgSCzRhVN2Rhl?=
 =?us-ascii?Q?OARQJIZHNVxr4pWtVqwRll90vdwuPb5qJ85dF8EuS2L2TiFINz/vQmBNN69e?=
 =?us-ascii?Q?nLjxSErjaCuw22i+Ky5D+w+asZpA3m6byQ6qhHK6YAzEtV8IN+94rotAqrg4?=
 =?us-ascii?Q?vR6Wh/gutPJNSEU3FcOjQ3kRQIk7pYt4C4yIcfzwhUJ60rErwflZdguhKw5V?=
 =?us-ascii?Q?1oByBrdo05cfZZB1hrlRAn2BcKGZnuAyOvaqRpyTwOZKrRmt9bQASyIkROys?=
 =?us-ascii?Q?xISzBpB1tUhk4InZkQSnGzHJLSYTZrZI+sCQo3MwfZYb0a24MHn6/pjdmcut?=
 =?us-ascii?Q?HJr4iSnL0Uoz3zofiFIVqTgA8IZpGypc/cLGmkYKyh4NWcfK+LLT1OXQ/z3p?=
 =?us-ascii?Q?kzKYdC5lxxeY3+Vj2jaM5jvIOL7CQ+N+OUPAWe1glfSlKhgpS4p7uLMYNfNL?=
 =?us-ascii?Q?k8bbjIKQtGZEmwjeiXsdzLfqQODyLaIK6tps6hZa3qN/Px9uTVgIuucmaFKz?=
 =?us-ascii?Q?nHnXxwTC7cF2oh2Zf9DZLqJYfJYUgw1GMaaDeHg9Dla0uzeCFr3eqHbxHd53?=
 =?us-ascii?Q?8me1b1h8c0z/KRa2vTqD2N4c5hSg9FcQVOq+0xHxvTpcevMmnHUkO7L2AZNd?=
 =?us-ascii?Q?w16JJ/uKOQfahwzJsHaZFT5jsvnCmDKgSZDFAHpvxoPqmrvYxO5WXlZ+Paoc?=
 =?us-ascii?Q?WEJaZJmcPkYOYcyLWP/E5IXq7dmCuAcGz1RIVQGOKNra4tbFpY0ni87XOyPs?=
 =?us-ascii?Q?l1L0F+0H3KgEDoh8LHIvQnvhYkYifS9/mK2xi/gE5aqgAw3kvKLe1LRGyvbx?=
 =?us-ascii?Q?fJS7cD4GmYR1bXzHUlLwfWhrsLvAmUxFEano6Ym1z142JHcwEEJc/b5f1EBR?=
 =?us-ascii?Q?cuzD87iGDrGYGnlLk3nALhVpXo8ZSIJIH+D1cLv3qL8olxzIXyweGD0O+eq9?=
 =?us-ascii?Q?ImhYEDhuXuSPjNANQxcZlW/yTZa2nXS/nQWPpjlTUYWKF5VFxE5J/HNWJq7z?=
 =?us-ascii?Q?FFR3CQMdHsJUiDXqaLwCPC7YK8WyTxbLB08I4Sfs0+g2E1FQNduI?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425b34a5-dc09-4d92-0e6a-08df455b80bf
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:05:41.5539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4Z5bCrBcgTHEsS4ey9CanKgLRsKzHoPedFU0PiqlieTdFPhdPVeAQC/nSZUrfjvcfUYYu+oc3gOHml4y0i54PzqCdC/ikIX8VD/ZCj+CtASF5AVJOIX17JF8eeNSRo4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1170

The reset IDs exposed to consumers of the StarFive JHB100 reset
controllers do not map one-to-one to the hardware reset bits.

Add struct jh71x0_reset_info, which describes the number of resets, the
assert/status register offsets and, for such controllers, a table of
hardware reset lines indexed by reset ID. Add
reset_starfive_jh71x0_register_with_info() to register a controller
described this way.

If a map is provided, install a custom fwnode_xlate callback that
translates the reset ID of the reset specifier to the hardware reset
line. The translation is thus done once when a reset control is
requested, and the reset operations are left untouched since they only
ever see hardware reset lines.

Existing users of reset_starfive_jh71x0_register() are unaffected.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../reset/starfive/reset-starfive-jh71x0.c    | 60 +++++++++++++++++++
 .../reset/starfive/reset-starfive-jh71x0.h    | 24 ++++++++
 2 files changed, 84 insertions(+)

diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
index d410a5a0ded4..5c64d47fb530 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.c
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/device.h>
+#include <linux/fwnode.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/reset-controller.h>
@@ -21,6 +22,8 @@ struct jh71x0_reset {
 	void __iomem *assert;
 	void __iomem *status;
 	const u32 *asserted;
+	/* optional hardware reset lines indexed by reset ID, rcdev.nr_resets entries */
+	const unsigned int *map;
 };
 
 static inline struct jh71x0_reset *
@@ -29,6 +32,23 @@ jh71x0_reset_from(struct reset_controller_dev *rcdev)
 	return container_of(rcdev, struct jh71x0_reset, rcdev);
 }
 
+/*
+ * Translate the reset ID of a reset specifier to the hardware reset line once,
+ * when the reset control is requested, so that the reset operations only ever
+ * see hardware reset lines.
+ */
+static int jh71x0_reset_fwnode_xlate(struct reset_controller_dev *rcdev,
+				     const struct fwnode_reference_args *reset_spec)
+{
+	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
+	unsigned int id = reset_spec->args[0];
+
+	if (id >= rcdev->nr_resets)
+		return -EINVAL;
+
+	return data->map[id];
+}
+
 static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
@@ -132,3 +152,43 @@ int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_no
 	return devm_reset_controller_register(dev, &data->rcdev);
 }
 EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
+
+int reset_starfive_jh71x0_register_with_info(struct device *dev, struct device_node *of_node,
+					     void __iomem *assert, void __iomem *status,
+					     const u32 *asserted,
+					     const struct jh71x0_reset_info *info,
+					     struct module *owner)
+{
+	struct jh71x0_reset *data;
+	int ret;
+
+	data = devm_kzalloc_obj(dev, *data);
+	if (!data)
+		return -ENOMEM;
+
+	data->rcdev.ops = &jh71x0_reset_ops;
+	data->rcdev.owner = owner;
+	data->rcdev.nr_resets = info->nr_resets;
+	data->rcdev.dev = dev;
+	data->rcdev.of_node = of_node;
+
+	if (info->map) {
+		data->map = info->map;
+		data->rcdev.fwnode_xlate = jh71x0_reset_fwnode_xlate;
+		data->rcdev.fwnode_reset_n_cells = 1;
+	}
+
+	spin_lock_init(&data->lock);
+	data->assert = assert;
+	data->status = status;
+	data->asserted = asserted;
+
+	ret = devm_reset_controller_register(dev, &data->rcdev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register reset controller\n");
+
+	dev_info(dev, "Registered %u resets\n", data->rcdev.nr_resets);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register_with_info);
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
index db7d39a87f87..918ecec3975e 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.h
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
@@ -6,9 +6,33 @@
 #ifndef __RESET_STARFIVE_JH71X0_H
 #define __RESET_STARFIVE_JH71X0_H
 
+/**
+ * struct jh71x0_reset_info - description of a reset controller
+ * @nr_resets: number of resets, which is the number of @map entries if @map
+ *             is set
+ * @assert_offset: offset of the first assert register
+ * @status_offset: offset of the first status register
+ * @map: optional table of hardware reset lines, i.e. bit numbers in the
+ *       assert/status registers, indexed by reset ID, for controllers whose
+ *       reset IDs do not map one-to-one to the hardware reset lines; NULL if
+ *       the reset ID is the hardware reset line
+ */
+struct jh71x0_reset_info {
+	unsigned int nr_resets;
+	unsigned int assert_offset;
+	unsigned int status_offset;
+	const unsigned int *map;
+};
+
 int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
 				   void __iomem *assert, void __iomem *status,
 				   const u32 *asserted, unsigned int nr_resets,
 				   struct module *owner);
 
+int reset_starfive_jh71x0_register_with_info(struct device *dev, struct device_node *of_node,
+					     void __iomem *assert, void __iomem *status,
+					     const u32 *asserted,
+					     const struct jh71x0_reset_info *info,
+					     struct module *owner);
+
 #endif /* __RESET_STARFIVE_JH71X0_H */
-- 
2.25.1

