Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011034.outbound.protection.outlook.com [52.101.52.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784B943551D;
	Fri, 11 Sep 2026 07:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110115; cv=fail; b=oTxlQnUvaopLgz72s8soCtjGhKByDPOLBpgrORza1oP6vMImzjsRiWO8LO979sRufwZN9qx4jz7AHbcmdmEyLI4agMg9+BYttbd8BweUfPcqlSRrn0InvxiwRWC6vOjxr3Y7YCCz8JRzEjszugGdVLBpwRfyZA9UMgdg+68WxeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110115; c=relaxed/simple;
	bh=8W21FDtNhOxXE6MNXXMRpZpbmplkskZHjJpSjq+/wII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TbVu+XeHPC9/R8TxSM7eGloPOnTJ1EQhmXWjzUOaa7Ke3Qz4ww7eZ8vciDOiQ5B0s0XDyEcc6tFzPHJdFRnDkIc9k/GaW23HoxknxnY3hcuf/JDkqYT48zgN3K04M/7J0+pqp2elbXK6/F8mdk4RQOUzXy3xDfCOELKazItno1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=c7nBZ9g9; arc=fail smtp.client-ip=52.101.52.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="c7nBZ9g9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zbw+MgA6fifDfP7LEqObHtSu89ki1c2wmuRmZvqE3Ip5FB0owV5Rac3KZnc9vNvKvGnv9ByqNzukyXvNUXoZLys/TIR4pNbeWZ3BHeyM9FuICXEEFQg9uXqhq17j9b/VxKdhmw9SIQgtVZLt9HZq5D617fHFeHYkt4uQm8W07jNpCRhl8SBTYkweD0aG1dZjucPZrcl8zloS/Jv6+HAX0No3msCfmvb7orzH2LMItlGCN7xiuIstgXcPMeYwPG5HmhNpywlt/YyaJimY5dNV8L9N4kGVfIvCfqyJVzSUiDAO99Y51Nfv/MtcvMLqGR9JJn04rZQOe/LtzuESvWrzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSXmgOwCqRhK2qwt7cAg/osumwGyREioGkDipesa38A=;
 b=tD2VmEK2XOBFQchOqNrNJJVBbfQ6I6N5kib6MHZTcqLGOX2FcfSU2LjIQX8K3o0/qoscdCmuj7JGrNbvMug8joPM0DgarNKPLVQDf6i9G9vcFCd5exCB1xtvwW6dIx7WygV1JR73+PwPSJWi0ai4JkCFF/GTinqTV1ykZGFOyV5RouHl9K7qFZhJTpw02KmfduEQVvY7m/KvtdMd0QbMTiRh8uZaUF6ZtC+CkDTzYY+he7tSupSUyfAqJjQuCGHinpRYs7j5JirC4vm02+A1jRRpzXQAHIGaUXciEKBUz/8O9BweTBVazskUxmilsw7xKZEOL9bitB1EinhVuEVyhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSXmgOwCqRhK2qwt7cAg/osumwGyREioGkDipesa38A=;
 b=c7nBZ9g9dew34HAp+couZTgQv0UQeptXkXv+AzP8BhteUwN57qbf95UJtJShLtsK/YvCt5pAFz5CA0GC1GWmLpXsL2gjWQXFzHYh9mEe7K/kI98QdYsC0VI0vONfffnP2A3tPXsAlud33N6Q8cDFA+smnitzxY/KUD9h1nDEKPtmtmZQtAspC/jmPNvnyjx6RHrm4oXrxYbqZlvaknnJM1p4iBnWLSZj80SEO5nxOZCC3FLwreHX3Z80668Bfzjh+nuV6uvbgCfX6aYC2AyS+axuXzBUCNv2XzkXTRLZHQCBZjTqqPK+JJ5AxKDeOwx4cPuajrEeCPq1fp1Roy3hAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH8PR03MB989185.namprd03.prod.outlook.com (2603:10b6:510:3b2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 07:01:34 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 07:01:34 +0000
From: adrian.ho.yin.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH 1/3] clk: socfpga: agilex: convert to CLK_OF_DECLARE()
Date: Fri, 11 Sep 2026 15:01:18 +0800
Message-ID: <c7006ac0c353640f52902580564a85d6d23c57e5.1789096458.git.adrian.ho.yin.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: e544365f-b62c-4b9d-dd0a-08df0fd2842b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|11063799006|56012099006|10067099003|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zcnRGcW32VpvMqSbRjxI7xdW+WM1SsYKxrLLlmFW6zIkI6bm61bD38Ea9Lv5RqNtJrd2tSR1k/6wKsz0+0oRFCFuj1WJPOFyCBO9XmsjhZzeffwOBhBsFNLYHpFtTg6oBgSf4FtvbmE8M9ol+1Ye3AxxUEuPEMn9y+kHG5u3kNjOZYFzY1D5qQ5LEhNexuh9q0AKJPH9pBF29MP8ttDiqdICyxbbzzoyxxHrUc5+B7nlPCdn/SQUFDC43O2JyCMKbR+8RDOmGBSDUEQqC35Vj0onj1FcmXhoQdKiFGx2rxCDdykmDc2oUF8UqQsb8tZNCAWnf4R1rQHJgR+wS95yvvkiJpvDrxzpFR0rDei+jvNPPrlnNv4Z7fPTIqF7d6mO1E92MzyaNd34Pa5t0m57GRPWG/th75HUSULtQjT3w5pdzmmilo9C5q0QY9RDOQmgA1X5BFZGGwLG07Ql8kPbH6aZzT4YvulQFjLLFg7Y+reb1bhkmAz/gHQ0Ox2cG+Kfgkwo2MXNLrN2yJAqzrEyOvwsyhZkyQdf4dN2cFmoxnW5Pj7yM/UqeFrrcwO/iuH0IOfi16cn2f03TADahIDdmR3KYGPTFGAZEjw3SauKP5HBU/iGhunjVvHoCxvIpelaF/f9tqT7L+R+yDNWSMSbsa4WnJVYn6SLH0JUolEM8OI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(56012099006)(10067099003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vUTf/q4mCSLhwG4o0WWOR3X/7T4ISg3OLtffTBOz+zgTLm5hUmfyNNgpPIQn?=
 =?us-ascii?Q?Bz9RJIUbjaNreL5IPW4iWXpAq5Th9MLoC/p37Fj8sLqqoOOH+wR1FWDB6mGn?=
 =?us-ascii?Q?ePk7gurteZP++1Qecb7FZlfIMxzH6vx6sPhFbT9UyqDto/1Rv2HEqJ196PBl?=
 =?us-ascii?Q?/uGsf3wSrxcFjg6wMkDWKkKD88A2kCN1xE3797BB34AOiF6UJL3qbiNHW2AO?=
 =?us-ascii?Q?5TXmEihVcGR0wGpYvLGZS09PWK02/EnEe37MilkwmZ8uVI4/0BTLkxmkF65P?=
 =?us-ascii?Q?lM01spz1qvrUtRhiEcx4XEd0Tja9LUeu2pkeXCjhWQZD3HNh040NUyS4bXFQ?=
 =?us-ascii?Q?qlnIZSCRhZZI+M0ftPAu9hb0h/4wJPSFsEnhk5a+eQlX2lsWMuRorpekk8jl?=
 =?us-ascii?Q?87o4FjSr3A0ud4GFagMWY8KS4T+NT0wfNrPVwAMk4rU3iG31vA6wXTRd3k3a?=
 =?us-ascii?Q?Mw39L1Oj92DnxN8uj0iAcOtDkxKkXN5rErEOf24cIogU9iej0G4sX5rHlNX8?=
 =?us-ascii?Q?i0A8roRYH0NeGlsWYrBgUJsVQB+upocBR1ixo8eTnn0lzh9yUpsUbxrvCdCn?=
 =?us-ascii?Q?r/kXEagn2H/ycJG2L/lG+0DOyEEDkRMvtxK5otON2LJMiYSc3FoKCnKvYZ21?=
 =?us-ascii?Q?l8HajwH33aqOwva8ctgFvHJeHP5U4fzwP827F8nGnafOujtD3s++5QMDNLHU?=
 =?us-ascii?Q?e/vmGUkD5kYMrpcrhnZ6rD+C/3t07b+uqucGQ1PspZSrTPBndjydPpsc1W0Q?=
 =?us-ascii?Q?SPQERHMVm81iFJ2wft7YhqBsVLjPVJ718tSNkxBUhRf+YurRMO/g5M3NaolV?=
 =?us-ascii?Q?Tz/PYkORbMTKI4bb3Xhyi6IWtu+SbtjsnJBMlDSZRD+PkNDjL3CPH2JZRliy?=
 =?us-ascii?Q?pMd3ludpWL11frkVPIqqasFDN6awOh9+zw1M4cgx2DEw4W2/EQC7VrgFMMa3?=
 =?us-ascii?Q?37SLW07BN+lW4cTrivkMXs6u2bQtN1W1ipTPE7OoNnFER8k/J6NWhcxDHGl7?=
 =?us-ascii?Q?SxYYPRDQIfwUp+mpONFGBl8oTPkPP809x85GV7LNwQIp+sRkl9mhmf2Ed8GB?=
 =?us-ascii?Q?zbCEagnO+mhZizn97Xv2sg8IL76Q+hav3f7dRTnHH+UodEPPktdwkykuxA7q?=
 =?us-ascii?Q?KN8UZrf4ekKYpyDcZwWUQF028eZ+7/VSx2sJcCa/fmiYB7+y2Ecz9W+RLJWH?=
 =?us-ascii?Q?N0BzxdyzvSV7evZtQHC6NLdvnXWPHciflbZ4jnMnffAWO/TOHpMzF7TfrWBc?=
 =?us-ascii?Q?vh/NPRcZVbOdtbdl9+fYm+2bQe1EE4tvxAPm2T+5+OOjZJFGhjKhsCvmL+cH?=
 =?us-ascii?Q?YmxdouxZzvJLqkmNaLGnrwrdVp73bUXxKANqTPYR+4CgzDbYgB94DE6q4qOr?=
 =?us-ascii?Q?xKUieEC39VOpTa0iUusetEMuGII4SkytSCwKEI7l/nQq2fpelDL393NczzyL?=
 =?us-ascii?Q?AeuJ6iQXaMd1TysFtzELWZMfz9UuJ8I4JajAzH9qK+HriY8N+Czgs44vDj4g?=
 =?us-ascii?Q?yxE3FK3FjPTvDdhMxe5yDG836XX/TH/4kQka04gPJSA09GgxwL1xYwpJPsfl?=
 =?us-ascii?Q?6pvVb7lCmSCvswGQoPxefEXlvWiU5eBmXGBAlFJ/MPJjVNcEMo2r04PAl1Lz?=
 =?us-ascii?Q?CLPF5xRufjpSATURX0ELaZaEiuHSfxXa7S5xzTTZqXlxBk11UZkBW1K2YIqA?=
 =?us-ascii?Q?D4SJAvRkofCVvrzjQiUwHRk6UgcehVrJhb/TZHnlNNyypGCv2PifIJWYZQia?=
 =?us-ascii?Q?CquzWJDjrqKP9tZL3qnYOVqYmyv3IAA=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e544365f-b62c-4b9d-dd0a-08df0fd2842b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 07:01:34.5833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8md/UYcoWkeG0iU0rM6OlW6f3WKX+EY5bsjvW1HyWACGwU+gH6dddjbP3eHX7wi52ukguI/kHgs3z8DFnp6K4XSwlhz9Ia55LnnDBYD9bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989185

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Register Agilex and eASIC N5X clocks at of_clk_init() so they are
available before platform devices probe.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/clk/socfpga/clk-agilex.c | 83 +++++++++++---------------------
 1 file changed, 28 insertions(+), 55 deletions(-)

diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-agilex.c
index 2bdea1997b5e..64a20c727d16 100644
--- a/drivers/clk/socfpga/clk-agilex.c
+++ b/drivers/clk/socfpga/clk-agilex.c
@@ -4,8 +4,9 @@
  */
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
+#include <linux/io.h>
 #include <linux/of.h>
-#include <linux/platform_device.h>
+#include <linux/of_address.h>
 
 #include <dt-bindings/clock/agilex-clock.h>
 
@@ -454,24 +455,26 @@ static int n5x_clk_register_pll(const struct stratix10_pll_clock *clks,
 	return 0;
 }
 
-static int agilex_clkmgr_init(struct platform_device *pdev)
+static void __init agilex_clkmgr_init(struct device_node *np)
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
 
 	num_clks = AGILEX_NUM_CLKS;
 
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
 
 	clk_data->clk_data.num = num_clks;
 	clk_data->base = base;
@@ -491,27 +494,28 @@ static int agilex_clkmgr_init(struct platform_device *pdev)
 	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
 			      clk_data);
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
-	return 0;
 }
 
