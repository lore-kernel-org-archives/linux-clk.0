Return-Path: <SRS0=E1Is=IU=linuxfoundation.org=gregkh@kernel.org>
Date: Sat, 2 Jun 2018 08:58:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: sboyd@kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Eric Anholt <eric@anholt.net>, David Lechner <david@lechnology.com>,
	Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] clk: Return void from debug_init op
Message-ID: <20180602065851.GB32552@kroah.com>
References: <20180602050643.87253-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180602050643.87253-1-sboyd@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jun 01, 2018 at 10:06:43PM -0700, sboyd@kernel.org wrote:
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

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
