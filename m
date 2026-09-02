Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010017.outbound.protection.outlook.com [52.101.229.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C946F4AD;
	Wed,  2 Sep 2026 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346227; cv=fail; b=dAAM7UzH1ygZQnHZSvp4OFdDVtxBv6v/ozQ+04zLLcx0W1E4Yr/8UPP4jxEXzdVEYA8h4VWq05jghiClWNo9ErSfDqxIxwSq3DW+7OPjDee7yklyTvAk6YMs006JZ/jU1xb5R/PZjdHxcp5sr1bmA8BQyQJM53IGYWjvixcwVGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346227; c=relaxed/simple;
	bh=SPcRquxZRbJXk4iDU42hayqfesm1uq2DXxhKbsQwjpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W9LWpL4OY/h3w04GQzBvfe7/AKlHX17YRU0prDQqcNg4MXlm+3kEsUL/uh/+o5lES7k+7BM5pyplfDEXST3O0tX4ibYV+2sAWy3kqOEivqWQhfjHOh54KF9ef0qTqsug9vADGYGG/GS1+7jnnf4w/FkyoFO+oi5M9parOwr5+48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TKYIFEqB; arc=fail smtp.client-ip=52.101.229.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TKYIFEqB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWNHw0oKCQ6otlcCY+hoe9mIdKlFt5/8hpj2SLcV0c+7usEpWlaulvrEXbMN8UKZ1GLkj9S1FJoc6yIhkNlwYFufV4y3UIsIY2ni9ZghXehgzHjK+3X9FPqYgkuxO7Em0EKasb3NSLps72ebYF15PkHgKwcOlBxoY8i9D7C8c82FcMjOT7PhxyeHOE3K7C2IUS33x1DcI5uWOrx7EAbpXlm8o5zGetZ4bWC3OPD/M5aphD5aR+hmCNCrturqlwDV/u7NQcABVFPvESaLvKNCsOxLLt7P86a+oJGlItoFGaqyJdgtfzAif7wdDH3beDuvPtQVC0vd8h1ZXFemlvHkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkpPwHYPOO342ipdG7djd6w7RyaPjkEEoawxjkn3Fck=;
 b=QPhZ3NHGz5P4sCsc6R0lB6Ka2gM4UjmDTZtad47XvImGzYegreWRwZ4ZEBsl4vOp4qF6hKnYt5SZ9L6df7gYZabYq+xY8MhMwo5ovOyz7pc+H9l9XaTMWQUJVcBvxne60DDL0cXn1tDvrD+8T0cLQXxv3QKvbpT8oFQKOdC17LGh4OG+UtZr6W09IuRJMWLf2F3Iq2lUqFRlI9/Zce2UiiOSCvxmMxHpYdtpsFT+4qm4AGwtzIqtIxd0QlGDTetAgVm+zGcwUYKanMdd/N1UN8JXHyq3FOcDULpslVGOGtzXHudC2jrdckymQi66+povUeCaRd8w6+H1DZrxCHOjYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkpPwHYPOO342ipdG7djd6w7RyaPjkEEoawxjkn3Fck=;
 b=TKYIFEqBO6b6Kk8jTJwTTzfqdlTfwYrRTdL+mAeiBxJTfDmdypvspU9MfDA/lDSrVdDwXpahcliQkA1qQXfaqgOO5m4dP7SsLJKefRRMNF5ZhqBek+qPgNOLBb3whKC0/vqdLg8IFcG+u3oI7mT5ypWPaPuGVxt0FiqX/FBcBOI=
Received: from TY4PR01CA0088.jpnprd01.prod.outlook.com (2603:1096:405:37d::9)
 by TYCPR01MB9536.jpnprd01.prod.outlook.com (2603:1096:400:193::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 10:50:14 +0000
Received: from TYO1EPF00005022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37d:cafe::93) by TY4PR01CA0088.outlook.office365.com
 (2603:1096:405:37d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 10:50:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005022.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Wed, 2 Sep 2026 10:50:13 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.24])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id D0A663000241;
	Wed,  2 Sep 2026 19:50:10 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert+renesas@glider.be,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH 1/2] clk: renesas: rzv2h: Drop duplicated parent lookup in fixed_mod_status_clk_register()
