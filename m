Return-Path: <sboyd@codeaurora.org>
Date: Thu, 30 Apr 2015 18:41:47 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@linaro.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: Fix MSM8916 gfx3d_clk_src configuration
Message-ID: <20150501014147.GB23028@codeaurora.org>
References: <1430308367-19567-1-git-send-email-georgi.djakov@linaro.org>
 <1430308367-19567-2-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1430308367-19567-2-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 04/29, Georgi Djakov wrote:
> The gfx3d_clk_src parents configuration is incorrect. Fix it.
> 
> Fixes: 3966fab8b6ab "clk: qcom: Add MSM8916 Global Clock Controller support"
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
