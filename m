Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pf0-f177.google.com ([209.85.192.177]:35703 "EHLO
        mail-pf0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751024AbdE3TXq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2017 15:23:46 -0400
Received: by mail-pf0-f177.google.com with SMTP id n23so80789526pfb.2
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2017 12:23:46 -0700 (PDT)
Date: Tue, 30 May 2017 12:24:29 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 5/5 v2] clk: qcom: Add support for MSM8660 LCC
Message-ID: <20170530192429.GT12920@tuxbook>
References: <20170419091326.11226-1-linus.walleij@linaro.org>
 <20170419091326.11226-5-linus.walleij@linaro.org>
 <20170527201913.GN12920@tuxbook>
 <CACRpkdYtMfhpuY-9siVuRULuPh542rK==m+mrmfmfr3y4KdWiw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CACRpkdYtMfhpuY-9siVuRULuPh542rK==m+mrmfmfr3y4KdWiw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon 29 May 05:23 PDT 2017, Linus Walleij wrote:

> On Sat, May 27, 2017 at 10:19 PM, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Wed 19 Apr 02:13 PDT 2017, Linus Walleij wrote:
> >> diff --git a/drivers/clk/qcom/lcc-msm8660.c b/drivers/clk/qcom/lcc-msm8660.c
> > [..]
> >> +/* The vendor code uses PLL4 as parent everywhere */
> >> +static const struct parent_map lcc_parent_map[] = {
> >> +     { P_PXO, 0 },
> >> +     { P_CXO, 1 },
> >> +     /* Select RPM PLL4, but also used for selecting LPA PLL0 */
> >> +     { P_PLL4_LPA_PLL0, 2 },
> >> +     /* Will just ground the line */
> >> +     { P_GND, 6 },
> >> +};
> >> +
> >> +static const char * const lcc_parent_tbl[] = {
> >> +     "pxo",
> >> +     "cxo",
> >> +     /*
> >> +      * PLL4 is an RPM clock on MSM8660/APQ8060, set to "pll4" for this
> >> +      * If we enable and mux in the LPA_PLL0 on this platform, we can
> >> +      * set this to "lpa_pll0" instead
> >> +      */
> >> +     "pll4_clk",
> >> +     "gnd", /* This is a very inactive parent */
> >> +};
> >> +
> >> +/*
> >> + * This table is evidently for using PLL4 as parent, if we start using
> >> + * LPA_PLL0 we need to provide a second table.
> >> + */
> >
> > Aren't you muxing in LPA_PLL0 as source instead of PLL4 at the bottom of
> > probe()? And as you hard code that selector, shouldn't the parent table
> > reference lpa_pll0?
> 
> I think it's just a naming problem.
> 
> I'm actually using:
> 
> >> +     {   768000, P_PLL4_LPA_PLL0, 4,  1, 176 },
> 
> Because as far as I can tell, RPM clock PLL4 and LPA_PLL0 is the
> same thing, just different names.
> 
> I don't think the 8660 has its own LPA PLL, it's just the layers of
> confusion in the code that make it seem like so.
> 
> Or maybe someone was in the planning stages of adding the LPA PLL
> to the hardware and never got there. So some code confusingly
> refers to that...
> 
> I would really like to see how it actually works.
> 

8660 and 8960 are basically different revisions of the same SoC, so
reviewing clock-8x60.c and clock-8960.c found in below repository gives
some additional insight.

clock-8x60.c mentions LPA_PLL0 in _one_ comment and carries the
definitions for a LCC_PLL0 clock, but no references are made to these
defines. The code ever only references "pll4".

clock-8960.c goes beyond this and actually reference the LCC_PLL0
registers and they are all used to query and configure "pll4".


So AFAICT PLL4 is controlled/implemented in the LCC block and is called
PLL0 in that context and that on 8660 it's completely controlled by the
RPM.

As such I think it makes sense - on 8660 - to just reference "pll4",
perhaps with some comment in the code referencing LCC_PLL0 as the actual
implementation.

> BTW: do you have a pointer to a vendor tree for a Sony thing using
> the MSM8660 or APQ8060 that I can look at? I need more known
> working code to inspect.
> 

The tree I used for AOSP work on Xperia S can be found here:

https://github.com/sonyxperiadev/kernel/tree/nozomi/M8260AAABQNLZA30145

Regards,
Bjorn
