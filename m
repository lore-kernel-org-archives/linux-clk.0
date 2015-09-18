Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] ARM: sunxi: Introduce CHIP support
Date: Fri, 18 Sep 2015 10:48:45 +0200
Message-Id: <1442566130-3497-1-git-send-email-maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, linux-clk@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

Here is a serie introducing the support for the Allwinner R8 and the
Nextthing's CHIP.

Support is almost complete for the CHIP itself, the only missing part
for now is the WiFi chip that needs to be powered through two combined
regulators (AXP209's LDO3 and LDO4). The audio codec is also missing
since it's not already enabled in the DT.

Both these features will be addressed eventually.

Let me know what you think,
Maxime

Maxime Ripard (5):
  ARM: sunxi: Add R8 support
  ARM: sun5i: Add R8 DTSI
  ARM: sun5i: dt: Move uart3 pinctrl node to common DTSI
  ARM: sun5i: dt: Add UART3 CTS and RTS pins
  ARM: sun5i: Add C.H.I.P DTS

 arch/arm/boot/dts/Makefile          |   3 +-
 arch/arm/boot/dts/sun5i-a10s.dtsi   |   7 -
 arch/arm/boot/dts/sun5i-r8-chip.dts | 261 ++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/sun5i-r8.dtsi     |  61 +++++++++
 arch/arm/boot/dts/sun5i.dtsi        |  14 ++
 arch/arm/mach-sunxi/sunxi.c         |   3 +-
 drivers/clk/sunxi/clk-sunxi.c       |   1 +
 7 files changed, 341 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun5i-r8-chip.dts
 create mode 100644 arch/arm/boot/dts/sun5i-r8.dtsi

-- 
2.5.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
