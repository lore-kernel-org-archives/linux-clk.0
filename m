Return-Path: <sboyd@codeaurora.org>
Date: Tue, 2 Feb 2016 12:43:37 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v2 10/16] clk: move checking .git_parent to
 __clk_core_init()
Message-ID: <20160202204337.GO4848@codeaurora.org>
References: <1451298191-30815-1-git-send-email-yamada.masahiro@socionext.com>
 <1451298191-30815-11-git-send-email-yamada.masahiro@socionext.com>
 <20160202005051.GO4848@codeaurora.org>
 <CAK7LNASGzvbGAOnMRBH6SuZOz9O_=r3B3MdqhhkxoWzCcn9gUw@mail.gmail.com>
 <20160202023922.GL4848@codeaurora.org>
 <CAK7LNAQb-y-j46O1v6iFRHUR9Dqjzi53-nAYsYAEKmPs_PFO0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAK7LNAQb-y-j46O1v6iFRHUR9Dqjzi53-nAYsYAEKmPs_PFO0w@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/02, Masahiro Yamada wrote:
> 2016-02-02 11:39 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> >
> > Right, this patch moves the check to __clk_core_init(), and it
> > will print an error and then keep going (because we lost the goto
> > out part). Once we keep going in __clk_core_init() we'll call
> > __clk_init_parent() and NULL pointer deref.
> >
> 
> Ah, I missed that.
> 
> We need
> 
>    ret = -EINVAL;
>    goto out;
> 
> here, I think.
> 
> Shall I send the v3 for 08/16?
> 
> Or, if it is too late, shall I send a fix-up patch?
> 

I'll split the patch out again and squash in those two lines.
Nothing more to do. Thanks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
