Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp5-g21.free.fr ([212.27.42.5]:29666 "EHLO smtp5-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753717AbcC3Rnj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Wed, 30 Mar 2016 13:43:39 -0400
Message-Id: <cover.1459358017.git.moinejf@free.fr>
From: Jean-Francois Moine <moinejf@free.fr>
Date: Wed, 30 Mar 2016 19:13:37 +0200
Subject: [PATCH 0/3] clk: sunxi: Add the clocks used for audio/video on sun8i
To: Emilio Lopez <emilio@elopez.com.ar>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patch series replaces a part of a previous series about
"Add a DRM display driver to the Allwinner H3".

I will resubmit the H3 DRM video driver and also submit the H3
components for audio on HDMI as soon as the HDMI PHY of the H3
(and A64) will be known.

Changes:
- simplify and use the 'recalc' callback (Chen-Yu Tsai)
- add a SoC type in the compatibles (Maxime Ripard)
- audio PLL added

Jean-Francois Moine (3):
  clk: sunxi: Add sun6i/8i display support
  clk: sunxi: Add sun6i/8i PLL video support
  clk: sunxi: Add sun8i PLL audio support

 Documentation/devicetree/bindings/clock/sunxi.txt |   3 +
 drivers/clk/sunxi/clk-sunxi.c                     | 151 ++++++++++++++++++++++
 2 files changed, 154 insertions(+)

-- 
2.8.0

