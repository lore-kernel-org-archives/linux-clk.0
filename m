Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:47736 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751435AbdA0Vdz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Jan 2017 16:33:55 -0500
Date: Fri, 27 Jan 2017 13:33:53 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jeremy McNicoll <jeremymc@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-clk@vger.kernel.org, andy.gross@linaro.org, robh@kernel.org,
        arnd@arndb.de, bjorn.andersson@linaro.org, riteshh@codeaurora.org,
        git@kchr.de, ulf.hansson@linaro.org, jszhang@marvell.com
Subject: Re: [PATCH V4 2/6] dt-bindings: qcom: clk: Add missing binding for
 SDCHI enablement on Nexus 5X/6P
Message-ID: <20170127213353.GJ8801@codeaurora.org>
References: <1485508205-1904-1-git-send-email-jeremymc@redhat.com>
 <1485508205-1904-3-git-send-email-jeremymc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1485508205-1904-3-git-send-email-jeremymc@redhat.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 01/27, Jeremy McNicoll wrote:
> AHB clock branch is needed in order to enable SDHCI
> on msm899(2/4).
> 
> Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
