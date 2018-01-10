Return-Path: <sboyd@codeaurora.org>
Date: Wed, 10 Jan 2018 13:14:05 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: Use octal instead of symbolic permissions
Message-ID: <20180110211405.GJ21040@codeaurora.org>
References: <1514977577-11854-1-git-send-email-geert+renesas@glider.be>
 <1514977577-11854-3-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1514977577-11854-3-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 01/03, Geert Uytterhoeven wrote:
> Octal permissions are preferred, as they are easier to read than
> symbolic permissions.  Hence replace "S_IRUGO" by "0444".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
