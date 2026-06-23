Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC4B3A9636;
	Tue, 23 Jun 2026 06:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782194735; cv=none; b=SMhdEx6/ujjdI0Lnf+B7QYDQ63x0+y8C4XQpcVrHBXCLqnQVDzydbw17UVZnRCb4e29Dcge2gIoCHa7Cm1XXmSzWuk1LHZJmBIpszWtKag9MzX9W0JSARpUTJnyvJSGCQeqFCIwRGsX0pURkh0DNg1L0D8AXDrRoYB4uZuYqjNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782194735; c=relaxed/simple;
	bh=b/cLS9SI1SecUwu4Me3MrbPLCRWHFzJlxWlYAStU9MI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bPDgc7Vj6gHW9b3edYHVVsKbmvk/TjISZdSaRSDSH0LRlh0DxKRSiCVKRfOcAy12fKe0gZlGs0M9cnBeX3XYRFQFCUxnLD89gcsS+nDgnKjU4DknJlXGYdSBaia1Gc1L3z5oVlTO4RD4/8hga5TLgHSWI1yc5UjYIIkZQU9u2xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAAHfO8kIjpqXN_JFA--.1729S2;
	Tue, 23 Jun 2026 14:05:24 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable paths
Date: Tue, 23 Jun 2026 14:05:16 +0800
Message-ID: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAHfO8kIjpqXN_JFA--.1729S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr45GF48uFWxZFWDXryUtrb_yoW5CryDpF
	W8WasrK3y7WryUur4SgrZrZwnIqr93tFy3C397G34Iv3Z0vrn8Kr1fGF9FvayDWFyxJF13
	CFZ7tFyrCa1UtFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYCJmUU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The HFPLL enable helper waits for the lock bit but ignores the
regmap_read_poll_timeout() result. The polling condition is also
inconsistent with clk_hfpll_init(), which treats the lock bit being set
as the locked state.

Wait for the lock bit to become set, return timeout errors from the
helper, and propagate those errors through clk_hfpll_enable() and
clk_hfpll_set_rate() instead of enabling the output unconditionally.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/clk/qcom/clk-hfpll.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/clk-hfpll.c b/drivers/clk/qcom/clk-hfpll.c
index 705352aff067..e2059682e440 100644
--- a/drivers/clk/qcom/clk-hfpll.c
+++ b/drivers/clk/qcom/clk-hfpll.c
@@ -54,12 +54,13 @@ static void __clk_hfpll_init_once(struct clk_hw *hw)
 	h->init_done = true;
 }
 
-static void __clk_hfpll_enable(struct clk_hw *hw)
+static int __clk_hfpll_enable(struct clk_hw *hw)
 {
 	struct clk_hfpll *h = to_clk_hfpll(hw);
 	struct hfpll_data const *hd = h->d;
 	struct regmap *regmap = h->clkr.regmap;
 	u32 val;
+	int ret;
 
 	__clk_hfpll_init_once(hw);
 
@@ -76,19 +77,23 @@ static void __clk_hfpll_enable(struct clk_hw *hw)
 	regmap_update_bits(regmap, hd->mode_reg, PLL_RESET_N, PLL_RESET_N);
 
 	/* Wait for PLL to lock. */
-	if (hd->status_reg)
+	if (hd->status_reg) {
 		/*
 		 * Busy wait. Should never timeout, we add a timeout to
 		 * prevent any sort of stall.
 		 */
-		regmap_read_poll_timeout(regmap, hd->status_reg, val,
-					 !(val & BIT(hd->lock_bit)), 0,
-					 100 * USEC_PER_MSEC);
-	else
+		ret = regmap_read_poll_timeout(regmap, hd->status_reg, val,
+					       val & BIT(hd->lock_bit), 0,
+					       100 * USEC_PER_MSEC);
+		if (ret)
+			return ret;
+	} else {
 		udelay(60);
+	}
 
 	/* Enable PLL output. */
 	regmap_update_bits(regmap, hd->mode_reg, PLL_OUTCTRL, PLL_OUTCTRL);
+	return 0;
 }
 
 /* Enable an already-configured HFPLL. */
@@ -99,14 +104,15 @@ static int clk_hfpll_enable(struct clk_hw *hw)
 	struct hfpll_data const *hd = h->d;
 	struct regmap *regmap = h->clkr.regmap;
 	u32 mode;
+	int ret = 0;
 
 	spin_lock_irqsave(&h->lock, flags);
 	regmap_read(regmap, hd->mode_reg, &mode);
 	if (!(mode & (PLL_BYPASSNL | PLL_RESET_N | PLL_OUTCTRL)))
-		__clk_hfpll_enable(hw);
+		ret = __clk_hfpll_enable(hw);
 	spin_unlock_irqrestore(&h->lock, flags);
 
-	return 0;
+	return ret;
 }
 
 static void __clk_hfpll_disable(struct clk_hfpll *h)
@@ -161,6 +167,7 @@ static int clk_hfpll_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long flags;
 	u32 l_val, val;
 	bool enabled;
+	int ret = 0;
 
 	l_val = rate / parent_rate;
 
@@ -183,11 +190,11 @@ static int clk_hfpll_set_rate(struct clk_hw *hw, unsigned long rate,
 	regmap_write(regmap, hd->l_reg, l_val);
 
 	if (enabled)
-		__clk_hfpll_enable(hw);
+		ret = __clk_hfpll_enable(hw);
 
 	spin_unlock_irqrestore(&h->lock, flags);
 
-	return 0;
+	return ret;
 }
 
 static unsigned long clk_hfpll_recalc_rate(struct clk_hw *hw,
-- 
2.50.1 (Apple Git-155)

