Return-Path: <sboyd@codeaurora.org>
Date: Fri, 15 Apr 2016 17:06:35 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: Add 16bit register access for clk-divider.
Message-ID: <20160416000635.GB26353@codeaurora.org>
References: <1460618263-30967-1-git-send-email-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1460618263-30967-1-git-send-email-ysato@users.sourceforge.jp>
List-ID: <linux-clk.vger.kernel.org>

On 04/14, Yoshinori Sato wrote:
> Some SoC use 16bit-word register. And required 16bit-word access.
> This changes add 16-bit access mode.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Please implement a custom divider for your hardware instead of
adding this support to the core. You can call functions such as
divider_recalc_rate(), divider_round_rate(), and
divider_get_val() to get the appropriate register values and then
have the readw/writew in your custom driver instead.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
