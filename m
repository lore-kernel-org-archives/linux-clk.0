Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7577616A397
	for <linux-clk@vger.kernel.org>; Thu, 24 Oct 2024 03:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729741162; cv=none; b=mjTz/zU5WipEQQy9zDlu2a0xvkCA8vAmJUWQYSIxnXi53FY+HL3ao5QIC0RHVORu+zAMv+oLaG5LEXFN9KQWZcPJtWCWgf8ns06boUqSDjrRrpP4bZrwIgmMNuysqpvTfiWfe1FDMLWdMpxwMI7kGv/u0kxGh7WBfWUra1X6Zts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729741162; c=relaxed/simple;
	bh=8fd4Mcz9d/Dg4W389ZyHJuBMUL0wE2AvyQGU3KncKZU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=opG/6XUpjWplMNzo3qIKoQ+xnVH6a9SUiFmzY+qb8aJyxCkIjiiVxN+mON8hXVFItuWG5qDrMISifh4VYosATkSdy0kjha2bH9dBs87jQZCFOoBb89lll7OTvHEvWGcfKCE6xNQRJgsJoiwqDYzxIHHdz64yYfK6EtrHX1XtmbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XYs6l2kZmzpXQ7;
	Thu, 24 Oct 2024 11:37:19 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 3686E1401E9;
	Thu, 24 Oct 2024 11:39:16 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 24 Oct
 2024 11:39:15 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
	<kernel@pengutronix.de>, <festevam@gmail.com>, <dinguyen@kernel.org>,
	<s.trumtrar@pengutronix.de>, <linux-clk@vger.kernel.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [RESEND PATCH 4/4] clk: socfpga: clk-pll: Fix the use of uninitialized variable
Date: Thu, 24 Oct 2024 11:34:24 +0800
Message-ID: <20241024033424.115417-5-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241024033424.115417-1-zhangzekun11@huawei.com>
References: <20241024033424.115417-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500003.china.huawei.com (7.202.181.241)

The of_property_read_u32() can fail and leave the variable uninitialized,
which will then be used. Return before using the uninitialized variable.

Fixes: 97259e99bdc9 ("clk: socfpga: split clk code")
Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/clk/socfpga/clk-pll.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-pll.c b/drivers/clk/socfpga/clk-pll.c
index 9dcc1b2d2cc0..9c3ce45cb907 100644
--- a/drivers/clk/socfpga/clk-pll.c
+++ b/drivers/clk/socfpga/clk-pll.c
@@ -82,7 +82,8 @@ static void __init __socfpga_pll_init(struct device_node *node,
 	struct device_node *clkmgr_np;
 	int rc;
 
-	of_property_read_u32(node, "reg", &reg);
+	if (of_property_read_u32(node, "reg", &reg))
+		return;
 
 	pll_clk = kzalloc(sizeof(*pll_clk), GFP_KERNEL);
 	if (WARN_ON(!pll_clk))
-- 
2.17.1

