Return-Path: <sboyd@codeaurora.org>
Date: Wed, 13 May 2015 00:35:03 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, Mike Turquette <mturquette@linaro.org>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/6] clk: asm9260: Fix of_io_request_and_map error check
Message-ID: <20150513073503.GA15988@codeaurora.org>
References: <1430579006-32702-1-git-send-email-maxime.ripard@free-electrons.com>
 <1430579006-32702-2-git-send-email-maxime.ripard@free-electrons.com>
 <20150511194336.GH10961@lukather>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20150511194336.GH10961@lukather>
List-ID: <linux-clk.vger.kernel.org>

On 05/11, Maxime Ripard wrote:
> Mike, Stephen,
> 
> On Sat, May 02, 2015 at 05:03:21PM +0200, Maxime Ripard wrote:
> > of_io_request_and map returns an error pointer, but the current code assumes
> > that on error the returned pointer will be NULL.
> > 
> > Obviously, that makes the check completely useless. Change the test to actually
> > check for the proper error code.
> > 
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > Cc: Mike Turquette <mturquette@linaro.org>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > Cc: linux-clk@vger.kernel.org
> 
> There doesn't seem to be a sub-maintainer for that driver, I guess it
> should go through your tree?
> 

Yep. Applied to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
