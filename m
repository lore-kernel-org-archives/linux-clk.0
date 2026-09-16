Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010071.outbound.protection.outlook.com [52.101.228.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247C144B66B;
	Wed, 16 Sep 2026 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558654; cv=fail; b=YbTBBy5FhhEciPrC6xw2edv24guWl0qJjaR8OcImrHYQJqvP1uUAlvFcSuGpUC14Oi5SzHaFcrMGGt+FukQQxIdHA0Gx+vLLnYFICooh2l5II1LdQTCN6B6pz190mO8ksAgYOG4u6dHFuELNhWuLn+fkSS/GatHJDg4M1HBT2Nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558654; c=relaxed/simple;
	bh=8NLVU2iMenIyya9CPc4OAkt7XVamWgkEMZqzOM6bVkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JERA5rm5AndMEdQcPxFIgiAj+1JJxAXveMgKjJZtVVRwwdsgro/CFFBouFbfwnZpSbJW298fJSooIE7vFFfzldIgHysXIXBfkLPWF27G72+KAN3ZATZiekvzwfdh0U5ZN/zEgIbEAwPWjjMB0k5j53xuO2380/rwst/FT8kiD1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CFveK/oC; arc=fail smtp.client-ip=52.101.228.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CFveK/oC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I22KuAZh31+v9Pd+fBUKIdGH1PkZV5iHZO0xRrG8pQ66RlUGqMliI1s3DXmBxjZ+1s7JJwFy9tdaDjKwswHdkMvZNLexIYCh++v6uGko3fzZEmhqMsHgpcNaiPIvItT43uIm61z8T+aWMwSwccgRRXVbbO3sTcuEWUPbGAs9nO/u+L4uP7SVsYch9CXLsjx4TzASfuw7EPf22oE0doma9UFNDqU1tiyb8biBI2WuYl4AE4f6cSbfKaP7rr77ri5iOX9pmh/KQYj2yRW3AqShV3h+s+68X0Yfx+xULQvQNt6s4NO6xs65nE98rX82DP22AyFNilYdurak1eM+biGWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbmcSxLGv1kWsaWjoLBg+aRRoNZ0mDh0k6mrtGax8N4=;
 b=ngi4o0jiUV7XXXMv6RFD6i304JoomHMpsQWfOoBsOjjfTC+Vtw+hUyf+w5twc79dG6pzyO6/sA2IHIRWLFsx0jr9fAK09+T0Ulj2HX9v0XVZFQ7KT247U30T46sGcDe9g2OOX6mzNSyb+7JUNsH8uVvtLTuvZVutM4/tQltX18l7I6OIJlfWO5ly0MNfZL6UDWbFzBhOxa3YdcLPn91+mSYy36+c1Nff6rfDBlAExxcHmxcpXXf5rYIzQwgqPstC3wWsKbA0+eRlYrz4cKHsGh4i6kek3jWa7vXbnsxDB/yraCGob71rGg4K2YY/J0bq5+QYKx7q3svCszhbpysLsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbmcSxLGv1kWsaWjoLBg+aRRoNZ0mDh0k6mrtGax8N4=;
 b=CFveK/oC66t/FTKszqece43CnkN6/M45/Bm/tA2cD9lei7jgSQ+cA7Sd0a04SuNlJyJsZTXlyKOC+a/IQImbeWSsJ5Y3WBNnffQI+A8/i8PX0JI3lrpHHNT5B8gygIH/1mZhriAHknwHeq9kod5x0/OeStknAn7Sh6tpMDDv7wk=
Received: from TYCP286CA0224.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c5::8)
 by TYWPR01MB8558.jpnprd01.prod.outlook.com (2603:1096:400:171::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 11:37:10 +0000
Received: from TY2PEPF00005621.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5:cafe::a5) by TYCP286CA0224.outlook.office365.com
 (2603:1096:400:3c5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 11:37:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005621.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Wed, 16 Sep 2026 11:37:10 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.205])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 48FF03000442;
	Wed, 16 Sep 2026 20:37:06 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert+renesas@glider.be,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com,
	p.zabel@pengutronix.de,
	niklas.soderlund+renesas@ragnatech.se
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH 2/3] clk: renesas: rzg2l: Add missing of_genpd_del_provider() call
Date: Wed, 16 Sep 2026 11:36:36 +0000
Message-ID: <20260916113637.86947-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916113637.86947-1-ovidiu.panait.rb@renesas.com>
References: <20260916113637.86947-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005621:EE_|TYWPR01MB8558:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 81995b83-9a17-41f5-0c75-08df13e6d847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0aeEIt6mSYiiLYtc/h/pjb9hulCbVBQ3dTG/6ExHuOW8IK7hSG+CLdheLpfsxL6MStIynQjeSmN3f72Le5Q6jp2wzb6ynNtpIHM2nhH36e5AxyWSh0ibK8t2A2Hu/o+qHa/1Ct8KLf4oNDOQO80bjREcXLQZ0dyjLJV46KIulixo6MFBXLQtusgdm1KHgXD6nS1MjdpXuSHCeqAhf/gU86NnbsmQgydEoWo+jqLLXBgAYeMsbeGxHXd8BTz8ovwxwLlW2VlPKZum9hHxoZ3MwHL33th6oyXrzKSeGM2rtSreWL2Eq6CNJ67QAz++q0DOLR0Jj4bNDxj4iMBwsBnx7zojPwh0paVGUP/JOdwEOXJuGCTokxLl07qHoS9wJRykkyBfO7t+y8xmu8e8yb9NB8S67crsg6NZ5mzxHcigQh+LF5oLc95Ey8ute3/uC0/alPdufsl2T7oTI8po+81IXuxTGRuf6blJXf4HWNERwwkS79ptHASQMlvf4ctyigeNoGLdmcSpLVdIN17mxOfgeZEl8TmZJWPPWBhp3kCj1GQlJoAYe9qCq+x6WWm5acQnKog6h7mvMB0UYqCQS6aFCBOG2TgbaHMJuYMEqx7ut0DgAPIqVkNo3D5oVc+pW6uuNbilwEdMZ2/7ygZg0KcjMg0scrxOridh0EWCNpWouz6OupToBKwSnvD4zdn7wPHFisW+6xApvylO4qyPB+RuFA==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gnTY8Uyf5zH2mDv1Zgyb9oKnOw9mPLBEeoUANbuRY4qldFplBAUX2c/MuffMsvlVvMRdOWVm0/KMWg7bjyd8LmzPnqOTHk57QnAPlwY8NzAz4wjQsC8A0DRBu8VdR+JHTILHimujEpvcXSIsG2q1zmeN898ctxKu7UgFokRzZpscJ1N8PxKPJFtwlCucOh5mHONNKlRV55NbcL5SzTpz3sam+RvOdqhZ4UrZg39vMROn0YPQkB/QeuKpX0OUNuElG+jId+VOLBi9WkLiKDAO858H4GnXlblwonOWwH4KWY/xDgdDWAFcvt6EHc2lG3EvRF6jQYHVVa0xIggUwT1qh1rtLuYvBCHBpf9JnqnRN5NxcRaYEm6tjxyrNok1MRdfxBQos50RG0PRQLF3NASirRI4C9kzYmH1lKVQpI+ELvgahYSbOGv0c2Q+uhaNEov0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:37:10.1346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81995b83-9a17-41f5-0c75-08df13e6d847
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005621.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8558

