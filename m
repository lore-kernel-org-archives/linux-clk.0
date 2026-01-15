Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212372BE621;
	Thu, 15 Jan 2026 04:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768452297; cv=none; b=qk0YU94ph4aWD7tY0Tc+p+suhMA5ZRR0Ae/eG0sGjWC3ug5Tmg5JFtpP/FmeFs+oSQ7ZXP17eQK/kwftkPA3KLhUBqCDxmbEPt+BBGcwvnCFNZjYPmFOBW2GVbHalSLcu2bS2o71iud+Vjot5U3OoahNbSJidnLxgrKEaMucujo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768452297; c=relaxed/simple;
	bh=lLxfDw9ZCkyLNUp9O0vYfNM4OYWV0IdOoP0cmTxnHCc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VS5KPdnYHbID2fTeUYjPVPJwVCfX0U6PZQKZ6GRDvYmBnRF3PKQBfFXsNBkWZjeDpiTDJrSV5KBC7MTS82itiBYiQuU2Y2LhNonJ1KGITMspk2Y5zISXCYfvePjt5xWHSdo0yEJxAd4llXNlD0rAsuXCQSuLxJU63fjCPNbfyFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-01 (Coremail) with SMTP id qwCowABHs264cGhpIp7BBA--.14353S2;
	Thu, 15 Jan 2026 12:44:41 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH v2] clk: st: clkgen-pll: Add cleaup in clkgen_c32_pll_setup()
Date: Thu, 15 Jan 2026 12:44:39 +0800
Message-Id: <20260115044439.632676-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABHs264cGhpIp7BBA--.14353S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCFW7Xr48uFyxAFyrZFW5Wrg_yoW5Kr4rpa
	4rG34Yqw4DXrWkWFs5JrZ8uF90gF1xKFW8urW5Kwn3AwsxKry5Jw45Ca48Cay5C3yxuw4Y
	gr4DC3y8uF1DKF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r1j6r
	4UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUehL0UUUUU
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiDAYIE2loPMWt1gAAsS

In clkgen_c32_pll_setup(), there exists several leaks if errors ouccers.
Add iounmap() to free the memory allocated by clkgen_get_register_base().
Add clk_unregister() and kfree to do the cleaup for clkgen_pll_register().
Add a while to do the cleaup for clkgen_odf_register().
Use distinct variable names for two register calls' return values.

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
Changes in v2:
- Add several cleanups. Thanks, Brian!
- Modify the changelog.
---
 drivers/clk/st/clkgen-pll.c | 44 +++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
index c258ff87a171..100172f9fdf8 100644
--- a/drivers/clk/st/clkgen-pll.c
+++ b/drivers/clk/st/clkgen-pll.c
@@ -752,11 +752,10 @@ static struct clk * __init clkgen_odf_register(const char *parent_name,
 	return clk;
 }
 
-
 static void __init clkgen_c32_pll_setup(struct device_node *np,
 		struct clkgen_pll_data_clks *datac)
 {
-	struct clk *clk;
+	struct clk *pll_clk;
 	const char *parent_name, *pll_name;
 	void __iomem *pll_base;
 	int num_odfs, odf;
@@ -774,18 +773,18 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
 
 	of_clk_detect_critical(np, 0, &pll_flags);
 
-	clk = clkgen_pll_register(parent_name, datac->data, pll_base, pll_flags,
+	pll_clk = clkgen_pll_register(parent_name, datac->data, pll_base, pll_flags,
 				  np->name, datac->data->lock);
-	if (IS_ERR(clk))
-		return;
+	if (IS_ERR(pll_clk))
+		goto err_unmap;
 
-	pll_name = __clk_get_name(clk);
+	pll_name = __clk_get_name(pll_clk);
 
 	num_odfs = datac->data->num_odfs;
 
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
-		return;
+		goto err_pll_unregister;
 
 	clk_data->clk_num = num_odfs;
 	clk_data->clks = kcalloc(clk_data->clk_num, sizeof(struct clk *),
@@ -795,7 +794,7 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
 		goto err;
 
 	for (odf = 0; odf < num_odfs; odf++) {
-		struct clk *clk;
+		struct clk *odf_clk;
 		const char *clk_name;
 		unsigned long odf_flags = 0;
 
@@ -806,28 +805,45 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
 			if (of_property_read_string_index(np,
 							  "clock-output-names",
 							  odf, &clk_name))
-				return;
+				goto err;
 
 			of_clk_detect_critical(np, odf, &odf_flags);
 		}
 
-		clk = clkgen_odf_register(pll_name, pll_base, datac->data,
+		odf_clk = clkgen_odf_register(pll_name, pll_base, datac->data,
 				odf_flags, odf, &clkgena_c32_odf_lock,
 				clk_name);
-		if (IS_ERR(clk))
-			goto err;
+		if (IS_ERR(odf_clk))
+			goto err_odf_unregister;
 
-		clk_data->clks[odf] = clk;
+		clk_data->clks[odf] = odf_clk;
 	}
 
 	of_clk_add_provider(np, of_clk_src_onecell_get, clk_data);
 	return;
 
+err_odf_unregister:
+	while (odf--) {
+		struct clk_gate *gate = to_clk_gate(__clk_get_hw(clk_data->clks[odf]));
+		struct clk_divider *div = to_clk_divider(__clk_get_hw(clk_data->clks[odf]));
+
+		clk_unregister_composite(clk_data->clks[odf]);
+		kfree(div);
+		kfree(gate);
+	}
 err:
-	kfree(pll_name);
 	kfree(clk_data->clks);
 	kfree(clk_data);
+err_pll_unregister:
+	struct clkgen_pll *pll = to_clkgen_pll(__clk_get_hw(pll_clk));
+
+	clk_unregister(pll_clk);
+	kfree(pll);
+err_unmap:
+	if (pll_base)
+		iounmap(pll_base);
 }
+
 static void __init clkgen_c32_pll0_setup(struct device_node *np)
 {
 	clkgen_c32_pll_setup(np,
-- 
2.25.1

