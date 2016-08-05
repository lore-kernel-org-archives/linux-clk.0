Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: prevent __of_clk_get_hw_from_provider() from
 returning NULL
To: Masahiro Yamada <yamada.masahiro@socionext.com>
References: <1468919039-23004-1-git-send-email-yamada.masahiro@socionext.com>
 <20160804205734.GA15690@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <792d2cb8-06bf-7406-b79a-06c16b977bd4@samsung.com>
Date: Fri, 05 Aug 2016 10:29:39 +0200
MIME-version: 1.0
In-reply-to: <20160804205734.GA15690@codeaurora.org>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 08/04/2016 10:57 PM, Stephen Boyd wrote:
> On 07/19, Masahiro Yamada wrote:
>> > The .get(_hw) callback of an OF clock provider can return a NULL
>> > pointer in some cases.
>> > 
>> > For example, of_clk_src_onecell_get() returns NULL for index 1 of a
>> > sparse array of clocks like follows:
>> > 
>> >   clk_num == 3
>> >   idx 0: UART clk
>> >   idx 1: NULL (no clk is allocated)
>> >   idx 2: I2C clk
>> > 
>> > In such cases, clk_get() successfully returns NULL.

I remember running into same issue before, we have addressed
it by initializing the array of clocks with some errno value,
e.g ERR_PTR(-ENOENT), so there is no chance to get NULL from
the array - either a valid clk pointer or an ERR_PTR() value.

--
Thanks,
Sylwester
