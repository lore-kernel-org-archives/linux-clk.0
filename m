Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:33624 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750815AbdLGGed (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Dec 2017 01:34:33 -0500
Date: Wed, 6 Dec 2017 22:34:32 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: srinivas.kandagatla@linaro.org
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: msm8916: fix mnd_width for codec_digcodec
Message-ID: <20171207063432.GO4283@codeaurora.org>
References: <20171206121139.18936-1-srinivas.kandagatla@linaro.org>
 <20171206121139.18936-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171206121139.18936-2-srinivas.kandagatla@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 12/06, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> This patch fixes missing mnd_width for codec_digital clk, this is now set to
> 8 inline with datasheet.
> 
> Fixes: 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controller support")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
