Return-Path: <david@lechnology.com>
Subject: Re: [PATCH] clk: Return void from debug_init op
To: sboyd@kernel.org, Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Eric Anholt <eric@anholt.net>, Sekhar Nori <nsekhar@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20180602050643.87253-1-sboyd@kernel.org>
From: David Lechner <david@lechnology.com>
Message-ID: <35a797de-35ec-ce65-64c4-8d2137b55c53@lechnology.com>
Date: Sat, 2 Jun 2018 09:29:59 -0500
MIME-Version: 1.0
In-Reply-To: <20180602050643.87253-1-sboyd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 06/02/2018 12:06 AM, sboyd@kernel.org wrote:
> From: Stephen Boyd <sboyd@kernel.org>
> 
> We only have two users of the debug_init hook, and we recently stopped
> caring about the return value from that op. Finish that off by changing
> the clk_op to return void instead of int because it doesn't matter if
> debugfs fails or not.
> 
> Cc: Eric Anholt <eric@anholt.net>
> Cc: David Lechner <david@lechnology.com>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Acked-by: David Lechner <david@lechnology.com>
