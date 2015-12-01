Return-Path: <sboyd@codeaurora.org>
Date: Mon, 30 Nov 2015 16:44:46 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 2/3] clk: let of_clk_get_parent_name() fail for invalid
 clock-indices
Message-ID: <20151201004446.GC17532@codeaurora.org>
References: <1448004981-11133-1-git-send-email-yamada.masahiro@socionext.com>
 <1448004981-11133-2-git-send-email-yamada.masahiro@socionext.com>
 <20151120174509.GQ32672@codeaurora.org>
 <CAK7LNASQGBn32N4=CM+notaVv1ZLotaydRhe-GiOF6nLhbmABA@mail.gmail.com>
 <20151124005324.GM19156@codeaurora.org>
 <CAK7LNASVzPndasdNE+EX1pB_VmDp_OjBYv2D1FKqL8JbCFkCuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAK7LNASVzPndasdNE+EX1pB_VmDp_OjBYv2D1FKqL8JbCFkCuA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/30, Masahiro Yamada wrote:
> Hi Stephen,
> 
> 
> 
> >>
> >> Of course we can, although we have to mention "clock-indices" twice.
> >>
> >> A good thing for of_get_property() is that we can get both the value
> >> and the length
> >> at the same time.
> >>
> >
> > Ok. Well if we don't want to count them again, perhaps a goto
> > jump over an unconditional return NULL would be better?
> >
> >         of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
> >                 if (index == pv) {
> >                         index = count;
> >                         goto found;
> >                 }
> >                 count++;
> >         }
> >
> >         return NULL;
> > found:
> >
> > Or since the macro for of_property_for_each_u32() tests the vp
> > poitner for NULL, we can check that pointer too...
> >
> >         of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
> >                 if (index == pv) {
> >                         index = count;
> >                         break;
> >                 }
> >                 count++;
> >         }
> >
> >         /* We didn't find anything */
> >         if (!vp)
> >                 return NULL;
> >
> > I guess I prefer the latter approach here.
> >
> 
> No.
> 
> Neither of your two suggestions works because they are false positive.
> 

So if (!vp && count) then?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
