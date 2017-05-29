Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170527201913.GN12920@tuxbook>
References: <20170419091326.11226-1-linus.walleij@linaro.org>
 <20170419091326.11226-5-linus.walleij@linaro.org> <20170527201913.GN12920@tuxbook>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 29 May 2017 14:23:01 +0200
Message-ID: <CACRpkdYtMfhpuY-9siVuRULuPh542rK==m+mrmfmfr3y4KdWiw@mail.gmail.com>
Subject: Re: [PATCH 5/5 v2] clk: qcom: Add support for MSM8660 LCC
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Sat, May 27, 2017 at 10:19 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Wed 19 Apr 02:13 PDT 2017, Linus Walleij wrote:
>> diff --git a/drivers/clk/qcom/lcc-msm8660.c b/drivers/clk/qcom/lcc-msm8660.c
> [..]
>> +/* The vendor code uses PLL4 as parent everywhere */
>> +static const struct parent_map lcc_parent_map[] = {
>> +     { P_PXO, 0 },
>> +     { P_CXO, 1 },
>> +     /* Select RPM PLL4, but also used for selecting LPA PLL0 */
>> +     { P_PLL4_LPA_PLL0, 2 },
>> +     /* Will just ground the line */
>> +     { P_GND, 6 },
>> +};
>> +
>> +static const char * const lcc_parent_tbl[] = {
>> +     "pxo",
>> +     "cxo",
>> +     /*
>> +      * PLL4 is an RPM clock on MSM8660/APQ8060, set to "pll4" for this
>> +      * If we enable and mux in the LPA_PLL0 on this platform, we can
>> +      * set this to "lpa_pll0" instead
>> +      */
>> +     "pll4_clk",
>> +     "gnd", /* This is a very inactive parent */
>> +};
>> +
>> +/*
>> + * This table is evidently for using PLL4 as parent, if we start using
>> + * LPA_PLL0 we need to provide a second table.
>> + */
>
> Aren't you muxing in LPA_PLL0 as source instead of PLL4 at the bottom of
> probe()? And as you hard code that selector, shouldn't the parent table
> reference lpa_pll0?

I think it's just a naming problem.

I'm actually using:

>> +     {   768000, P_PLL4_LPA_PLL0, 4,  1, 176 },

Because as far as I can tell, RPM clock PLL4 and LPA_PLL0 is the
same thing, just different names.

I don't think the 8660 has its own LPA PLL, it's just the layers of
confusion in the code that make it seem like so.

Or maybe someone was in the planning stages of adding the LPA PLL
to the hardware and never got there. So some code confusingly
refers to that...

I would really like to see how it actually works.

BTW: do you have a pointer to a vendor tree for a Sony thing using
the MSM8660 or APQ8060 that I can look at? I need more known
working code to inspect.

Yours,
Linus Walleij
