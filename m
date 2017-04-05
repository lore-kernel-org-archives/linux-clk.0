Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:46748 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752189AbdDEWhg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Apr 2017 18:37:36 -0400
Date: Wed, 5 Apr 2017 15:37:34 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gdsc: Fix the vfe1 powerdomain name
Message-ID: <20170405223734.GK7065@codeaurora.org>
References: <1490255020-31616-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1490255020-31616-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 03/23, Rajendra Nayak wrote:
> Fix a typo which caused both vfe0 and vfe1 powerdomains to be
> named as vfe0
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Applied to clk-next + added a fixes tag.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
