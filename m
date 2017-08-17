Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:56348 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753212AbdHQVGc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Aug 2017 17:06:32 -0400
Date: Thu, 17 Aug 2017 14:06:30 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Felipe Balbi <balbi@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-clk@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] usb: dwc3: of-simple: remove include of clk-provider.h
Message-ID: <20170817210630.GH2146@codeaurora.org>
References: <1502634071-2266-1-git-send-email-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1502634071-2266-1-git-send-email-shawnguo@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/13, Shawn Guo wrote:
> From: Shawn Guo <shawn.guo@linaro.org>
> 
> The header clk-provider.h is there for clock drivers (providers) to
> include, not client drivers (consumers).  That said,
> of_clk_get_parent_count() is a helper function for clock providers, not
> a clk API for consumers.
> 
> Let's replace of_clk_get_parent_count() with of_count_phandle_with_args()
> call, so that we can remove the include of clk-provider.h.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
