Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7156133DEF7;
	Fri,  5 Jun 2026 09:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780651327; cv=none; b=rrpxKItRaHsLb9pLxrrilrsnZ/KJwcXgUCFYuBN4pv0d/NEO1mzB92nsZyKVYtt7wSBSogGIimJhlgTaPtgjVng9VRk/kPQ+tso9hdwOre3ksYYxS/UWL4bUBlilSVpq9zINjRDiW1DSCr+4eeB0sXiXMx2+thk9uqg/zrWvGnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780651327; c=relaxed/simple;
	bh=wwEYSUu2aPmTvO87HTz1od2IuFJSGXCQ2zBLXp/trAs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mDqcq4DW/dXZWayq/SHqB1+LI4TJ4R5AlsDJXJjtOSM1Gh8ITqGFh2skCdiYwr5tT7/zFNU6Gka6gFyW+1x8iU9CSnNEJkWGBHPp+2QMDab6h1WHcydgRaloqW53emb+6HWD6sWwhp6nFvGcVodTx5e23ll438+fwm3NouRnHwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgDn_aASlSJq9F8iAA--.2552S2;
	Fri, 05 Jun 2026 17:21:47 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangyifeng@eswincomputing.com,
	dongxuyang@eswincomputing.com
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: [PATCH] clk: eswin: Add CLK_IGNORE_UNUSED to NoC clock
Date: Fri,  5 Jun 2026 17:21:18 +0800
Message-Id: <20260605092118.1945-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgDn_aASlSJq9F8iAA--.2552S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4fKw47CF1DKr48WFyxGrg_yoW8Wry3pF
	s3Ga4fWr1qgF4xuas7JFyF9ry5Aa1UGa9xKFyxAa1DA3WDCF18XF4xCF98GFyUXw4fWw43
	Xa47Jay3CF4UZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUYucEUUUUU
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

The gate_noc_nsp_clk provides the essential clock source for NPU,
DSP, and PCIe subsystems. During kernel init, the clock framework
attempts to disable unused clocks when clk_ignore_unused kernel
parameter is not set.
However, gate_noc_nsp_clk is required to remain enabled for these
critical subsystems to function properly, causing PCIe boot failures
when auto-disabled.

Add CLK_IGNORE_UNUSED flag to gate_noc_nsp_clk to ensure it stays
enabled even when clk_ignore_unused is not specified in kernel
command line.

Fixes: cd44f127c1d4 ("clk: eswin: Add eic7700 clock driver")
Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
---
 drivers/clk/eswin/clk-eic7700.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/eswin/clk-eic7700.c b/drivers/clk/eswin/clk-eic7700.c
index be81d74192da..43a47fe16ab1 100644
--- a/drivers/clk/eswin/clk-eic7700.c
+++ b/drivers/clk/eswin/clk-eic7700.c
@@ -791,7 +791,8 @@ static struct eswin_clk_info eic7700_clks[] = {
 			EIC7700_CLK_MUX_CPU_ROOT_3MUX1_GFREE,
 			CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_U84, 27, 0),
 	ESWIN_GATE_TYPE(EIC7700_CLK_GATE_NOC_NSP_CLK, "gate_noc_nsp_clk",
-			EIC7700_CLK_DIV_NOC_NSP_DYNM, CLK_SET_RATE_PARENT,
+			EIC7700_CLK_DIV_NOC_NSP_DYNM,
+			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
 			EIC7700_REG_OFFSET_NOC, 31, 0),
 	ESWIN_GATE_TYPE(EIC7700_CLK_GATE_BOOTSPI, "gate_clk_bootspi",
 			EIC7700_CLK_MUX_BOOTSPI_CLK_2MUX1_GFREE,
-- 
2.34.1

