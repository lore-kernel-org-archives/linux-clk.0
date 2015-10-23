Return-Path: <grygorii.strashko@ti.com>
Subject: Re: [PATCH] clk: ti: drop locking code from mux/divider drivers
To: Michael Turquette <mturquette@baylibre.com>, Tero Kristo <t-kristo@ti.com>
References: <1443727237-21809-1-git-send-email-grygorii.strashko@ti.com>
CC: <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Tony Lindgren
	<tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <562AA243.5010504@ti.com>
Date: Sat, 24 Oct 2015 00:10:27 +0300
MIME-Version: 1.0
In-Reply-To: <1443727237-21809-1-git-send-email-grygorii.strashko@ti.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 10/01/2015 10:20 PM, Grygorii Strashko wrote:
> TI's mux and divider clock drivers do not require locking and they do
> not initialize internal spinlocks. This code was occasionally
> copy-posted from generic mux/divider drivers. So remove it.
>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---

Gentle ping.

>   drivers/clk/ti/divider.c | 16 +++-------------
>   drivers/clk/ti/mux.c     | 15 +++------------
>   2 files changed, 6 insertions(+), 25 deletions(-)
>

-- 
regards,
-grygorii
