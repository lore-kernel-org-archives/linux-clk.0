Return-Path: <sudipm.mukherjee@gmail.com>
Return-Path: <sudipm.mukherjee@gmail.com>
Date: Fri, 20 Nov 2015 14:28:15 +0530
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: versatile: fix memory leak
Message-ID: <20151120085815.GB4485@sudip-pc>
References: <1447681600-14120-1-git-send-email-sudipm.mukherjee@gmail.com>
 <20151118222446.GG32672@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20151118222446.GG32672@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Nov 18, 2015 at 02:24:46PM -0800, Stephen Boyd wrote:
> On 11/16, Sudip Mukherjee wrote:
> > If of_clk_parent_fill() fails then we printed an error message and
> > returned. But we missed freeing sp810.
> > 
> > Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> > ---
> 
> Applied to clk-next

Thanks.
> 
> We don't need that error message on allocation failure either.

I sent another patch to remove the error message on kzalloc failure. Did
you mean that one or did you mean the error message for
of_clk_parent_fill()?
I could not find any message being printed if of_clk_parent_fill() fails
so kept it as it is.

regards
sudip
