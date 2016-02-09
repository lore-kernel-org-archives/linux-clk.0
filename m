Return-Path: <sboyd@codeaurora.org>
Date: Tue, 9 Feb 2016 11:03:09 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: slemieux.tyco@gmail.com
Cc: mturquette@baylibre.com, stigge@antcom.de, vz@mleia.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: lpc32xx: do not prepare clock "0"
Message-ID: <20160209190309.GD31947@codeaurora.org>
References: <1455042550-18766-1-git-send-email-slemieux.tyco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1455042550-18766-1-git-send-email-slemieux.tyco@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/09, slemieux.tyco@gmail.com wrote:
> From: Sylvain Lemieux <slemieux@tycoint.com>
> 
> The following errors are display in the console during the power-on:
> [    0.000000] lpc32xx_usb_clk_init: failed to register (null) clock: -12
> [    0.000000] lpc32xx_clk_init: failed to register (null) clock: -12
> 
> There is no need to prepare clock "0"; the first clock used is 1;
> 
> Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
> ---

Do you mean register instead of prepare? Change looks ok
otherwise.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
