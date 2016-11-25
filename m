Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <20161124021056.GJ6095@codeaurora.org>
References: <1477503088-26508-1-git-send-email-yamada.masahiro@socionext.com>
 <1477503088-26508-2-git-send-email-yamada.masahiro@socionext.com>
 <20161124000503.GE6095@codeaurora.org> <CAK7LNAQ6XeSHd7DbvD1jWeMfOqk8+R27Q-fNDWtXxpRd=OFgjA@mail.gmail.com>
 <20161124021056.GJ6095@codeaurora.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 25 Nov 2016 20:55:30 +0900
Message-ID: <CAK7LNASJ7nA7rmJdmF_1xei7qG+3CTd-8UgJoPtAzcvZ0N7ckw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: uniphier: add clock data for cpufreq
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,


2016-11-24 11:10 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:

>> If I drop 32bit SoC things, and send v2 only for 64bit SoCs,
>> is that acceptable for 4.10-rc1?
>
> Sure. That sounds fine for now. I'll reply to your other thread
> with a plan of attack on how to do the framework changes. I think
> we need to do those regardless of the outcome of your
> investigation.

I posted v2 yesterday.


-- 
Best Regards
Masahiro Yamada
