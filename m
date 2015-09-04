Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 4 Sep 2015 09:59:13 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Kees Cook <keescook@chromium.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nicolas Iooss <nicolas.iooss_linux@m4x.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk_register_clkdev: remove format string interface
Message-ID: <20150904085912.GB21084@n2100.arm.linux.org.uk>
References: <20150903205407.GA19702@www.outflux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20150903205407.GA19702@www.outflux.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Sep 03, 2015 at 01:54:07PM -0700, Kees Cook wrote:
> Many callers either use NULL or const strings for the third argument of
> clk_register_clkdev. For those that do not and use a non-const string,
> this is a risk for format strings being accidentally processed (for
> example in device names). As this interface is already used as if it
> weren't a format string (prints nothing when NULL), and there are zero
> users of the format strings, remove the format string interface to make
> sure format strings will not leak into the clkdev.
> 
> $ git grep '\bclk_register_clkdev\b' | grep % | wc -l
> 0
> 
> Unfortunately, all the internals expect a va_list even though they treat
> a NULL format string as special. To deal with this, we must pass either
> (..., "%s", string) or (..., NULL, NULL) so that a the va_list will be
> created correctly (passing the name as an argument, not a format string).

A more clearer way to write that would be:

	if (dev_id)
		cl = clkdev_create(hw, con_id, "%s", dev_id);
	else
		cl = clkdev_create(hw, con_id, NULL);

then it's obvious what's going on.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
