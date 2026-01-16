Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FF536655C;
	Fri, 16 Jan 2026 11:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563555; cv=none; b=Cpt0ITVB0UxuqPJJ1bFOab0bBb1kFLpJixBV8zCNbsUO+ZK951MsTtKDLmctIZnKyY0iPwQnIwd+V7EXS0wbrA0iCf0ha06GJJ0F/nIMqU7w5wUs/BOhin1twPuPXuHUTfadILwvykoJmkAen0oNZsWdNc7b16iSPtR7EKbSSlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563555; c=relaxed/simple;
	bh=tIA0bHjOyuVp8tIikNsCrkcFSy2bdvB+nFtMgE8sPAE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nG7SN/j+/V3ea6DUqtMZmcvgHUeVq/xCnRkQvXfyRDxcyH1Ii+ONtA5xAQv2/f1xORTQS+M9QVlKJCWbL53HIWaNeihrhH3eCIk0h/gtohZZK4grdHV/US0eYjAaYvudfajiilqQwOOZLGkL6tLbeJNNjZ5+uXZoD49ufQaDC5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-05 (Coremail) with SMTP id zQCowAC3TBBMI2ppZbMsBQ--.56400S5;
	Fri, 16 Jan 2026 19:39:05 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH 3/7] clk: st: clkgen-pll: Rename some variables in clkgen_c32_pll_setup()
Date: Fri, 16 Jan 2026 19:38:43 +0800
Message-Id: <20260116113847.1827694-4-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260116113847.1827694-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260116113847.1827694-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC3TBBMI2ppZbMsBQ--.56400S5
X-Coremail-Antispam: 1UD129KBjvJXoW7CrW5tF1rZFyUtrWftFW5ZFb_yoW8Jw4Upa
	4rJ34av39rXrWvgF4fJrZ3WF90q3Z7KFy09rWDKwnY9wsxAry5Zw45u34I93W5uryfuF43
	tr4jyrW8uF1kJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1DMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUtC7UUUUUU==
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwoJE2lp3rvVAQAAsm

In clkgen_c32_pll_setup(), `clk` is used for two distint variables' name.
This patch rename the later `clk` to `odf_clk`.
The rename is in preparation for cleaning up some memory leaks.

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 drivers/clk/st/clkgen-pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
index 0390f6834a0d..4ff9b35fe399 100644
--- a/drivers/clk/st/clkgen-pll.c
+++ b/drivers/clk/st/clkgen-pll.c
@@ -797,7 +797,7 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
 		goto err;
 
 	for (odf = 0; odf < num_odfs; odf++) {
-		struct clk *clk;
+		struct clk *odf_clk;
 		const char *clk_name;
 		unsigned long odf_flags = 0;
 
@@ -813,13 +813,13 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
 			of_clk_detect_critical(np, odf, &odf_flags);
 		}
 
-		clk = clkgen_odf_register(pll_name, pll_base, datac->data,
+		odf_clk = clkgen_odf_register(pll_name, pll_base, datac->data,
 				odf_flags, odf, &clkgena_c32_odf_lock,
 				clk_name);
-		if (IS_ERR(clk))
 			goto err;
+		if (IS_ERR(odf_clk))
 
-		clk_data->clks[odf] = clk;
+		clk_data->clks[odf] = odf_clk;
 	}
 
 	of_clk_add_provider(np, of_clk_src_onecell_get, clk_data);
-- 
2.25.1

