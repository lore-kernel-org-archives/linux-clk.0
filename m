Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D204A92C3;
	Wed, 16 Sep 2026 11:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558646; cv=fail; b=lFSw+stBlhpwVtA9FYC9gqQqTmvJ/Pqm9FLx39iWE80kOrrsJhRfHje39FpyoRCBwi+RJRElyso+mbDweH77gaQLkfmUDAYyhOo7uJclm87191OxsvOpVjap/7WEY8D/M28Mi7MypDmuJW9/glJbDR3cjKGqlpRKhuuCVuBIi5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558646; c=relaxed/simple;
	bh=Gz8mu2sPmxKqFYQdgPFLd7VtgOeqtbfBnj2XYqnQOC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e44ttNM29BMNXUrA0Ew6Mf0aNsB38hJJ6iIBybeQ6NdDeURGkpTZjPKJhvOCwOoeuKvg8s9npRLAu+Qc+fBKsssjyfTJrWvgNuzc2Nz5GYPk6MDk1br5cJUJBjW88V6+VH3Fk3bWnSAKzigPDwq7lzmN2O9QzamK8TOThSl0VYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=McdBwDGQ; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="McdBwDGQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wE861NFwrBlEHfAE0L7wwgzHgKwrLrQ7hu7gZmGqYu6aUWA3hET0T8AYCNiv5lnLCT3T3SvDnZrIBemmEFw6FYt2UTQarIlHjX+skUoNqDOecCOsQYgz/pqK1EWhZs+viQmqTl/hJq2uz2bhJTfoJMGRXfjB4PvVnECBCod+vgPje1EEaGneo8s+q5SxeX5Nv9A6VU9u9RQivU5J11O36kDYWuFlu4+a7Qci7rYwMMFawBIV2bo5PXqJqdL4UfEpWT86p162lxotHfOK0jfQ3tO1xvlgUtW8Y6bRFGeObdNk0cJ6UH3Iu8qtzMUps3diKIt3CiHaBIHvQ/PhSeDjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ji45jdBP/0ogDlQ5nTfmEovgo34tfwsnuIoarWHIpak=;
 b=B6Ohe6Vtoat9Jcaql0owI7qb/DMSBEAz9OFDrVSGFXHXmDtiKGYRhuLBnQlgNLXz3zTy3rsQ1y/ry05tguMlB4DLnOjgAMoqaiibjbYL2ThODx0sgLqP0rONyaLxM7Zg7F/K6+8dv60Zaok4+HUdQDK1pw0+3GK/K+FjW7+PuMbIAgm3Qc2CXhZ1GVyuL85hp8M1c5V22jlRYaGX9fRqMGlDZk3D3UysIL7FPuCAUwYzg7WAu9XOGtar5w5zsx+25QOUyqcQcoeKXN+GG1t3+iOezl1mI8RfIM0TFeyIOOTPPofEOP3wswUM4hBPdOVJPSsfvHsk/FDkZDmEtFUN0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ji45jdBP/0ogDlQ5nTfmEovgo34tfwsnuIoarWHIpak=;
 b=McdBwDGQg17fnO0I4t/ho7HZeCXVmXcUfNFKcovSCbuhV02PRDhfQUr55EDRAsq2Ys6Jzwuf2NsOXVRqm733hDu30f5GPIXAUcK60n9ZEJGkzHrh53TzkRaczQ//8lrom8DoJjOrkmPMI9+JhSiwo401GSvRem3JR2WU3lueDIU=
