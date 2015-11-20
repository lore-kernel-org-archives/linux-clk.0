Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 09:17:44 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: versatile: fix memory leak
Message-ID: <20151120171744.GN32672@codeaurora.org>
References: <1447681600-14120-1-git-send-email-sudipm.mukherjee@gmail.com>
 <20151118222446.GG32672@codeaurora.org>
 <20151120085815.GB4485@sudip-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20151120085815.GB4485@sudip-pc>
List-ID: <linux-clk.vger.kernel.org>

On 11/20, Sudip Mukherjee wrote:
> On Wed, Nov 18, 2015 at 02:24:46PM -0800, Stephen Boyd wrote:
> > On 11/16, Sudip Mukherjee wrote:
> > > If of_clk_parent_fill() fails then we printed an error message and
> > > returned. But we missed freeing sp810.
> > > 
> > > Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> > > ---
> > 
> > Applied to clk-next
> 
> Thanks.
> > 
> > We don't need that error message on allocation failure either.
> 
> I sent another patch to remove the error message on kzalloc failure. Did
> you mean that one or did you mean the error message for
> of_clk_parent_fill()?

Yes I meant the one you removed. Thanks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
