Return-Path: <t-kristo@ti.com>
From: Tero Kristo <t-kristo@ti.com>
To: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>
CC: <linux-omap@vger.kernel.org>, <tony@atomide.com>
Subject: [PATCH 00/11] clk: ti: clkctrl data split based on clkdm boundaries
Date: Fri, 31 Aug 2018 18:06:56 +0300
Message-ID: <1535728027-24573-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Hi,

This series splits up the clkctrl data for TI SoCs based on clockdomain
boundaries, instead of the current CM boundaries. For rest of the SoCs,
the CM boundaries are actually the same as clockdomains, only am3/am4/dra7
are mutants.

This is done in preparation for better supporting Tony's upcoming
interconnect driver data introduction for these SoCs.

One thing to note is that we maintain backwards compatibility with this
series, the compat data is introduced temporarily for this purpose. The
compat data can be ditched after couple of release cycles when nobody
needs it anymore.

The series can be applied independently, as the compat data support
makes care that the switch is only done once DT changes are in place.

-Tero

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
