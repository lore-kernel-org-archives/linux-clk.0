Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:46078 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1165908AbcKAGuv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Nov 2016 02:50:51 -0400
Received: from mail-yb0-f170.google.com (mail-yb0-f170.google.com [209.85.213.170]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id uA16oh98005918
        for <linux-clk@vger.kernel.org>; Tue, 1 Nov 2016 15:50:43 +0900
Received: by mail-yb0-f170.google.com with SMTP id d128so70215389ybh.2
        for <linux-clk@vger.kernel.org>; Mon, 31 Oct 2016 23:50:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20161028012844.GT26139@codeaurora.org>
References: <20161012093404.GA29062@mwanda> <CAK7LNAQ9=SZMCwoEFasULX4arqkxqOMpREUn6GLtqTdXik5=3w@mail.gmail.com>
 <20161028012844.GT26139@codeaurora.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 1 Nov 2016 15:50:42 +0900
Message-ID: <CAK7LNAQiPOCo7MUb9c81uOsJeJ36Q0OoSgUc9DmjmAgk5v_pmg@mail.gmail.com>
Subject: Re: [bug report] clk: uniphier: add core support code for UniPhier
 clock driver
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,



2016-10-28 10:28 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 10/13, Masahiro Yamada wrote:
>> 2016-10-12 18:34 GMT+09:00 Dan Carpenter <dan.carpenter@oracle.com>:
>> >
>> > We can't return -EINVAL as a u8.
>> >
>> >     57  }
>>
>>
>>
>> I think we should change the return type of .get_parent() callback to "int"
>> so we can handle error code.
>> (perhaps, the argument of .set_parent() as well for consistency?)
>
> Yeah we've been thinking of changing get_parent() to return a
> struct clk_hw pointer (or an error pointer). That would simplify
> things by avoiding lots of remapping.


I am not quite sure about this.


Currently, parent's clk_hw can be retrieved
in the following process:

 [1] read a register and get the parent index
 [2] Get core->parents[index]


[1] is a job of low-level driver and [2] is managed in the core framework.


I am not sure if I understood correctly,
but your suggestion means that
[2] will be moved to lowlevel drivers as well?

If so, I felt like similar code will be duplicated
and I wonder if it makes sense.



-- 
Best Regards
Masahiro Yamada
