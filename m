Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:33264 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750738AbdLGGdy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Dec 2017 01:33:54 -0500
Date: Wed, 6 Dec 2017 22:33:53 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: srinivas.kandagatla@linaro.org
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: msm8916: Fix i2s clk rates required for mclk
Message-ID: <20171207063353.GM4283@codeaurora.org>
References: <20171129182525.18603-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171129182525.18603-1-srinivas.kandagatla@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11/29, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> lpaif i2s clk rates in the freq table are not accurate enough
> for I2S mclk. Fix the inaccurate ones and add few more clock
> rates that are used in LPASS audio driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
