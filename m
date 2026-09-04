Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15427501F4B;
	Fri,  4 Sep 2026 15:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537544; cv=none; b=RxptD66pR4QSW9asJvbrZbqLHbJ1uA3fd0oxKZzjbz8vrfvTUOfPt4ILnIk8hypY0CWqBLizWEfow+QfV42MQHI3kFVsBBff1KXXlv7dXjiV3oN2lfksrQuRFAVpz/A0A9Q6qqr5M/zcnLR3zMrJ7vckd5sBkZyUKIcyjLc/A+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537544; c=relaxed/simple;
	bh=5r6DxrE7zrZMVgoolkWus+HukdRlhbqUOz9ok20ajpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LM92kk24LZ02tI69lIYXNiv9ntxTpv36/sSpEeXEUgWrAjsfViIpQ9+fkN2tu5dTwfpXHH96VizeOh9i/i/zLZ/PMRmos9xiYkgeR/Oj22LbfAbvRxX88/4WJFh6wIZiYTR7X92TUoxmwfzyH3pYuwVo1Du206BKS8AYeSHtm4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MprJi2qT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MprJi2qT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537540;
	bh=5r6DxrE7zrZMVgoolkWus+HukdRlhbqUOz9ok20ajpM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MprJi2qTpoGZS7rH1/KnHJ7qh0TZZPGTxk9H7Y2pZSC7hUKVnUWvqi4GGepGRqV7o
	 2inGnO9amr96erSL+lxjUUbef9T6ybfyMhYAkJLEfk2PoX7Q75QOK0oBfHEZVJQQpp
	 S3lTP4J9FFHDqMfjiKDcojIdd+aLu+7O8LvJlkYNdNl6E6iRrtjMTvafZvEolGyuMI
	 w9prC7IKLf1TCEQcyYx5ev+4mKDRWvZujAWjJrYhl2g+3Jx+tMBxc8mNuy4IE/hG3F
	 0a+GwerrKtbsNrlbb4UCZr6/Wxsr8r55ynxE2Z2eKw5aAG4gobHxOKIqQiUx5KpFD5
	 Yj/ethpxBjT4Q==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC6A017E0C10;
	Fri, 04 Sep 2026 17:58:58 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:22 +0200
Subject: [PATCH v6 11/27] clk: mediatek: pll: Factorise pll power on/off
 sequences
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-11-5df247f56938@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=2061;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=5r6DxrE7zrZMVgoolkWus+HukdRlhbqUOz9ok20ajpM=;
 b=KE5Pv3Qj6DFnkoSUCpTkq8rs0H1dNBtaec57IdUZvg1GB9ONoPJ06FxF/aqbb9f2vEOyjZMik
 pd/kw6TJjgtBQ2WyQEQiUYYgX6qcqAf+HwYppaatZeKyqtT8pLFP3KK
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

In order to prepare the MT8189 SoC support, that requires different
registers to control PLL status and perform reset BAR, and so a
different sets of clock operations, split the pll power on and off
sequences from mtk_pll_prepare/unprepare functions into private
subfunctions.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 4b0f7e2bfc5a..2aaf2871ecf6 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -223,9 +223,8 @@ int mtk_pll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 	return 0;
 }
 
-int mtk_pll_prepare(struct clk_hw *hw)
+static void mtk_pll_power_on(struct mtk_clk_pll *pll)
 {
-	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 	u32 r;
 
 	r = readl(pll->pwr_addr) | CON0_PWR_ON;
@@ -235,6 +234,25 @@ int mtk_pll_prepare(struct clk_hw *hw)
 	r = readl(pll->pwr_addr) & ~CON0_ISO_EN;
 	writel(r, pll->pwr_addr);
 	udelay(1);
+}
+
+static void mtk_pll_power_off(struct mtk_clk_pll *pll)
+{
+	u32 r;
+
+	r = readl(pll->pwr_addr) | CON0_ISO_EN;
+	writel(r, pll->pwr_addr);
+
+	r = readl(pll->pwr_addr) & ~CON0_PWR_ON;
+	writel(r, pll->pwr_addr);
+}
+
+int mtk_pll_prepare(struct clk_hw *hw)
+{
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+	u32 r;
+
+	mtk_pll_power_on(pll);
 
 	r = readl(pll->en_addr) | BIT(pll->data->pll_en_bit);
 	writel(r, pll->en_addr);
@@ -278,11 +296,7 @@ void mtk_pll_unprepare(struct clk_hw *hw)
 	r = readl(pll->en_addr) & ~BIT(pll->data->pll_en_bit);
 	writel(r, pll->en_addr);
 
-	r = readl(pll->pwr_addr) | CON0_ISO_EN;
-	writel(r, pll->pwr_addr);
-
-	r = readl(pll->pwr_addr) & ~CON0_PWR_ON;
-	writel(r, pll->pwr_addr);
+	mtk_pll_power_off(pll);
 }
 
 static int mtk_pll_prepare_fenc_setclr(struct clk_hw *hw)

-- 
2.55.0

