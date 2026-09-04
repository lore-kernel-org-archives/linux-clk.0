Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B8E503BF9;
	Fri,  4 Sep 2026 15:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537545; cv=none; b=X9cHjef01jzy7Cd6T02edBAP/fBb2Ir8DrGejKkP6/QY2tKkceKRxuCvjz4erPwuwvq+co+58q5GDzSL9HPEkvEpwq1oP5sS99kTTKKXg9x4BCzGighuztkL6eDrEZHEBRD1UQkM/gdu8q/BY30XWnGdwNuvDhQ+JbZe/mMDCAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537545; c=relaxed/simple;
	bh=1piwe291SJzHCvmYgTYe5CleobD/ifmr/BhtwFBgFOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g54wrc4/T3sCuvsKBYegt50i37AN8/I6K9I+cvnU8SyJjG/S683V3EPe04oKKwZI8qXqFJSaGVHXaSC94TRt56gquZYq6WNzX2XS48KC+aMsC/P8a5sRjEWt9ZFA5QWKv24m/tOBZ+hqrQWp3nMeD/0G2f5j21oDDuN+v21hbx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RyccvWL+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RyccvWL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537541;
	bh=1piwe291SJzHCvmYgTYe5CleobD/ifmr/BhtwFBgFOM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RyccvWL+IfVRdJ8RH0g3yenON+HlabScLKqf0ohkW+FU1X8KI+U4menm7e18Vy+T5
	 0O+DKoGL1cof/OXb7Lk284I2WmKN+2zjtYwI49z87fHTxMgMsPyJaUahaHRkNXiOrM
	 2ua8KsJhM2HUUXVqm+51M9Ij8Lz4ity/aJopq/s/14zwL6qg+pmuO/v2haOV5o/LPc
	 09//ubtQB5MDbi7JGK2GXaBNfFb+OK2+BIVDDu4ITGfO7UyXrYekmsoXQBgf/4LnKo
	 3OeqYF4ogH7sogwmds4+CRgP/vnbVpns/HxutFIkjLHs6ELni52/wYTvZ7+24bAo9o
	 cwelIUKZoCdTA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 52B9517E14D2;
	Fri, 04 Sep 2026 17:59:00 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:23 +0200
Subject: [PATCH v6 12/27] clk: mediatek: pll: Add PLL stabilization delay
 definition
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-12-5df247f56938@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=1541;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=1piwe291SJzHCvmYgTYe5CleobD/ifmr/BhtwFBgFOM=;
 b=Hf+3XAUnkaNPFk/JON0jY6so4Hv87b2O1iV3DYnqgYm8uFi+Du6QhH8HQpCO/XJDS9hI+0Kg2
 hwnCoRpqfwxC4+9BVkswxVMtOnypcRDcNJHern4dddIasH0USa5ryN6
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Several functions uses a hardcoded value (20), to represent the
needed delay to stabilize a PLL.
Add a common define for this value.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 2aaf2871ecf6..9a197a657dce 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -31,6 +31,8 @@
 /* default 7 bits integer, can be overridden with pcwibits. */
 #define INTEGER_BITS		7
 
+#define PLL_STABILIZATION_DELAY	20 /* in us */
+
 int mtk_pll_is_prepared(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
@@ -131,7 +133,7 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
 	/* restore tuner_en */
 	__mtk_pll_tuner_enable(pll);
 
-	udelay(20);
+	udelay(PLL_STABILIZATION_DELAY);
 }
 
 /*
@@ -264,7 +266,7 @@ int mtk_pll_prepare(struct clk_hw *hw)
 
 	__mtk_pll_tuner_enable(pll);
 
-	udelay(20);
+	udelay(PLL_STABILIZATION_DELAY);
 
 	if (pll->data->flags & HAVE_RST_BAR) {
 		r = readl(pll->rst_bar_addr);
@@ -306,7 +308,7 @@ static int mtk_pll_prepare_fenc_setclr(struct clk_hw *hw)
 	writel(BIT(pll->data->pll_en_bit), pll->en_set_addr);
 
 	/* Wait 20us after enable for the PLL to stabilize */
-	udelay(20);
+	udelay(PLL_STABILIZATION_DELAY);
 
 	return 0;
 }

-- 
2.55.0

