Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2B5C2B9F4
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 12:44:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1847961931
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 12:44:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhFYMrJ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Jun 2021 08:47:09 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:44827 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhFYMrI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Jun 2021 08:47:08 -0400
Received: by mail-ua1-f47.google.com with SMTP id e7so3488566uaj.11
        for <linux-clk@vger.kernel.org>; Fri, 25 Jun 2021 05:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+tG7cJlcEFyILt4uUOfwENqKs59ISYmGEmi+6LC7Q3Y=;
        b=D+EvG5A3rZJrxEoZXu9Yp5gXlRLeuELwtA0QFpLOECWeIR2YPvkctVBhIm75Wg13OS
         CIJoJ7O9IP6xq+znOv02d2S4bajmQdG1RL8YIrl7krrZe3zQIC6PkX0ozqJvbEV3nbLm
         N3bZ3e65ou+Oow0XPJkpRm8kcVT64/h58mvADay9JQxtVPN3sOIlc7UBI0B90tce4JOO
         9yRPzPv9FLCVRlpUSV07Iy2//g7m5RLsqhxi5QSUnC9mKrDbfRI9RZzYs9BNWuthDwsj
         TpY5HwWzWleP1XecKrzVxz0VO36uPus6pbChCS/reBZXHEDH40eOcDHYAqnU2We+G5K+
         AHHw==
X-Gm-Message-State: AOAM530DltFJJf+OuNc7QvwiHtEpY35sccmxcXvp/nk6GYizvRHZmlpd
        NEgthaiUnT57MTu19DPW8pIr17xzWP/llr0YbAU=
X-Google-Smtp-Source: ABdhPJzD7gguRznjIutc8oXQN6nBv5mTWKq9j9dzMgoeWLJNM9yHqlItir+sjH0tTu54ZpA8PA24903P4zHUxhLEc+U=
X-Received: by 2002:ab0:70b3:: with SMTP id q19mr11059515ual.2.1624625087875;
 Fri, 25 Jun 2021 05:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210624224909.6350-8-pali@kernel.org> <202106251653.IbU5dy4V-lkp@intel.com>
 <20210625093131.aicap7ah5odokjvf@pali> <CAMuHMdWLu6gUk-Xc5YqBr-01AVGC_8RfdB+Nf3BmcA_wqk8TZQ@mail.gmail.com>
 <20210625112921.loyw6nmj6ld67lso@pali>
In-Reply-To: <20210625112921.loyw6nmj6ld67lso@pali>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 14:44:36 +0200
Message-ID: <CAMuHMdUjCzEHHUO4mXrWLZUu-p1uFJqRZL5m7k0EwFCpq0GX=A@mail.gmail.com>
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

On Fri, Jun 25, 2021 at 1:29 PM Pali Rohár <pali@kernel.org> wrote:
> On Friday 25 June 2021 13:05:32 Geert Uytterhoeven wrote:
> > On Fri, Jun 25, 2021 at 11:31 AM Pali Rohár <pali@kernel.org> wrote:
> > > On Friday 25 June 2021 16:15:38 kernel test robot wrote:
> > > > I love your patch! Yet something to improve:
> > > >
> > > > [auto build test ERROR on robh/for-next]
> > > > [also build test ERROR on tty/tty-testing clk/clk-next linus/master v5.13-rc7 next-20210624]
> > > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > > And when submitting patch, we suggest to use '--base' as documented in
> > > > https://git-scm.com/docs/git-format-patch]
> > > >
> > > > url:    https://github.com/0day-ci/linux/commits/Pali-Roh-r/serial-mvebu-uart-Fixes-and-new-support-for-higher-baudrates/20210625-065146
> > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> > > > config: m68k-allmodconfig (attached as .config)
> > > > compiler: m68k-linux-gcc (GCC) 9.3.0
> > > > reproduce (this is a W=1 build):
> > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > >         chmod +x ~/bin/make.cross
> > > >         # https://github.com/0day-ci/linux/commit/747483a6b8f2de98afe461dbf91227404a8e2e81
> > > >         git remote add linux-review https://github.com/0day-ci/linux
> > > >         git fetch --no-tags linux-review Pali-Roh-r/serial-mvebu-uart-Fixes-and-new-support-for-higher-baudrates/20210625-065146
> > > >         git checkout 747483a6b8f2de98afe461dbf91227404a8e2e81
> > > >         # save the attached .config to linux build tree
> > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k
> > > >
> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > >
> > > > All errors (new ones prefixed by >>):
> > > >
> > > >    m68k-linux-ld: drivers/tty/serial/mvebu-uart.o: in function `mvebu_uart_clock_prepare':
> > > >    mvebu-uart.c:(.text+0x6d0): undefined reference to `__udivdi3'
> > > > >> m68k-linux-ld: mvebu-uart.c:(.text+0x78c): undefined reference to `__udivdi3'
> > >
> > > Hello! Could you help me how to fix this issue? I'm using macro
> > > DIV_ROUND_CLOSEST() with two u64 values in that function. And I really
> > > do not know details about m68k arch and I never touched this arch.
> > >
> > > There is missing number of line which caused this error. So if it is
> > > possible I have suggestion for bot to compile kernel with -g flag. In
> > > this case linker show exact line number (and not only hex address) which
> > > caused that linker error. Also in future it could help identify source
> > > of errors...
> >
> > This error means your driver uses a 64-bit division without using the
> > proper methods from include/linux/math64.h.
>
> Ok. So whenever I need 64-bit division should I always use macros from
> this header file and also in case my driver is only for 64-bit platform?

Exactly. As SERIAL_MVEBU_UART depends on ARCH_MVEBU || COMPILE_TEST,
it can be test-compiled on other architectures.

> I see that in this header file is DIV64_U64_ROUND_CLOSEST() macro which
> seems to be 64-bit forced variant of DIV_ROUND_CLOSEST() which I'm
> using.

Indeed.

Please also consider if you really need to do a 64-bit division, and if a
simpler and faster 64-by-32 division would be sufficient.

> I can change driver code to use DIV64_U64_ROUND_CLOSEST() macro in next
> patch iteration, if it helps.

Thanks!

> > It may happen when compiling for any 32-bit architecture.
>
> I guess that m64k is 32-bit platform...

Yep, m68k is a 32-bit platform.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
