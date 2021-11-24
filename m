Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE40C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 24 Nov 2021 04:23:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbhKXE0c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Nov 2021 23:26:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:34466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230478AbhKXE0c (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Nov 2021 23:26:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00C8660FD8;
        Wed, 24 Nov 2021 04:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637727803;
        bh=l+gGpMdnI+FW91V/lfL/ela6fiLw2fB7m1c09K6qES8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PpQqtPBwW9jprEnyFOl4/Mf3WBABQHDYmdA1YeN3WIat4qaTNBzUObNZTjvRD2Y2Q
         mocSwrYCDE3sQuOb5kznwkwYudOtzxL36yPAb80O6nL9ZlS/pnVkbQtvX5eUuKK+V4
         Jv0ZE4tCs+eQSZDlfCudEpESb4ZgIAQ1845IkuiKAd9q9G2B+2uOwptXX0/jJTpBUq
         hOezzb+ATPuT1/LG0X/vOd8qi61O5+yarn46aqVmSMioNuw5o3QMe25bPz7rSmac91
         v4q8V/kolDucEXnj4+zo9P147v7shTMv9HoMMuxL57JQGEXdpOlhU5Yu+cb/XUAB8F
         VUCHrR+tbpEvg==
Date:   Wed, 24 Nov 2021 09:53:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: clk-alpha-pll: Don't reconfigure running
 Trion
Message-ID: <YZ2+Nh0oiawTL/tQ@matsya>
References: <20211123161630.123222-1-bjorn.andersson@linaro.org>
 <20211123162508.153711-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123162508.153711-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-11-21, 08:25, Bjorn Andersson wrote:
> In the event that the bootloader has configured the Trion PLL as source
> for the display clocks, e.g. for the continuous splashscreen, then there
> will also be RCGs that are clocked by this instance.
> 
> Reconfiguring, and in particular disabling the output of, the PLL will
> cause issues for these downstream RCGs and has been shown to prevent
> them from being re-parented.
> 
> Follow downstream and skip configuration if it's determined that the PLL
> is already running.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
