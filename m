Return-Path: <sboyd@codeaurora.org>
Date: Wed, 10 Aug 2016 16:23:07 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: prevent __of_clk_get_hw_from_provider() from
 returning NULL
Message-ID: <20160810232307.GK2996@codeaurora.org>
References: <1468919039-23004-1-git-send-email-yamada.masahiro@socionext.com>
 <20160804205734.GA15690@codeaurora.org>
 <CAK7LNAQL2u1YTxr_SWR6S_2aFPfXAPcaFfkWKSV_D-RU2vq7BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAK7LNAQL2u1YTxr_SWR6S_2aFPfXAPcaFfkWKSV_D-RU2vq7BQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/10, Masahiro Yamada wrote:
> 2016-08-05 5:57 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> > On 07/19, Masahiro Yamada wrote:
> >> The .get(_hw) callback of an OF clock provider can return a NULL
> >> pointer in some cases.
> >>
> >> For example, of_clk_src_onecell_get() returns NULL for index 1 of a
> >> sparse array of clocks like follows:
> >>
> >>   clk_num == 3
> >>   idx 0: UART clk
> >>   idx 1: NULL (no clk is allocated)
> >>   idx 2: I2C clk
> >>
> >> In such cases, clk_get() successfully returns NULL.
> >>
> >> A problem is that most drivers only check IS_ERR(), like follows:
> >>
> >>   clk = devm_clk_get(dev, NULL);
> >>   if (IS_ERR(clk))
> >>           return PTR_ERR(clk);
> >>
> >> It carries on moving forward and will probably be hit by a different
> >> error check with a different error message.
> >
> > NULL is a valid clk pointer, so we can't really do anything here
> > besides rely on driver authors to do the right thing.
> 
> 
> I still do not understand this.
> 
> 
> I think clk_get() should return > 0 pointer on success,
> error-pointer on failure.

Russell King has repeatedly stated that NULL is a valid return
value from clk_get(). I'm sure we can find numerous such
statements on the arm mailing list.

> 
> I have no idea when NULL is useful as a return value of clk_get().
> 

Perhaps the provider wants to avoid allocating anything for some
clk id and have the clk consumer API do nothing in this case?
Consumers can be unaware of this fact by having the provider
return NULL so things like clk_prepare/enable become nops. Of
course, we can't make things like clk_get_rate() useful in this
case, but at least we can have on/off simplified.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
