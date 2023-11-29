Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578C2BC
	for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 00:46:09 -0800 (PST)
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SgCbF4LN3z4f3n6c
	for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 16:46:01 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 19AC21A0199
	for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 16:46:06 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.103.91])
	by APP1 (Coremail) with SMTP id cCh0CgDX2xFG+mZlpm4ACQ--.35156S4;
	Wed, 29 Nov 2023 16:46:05 +0800 (CST)
From: Yang Yingliang <yangyingliang@huaweicloud.com>
To: linux-clk@vger.kernel.org
Cc: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	shengjiu.wang@nxp.com,
	yangyingliang@huawei.com
Subject: [PATCH] clk: imx: imx8: fix return value check in clk_imx_acm_attach_pm_domains()
Date: Wed, 29 Nov 2023 16:50:09 +0800
Message-Id: <20231129085009.780096-1-yangyingliang@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgDX2xFG+mZlpm4ACQ--.35156S4
X-Coremail-Antispam: 1UD129KBjvdXoW7XFW7Xry8Kr4rXF4DAF1fWFg_yoWDZrb_GF
	18Cr4UX34rJF4ayr1j9F1fZrZ8Zrnruan7XayS934fJasxur1rJrZ0qF4fXr1xWrWUGFW7
	W3Z3ursY9r9xCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2xYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IY
	c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
	026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF
	0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0x
	vE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUza9aDUUUU
X-CM-SenderInfo: 51dqw5xlqjzxhdqjqx5xdzvxpfor3voofrz/

From: Yang Yingliang <yangyingliang@huawei.com>

device_link_add() returns NULL pointer not PTR_ERR() when it fails,
so replace the IS_ERR() check with NULL pointer check and set the
error code to -EINVAL.

Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/clk/imx/clk-imx8-acm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
index f68877eef873..5cae17843663 100644
--- a/drivers/clk/imx/clk-imx8-acm.c
+++ b/drivers/clk/imx/clk-imx8-acm.c
@@ -289,9 +289,9 @@ static int clk_imx_acm_attach_pm_domains(struct device *dev,
 							 DL_FLAG_STATELESS |
 							 DL_FLAG_PM_RUNTIME |
 							 DL_FLAG_RPM_ACTIVE);
-		if (IS_ERR(dev_pm->pd_dev_link[i])) {
+		if (!dev_pm->pd_dev_link[i]) {
 			dev_pm_domain_detach(dev_pm->pd_dev[i], false);
-			ret = PTR_ERR(dev_pm->pd_dev_link[i]);
+			ret = -EINVAL;
 			goto detach_pm;
 		}
 	}
-- 
2.25.1