The RZ/G2L CPG driver registers the PM domain provider, but doesn't
remove it on probe failure, leaving a stale provider behind.

Add the missing of_genpd_del_provider() call on the probe error path.

Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 7f8decef92fd..01304b078d6f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -2590,7 +2590,10 @@ static void rzg2l_cpg_detach_dev(struct generic_pm_domain *unused, struct device
 
 static void rzg2l_cpg_genpd_remove(void *data)
 {
-	pm_genpd_remove(data);
+	struct rzg2l_cpg_priv *priv = data;
+
+	of_genpd_del_provider(priv->dev->of_node);
+	pm_genpd_remove(&priv->genpd);
 }
 
 static int __init rzg2l_cpg_add_clk_domain(struct rzg2l_cpg_priv *priv)
@@ -2609,11 +2612,13 @@ static int __init rzg2l_cpg_add_clk_domain(struct rzg2l_cpg_priv *priv)
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(dev, rzg2l_cpg_genpd_remove, genpd);
-	if (ret)
+	ret = of_genpd_add_provider_simple(np, genpd);
+	if (ret) {
+		pm_genpd_remove(genpd);
 		return ret;
+	}
 
-	return of_genpd_add_provider_simple(np, genpd);
+	return devm_add_action_or_reset(dev, rzg2l_cpg_genpd_remove, priv);
 }
 
 static int __init rzg2l_cpg_probe(struct platform_device *pdev)
-- 
2.34.1

