Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20170216175318.fuj375743jt43um4@lukather>
References: <20170214213005.2848151-1-arnd@arndb.de> <20170216175318.fuj375743jt43um4@lukather>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 13 Mar 2017 17:24:10 +0100
Message-ID: <CAK8P3a13rqommB90NP_aNPgcoYXb9u=LYs7ep3U=c3C6-3wPHA@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi: ccu-sun5i needs nkmp
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Feb 16, 2017 at 6:53 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Tue, Feb 14, 2017 at 10:29:45PM +0100, Arnd Bergmann wrote:
>> A randconfig build ran into this rare link error:
>>
>> drivers/clk/sunxi-ng/ccu-sun5i.o:(.data.__compound_literal.1+0x4): undefined reference to `ccu_nkmp_ops'
>> drivers/clk/sunxi-ng/ccu-sun5i.o:(.data.__compound_literal.7+0x4): undefined reference to `ccu_nkmp_ops'
>>
>> This adds the missing 'select'.
>>
>> Fixes: 5e73761786d6 ("clk: sunxi-ng: Add sun5i CCU driver")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Queued as a fix for 4.11, thanks!

I just checked my old patches and this seems to still be required as of
4.11-rc2. I see it in linux-next through sunxi/sunxi/for-next, but not as
part of a clk-fixes merge.

    Arnd
