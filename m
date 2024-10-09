Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3846B433B5
	for <linux-clk@vger.kernel.org>; Wed,  9 Oct 2024 06:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728455813; cv=none; b=LTAJ2wrO4lKYWrBX83TuanZbbNZHKV0ra3jPogEwVFb0qRR+ieuzERicOgWAq/f1iZCRWj8n9MzQ5qUo+3Ev2I+m8PbJgcxdcgDVqVrCYMjSJXH7ZG219r6WbXrL0YJS/8sLhVtJXX8i1/VSjCYxrtgIdo8Gax/yvhCCS8HPKtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728455813; c=relaxed/simple;
	bh=VnAyf1t3SWlaAaDHBJmgxAmvm+OOiSLwPEYNcOySnT4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U3hKNLNWY/utJoKaDl/DcGj6pSkJrUQj4xBnYpPzKodmCZur7yfBknj8yw7ehTHjPb9fTRShEzz90Jq+48v3HuMLy/4p+1AB8RxVD10Hvm5+Q4ZT1v7R6wiFKIzWAe7e/ziCw+gDqiVlbJLrOQZAkWj+yMP36O/lxSsJTCM6WDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XNjm100pYzfd68;
	Wed,  9 Oct 2024 14:34:24 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id A585F140132;
	Wed,  9 Oct 2024 14:36:48 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 9 Oct
 2024 14:36:47 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
	<dinguyen@kernel.org>, <linux-clk@vger.kernel.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH 1/4] clk: imx: scu: Fix the return of uninitialized variable
Date: Wed, 9 Oct 2024 14:32:26 +0800
Message-ID: <20241009063229.121258-2-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241009063229.121258-1-zhangzekun11@huawei.com>
References: <20241009063229.121258-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf500003.china.huawei.com (7.202.181.241)

The of_property_read_u32() can fail and leave the variable uninitialized,
which will then be used. Return error if reading the property failed.

Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/clk/imx/clk-scu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index b1dd0c08e091..95798c6fea1c 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -194,7 +194,7 @@ static bool imx_scu_clk_is_valid(u32 rsrc_id)
 int imx_clk_scu_init(struct device_node *np,
 		     const struct imx_clk_scu_rsrc_table *data)
 {
-	u32 clk_cells;
+	u32 clk_cells = 0;
 	int ret, i;
 
 	ret = imx_scu_get_handle(&ccm_ipc_handle);
-- 
2.17.1

