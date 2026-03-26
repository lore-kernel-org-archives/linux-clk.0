Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEFC336883;
	Thu, 26 Mar 2026 05:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501783; cv=none; b=rEFzU3iKN/LF8rXEiXE8SNyaGKgMyVcboc9z0aWRVMrbHYxSh0I0PfH3JwtzyQoOB1fPCDzlBiaVDOIIfKGMW0W8Ef6Vkidy6XNg/1e1AL7AWbh6IXJYRsMr8J0XBZjVUNvy6wwot42caf6u1nF5mBBvi73yv0fcjRzL0T5k9Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501783; c=relaxed/simple;
	bh=oEHc9nj3Kd+zcyYcuHLWyWHyNNOx6le5ZHMBt+98rCE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WK82e0tUZZ84mwmfyrb993cTPINK6dsRU01kQ/bRZYSIqtSRxXKlmpoYk/21JTeH/IeUongE6NsdzEZQPOJGy822cRC7+SY0+nFq5BE5VeSupQSfg2DWy9YXOJwCwsevbP2QH79ZUluJgg1E8wu3KY/ZdBzx2oUP5qvWTx+/3e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1w5cyQ-000000006qC-3Tq7;
	Thu, 26 Mar 2026 05:09:38 +0000
Date: Thu, 26 Mar 2026 05:09:35 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Laura Nao <laura.nao@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Ikjoon Jang <ikjn@chromium.org>, Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/3] clk: mediatek: add MUX_CLR_SET macro
Message-ID: <65e504ac2c2d19b4baba6b79a241788220b19b34.1774499536.git.daniel@makrotopia.org>
References: <cover.1774499536.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774499536.git.daniel@makrotopia.org>

Some MediaTek SoCs (e.g. MT7988) define infra muxes that have neither
a clock gate nor an update register.

Add a MUX_CLR_SET convenience macro that takes only the mux register
offsets, bit shift, and width, hardcoding upd_ofs = 0 and
upd_shift = -1 so callers cannot accidentally pass bogus sentinel
values to wrongly-typed fields.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/clk-mux.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 151e56dcf8842..8a5d6aca43aa9 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -126,6 +126,11 @@ extern const struct clk_ops mtk_mux_gate_hwv_fenc_clr_set_upd_ops;
 			0, _upd_ofs, _upd, CLK_SET_RATE_PARENT,		\
 			mtk_mux_clr_set_upd_ops)
 
+#define MUX_CLR_SET(_id, _name, _parents, _mux_ofs,			\
+		    _mux_set_ofs, _mux_clr_ofs, _shift, _width)		\
+		    MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,	\
+		    _mux_set_ofs, _mux_clr_ofs, _shift, _width, 0, -1)
+
 #define MUX_GATE_HWV_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents,			\
 				_mux_ofs, _mux_set_ofs, _mux_clr_ofs,			\
 				_hwv_sta_ofs, _hwv_set_ofs, _hwv_clr_ofs,		\
-- 
2.53.0
