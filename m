Return-Path: <SRS0=/mgL=SV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DATE_IN_PAST_06_12,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFAEC282DA
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 18:35:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE02620449
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 18:35:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMYTHEsy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727904AbfDSSfD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:35:03 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38182 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbfDSSfC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Apr 2019 14:35:02 -0400
Received: by mail-wr1-f65.google.com with SMTP id f14so7282351wrj.5
        for <linux-clk@vger.kernel.org>; Fri, 19 Apr 2019 11:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xYWA1kVpCqnEsYf8ZQx0FLCh1pK1B8ewCVuRiUp9+Z8=;
        b=NMYTHEsyViL3Br+SjY3sw6m9G1rJitRY7NAdq8Yt6Fq/gvyqUu1aOGinsEW6LAt+Fe
         hEoi1JyShLw06Tq0DBu9SJCtYRP4buuUPtEWlTJ0duWy5mhNTFQv5xYWSO/BZkbMIX91
         fYaZ3Gj42LSBcQh+Bg7oIcNw7kQjxXi3rg37Il5Xg0hxKeR/wQjm8DsDKlsnsDPzX+I0
         CZSGCUgBoGgA2/z1fuzOYt5wfosrAsGUlET6KOsJ61mHwiCA09JqEi9b1zEVg8m/poep
         A+x6MXEnoIjFxPbimGfsZH7SIwNJ/uuF3jxBqY5Jakuk4XS3vUoXRjX4mf8gzNi2I9Z3
         AHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xYWA1kVpCqnEsYf8ZQx0FLCh1pK1B8ewCVuRiUp9+Z8=;
        b=KaaetnVA1fQ/tGy6/IHPwhvOL+In6NxozPc4YvUa/eRVZi3rm/VW3ZeY7d3regNPmx
         DOLqa25UpgxGqHz2DpA0200YyJwahfZk/UJSIlwENbFJ6VCJbYA7w3sz/SHfBYiyv2aE
         j6U7XEYa9pxSlRaxxoPAEs5qgS57//maq5qDREUnJsCgyXjWTx5dsl9PbM4AcX+l60cL
         TSizZ3pcDo42xm+o2uXuboHFq+bUy++6wcDav6ff6cw4Y8Ezqi3jSFWSht/W53b9ZtMX
         n4kID+St1ofu02Kq2hfje6esoDXzY9sdsBIctWEu1il9TIj/af5pnQI+jkKLeeGqgMTF
         qFqg==
X-Gm-Message-State: APjAAAXHJ5eZagP29f/dot15O/tsuIE6GeuYushlxuuaeTJUPRycb2Om
        SZMqWzcOS9A5ajS+mR8rK7a76zU9kijZaeEYT8qgRSwc
X-Google-Smtp-Source: APXvYqx6dFV14mi6crY3nmIZGkRMpj0N1pv5xC7zA3yUXgv+TCCDMvpMvdEwx6s/elbQ9yfMCX1yn5Jx0SJg/y+pGtE=
X-Received: by 2002:adf:ec09:: with SMTP id x9mr2478024wrn.187.1555669029154;
 Fri, 19 Apr 2019 03:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <201904190740.Fs1CMC0M%lkp@intel.com>
In-Reply-To: <201904190740.Fs1CMC0M%lkp@intel.com>
From:   Jonas Gorski <jonas.gorski@gmail.com>
Date:   Fri, 19 Apr 2019 12:17:10 +0200
Message-ID: <CAOiHx==Aps2WKU5zCu4L4y+MUwCyrNr9xJ4rC5GQg=T47Jn1RA@mail.gmail.com>
Subject: Re: [clk:clk-remove-io.h 8/9] drivers/clk//renesas/r7s9210-cpg-mssr.c:122:10:
 error: implicit declaration of function 'clk_readl'; did you mean '__readl'?
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org, linux-clk@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 19 Apr 2019 at 01:52, kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-remove-io.h
> head:   91c16d737801d56e258b72c9d71f79c42c613919
> commit: f1df560411dd2c32ce1bd1b9d3a90a8d8ae9be9c [8/9] clk: core: replace clk_{readl,writel} with {readl,writel}
> config: x86_64-allmodconfig (attached as .config)
> compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> reproduce:
>         git checkout f1df560411dd2c32ce1bd1b9d3a90a8d8ae9be9c
>         # save the attached .config to linux build tree
>         make ARCH=x86_64
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
>
> All errors (new ones prefixed by >>):
>
>    drivers/clk//renesas/r7s9210-cpg-mssr.c: In function 'r7s9210_update_clk_table':
> >> drivers/clk//renesas/r7s9210-cpg-mssr.c:122:10: error: implicit declaration of function 'clk_readl'; did you mean '__readl'? [-Werror=implicit-function-declaration]
>      frqcr = clk_readl(base + CPG_FRQCR) & 0xFFF;
>              ^~~~~~~~~
>              __readl
>    cc1: some warnings being treated as errors
>
> sparse warnings: (new ones prefixed by >>)
>
>    drivers/clk/renesas/r7s9210-cpg-mssr.c:122:17: sparse: undefined identifier 'clk_readl'
> >> drivers/clk/renesas/r7s9210-cpg-mssr.c:122:26: sparse: call with no type!

That wasn't me! ;-)

Looks like r7s9210-cpg-mssr was switched to readl() independently
about a month ago with 9c561be8d8f2e01afaa9657051fc22e1e68f1914 which
seems to be only in clk-next yet.

Nice catch with the include cleanup, I always forget those.


Regards
Jonas
