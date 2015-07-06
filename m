Return-Path: <sboyd@codeaurora.org>
Date: Mon, 6 Jul 2015 12:39:19 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Constify the parent names arrays
Message-ID: <20150706193919.GA20866@codeaurora.org>
References: <1436190690-15983-1-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1436190690-15983-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/06, Georgi Djakov wrote:
> Make const both the array and the strings, so they can be
> moved to .rodata section.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
