Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2114.outbound.protection.partner.outlook.cn [139.219.146.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629DC1DA21;
	Tue, 14 Jan 2025 14:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736866016; cv=fail; b=b49qMv9O4g6mktEFMh4b+75grDA36RfvSi07E51CwwF4vFRufTWpVhXy9R8fSvk1O3chn7TArupGu4CZpzJg05E8SoO1gWrd6XQ7eMFbr6KBDtApRMz/kqoNQbyOSovWnf605uD1jmx5LzxalWSmi1RJ7nrkVXDQPndsawF6em0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736866016; c=relaxed/simple;
	bh=y4cjY/H1hs9Cnechf9tzCGrAWpoBVY37ILGE2f0KB5E=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=BGexJiXeRd0DlnAc1sQllwWPZsUrGj3udq1iPI2+5Qozh2r6lDv6tH/9V8a6jGWuQfb8Kg/0hiJAyz5CIpwZRS82K6SIpE2+n9MNigk4EPUxUjICc1261W8JQgR7zOiT0VZydcKcUVZ+RAqymS7gr95SMekE/worsOrUTq27GSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvE1WQ3dYEp55noPAHsZbeeJaG7Y/ZbQdEo+VlzZDQbzXwMWM0R4rMH9+hj/5rxemgOooRINe2EDUasV6yrnRo2/TiV6sJG0aOzAFQZXnssJCt/dvuJpFI9XCaPl2ff1jQXdfe/3tfDpPDpNhhZYIVqveL10LAwRCH7wkrwkml+x+205sarRhvvxzd22Euz8e+SpIfcaEvm/2Ulxg4X56fOVBF6SkqDG4HKmqrBm9wAADWzQN8ISJ2AFx6TGDym6Juv0FwYu8iu/0xnxvMKjw3hsPMmj0PfNHAo27QS/90ycKYlii2YNyiQjpL0zZdOSRUgDLUa1E2n27OMTQdJMoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YtxQn9xxNKOvjdu9wcTl+XtglKq1x3AiNM+vJb5ULE=;
 b=WewWEAXSP5D5+sGugazqIahqzzKPS7a/hvLLsekzNPESliT31BIFX3t+gerRFpdSKpUPex/Ej6Gb8RjE9hXYNK927EuB45gKuN50uEIddhaEU82jcrZ9wmPzXt5Zc7rSWRBKwKk9PomExR+BNx6ST+o4OKFAROyPX08nfpOvyFjsltWs0n0t/9bIBz5Ic9N+yEX1ZcU716mbMLauUCDb4JkeAnHpXR8ump2ZuADNt5hetEctoEGnJ+BeWtZLwDdXp199OAHngXnLZqSmweQ+HV7xj+tp3pZXzbrQ1i7j8Q8qzRJjL7aCRUCHUNLgymKMxXJX3jBWePLnvplMr7QJxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1016.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Tue, 14 Jan
 2025 08:13:08 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.8335.015; Tue, 14 Jan 2025 08:13:08 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2] clk: starfive: Make _clk_get become a common helper function
