Return-Path: <paweljarosz3691@gmail.com>
Return-Path: <paweljarosz3691@gmail.com>
From: =?UTF-8?q?Pawe=C5=82=20Jarosz?= <paweljarosz3691@gmail.com>
To: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: =?UTF-8?q?Pawe=C5=82=20Jarosz?= <paweljarosz3691@gmail.com>
Subject: [PATCH 0/3] Add rk3066 tsadc device tree bindings
Date: Tue, 19 Jan 2016 13:09:18 +0100
Message-Id: <1453205361-27267-1-git-send-email-paweljarosz3691@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

This patchset adds devicetree bindings for rockchip rk3066 tsadc with needed dependencies.

Paweł Jarosz (3):
  clk: rockchip: Add new id for rk3066 tsadc clock
  clk: rockchip: add tsadc clock on rk3066
  ARM: dts: rockchip: add tsadc node

 arch/arm/boot/dts/rk3066a.dtsi                | 11 +++++++++++
 drivers/clk/rockchip/clk-rk3188.c             |  2 +-
 include/dt-bindings/clock/rk3188-cru-common.h |  1 +
 3 files changed, 13 insertions(+), 1 deletion(-)

-- 
1.9.1
