Return-Path: <linux-amlogic-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Neil Armstrong <narmstrong@baylibre.com>
To: sboyd@codeaurora.org,
	khilman@baylibre.com,
	carlo@caione.org
Subject: [PATCH 0/2] meson-gxbb: Add mali-450 support
Date: Fri, 10 Feb 2017 11:04:42 +0100
Message-Id: <1486721084-1383-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Since the merge of the Mali dt bindings at [1], add support for Mali clocks
and DT node.

The Mali is clocked by two identical clock paths behind a glitch free mux
to safely change frequency while running.
So these clocks must be added to the meson-gxbb clock controller.

[1] http://lkml.kernel.org/r/b098c4fa9fce88361cca20417978734d0e1b5cca.1485939041.git-series.maxime.ripard@free-electrons.com

Neil Armstrong (2):
  clk: meson-gxbb: Add MALI clocks and fix GP0 pll support
  ARM64: dts: meson-gxbb: Add Mali node

 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi |  37 +++++
 drivers/clk/meson/clk-pll.c                 |  34 ++++-
 drivers/clk/meson/clkc.h                    |   3 +
 drivers/clk/meson/gxbb.c                    | 211 +++++++++++++++++++++++++++-
 drivers/clk/meson/gxbb.h                    |   7 +-
 include/dt-bindings/clock/gxbb-clkc.h       |   4 +
 6 files changed, 282 insertions(+), 14 deletions(-)

-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
