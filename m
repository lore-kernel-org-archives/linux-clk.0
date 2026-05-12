Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6982A340A6F;
	Tue, 12 May 2026 11:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778583648; cv=fail; b=iu8szEv10FGT/TutT+crS28Wb3hZVK9VPhIfCAyI5okYEFbUDaeXfR2TveedGVgBtsII4UKFz6LpWd1YS4Bvi/4H1nPj3IgS4RcVeorQ3+P4L3u4nCksUpRURs7Ea+QElOdiQAVMxuPSAHoIp5eEjB6psy5r7FSCJqPJ1UFS7Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778583648; c=relaxed/simple;
	bh=7ZIBjhKgTGh3HT4krEopCQ6Trk2rOGk+7ScYTYbg2RU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ie5aOLML01XIKK0DaAxc98fhedG8vWj1BW95ntrrKmquqG5p4CdK9xGacKZyvmnarNA908qNa3C5SoO3HO78XgcyNJ+SuCNnFoU/Kfer9VD/HMrSS1+MlivW44wA+SMddXJz3QA+0rHKqp0qovoH1r5RG4hRpLCKfRxEAeMaqXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Pv5KV5/M; arc=fail smtp.client-ip=52.101.85.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Pv5KV5/M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSyuSmttbDKvdUnx3MQXmjw2tHNAxH2VLa65lECE58QxjBEpfaVJGD4BL/1Cw6PNy4WOukhm0vGRJCi3d8j8BdiqF/Wg4ysRIipZzXxCZlei1zmiTc+3gWfTg+nGIdrZTDC/xV8DGSDqDH7Ov39yalzKhE7x8FJul+RHPF0HQ2jk9Dap24xlo/3hR37CNWLYjKyBmj3oSk2RmJkA/fJ/d/a7vOjFD2/85kEandkvlZ3OOMHQIwSBHegHA9CAlZ4IW6CZ6Mb6+rydOC0VUB32tojZlNP+/lcdKmYMOblAGVOXIO9W13WFSlqgBHsisBORb/1njTCqxwMqAgwPVOsfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luMdKvIMMuMMIqOb9WfA055mU4AAtA659xE8LllknIg=;
 b=gSyyTSDc32H8IdF6bqZQLortYOiTrpjWCdgK59LmcO5q55fbWVpTtmc4PwDMjXBukTj43x7D4KkCsoAi/7phDHdHyj7wY1PMYR+bduRF/c3U8reX0EPVodyuoI9lLZ51njhUSvMnJJQNc8tauNiriAJ1n7wJm8st6O+gryLb2nBaxgkDgsgd7etWhZu4BdoLba/eCWUTxXwpepcBg/kmRBe4r4VZCd1s5vS45KPla8jz2Pa6gaB4k+yCXv7IpTfb+cXdCHMJftEKfwNOkkpEJgk1Gjo2eYBnFNT0sC8dcGpILdKBoZljEHO3IbAoxn/iC9YCgzpw5j1QiHxaverMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luMdKvIMMuMMIqOb9WfA055mU4AAtA659xE8LllknIg=;
 b=Pv5KV5/MVxSTr4sojsjlLeQoi/uxQLwG7bYbP8vFYAOo8Uf2WHPWkWxuHnLNFHbzthXrMi9Xh+l5RLTa88nYbIOFVUMYfIwVhR7/SiKFc8VKc3tEW9kf822DQ5ju4Obe858fk2DrMOm+AY5/8BaCMxMpNM0lnJM08Db1MUE/sSw=
