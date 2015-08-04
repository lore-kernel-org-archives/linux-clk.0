Return-Path: <sboyd@codeaurora.org>
Message-ID: <55C011E9.3000002@codeaurora.org>
Date: Mon, 03 Aug 2015 18:14:17 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Lin Huang <hl@rock-chips.com>
CC: heiko@sntech.de, dianders@chromium.org,
 linux-rockchip@lists.infradead.org, mturquette@baylibre.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: rockchip: add pclk_pd_pmu to the list of
 rk3288 critical clocks
References: <1438650222-14357-1-git-send-email-hl@rock-chips.com>
In-Reply-To: <1438650222-14357-1-git-send-email-hl@rock-chips.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 08/03/2015 06:03 PM, Lin Huang wrote:
> From: huang lin <hl@rock-chips.com>
>
> pclk_pd_pmu needs to keep running and with the upcoming gpio clock
> handling this is not always the case anymore. So add it to the list
> of critical clocks for now.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Lin Huang <hl@rock-chips.com>

From: says huang lin, first signed-off-by is Heiko Stuebner, and final 
signed-off-by is Lin Huang... who actually authored this patch? Is Lin 
Huang the same person as huang lin ?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
