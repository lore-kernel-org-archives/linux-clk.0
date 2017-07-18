Return-Path: <sboyd@codeaurora.org>
Date: Mon, 17 Jul 2017 18:31:01 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Michael Turquette <mturquette@baylibre.com>, keescook@chromium.org,
	kernel-janitors@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/11] clk: moxart: Drop unnecessary static
Message-ID: <20170718013101.GA17424@codeaurora.org>
References: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
 <1500149266-32357-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1500149266-32357-3-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-clk.vger.kernel.org>

On 07/15, Julia Lawall wrote:
> Drop static on a local variable, when the variable is initialized before
> any possible use.  Thus, the static has no benefit.
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @bad exists@
> position p;
> identifier x;
> type T;
> @@
> static T x@p;
> ...
> x = <+...x...+>
> 
> @@
> identifier x;
> expression e;
> type T;
> position p != bad.p;
> @@
> -static
>  T x@p;
>  ... when != x
>      when strict
> ?x = e;
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> These patches are all independent of each other.

Already got this one a few days earlier.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
