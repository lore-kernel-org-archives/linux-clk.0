Return-Path: <sboyd@codeaurora.org>
Date: Thu, 29 Jun 2017 17:21:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Brandon Streiff <brandon.streiff@ni.com>, robh+dt@kernel.org
Cc: mturquette@baylibre.com, mark.rutland@arm.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: si5351: expand compatible strings in documentation
Message-ID: <20170630002113.GE22780@codeaurora.org>
References: <1498743105-29078-1-git-send-email-brandon.streiff@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1498743105-29078-1-git-send-email-brandon.streiff@ni.com>
List-ID: <linux-clk.vger.kernel.org>

To is to nobody? Rob can apply it I suppose.

On 06/29, Brandon Streiff wrote:
> checkpatch.pl doesn't know how to expand "silabs,si5351{a,a-msop,b,c}"
> and so generates warnings about si5351-compatible devices appearing to
> be un-documented. Resolve this by documenting the compatible options
> supported by the clk-si5351 driver individually.
> 
> Signed-off-by: Brandon Streiff <brandon.streiff@ni.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