-static int n5x_clkmgr_init(struct platform_device *pdev)
+static void __init n5x_clkmgr_init(struct device_node *np)
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
 
 	num_clks = AGILEX_NUM_CLKS;
 
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
@@ -531,38 +535,7 @@ static int n5x_clkmgr_init(struct platform_device *pdev)
 	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
 			      clk_data);
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
-	return 0;
-}
-
-static int agilex_clkmgr_probe(struct platform_device *pdev)
-{
-	int (*probe_func)(struct platform_device *init_func);
-
-	probe_func = of_device_get_match_data(&pdev->dev);
-	if (!probe_func)
-		return -ENODEV;
-	return	probe_func(pdev);
 }
 
-static const struct of_device_id agilex_clkmgr_match_table[] = {
-	{ .compatible = "intel,agilex-clkmgr",
-	  .data = agilex_clkmgr_init },
-	{ .compatible = "intel,easic-n5x-clkmgr",
-	  .data = n5x_clkmgr_init },
-	{ }
-};
-
-static struct platform_driver agilex_clkmgr_driver = {
-	.probe		= agilex_clkmgr_probe,
-	.driver		= {
-		.name	= "agilex-clkmgr",
-		.suppress_bind_attrs = true,
-		.of_match_table = agilex_clkmgr_match_table,
-	},
-};
-
-static int __init agilex_clk_init(void)
-{
-	return platform_driver_register(&agilex_clkmgr_driver);
-}
-core_initcall(agilex_clk_init);
+CLK_OF_DECLARE(agilex_clkmgr, "intel,agilex-clkmgr", agilex_clkmgr_init);
+CLK_OF_DECLARE(n5x_clkmgr, "intel,easic-n5x-clkmgr", n5x_clkmgr_init);
-- 
2.49.GIT

