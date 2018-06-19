Return-Path: <alexandre.belloni@bootlin.com>
Date: Tue, 19 Jun 2018 23:30:34 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Remove the AT91 clk driver entry
Message-ID: <20180619213034.GC3128@piout.net>
References: <20180613082936.14038-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180613082936.14038-1-boris.brezillon@bootlin.com>
List-ID: <linux-clk.vger.kernel.org>

On 13/06/2018 10:29:36+0200, Boris Brezillon wrote:
> I've stopped actively maintaining this driver for quite some time
> already, and at91 maintainers are doing a good job at maintaining it.
> Remove the AT91 clk driver entry so that the driver automatically
> falls under the "ARM/Microchip (AT91) SoC support" entry.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  MAINTAINERS | 5 -----
>  1 file changed, 5 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
