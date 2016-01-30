Return-Path: <sboyd@codeaurora.org>
Date: Fri, 29 Jan 2016 16:57:55 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: palmas: constify the palmas_clks_of_match_data
 structure
Message-ID: <20160130005754.GA4848@codeaurora.org>
References: <1448455923-28670-1-git-send-email-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448455923-28670-1-git-send-email-clabbe.montjoie@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/25, LABBE Corentin wrote:
> The palmas_clks_of_match_data structures are never modified.
> This patch constify them.
> 
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
