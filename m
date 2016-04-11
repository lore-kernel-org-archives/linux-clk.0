Return-Path: <tony@atomide.com>
Date: Mon, 11 Apr 2016 10:40:59 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-omap@vger.kernel.org, paul@pwsan.com, mturquette@baylibre.com,
	sboyd@codeaurora.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 00/30] ARM: OMAP2+: hwmod module clock type support
Message-ID: <20160411173518.GA5995@atomide.com>
References: <1460362761-4842-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1460362761-4842-1-git-send-email-t-kristo@ti.com>
List-ID: <linux-clk.vger.kernel.org>

Hi,

Nice to see this moving along :)

* Tero Kristo <t-kristo@ti.com> [160411 01:20]:
>
> The ordering on this set is kind of tricky to avoid any boot issues,
> and it still currently causes a boot breakage between the DTS data
> introduction and removal of hwmod data; this generates duplicate
> entries for clocks which is prone to cause issues (both DT and hwmod
> have the same entries in place under the hwmod data is removed.) I
> didn't quite figure out a good way to avoid this, and could use some
> guidance here. Shall we squash the DT + hwmod data patches together?
> This avoids the boot breakage but creates pretty large patches. Also,
> AMx3xx data needs to be grouped together as part of their data is
> re-used commonly by both SoCs.

How about use clocks from dts if clocks property is defined? Otherwise
fall back to the old static data. Then drop the static data later on
with follow up patches.

Regards,

Tony
