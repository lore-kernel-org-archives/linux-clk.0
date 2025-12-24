Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064783A8F7;
	Wed, 24 Dec 2025 07:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766561433; cv=none; b=lStMOYwT+q/MCdx9fyIyP7cXqVyU1rts2qlbn1Nv5bYzCdgtHMRNpEoUCBlgNZl8uU0s5Ssupkh+1Yq0+c76ooj1UEewn7zOS7KY2Qo6IkNf00KlZh8VbSKc/8VQXoku0ZqLKJG6J7qc/6uiQCfxpWrus5Y58WRTPiJidQsESMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766561433; c=relaxed/simple;
	bh=pV4PNUpZZSOyiYrDnysupRUAFKualbvc4cyd7FmaVdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4XmAs4Sv4wClSZbVGxarr1xUGDxTEXBaO1uPpGcQFw+vaBklDnuGkRW7b1hvxeECEID7xoEdM/U9aacdQNd6DPUMz1l/UlqrtdY3YLG4ko87s2xBOolr4GnZozUULOVDhpKyazob78VQ9Ne98giFI78JrMv+xYikZGmKfFc8Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jFsW0pOb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jFsW0pOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766561429;
	bh=pV4PNUpZZSOyiYrDnysupRUAFKualbvc4cyd7FmaVdk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jFsW0pObzUo+yW4CAXx/y0sJgnzwCU9npOv5eO8a0h/JozBErOTft9yx5BKZlbP3A
	 WpwivJD8crBCjWvfB58AayPK8svC3yPW9AZZmG2qlMxv72oHfOXDC9CjeZ3+/aXb+K
	 0lxqcPUmEDw4T1bQgZGhb/J8d7xexaYT6B7yOAQBmbuw1XIv1xFWEd8/qp1IiSH8u9
	 hwOv4K5rmUp3sPaqlDh3Jbmfq9jovtiBKiiScFA8ZHer58c/K1v3S4OdXgmUMthLBL
	 y0Od/x7ozkk6xLGdZ2ZSEjIwAMl4lyatDBxCZXBtA9WjEcgBn6PU1GYcfviNLjaBO7
	 3CMgX4uXAdtXQ==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531:0:f337:3245:2545:b505])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1716F17E0CA3;
	Wed, 24 Dec 2025 08:30:29 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id BAA4511A3A2D5; Wed, 24 Dec 2025 08:30:28 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Wed, 24 Dec 2025 08:30:10 +0100
Subject: [PATCH 1/4] clk: mediatek: clk-mux: Add helper for muxes without
 UPD
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mtk-not-a-gate-v1-1-d4667e3b7856@collabora.com>
References: <20251224-mtk-not-a-gate-v1-0-d4667e3b7856@collabora.com>
In-Reply-To: <20251224-mtk-not-a-gate-v1-0-d4667e3b7856@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jianhui Zhao <zhaojh329@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
 Sam Shih <sam.shih@mediatek.com>, Ryder Lee <ryder.lee@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3

Not all muxes have an update register. This is already handled by the
driver when the upd_shift field is set negative. Add a small helper
macro to declare these muxes, without having to pass a bunch of -1's.

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
 drivers/clk/mediatek/clk-mux.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 151e56dcf884..1a385cdd00d0 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -126,6 +126,13 @@ extern const struct clk_ops mtk_mux_gate_hwv_fenc_clr_set_upd_ops;
 			0, _upd_ofs, _upd, CLK_SET_RATE_PARENT,		\
 			mtk_mux_clr_set_upd_ops)
 
+#define MUX_CLR_SET(_id, _name, _parents, _mux_ofs,			\
+		    _mux_set_ofs, _mux_clr_ofs, _shift, _width)	\
+		GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,	\
+			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
+			0, 0, -1, CLK_SET_RATE_PARENT,		\
+			mtk_mux_clr_set_upd_ops)
+
 #define MUX_GATE_HWV_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents,			\
 				_mux_ofs, _mux_set_ofs, _mux_clr_ofs,			\
 				_hwv_sta_ofs, _hwv_set_ofs, _hwv_clr_ofs,		\

-- 
2.51.0

