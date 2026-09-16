Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D962844A3F0;
	Wed, 16 Sep 2026 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558645; cv=fail; b=Kcd8U2ilv8DjKVWlQC6Qn4R00o7BPuwCLwLC6rl/yQvNe4F0ywEQslnlY3gLy4xnO4l7Hq2A0ho1FuPIfQMRn4RR0ym7UltGowNnRKF/pWX/it6T1ZOGr4gfXd+1j8G/iVR5GubOb9s0P28CZ6WEAi9OERrssFB7rNcxiplH6/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558645; c=relaxed/simple;
	bh=GCvjkimB2dTn88bCwkauS38vFEk9JAHMvTdx2m0+OGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WTRZa+yA+EnxAM1XJz2aKBRjiYaFlba+CNM1bTaC8N9co8N63R56SoC4Irm0EGrbSfoEw13fDd53X3VXMdOh/kbR1kbKitsciMEZUnOKEqWkWxTxdKMgIZx6uvvH+08xILwhrv41pYGaSETZo03KDz24ZFHB3jQVxpL0xTw+EQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VY0diJTb; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VY0diJTb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdjPzphhjvCqjvh1lCogM0bKCveNIeoBM9XwXyZftaXZdy6sNxcm3VX3ckRlG3437avY+gEOUWsiElXyFtvfkrC/7AZ0/l1EpOzAxo7ZCKPE+PN5oyCoE2kIBh9qsZopazmJsh2udn8HcFiaICIsaL5ZrkhcDGMp3LvjI8WEYwiM1/Aabg5jf9sg9hDlww5EUvze2BwAK2dputGPJKO3Zhs36uOJ7wlu8xDh3cVw4I3vAZe8C84fSSL17RAhC4078Ej0TxX6FA5pYlWrtDHVvEPh5Y+lMi9ouUwGF0PX2Nl28XZ3fqvRSgXdB+vgZjQvuXOSX3BNMAh7X7yYx9ShVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PqQh6bPoWTUL2iz/C7oRv4Fuae73dTN+klRYgLf9uU=;
 b=oBTNOsrHKbtsp0qXQvrBlo5CMysTuhgmYF+dloRtzrBMkfhqRXSsfreJTdAiEjt2E1FGN7u9EzyJ9nyE144JXnmnbQ1Y68nE0UJx1jwVTSkzRzh2rHJP8lROaiZ98fZpBLMX+3BwYWdgGYWo7gf+qwAM+arTdtdbrN/DHyG+X1QvsFcSFATRJduin1DktzMKoUlBoWuT/YsRX8K2M9Phjtbtn7mN8aCkcFVYlHnzhzkiO2zRyCOSF6CLhTWCYYWyQBIfurx83hbkx+GCFAuJ+easfSIJXdohTxxbFEM8oE7Pd++vQHtH9NJAwZytnb2tgxGtBqCAa5a6OMXxNoRgIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PqQh6bPoWTUL2iz/C7oRv4Fuae73dTN+klRYgLf9uU=;
 b=VY0diJTbdldub+sRdkv6T5naL7cbD33YruQuDzMIaNKwdvfwjMwSUHiiUvArcnG5N6oRSlD78wavplTFwi3CUhBz/U1OHe6HsgAG/ttLHbGyAM0Qh6gd2WSX0G+fJGyA6Sjemb2eLQDnf0XvlatHibdUEPthJVmJtae5OBFnSqQ=
