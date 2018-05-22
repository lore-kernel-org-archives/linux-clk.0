Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v11 03/27] clk: davinci: psc: allow for dev == NULL
To: David Lechner <david@lechnology.com>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland
	<mark.rutland@arm.com>,
        Kevin Hilman <khilman@kernel.org>,
        Bartosz
 Golaszewski <bgolaszewski@baylibre.com>,
        Adam Ford <aford173@gmail.com>, <linux-kernel@vger.kernel.org>
References: <20180518164829.27052-1-david@lechnology.com>
 <20180518164829.27052-4-david@lechnology.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <250d94db-c33f-51c9-99c1-3a4ddcd627fa@ti.com>
Date: Tue, 22 May 2018 14:35:58 +0530
MIME-Version: 1.0
In-Reply-To: <20180518164829.27052-4-david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On Friday 18 May 2018 10:18 PM, David Lechner wrote:
> On some davinci SoCs, we need to register the PSC clocks during early
> boot because they are needed for clocksource/clockevent. These changes
> allow for dev == NULL because in this case, we won't have a platform
> device for the clocks.
> 
> Some function declarations are moved to a public header files so that they can
> be called from mach init code.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
