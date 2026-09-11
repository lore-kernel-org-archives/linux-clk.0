Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011034.outbound.protection.outlook.com [52.101.52.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2156A43C05E;
	Fri, 11 Sep 2026 07:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110132; cv=fail; b=RIdtInX+WDhs7qQ1vypUeslEfK6iL3SSqa3TcLxvmg2iJ8T8ZdAHr6S2exR7RxHndLfiKf8AVmB6zY1w9mNfdZWcD8fwwJTR3zMhACp/QigI1oJpwD8Z+7IPzRzPihHZxXy3AqFugFpRFVF+KR2h/bx7Sq/HEU5BGmfD25TVw1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110132; c=relaxed/simple;
	bh=HRKYOlqhtHtl+hPmD0IW89HFXspVZwxttlZjT8b/890=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bZ82R8xSIAHvmXOciiLs6Pb3TdlJAtvYtBtRdsis6LRz8dhNXMV+jIgYrxygTZfneL4eO7nhOArQSu1oBOK9tDHlwsdPpltzsQYhup6x4N78DHEL9ndAOMxosvNSRoOAAY8rLxPLJRbkZw4DsWn5U3aJFsgwVodPgqCGOpVQM2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=b5JHLsTP; arc=fail smtp.client-ip=52.101.52.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="b5JHLsTP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOOV0s6m5zCKdEqGToOFRiLoaIcHEF2tyQY/cn6tNqOg4PeKv6kzhJC2AkRohwWsC5iavcfy70zhjomtq4WfzZ+s4daS/45AAb/EY+K0uC/9tirzWulzUSkFgXFTW0ofRWyPSZ1jQVWhEklB0kNfYo0/lylgjtdXaGE4ZXgssO9qdYGIczPm8nXSHO+zY0HQ0QVhZjG+CA66ltZ73FYiH9KhaxAbyK+gO2EyvGmhJZTncxYJ9cyH3l3Q7dJcUQh+Nnev9VDT3mm6mqrC1lzLB1fy0RcW8j8wf9pCJ8h14d2o4eQ/5xOyKsPi2SzN32pn7mgKhOKifDF3o/75kt3ItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzOGZyhvcQLQYj+KEViTSu6y13hOff8ZYTlCeVuPPCk=;
 b=aCSLpsWBpbPvJcRLaHljU5m970M7qrlcDXHhDNU0oyZXHgY8LMOBqAYHVWQiOpQKv4BGlVSq+8pg2anpti8tfvUyTdWG+wWPMypRVMq8N08e2/1qZ+P4GuvW1SwbmvBwTqfKaOH1bcCvNTYfktVBsnu/rdHQX065+UlHpP3sycRzbM2JsbXUUKNNwALtOOvNPs88PyntqWr3V3NpJhkFvQeTOkCM3wVljvVTruPjbHSpHy7yU2q8ldXMyFY6CDilxzcgGsuv9PGQkX7NXkQ8/Bll4ZlUGfqscXkfOObNKgGvxeCxuXxARuhfprCX9HrQfu5PiJY1SlWGjM640Ikbyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzOGZyhvcQLQYj+KEViTSu6y13hOff8ZYTlCeVuPPCk=;
 b=b5JHLsTPug850Z0Y6C+Wf91Na5jKHGTyKwOO+a1cccLVe0oD2AD8c6/DlDm6icsnVzYiwzGNtWiksVLVeroIpDmDUrec4JhcZjlykgLmeWL9kr246g4ktPpn9OOqIsydVS1KfGb65iv2v27aRoeLzjxLBkSKxApCbQH3f7sbnfOCHEFAveM/xuJ7ZqSOBIL6Z4qdR1Lp77qygguWqspK3xIbrhZsT+EVBuebH/HMrZfGd+oZa2kj2FUF+AqocZtqlRFzsY1QAuQsiuKQxeb0ndYSSAPgH6sK7zmjYxR2QL91ZN2lu4PvgzBPR+8Osh/PQjIUiE429tS9YJ/E9p/cSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH8PR03MB989185.namprd03.prod.outlook.com (2603:10b6:510:3b2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 07:01:36 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 07:01:36 +0000
From: adrian.ho.yin.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH 2/3] clk: socfpga: agilex5: convert to CLK_OF_DECLARE()
Date: Fri, 11 Sep 2026 15:01:19 +0800
Message-ID: <584039b3e63434d3f2bd497a814e073bb1f918ee.1789096458.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1789096458.git.adrian.ho.yin.ng@altera.com>
References: <cover.1789096458.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH8PR03MB989185:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a8dcbe-cf70-49d0-4f8c-08df0fd28568
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|11063799006|56012099006|10067099003|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aQlHZ30IAQvZKtPIE2mmtqBwtvFacU9cAwN6ocYhPGZ2rmctHORKypu6BZ0fIRvAzHviFJAevoGyXzHtp6wo9VFoxx88IJ/GsilpBSRIPTwYo1X2jZ+6Ypk5URTJj8YLLzKQe3pzL+eeDofwSksPEi7ZbGCMlMHUYP65s71JvoJ/HfGljyXcAgnFXzILOUFbLt0yE6PvqKeoLrs6Yo12RkUvjlifgG3HDcs+2inlgByFsaBI2/CYVqlY3RrmhctLIY4XW7qutifOP3fodHb36GsTOevfBdicBYn/NGjYBok3cs8Ovo6N4wpJUoTRI2pXM8C85fCtPFcdJzGo+97YgZw6B6ohi+nib1G8R/HzX9+dlX/MkDDrZYfdnbJn8GkuUPblEx0xcPRQDr9MLSsO3XwTeyHotw7tEMblaI76kvZG9y/tK0TRjIGNma2kANOhX7d5m78JNXXtYwWgu/AZrHH3CZ/p1/ElKr9KhETkH/a7aGHAivbnyydeaXB6UMc+tcYE3T2EdS+aDm2bPXQFUZnynJbwZPeEtmy0PDeLVEUuhfBRuujr89zhp+ItEz1b2HNoFaBybGyhF2XBWsj7Mg9qg9t6dCsjO36DsxCR9OXx43Z80zFxNZAnZXPCALJEDOXom6K+Oi+okBLQeeQDW2A1Vgkiv7x78D+kauMsILY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(56012099006)(10067099003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sR7fjB+DMQNChekrvlRKa/P/7f/09qA3BfNUUpwPtWxJ4HfwViRuOyj02Yto?=
 =?us-ascii?Q?SVV7fos5jLRsZAQHMmq2wZdJ6cgV3YgsjEWRQvl28XJ7l5OKAEBtAezf/KWQ?=
 =?us-ascii?Q?H4w0COixC97boDV0b6bVYJAhYNOHwPMww/6WhtfanesR/AIfPB3DnzAKjIuj?=
 =?us-ascii?Q?cZpsA7WhNAF8jI/BZsgd7BcvojxVJNdGNo6bnm1OlZDjs/DHS+pP3kkt7yOJ?=
 =?us-ascii?Q?5YRIcOkQqnJQ2jwiu6Gz4sUTMvkqFGa+rqnFRwrhWmg+wh+r9iSML+ktipue?=
 =?us-ascii?Q?PVm+sZVw8vsYh7N4LFSmKKa6KVJtI931V5SohVZykKqOqOjQ+umX8qVy0Fyy?=
 =?us-ascii?Q?GY5+EBBKJlAh8CKB4pzmiHOdJamZ80p8oJLrCIeMW6Sb5rfi+1tZyUTqQ0bU?=
 =?us-ascii?Q?I53/SIuo237BVRBbokVmnmENingVmTBQfMZMd+P4kgV6hOuM9/s0egliqjxN?=
 =?us-ascii?Q?/5p9yQJK6c/Ib6fR7vnTD2mnsSrjLtgR93drARaAjOVZn/WmXcLfuo7OepnD?=
 =?us-ascii?Q?guamGFfWTHZPSq/3dRoyevqlDMEBRU03Rn8IxTG2gjdPV4lefjiOYc7LNQUD?=
 =?us-ascii?Q?gXdd/rTsbL2Q/uJb0uqqf/NWwxg5poRjz7KWuLc1BQ1gglVdy90ClPgKN7nx?=
 =?us-ascii?Q?Rku3xUWddOG7j9uFWUy+fbOnps/BjbXH/NbKnOuI1lhEn91oW09QvpGW3zxR?=
 =?us-ascii?Q?XdWje+u12pZPumH5lZesxBYw3YW7ljFjUEXBbb06PsciyOLSk/x3EgDxN0ed?=
 =?us-ascii?Q?fqL1fuphPWng04p3Aas6VsRAqCK9nXtNPQ3kx9A4VSkpX2Y2tsRBmJWmr28y?=
 =?us-ascii?Q?ZAeKNHU4+6cOJ+sLRzP0a+/QeqyjxprnSgtYp9+UU9aPvuxmkypT7rTOE077?=
 =?us-ascii?Q?Zmjbb08lFR5iZpKAvqzJG4XbfL7KlOiJDutr5KokdNl8n4KXKAGz36KSEYsN?=
 =?us-ascii?Q?MDehdsc6DCNRS4dKLoJkLMWoVDY0EpPUpgQbD/b5CH/RvAqr/7n1K+yMefZq?=
 =?us-ascii?Q?V472gdSdqiNFgoVvZdKQpVyRc6ppUOHT0Lcoxw2aNwZPvENd/FRcWCX5eLuC?=
 =?us-ascii?Q?YYyYLt4lCUXLr2rlqldgtGqnkcDXABK+FtEADZVJpHAweOTNIjuHzrd5fH+m?=
 =?us-ascii?Q?14lECHaUHdWfeAIixqgvr5Q+vZFoIQlVOxAnwODyl+c4vtF410vY5OANrqbA?=
 =?us-ascii?Q?1a6bsHHvWm83otK3TUisi3plqppLBHtgHegtX9wWlr8BhE5uKPVrWr345Nq6?=
 =?us-ascii?Q?R4NAfp0O2Y6ESXm0s94X7eMDFX1RSAu5W5NN8lf1zWlU0b9YxmuZwM/zGyj/?=
 =?us-ascii?Q?MPs1ReVPOHjDes9mLtQS2AsHhBdzD4xLHd0V6bfU4bYAdPzb0iw0ln8Zq8ln?=
 =?us-ascii?Q?2xrRmfY551C8Hi6RJmSR240b/xGuzUkXQT+NXaB30HEfFsAjvJFu8l+X7TaT?=
 =?us-ascii?Q?hhZx+jrnBPhEk8S+iYZrdrhQQ5y2NZqfeuNf6sPBPtSsb18ODqbiPoo7xp4d?=
 =?us-ascii?Q?AjJ6CWEMHoyz1ro/PjW+oFTFM9nXlMXqv9HAsDfL3P0xFTFCJG7ET5IN74TW?=
 =?us-ascii?Q?AK8OCNYjULbwoqzF3wMX+PmQ1jYC2rjNuBpAH4IuFfXPSnZXtjpRZ7Dr2Z2k?=
 =?us-ascii?Q?cf9NSZPZTo6SQhbcCdhVPZ952RbcwTSRcRx+AvP5FYE+zWJp+5LBLbactaPs?=
 =?us-ascii?Q?7e3Qv/vjYJei/bYV8n3AszVN56ZSIbsmIZvxal1V9enfuUuoWopi6VYKaAh5?=
 =?us-ascii?Q?Hm2YIoiOwE48eY3I/4AMvGBtc8RGxRU=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a8dcbe-cf70-49d0-4f8c-08df0fd28568
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 07:01:36.6390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +k2kXv3aJnXH2fP9pPh5lRpHk2l7pRuSft6hHQ5HVN3caUkVQ2REV1DfLxs0v6Yun6dvcLOVz8rIZmQxY/GTVgIDA32rqh/A9MkVn1cFLug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989185

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Register Agilex5 clocks at of_clk_init() so they are available before
platform devices probe.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/clk/socfpga/clk-agilex5.c | 56 +++++++++----------------------
 1 file changed, 15 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/socfpga/clk-agilex5.c b/drivers/clk/socfpga/clk-agilex5.c
index f7f0ad884f64..fdbe13299800 100644
--- a/drivers/clk/socfpga/clk-agilex5.c
+++ b/drivers/clk/socfpga/clk-agilex5.c
@@ -5,8 +5,9 @@
  */
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
+#include <linux/io.h>
 #include <linux/of.h>
-#include <linux/platform_device.h>
+#include <linux/of_address.h>
 #include  <dt-bindings/clock/intel,agilex5-clkmgr.h>
 #include "stratix10-clk.h"
 #include "clk.h"
@@ -486,24 +487,26 @@ static int agilex5_clk_register_pll(const struct agilex5_pll_clock *clks,
 	return 0;
 }
 
-static int agilex5_clkmgr_init(struct platform_device *pdev)
+static void __init agilex5_clkmgr_init(struct device_node *np)
 {
-	struct device_node *np = pdev->dev.of_node;
-	struct device *dev = &pdev->dev;
 	struct stratix10_clock_data *clk_data;
 	void __iomem *base;
 	int i, num_clks;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	base = of_iomap(np, 0);
+	if (!base) {
+		pr_err("%s: failed to map clock registers\n", __func__);
+		return;
+	}
 
 	num_clks = AGILEX5_NUM_CLKS;
 
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
-				num_clks), GFP_KERNEL);
-	if (!clk_data)
-		return -ENOMEM;
+	clk_data = kzalloc(struct_size(clk_data, clk_data.hws, num_clks),
+			   GFP_KERNEL);
+	if (!clk_data) {
+		iounmap(base);
+		return;
+	}
 
 	clk_data->base = base;
 	clk_data->clk_data.num = num_clks;
@@ -527,35 +530,6 @@ static int agilex5_clkmgr_init(struct platform_device *pdev)
 				  ARRAY_SIZE(agilex5_gate_clks), clk_data);
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
-	return 0;
-}
-
-static int agilex5_clkmgr_probe(struct platform_device *pdev)
-{
-	int (*probe_func)(struct platform_device *init_func);
-
-	probe_func = of_device_get_match_data(&pdev->dev);
-	if (!probe_func)
-		return -ENODEV;
-	return probe_func(pdev);
 }
 
-static const struct of_device_id agilex5_clkmgr_match_table[] = {
-	{ .compatible = "intel,agilex5-clkmgr", .data = agilex5_clkmgr_init },
-	{}
-};
-
-static struct platform_driver agilex5_clkmgr_driver = {
-	.probe		= agilex5_clkmgr_probe,
-	.driver		= {
-		.name	= "agilex5-clkmgr",
-		.suppress_bind_attrs = true,
-		.of_match_table = agilex5_clkmgr_match_table,
-	},
-};
-
-static int __init agilex5_clk_init(void)
-{
-	return platform_driver_register(&agilex5_clkmgr_driver);
-}
-core_initcall(agilex5_clk_init);
+CLK_OF_DECLARE(agilex5_clkmgr, "intel,agilex5-clkmgr", agilex5_clkmgr_init);
-- 
2.49.GIT

