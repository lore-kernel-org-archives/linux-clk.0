Return-Path: <sboyd@codeaurora.org>
Message-ID: <559B15DE.7040200@codeaurora.org>
Date: Mon, 06 Jul 2015 16:57:18 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Russell King <linux@arm.linux.org.uk>
CC: Bintian Wang <bintian.wang@huawei.com>,
 Mike Turquette <mturquette@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH] amba: Support clk parents and rates assigned in DT
References: <1432846332-17692-1-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1432846332-17692-1-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 05/28/2015 01:52 PM, Stephen Boyd wrote:
> Add the call to of_clk_set_defaults() into the amba probe path so
> that devices on the amba bus can use the assigned rates and
> parents feature of the common clock framework.
>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Shall I put this into the patch tracker? Turns out it wasn't needed for
the hisi stuff immediately.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
