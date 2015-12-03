Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <20151201084048.GC26865@codeaurora.org>
References: <1448873164-22415-1-git-send-email-yamada.masahiro@socionext.com>
	<20151201005802.GE17532@codeaurora.org>
	<CAK7LNAT5Q+MVj8KvT_WMwtAFhFN5Q6yXk6vY9oNpoBtEBs-C6Q@mail.gmail.com>
	<20151201084048.GC26865@codeaurora.org>
Date: Thu, 3 Dec 2015 11:25:54 +0900
Message-ID: <CAK7LNAQeJ2OdxxoRDnOci_qLpgS3DneF-SXatvaDC8yEHk8dLw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: let of_clk_get_parent_name() fail for invalid clock-indices
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-gpio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,


2015-12-01 17:40 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:

>>
>>
>> Why do you insist on of_property_for_each_u32()?
>> It no longer fits in here.
>>
>
> Sure. The other problem is be32_to_cpup() usage. I'd rather that
> we use the style of looping that of_property_for_each_u32 does.
> It doesn't make any assumptions about how the data is in memory.
> Instead we call the iterator function and it gets the next value.

OK, let's avoid be32_to_cpup().


> So here's another try, that open codes the macro so we can add
> our count inside and check for a boolean property without
> duplication.
>
> ----8<----
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index a66efc9d8bfc..a2112cdab191 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3059,6 +3059,7 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
>         u32 pv;
>         int rc;
>         int count;
> +       int len;
>         struct clk *clk;
>
>         rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
> @@ -3067,18 +3068,24 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
>                 return NULL;
>
>         index = clkspec.args_count ? clkspec.args[0] : 0;
> -       count = 0;
> +       len = 0;
>
> -       /* if there is an indices property, use it to transfer the index
> +       /*
> +        * if there is an indices property, use it to transfer the index
>          * specified into an array offset for the clock-output-names property.
>          */
> -       of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
> +       prop = of_find_property(clkspec.np, "clock-indices", &len);
> +       for (vp = of_prop_next_u32(prop, NULL, &pv), count = 0;
> +            vp;
> +            vp = of_prop_next_u32(prop, vp, &pv), count++) {
>                 if (index == pv) {
>                         index = count;
>                         break;
>                 }
> -               count++;
>         }
> +       /* We went off the end of 'clock-indices' without finding it */
> +       if (prop && count == len / sizeof(u32))
> +               return NULL;
>
>         if (of_property_read_string_index(clkspec.np, "clock-output-names",
>                                           index,


Hmm, the big "for" loop is the same as the expansion of
of_property_for_each_u32(),
this does not look cool to me.

OK, let's go back to of_property_for_each_u32() and choose the less
invasive fix.
I've sent v3.

BTW, I noticed that you had already applied the wrong version into the
clk-msm8996 branch.
(commit 6fe940981d)

It is wrong as I mentioned in my previous reply.
Please drop it.


-- 
Best Regards
Masahiro Yamada
