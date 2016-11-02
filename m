Return-Path: <sboyd@codeaurora.org>
Date: Tue, 1 Nov 2016 17:56:47 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] clk: pxa: b bit of clkcfg means fast bus
Message-ID: <20161102005647.GY16026@codeaurora.org>
References: <1477225170-19019-1-git-send-email-robert.jarzmik@free.fr>
 <1477225170-19019-4-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1477225170-19019-4-git-send-email-robert.jarzmik@free.fr>
List-ID: <linux-clk.vger.kernel.org>

On 10/23, Robert Jarzmik wrote:
> The meaning of this bit was inverted :
>  - when set to 0, system bus clock is half of the CPU run clock
>  - when set to 1, system bus clock is the CPU run clock
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
