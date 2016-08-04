Return-Path: <robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20160804212553.GB15690@codeaurora.org>
References: <CAK7LNAQ5uRoSEEuKys9Gs-2HFAJCbmnFDjxajWfK9ng_dtZ8yw@mail.gmail.com>
 <20160804212553.GB15690@codeaurora.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Aug 2016 17:02:07 -0500
Message-ID: <CAL_JsqJT2R65TU52bXTdbBiFBEESnFnjZkwE51ojq7DNwp5ofg@mail.gmail.com>
Subject: Re: of_clk_add_(hw_)providers multipule times for one node?
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Aug 4, 2016 at 4:25 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> +Rob in case he has any insight
>
> On 07/09, Masahiro Yamada wrote:
>> Hi.
>>
>> I think the current code allows to add
>> clk_providers multiple times against one DT node.
>>
>> Are there cases that really need to do so?
>
> If we have clk drivers that have a device driver structure and
> also use CLK_OF_DECLARE then we could get into a situation where
> they register two providers for the same device node. I can't
> think of any other situation where this would happen though.

In this case I'd think you could have some sort of hand-off. Perhaps
the code using CLK_OF_DECLARE can only do provide enable and get_rate
and then the full driver loads with more capabilities.

The other case I could think of is you need to match on more than just
the compatible, so the callbacks could have additional logic to match
against. But in that case, only one should succeed. Also, there's the
general problem that we can't support 2 drivers both matching where
one is a better match than the other.

Rob
