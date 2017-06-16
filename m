Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1497642590.3086.55.camel@baylibre.com>
Subject: [GIT PULL] Amlogic clock driver updates for 4.13 - 2nd batch
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	 <mturquette@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "open
 list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin
 Hilman <khilman@baylibre.com>
Date: Fri, 16 Jun 2017 21:49:50 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Dear clock maintainers,

Below is a request to pull a 2nd batch of Amlogic clock driver updates for this
cycle. It is based on our previous PR. Stephen, I checked with the "const" patch
you have applied directly to clk-next and It should merge nicely with it.

Cheers

The following changes since commit 14c735c8e3082714e3d5fa91843692a9c871cebe:

  clk: meson-gxbb: Add EE 32K Clock for CEC (2017-05-29 12:34:23 +0000)

are available in the git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-for-4.13-2

for you to fetch changes up to 215c80a7d65312911ca7b08d42b05652e27eed5f:

  clk: meson: gxbb: add all clk81 parents (2017-06-16 18:51:42 +0000)

----------------------------------------------------------------
* Expose more clock gate on meson8 (SAR ADC, RNG, USB, SDIO, ETH)
* Add new compatible to the meson8 clock controller for meson8b
* Add missing parents to gxbb clk81

----------------------------------------------------------------
Jerome Brunet (2):
      Merge branch 'next/headers' into next/drivers
      clk: meson: gxbb: add all clk81 parents

Martin Blumenstingl (6):
      clk: meson8b: export the SAR ADC clocks
      clk: meson8b: export the SDIO clock
      clk: meson8b: export the gate clock for the HW random number generator
      clk: meson8b: export the USB clocks
      clk: meson8b: export the ethernet gate clock
      clk: meson: meson8b: add compatibles for Meson8 and Meson8m2

 .../bindings/clock/amlogic,meson8b-clkc.txt          | 11 +++++++----
 drivers/clk/meson/Kconfig                            |  6 +++---
 drivers/clk/meson/gxbb.c                             | 13 ++++++++-----
 drivers/clk/meson/meson8b.c                          |  5 ++++-
 drivers/clk/meson/meson8b.h                          | 20 ++++++++++----------
 include/dt-bindings/clock/meson8b-clkc.h             | 10 ++++++++++
 6 files changed, 42 insertions(+), 23 deletions(-)
