Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 823D819B6
	for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 00:35:18 -0800 (PST)
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SgCLm2Xxbz4f3kJt
	for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 16:35:12 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 3BE0C1A0E7A
	for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 16:35:15 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.103.91])
	by APP1 (Coremail) with SMTP id cCh0CgCnqxG992Zld77_CA--.27125S4;
	Wed, 29 Nov 2023 16:35:15 +0800 (CST)
From: Yang Yingliang <yangyingliang@huaweicloud.com>
To: linux-clk@vger.kernel.org
Cc: qinjian@cqplus1.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yangyingliang@huawei.com
Subject: [PATCH] clk: sp7021: fix return value check in sp7021_clk_probe()
Date: Wed, 29 Nov 2023 16:39:21 +0800
Message-Id: <20231129083921.713160-1-yangyingliang@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgCnqxG992Zld77_CA--.27125S4
X-Coremail-Antispam: 1UD129KBjvJXoWrZrWrAFW3Gr43Gw47Kw4UJwb_yoW8Jr47pr
	yxGFWSkFy5Ww1UKa4Iy3W7XFn5Aa4Iqay7KFy0qanxZ34YyFW3CrZ5Gay0g3WxGrsYkw4r
	J3y3Cr4xZFy0qFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUgKb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr
	1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
	daVFxhVjvjDU0xZFpf9x07UX4SrUUUUU=
X-CM-SenderInfo: 51dqw5xlqjzxhdqjqx5xdzvxpfor3voofrz/

From: Yang Yingliang <yangyingliang@huawei.com>

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

