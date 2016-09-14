Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <4600074.xAL28UziL1@wuerfel>
References: <1473834587-22526-1-git-send-email-baoyou.xie@linaro.org> <4600074.xAL28UziL1@wuerfel>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 Sep 2016 11:04:29 +0200
Message-ID: <CACRpkdb2BK2_CeSJ8kbuZH6_WwDRqabhcuMqRb+etCBwT80K7A@mail.gmail.com>
Subject: Re: [PATCH] clk: versatile: add missing header dependencies
To: Arnd Bergmann <arnd@arndb.de>
Cc: Baoyou Xie <baoyou.xie@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, xie.baoyou@zte.com.cn
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Sep 14, 2016 at 9:31 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday, September 14, 2016 2:29:47 PM CEST Baoyou Xie wrote:
>> We get 1 warning when building kernel with W=1:
>> drivers/clk/versatile/clk-realview.c:54:13: warning: no previous prototype for 'realview_clk_init' [-Wmissing-prototypes]
>>
>> In fact, this function is declared in clk-realview.h,
>> so this patch add missing header dependencies.
>>
>> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
>>
>
> Please leave this one for now. We are in the process of removing the
> last caller of this function, and should just remove the header file
> and the function definition in the next release.

+1 on this, leave it. I can clean it up for v4.10 or even
for an -rc if you want it real neat in v4.9.

Yours,
Linus Walleij