Date: Wed,  2 Sep 2026 10:49:38 +0000
Message-ID: <20260902104939.25522-2-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902104939.25522-1-ovidiu.panait.rb@renesas.com>
References: <20260902104939.25522-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005022:EE_|TYCPR01MB9536:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 953a2ae9-feb7-4486-1400-08df08dff7c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	3/v4lCwhyJDvDDNAJKNlCLGVKanjbL16p+RmDGu3PFUmTLcoDw8Rjl36BTe6D2Lf44QE/zdQ01+xt7pmU2v/Sf0vBLPICzCKLXdFNhy0Ei2YZHl23/ryroyOnLxKf8ta4D9O0COomWX9caL9avct3KOMrN5Q8fM4ImcAbWhxND4AIQ9G4HxfKpb9HezD+Hbg3Q+NXBdCUnM074dEFJb+8A4W2cb4NblEVdZ3HlEm7XgrooMGVpGK/CAjy2tcWYGxrxyqnahSCoM5WZkYpdwsQdayFn5pFKawIf0lq3sRQJFEfoz3n+Rzf5FPeX8yAW3kOwY6qKb9Hjd8yq162xmnUpDeUMIMlKIUNApxbGutCMy5yPKt73CQz8XsNcV+cXkFikhOkBvfDvZfTg9b123s+yJiq5Qg2R95bI+6K00nzevZnmQBt+1RCdPXvA3nZq+Vlp7qqvgxX4XMHGBOtKK7PurIZa6NHVRkhBuyrXKATy/Im57qKODaz9nXa92AiOenah1Msj9Mea2PG2lQUL9CRMTk6eBxKezUwkXTHzVcna8jZRYSBIBQyUAQU/e3ckwkpUDNJHBLD4/aGwpgp8pywblxCr4nT7XbIla1wsVBPaVbPkCGKckUbrdmG6LTMrr8JPusosSV6n+/bivWIDhMEawNkB5C6714EajsUqjqA4ObSIuH025I4D2JGgyUzIBCTpSwtlzlFBEDzSo82LYMcQ==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EiSgmD+hMPNUuEG/s+f5VFqxcVfwAQS7XhwwiJ308a95aoMsFvLUAMNBwS1m8g4bH7+EU2FBmT9HpvapjswmvBwKwBSpYtz/fBCVoRbOEbyr7b/WfHdh1dZSaCv8zW4gm+os5wrGXvFAqUlkfT+uILxVCMnKQT2yC9UfS2nfpcWHpj85pVXFzduSC8xA5hc+iYQgHV4Dj1Ha/bgJQIX5xv/A4tRtJojvMVEoPyjRvJhS3lmyIH1cAfKC30NHDq8xe+QghcQJGW6em164kK2vaws/gr/xcJZmdNB0k0oX8A2U/SkOUhgDfzBocsF9GUmEVCs2uuE3CpW2sLqTcS6eCOWZBmJ25SOpesgO+f3KQke5kNp+jfG6gEMOjUg3PRgH7MOgYuGxswFoEjrjkcELcQHhWJ1F7KBppncw0GbtBcnkQOOl8l8rhsrJrRJC+mQx
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 10:50:13.7028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 953a2ae9-feb7-4486-1400-08df08dff7c5
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005022.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9536

From: John Madieu <john.madieu.xa@bp.renesas.com>

rzv2h_cpg_fixed_mod_status_clk_register() looks up priv->clks[core->parent]
twice, with an IS_ERR() check after each lookup. The second lookup is a
leftover from an earlier refactor: the value cannot have changed between
the two reads, so the second IS_ERR() check is dead code.

Drop the duplicated lookup and check.

No functional change intended.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 7003d59ac34b..86f6f2f700a6 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -923,9 +923,6 @@ rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
 		return ERR_CAST(parent);
 
 	parent_name = __clk_get_name(parent);
-	parent = priv->clks[core->parent];
-	if (IS_ERR(parent))
-		return ERR_CAST(parent);
 
 	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
 	if (!clk_hw_data)
-- 
2.34.1

