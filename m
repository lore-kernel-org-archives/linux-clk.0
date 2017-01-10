Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:43744 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1031084AbdAJAk7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2017 19:40:59 -0500
Date: Mon, 9 Jan 2017 16:40:57 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Michael Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2] clk: cdce925: add support for CDCE913, CDCE937, and
 CDCE949
Message-ID: <20170110004057.GN17126@codeaurora.org>
References: <1483207476-10920-1-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1483207476-10920-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 01/01, Akinobu Mita wrote:
> The CDCE925 is a member of the CDCE(L)9xx programmable clock generator
> family.  There are also CDCE913, CDCE937, CDCE949 which have different
> number of PLLs and outputs.
> 
> The clk-cdce925 driver supports only CDCE925 in the family.  This adds
> support for the CDCE913, CDCE937, CDCE949, too.
> 
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Cc: Mike Looijmans <mike.looijmans@topic.nl>
> Cc: Michael Turquette <mturquette@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
