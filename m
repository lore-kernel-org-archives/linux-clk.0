Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B158C47094
	for <linux-clk@archiver.kernel.org>; Mon,  7 Jun 2021 14:21:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35F4461130
	for <linux-clk@archiver.kernel.org>; Mon,  7 Jun 2021 14:21:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhFGOXk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Jun 2021 10:23:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:44886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230211AbhFGOXk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 7 Jun 2021 10:23:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 75CF261107
        for <linux-clk@vger.kernel.org>; Mon,  7 Jun 2021 14:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623075709;
        bh=lWHcDa4OhiqlseElm2iLScdN2nxYgGQwklng4lJ4Ot8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tR/S+Vc3j3XQMLZDB32QcER4iF6jzxB/QJuHKuK6HO2/m/PprXmsHcQojxB0DlQU5
         e1pp2ubrdqB9TRDGxY3HRs8bXmlEIdbip42WinvFc9QIdgcPoS+EvV+hj7dIf6sqSX
         Hh+hl6Yx8wcfXH0ugAit/N3SEpoH6UFICdKCqnbGfJlHCw7ERK3s96xGBclatE6vnu
         ini1lGH7p8lkSsV3SbbDj+TfsXu2CXE92pvrsSOHj8EVPqld3lgu0CTsObRAmXYTkF
         4Ht5fv4fh5dxZUqii+xDqMyJV4mtQHh+NeC4PgvjyJGu5F1LZiYUFXfjmDd8nOEr9U
         lpow8HHqxFDyA==
Received: by mail-ed1-f48.google.com with SMTP id s6so20573958edu.10
        for <linux-clk@vger.kernel.org>; Mon, 07 Jun 2021 07:21:49 -0700 (PDT)
X-Gm-Message-State: AOAM530nrjxHp8UXbqChnPPOFIQuJMZE4R5xeazTi3sVbbeC6X9XOF5v
        9f4hFmr3L4UhLWwrPzruF6IP9kCOhsIzbv2swQ==
X-Google-Smtp-Source: ABdhPJywpW19OXnqaT6nATu890OXJE4gGZtdJI7a9+unUtfl8xwtP8ncCEmK4Sl7zvmhByt9uZBMZywweKKdhigXGHw=
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr20576673edt.194.1623075707941;
 Mon, 07 Jun 2021 07:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <202106032204.RmTRwUJD-lkp@intel.com> <162275070593.1835121.5721436755445700602@swboyd.mtv.corp.google.com>
In-Reply-To: <162275070593.1835121.5721436755445700602@swboyd.mtv.corp.google.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 7 Jun 2021 09:21:36 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+PW6nENg2tp1Yxp+EF2rH3kz-wZyBo4vKDQQmosk7haQ@mail.gmail.com>
Message-ID: <CAL_Jsq+PW6nENg2tp1Yxp+EF2rH3kz-wZyBo4vKDQQmosk7haQ@mail.gmail.com>
Subject: Re: [clk:clk-versatile 1/1] clk-versatile.c:undefined reference to `of_iomap'
To:     Stephen Boyd <sboyd@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Peter Collingbourne <pcc@google.com>,
        kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

+Randy

On Thu, Jun 3, 2021 at 3:06 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting kernel test robot (2021-06-03 07:58:13)
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-versatile
> > head:   419b3ab6987f2a108cc4710030184365b17467ac
> > commit: 419b3ab6987f2a108cc4710030184365b17467ac [1/1] clk: versatile: remove dependency on ARCH_*
> > config: s390-allmodconfig (attached as .config)
> > compiler: s390-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?id=419b3ab6987f2a108cc4710030184365b17467ac
> >         git remote add clk https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
> >         git fetch --no-tags clk clk-versatile
> >         git checkout 419b3ab6987f2a108cc4710030184365b17467ac
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=s390
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
>
> Probably ought to depend on HAS_IOMEM. Linus or Lee?

As you can see, there are lots of errors on s390 related to this.
Randy has been looking at these and I've suggested we add static
inlines. What makes HAS_IOMEM special compared to everywhere else we
have static inline stubs? It is mainly a kconfig hiding mechanism (for
UML and s390).

> ----8<----
> diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconfig
> index 792315d893db..481de5657d85 100644
> --- a/drivers/clk/versatile/Kconfig
> +++ b/drivers/clk/versatile/Kconfig
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
>  menu "Clock driver for ARM Reference designs"
> +       depends on HAS_IOMEM
>
>  config ICST
>         bool "Clock driver for ARM Reference designs ICST"
>
> >
> > All errors (new ones prefixed by >>):
> >
> >    s390-linux-ld: kernel/dma/coherent.o: in function `dma_init_coherent_memory':
> >    coherent.c:(.text+0x3bc): undefined reference to `memremap'
> >    s390-linux-ld: coherent.c:(.text+0x500): undefined reference to `memunmap'
> >    s390-linux-ld: kernel/dma/coherent.o: in function `dma_declare_coherent_memory':
> >    coherent.c:(.text+0xae6): undefined reference to `memunmap'
> >    s390-linux-ld: drivers/irqchip/irq-al-fic.o: in function `al_fic_init_dt':
> >    irq-al-fic.c:(.init.text+0x98): undefined reference to `of_iomap'
> >    s390-linux-ld: irq-al-fic.c:(.init.text+0x596): undefined reference to `iounmap'
> >    s390-linux-ld: drivers/clk/clk-fixed-mmio.o: in function `fixed_mmio_clk_setup':
> >    clk-fixed-mmio.c:(.text+0x9a): undefined reference to `of_iomap'
> >    s390-linux-ld: clk-fixed-mmio.c:(.text+0xe6): undefined reference to `iounmap'
> >    s390-linux-ld: drivers/clk/versatile/clk-versatile.o: in function `cm_osc_setup':
> > >> clk-versatile.c:(.init.text+0xbc): undefined reference to `of_iomap'
> >    s390-linux-ld: drivers/clk/versatile/clk-sp810.o: in function `clk_sp810_of_setup':
> > >> clk-sp810.c:(.init.text+0x174): undefined reference to `of_iomap'
> >    s390-linux-ld: drivers/clocksource/timer-of.o: in function `timer_of_init':
> >    timer-of.c:(.init.text+0xcc): undefined reference to `of_iomap'
> >    s390-linux-ld: timer-of.c:(.init.text+0x8ee): undefined reference to `iounmap'
> >    s390-linux-ld: drivers/clocksource/timer-of.o: in function `timer_of_cleanup':
> >    timer-of.c:(.init.text+0xb9a): undefined reference to `iounmap'
> >    s390-linux-ld: drivers/clocksource/timer-microchip-pit64b.o: in function `mchp_pit64b_dt_init_timer':
> >    timer-microchip-pit64b.c:(.init.text+0x150): undefined reference to `of_iomap'
> >    s390-linux-ld: timer-microchip-pit64b.c:(.init.text+0xc78): undefined reference to `iounmap'
> >
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