Received: from OS0P286CA0137.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:16b::19)
 by TY4PR01MB12797.jpnprd01.prod.outlook.com (2603:1096:405:1e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 11:37:14 +0000
Received: from OS3PEPF0000003D.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16b:cafe::41) by OS0P286CA0137.outlook.office365.com
 (2603:1096:604:16b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 11:37:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003D.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Wed, 16 Sep 2026 11:37:14 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.205])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 9963C3000441;
	Wed, 16 Sep 2026 20:37:10 +0900 (JST)
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
Subject: [PATCH 3/3] clk: renesas: cpg-mssr: Add missing of_genpd_del_provider() call
Date: Wed, 16 Sep 2026 11:36:37 +0000
Message-ID: <20260916113637.86947-4-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003D:EE_|TY4PR01MB12797:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 67d0ed46-d602-4dc1-ff19-08df13e6dae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	rjT9cMMVMjP38qmxfURF0zixRbTZB98fBHDnBUT+cCSQC+3Uvh4xM6FFxMfMo2oG0EyUwe0mLW1hsC78ETWOzPdgydWnY9rQOR3RVEdDJCqRGSPWkcO7GoLX316Dq5Gma2nZXWqP4N2TKUVnoOX1Qxl7X6fOjI3Fqu5z1agKbSxRsjnLlpaT30IMwWfAlFRXjBwWzCtMDmhC+rkQpnDioz2g3U7SBevjHXrhjXOnIBImgStPXN6U10dVCmhDCJjn++qwedDbSE+Omdv0LKI+edH1HklL1cc4FOvuS7tvcbnWcRHTcI7mwB7MO/6CUb7ffuDKe1+Zv3Q4NzkQtJcNO0n5Djm2Q5ESNlt3iLly82WML+J+/Ks2CiZdnf/YXsRboVIBskwSoDrIEukD4Y/d5HqgokCXtIWMC43fD4VGXm8CdEuuFS8UdiRgKubtJihs9HyzR4X8Ks0xN/bIc5WLQ1/um/xJNf3t+1uihIfbJo1g52Qr134upxQGr4CeHSFWsU++gNRFsNXSootQT5JhSLEEVJnfLGpIlVpC5Jio4M3uWKqCJ7BZvWbTrSaB23/d5YB+7/uiAvAgPi/gwlVACjA+3NrH6mF1kXR3XdDRfNFMu6GQf9wRXEOoQVFWhY7dhBebGo7G8PgTNVvqBoHofzOV2haqdQPe4J2SZKENB0F6nce8xwrIhz9EdQyK4XBdU8kYiS8WZoannrnPJWRzAg==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ar+LWLWocZMiiebiBMikVbVYHJtEwiC2IR/fEspGQOxPUeF6ingqtLPMemdJH2HNIwpro6hM9ax1oJjoYlmkRLyz3BqTsw+KZJxQVgh5IfLi9fVuIdf7vbxhvr6H/ejjVmMxMJ0mM4OfJ0OGQkR9/oZe1fxSret0Xfrmjr/BxbkxUG7nlijB2CEqXtxWu11rNagIdt6vZR3vRnsg8EiN5UTjJMf1izMyC5Z+YyZpHlHapFyEloMKUGL+udmnz+R3GoIFfry+7P4PcymdFtIN5lOAtW5yLdJ2yL21BmPh/4KnmXRMuY93AAx7517+2Mh3I9uqi1dS1iitX5Y+4okL5rT++6ZwQ0SmKPUtCS2SfhldGP+fueo09bFqnEvsZHt2n9PIRFyz+ovgUsiv7l+qjatUStBzJFICPAxIiXPoCj54ewIHJs+8+yY+bNycxB8H
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:37:14.5313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d0ed46-d602-4dc1-ff19-08df13e6dae7
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003D.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12797

The CPG/MSSR driver registers the PM domain provider, but doesn't remove
it on probe failure, leaving a stale provider behind.

Add the missing of_genpd_del_provider() call on the probe error path.

Fixes: 6197aa65c490 ("clk: renesas: cpg-mssr: Add support for reset control")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index f2feac1cc74f..73a705cc7924 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -672,7 +672,10 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev)
 
 static void cpg_mssr_genpd_remove(void *data)
 {
-	pm_genpd_remove(data);
+	struct device_node *np = data;
+
+	of_genpd_del_provider(np);
+	pm_genpd_remove(&cpg_mssr_clk_domain->genpd);
 }
 
 static int __init cpg_mssr_add_clk_domain(struct device *dev,
@@ -702,13 +705,15 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(dev, cpg_mssr_genpd_remove, genpd);
-	if (ret)
-		return ret;
-
 	cpg_mssr_clk_domain = pd;
 
-	return of_genpd_add_provider_simple(np, genpd);
+	ret = of_genpd_add_provider_simple(np, genpd);
+	if (ret) {
+		pm_genpd_remove(genpd);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, cpg_mssr_genpd_remove, np);
 }
 
 #ifdef CONFIG_RESET_CONTROLLER
-- 
2.34.1

