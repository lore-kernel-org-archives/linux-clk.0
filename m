Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH] clk: davinci: psc-dm355: fix ASP0/1 clkdev lookups
To: David Lechner <david@lechnology.com>, <linux-clk@vger.kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20180512204942.10090-1-david@lechnology.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <4aa52e4d-766f-2d71-496b-1660627a7620@ti.com>
Date: Mon, 14 May 2018 15:59:30 +0530
MIME-Version: 1.0
In-Reply-To: <20180512204942.10090-1-david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On Sunday 13 May 2018 02:19 AM, David Lechner wrote:
> The clkdev lookups for the ASP0/1 devices on TI DM355 were declared, but
> not assigned to any LPSC. This assigns the clkdev lookups to the
> correct LPSCs.
> 
> Reported-by: Sekhar Nori <nsekhar@ti.com>
> Signed-off-by: David Lechner <david@lechnology.com>

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
