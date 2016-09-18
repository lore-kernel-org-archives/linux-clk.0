Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:21426 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752152AbcIRQZd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 18 Sep 2016 12:25:33 -0400
MIME-Version: 1.0
In-Reply-To: <20160917085606.GA17799@kroah.com>
References: <1463755793-9131-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNATY9wTjHjsLtGHAJ-DueqXcCHdrw_uoSfyTOEmpp-ZPGw@mail.gmail.com>
 <20160916231245.GX7243@codeaurora.org> <20160917085606.GA17799@kroah.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 19 Sep 2016 01:25:01 +0900
Message-ID: <CAK7LNASJjef7-Brn+uuan+cZtpBSjYwL-wgtcrv7vuYAFLEs-w@mail.gmail.com>
Subject: Re: [PATCH v2] clk: probe common clock drivers earlier
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jay Sternberg <jay.e.sternberg@intel.com>,
        Jens Axboe <axboe@fb.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Matias_Bj=C3=B8rling?= <m@bjorling.me>,
        Krzysztof Kozlowski <k.kozlowski@samsung.com>,
        Alan Tull <atull@opensource.altera.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Valentin Rothberg <valentinrothberg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Greg,

2016-09-17 17:56 GMT+09:00 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
> On Fri, Sep 16, 2016 at 04:12:45PM -0700, Stephen Boyd wrote:
>> On 09/16, Masahiro Yamada wrote:

>> >
>> >
>> > What do you think of this patch?
>> >
>>
>> I assumed Greg would pick it up given that Mike already acked it.
>
> I was going to take it?  It's not in my queue, sorry, can someone please
> resend it with the acks and I will pick it up...
>
> thanks,
>
> greg k-h



I did so with Michael's Acked-by:

https://patchwork.kernel.org/patch/9337959/


Thanks!




-- 
Best Regards
Masahiro Yamada
