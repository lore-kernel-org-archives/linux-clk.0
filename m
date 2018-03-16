Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751348AbeCPWod (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Mar 2018 18:44:33 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Dong Aisheng <aisheng.dong@nxp.com>, linux-doc@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1516369035-24740-1-git-send-email-aisheng.dong@nxp.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <1516369035-24740-1-git-send-email-aisheng.dong@nxp.com>
Message-ID: <152124027193.242365.12812965857871498513@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/1] Documentation: clk: enable lock is not held for
 clk_is_enabled API
Date: Fri, 16 Mar 2018 15:44:31 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Dong Aisheng (2018-01-19 05:37:15)
> The core does not need to hold enable lock for clk_is_enabled API.
> Update the doc to reflect it.
> 
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-next

