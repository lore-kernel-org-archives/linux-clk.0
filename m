Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83E916A92D
	for <linux-clk@vger.kernel.org>; Thu, 24 Oct 2024 03:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729741160; cv=none; b=YH8+ALH3xxAzkNhHJLpd1nRpfFkepYElYXlybu6xxTx5esHfzzXCpXyohti9B5SLJ8M5W5NexNOZBsp68zZ/rNxtG7MClDVZ1sNBuaPS97XIauKBR6pS4Ji9tVRU2ZcBprYm1vayGKMJpnVukpORXl8BC7eVDSF0igOAvIfloS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729741160; c=relaxed/simple;
	bh=Hc6DILxPQqL3l9UGsJ6qJ7xZnzZVgV80MBG0G0HvsjU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TEOQMs6qNmimEDHhy25avKv8A/R9/QNAuy5o4FPMKf1fMw9T1LKB8WB3JnEGZlYHHYDVYzwP7w4kY1QTY0V/Az6w3+K3kVYqfp0yFlc6SZY9APaldK6/iLC5+AMn+Yp57bTQBzXku669YHxpCkmbe0aeDkvqiSC4qYJJiBuI1iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4XYs7x3q0czQs4B;
	Thu, 24 Oct 2024 11:38:21 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 425CE1800A7;
	Thu, 24 Oct 2024 11:39:14 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 24 Oct
 2024 11:39:13 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
	<kernel@pengutronix.de>, <festevam@gmail.com>, <dinguyen@kernel.org>,
	<s.trumtrar@pengutronix.de>, <linux-clk@vger.kernel.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [RESEND PATCH 2/4] clk: socfpga: Fix the use of uninitialized variable
Date: Thu, 24 Oct 2024 11:34:22 +0800
Message-ID: <20241024033424.115417-3-zhangzekun11@huawei.com>
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
 drivers/clk/socfpga/clk-periph.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-periph.c b/drivers/clk/socfpga/clk-periph.c
index 6a4075147b9c..ec4234d9daa1 100644
--- a/drivers/clk/socfpga/clk-periph.c
+++ b/drivers/clk/socfpga/clk-periph.c
@@ -60,7 +60,8 @@ static void __init __socfpga_periph_init(struct device_node *node,
 	u32 fixed_div;
 	u32 div_reg[3];
 
-	of_property_read_u32(node, "reg", &reg);
+	if (of_property_read_u32(node, "reg", &reg))
+		return;
 
 	periph_clk = kzalloc(sizeof(*periph_clk), GFP_KERNEL);
 	if (WARN_ON(!periph_clk))
-- 
2.17.1

