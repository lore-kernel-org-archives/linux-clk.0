Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965504AbeCSRtT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Mar 2018 13:49:19 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Ilia Lin <ilialin@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        sboyd@codeaurora.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1518616792-29028-7-git-send-email-ilialin@codeaurora.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
        rnayak@codeaurora.org, robh@kernel.org, will.deacon@arm.com,
        amit.kucheria@linaro.org, tfinkel@codeaurora.org,
        ilialin@codeaurora.org, nicolas.dechesne@linaro.org,
        celster@codeaurora.org
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
 <1518616792-29028-7-git-send-email-ilialin@codeaurora.org>
Message-ID: <152148175721.242365.10681079887712146412@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 06/10] clk: qcom: cpu-8996: Add support to switch below 600Mhz
Date: Mon, 19 Mar 2018 10:49:17 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Ilia Lin (2018-02-14 05:59:48)
> From: Rajendra Nayak <rnayak@codeaurora.org>
> 
> The CPU clock controllers primary PLL operates on a single VCO range,

s/controllers/controller's/

> between 600Mhz and 3Ghz. However the CPUs do support OPPs with
> frequencies between 300Mhz and 600Mhz. In order to support running the

capitalize 'h' in units please.

> CPUs at those frequencies we end up having to lock the PLL at twice the
> rate and drive the CPU clk via the PLL/2 output and SMUX.
> 
> So for frequencies above 600Mhz we follow the following path
>  Primary PLL --> PLL_EARLY --> PMUX(1) --> CPU clk
> and for frequencies between 300Mhz and 600Mhz we follow
>  Primary PLL --> PLL/2 --> SMUX(1) --> PMUX(0) --> CPU clk
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>

Rest looks ok, please resend.
