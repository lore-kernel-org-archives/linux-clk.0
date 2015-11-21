Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:56244 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760358AbbKUAlb (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 20 Nov 2015 19:41:31 -0500
Date: Fri, 20 Nov 2015 16:41:30 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: agross@codeaurora.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, bjorn.andersson@sonymobile.com,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/5] clk: qcom: msm8916: Move xo and sleep clocks into
 DT
Message-ID: <20151121004130.GE28998@codeaurora.org>
References: <1447941480-27487-1-git-send-email-georgi.djakov@linaro.org>
 <1447941480-27487-2-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1447941480-27487-2-git-send-email-georgi.djakov@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11/19, Georgi Djakov wrote:
> Move the xo and sleep clocks to device-tree, instead of hard-coding
> them in the driver. This allows us to insert the RPM clocks (if they
> are enabled) in between the on-board oscillators and the actual clock.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
