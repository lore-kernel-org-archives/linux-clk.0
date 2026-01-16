Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE22C30BF69;
	Fri, 16 Jan 2026 11:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563553; cv=none; b=ObCcR5Phliytwqu/S28rjwcn5FgEno8kbo5w4CzctsP6xpPDug6BA41ul0rlz93qkaxvy3mw1Tl5vRR3VFAzeMhCo99vkKJd2vn8fTkgJsrmbuFPFFVpU8CUmCX/ZAzQRBuL4uTwibbWISEmJP1nwqp4BA346hKM2V3A2Lh9iLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563553; c=relaxed/simple;
	bh=2pGahujOT1l34zZrt6mP5J5Ff6Vfzmzb7PIvnIcVxc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n5nYTAf8QQiKjIYH3QlokFamXu8GZ743INGPOlLNmyAuVfvHk7S+ozaYJSvD2Lr+bHcuxHQTEqyJtT+qZVcrX4vsXuriIqu6vevm9Imgl34r3CGphw9LuG2cxetyB+e7Z/5PDYfuEnH9JmYlx5E+0YcbhgdOlF19JPvvjh5VLQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-05 (Coremail) with SMTP id zQCowAC3TBBMI2ppZbMsBQ--.56400S4;
	Fri, 16 Jan 2026 19:39:04 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH 2/7] clk: st: clkgen-pll: Rename some variables in clkgen_c32_pll_setup()
Date: Fri, 16 Jan 2026 19:38:42 +0800
Message-Id: <20260116113847.1827694-3-lihaoxiang@isrc.iscas.ac.cn>
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
X-CM-TRANSID:zQCowAC3TBBMI2ppZbMsBQ--.56400S4
X-Coremail-Antispam: 1UD129KBjvJXoW7CrW5tF1rZFyUuFyrGryrXrb_yoW8Gw1rpa
	4rAasIv398Xr4q9Fs3JrZ5uF90g3Z7KFWxCrWvkw1FvwsxZry5Xr4rXa48Zr15u3yxuFWY
	qF4qvr18ZF1UtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBl14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
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
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUULZ2DUUUUU==
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiCQ8JE2lp34rSnwAAsE

In clkgen_c32_pll_setup(), `clk` is used for two distint variables' name.
This patch rename the preceding `clk` to `pll_clk`.
The rename is in preparation for cleaning up some memory leaks.

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 drivers/clk/st/clkgen-pll.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
index a7d605b52cf3..0390f6834a0d 100644
--- a/drivers/clk/st/clkgen-pll.c
+++ b/drivers/clk/st/clkgen-pll.c
@@ -755,11 +755,10 @@ static struct clk * __init clkgen_odf_register(const char *parent_name,
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
@@ -777,12 +776,12 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
 
 	of_clk_detect_critical(np, 0, &pll_flags);
 
-	clk = clkgen_pll_register(parent_name, datac->data, pll_base, pll_flags,
+	pll_clk = clkgen_pll_register(parent_name, datac->data, pll_base, pll_flags,
 				  np->name, datac->data->lock);
-	if (IS_ERR(clk))
 		return;
+	if (IS_ERR(pll_clk))
 
-	pll_name = __clk_get_name(clk);
+	pll_name = __clk_get_name(pll_clk);
 
 	num_odfs = datac->data->num_odfs;
 
-- 
2.25.1

