Return-Path: <sboyd@codeaurora.org>
Message-ID: <55C24E56.3020004@codeaurora.org>
Date: Wed, 05 Aug 2015 10:56:38 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Pawel Moll <pawel.moll@arm.com>
CC: Mike Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sudeep Holla <Sudeep.Holla@arm.com>
Subject: Re: [PATCH 1/3] clk: versatile: Switch to assigned clock parents
References: <55BBB2FC.9030102@codeaurora.org>  <1438386285-5070-1-git-send-email-sboyd@codeaurora.org>  <1438386285-5070-2-git-send-email-sboyd@codeaurora.org>  <1438610480.2142.14.camel@arm.com> <55BFAB11.7080600@codeaurora.org> <1438770574.2142.80.camel@arm.com>
In-Reply-To: <1438770574.2142.80.camel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 08/05/2015 03:29 AM, Pawel Moll wrote:
>
> Right, that's probably my fault. The sp810 nodes appeared in the VE
> trees very early (in terms of the "DT era"), when we weren't so strict
> about documentation. So far, it would be fairly simple, something like
> the text below - feel free to take it, mend it, extend it with your
> changes and include in the series:
>
> Thanks!

Great! Can you please provide your signed-off-by? I can make it up into 
a patch with some commit text that either you or I provide and throw it 
into the series.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
