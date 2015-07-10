Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Gerhard Sittig <gsi@denx.de>,
	Scott Wood <scottwood@freescale.com>,
	Anatolij Gustschin <agust@denx.de>,
	=?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Ken Xue <Ken.Xue@amd.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Luc Verhaegen <libv@skynet.be>,
	Hans de Goede <hdegoede@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	David Herrmann <dh.herrmann@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ti.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/7] Remove clk.h from clk-provider.h (non-clk drivers part)
Date: Fri, 10 Jul 2015 16:03:22 -0700
Message-Id: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This is the second set in a series of patches that removes
clk.h from clk-provider.h. This allows us to clearly see what
provider drivers are using the consumer API (clk.h) by
checking the includes. Currently clk.h is included by
clk-provider.h even though it doesn't need to so quite a few
clk provider drivers are relying on the implicit include.

Cc: Gerhard Sittig <gsi@denx.de>
Cc: Scott Wood <scottwood@freescale.com>
Cc: Anatolij Gustschin <agust@denx.de>
Cc: Sören Brinkmann <soren.brinkmann@xilinx.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Mark Brown <broonie@kernel.org>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ken Xue <Ken.Xue@amd.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: Luc Verhaegen <libv@skynet.be>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: David Herrmann <dh.herrmann@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>

Stephen Boyd (7):
  powerpc/512x: clk: Include clk.h
  staging: clocking-wizard: Include clk.h
  spi: spi-pxa2xx: Remove clk.h include
  clocksource: cadence_ttc: Remove clk-provider.h include
  ACPI: Remove clk.h include
  simplefb: Include clk.h
  lib/vsprintf.c: Include clk.h

 arch/powerpc/platforms/512x/clock-commonclk.c           | 1 +
 drivers/acpi/acpi_apd.c                                 | 1 -
 drivers/acpi/acpi_lpss.c                                | 1 -
 drivers/clocksource/cadence_ttc_timer.c                 | 1 -
 drivers/spi/spi-pxa2xx-pci.c                            | 1 -
 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c | 1 +
 drivers/video/fbdev/simplefb.c                          | 1 +
 lib/vsprintf.c                                          | 1 +
 8 files changed, 4 insertions(+), 4 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

