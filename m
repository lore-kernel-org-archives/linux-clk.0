Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:48914 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933403AbcJ1B2q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2016 21:28:46 -0400
Date: Thu, 27 Oct 2016 18:28:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [bug report] clk: uniphier: add core support code for UniPhier
 clock driver
Message-ID: <20161028012844.GT26139@codeaurora.org>
References: <20161012093404.GA29062@mwanda>
 <CAK7LNAQ9=SZMCwoEFasULX4arqkxqOMpREUn6GLtqTdXik5=3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAK7LNAQ9=SZMCwoEFasULX4arqkxqOMpREUn6GLtqTdXik5=3w@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 10/13, Masahiro Yamada wrote:
> 2016-10-12 18:34 GMT+09:00 Dan Carpenter <dan.carpenter@oracle.com>:
> >
> > We can't return -EINVAL as a u8.
> >
> >     57  }
> 
> 
> 
> I think we should change the return type of .get_parent() callback to "int"
> so we can handle error code.
> (perhaps, the argument of .set_parent() as well for consistency?)

Yeah we've been thinking of changing get_parent() to return a
struct clk_hw pointer (or an error pointer). That would simplify
things by avoiding lots of remapping. But to do that immediately
we would need to convert all of the drivers. I guess we could
have a get_parent_hw() op for that and convert everyone slowly.

Should we make the set_parent op take a hw pointer too? I'm not
sure about it. It would be nice to have some generic way to map
the hw pointer to a hw index for a clock. Having the tables of
parent pointers in the core and making the drivers know about
that order and how it relates to the values they program into the
hardware is awkward sometimes.

> 
> [1]
> I guess regmap_read() is often involved in .get_parent()
> and it may return a negative value on failure.
> 
> [2]
> On boot-up, the register my be read as
> a value that is not covered by the clk driver.
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
