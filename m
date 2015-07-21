Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55AEB6AE.2070006@codeaurora.org>
Date: Tue, 21 Jul 2015 14:16:30 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Douglas Anderson <dianders@chromium.org>
CC: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, ykk@rock-chips.com,
	Alexandru Stan <amstan@chromium.org>, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: Fix PLL bandwidth
References: <1437511283-14216-1-git-send-email-dianders@chromium.org>
In-Reply-To: <1437511283-14216-1-git-send-email-dianders@chromium.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/21/2015 01:41 PM, Douglas Anderson wrote:
> In the TRM we see that BWADJ is "a 12-bit bus that selects the values
> 1-4096 for the bandwidth divider (NB)":
>   NB = BWADJ[11:0] + 1
> The recommended setting of NB: NB = NF / 2.
>
> So:
>    NB = NF / 2
>    BWADJ[11:0] + 1 = NF / 2
>    BWADJ[11:0] = NF / 2 - 1
>
> Right now, we have:
>
> {                                               \
>          .rate   = _rate##U,                     \
>          .nr = _nr,                              \
>          .nf = _nf,                              \
>          .no = _no,                              \
>          .bwadj = (_nf >> 1),                    \
> }
>
> That means we set bwadj to NF / 2, not NF / 2 - 1
>
> All of this is a bit confusing because we specify "NR" (the 1-based
> value), "NF" (the 1-based value), "NO" (the 1-based value), but
> "BWADJ" (the 0-based value) instead of "NB" (the 1-based value).
>
> Let's change to working with "NB" and fix the off by one error.  This
> may affect PLL jitter in a small way (hopefully for the better).
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>

There's no Fixes tag or stable Cc so I take it this isn't fixing any 
manifesting regression, more of a visual inspection bug find?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

