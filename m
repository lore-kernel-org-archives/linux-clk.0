Return-Path: <sboyd@codeaurora.org>
Date: Thu, 2 Jul 2015 09:55:39 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: David Dueck <davidcdueck@googlemail.com>
Cc: boris.brezillon@free-electrons.com, mturquette@linaro.org,
	nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com,
	plagnioj@jcrosoft.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] clk: at91: do not leak resources
Message-ID: <20150702165539.GB7201@codeaurora.org>
References: <1435325422-8137-1-git-send-email-davidcdueck@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1435325422-8137-1-git-send-email-davidcdueck@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/26, David Dueck wrote:
> Do not leak memory and free irqs in case of an error.
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: David Dueck <davidcdueck@googlemail.com>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
