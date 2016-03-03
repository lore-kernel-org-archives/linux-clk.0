Return-Path: <mika.westerberg@linux.intel.com>
Date: Thu, 3 Mar 2016 12:35:10 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 22/41] clk: x86: Remove clkdev.h and clk.h includes
Message-ID: <20160303103510.GP1794@lahna.fi.intel.com>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
 <1456858826-28541-23-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456858826-28541-23-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Mar 01, 2016 at 11:00:07AM -0800, Stephen Boyd wrote:
> This driver is a clk provider and not a clk consumer, so remove
> the clk.h include. Also, drop clkdev.h because there's not clkdev
> usage here either.
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
