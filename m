Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 9 Jul 2016 02:23:29 +0900
Message-ID: <CAK7LNAQ5uRoSEEuKys9Gs-2HFAJCbmnFDjxajWfK9ng_dtZ8yw@mail.gmail.com>
Subject: of_clk_add_(hw_)providers multipule times for one node?
To: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi.

I think the current code allows to add
clk_providers multiple times against one DT node.

Are there cases that really need to do so?


I am thinking the behavior of __of_clk_get_from_provider() is strange.


The result of __of_clk_get_from_provider() has three patterns:

[1] success
[2] return -EPROBE_DEFER
[3] return -EINVAL  (if clkspec == NULL)


[3] is a rare case.
So, almost all error cases are treated as -EPROBE_DEFER.



A strange scenario
------------------

If a too big clock index is passed in clkspec,
of_clk_src_onecell_get() returns -EINVAL. This is reasonable.


But, __of_clk_get_from_provider() tries to search next nodes despite
that it has already failed to get a clk.

Then, it reaches the end of list_for_each_entry() loop, and returns
-EPROBE_DEFER.  This is not deferred probe at all!  In this case,
__of_clk_get_from_provider() should return -EINVAL.


If this is a bug, I am happy to volunteer to fix it.


Thanks.



-- 
Best Regards
Masahiro Yamada
