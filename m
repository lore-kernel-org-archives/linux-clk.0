Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965901AbeCSRpy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Mar 2018 13:45:54 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Ilia Lin <ilialin@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        sboyd@codeaurora.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1518616792-29028-3-git-send-email-ilialin@codeaurora.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, mark.rutland@arm.com,
        will.deacon@arm.com, rnayak@codeaurora.org, ilialin@codeaurora.org,
        amit.kucheria@linaro.org, nicolas.dechesne@linaro.org,
        celster@codeaurora.org, tfinkel@codeaurora.org
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
 <1518616792-29028-3-git-send-email-ilialin@codeaurora.org>
Message-ID: <152148155340.242365.15501379032374522306@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 02/10] clk: qcom: Make clk_alpha_pll_configure available to
 modules
Date: Mon, 19 Mar 2018 10:45:53 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Ilia Lin (2018-02-14 05:59:44)
> From: Rajendra Nayak <rnayak@codeaurora.org>
> 
> Allow clk_alpha_pll_configure to be called from loadable
> kernel modules.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> ---

Applied to clk-next