Date: Tue, 14 Jan 2025 00:13:00 -0800
Message-Id: <20250114081300.36600-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0005.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::14) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1016:EE_
X-MS-Office365-Filtering-Correlation-Id: 87dd1abb-f4a0-4450-bc51-08dd34734778
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|41320700013|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	31B9HB48sidiYs0p0KfwyukirQQxKQnCucM1Ax/EZqN4Uzr97GIoiydA5UGPSALTVuru3Se+8Ope79rK+bEwzcMq+ji1GY7EdoXj7u24Bv3X7sidyEt1YzY9tK/Gh1zIIvezp7i/p8DVwRFoVnpp2Lg6CrqT41gwYXZNbcJ6q+ZDJ8nWV7fJnhc+dvhc3NSs99R93ejUPwcLbFU2hcuxUFeBT0F9+uzc+qs/6k9mdr4prF7lIEFSSOqdCF8WfMDHRZGJsVh+RDFOpUWBK7cNssvsk2QhLJTM/MEfRQWZ5QoJct9vMNHZTcR1HoF1Qea26pADZWoVLA+M0w1lqhHF3pQcPnBkJo18Cjj1fuASsICxKJHKZOrYl0GWfPVFlVHrlZv0HaCx/swdPJ5HDPpKBVpiOaljOJwRJbb2WwV/Ig+fHjUUTfsSS6UvBrmwC5qIQCPbpFhRMPmGc4MoJJq7pw6yHbP+jeNpbZFpijXG5xUfs6Ym+Vy+uyz7qirLPV7+10wkZeyvBBaYfWqXsjg5wMQDb/VHB3H1lpd8pzRy9WOisOsx0/Xy8KI/4p6VFcDQSLInls/hB67kal8ByI13RCuiE4tbvEcB2rHaJ/XB6Pk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vMTTuAcRjt/RS//8ek6gp4aZSeMYeAg1APdqHj988lni4rioD3OMoSqT+3kw?=
 =?us-ascii?Q?0Zwy1n+qaIs5RkPxffT8SpoE0lVJn7Uw0GCRNw/4tEvHkbq7ag+iDxPFlpM4?=
 =?us-ascii?Q?/hod4c3R1wqCMWku4y/CxoyjYNZji6AdXPPRAUlgswC6lRJFNQAsk3/W5sqo?=
 =?us-ascii?Q?ik/kYFVduc6pRNr3DrKjNl1pH0x/AuEcjriBSrjbKpw+SpPCCPkxP1JzGSKg?=
 =?us-ascii?Q?b0gB9CrMB0EN6TXRVt9bi2+XoSDqoFdkd2BO6VmGv6J2s64Kwl1wqXxGKW1r?=
 =?us-ascii?Q?JdCLH/txadtlX3l16PlqS28MERu/IDoh0GldPNLDx6mZtn0wGSWE/jZjAIXc?=
 =?us-ascii?Q?GV6W/CodBHDT9HC5PuhQTnHt5bYDeR0RoQMl1xekosq7czbLtXAJWeItvnx+?=
 =?us-ascii?Q?lAbIDu31mFXE5kWZfQ2pmfJLfi+E+8ghpPcgvY90TvhDVY8tTpeWPg2L0vSE?=
 =?us-ascii?Q?j2tkuPkhoYUvXuRf9iZ5ckOdXmpqmqyCWmtlq+44iGpSDlk42YjKIsHgJjEu?=
 =?us-ascii?Q?5yuipCngIaKE/qsf5M+vi8qd32ERaLoE6wDNGNc346eLL2Emw+xv+y9O5CWP?=
 =?us-ascii?Q?c1lZlxW/i1+lxRpO62cCxLypxTUlQCGGHo4xrfU8nn7LWjMRsj9u6CGzSG2q?=
 =?us-ascii?Q?KgAMIt2Gqb0o1XCPW4q90zXrja7SZ5ptFuYeFFmXaelKGMD6qMa3n7F6cPMf?=
 =?us-ascii?Q?Ja2r0LeqmKI0z1+C5TB930r1JZWuXkIfkKS8jYdiBiEGEossQ5FUpB7nSMgj?=
 =?us-ascii?Q?6bHnYkF/rkK5u1VqFugr6kT4JI/rEtdgJaXt8NozCg1LU7y1WSSfppv9BBqe?=
 =?us-ascii?Q?EYnvP+6ppLzduyTv8IEKfe3bVNA43BhjzjR2xUrJXb+d13C5IjniT6BN5Y2k?=
 =?us-ascii?Q?44UNooyI6Pm3RQxmNe2fWUqcgSnTBu4hxYeclrSWnkoAHkidhtKUkcWOFehx?=
 =?us-ascii?Q?E8fy0aIIfuAgUgPvhcmd7OJtDfuvZYMj6p38zQsAc0sCGJm5M5bJ3nifI4YL?=
 =?us-ascii?Q?tNV9yL1KFZHIrvf6GmIf2fxvWpbYlYgD72/tfKbsGMzYMgyw3gHU+c1rw3/R?=
 =?us-ascii?Q?MjPLt43wqYwh0T0iM6GWPn2Z6iFlG0ERiBCc4N2wHheTNKbl8Tu9tuiH/vUe?=
 =?us-ascii?Q?asIIexMduP50k+sthuJDvgYAgaYfVaqunROpI/tCEj4MVvPLZXgVxOmQzji+?=
 =?us-ascii?Q?6PVVUjetp37nLU2ixFSS9dQy1/wOzmBLIIPOeMzt8Om3jp3+huaX4o4gXvRl?=
 =?us-ascii?Q?XQZzq4oJeePlN5un0GubEPNOV372CXG1tbuExrlq66sJYDKeH9i4DuqlxJ73?=
 =?us-ascii?Q?IvrRPFKLtwcPNj8F5BwK0jxAaeR9vWqoV738XuJIEVYTR6XHdvMre2kR6O9g?=
 =?us-ascii?Q?e/xfvYiwIJr829tr1ppO2JslD5/o+mGWktIXRhZEs77BcohRgHLIKDEANru7?=
 =?us-ascii?Q?ab91rkLsDpYGE7s04hOBp/EsSPy5pek13YgQwvX6/rUDMjbm9ajo8XvLLAZr?=
 =?us-ascii?Q?aQ6o8Pns76kiRpUc0QsNtUS24leUen7ld0mz70y4hKaRMSzl359BOJ/77R/3?=
 =?us-ascii?Q?qReqLsyLW3y1uEfGQYY+2P8DebJoIKyhkx2kxmtJBYtP17VCWgCUCM47qI4p?=
 =?us-ascii?Q?ctVFFxuo86Bx38qnQkn+Z1M=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87dd1abb-f4a0-4450-bc51-08dd34734778
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 08:13:08.2626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vhvlET5mhlr3rPY+IBq1u0TVJkQw8ppo9XfJJhXEvyl9L5eFu9tktwSxbI70GWIuyR+tpIviTku5jVIQba4nIyfeFQ5H5hFx7WMYYd05THxLd8F64kePPgdkIxWWAlx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1016

