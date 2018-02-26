Return-Path: <t-kristo@ti.com>
From: Tero Kristo <t-kristo@ti.com>
To: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>
CC: <tony@atomide.com>, <linux-omap@vger.kernel.org>, <jsarha@ti.com>
Subject: [PATCH 0/3] clk: ti: add CLK_SET_RATE_PARENT support for clkctrl
Date: Mon, 26 Feb 2018 17:10:09 +0200
Message-ID: <1519657812-15605-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Hi,

This patch adds clock rate propagation support for clkctrl clocks. This
is needed on am33xx beaglebone black device at least, otherwise the
display does not work. Similar problem appears to be present on am43xx
but haven't heard of any reports of such so far, maybe Jyri can confirm
this?

-Tero

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
