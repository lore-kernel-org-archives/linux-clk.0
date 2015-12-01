Return-Path: <sboyd@codeaurora.org>
Date: Mon, 30 Nov 2015 18:31:43 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Add support for MSM8996 clock controllers
Message-ID: <20151201023143.GH17532@codeaurora.org>
References: <1448933502-11944-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448933502-11944-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/30, Stephen Boyd wrote:
> These patches add support for the global and multimedia clock controllers
> found on MSM8996 devices. The first patch allows us to implement a
> "power of two" divider of different widths with a table based divider.
> The second patch adds support for Alpha PLLs and the 3rd and 5th patches
> add support for the two clock controllers. The fourth patch is
> a new type of clock ops for the graphics clock that does some custom
> ping-pong between different PLLs when switching graphics frequencies.
> 
> Changes from v1:
>  * Added some missing clocks in gcc and mmcc drivers
>  * Updated PLL settings in mmcc
> 
> 

I've pushed this to clk-msm8996 and merged it into clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