Introduce num_reg to store the number of clocks, this helps to make
_clk_get become a common helper function which called jh71x0_clk_get().
With this, it helps to simplify the code and extend the code in the
future.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---

v2: Add __counted_by annotation for struct jh71x0_clk reg[].

 drivers/clk/starfive/clk-starfive-jh7100-audio.c | 14 ++------------
 drivers/clk/starfive/clk-starfive-jh7110-aon.c   | 14 ++------------
 drivers/clk/starfive/clk-starfive-jh7110-isp.c   | 14 ++------------
 drivers/clk/starfive/clk-starfive-jh7110-stg.c   | 14 ++------------
 drivers/clk/starfive/clk-starfive-jh7110-sys.c   | 14 ++------------
 drivers/clk/starfive/clk-starfive-jh7110-vout.c  | 14 ++------------
 drivers/clk/starfive/clk-starfive-jh71x0.c       | 12 ++++++++++++
 drivers/clk/starfive/clk-starfive-jh71x0.h       |  4 +++-
 8 files changed, 27 insertions(+), 73 deletions(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7100-audio.c b/drivers/clk/starfive/clk-starfive-jh7100-audio.c
index 1fcf4e62f347..7de23f6749aa 100644
--- a/drivers/clk/starfive/clk-starfive-jh7100-audio.c
+++ b/drivers/clk/starfive/clk-starfive-jh7100-audio.c
@@ -84,17 +84,6 @@ static const struct jh71x0_clk_data jh7100_audclk_data[] = {
 		    JH7100_AUDCLK_AUDIO_12288),
 };

-static struct clk_hw *jh7100_audclk_get(struct of_phandle_args *clkspec, void *data)
-{
-	struct jh71x0_clk_priv *priv = data;
-	unsigned int idx = clkspec->args[0];
-
-	if (idx < JH7100_AUDCLK_END)
-		return &priv->reg[idx].hw;
-
-	return ERR_PTR(-EINVAL);
-}
-
 static int jh7100_audclk_probe(struct platform_device *pdev)
 {
 	struct jh71x0_clk_priv *priv;
@@ -106,6 +95,7 @@ static int jh7100_audclk_probe(struct platform_device *pdev)
 		return -ENOMEM;

 	spin_lock_init(&priv->rmw_lock);
+	priv->num_reg = JH7100_AUDCLK_END;
 	priv->dev = &pdev->dev;
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
@@ -146,7 +136,7 @@ static int jh7100_audclk_probe(struct platform_device *pdev)
 			return ret;
 	}

