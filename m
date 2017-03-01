Return-Path: <linux-amlogic-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Neil Armstrong <narmstrong@baylibre.com>
To: sboyd@codeaurora.org,
	khilman@baylibre.com,
	carlo@caione.org
Subject: [PATCH v2 0/3] meson-gx: Add mali-450 support
Date: Wed,  1 Mar 2017 11:46:01 +0100
Message-Id: <1488365164-22861-1-git-send-email-narmstrong@baylibre.com>
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

Changes since v1 at [2] :
 - Remove GP0 fixes, this will pushed later, for base frequency it can depend on fclk_div3
 - Add GXL support
 - rebase on clk-next and jbrunet's patchset at [3] and [4]
 - get rid of composite clocks, this adds more clocks IDs and exposes 2 more clocks

[4] http://lkml.kernel.org/r/20170228093016.5624-1-jbrunet@baylibre.com
[3] http://lkml.kernel.org/r/20170228133002.17894-1-jbrunet@baylibre.com
[2] http://lkml.kernel.org/r/1486721084-1383-1-git-send-email-narmstrong@baylibre.com
[1] http://lkml.kernel.org/r/b098c4fa9fce88361cca20417978734d0e1b5cca.1485939041.git-series.maxime.ripard@free-electrons.com

Neil Armstrong (3):
  clk: meson-gxbb: Add MALI clock IDS
  clk: meson-gxbb: Add MALI clocks
  ARM64: dts: meson-gx: Add MALI nodes for GXBB and GXL

 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi      |  37 ++++++
 arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi  |  43 +++++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d.dtsi |   1 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x.dtsi |   1 +
 drivers/clk/meson/gxbb.c                         | 139 +++++++++++++++++++++++
 drivers/clk/meson/gxbb.h                         |   9 +-
 include/dt-bindings/clock/gxbb-clkc.h            |   5 +
 7 files changed, 234 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi

-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
