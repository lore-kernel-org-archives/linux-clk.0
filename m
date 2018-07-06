Return-Path: <daniel@zonque.org>
From: Daniel Mack <daniel@zonque.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	Daniel Mack <daniel@zonque.org>
Subject: [PATCH v5 0/1] clk: Add driver for MAX9485
Date: Fri,  6 Jul 2018 20:53:02 +0200
Message-Id: <20180706185303.27936-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

This is v5 of the driver for Maxim's MAX9485 programmable audio clock
generator.

v4 → v5:
* Removed license boilerplate as we have an SPDX header
* Moved initial register read from recalc_rate() to probe()
* Changed Kconfig prompt text
* Dropped patch to add binding as it has already been applied

v3 → v4:
* Rebased to 4.18-rc1

v2 → v3:

* Addressed a lot of issues pointed out by Stephen Boyd:
  * Dropped local register caching
  * Implement own OF clk_hw getter in favor of the onecell helper
  * Implemented recalc_rate() properly by reading from the hardware
  * Dropped input clock frequency validation
  * Style issues

* Fixed a gpio line handling bug in resume
* Added Rob's Revied-by to 1/2

v1 → v2:

* Now served as two patches, one for the DT bits, and one for the actual
  implementation. The DT bits are put in the 1st patch because the
  implementation depends on the shared header file.

* Added support for suspend/resume

Daniel Mack (1):
  clk: Add driver for MAX9485

 drivers/clk/Kconfig       |   6 +
 drivers/clk/Makefile      |   1 +
 drivers/clk/clk-max9485.c | 385 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 392 insertions(+)
 create mode 100644 drivers/clk/clk-max9485.c

-- 
2.17.1