-	return devm_of_clk_add_hw_provider(priv->dev, jh7100_audclk_get, priv);
+	return devm_of_clk_add_hw_provider(priv->dev, jh71x0_clk_get, priv);
 }

 static const struct of_device_id jh7100_audclk_match[] = {
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-aon.c b/drivers/clk/starfive/clk-starfive-jh7110-aon.c
index 418efdad719b..6f67587f4335 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-aon.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-aon.c
@@ -54,17 +54,6 @@ static const struct jh71x0_clk_data jh7110_aonclk_data[] = {
 	JH71X0_GATE(JH7110_AONCLK_RTC_CAL, "rtc_cal", 0, JH7110_AONCLK_OSC),
 };

-static struct clk_hw *jh7110_aonclk_get(struct of_phandle_args *clkspec, void *data)
-{
-	struct jh71x0_clk_priv *priv = data;
-	unsigned int idx = clkspec->args[0];
-
-	if (idx < JH7110_AONCLK_END)
-		return &priv->reg[idx].hw;
-
-	return ERR_PTR(-EINVAL);
-}
-
 static int jh7110_aoncrg_probe(struct platform_device *pdev)
 {
 	struct jh71x0_clk_priv *priv;
@@ -78,6 +67,7 @@ static int jh7110_aoncrg_probe(struct platform_device *pdev)
 		return -ENOMEM;

 	spin_lock_init(&priv->rmw_lock);
+	priv->num_reg = JH7110_AONCLK_END;
 	priv->dev = &pdev->dev;
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
@@ -127,7 +117,7 @@ static int jh7110_aoncrg_probe(struct platform_device *pdev)
 			return ret;
 	}

-	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_aonclk_get, priv);
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh71x0_clk_get, priv);
 	if (ret)
 		return ret;

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-isp.c b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
index 8c4c3a958a9f..f3fa069db193 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-isp.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
@@ -75,17 +75,6 @@ static inline int jh7110_isp_top_rst_init(struct jh71x0_clk_priv *priv)
 	return reset_control_deassert(top_rsts);
 }

-static struct clk_hw *jh7110_ispclk_get(struct of_phandle_args *clkspec, void *data)
-{
-	struct jh71x0_clk_priv *priv = data;
-	unsigned int idx = clkspec->args[0];
-
-	if (idx < JH7110_ISPCLK_END)
-		return &priv->reg[idx].hw;
-
-	return ERR_PTR(-EINVAL);
-}
-
 #ifdef CONFIG_PM
 static int jh7110_ispcrg_suspend(struct device *dev)
 {
@@ -126,6 +115,7 @@ static int jh7110_ispcrg_probe(struct platform_device *pdev)
 		return -ENOMEM;

 	spin_lock_init(&priv->rmw_lock);
+	priv->num_reg = JH7110_ISPCLK_END;
 	priv->dev = &pdev->dev;
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
@@ -186,7 +176,7 @@ static int jh7110_ispcrg_probe(struct platform_device *pdev)
 			goto err_exit;
 	}

-	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_ispclk_get, priv);
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh71x0_clk_get, priv);
 	if (ret)
 		goto err_exit;

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-stg.c b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
index dafcb7190592..2a5ad0e07d1d 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-stg.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
@@ -75,17 +75,6 @@ static const struct jh71x0_clk_data jh7110_stgclk_data[] = {
 	JH71X0_GATE(JH7110_STGCLK_DMA1P_AHB, "dma1p_ahb", 0, JH7110_STGCLK_STG_AXIAHB),
 };

-static struct clk_hw *jh7110_stgclk_get(struct of_phandle_args *clkspec, void *data)
-{
-	struct jh71x0_clk_priv *priv = data;
-	unsigned int idx = clkspec->args[0];
-
-	if (idx < JH7110_STGCLK_END)
-		return &priv->reg[idx].hw;
-
-	return ERR_PTR(-EINVAL);
-}
-
 static int jh7110_stgcrg_probe(struct platform_device *pdev)
 {
 	struct jh71x0_clk_priv *priv;
@@ -98,6 +87,7 @@ static int jh7110_stgcrg_probe(struct platform_device *pdev)
 		return -ENOMEM;

 	spin_lock_init(&priv->rmw_lock);
+	priv->num_reg = JH7110_STGCLK_END;
 	priv->dev = &pdev->dev;
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
@@ -145,7 +135,7 @@ static int jh7110_stgcrg_probe(struct platform_device *pdev)
 			return ret;
 	}

