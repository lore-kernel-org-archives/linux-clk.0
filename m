Return-Path: <SRS0=/mgL=SV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5683C282DA
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 18:19:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B756D222AF
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 18:19:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z69eY3mu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbfDSSTe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:19:34 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55770 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727631AbfDSSTe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Apr 2019 14:19:34 -0400
Received: by mail-wm1-f66.google.com with SMTP id o25so7001810wmf.5
        for <linux-clk@vger.kernel.org>; Fri, 19 Apr 2019 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4G1cfzoAbqHvnVzZ+Pd6cnvliuW2R7vyaWyDwXdlFd4=;
        b=Z69eY3muJM91i27XH3/1enGYYxDztdR+h/dHMSYbKCgtaCr9DC41usrTlKYq5jmkxB
         JVpBQZ7pvH0C8wqBa4rvfV4ES3rQuhhdZbb2/lPm4DoYfRlHFJgTTfa30ifMBAzI0o+C
         e9rHcIUMLLmBptrm53DaSp840HDN3YyC4AebFYAp4vgxZZTFFSU3FVAVFkLUfmn1eNhZ
         jl9n+Q/nWSbmyGNqFhI6IzR5CB0Vf+uKiEMewYUOJHvLmhjLU+lgCx18rt08GfL8ttRH
         n2/01/jSmkXthz0C8TC3f5+u4xT5q/r/f7CYb3Gk5QXO4p16fIMm4ZG0h9uULMq5uYdm
         w5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4G1cfzoAbqHvnVzZ+Pd6cnvliuW2R7vyaWyDwXdlFd4=;
        b=mvW+Q8fwdT11xwWX5lc4AHjEV7shG+Toiceg+s8/6ouJdIzEL2BwFltSMacJcfH5mW
         b5ySNBMSDS/iePnjZrO0Z+eZ7fpBHz5i7/RE+m6v61wkjMj7qyAQcwL0+oKPpbdY2BCr
         X+4C9GeUbEVVPRpL/99GUQJqNYGY28OrLTkM3xvyWZ/LaBtu8vK7xFoxNuAX4nRlHNU6
         XCJPntnnh+BsXa/fAfdVyt3XgQfKXRW2UmHPZLOUmtjame1DdtEwGSazoOAbTwuZlI5b
         DcaNwPWle8OyUBvHG81+1CGsNKSlryJEP7r/IwF5QABsJX9+wTWKM2SZCAF1IzMHoDYJ
         xP6Q==
X-Gm-Message-State: APjAAAX5GVqy4S2ADw0NMMPaM4XLc5iAJ/egiq7IZqQwwItozqIIlLrW
        JSxnelDKqqNRFVd0wiaEWALhjrhvnp2AkRVRj3M=
X-Google-Smtp-Source: APXvYqxtbIcc2dardIPd7iYj6YejE/W5oTn+SVqdYQs+Fvi/7NMBMlgA+l0+KIgnm6pQlwVa6squY9Fg1udHQFULW4U=
X-Received: by 2002:a7b:c115:: with SMTP id w21mr3457820wmi.55.1555697561370;
 Fri, 19 Apr 2019 11:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <201904190740.Fs1CMC0M%lkp@intel.com> <CAOiHx==Aps2WKU5zCu4L4y+MUwCyrNr9xJ4rC5GQg=T47Jn1RA@mail.gmail.com>
 <155569223573.15276.16410564274197593263@swboyd.mtv.corp.google.com>
In-Reply-To: <155569223573.15276.16410564274197593263@swboyd.mtv.corp.google.com>
From:   Jonas Gorski <jonas.gorski@gmail.com>
Date:   Fri, 19 Apr 2019 20:12:43 +0200
Message-ID: <CAOiHx=nFQ9ROMgDf5Ww2f=_+PhMQ5qu4BAojyLPnOtYrf7z9Fg@mail.gmail.com>
Subject: Re: [clk:clk-remove-io.h 8/9] drivers/clk//renesas/r7s9210-cpg-mssr.c:122:10:
 error: implicit declaration of function 'clk_readl'; did you mean '__readl'?
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@01.org,
        linux-clk@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 19 Apr 2019 at 18:43, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Jonas Gorski (2019-04-19 03:17:10)
> > On Fri, 19 Apr 2019 at 01:52, kbuild test robot <lkp@intel.com> wrote:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-remove-io.h
> > > head:   91c16d737801d56e258b72c9d71f79c42c613919
> > > commit: f1df560411dd2c32ce1bd1b9d3a90a8d8ae9be9c [8/9] clk: core: replace clk_{readl,writel} with {readl,writel}
> > > config: x86_64-allmodconfig (attached as .config)
> > > compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> > > reproduce:
> > >         git checkout f1df560411dd2c32ce1bd1b9d3a90a8d8ae9be9c
> > >         # save the attached .config to linux build tree
> > >         make ARCH=x86_64
> > >
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > >
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    drivers/clk//renesas/r7s9210-cpg-mssr.c: In function 'r7s9210_update_clk_table':
> > > >> drivers/clk//renesas/r7s9210-cpg-mssr.c:122:10: error: implicit declaration of function 'clk_readl'; did you mean '__readl'? [-Werror=implicit-function-declaration]
> > >      frqcr = clk_readl(base + CPG_FRQCR) & 0xFFF;
> > >              ^~~~~~~~~
> > >              __readl
> > >    cc1: some warnings being treated as errors
> > >
> > > sparse warnings: (new ones prefixed by >>)
> > >
> > >    drivers/clk/renesas/r7s9210-cpg-mssr.c:122:17: sparse: undefined identifier 'clk_readl'
> > > >> drivers/clk/renesas/r7s9210-cpg-mssr.c:122:26: sparse: call with no type!
> >
> > That wasn't me! ;-)
> >
> > Looks like r7s9210-cpg-mssr was switched to readl() independently
> > about a month ago with 9c561be8d8f2e01afaa9657051fc22e1e68f1914 which
> > seems to be only in clk-next yet.
> >
> > Nice catch with the include cleanup, I always forget those.
> >
>
> I'll squash in a change so that clk_readl() can be removed on both sides
> of the merge. I guess the patches were based against linux-next?

clk-next, as that seemed to be the most appropriate for non-fixes.


Regards

Jonas
