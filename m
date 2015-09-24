Return-Path: <newchief@king.net.pl>
From: Paul Osmialowski <newchief@king.net.pl>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Russell King <linux@arm.linux.org.uk>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Paul Osmialowski <pawelo@king.net.pl>
Subject: [PATCH 0/1] add devm_of_clk_get() and devm_of_clk_get_by_name() functions
Date: Thu, 24 Sep 2015 10:03:27 +0200
Message-Id: <1443081808-19688-1-git-send-email-newchief@king.net.pl>
List-ID: <linux-clk.vger.kernel.org>

From: Paul Osmialowski <pawelo@king.net.pl>

While working on my pinctrl driver I've found lack of devres compatible
equivalent for of_clk_get() function. I'd like to use it for the following
(incomplete) piece of device tree configuration:

pinctrl: pinctrl {
	compatible = "fsl,kinetis-pinctrl";
	#address-cells = <1>;
	#size-cells = <1>;
	ranges;

	port_a@40049000 {
		compatible = "fsl,kinetis-pin-bank";
		reg = <0x40049000 0x1000>;
		clocks = <&sim SIM_CLK_SCGC5_PORTA>;
	};

	port_b@4004a000 {
		compatible = "fsl,kinetis-pin-bank";
		reg = <0x4004a000 0x1000>;
		clocks = <&sim SIM_CLK_SCGC5_PORTB>;
	};
...
};

In my pinconf-generic compatible fsl,kinetis-pinctrl driver, I'm iterating
over fsl,kinetis-pin-bank nodes using for_each_child_of_node(dev->of_node,
child) along with of_match_node() in order to grab resources (I/O base
address, clock gate).

Normally, I'd have to use of_clk_get() on each pin bank device_node and
then worry about proper resource release myself.

IMHO using devres infrastructure for this is far better. This patch adds
missing functions needed to do it that way.

Paul Osmialowski (1):
  clk: add devm_of_clk_get() and devm_of_clk_get_by_name() functions

 drivers/clk/clk-devres.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk.h      | 20 ++++++++++++++++++++
 2 files changed, 66 insertions(+)

-- 
2.4.9