-	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_stgclk_get, priv);
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh71x0_clk_get, priv);
 	if (ret)
 		return ret;

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index 17325f17696f..e9d8168d02b8 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -323,17 +323,6 @@ static const struct jh71x0_clk_data jh7110_sysclk_data[] __initconst = {
 		    JH7110_SYSCLK_OSC),
 };

-static struct clk_hw *jh7110_sysclk_get(struct of_phandle_args *clkspec, void *data)
-{
-	struct jh71x0_clk_priv *priv = data;
-	unsigned int idx = clkspec->args[0];
-
-	if (idx < JH7110_SYSCLK_END)
-		return &priv->reg[idx].hw;
-
-	return ERR_PTR(-EINVAL);
-}
-
 static void jh7110_reset_unregister_adev(void *_adev)
 {
 	struct auxiliary_device *adev = _adev;
@@ -425,6 +414,7 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
 		return -ENOMEM;

 	spin_lock_init(&priv->rmw_lock);
+	priv->num_reg = JH7110_SYSCLK_END;
 	priv->dev = &pdev->dev;
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
@@ -526,7 +516,7 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
 			return ret;
 	}

-	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_sysclk_get, priv);
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh71x0_clk_get, priv);
 	if (ret)
 		return ret;

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
index 04eeed199087..bad20d5d794a 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-vout.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
@@ -80,17 +80,6 @@ static int jh7110_vout_top_rst_init(struct jh71x0_clk_priv *priv)
 	return reset_control_deassert(top_rst);
 }

-static struct clk_hw *jh7110_voutclk_get(struct of_phandle_args *clkspec, void *data)
-{
-	struct jh71x0_clk_priv *priv = data;
-	unsigned int idx = clkspec->args[0];
-
-	if (idx < JH7110_VOUTCLK_END)
-		return &priv->reg[idx].hw;
-
-	return ERR_PTR(-EINVAL);
-}
-
 #ifdef CONFIG_PM
 static int jh7110_voutcrg_suspend(struct device *dev)
 {
@@ -131,6 +120,7 @@ static int jh7110_voutcrg_probe(struct platform_device *pdev)
 		return -ENOMEM;

 	spin_lock_init(&priv->rmw_lock);
+	priv->num_reg = JH7110_VOUTCLK_END;
 	priv->dev = &pdev->dev;
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
@@ -193,7 +183,7 @@ static int jh7110_voutcrg_probe(struct platform_device *pdev)
 			goto err_exit;
 	}

-	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_voutclk_get, priv);
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh71x0_clk_get, priv);
 	if (ret)
 		goto err_exit;

diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
index aebc99264a0b..80e9157347eb 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.c
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
@@ -325,3 +325,15 @@ const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)
 	return &jh71x0_clk_inv_ops;
 }
 EXPORT_SYMBOL_GPL(starfive_jh71x0_clk_ops);
+
+struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct jh71x0_clk_priv *priv = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx < priv->num_reg)
+		return &priv->reg[idx].hw;
+
+	return ERR_PTR(-EINVAL);
+}
+EXPORT_SYMBOL_GPL(jh71x0_clk_get);
diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-jh71x0.h
index e3f441393e48..9d5dec1d5cd1 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.h
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
@@ -117,9 +117,11 @@ struct jh71x0_clk_priv {
 	struct clk *original_clk;
 	struct notifier_block pll_clk_nb;
 	struct clk_hw *pll[3];
-	struct jh71x0_clk reg[];
+	unsigned int num_reg;
+	struct jh71x0_clk reg[] __counted_by(num_reg);
 };

 const struct clk_ops *starfive_jh71x0_clk_ops(u32 max);
+struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data);

 #endif
--
2.25.1
