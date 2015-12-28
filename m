Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conssluserg003.nifty.com ([202.248.44.41]:56449 "EHLO
	conssluserg003-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752204AbbL1KZV (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 28 Dec 2015 05:25:21 -0500
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com [209.85.160.180]) (authenticated)
	by conssluserg003-v.nifty.com with ESMTP id tBSAOuUJ012990
	for <linux-clk@vger.kernel.org>; Mon, 28 Dec 2015 19:24:57 +0900
Received: by mail-yk0-f180.google.com with SMTP id x67so98389015ykd.2
        for <linux-clk@vger.kernel.org>; Mon, 28 Dec 2015 02:24:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
References: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
Date: Mon, 28 Dec 2015 19:24:56 +0900
Message-ID: <CAK7LNATqLUZwzPSnPoh5m6Tkor+kV_Fo0G8a-Qafbucj4X0_tg@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] clk: a collection of various clean-ups and improvements
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

I sent this series to linux-mtd by mistake.

This should have been sent to linux-clk, of course.

Sorry for noise.


2015-12-28 19:10 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Many refactoring, with detection of circular parent looping.
>
>
> Changes in v2:
>   - Fix a bug.  Return -EINVAL when parent _is_ NULL.
>
> Masahiro Yamada (16):
>   clk: remove unused first argument of __clk_init()
>   clk: change the argument of __clk_init() into pointer to clk_core
>   clk: rename __clk_init() into __clk_core_init()
>   clk: remove unnecessary !core->parents conditional
>   clk: change sizeof(struct clk *) to sizeof(*core->parents)
>   clk: move core->parents allocation to clk_register()
>   clk: simplify clk_core_get_parent_by_index()
>   clk: drop the initial core->parents look-ups from __clk_core_init()
>   clk: replace pr_warn() with pr_err() for fatal cases
>   clk: move checking .git_parent to __clk_core_init()
>   clk: simplify __clk_init_parent()
>   clk: avoid circular clock topology
>   clk: walk the orphan clock list more simply
>   clk: make sure parent is not NULL in clk_fetch_parent_index()
>   clk: simplify clk_fetch_parent_index() function
>   clk: slightly optimize clk_core_set_parent()





-- 
Best Regards
Masahiro Yamada
