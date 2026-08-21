Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F77B42A179;
	Fri, 21 Aug 2026 08:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302593; cv=none; b=TgrHGtu2dt1XLjoqDpnJpO42XRrfYsXnNyuIFNRNDYOEaNzFVFYerTaCMpf8xqgOQ8Lp4V02c0IBULdNJei+sWgAoEpmkebO5QOrunJIfUCR8QiFGp99vOUPB122peXSoo64Za1OZBFrETsTdCrwk9omfY4Coc5uKO7sshtFals=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302593; c=relaxed/simple;
	bh=FIXrxEB9stgnRw/2s2sPsixWTqM6n0oFpU9rf0o23Tk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T4deS0D1EO8LkJmkHqAL1WWhlVgVkBRf0lvh8H36EsWvwhIEmGL3t82B0f+TLnCvboZOZFLJhZJlgRuOjBwDcjFMjeUgWtg+hwQqd5nphVOzZnQtMMTFJTDvzFpvw85XI1iOFLVKs5kwLPXPyFGjfsWPZrwk75t5gIQWWTXzAig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2dd581669d3e11f19a56ed5b684f684d-20260821
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:05466afd-d21a-4964-b9fa-542edf9a990f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:a026a9d2c773b9fc5a6194e0456b7029,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2dd581669d3e11f19a56ed5b684f684d-20260821
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 85594952; Fri, 21 Aug 2026 16:56:20 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>,
	Brian Masney <bmasney@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gonglinkai@kylinos.cn
Subject: [PATCH] clk: imx: composite-93: return timeout from gate enable
Date: Fri, 21 Aug 2026 16:56:16 +0800
Message-Id: <20260821085616.1129333-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx93_clk_composite_gate_enable() always returns 0, even when
imx93_clk_composite_wait_ready() times out.

Fixes: 4a3de5aa7743 ("clk: imx: clk-composite-93: check slice busy")
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
 drivers/clk/imx/clk-composite-93.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-composite-93.c b/drivers/clk/imx/clk-composite-93.c
index ef20ceb2d255..953f67d13978 100644
--- a/drivers/clk/imx/clk-composite-93.c
+++ b/drivers/clk/imx/clk-composite-93.c
@@ -43,11 +43,12 @@ static int imx93_clk_composite_wait_ready(struct clk_hw *hw, void __iomem *reg)
 	return ret;
 }
 
-static void imx93_clk_composite_gate_endisable(struct clk_hw *hw, int enable)
+static int imx93_clk_composite_gate_endisable(struct clk_hw *hw, int enable)
 {
 	struct clk_gate *gate = to_clk_gate(hw);
 	unsigned long flags;
 	u32 reg;
+	int ret;
 
 	if (gate->lock)
 		spin_lock_irqsave(gate->lock, flags);
@@ -61,17 +62,17 @@ static void imx93_clk_composite_gate_endisable(struct clk_hw *hw, int enable)
 
 	writel(reg, gate->reg);
 
-	imx93_clk_composite_wait_ready(hw, gate->reg);
+	ret = imx93_clk_composite_wait_ready(hw, gate->reg);
 
 	if (gate->lock)
 		spin_unlock_irqrestore(gate->lock, flags);
+
+	return ret;
 }
 
 static int imx93_clk_composite_gate_enable(struct clk_hw *hw)
 {
-	imx93_clk_composite_gate_endisable(hw, 1);
-
-	return 0;
+	return imx93_clk_composite_gate_endisable(hw, 1);
 }
 
 static void imx93_clk_composite_gate_disable(struct clk_hw *hw)
-- 
2.25.1

