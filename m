Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751372AbeCPWqW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Mar 2018 18:46:22 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1516710285-23683-1-git-send-email-aisheng.dong@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, aisheng.dong@codeaurora.org,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <1516710285-23683-1-git-send-email-aisheng.dong@nxp.com>
Message-ID: <152124038126.242365.15669852275487154303@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/1] clk: add more __must_check for bulk APIs
Date: Fri, 16 Mar 2018 15:46:21 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Dong Aisheng (2018-01-23 04:24:45)
> we need it even when !CONFIG_HAVE_CLK because it allows
> us to catch missing checking return values in the non-clk
> compile configurations too. More test coverage.
> 
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-next

