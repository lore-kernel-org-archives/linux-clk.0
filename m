Return-Path: <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk: disable unused clk if enable_count == 0
To: Jun Nie <jun.nie@linaro.org>, mturquette@baylibre.com,
 linux-clk@vger.kernel.org
References: <1460020558-5152-1-git-send-email-jun.nie@linaro.org>
Cc: shawn.guo@linaro.org, jason.liu@linaro.org
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <5706F7F7.3030205@codeaurora.org>
Date: Thu, 7 Apr 2016 17:14:47 -0700
MIME-Version: 1.0
In-Reply-To: <1460020558-5152-1-git-send-email-jun.nie@linaro.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 04/07/2016 02:15 AM, Jun Nie wrote:
> If .is_enabled callback is not implemented, clk_core_is_enabled
> will take software enable_count as enable status. If enable_count
> is zero, .disable will not be called as software assume clock
> is not enabled though clock may be booted with  free running state.
> Disable the clock in this situation.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---

Why not implement the is_enabled callback then?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
