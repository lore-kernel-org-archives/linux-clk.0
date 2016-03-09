Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.139]:40342 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751279AbcCICoR (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 8 Mar 2016 21:44:17 -0500
From: Xing Zheng <zhengxing@rock-chips.com>
To: heiko@sntech.de
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, huangtao@rock-chips.com,
	jay.xu@rock-chips.com, elaine.zhang@rock-chips.com,
	dianders@chromium.org, Xing Zheng <zhengxing@rock-chips.com>
Subject: [PATCH v3 6/7] clk: rockchip: add a COMPOSITE_FRACMUX_NOGATE type
Date: Wed,  9 Mar 2016 10:43:31 +0800
Message-Id: <1457491411-31114-1-git-send-email-zhengxing@rock-chips.com>
In-Reply-To: <1457491027-30936-1-git-send-email-zhengxing@rock-chips.com>
References: <1457491027-30936-1-git-send-email-zhengxing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Because there are some frac clock mux nodes don't need gate node on
the RK3399.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---

Changes in v3: None
Changes in v2: None

 drivers/clk/rockchip/clk.h |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 7526f9a..75dc30e 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -451,6 +451,22 @@ struct rockchip_clk_branch {
 		.child		= ch,				\
 	}
 
+#define COMPOSITE_FRACMUX_NOGATE(_id, cname, pname, f, mo, df, ch) \
+	{							\
+		.id		= _id,				\
+		.branch_type	= branch_fraction_divider,	\
+		.name		= cname,			\
+		.parent_names	= (const char *[]){ pname },	\
+		.num_parents	= 1,				\
+		.flags		= f,				\
+		.muxdiv_offset	= mo,				\
+		.div_shift	= 16,				\
+		.div_width	= 16,				\
+		.div_flags	= df,				\
+		.gate_offset	= -1,				\
+		.child		= ch,				\
+	}
+
 #define MUX(_id, cname, pnames, f, o, s, w, mf)			\
 	{							\
 		.id		= _id,				\
-- 
1.7.9.5


