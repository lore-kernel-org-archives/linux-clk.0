Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668100;
	b=hLeoVxjdlZ9d8tSKE8xVy4q+Hl1BXj/K3AYH0uLbscdlNy9yH4LaezPBUAD8lwU+bp91
	 XiBJVCKVZTyvUIFfx3nQX0KUUoqjdMVtQeTsrvzlCKJiwHSWGnVfuoJ3Nf3Q1ZllUZflY
	 1Hgbwa/YwLKLqsxnxmmgaTLlZOqa88o5Ca/lxGu6Lwgzv2bR3AVVe1v9v7T/J1jQa2FyA
	 2NgHtAUicS+tAMZg1o61hMEyJfT+D4Z/wgczqJ08pEKrphZOzwjNev8zwaZcJf54fK9+V
	 S1gvXvongpjydp6feY5CBsrBEkBzJzDMqHQH10jf3WMzGMFhEFJ6hRD1iYYNxQCc4uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668100;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BiKncMYBCZs5gJx1ophytALHk5lCtmyYZ4hUu5vrHW4=;
	b=YamLMzfeT7wnH8Uvc8VNPRdBaCmt+iMDIlqHCfKLZpjBOWCYD8F246BZNkaoPewadllG
	 qZNN+aSVync1JgTLjEicNelOQFwbXiwNU71ABSng4G9bz35sTwTqLh8jCusfIR2PS/gIl
	 pZGTuNVOzxUGYfGYuWQ/cDb6Ls0GGnNDEilMQxthlimHmmWRcn9wIn3rL1UFjb8dwPA8g
	 rOL9CfcGnsIhDy5mhgd4tGJ3G7KzfEjEa6WjPq42t8dhQeAbFrC+e0JorYpxa4cioiBYQ
	 ODF9SsfxjfLOlATgVd4CUsZLhYZxsmbtmJ0RqnCO91G0RxWMofRsf41UOy6vFYy91Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93993606A33F;
	Sat, 14 Nov 2026 14:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93993606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSF9Y-000000005HI-2cWW;
	Sat, 14 Nov 2026 14:54:52 +0000
Date: Sat, 14 Nov 2026 14:54:49 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: nicolas.dufresne@collabora.com, detlev.casanova@collabora.com,
	paulk@sys-base.io, ezequiel@vanguardiasur.com.ar
Subject: [RFC PATCH 2/6] clk: rockchip: rv1126: Add PD_VEPU clock tree
Message-ID: <f06eeff485ae8cf4f0a2b73352ab1234017a6ca9.1794666330.git.daniel@makrotopia.org>
References: <cover.1794666330.git.daniel@makrotopia.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794666330.git.daniel@makrotopia.org>

The video encoder power domain of the RV1126 contains the RKVENC
encoder. Add its AXI and AHB bus clocks, the AXI and AHB clocks of the
encoder and the encoder core clock, together with the two interconnect
gates that stay enabled and the two parent selections of the bus and
core clocks.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/rockchip/clk-rv1126.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rv1126.c b/drivers/clk/rockchip/clk-rv1126.c
index f35bc9670c274..111595c9d990d 100644
--- a/drivers/clk/rockchip/clk-rv1126.c
+++ b/drivers/clk/rockchip/clk-rv1126.c
@@ -176,6 +176,8 @@ PNAME(mux_i2s2_out2io_p)		= { "mclk_i2s2", "xin12m" };
 PNAME(mux_gpll_cpll_xin24m_p)		= { "gpll", "cpll", "xin24m" };
 PNAME(mux_audpwm_p)			= { "sclk_audpwm_div", "sclk_audpwm_fracdiv", "xin24m" };
 PNAME(mux_dclk_vop_p)			= { "dclk_vop_div", "dclk_vop_fracdiv", "xin24m" };
+PNAME(mux_cpll_gpll_hpll_p) = { "cpll", "gpll", "hpll" };
+PNAME(mux_cpll_hpll_gpll_p) = { "cpll", "hpll", "gpll" };
 PNAME(mux_usb480m_gpll_p)		= { "usb480m", "gpll" };
 PNAME(clk_gmac_src_m0_p)		= { "clk_gmac_div", "clk_gmac_rgmii_m0" };
 PNAME(clk_gmac_src_m1_p)		= { "clk_gmac_div", "clk_gmac_rgmii_m1" };
@@ -719,6 +721,25 @@ static struct rockchip_clk_branch rv1126_clk_branches[] __initdata = {
 			RV1126_CLKSEL_CON(72), 8, 1, MFLAGS, 0, 7, DFLAGS,
 			RV1126_CLKGATE_CON(11), 1, GFLAGS),
 
+	/* PD_VEPU */
+	COMPOSITE(ACLK_PDVEPU, "aclk_pdvepu", mux_cpll_hpll_gpll_p, 0,
+		  RV1126_CLKSEL_CON(40), 6, 2, MFLAGS, 0, 5, DFLAGS,
+		  RV1126_CLKGATE_CON(12), 0, GFLAGS),
+	COMPOSITE_NOMUX(HCLK_PDVEPU, "hclk_pdvepu", "aclk_pdvepu", 0,
+			RV1126_CLKSEL_CON(41), 0, 5, DFLAGS,
+			RV1126_CLKGATE_CON(12), 2, GFLAGS),
+	GATE(ACLK_VENC, "aclk_venc", "aclk_pdvepu", 0,
+	     RV1126_CLKGATE_CON(12), 5, GFLAGS),
+	GATE(HCLK_VENC, "hclk_venc", "hclk_pdvepu", 0,
+	     RV1126_CLKGATE_CON(12), 6, GFLAGS),
+	COMPOSITE(CLK_VENC_CORE, "clk_venc_core", mux_cpll_gpll_hpll_p, 0,
+		  RV1126_CLKSEL_CON(40), 14, 2, MFLAGS, 8, 5, DFLAGS,
+		  RV1126_CLKGATE_CON(12), 1, GFLAGS),
+	GATE(0, "aclk_pdvepu_niu", "aclk_pdvepu", CLK_IGNORE_UNUSED,
+	     RV1126_CLKGATE_CON(12), 3, GFLAGS),
+	GATE(0, "hclk_pdvepu_niu", "hclk_pdvepu", CLK_IGNORE_UNUSED,
+	     RV1126_CLKGATE_CON(12), 4, GFLAGS),
+
 	/*
 	 * Clock-Architecture Diagram 9
 	 */
-- 
2.56.0
