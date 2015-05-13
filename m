Return-Path: <sboyd@codeaurora.org>
Date: Wed, 13 May 2015 12:43:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@linaro.org, linaro-kernel@lists.linaro.org,
	Michael Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: Update docs after removal of clk-private.h
Message-ID: <20150513194344.GB32166@codeaurora.org>
References: <1431339606-16038-1-git-send-email-daniel.thompson@linaro.org>
 <20150512185637.GA5438@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20150512185637.GA5438@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 05/12, Stephen Boyd wrote:
> On 05/11, Daniel Thompson wrote:
> > Currently Documentation/clk.txt describes an obsolete techinique to
> > statically define struct clk objects.
> > 
> > This capability was removed by b09d6d991025("clk: remove clk-private.h")
> > and is no longer supported. The documentation describing the feature should
> > be removed.
> > 
> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: Michael Turquette <mturquette@linaro.org>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > ---
> 
> We've typically taken patches to this file so I'll apply this to
> clk-next unless there are any objections.
> 

Applied to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
