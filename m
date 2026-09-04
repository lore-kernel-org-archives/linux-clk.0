Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B566950C294;
	Fri,  4 Sep 2026 15:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537550; cv=none; b=c67z5dsKSz7mKEyXE303t5wAcrwkOgrRu3oClxSL6WYpHcUranMdOG8A9+d8LU9rzBRnVw65JoyfidhLEA8qjY3DWesNIlNjWjp5FSEONy8JOeb4jrfpRuhfZcwgk70iNl5N1NGlhfs3Z1mxEceamzNtttW5pVDG7+clvHWyguQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537550; c=relaxed/simple;
	bh=CO1dydzeh+KVCvS1IE54qTpSgV0zvo4m0yatpAEUqUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sDtAhkdcyjrmxO0xUxgc8Abo994bGrkSAyswrx2+79x4jekzLIUmGXjjViZIMxbRb8axaylSp84PJ93K9sBcMxYgXVQsr7toR6US6lpdipRoHL3IpbS2QbsdeX4GakPcH6BLr6CkJVymdghUaOiscykjlHd/wAXtmHsFQEoAxYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SJGlqu68; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SJGlqu68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537545;
	bh=CO1dydzeh+KVCvS1IE54qTpSgV0zvo4m0yatpAEUqUI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SJGlqu68f0kQfhQMt7D69mD4YzJ1LyIDn1GDtXBZspaUwQMs3ZfmdV5St9Eam4ef5
	 updoVFJlusROLudbvgHScADyrLOcmkSjSCwgdCyIwu3FMSc4RjFRnD7vzfPkT4vPcw
	 VwKGa/7dDIj3lhUoHFzSSTFdQy/twUJDaPiCwBhyTMZXQtkPVICqOn+W+dSXp9QI6/
	 /L3azr2vn99bwBNKfTG5WLzXNE8oQoi+v/WCT9rda8xgrT4TH5CF9UnS3bWao7516i
	 GHvZkNkRi6fPgTHtSz7KpZvoczKx83pVL3pD91kYqXJL/iMkyazFNWZoK8fHmuQL64
	 UR10L5EMkAAGg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7AC4017E080A;
	Fri, 04 Sep 2026 17:59:04 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:26 +0200
Subject: [PATCH v6 15/27] clk: mediatek: pllfh: Add ops for PLLs using
 set/clr regs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-15-5df247f56938@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=1709;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=CO1dydzeh+KVCvS1IE54qTpSgV0zvo4m0yatpAEUqUI=;
 b=ATc9KJy68pbWyMlbkIJSQ1hZvcH+oVc+4NscsVjS7xkFjfOLVp0rn5sySeVu6O8Wu4H1il49l
 8LegNJ73MTyDy4Ak7VpPk0k9IRAm7+/TxAxj8FB8OTJph+r2R0pW4T6
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Add new set of PLL FHCTL clock operations, that uses the new prepare
and unprepare methods, added in PLL for MT8189 SoC to support this
logic.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-pllfh.c | 10 ++++++++++
 drivers/clk/mediatek/clk-pllfh.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index cc73eb4f87e6..f36dbc7fa06d 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -47,6 +47,16 @@ static const struct clk_ops mtk_pllfh_ops = {
 	.set_rate	= mtk_fhctl_set_rate,
 };
 
+const struct clk_ops mtk_pllfh_setclr_ops = {
+	.is_prepared	= mtk_pll_is_prepared,
+	.prepare	= mtk_pll_prepare_setclr,
+	.unprepare	= mtk_pll_unprepare_setclr,
+	.recalc_rate	= mtk_pll_recalc_rate,
+	.determine_rate = mtk_pll_determine_rate,
+	.set_rate	= mtk_fhctl_set_rate,
+};
+EXPORT_SYMBOL_GPL(mtk_pllfh_setclr_ops);
+
 static struct mtk_pllfh_data *get_pllfh_by_id(struct mtk_pllfh_data *pllfhs,
 					      int num_fhs, int pll_id)
 {
diff --git a/drivers/clk/mediatek/clk-pllfh.h b/drivers/clk/mediatek/clk-pllfh.h
index d32bfe194ec4..a9eb7558de1c 100644
--- a/drivers/clk/mediatek/clk-pllfh.h
+++ b/drivers/clk/mediatek/clk-pllfh.h
@@ -69,6 +69,8 @@ struct fh_operation {
 	int (*ssc_enable)(struct mtk_fh *fh, u32 rate);
 };
 
+extern const struct clk_ops mtk_pllfh_setclr_ops;
+
 int mtk_clk_register_pllfhs(struct device *dev,
 			    const struct mtk_pll_data *plls, int num_plls,
 			    struct mtk_pllfh_data *pllfhs, int num_pllfhs,

-- 
2.55.0

