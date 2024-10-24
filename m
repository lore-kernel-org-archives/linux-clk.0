Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADDE16A397
	for <linux-clk@vger.kernel.org>; Thu, 24 Oct 2024 03:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729741160; cv=none; b=qNtFS1c1juEuq/NY2zPxBg+/Z8AnJyf1OBS6NMgs7NbRk8Q5i6mC/WbbcYZIUitCSsl42uX2r7D9oS1Fb8YHbcbNd6Vu+FV2btK+mdN1Oss9Gp+tMDnhwHgKCJyDfnyMMilzIp8tpFQZX2/yWEXfsbv8KnTswI4nVIZ47RR3avk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729741160; c=relaxed/simple;
	bh=PPIsEL5LF9mJFzMsAGTKPsIaw0O33KO5VwU5DgaVocU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XOroiiRiqmh2nZKYJSzBZVmPA7nDwmgW4xtba4yQ9YBxKCeUABeussgIH7qFPezBG1l9tbXOAqrjM/Rzh6Xw2bir8BKayppXNYra4EOSf8MFn04QbzoPhmRPZwR4d5G0R0ru7S2x6FJ2zClRqhNsSTA6SQoDW+CrkbPI6EamR1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XYs3x3rS3z1HLP2;
	Thu, 24 Oct 2024 11:34:53 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C3691A016C;
	Thu, 24 Oct 2024 11:39:15 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 24 Oct
 2024 11:39:14 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
	<kernel@pengutronix.de>, <festevam@gmail.com>, <dinguyen@kernel.org>,
	<s.trumtrar@pengutronix.de>, <linux-clk@vger.kernel.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [RESEND PATCH 3/4] clk: socfpga: arria10: Fix the use of uninitialized variable
Date: Thu, 24 Oct 2024 11:34:23 +0800
Message-ID: <20241024033424.115417-4-zhangzekun11@huawei.com>
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

Fixes: 5343325ff3dd ("clk: socfpga: add a clock driver for the Arria 10 platform")
Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/clk/socfpga/clk-pll-a10.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-pll-a10.c b/drivers/clk/socfpga/clk-pll-a10.c
index b028f25c658a..c01451400faa 100644
--- a/drivers/clk/socfpga/clk-pll-a10.c
+++ b/drivers/clk/socfpga/clk-pll-a10.c
@@ -76,7 +76,8 @@ static void __init __socfpga_pll_init(struct device_node *node,
 	int rc;
 	int i = 0;
 
-	of_property_read_u32(node, "reg", &reg);
+	if (of_property_read_u32(node, "reg", &reg))
+		return;
 
 	pll_clk = kzalloc(sizeof(*pll_clk), GFP_KERNEL);
 	if (WARN_ON(!pll_clk))
-- 
2.17.1

