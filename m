Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <20160824180806.GE19826@codeaurora.org>
References: <CAK7LNAQ5uRoSEEuKys9Gs-2HFAJCbmnFDjxajWfK9ng_dtZ8yw@mail.gmail.com>
 <20160804212553.GB15690@codeaurora.org> <CAK7LNAQfwh3Z_=VWHvDi6EXFtVLuRMFVYzKMq8qCaZ30jfCq8g@mail.gmail.com>
 <20160808233711.GA2996@codeaurora.org> <CAK7LNAScz7bJABbOgUuvg9J-ORaiLEfpwA3yMP+bZbLgB+S3uQ@mail.gmail.com>
 <20160810230845.GH2996@codeaurora.org> <CAK7LNAQ9wgpHn2LXiFfbyp_j85h8ZkGnAP39eVj+jmKczi=VSA@mail.gmail.com>
 <CAK7LNAThC-oBV5qNRNLnkV_tS7JLZDVoeEYrJo_8LsbRftELew@mail.gmail.com> <20160824180806.GE19826@codeaurora.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 25 Aug 2016 11:36:47 +0900
Message-ID: <CAK7LNAQgzaZH7Ondt9r7yJ1iwSqyzqSOO+1oZvbaq_kmrPQeLQ@mail.gmail.com>
Subject: Re: of_clk_add_(hw_)providers multipule times for one node?
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh@kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,


2016-08-25 3:08 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> (Please trim replies)
>
> On 08/24, Masahiro Yamada wrote:
>>
>> Looks like the whole of my series was rejected,
>> but I was not sure why the following one was rejected.
>> https://patchwork.kernel.org/patch/9236563/
>>
>
> Replying to that patch would have been better.
>
>>
>> Could you explain why -EPROBE_DEFER should be returned
>> if both .get_hw and .get are missing.
>
> That's just a bug. Perhaps this patch would be better, and look,
> it saves 5 lines.
>
> ---8<----
>  drivers/clk/clk.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 71cc56712666..d3d26148cdfb 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3174,19 +3174,14 @@ __of_clk_get_hw_from_provider(struct of_clk_provider *provider,
>                               struct of_phandle_args *clkspec)
>  {
>         struct clk *clk;
> -       struct clk_hw *hw = ERR_PTR(-EPROBE_DEFER);
>
> -       if (provider->get_hw) {
> -               hw = provider->get_hw(clkspec, provider->data);
> -       } else if (provider->get) {
> -               clk = provider->get(clkspec, provider->data);
> -               if (!IS_ERR(clk))
> -                       hw = __clk_get_hw(clk);
> -               else
> -                       hw = ERR_CAST(clk);
> -       }
> +       if (provider->get_hw)
> +               return provider->get_hw(clkspec, provider->data);
>
> -       return hw;
> +       clk = provider->get(clkspec, provider->data);
> +       if (IS_ERR(clk))
> +               return ERR_CAST(clk);
> +       return __clk_get_hw(clk);
>  }
>
>  struct clk *__of_clk_get_from_provider(struct of_phandle_args *clkspec,


Good.
Could you post it as a patch file?


Thanks!



-- 
Best Regards
Masahiro Yamada
