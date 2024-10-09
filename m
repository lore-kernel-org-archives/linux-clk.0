Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A8A156960
	for <linux-clk@vger.kernel.org>; Wed,  9 Oct 2024 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728455815; cv=none; b=m59cp5NmE/7+bH/37SraJj1Q1o4bom+zQ6SAnase6w41SzpDGGH/8/7mKNmCcTLdvSsm5TvpFWwW52Iixl70I7LxwEhLWPVaTVDW7pkpqXRVJGPmupsvrudJbmetJh1Mxh+QtNZKt2qaq/SAGWd4Gu3h02zc5QVs+ixSl9AD1uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728455815; c=relaxed/simple;
	bh=PPIsEL5LF9mJFzMsAGTKPsIaw0O33KO5VwU5DgaVocU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GdS8WaCq1HCyDofi8Q/619Xcz9LLZe8sC3GqVwVdBNKa41Vo0TBoGzyn3EXFfQ+mExWQUzlr8F85S9BLh5HvkFfyN7yJn4VlsoLo4oNoqBSo91MHImiGo3LztDw5kUoAd0jn/P4Ur8UpK8LoOB04cZcEpyHR5hkox6qAE9IKoA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XNjm24nkbzfcjq;
	Wed,  9 Oct 2024 14:34:26 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 53F8114035F;
	Wed,  9 Oct 2024 14:36:50 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 9 Oct
 2024 14:36:49 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
	<dinguyen@kernel.org>, <linux-clk@vger.kernel.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH 3/4] clk: socfpga: arria10: Fix the use of uninitialized variable
Date: Wed, 9 Oct 2024 14:32:28 +0800
Message-ID: <20241009063229.121258-4-zhangzekun11@huawei.com>
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

