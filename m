Return-Path: <p.zabel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	James Liao <jamesjj.liao@mediatek.com>,
	Daniel Kurtz <djkurtz@chromium.org>,
	"Joe.C" <yingjoe.chen@mediatek.com>,
	kernel@pengutronix.de,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/2] MT8173 clock changes for DRM
Date: Thu, 19 Nov 2015 16:59:46 +0100
Message-Id: <1447948788-21105-1-git-send-email-p.zabel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

Hi,

I have sent these two as part of the MT8173 DRM/KMS driver patch series [1],
but not yet to the clock list. I'd be happy to get some review and
suggestions on how to best merge them, given the dependency of the DRM/KMS
driver on these changes.

[1] http://www.spinics.net/lists/dri-devel/msg94500.html

best regards
Philipp

Philipp Zabel (2):
  clk: mediatek: make dpi0_sel and hdmi_sel not propagate rate changes
  clk: mediatek: Add hdmi_ref HDMI PHY PLL reference clock output

 drivers/clk/mediatek/clk-mt8173.c      | 9 +++++++--
 drivers/clk/mediatek/clk-mtk.h         | 7 +++++--
 include/dt-bindings/clock/mt8173-clk.h | 3 ++-
 3 files changed, 14 insertions(+), 5 deletions(-)

-- 
2.6.2
