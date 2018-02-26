Return-Path: <tony@atomide.com>
Date: Mon, 26 Feb 2018 14:05:20 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
	linux-omap@vger.kernel.org, jsarha@ti.com
Subject: Re: [PATCH 0/3] clk: ti: add CLK_SET_RATE_PARENT support for clkctrl
Message-ID: <20180226220520.GI16043@atomide.com>
References: <1519657812-15605-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1519657812-15605-1-git-send-email-t-kristo@ti.com>
List-ID: <linux-clk.vger.kernel.org>

Hi,

* Tero Kristo <t-kristo@ti.com> [180226 15:11]:
> This patch adds clock rate propagation support for clkctrl clocks. This
> is needed on am33xx beaglebone black device at least, otherwise the
> display does not work. Similar problem appears to be present on am43xx
> but haven't heard of any reports of such so far, maybe Jyri can confirm
> this?

I think I was also hitting this with the system timers with ti-sysc
where set_parent() would fail unless the dts has the following for
timers:

clocks = <&l4_wkup_clkctrl OMAP4_TIMER1_CLKCTRL 24>;

So bit 24 instead of 0.

Hmm so should we have all the timers use bit 0 in the dtsi?
Or default to bit 24 for all of them?

Regards,

Tony
