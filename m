Return-Path: <sboyd@codeaurora.org>
Date: Mon, 23 Nov 2015 16:53:24 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 2/3] clk: let of_clk_get_parent_name() fail for invalid
 clock-indices
Message-ID: <20151124005324.GM19156@codeaurora.org>
References: <1448004981-11133-1-git-send-email-yamada.masahiro@socionext.com>
 <1448004981-11133-2-git-send-email-yamada.masahiro@socionext.com>
 <20151120174509.GQ32672@codeaurora.org>
 <CAK7LNASQGBn32N4=CM+notaVv1ZLotaydRhe-GiOF6nLhbmABA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAK7LNASQGBn32N4=CM+notaVv1ZLotaydRhe-GiOF6nLhbmABA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/22, Masahiro Yamada wrote:
> 2015-11-21 2:45 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> >
> > What is np pointing at? Something like:
> >
> >         consumer {
> >                 clocks = <&oscillator 0>;
> >         };
> >
> > Which would be invalid DT because oscillator doesn't have an
> > output for index 0?
> 
> 
> You are right.  My example was confusing.
> 
> 
> 
>          oscillator: oscillator {
>                  compatible = "myclocktype";
>                  #clock-cells = <1>;
>                  clock-indices = <1>, <3>;
>                  clock-output-names = "clka", "clkb";
>          };
> 
>          consumer {
>                  compatible = "myclockconsumer";
>                  clocks = <&oscillator 0>;
>          };
> 
> Currently, of_clk_get_parent_name(consumer_np, 0) returns "clks", but
> should return NULL;
> 
> I will rephrase the git-log in v2.
> 

Ok. Thanks.

> > Why can't we leave everything in place and check count == len at
> > the end? i.e.
> >
> >         of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
> >                 if (index == pv) {
> >                         index = count;
> >                         break;
> >                 }
> >                 count++;
> >         }
> >
> >         if (count == of_property_count_u32_elems(clkspec.np, "clock-indices"))
> >                 return NULL
> >
> 
> 
> Of course we can, although we have to mention "clock-indices" twice.
> 
> A good thing for of_get_property() is that we can get both the value
> and the length
> at the same time.
> 

Ok. Well if we don't want to count them again, perhaps a goto
jump over an unconditional return NULL would be better?

	of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
		if (index == pv) {
			index = count;
			goto found;
		}
		count++;
	}

	return NULL;
found:

Or since the macro for of_property_for_each_u32() tests the vp
poitner for NULL, we can check that pointer too...

	of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
		if (index == pv) {
			index = count;
			break;
		}
		count++;
	}

	/* We didn't find anything */
	if (!vp)
		return NULL;

I guess I prefer the latter approach here.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
