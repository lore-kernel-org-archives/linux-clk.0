Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com> 
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org ,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] Amlogic clock header updates for v4.12
Date: Tue, 04 Apr 2017 16:14:03 -0700
Message-ID: <m2tw637olg.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Steven, Mike,

In order to restructure things so we only have clock headers/bindings in
the dependencies needed by the Amlogic DT patches, I've split up the
clock branch you've collected for us into a headers part and a drivers
part.   Here's a pull req for the headers.

Kevin

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-clk-headers

for you to fetch changes up to 92c2cc5d5566cb84e4f4a683e73c3516882c2ee8:

  dt-bindings: clock: gxbb-clkc: Add GXL compatible variant (2017-04-04 11:00:07 -0700)

----------------------------------------------------------------
Amlogic clock headers and DT binding updates for v4.12
- add clocks for I2S and Mali

----------------------------------------------------------------
Jerome Brunet (1):
      dt-bindings: clk: gxbb: expose i2s output clock gates

Neil Armstrong (3):
      clk: meson-gxbb: Add MALI clock IDS
      clk: meson-gxbb: Expose GP0 dt-bindings clock id
      dt-bindings: clock: gxbb-clkc: Add GXL compatible variant

 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt |  3 ++-
 drivers/clk/meson/gxbb.h                                      | 21 ++++++++++++++-------
 include/dt-bindings/clock/gxbb-clkc.h                         | 11 +++++++++++
 3 files changed, 27 insertions(+), 8 deletions(-)
