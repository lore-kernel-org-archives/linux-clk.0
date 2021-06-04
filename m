Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0315EC4708F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 08:16:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC1AD61420
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 08:16:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbhFDISP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 04:18:15 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:35510 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhFDISO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Jun 2021 04:18:14 -0400
Received: by mail-wr1-f44.google.com with SMTP id m18so8393822wrv.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Jun 2021 01:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=OFcZXvFHiqa0WctRL3C9MJlLSmHi8sAjboiDNPgMnuc=;
        b=BPg16v26Bm2NeIiW24CT9oW8rinG4l06kaIQIM6N58Y7ZQcuuFVdPZyTi22Gkw1qIg
         x+0Y9PAqNbVVlOoF38QzYOXqq3V4tAYAWDrM35uO8ClsHvKjY9FeiZq30BMqYnwm5mff
         IsDxn7hBvIdWUopMkZ1oOM385kRIOU8++YUywV5ZBPCTfwzumE0b09513rFcdyX0jZN6
         gZIO+JBjuUPL+jwEXttEmvV/LKw7YceN4gVKxZjeeOnqU6LduCLcfAP6mUjv4S4qpkbv
         QMwFmeofYpYxSH5xDeuswyYyt077FcLRm8OozeWpaOCRAOx6gJI0F912XZFEF920LhZl
         SkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OFcZXvFHiqa0WctRL3C9MJlLSmHi8sAjboiDNPgMnuc=;
        b=RHgePxx8GZmieG40roDDRDQ3dkT2QOSfis2s3fkhdC/r7zLYoRu/bq5ocuuK1j4zRc
         8vypXS6TWzVlZU1csj2Ro80LN13+9oKZunpb0Zdb0BVRrouRuPeWKyRm+FUXriA8Yal3
         4a3CvnmqrpIWBcgKzqkzAJ6pOeNueaLMUYauDCapVBUNXmb5qVstSijytQDEMr+ecxeE
         +kpPRDBDFDzD0RSwnrbVrety3te9iNU3Cn+NgfRbfiNf4gvnlNf0WmXvU4KFp5ihtkTU
         8yqR9BOH1L+a+xPRAx/Hc0YaXfekEm+dyPhkeJFqLO+Uu0u5XlY9HpJR3fUlM9EB+fXJ
         Tc/Q==
X-Gm-Message-State: AOAM533No1E7lXW5AKNR3OPdJFixyQQYPoH5UP3I6gzbCrX4jxjIeeKt
        jeS+F3vcITjmdKTKSUi/gmfEAg==
X-Google-Smtp-Source: ABdhPJzKCDG2S/MW+XSyWSgQNMBba3x+94mh+AHkRgSppUsF3NaVvfwn74rlzBJZ0efEk6lznwp62Q==
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr2522129wrw.93.1622794513918;
        Fri, 04 Jun 2021 01:15:13 -0700 (PDT)
Received: from dell ([91.110.221.214])
        by smtp.gmail.com with ESMTPSA id l5sm7806358wmi.46.2021.06.04.01.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 01:15:13 -0700 (PDT)
Date:   Fri, 4 Jun 2021 09:15:11 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Peter Collingbourne <pcc@google.com>,
        kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [clk:clk-versatile 1/1] clk-versatile.c:undefined reference to
 `of_iomap'
Message-ID: <20210604081511.GD2435141@dell>
References: <202106032204.RmTRwUJD-lkp@intel.com>
 <162275070593.1835121.5721436755445700602@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <162275070593.1835121.5721436755445700602@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 03 Jun 2021, Stephen Boyd wrote:
65;6200;1c
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

That would be my best guess also.

> ----8<----
> diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconfig
> index 792315d893db..481de5657d85 100644
> --- a/drivers/clk/versatile/Kconfig
> +++ b/drivers/clk/versatile/Kconfig
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
>  menu "Clock driver for ARM Reference designs"
> +	depends on HAS_IOMEM
>  
>  config ICST
>  	bool "Clock driver for ARM Reference designs ICST"
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

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
