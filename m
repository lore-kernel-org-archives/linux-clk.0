Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Xing Zheng <zhengxing@rock-chips.com>
To: linux-rockchip@lists.infradead.org
Cc: keescook@google.com, leozwang@google.com, heiko@sntech.de,
	Xing Zheng <zhengxing@rock-chips.com>,
	Russell King <linux@arm.linux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND RFC PATCH 0/2] Add 100MHz integer multiples of cpu freq table for the RK3036
Date: Fri,  8 Jan 2016 19:31:36 +0800
Message-Id: <1452252698-16765-1-git-send-email-zhengxing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


Hi,
  We need the cpu changing freqs capability, and considering that emac
ref which is need 50MHz might is under the APLL, meanwhile, we don't
need too many freqs because it may spend more time to find the correct
freq.
  Therefore, we should add 100MHz integer multiples cpu freqs for
emac.


Xing Zheng (2):
  clk: rockchip: rk3036: Add to 100MHz integer multiples of cpu freq
    table
  ARM: dts: rockchip: Update the cpu freqs table

 arch/arm/boot/dts/rk3036.dtsi     |   13 ++++++++++++-
 drivers/clk/rockchip/clk-rk3036.c |   27 ++++++++++++++++++++++++---
 2 files changed, 36 insertions(+), 4 deletions(-)

-- 
1.7.9.5
