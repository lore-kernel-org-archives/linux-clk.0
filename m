Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D32F4F30CC;
	Fri,  4 Sep 2026 15:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537543; cv=none; b=K7yJF6zks9BwKAwjHwB9RtTV5hW6G5rugx+fNFfyN2AoXmsjyWE3JbNteLnJ3Yn7LF7P4iLXeFmzhkNsXgULYaR2PLLcKLkKJ6EB+l4tYnwjN1AjIRyRgr+Wq1Wj4nc2fmtyA5ohgJjWB+Pw/u6OpaE52qlIyDxO6iu34mT9SPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537543; c=relaxed/simple;
	bh=Pun6ZjnCACSM6H6YEIdyZa1UW6LNXui7X4S9jiGkUhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SACcQV8bs4GXH4wmr55jHYCyHTm2lYUTHH6KrzeGtHdceUEamIl+RfaZS2GZIIQIVOnihLsliJleFt2exrgGsW3sPy4rqZOWZ19BL6zE//jHAUMcCw3/7qrQPZNQg4Lw34W6mr8bVEqSmQ3WAXHiYT8zaM0fvvXo5jjvZWkyUB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FOHfBg3W; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FOHfBg3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537538;
	bh=Pun6ZjnCACSM6H6YEIdyZa1UW6LNXui7X4S9jiGkUhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FOHfBg3Wcd4a5qvlsw2+QCrb0I2mCg+E0NRQ+JSLGiA1AopWfTK85axxvJNOvKBFs
	 TBqt6r4kxPlNXctL/SBXu5dY20/coBX5Uj+frMSm+VC8Cs6Crrv0oYW7V6d34D3Uas
	 w0P9beWlHhHHeZCrs9WvJFPr50YqaNaSt+5qLq64NLqZH5DuT1Zs5xv7b6uCVxNIis
	 OVG8IgkyTEybpwm44pAfAZuO/7m5YjUd80sReoA1m3dzfTw3IgAeuCiLnkmcXlMRFm
	 oU20u1KSBaCBI09j3eXYSNzF2mcB5sJ/60KUCkhmrblgXXRZHM6ybeeyS4+m2MCwGO
	 KE1HDCMJnyYhA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71B9F17E092E;
	Fri, 04 Sep 2026 17:58:57 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:21 +0200
Subject: [PATCH v6 10/27] clk: mediatek: pll: Add BAR reset register
 offsets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-10-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=3030;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Pun6ZjnCACSM6H6YEIdyZa1UW6LNXui7X4S9jiGkUhs=;
 b=iNjRtQ8bEKVg9Fb/PcDszQrR4yYwUcrp0+hvXza6bRDxWpUaPCSTaoHKogN2GQypkBZaLXxbZ
 sH00hPj3K3tARCpEysbABjvfNKhbAGjcrnRSp8aYNChoTUqv9hwCQ4G
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Currently, the register offset to handle BAR reset, for PLLs that
support it, is hardcoded to CON0.
On MT8189 SoC, there are separate status, set and clr registers to
handle this, so differents offsets are needed.

Add the new fields for offsets and addresses to the MTK PLL data
structure and modify mtk_clk_register_pll_ops function to compute the
new register addresses so they are available for clock operation usage.

Also, replace reset BAR address computing by its computed address
from MTK PLL data structure in prepare/unprepare callbacks.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 18 ++++++++++++++----
 drivers/clk/mediatek/clk-pll.h |  6 ++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index ee478bc64085..4b0f7e2bfc5a 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -249,9 +249,9 @@ int mtk_pll_prepare(struct clk_hw *hw)
 	udelay(20);
 
 	if (pll->data->flags & HAVE_RST_BAR) {
-		r = readl(pll->base_addr + REG_CON0);
+		r = readl(pll->rst_bar_addr);
 		r |= pll->data->rst_bar_mask;
-		writel(r, pll->base_addr + REG_CON0);
+		writel(r, pll->rst_bar_addr);
 	}
 
 	return 0;
@@ -263,9 +263,9 @@ void mtk_pll_unprepare(struct clk_hw *hw)
 	u32 r;
 
 	if (pll->data->flags & HAVE_RST_BAR) {
-		r = readl(pll->base_addr + REG_CON0);
+		r = readl(pll->rst_bar_addr);
 		r &= ~pll->data->rst_bar_mask;
-		writel(r, pll->base_addr + REG_CON0);
+		writel(r, pll->rst_bar_addr);
 	}
 
 	__mtk_pll_tuner_disable(pll);
@@ -352,6 +352,16 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 		pll->en_set_addr = base + data->en_set_reg;
 	if (data->en_clr_reg)
 		pll->en_clr_addr = base + data->en_clr_reg;
+
+	if (data->rst_bar_reg)
+		pll->rst_bar_addr = base + data->rst_bar_reg;
+	else
+		pll->rst_bar_addr = pll->base_addr + REG_CON0;
+	if (data->rst_bar_set_reg)
+		pll->rst_bar_set_addr = base + data->rst_bar_set_reg;
+	if (data->rst_bar_clr_reg)
+		pll->rst_bar_clr_addr = base + data->rst_bar_clr_reg;
+
 	pll->hw.init = &init;
 	pll->data = data;
 
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index d6d34840c09d..3aaf3a7654b5 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -49,6 +49,9 @@ struct mtk_pll_data {
 	u32 en_reg;
 	u32 en_set_reg;
 	u32 en_clr_reg;
+	u32 rst_bar_reg;
+	u32 rst_bar_set_reg;
+	u32 rst_bar_clr_reg;
 	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
 	u8 pcw_chg_bit;
 	u8 fenc_sta_bit;
@@ -75,6 +78,9 @@ struct mtk_clk_pll {
 	void __iomem	*en_set_addr;
 	void __iomem	*en_clr_addr;
 	void __iomem	*fenc_addr;
+	void __iomem	*rst_bar_addr;
+	void __iomem	*rst_bar_set_addr;
+	void __iomem	*rst_bar_clr_addr;
 	const struct mtk_pll_data *data;
 };
 

-- 
2.55.0

