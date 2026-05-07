Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012032.outbound.protection.outlook.com [40.93.195.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231E9346FBC;
	Thu,  7 May 2026 16:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778170187; cv=fail; b=Y3fm6Ephx55KlDqaBCKw3VaOwqIipTZhRgjy2b7zpRMSB3eFYxaMT5WwlgDRCDFcnEf5FWOvgYMvckrDGvkFvpTNgndo+idlrWnejR6YAhHWnDkufBbwXNkN4DSM+54FZaKsnqtGFmofEc33r02FUySMGN+zXGITflsnlrn/4AI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778170187; c=relaxed/simple;
	bh=6JOIIfW104pdvqVy+zneCKDlSzr+mkaY8PUGy9Ghv0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Rn1/vSDKCSBH0PN1H9XnZ8jerkpSKAKof3iKE3ErhcJKkgsuTHorX2jBHCKznH2jfTjZP6+oeBTMzx1gN2P0G9aQgraFkOYKxaQBLIDAduEqnSL095h0Z/BetvxvIFRPHEcDIlUTCuItCpFT+mIVm5uJqgBw7aZTyEnWIers6dU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=So6X3dxg; arc=fail smtp.client-ip=40.93.195.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="So6X3dxg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiDSF6Igoufrz7IOwMUxSypQSxyfzAnVHpYL+HVfxYdx6hRCUjSeyVcUtBKtFGO8S8p3Ta59IqNY6oaGJSPJAD7kMu7cxubYV4+vm2HZHpZQh+BfXVQa95hjTD2vFGvqNKcmcknI+KwInf1t7Ge+hfcEsGg0U8Ln5B6cHgO3wOoZAQ8toV+YpxNhHuVFkKSYct5FeVPxldqe6fFlzk6ox2C10n0Euwetl719qkil98KKG8MwcJJYrJVVaoNmrMhdbD5yWk9rPSr8QdrfRE74vu1WqIZypzsSb6Fw3UWwK6Nre2WGIFixpLu3/+gBSkEf/XqMZSi3pPlXhMQLecuf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLZVzB5gguW5ckbJFT4MWRxu9RwecJodm2oeC+LPCy4=;
 b=tZhUebFspPfKSv5KkUfHpny2mCioGxAKeEGJhSKV7aLmQJCPR/wDNyzs2xM/NL6BWRu+gbrVerNucP1XNeZka4EZk+DwAgj2aqBf3ARF4NdjyKD/Vc/IboAA1susZKvAhjXxoNa2gUV0skRIS3Yw+YCZT4SRAHys64ZFdpsLTEZj2oOlY0Kmt+CcYm4/c/C91CVZpxIA7HeUkuvoA5B+h5CcwF0y1xPKv3/WrzSjrYhD3kvDpYi/gFVcxaIyjoc3xWEeWHlD0g0zLWJsIR9Lj0aoS59+xEWdnaf6t9ILwaGDmVIPBiGU8mF3FTHQyAN+qTB3U/KvhqCAOBVjvyz6Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLZVzB5gguW5ckbJFT4MWRxu9RwecJodm2oeC+LPCy4=;
 b=So6X3dxgNTz/uDN68flgqrMe3MUFZvelRsYkrCMSl7Gzs3ng/MCYSf0dm+WWeH4CHfjfRwGYGPuNWKoFHcqieTDzA6dCpihKxucctNzjFVXB9mpY4znUcskEpY73e3mipjYatNpEy37/lVc00Y4+KfbZ6ANf8ZO/LPCEiJI7Pe8=
Received: from BY5PR20CA0001.namprd20.prod.outlook.com (2603:10b6:a03:1f4::14)
 by SA1PR10MB5782.namprd10.prod.outlook.com (2603:10b6:806:23f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 16:09:40 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::66) by BY5PR20CA0001.outlook.office365.com
 (2603:10b6:a03:1f4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 16:09:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 16:09:39 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 11:09:38 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 11:09:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 7 May 2026 11:09:38 -0500
Received: from [127.0.1.1] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 647G9cRb3985466;
	Thu, 7 May 2026 11:09:38 -0500
From: <a-christidis@ti.com>
Date: Thu, 7 May 2026 11:09:34 -0500
Subject: [PATCH v2] clk: keystone: don't cache clock rate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
X-B4-Tracking: v=1; b=H4sIAD25/GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDUwNz3eScbN3i5ExdQ3PTNGNLi9TklGQDJaDqgqLUtMwKsEnRsbW1AGL
 P1GxZAAAA
X-Change-ID: 20260507-clk-sci-175f398ecdc0
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Michael Walle <mwalle@kernel.org>, Kevin Hilman
	<khilman@baylibre.com>, Randolph Sapp <rs@ti.com>, Antonios Christidis
	<a-christidis@ti.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778170178; l=2038;
 i=a-christidis@ti.com; s=20260224; h=from:subject:message-id;
 bh=nzZb5KX8QE7F8wiJTbfv2Zd+erQgyqYICWcP56uq61k=;
 b=GwDDsHAvoeIkISSuSV1nBCF5AT6G9bTi9bR9xaItKrHnLZ5ILWRDbRfAEDVbxTH0iwT89YyuN
 sffdFRcW1RqCKI2g+aeEfMPqre4hOcg3p0ZGzjnRL9unEGZYwqfpkdr
X-Developer-Key: i=a-christidis@ti.com; a=ed25519;
 pk=HcbNQnPnde8WLoob9CZpry+ZyXrXg5+wessZiBGMaFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|SA1PR10MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 947c0e9e-a475-40c6-3f05-08deac530ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sYcQqg6wozXSQ7CHOGS9luwvA99TUAiZxyayN0Yq0/P0wJWkXQizEMMlfasuJkW0VZEdrGVAXYHkGL22I8v3A00CbnXlTtmbL6Q1czBlU7mCGvcB21LKNr4FWwAfI3RsbG2+z7KXFZqhvRGcJvzDvAclLxKacM4QynzvatbzNLQo1wUazajbJyUD9z2L9yKBtnVyY/QM0Va0o6ohNX/Hh7C02aAsQ2WdNXso/0WU0VdG7SZJNxn0zLwIa1YHYB1V8GWI5WYoGQDIIFFezkYTcG/tuf5gNtrYc00Kom3fKanhUgjtWb5sONuc8Ql/9Dh41kZCbp2E0TkBv8dfW0Ox4EsXbSZkJ4UwNLDciKf9HKgoMtUaTUMSqYAjrw3Q9+T3fv+WSURWfONuVrDmIiR256fmGWmxGrdf58hgJXkSoss6qKq3rYKmX2v7U8XMFEXhnB5mu1+UzyTcKsW8YRaaWATJdSFr6GuH8KoAhT44D8j+dBIaecp9ikV+U3aed5in/GpzHoHLGa96oUGbegGmApL9VlkeAMfmQws3BPRQwzplOQkk6RucHt8avl/jInLggw1eTZBG0ONDknWBuc+1sfUORT3j3YNEVEFD7voOib9+uzOTou0JxdgsHQGCVYP5St1hlSFEixlWFdfKcWbOb/F94UcKT7I3p9C+sL42SIauUr+0mkp6Kh4l0cSJuxKksHg0of4LylcUciaVabSMQGRHx8lorBOLctimJfIqaq8=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/aA2bZB7DA4NGc87mqGm9V3lIh+lmZh9+G0VFhVl3+LjnnUEAz9qWEpP1pAaJ/2wUErH3fvGTkyQ6w2ovrmVfNW63eYnmt+OyVQwzu/XMXpOxyzZWISUqgytE2HfKRb2F+uaiC7WoEe2tPmPnHYh8GferTQ76y3XwJFwFUg6jtuOt5uO9Cj06y+7jxfnUXNMeUAZo5LlhL3xwsEgjYDaYIL8ca+nucGEGRlFEQYU+mxAfjiQiPMfwNFzvN1NTRdA3teFGleI/Lf0/64I2uOELm+yXyIwWQJxfC8ipwUdj5Ivp8bwwMy5buVgeKTl5xxPRRW0hM/vTL+sq1/hZ9JYFjbK+ZKC3e/uLoRQGgr/wjKh9v7SjmuRM/LVeuhBLqmZfJYdGIu13G6mq6mZqxrpLzT6DRfMBqRjikSw+5ktpZQzJMn3+SANZ3s9ZJnk4+cP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 16:09:39.3903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 947c0e9e-a475-40c6-3f05-08deac530ab7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5782

From: Michael Walle <mwalle@kernel.org>

The TISCI firmware will return 0 if the clock or consumer is not
enabled although there is a stored value in the firmware. IOW a call to
set rate will work but at get rate will always return 0 if the clock is
disabled.
The clk framework will try to cache the clock rate when it's requested
by a consumer. If the clock or consumer is not enabled at that point,
the cached value is 0, which is wrong. Thus, disable the cache
altogether.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Randolph Sapp <rs@ti.com>
Reviewed-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v2:
- Resent as part of series [1], separated from series per reviewer feedback [2]
- Original patch was sent here [3]
    
[1]: https://lore.kernel.org/all/20260224-gpu_dts-v1-5-cc5ddffe140c@ti.com/
[2]: https://lore.kernel.org/all/20260225010507.flvt775fs5kfe7ez@unknotted/
[3]: https://lore.kernel.org/all/20260109120728.2wku6akxof2ddn4h@tastiness/
---
 drivers/clk/keystone/sci-clk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 9d5071223f4c..0a1565fdbb3b 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -333,6 +333,14 @@ static int _sci_clk_build(struct sci_clk_provider *provider,
 
 	init.ops = &sci_clk_ops;
 	init.num_parents = sci_clk->num_parents;
+
+	/*
+	 * A clock rate query to the SCI firmware will return 0 if either the
+	 * clock itself is disabled or the attached device/consumer is disabled.
+	 * This makes it inherently unsuitable for the caching of the clk
+	 * framework.
+	 */
+	init.flags = CLK_GET_RATE_NOCACHE;
 	sci_clk->hw.init = &init;
 
 	ret = devm_clk_hw_register(provider->dev, &sci_clk->hw);

---
base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
change-id: 20260507-clk-sci-175f398ecdc0

Best regards,
-- 
Antonios Christidis <a-christidis@ti.com>

