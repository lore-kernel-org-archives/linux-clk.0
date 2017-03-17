Return-Path: <tony@atomide.com>
Date: Fri, 17 Mar 2017 08:43:33 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
	sboyd@codeaurora.org, mturquette@baylibre.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv2 8/9] ARM: dts: omap4: add clkctrl nodes
Message-ID: <20170317154333.GW20572@atomide.com>
References: <1489741781-12816-1-git-send-email-t-kristo@ti.com>
 <1489741781-12816-9-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1489741781-12816-9-git-send-email-t-kristo@ti.com>
List-ID: <linux-clk.vger.kernel.org>

* Tero Kristo <t-kristo@ti.com> [170317 02:12]:
> Add clkctrl nodes for OMAP4 SoC. These are going to be acting as
> replacement for part of the existing clock data and the existing
> clkctrl hooks under hwmod data.

It seems to be actually this patch in the series that breaks booting
if the last patch in this series is not applied.

Regards,

Tony
