Return-Path: <sboyd@codeaurora.org>
Date: Tue, 12 May 2015 11:56:37 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@linaro.org, linaro-kernel@lists.linaro.org,
	Michael Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: Update docs after removal of clk-private.h
Message-ID: <20150512185637.GA5438@codeaurora.org>
References: <1431339606-16038-1-git-send-email-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1431339606-16038-1-git-send-email-daniel.thompson@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 05/11, Daniel Thompson wrote:
> Currently Documentation/clk.txt describes an obsolete techinique to
> statically define struct clk objects.
> 
> This capability was removed by b09d6d991025("clk: remove clk-private.h")
> and is no longer supported. The documentation describing the feature should
> be removed.
> 
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Michael Turquette <mturquette@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> ---

We've typically taken patches to this file so I'll apply this to
clk-next unless there are any objections.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
