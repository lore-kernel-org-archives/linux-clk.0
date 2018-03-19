Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S970242AbeCSVVY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Mar 2018 17:21:24 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Ilia Lin <ilialin@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        sboyd@codeaurora.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <41f3b246-43f4-450d-5c6b-34cdad7b15dd@arm.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
        rnayak@codeaurora.org, robh@kernel.org, will.deacon@arm.com,
        amit.kucheria@linaro.org, tfinkel@codeaurora.org,
        nicolas.dechesne@linaro.org, celster@codeaurora.org
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
 <1518616792-29028-9-git-send-email-ilialin@codeaurora.org>
 <152147863176.242365.17292287330283256524@swboyd.mtv.corp.google.com>
 <41f3b246-43f4-450d-5c6b-34cdad7b15dd@arm.com>
Message-ID: <152149448251.242365.16980775001987673274@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 08/10] clk: qcom: Add ACD path to CPU clock driver for msm8996
Date: Mon, 19 Mar 2018 14:21:22 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Robin Murphy (2018-03-19 11:16:15)
> On 19/03/18 16:57, Stephen Boyd wrote:
> [...]
> >> +
> > 
> >> +                       writel_relaxed(SSSCTL_VAL, vbases[APC_BASE] +
> >> +                                       PWRCL_REG_OFFSET + SSSCTL_OFFSET);
> >> +               /* Ensure SSSCTL config goes through before enabling ACD. */
> >> +               mb();
> > 
> > Use writel instead.
> 
> Note that writel() only gives an implicit wmb() *before* the store to 
> ensure ordering against any previous writes. If this code really needs 
> to ensure that the given write has definitely completed before any other 
> accesses happen, then it still needs an explicit barrier *after* the 
> write*(), unless perhaps the next access is always guaranteed to be a 
> non-relaxed write (thus implicitly providing a suitable DSB).
> 

Ah right. So this should be a wmb() too? I suspect it's to order with
the write to the l2 indirect registers, but reading that register before
the MMIO write is not a problem. The comment above the l2 accessors
could be slightly more specific here and it would help immensely.
