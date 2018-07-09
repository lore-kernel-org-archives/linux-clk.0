Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1531140923.2708.19.camel@baylibre.com>
Subject: [GIT PULL]  clk: meson: updates for v4.19
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>, Neil Armstrong
 <narmstrong@baylibre.com>
Date: Mon, 09 Jul 2018 14:55:23 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Dear clock maintainers,

Below is a request to pull a first round of Amlogic  clock updates for
v4.19. It is based on our previous fixes PR (meson-clk-fixes-4.18-1) to
avoid conflicts while removing the audio divider driver.

Also, we had to pull your 'clk-core-duty-cycle' branch because the audio
sclk divider driver implements duty cycle operation. This explains the
changes reported in CCF core files in the summary below. 

Thanks for pulling.
Cheers

Jerome

The following changes since commit 7813c14c9475dbebcd7f41bd498426d01255acf9:

  clk: meson: audio-divider is one based (2018-06-21 10:10:50 +0200)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-4.19-1

for you to fetch changes up to 7df533a7e3d2216e860ecf147ae8cee49bf133e9:

  clk: meson: add gen_clk (2018-07-09 13:49:31 +0200)

----------------------------------------------------------------
First round of updates for meson clocks targeted at v4.19

* Remove legacy register access (finish moving to syscon)
* Clean up configuration flags
* Add axg PCIe clocks
* Add GEN CLK on gxbb, gxl and axg
* Remove clk_audio_divider driver
* Add axg audio clock controller

----------------------------------------------------------------
Jerome Brunet (15):
      clk: add duty cycle support
      dt-bindings: clock: add meson axg audio clock controller bindings
      clk: meson: expose GEN_CLK clkid
      clk: meson: remove obsolete register access
      clk: meson: clean-up meson clock configuration
      Merge branch 'next/dt' into next/drivers
      clk: meson: add clk-phase clock driver
      clk: meson: add triple phase clock driver
      Merge remote-tracking branch 'clk/clk-core-duty-cycle' into next/drivers
      clk: meson: add axg audio sclk divider driver
      clk: meson: axg: add the audio clock controller driver
      clk: meson: stop rate propagation for audio clocks
      clk: meson: remove unused clk-audio-divider driver
      clk: meson: gxbb: remove HHI_GEN_CLK_CTNL duplicate definition
      clk: meson: add gen_clk

Yixun Lan (2):
      clk: meson-axg: add pcie and mipi clock bindings
      clk: meson-axg: add clocks required by pcie driver

 .../bindings/clock/amlogic,axg-audio-clkc.txt      |  56 ++
 drivers/clk/clk.c                                  | 199 ++++-
 drivers/clk/meson/Kconfig                          |  28 +-
 drivers/clk/meson/Makefile                         |   4 +-
 drivers/clk/meson/axg-audio.c                      | 845 +++++++++++++++++++++
 drivers/clk/meson/axg-audio.h                      | 127 ++++
 drivers/clk/meson/axg.c                            | 244 +++++-
 drivers/clk/meson/axg.h                            |   8 +-
 drivers/clk/meson/clk-audio-divider.c              | 110 ---
 drivers/clk/meson/clk-phase.c                      |  63 ++
 drivers/clk/meson/clk-triphase.c                   |  68 ++
 drivers/clk/meson/clkc-audio.h                     |  28 +
 drivers/clk/meson/clkc.h                           |  11 +-
 drivers/clk/meson/gxbb.c                           | 118 +--
 drivers/clk/meson/gxbb.h                           |   5 +-
 drivers/clk/meson/sclk-div.c                       | 243 ++++++
 include/dt-bindings/clock/axg-audio-clkc.h         |  94 +++
 include/dt-bindings/clock/axg-clkc.h               |   4 +
 include/dt-bindings/clock/gxbb-clkc.h              |   1 +
 include/linux/clk-provider.h                       |  26 +
 include/linux/clk.h                                |  33 +
 include/trace/events/clk.h                         |  36 +
 22 files changed, 2140 insertions(+), 211 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
 create mode 100644 drivers/clk/meson/axg-audio.c
 create mode 100644 drivers/clk/meson/axg-audio.h
 delete mode 100644 drivers/clk/meson/clk-audio-divider.c
 create mode 100644 drivers/clk/meson/clk-phase.c
 create mode 100644 drivers/clk/meson/clk-triphase.c
 create mode 100644 drivers/clk/meson/clkc-audio.h
 create mode 100644 drivers/clk/meson/sclk-div.c
 create mode 100644 include/dt-bindings/clock/axg-audio-clkc.h