Received: from OS7PR01CA0144.jpnprd01.prod.outlook.com (2603:1096:604:25c::20)
 by TYCPR01MB8190.jpnprd01.prod.outlook.com (2603:1096:400:103::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 11:37:06 +0000
Received: from OS1PEPF0000D215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:25c:cafe::66) by OS7PR01CA0144.outlook.office365.com
 (2603:1096:604:25c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 11:37:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D215.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Wed, 16 Sep 2026 11:37:05 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.205])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id EA6193000441;
	Wed, 16 Sep 2026 20:37:01 +0900 (JST)
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
Subject: [PATCH 1/3] clk: renesas: rzv2h: Add missing of_genpd_del_provider() call
Date: Wed, 16 Sep 2026 11:36:35 +0000
Message-ID: <20260916113637.86947-2-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D215:EE_|TYCPR01MB8190:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f0c9f3c1-17b4-45ba-2827-08df13e6d5c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|22082099003|18002099003|13003099007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	AGEhMvPp30caAMRIDQTi03gCXAGTV34S4bU9VnGkHta9PP7OIw3yxFGH4LaIIACDVDbKNkmn4lRPaQf+ykkmmpa9h+MN7flI9u5WukedsKiRNArfXXkVLgMyBRR1KE/zoiJWaw/PE1ss87TcgcVTGsFNXDWm2nSXzFqtELSnvrEhibG77P0qBCjvHBYLnh/9cVOHZRuoR8+w0r33buf5DVWvdCCb6Ci1WeT3waH0pUO02uXlKNq0F+oFGQk1CvgKrSvF2cXU2IZWKNu0hViMU7JACyFNrLQSCYYtnTFfACDDnvlJ1a7XqEXXnvG3dvc/M4RxkrN6B1WVj4ROptr6qkykjbjz10MBBaQ0/RkcQt14FN4N8ISUxVtxgEo+gnrhqx5mFyOtv/8VawhLOc3zEfXIoCxebCcI4/7XPV3HF3TfCKNKVm8s2simU1/+tF6cyGDKHP/TXo5vdmF9UaPzIyncM2jKLbdWzNQnl5sOyNf3flU8tmrOBxq9aWmnibENfVYblUQgSeTe2q3VbVqYdOq/z0l44JZqqsMhrGUs8R/nicHmHWKtcw7F2halt7jXlHAgTqp722biHdr/aOFGenQqHbdVK4tPz/xxOrdO+7fPMKpTC/HHdLFIMq7yFaghOvSGzZgON28rcQbLLPlzIw==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(13003099007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fD0S2kk3U8l6yxZrkBf9n3u9Wfx707xvhrtjezMNBLA0xVkp4XQEwQi8P6F7WTAiy0rj6GtQZ3d94vUytINo53Kwu6731MjABR7GzzJn1zI7wUuBXCjeMFH5xRTjfyKHi8bSiGR9ZqmvXC0KMLhgyL7qA8vfIhi8qHMObv3V7kAYzAT1WkjqZdSbbMF98Jr2GWJ9g58d1xhzX/ytzefRpRGG6UhesIZrrspFRxhPJCIQ+7kN0i3u74h7LA7PoEf19CLeRn/1bpRkgdnNxKeXxQZhQp7ayfNAqxyyLvtRkvBZpgblrVZxOJhBX8pRB5JV7Rv+PDm4o/13GHSm58ewn9hhoR1qIW9KcgCPzB/n9jLRfp5nqJB9r1BvfQoA0V16z02bJQSx9cPjzj/+zBQ6zXBHjootvlJ3W/bqrRUF1eyZsmnhrtINXen44r+EF+K2
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:37:05.8809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c9f3c1-17b4-45ba-2827-08df13e6d5c0
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D215.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8190

Sashiko reported that the RZ/V2H CPG driver registers the PM domain
provider, but doesn't remove it on probe failure, leaving a stale
provider behind.

Add the missing of_genpd_del_provider() call on the probe error path.

Link: https://sashiko.dev/#/patchset/20260902104939.25522-1-ovidiu.panait.rb%40renesas.com
Fixes: dd22e5621749 ("clk: renesas: Add family-specific clock driver for RZ/V2H(P)")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 63f13fe4e4b0..827e274ba744 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -1512,7 +1512,10 @@ static void rzv2h_cpg_detach_dev(struct generic_pm_domain *unused, struct device
 
 static void rzv2h_cpg_genpd_remove_simple(void *data)
 {
-	pm_genpd_remove(data);
+	struct rzv2h_cpg_pd *pd = data;
+
+	of_genpd_del_provider(pd->priv->dev->of_node);
+	pm_genpd_remove(&pd->genpd);
 }
 
 static int __init rzv2h_cpg_add_pm_domains(struct rzv2h_cpg_priv *priv)
@@ -1535,11 +1538,13 @@ static int __init rzv2h_cpg_add_pm_domains(struct rzv2h_cpg_priv *priv)
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(dev, rzv2h_cpg_genpd_remove_simple, &pd->genpd);
-	if (ret)
+	ret = of_genpd_add_provider_simple(np, &pd->genpd);
+	if (ret) {
+		pm_genpd_remove(&pd->genpd);
 		return ret;
+	}
 
-	return of_genpd_add_provider_simple(np, &pd->genpd);
+	return devm_add_action_or_reset(dev, rzv2h_cpg_genpd_remove_simple, pd);
 }
 
 static int __init rzv2h_cpg_probe(struct platform_device *pdev)
-- 
2.34.1

