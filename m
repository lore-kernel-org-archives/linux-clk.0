Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013058.outbound.protection.outlook.com [40.107.201.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE2F3F54B3;
	Fri,  8 May 2026 15:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778253809; cv=fail; b=S2JkV78wkDy2dYfwvxruKt+KDRp1GEOHUJwWsXgFgrhgSCl3KNI+zUxv4tpnnMOA6BiAt6sKH3Wus7ggbBdjw5K/6+tMgI5sxkQk2jRSQFeKDiANyH+7tG6PsHK3ps6RKAyEzVCc6YIMs7L9gp11mmS6ds6pA5Mo4VFQuoor6Mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778253809; c=relaxed/simple;
	bh=2MYMK062p80CG6jKuIoetvKFx+neVzvVhK+vaXcGhII=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DXb41Y5CJTgcPQBmfYpvssX0TT5B6YwLENPYpMTO2gHn7wD6wENAh4Dku2r/DKw5LuM/RKQtpMziehaJocn9emSuxvGtLYFzK9wQjDekK2xBq6cW/ONftrSGsXZvG8QeBkhKq5UjtU9n1JuLz1GlnwaNEa0pPUvlnOv9L8EXn4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FWxPBuEx; arc=fail smtp.client-ip=40.107.201.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FWxPBuEx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eiEbd3r6twoQxDfScDbFFTA6RWZZu/Cd8ZwmYx8rDfC/OTu0zrRNsJ14MwNwF3/lzKqTanBL6vYdnNTDusxkY9MLyUngDEkL+B6A/TrMhihO4dbyYypy1rwbrb7DhbTGg1PsM0nIeOieOTTX33bfELtw8psiCpqC1SDNkQxWLrei0W/zrCoS5a/4fR+jBqv2hVAGgb2l6Z73fJFTUKuzTD/Z797c4Anqo702cLx5txiK5Dp73ALajXe8T2q76AfeJcVr2SkEvvMaVLhp51tdNI96a6eKMGkTw6kP2qRf4UJaaD2t0HqcETMNVf6StFrZAEYSJZ9bzFKlWFz2roT05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIWBYJzqVt/By7HVVzCOz+N2LhCquAVMLebsrFB0lag=;
 b=IXDl6ILHtFIitPtZ7dZm8l+fOAWOGVyq60EOhx/PhY0UcFXs2bfhnOscSczO0P2YhiY4tp7GgRKjJEDRcqIt0Ol5qmyNgNt+utciTnIe3Nxg5FT4xqK6RfhPNWOSw6ifFsucS55uqo1OVstoggVQv/mDh/8fWFF57prCgKenlGktokZXWL64Y+T3oTNDy8MvlShxB7AQqFg4FMACNOkh/LrMR1x8KsDsMUVUqcGfrcOyNQse+JKyWZ4XeR8QUDD71AiZs25fop6/R462l+9ChTTLYQY/dwhMgvoABtZyI4S60JkvrFzUBUBhYqztkgl6PrWMLtcy2MDIUYMcULkVzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=208suo.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIWBYJzqVt/By7HVVzCOz+N2LhCquAVMLebsrFB0lag=;
 b=FWxPBuExbQ/4wIb5+34yJWrTcZ/JbttSea1MlM3/fdU22QWIv9UAk7CYWjHhGhZDosiWN7BIYwLQmKeFIhNOfoLcA1Snb+3iFwG20xQhvxkKEQI6DHm6NE7csSpkRvreI+nsgesNGrgXfvgcZMcEhyieprcmrs46HWp0gxw8k3o=
Received: from CH2PR12CA0012.namprd12.prod.outlook.com (2603:10b6:610:57::22)
 by CH2PR10MB4198.namprd10.prod.outlook.com (2603:10b6:610:ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 15:23:24 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::3a) by CH2PR12CA0012.outlook.office365.com
 (2603:10b6:610:57::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Fri,
 8 May 2026 15:23:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 15:23:23 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:23:22 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:23:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:23:22 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FNMB41942919;
	Fri, 8 May 2026 10:23:22 -0500
From: Nishanth Menon <nm@ti.com>
To: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Santosh Shilimkar
	<ssantosh@kernel.org>, Tero Kristo <kristo@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Jing Yangyang
	<jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>, kernel test robot
	<lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>, David Yang
	<davidcomponentone@gmail.com>, Jing Yangyang <cgel.zte@gmail.com>, Ran Sun
	<sunran001@208suo.com>
Subject: [PATCH] clk: keystone: sci-clk: fix application of sizeof to pointer
Date: Fri, 8 May 2026 10:23:21 -0500
Message-ID: <20260508152321.3683799-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|CH2PR10MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: d6384777-1c29-4172-1c76-08dead15be79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	04kw1yXsLEjlVFnIp9lh1SNklk2iYA+I6Cx9AHe5GCtBIev3EMIFZul/9lzG0Pq7zGIMIbEJb89EkObPlGf+2E1QJy7aaViAED0LvtGgaWPgaseJ+8g5sKhBNRwzUlVt5Ps8tI4F0ibbbgyi5eRWnPMF6Ae8OW0HKw1x7Xo0RfjyeorIGCV8wWhWOiMlwamoo3QI8gzBS+MIFCa03a32Iu4tXjohhKn4sBX3tC28xfXqt857svy/RWuWET0J5RP+4m6mqL7gXrWm3LgIb0BStLDbyhgB+8JHX/5zvU+Eh4fimovK8qR8DT9kHPlxtKvBLVlvqJ92j8jKR/x0ThZeHYc44l0lfUwC/YuS0eDgPh+WsKYCUhk30mCJsVEHPZXEdLLjIdFoEsG/+7k5GLjsgG6aBeTgHfu/mE1RIDpvnZyWgY/IAuYriSAeKWRvfxNjBjCNegSCVQj24iPnB0b8LezASBZG4PN4ShcTmeLoaQ2fSbpfVqyM9HLLCVjPu3W9Y2l1r+fUXnn3H24axRHfx8CU1ex6cyjOCKHch6L02+Fln4VhEn5l5t3pdVDbBgh497JJlkOH8p0u69b8IWmS3oCecI/nUgQCay+yGKxIaxTbAL7100bZyUYW7MQim6RUvItuuole7cAA8Lv66wKV0CteF/wlODodBoW1NQeEqLIjnjGFCaH8vXR5J9Yo9Riu
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EtLHLtX/NObJ+k/ulPdqdIz4K+fQlED7pfADh620eVF6awt4HUsqMbgutOQv5JluS+8OiDeLVucyrD9sO2/+/qRCeRBP3qPXheogMft8v6kLZwpIKlqlgRg+vRr92CwaYbHYXKvyzecMYzHESTnRw0SkJkwlrcgi4t5EF5mMxB5KMD61WJXWVi0ZXTCh2ze9OozEX4I9aET3NJv28yA6uGsUItBrPrEMNCrc3ROPeWW6wBE19a+yPiJTEYc6m5z/PBpNA2AbrCL8EEX8qkbU0SBO2Scxjqw39TC2j9D4GcJIgabcbGDPAQo7juYqFu46BRVWbAXYnbRTB9XBTMWS4J9sjCLCuRZ/Bg0ursD56z9SF0Y9z3MQRFcGfVI02WdFzksj8NWpT1PWzQajiHRjbg8hli3VQmLYuN5fhYt9ATnmE2XBDnZfQgeHcS+j1uSQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:23:23.3661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6384777-1c29-4172-1c76-08dead15be79
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4198

From: Jing Yangyang <jing.yangyang@zte.com.cn>

Coccinelle (scripts/coccinelle/misc/noderef.cocci) reports:

  drivers/clk/keystone/sci-clk.c:391:8-14: ERROR: application of
  sizeof to pointer

provider->clocks is an array of struct sci_clk *, so bsearch()
expects the size of each element (struct sci_clk *). However,
sizeof(clk) evaluates to the size of a pointer-to-pointer.

Use sizeof(*clk) to pass the correct element size.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Closes: https://lore.kernel.org/all/84a6ba16686347099a3dab2e5161a930e792eb6e.1629198281.git.jing.yangyang@zte.com.cn/
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/all/202512040525.zrHSDl5h-lkp@intel.com/
Link: https://lore.kernel.org/linux-clk/20211012021931.176727-1-davidcomponentone@gmail.com/
Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
Signed-off-by: David Yang <davidcomponentone@gmail.com>
[nm@ti.com: Improved commit message]
Signed-off-by: Nishanth Menon <nm@ti.com>
---
Cc: Jing Yangyang <cgel.zte@gmail.com>
Cc: Ran Sun <sunran001@208suo.com>

 - Functionality: No impact (on Linux architectures), thus no Fixes/Stable tag.
 - History: This patch has long-standing history; I have attributed it to the
  earliest valid author found during a recent scrub.
 - Reports: Retained chronological attribution even where public reports (Zeal
  Robot) are unavailable.
 - Checkpatch: Acknowledging minor warning regarding tag ordering (Reported-by
  / Closes sequence); chosen to maintain link integrity for automated tools.
 - Testing: Verified on available K3 SoCs against 2026-05-07:
  https://gist.github.com/nmenon/afa9ac915e189334f048c177f16fe54f

 drivers/clk/keystone/sci-clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 9d5071223f4c..2fc1f050779b 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -388,7 +388,7 @@ static struct clk_hw *sci_clk_get(struct of_phandle_args *clkspec, void *data)
 	key.clk_id = clkspec->args[1];
 
 	clk = bsearch(&key, provider->clocks, provider->num_clocks,
-		      sizeof(clk), _cmp_sci_clk);
+		      sizeof(*clk), _cmp_sci_clk);
 
 	if (!clk)
 		return ERR_PTR(-ENODEV);
-- 
2.47.0

