Return-Path: <sboyd@codeaurora.org>
Date: Mon, 20 Jun 2016 18:48:16 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Jean-Francois Moine <moinejf@free.fr>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 00/15] clk: sunxi: introduce "modern" clock support
Message-ID: <20160621014816.GT1521@codeaurora.org>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/07, Maxime Ripard wrote:
> 
> The current code has been tested on the H3 and an Orange Pi PC,
> including making sure that MMC still works, so the general approach
> seems ok.
> 
> Let me know what you think,

Overall this looks pretty good. Thanks for taking the time to
rework the driver.

The macro nesting is sort of concerning, but if you're willing to
live with a maze of macros I'm not too worried. Also, I don't see
why we have to use the ccu_common structure everywhere even when
we're not gaining from it, but it's not a huge problem either
way. The non-mmio clks could be split off from the mmio list and
then registered in two lists, or there could be mmio list that
sets up the base address and then a larger list of clk_hw
pointers that we just run through and register.

It would be great if we could squeeze some more code reuse out of
the basic types too, but I'm not sure if there's much more that
can be done. Sometimes I'm seeing the same code multiple times
for handling muxes with parents and dividers or muxes without
dividers, etc. But that seems like future work that isn't going
to block anything here.

Finally, can you please use the clk_hw_register() APIs that we've
recently added. That will save us some time converting a new
driver over to use the new style of registering clks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
