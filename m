Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:41328 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750970AbeEBJTR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 May 2018 05:19:17 -0400
MIME-Version: 1.0
In-Reply-To: <152521142011.138124.3008284989746799940@swboyd.mtv.corp.google.com>
References: <1524741668-158135-1-git-send-email-weiyongjun1@huawei.com> <152521142011.138124.3008284989746799940@swboyd.mtv.corp.google.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Wed, 2 May 2018 12:19:15 +0300
Message-ID: <CAHb3i=vYwGAwAcyQVrsZVgc3xq2dSw58Zi9RtokauEjkoA+LpA@mail.gmail.com>
Subject: Re: [PATCH -next] clk: npcm7xx: fix return value check in npcm7xx_clk_init()
To: Stephen Boyd <sboyd@kernel.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

I added the fix Wei Yongjun indicated ( Thanks Wei !)
and another fix similar to the above + error print change.

I'm a newbie... what's scripts/coccinelle/ script ?
I just made a new patch same way I did before. Is this OK?

On Wed, May 2, 2018 at 12:50 AM, Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Wei Yongjun (2018-04-26 04:21:08)
>> In case of error, the function ioremap() returns NULL pointer not
>> ERR_PTR(). The IS_ERR() test in the return value check should be
>> replaced with NULL test.
>>
>> Fixes: fcfd14369856 ("clk: npcm7xx: add clock controller")
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>
> Have you made this into a scripts/coccinelle/ script I can run?
>
> Applied to clk-next