Received: from CH0P221CA0019.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::8)
 by SA2PR10MB4476.namprd10.prod.outlook.com (2603:10b6:806:f9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 11:00:43 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:11c:cafe::8a) by CH0P221CA0019.outlook.office365.com
 (2603:10b6:610:11c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Tue, 12
 May 2026 11:00:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 11:00:39 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 06:00:38 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 06:00:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 06:00:38 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CB0c3H1646990;
	Tue, 12 May 2026 06:00:38 -0500
From: Nishanth Menon <nm@ti.com>
To: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
CC: Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Nishanth Menon <nm@ti.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<afd@ti.com>, <sozdayvek@gmail.com>, Jing Yangyang
	<jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>, kernel test robot
	<lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>, David Yang
	<davidcomponentone@gmail.com>
Subject: [PATCH V2] clk: keystone: sci-clk: fix application of sizeof to pointer
Date: Tue, 12 May 2026 06:00:28 -0500
Message-ID: <20260512110028.2999471-1-nm@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|SA2PR10MB4476:EE_
X-MS-Office365-Filtering-Correlation-Id: 67282267-2b95-426a-2a19-08deb015b47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uv0Sd2ZMn9OrymDfCq42x9zbepUiJCjEBH9UqTcUZ6B83f2SCO140GVf0p7L9152eEoOQ0g9cCiH21xWaA0bq3kXi+pVqI7qelo3TZUb7bXabI3LaQ2mP6IneDeLFHUNyS2+HW6EYdyLYKgJ+tv1prKlboT8jr97VgNx0LyHJAEcPktV8t+756YSBEZDOMM6+yXPqSFyx8/EbAkLag3rTPs4RfFIp+vWXB/hwdosqoqYEoB/p29hMNPllZirxZCW3ZwKMlnlU9ich5CxOc0zWQ998pGXa8LvGBTWSOlo99CkhUfOhbXmwJ9JinJ1nQfZxf/traOCMcu+khZUGZkmY0dWHm1txY6J6bqpf9Wzbm12gTKB8ZJ6Rii5vvZxRr73y9wTH9ebaGS8XKwGok/Tt3AHg+liMPQbqO0jlTn8BgvZGKqhFNi+JNLQEROLIRIccBCxVnrym/uAuTEwIGw8/WiZIcyol+0nNaEldls0ZKw/dsR4xuec8AfBX0GQrMq85iMNRCDYQESiiFUjqpL7PCHb++/KVHGXOJwflaozKSw/LktN8a2hzOl4hwhJ9nTZL6DRqUqNjxFqbnLj4G4N0n/UBW5acpcJB1devWqEuctYy8Z8Ztj00p6gY6NNsKPsvlVQkQNNzF8SCRoBxmpULjqNRmrUc/ycccPz8Syl0Vz6gfHPdC9FKVQ5fsWcQxrx
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	icKSQ9GQEb6pgjByz+2e0AJ/wgZThUpIPCth24+BEG1I48VlP+PNsVsjvSAK7iiKLkosI9gHc24DWP+rN05IreCXNmRfIirTbN91AzANtOTeM2gsuBYTCRaQ79tQI2tVPQs+1Q0Ard3pv4sFh3mrUmNfg+epPXi/PYvZrKliH8X0tg0wQonSkHtB1qv+ULGnV1bRNP3Cv6Uk82kL3jJetDnLlSY5KB98Wg3L5BbApHmXKJMUSJuFGrfGfInyHc17snRg/xG4lWRsZ02nRW0RZ8MpCQmM4NLSw+HfwoD+JScpIe0ASCWpKx6v2XQyPBnjY98m9TuHi1QWrP4nQuHFdQ9+5/Fe8cto6I9janKOrAbuMxk3wGeV3yDRJrBSTySIzPVwqANtEawFIjWjb5ySUcaxglEwKKOsrkFOhNDKajmQ3LSUsQ9Bq0+GtkkLZH47
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 11:00:39.9194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67282267-2b95-426a-2a19-08deb015b47b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4476

From: Jing Yangyang <jing.yangyang@zte.com.cn>

Coccinelle (scripts/coccinelle/misc/noderef.cocci) reports:

  drivers/clk/keystone/sci-clk.c:391:8-14: ERROR: application of
  sizeof to pointer

In sci_clk_get(), 'clk' is declared as 'struct sci_clk **', so
sizeof(clk) is sizeof(struct sci_clk **) which is the size of a
pointer rather than the size of an array element. provider->clocks
is an array of 'struct sci_clk *', so the canonical size argument
to bsearch() is sizeof(*clk) (i.e. sizeof(struct sci_clk *)).

The two values are equal on every supported architecture, so this
is correctness/idiom, not a runtime fix, but the new form matches
the rest of the bsearch() callers in the tree and silences the
Coccinelle warning the script flagged.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Closes: https://lore.kernel.org/all/84a6ba16686347099a3dab2e5161a930e792eb6e.1629198281.git.jing.yangyang@zte.com.cn/
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/all/202512040525.zrHSDl5h-lkp@intel.com/
Link: https://lore.kernel.org/linux-clk/20211012021931.176727-1-davidcomponentone@gmail.com/
Reviewed-by: Stepan Ionichev <sozdayvek@gmail.com>
Reviewed-by: Andrew Davis <afd@ti.com>
Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
Signed-off-by: David Yang <davidcomponentone@gmail.com>
[nm@ti.com: Improved commit message]
Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes in V2:
 - Picked up Stepan's suggestion on commit message
 - Picked up Andrew and Stepan's reviewed-by
V1: https://lore.kernel.org/all/20260508152321.3683799-1-nm@ti.com/

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
2.32.0

