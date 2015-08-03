Return-Path: <sudeep.holla@arm.com>
Message-ID: <55BF4003.3040708@arm.com>
Date: Mon, 03 Aug 2015 11:18:43 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Mike Turquette <mturquette@baylibre.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Pawel Moll <Pawel.Moll@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] Move clk-sp810 to assigned clock parents
References: <55BBB2FC.9030102@codeaurora.org> <1438386285-5070-1-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438386285-5070-1-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 01/08/15 00:44, Stephen Boyd wrote:
> This patch set converts this code to use the assigned-clock-parents
> property instead of doing some interesting stuff in the .prepare
> op. I can route the dts patches through arm-soc but I'd like to take
> the clk patch through clk tree because it removes some usage of the
> struct clk based provider APIs that we're trying to get rid of. Also,
> this is completely untested, so testing would be appreciated.
> Can this be tested with qemu? I haven't tried but I was thinking
> that might be an option.
>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
>

Tested-by: Sudeep Holla <sudeep.holla@arm.com>
(Tested the series on Juno R0 and Vexpress TC2 platform)

Regards,
Sudeep
