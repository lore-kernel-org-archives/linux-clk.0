Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:33002 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751797AbcKRORJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Nov 2016 09:17:09 -0500
Date: Fri, 18 Nov 2016 08:17:06 -0600
From: Rob Herring <robh@kernel.org>
To: Ritesh Harjani <riteshh@codeaurora.org>
Cc: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        adrian.hunter@intel.com, sboyd@codeaurora.org,
        andy.gross@linaro.org, shawn.lin@rock-chips.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        david.brown@linaro.org, linux-arm-msm@vger.kernel.org,
        georgi.djakov@linaro.org, alex.lemberg@sandisk.com,
        mateusz.nowak@intel.com, Yuliy.Izrailov@sandisk.com,
        asutoshd@codeaurora.org, david.griego@linaro.org,
        stummala@codeaurora.org, venkatg@codeaurora.org,
        rnayak@codeaurora.org, pramod.gurav@linaro.org, jeremymc@redhat.com
Subject: Re: [PATCH v8 05/16] dt-bindings: sdhci-msm: Add xo property
Message-ID: <20161118141706.syt4gnhf4zur746i@rob-hp-laptop>
References: <20161116191335.GH25626@codeaurora.org>
 <1479343623-31163-1-git-send-email-riteshh@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1479343623-31163-1-git-send-email-riteshh@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Nov 17, 2016 at 06:17:03AM +0530, Ritesh Harjani wrote:
> Add "xo" property which is tcxo clock.

Technically, xo is not a property, but a value.

Acked-by: Rob Herring <robh@kernel.org>

> 
> Signed-off-by: Ritesh Harjani <riteshh@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
>  1 file changed, 1 insertion(+)
