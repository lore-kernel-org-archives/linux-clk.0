Return-Path: <phil@raspberrypi.org>
From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v2 0/4] Add bcm2835aux interrupt controller
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper
 <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Message-ID: <4ceb6c92-f752-180e-6a6e-a94dcd120737@raspberrypi.org>
Date: Mon, 12 Jun 2017 15:25:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Devices in the BCM2835 AUX block share a common interrupt line, with a
register indicating which devices have active IRQs. Expose this as a
nested interrupt controller to avoid IRQ sharing problems (easily
observed if UART1 and SPI1/2 are enabled simultaneously).

This patch set is complicated by the fact that the DT node for the AUX
clock controller includes the AUXIRQ register needed by this driver.
Patch 1 lays the groundwork by allowing this overlap and preparing for
a future DT change that removes it.

Changes in v2:
* Add DT bindings and header file for bcm2835-aux-intc.
* Split the interrupt-controller functionality into a dedicated irqchip
  driver with a dedicated DT node.
* Remove mask tracking from the intc driver, so that all interrupts
  (including spurious ones) are submitted to the IRQ framework.
* Replace hard-coded masks with BIT macro in the intc driver.
* Prepare the AUX clock driver for a time when its DT node may only be
  a single word register, but until then ioremap its region without
  reserving it to permit sharing.

Phil Elwell (4):
  clk: bcm2835: More flexible IO register remapping
  dt: bindings: Add bindings for bcm2835-aux-intc
  irqchip: Add BCM2835 AUX interrupt controller
  ARM: dts: bcm283x: Add and use bcm2835-aux-intc

 .../interrupt-controller/brcm,bcm2835-aux-intc.txt |  28 ++++
 arch/arm/boot/dts/bcm283x.dtsi                     |  27 +++-
 drivers/clk/bcm/clk-bcm2835-aux.c                  |  20 ++-
 drivers/irqchip/Makefile                           |   2 +-
 drivers/irqchip/irq-bcm2835-aux.c                  | 155 +++++++++++++++++++++
 .../interrupt-controller/bcm2835-aux-intc.h        |  20 +++
 6 files changed, 243 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
 create mode 100644 drivers/irqchip/irq-bcm2835-aux.c
 create mode 100644 include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h

-- 
1.9.1
