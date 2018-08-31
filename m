Return-Path: <andriy.shevchenko@linux.intel.com>
Date: Fri, 31 Aug 2018 21:23:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Simon Horman <horms@verge.net.au>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 0/2] clk: Add functions to get optional clocks
Message-ID: <20180831182328.GF11447@smile.fi.intel.com>
References: <1535724443-21150-1-git-send-email-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1535724443-21150-1-git-send-email-phil.edworthy@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Aug 31, 2018 at 03:07:21PM +0100, Phil Edworthy wrote:
> Quite a few drivers get an optional clock, e.g. a bus clock required to 
> access peripheral's registers that is always enabled on some devices.
> 

Looks good to me

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Perhaps, you may convert 8250_dw to this one later on as an example...

> Phil Edworthy (2):
>   clk: Add of_clk_get_by_name_optional() function
>   clk: Add functions to get optional clocks
> 
>  drivers/clk/clk-devres.c | 18 ++++++++++--
>  drivers/clk/clkdev.c     | 74 ++++++++++++++++++++++++++++++++++++++----------
>  include/linux/clk.h      | 35 +++++++++++++++++++++++
>  3 files changed, 110 insertions(+), 17 deletions(-)
> 
> -- 
> 2.7.4
> 

-- 
With Best Regards,
Andy Shevchenko
