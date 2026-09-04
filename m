Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3B049C4AD;
	Fri,  4 Sep 2026 13:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528457; cv=none; b=RnCv9lYRHKPEdBL1eLMFcAUqv8Y0wg6b4SdLxMTMUpZOtu6uRjl1pm+THy4kLI+leOmuVoJ5xY9iG2BoqwiFSolLjgbtL/azdqZN5U4JzOtVH9zletd9MxHLpuz1bD4AVY3smKAPzRIABkaHxswtp1LIbHMLB0H3U/w0k7LhBto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528457; c=relaxed/simple;
	bh=pWw26qy7m6vWZpoDIlRDxIpcJbTUr/7S55bnu+gbN54=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=s1nuS/QlY284UoZugfrd64ygRo69DeCeqXDr2g0ybrccNaQYGkjpTtx+svLTpI70SgMOSAa3XGwq/Je90cTKKCrkPBymn2qFdPY5kE41E2XJV6DC/tTKkxeFvUVDJ+0+v1+BM3uTHloMlN9oXMBrDCrwm3aDw6F6QR9oEJYwkwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZhyU5NAO; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZhyU5NAO"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260904132734euoutp0245776a4fb4810fa1f67296486441e82a~SIScylVE32055520555euoutp02i;
	Fri,  4 Sep 2026 13:27:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260904132734euoutp0245776a4fb4810fa1f67296486441e82a~SIScylVE32055520555euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788528454;
	bh=FEEhma9KKf6bG2Y1Mh24FIJOn6pXKkIG/5tepwE17H8=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=ZhyU5NAO1zkdIbRqDJqoDrq8uK/N0D9TOwv74QOox4yFIhA2gEhz0Wffm3mkKbh6G
	 WLr0uMCBKOxwwq64xgfmkRumbFtP+zE+ip6RrFnq4TGuUvL5R96cjGePIpEcqyl54P
	 O2Hv6xb/gI5bhgvvHTIUZzXiK1NXYBEbBCiERk+4=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260904132733eucas1p1a6529cb2ea97bc75c9cd190d1ba901c0~SIScahV0U0703407034eucas1p1B;
	Fri,  4 Sep 2026 13:27:33 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260904132731eusmtip147fbbb596e62f26ccd6508b9d7a9a37f~SISaXgUVm1354513545eusmtip1T;
	Fri,  4 Sep 2026 13:27:31 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 04 Sep 2026 15:27:14 +0200
Subject: [PATCH v3 13/19] clk: starfive: jh7110-vout: Allow pixel clock rate
 propagation
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-jh7110-clean-send-v3-13-484f9ae72715@samsung.com>
In-Reply-To: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,  Simona
	Vetter <simona@ffwll.ch>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,  Heiko
	Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,  Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260904132733eucas1p1a6529cb2ea97bc75c9cd190d1ba901c0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260904132733eucas1p1a6529cb2ea97bc75c9cd190d1ba901c0
X-EPHeader: CA
X-CMS-RootMailID: 20260904132733eucas1p1a6529cb2ea97bc75c9cd190d1ba901c0
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<CGME20260904132733eucas1p1a6529cb2ea97bc75c9cd190d1ba901c0@eucas1p1.samsung.com>

The dc8200_pix0 and dc8200_pix1 MUXes feed the display controller, and
the rate they carry is ultimately produced by the HDMI PHY, which
registers hdmitx0_pixelclk as a clock provider.

Add CLK_SET_RATE_PARENT to both MUXes so a rate requested on them
reaches that parent, instead of being clamped to whatever rate the
parent already happens to run at.

Co-developed-by: Dominique Belhachemi <db@domibel.de>
Signed-off-by: Dominique Belhachemi <db@domibel.de>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/clk/starfive/clk-starfive-jh7110-vout.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
index bad20d5d794a72f071b4d547b7304786a8ba9afa..aeba42cd3c44ba205ced52b1826d2d2de82ad78f 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-vout.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
@@ -40,10 +40,12 @@ static const struct jh71x0_clk_data jh7110_voutclk_data[] = {
 	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AXI, "dc8200_axi", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
 	JH71X0_GATE(JH7110_VOUTCLK_DC8200_CORE, "dc8200_core", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
 	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AHB, "dc8200_ahb", 0, JH7110_VOUTCLK_VOUT_TOP_AHB),
-	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0", 0, 2,
+	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0",
+		    CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, 2,
 		    JH7110_VOUTCLK_DC8200_PIX,
 		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),
-	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1", 0, 2,
+	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1",
+		    CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, 2,
 		    JH7110_VOUTCLK_DC8200_PIX,
 		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),
 	/* LCD */

-- 
2.34.1

