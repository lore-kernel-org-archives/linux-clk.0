Return-Path: <sudeep.holla@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] clk: scpi: error when clock fails to register
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
References: <20170628135345.9337-1-jbrunet@baylibre.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <c7123c06-b75b-5209-5817-230c63c1bf49@arm.com>
Date: Wed, 28 Jun 2017 16:04:17 +0100
MIME-Version: 1.0
In-Reply-To: <20170628135345.9337-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>



On 28/06/17 14:53, Jerome Brunet wrote:
> Current implementation of scpi_clk_add just print a warning when clock
> fails to register but then keep going as if nothing happened. The
> provider is then registered with bogus data.
> 
> This may latter lead to an Oops in __clk_create_clk when
> hlist_add_head(&clk->clks_node, &hw->core->clks) is called.
> 

What's the path of this call ? I see one in devm_clk_hw_register
but that's one which failed.

Also one of the reason for keeping it continuing is, if firmware fails
on some non-critical clock, that's fine rather than punishing the entire
set of clocks and may even fail the boot.

-- 
Regards,
Sudeep
