Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:41546 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932484AbcKWTAS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2016 14:00:18 -0500
Date: Wed, 23 Nov 2016 11:00:15 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ritesh Harjani <riteshh@codeaurora.org>
Cc: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        adrian.hunter@intel.com, andy.gross@linaro.org,
        shawn.lin@rock-chips.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, david.brown@linaro.org,
        linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org,
        alex.lemberg@sandisk.com, mateusz.nowak@intel.com,
        Yuliy.Izrailov@sandisk.com, asutoshd@codeaurora.org,
        david.griego@linaro.org, stummala@codeaurora.org,
        venkatg@codeaurora.org, rnayak@codeaurora.org,
        pramod.gurav@linaro.org, jeremymc@redhat.com
Subject: Re: [PATCH v9 01/16] clk: qcom: Add rcg ops to return floor value
 closest to the requested rate
Message-ID: <20161123190015.GC25626@codeaurora.org>
References: <1479710246-26676-1-git-send-email-riteshh@codeaurora.org>
 <1479710246-26676-2-git-send-email-riteshh@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1479710246-26676-2-git-send-email-riteshh@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11/21, Ritesh Harjani wrote:
> From: Rajendra Nayak <rnayak@codeaurora.org>
> 
> The default behaviour with clk_rcg2_ops is for the
> clk_round_rate()/clk_set_rate() to return/set a ceil clock
> rate closest to the requested rate by looking up the corresponding
> frequency table.
> However, we do have some instances (mainly sdcc on various platforms)
> of clients expecting a clk_set_rate() to set a floor value instead.
> Add a new clk_rcg2_floor_ops to handle this for such specific
> rcg instances
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Ritesh Harjani <riteshh@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
