Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:40480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750807AbeDFSSi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Apr 2018 14:18:38 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: ilialin@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        sboyd@codeaurora.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <024f01d3c1cb$304eaa60$90ebff20$@codeaurora.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
        rnayak@codeaurora.org, robh@kernel.org, will.deacon@arm.com,
        amit.kucheria@linaro.org, tfinkel@codeaurora.org,
        nicolas.dechesne@linaro.org, celster@codeaurora.org
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
 <1518616792-29028-4-git-send-email-ilialin@codeaurora.org>
 <152148100496.242365.3846617702949655708@swboyd.mtv.corp.google.com>
 <024f01d3c1cb$304eaa60$90ebff20$@codeaurora.org>
Message-ID: <152303871765.143116.6979602150972963768@swboyd.mtv.corp.google.com>
Subject: RE: [PATCH v3 03/10] clk: qcom: Add CPU clock driver for msm8996
Date: Fri, 06 Apr 2018 11:18:37 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting ilialin@codeaurora.org (2018-03-22 03:47:30)
> 
> I will have to change the clk_hw_unregister_fixed_rate() as well then, right? This will be an API change.

You won't need to unregister anything? devm will take care of it.
