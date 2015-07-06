Return-Path: <sboyd@codeaurora.org>
Message-ID: <559AD7BE.3090402@codeaurora.org>
Date: Mon, 06 Jul 2015 12:32:14 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Hai Li <hali@codeaurora.org>
CC: mturquette@baylibre.com, georgi.djakov@linaro.org,
 tomeu.vizoso@collabora.com, architt@codeaurora.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: Use parent rate when set rate to pixel
 RCG clock
References: <1435271733-24455-1-git-send-email-hali@codeaurora.org> <1436194176-17701-1-git-send-email-hali@codeaurora.org>
In-Reply-To: <1436194176-17701-1-git-send-email-hali@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 07/06/2015 07:49 AM, Hai Li wrote:
> Since the parent rate has been recalculated, pixel RCG clock
> should rely on it to find the correct M/N values during set_rate,
> instead of calling __clk_round_rate() to its parent again.
>
> v2: Rebase on clk-next and avoid build warning
>
> Signed-off-by: Hai Li <hali@codeaurora.org>
> Tested-by: Archit Taneja <architt@codeaurora.org>
> Fixes: 99cbd064b059 ("clk: qcom: Support display RCG clocks")
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Huh? I didn't sign this off. The original patch was already applied, so
a new patch on top of the patch in -next that removed the index and
parent lines and renamed the variable should have been sent. Then we
have the option of applying the new patch on top to silence the warning,
or to squash it into the original patch if we want to redo clk-fixes.
I've opted to redo clk-fixes this time.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
