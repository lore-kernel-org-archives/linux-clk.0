Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23BB4CCDC1;
	Tue,  1 Sep 2026 12:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267219; cv=none; b=IG7n2WN5LZeADVhzlTuv8Aq82fZqiyH/ezvR/sz3qnPf3k81pgHY4S4eFBs4a3xEKnKUPZYJitY0S+Lw3BuFUhEVgccRgdEI4hLu40I/NRQHfbhUNKkNaejxKV/55QXShj5FzaVFHY7Mz/clEaeaGrBo1rJ2Wx5wtZs5N/Co0Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267219; c=relaxed/simple;
	bh=mN3J3PFtyTtR5hSD7jhOkZ9LwE/np8fv9UIW9RabCBI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lkBfWOFDyq0dPe/oURAHUK/v4ZHtKRBJotyNAc8JROX81uO12cj6p9rfOVTYjOf/BplR7tl4wz7C5i0/oguEbxTzKkTAjzfivqg9/N/3BsKMgTouqVi6CZC0IKX+2YIzDExDNBXqnq42KmqfweVO9hPVPkD0c0N6fcaioxKwj4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 20ea352ca60411f19a56ed5b684f684d-20260901
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:e9e9f435-0a87-416b-a713-5c522781e1ad,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:25c1092264eb615d526a984f18807bf6,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 20ea352ca60411f19a56ed5b684f684d-20260901
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1294518346; Tue, 01 Sep 2026 20:53:28 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Michal Simek <michal.simek@amd.com>
Cc: Kees Cook <kees@kernel.org>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>,
	Mike Turquette <mturquette@linaro.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gonglinkai@kylinos.cn
Subject: [PATCH] clk: zynq: return -ETIMEDOUT if the PLL never locks
Date: Tue,  1 Sep 2026 20:53:23 +0800
Message-Id: <20260901125323.1556551-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zynq_pll_enable() waits for lock under a spinlock with no
timeout. Poll with a 1ms bound and return the error.

Fixes: 3682af46d55f ("clk: zynq: Factor out PLL driver")
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
 drivers/clk/zynq/pll.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zynq/pll.c b/drivers/clk/zynq/pll.c
index 44c609378364..96cf45088ba0 100644
--- a/drivers/clk/zynq/pll.c
+++ b/drivers/clk/zynq/pll.c
@@ -10,6 +10,7 @@
 #include <linux/clk-provider.h>
 #include <linux/slab.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 
 /**
  * struct zynq_pll - pll clock
@@ -119,6 +120,7 @@ static int zynq_pll_enable(struct clk_hw *hw)
 	unsigned long flags = 0;
 	u32 reg;
 	struct zynq_pll *clk = to_zynq_pll(hw);
+	int ret;
 
 	if (zynq_pll_is_enabled(hw))
 		return 0;
@@ -131,12 +133,12 @@ static int zynq_pll_enable(struct clk_hw *hw)
 	reg = readl(clk->pll_ctrl);
 	reg &= ~(PLLCTRL_RESET_MASK | PLLCTRL_PWRDWN_MASK);
 	writel(reg, clk->pll_ctrl);
-	while (!(readl(clk->pll_status) & (1 << clk->lockbit)))
-		;
+	ret = readl_poll_timeout_atomic(clk->pll_status, reg,
+					reg & (1 << clk->lockbit), 10, 1000);
 
 	spin_unlock_irqrestore(clk->lock, flags);
 
-	return 0;
+	return ret;
 }
 
 /**
-- 
2.25.1

