Return-Path: <ckeepax@opensource.wolfsonmicro.com>
Date: Thu, 1 Dec 2016 09:32:36 +0000
From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
To: Pan Bian <bianpan2016@163.com>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>,
        <patches@opensource.wolfsonmicro.com>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] clk: clk-wm831x: fix a logic error
Message-ID: <20161201093236.GJ1867@localhost.localdomain>
References: <1480573545-18588-1-git-send-email-bianpan2016@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <1480573545-18588-1-git-send-email-bianpan2016@163.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Dec 01, 2016 at 02:25:44PM +0800, Pan Bian wrote:
> Fix bug https://bugzilla.kernel.org/show_bug.cgi?id=188561. Function
> wm831x_clkout_is_prepared() returns "true" when it fails to read
> CLOCK_CONTROL_1. "true" means the device is already prepared. So
> return "true" on the read failure seems improper.
> 
> Signed-off-by: Pan Bian <bianpan2016@163.com>
> ---

Looks good to me:

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
