Return-Path: <paul@crapouillou.net>
From: Paul Cercueil <paul@crapouillou.net>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jason Cooper <jason@lakedaemon.net>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Lee Jones <lee.jones@linaro.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/6] Ingenic JZ47xx TCU drivers
Date: Fri, 29 Dec 2017 13:59:36 +0100
Message-Id: <20171229125942.27305-1-paul@crapouillou.net>
List-ID: <linux-clk.vger.kernel.org>

Hi,

This patch set introduces three new drivers, which together control the
TCU (Timer/Counter Unit) of Ingenic JZ47xx SoCs.

The ingenic-tcu-intc driver will demultiplex the TCU IRQ interrupts; the 
ingenic-tcu-clocks driver will handle the TCU clocks (enable/disable,
reparenting, reclocking); and the ingenic-tcu driver provides a
clocksource and timers to the system.

The purpose of this patch series is to eventually completely remove the
non-standard platform and board code that handles timers for the Ingenic
SoCs. Before this can be achieved, the watchdog and PWM drivers (already
upstream) will be modified to use the same regmap as the rest of the TCU
drivers.

Thanks,
-Paul
