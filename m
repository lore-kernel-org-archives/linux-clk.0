Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692FBC49EA7
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 11:05:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E4B161459
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 11:05:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhFYLIF convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Jun 2021 07:08:05 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:38566 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhFYLIE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Jun 2021 07:08:04 -0400
Received: by mail-vs1-f45.google.com with SMTP id o7so5199050vss.5
        for <linux-clk@vger.kernel.org>; Fri, 25 Jun 2021 04:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PlT3tgmzGpvVaab75PJmmievNblJJH4CTrbn42G1XhQ=;
        b=W6F6cWQbKd9qC4qRPhhKoV8iaPflmMV8hK5x/ictFL/rvmEFdFNzT6tduGTUvXAai1
         crDCRYmSFhIOpkqF7s2dW0p0agfMDjwQFQW8PPkfvQA5P2kUk2AFbgiRqmWJIeava/FM
         E8geLbU7D0RXQGoKpSqyBxl/kwziBeevxSUT1AGpzZz/1XohZ+QUhik4NMfY1mUFhHo3
         0ZSeeJNLJEGqPlvHW1WGl7joSStgJUlX1f0gFO+4kL6bXepAZAA+ndX3asena2IjMEJ/
         PUwol6zVTUSWpPK7fT7LIAk7sGjWomljER0qgg5ujX0Onaz54b0ze34YSPFaF1kkXvDI
         o4OA==
X-Gm-Message-State: AOAM531GDxOnoOPtrbRkSJzHXOx6tL/vyR8fKwr7/KE37aE8Be1+vEJ5
        J3660wroUFOpmkYop9uuMfGVyVpRaQGMw1vguHU=
X-Google-Smtp-Source: ABdhPJyuS+n9a+O+vs+H3W1ZM3WTx+blRs0OkVKPTnN1yY3B411kEEClEx9E+NJIEGioSdgpObZbHu5T9BkcAnbbrVI=
X-Received: by 2002:a05:6102:301c:: with SMTP id s28mr7242854vsa.18.1624619143903;
 Fri, 25 Jun 2021 04:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210624224909.6350-8-pali@kernel.org> <202106251653.IbU5dy4V-lkp@intel.com>
 <20210625093131.aicap7ah5odokjvf@pali>
In-Reply-To: <20210625093131.aicap7ah5odokjvf@pali>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 13:05:32 +0200
Message-ID: <CAMuHMdWLu6gUk-Xc5YqBr-01AVGC_8RfdB+Nf3BmcA_wqk8TZQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] serial: mvebu-uart: implement UART clock driver for
 configuring UART base clock
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc:     kernel test robot <lkp@intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kbuild-all@lists.01.org, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Pali,

On Fri, Jun 25, 2021 at 11:31 AM Pali Rohár <pali@kernel.org> wrote:
> On Friday 25 June 2021 16:15:38 kernel test robot wrote:
> > I love your patch! Yet something to improve:
> >
> > [auto build test ERROR on robh/for-next]
> > [also build test ERROR on tty/tty-testing clk/clk-next linus/master v5.13-rc7 next-20210624]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/Pali-Roh-r/serial-mvebu-uart-Fixes-and-new-support-for-higher-baudrates/20210625-065146
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> > config: m68k-allmodconfig (attached as .config)
> > compiler: m68k-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/0day-ci/linux/commit/747483a6b8f2de98afe461dbf91227404a8e2e81
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review Pali-Roh-r/serial-mvebu-uart-Fixes-and-new-support-for-higher-baudrates/20210625-065146
> >         git checkout 747483a6b8f2de98afe461dbf91227404a8e2e81
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    m68k-linux-ld: drivers/tty/serial/mvebu-uart.o: in function `mvebu_uart_clock_prepare':
> >    mvebu-uart.c:(.text+0x6d0): undefined reference to `__udivdi3'
> > >> m68k-linux-ld: mvebu-uart.c:(.text+0x78c): undefined reference to `__udivdi3'
>
> Hello! Could you help me how to fix this issue? I'm using macro
> DIV_ROUND_CLOSEST() with two u64 values in that function. And I really
> do not know details about m68k arch and I never touched this arch.
>
> There is missing number of line which caused this error. So if it is
> possible I have suggestion for bot to compile kernel with -g flag. In
> this case linker show exact line number (and not only hex address) which
> caused that linker error. Also in future it could help identify source
> of errors...

This error means your driver uses a 64-bit division without using the
proper methods from include/linux/math64.h.

It may happen when compiling for any 32-bit architecture.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
