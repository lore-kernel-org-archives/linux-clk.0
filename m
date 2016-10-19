Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:43006 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753152AbcJSUPO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Oct 2016 16:15:14 -0400
Date: Wed, 19 Oct 2016 13:15:11 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: uniphier: rename MIO clock to SD clock for Pro5,
 PXs2, LD20 SoCs
Message-ID: <20161019201511.GZ8871@codeaurora.org>
References: <1476865327-13039-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1476865327-13039-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 10/19, Masahiro Yamada wrote:
> I made a mistake as for naming for this block.  The MIO block is not
> implemented for these 3 SoCs in the first place.  The current naming
> will be a trouble if an SoC with both MIO and SD-ctrl blocks appear
> in the future.
> 
> This driver has just been merged in the previous merge window.
> Rename it before the release.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
