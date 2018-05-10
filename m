Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v3 1/2] clk: davinci: pll-dm355: drop pll2_sysclk2
To: David Lechner <david@lechnology.com>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, <linux-kernel@vger.kernel.org>
References: <20180509153642.22399-1-david@lechnology.com>
 <20180509153642.22399-2-david@lechnology.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <e1f89e7c-d07b-990d-fede-65d7d02c3e3a@ti.com>
Date: Thu, 10 May 2018 20:59:33 +0530
MIME-Version: 1.0
In-Reply-To: <20180509153642.22399-2-david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On Wednesday 09 May 2018 09:06 PM, David Lechner wrote:
> This removes pll2_sysclk2 from the TI DM355 clock driver. This SoC
> doesn't have such a clock. Also, SYSCLK_ALWAYS_ENABLED is transferred
> to pll2_sysclk1 since it drives the DDR and doesn't have another
> mechanism to keep it on.
> 
> Reported-by: Sekhar Nori <nsekhar@ti.com>
> Signed-off-by: David Lechner <david@lechnology.com>

I would not have minded the SYSCLK_ALWAYS_ENABLED change to be a
separate patch too, but:

Acked-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
