Return-Path: <sboyd@codeaurora.org>
Date: Fri, 29 Jan 2016 16:58:00 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: palmas: fix a possible NULL dereference
Message-ID: <20160130005759.GB4848@codeaurora.org>
References: <1448455923-28670-1-git-send-email-clabbe.montjoie@gmail.com>
 <1448455923-28670-2-git-send-email-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448455923-28670-2-git-send-email-clabbe.montjoie@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/25, LABBE Corentin wrote:
> of_match_device could return NULL, and so cause a NULL pointer
> dereference later.
> Even if the probability of this case is very low, fixing it made
> static analyzers happy.
> 
> Solving this with of_device_get_match_data made also code simplier.
> 
> Reported-by: coverity (CID 1324137)
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
