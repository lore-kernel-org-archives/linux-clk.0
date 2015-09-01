Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 1 Sep 2015 11:12:55 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Michael Turquette <mturquette@baylibre.com>,
	uclinux-h8-devel@lists.sourceforge.jp, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: h8s2678: Fix compile error
Message-ID: <20150901181255.GD19120@codeaurora.org>
References: <1441078052-14790-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1441078052-14790-1-git-send-email-linux@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/31, Guenter Roeck wrote:
> Recent cleanup removed some include files without checking if the cleaned
> up code still compiles. This results in the following compile error.
> 
> drivers/clk/h8300/clk-h8s2678.c: In function ‘h8s2678_pll_clk_setup’:
> drivers/clk/h8300/clk-h8s2678.c:99:14: error:
> 	implicit declaration of function ‘kzalloc’
> drivers/clk/h8300/clk-h8s2678.c:138:2: error:
>       implicit declaration of function ‘kfree’
> 
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Urgh. I thought I compiled that one. Applied to clk-fixes.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
