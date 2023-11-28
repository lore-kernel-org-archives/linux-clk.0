Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BDF110D7
	for <linux-clk@vger.kernel.org>; Tue, 28 Nov 2023 05:26:13 -0800 (PST)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Sfjr70QzwzWhqQ;
	Tue, 28 Nov 2023 21:25:27 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 28 Nov 2023 21:26:09 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 28 Nov
 2023 21:26:09 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-clk@vger.kernel.org>
CC: <qinjian@cqplus1.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<yangyingliang@huawei.com>
Subject: [PATCH] clk: sp7021: fix return value check in sp7021_clk_probe()
Date: Tue, 28 Nov 2023 21:30:16 +0800
Message-ID: <20231128133016.2494699-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected

devm_platform_ioremap_resource() never returns NULL pointer,
it will return ERR_PTR() when it fails, so replace the check
with IS_ERR().

Fixes: d54c1fd4a51e ("clk: Add Sunplus SP7021 clock driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/clk/clk-sp7021.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
index 01d3c4c7b0b2..7cb7d501d7a6 100644
--- a/drivers/clk/clk-sp7021.c
+++ b/drivers/clk/clk-sp7021.c
@@ -604,14 +604,14 @@ static int sp7021_clk_probe(struct platform_device *pdev)
 	int i;
 
 	clk_base = devm_platform_ioremap_resource(pdev, 0);
-	if (!clk_base)
-		return -ENXIO;
+	if (IS_ERR(clk_base))
+		return PTR_ERR(clk_base);
 	pll_base = devm_platform_ioremap_resource(pdev, 1);
-	if (!pll_base)
-		return -ENXIO;
+	if (IS_ERR(pll_base))
+		return PTR_ERR(pll_base);
 	sys_base = devm_platform_ioremap_resource(pdev, 2);
-	if (!sys_base)
-		return -ENXIO;
+	if (IS_ERR(sys_base))
+		return PTR_ERR(sys_base);
 
 	/* enable default clks */
 	for (i = 0; i < ARRAY_SIZE(sp_clken); i++)
-- 
2.25.1

