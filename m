Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D34C48BC2
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 13:35:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F462616E8
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 13:35:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbhFYNiB convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Jun 2021 09:38:01 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:46823 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhFYNiB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Jun 2021 09:38:01 -0400
Received: by mail-vs1-f46.google.com with SMTP id g28so2814676vsr.13
        for <linux-clk@vger.kernel.org>; Fri, 25 Jun 2021 06:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Hc4ym4T4RXnockMEigZR5ws/Hz8DLXsWV1lUYmk+x9A=;
        b=ghS7M+bCFIOpCfXDakZFX1wpZj2POkay7sBz8y2DIUDgpe7dlWgVQx+afC/sbLObiQ
         G/Oh1f266ri5zveoBiHJISJzM1pcirLZBUpCzvVnhQZjTrOt1fzyckoR8yaxVyOBOGs1
         VEpAMqMFO/cvm/D45KO65IzmkS+wZPT81pnbnA2mv2j1QqK8oFFhgRns3tGkBG2wINYF
         MvSelZX99fvf4eNEYnJu3kYZ5IU7a/mDxzsPEVO+M7d00I/L4N6pNEZbQXphhp6CPrY4
         RnMaMDYAPWk7EUwGN8bXRzR4JgeTiHQMRpQLoEfX6uzO7zQjabnkPlX/CsWtyhnUD+0V
         aKrg==
X-Gm-Message-State: AOAM531mUjbXgvuUgIXBXtTAGXQ/XVweG22AC0CvjZNfbhRLLBGyS2I2
        mob5Z+IG5o7sT9I5KL6xCRjFFMqNfmP6lbNY/9Y=
X-Google-Smtp-Source: ABdhPJw1XoUirQpgjtt4VOjjIzFfsxT70BSNr8RGVHJNn3xp8WXPwsjA65ddoX1bXFF15xrdwGZ66gXOuaEd9xv7t5U=
X-Received: by 2002:a67:ba0c:: with SMTP id l12mr8744177vsn.40.1624628140177;
 Fri, 25 Jun 2021 06:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210624224909.6350-8-pali@kernel.org> <202106251653.IbU5dy4V-lkp@intel.com>
 <20210625093131.aicap7ah5odokjvf@pali> <CAMuHMdWLu6gUk-Xc5YqBr-01AVGC_8RfdB+Nf3BmcA_wqk8TZQ@mail.gmail.com>
 <20210625112921.loyw6nmj6ld67lso@pali> <CAMuHMdUjCzEHHUO4mXrWLZUu-p1uFJqRZL5m7k0EwFCpq0GX=A@mail.gmail.com>
 <20210625132211.grax2ys445w3qahw@pali>
In-Reply-To: <20210625132211.grax2ys445w3qahw@pali>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 15:35:28 +0200
Message-ID: <CAMuHMdUqhMGPdBcyWSZeZRiyDcnT2PRU1_md-jVcbZy-2=55yw@mail.gmail.com>
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

On Fri, Jun 25, 2021 at 3:22 PM Pali Rohár <pali@kernel.org> wrote:
> On Friday 25 June 2021 14:44:36 Geert Uytterhoeven wrote:
> > On Fri, Jun 25, 2021 at 1:29 PM Pali Rohár <pali@kernel.org> wrote:
> > > On Friday 25 June 2021 13:05:32 Geert Uytterhoeven wrote:
> > > > On Fri, Jun 25, 2021 at 11:31 AM Pali Rohár <pali@kernel.org> wrote:
> > > > > On Friday 25 June 2021 16:15:38 kernel test robot wrote:
> > > > > > I love your patch! Yet something to improve:
> > > > > >
> > > > > > [auto build test ERROR on robh/for-next]
> > > > > > [also build test ERROR on tty/tty-testing clk/clk-next linus/master v5.13-rc7 next-20210624]
> > > > > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > > > > And when submitting patch, we suggest to use '--base' as documented in
> > > > > > https://git-scm.com/docs/git-format-patch]
> > > > > >
> > > > > > url:    https://github.com/0day-ci/linux/commits/Pali-Roh-r/serial-mvebu-uart-Fixes-and-new-support-for-higher-baudrates/20210625-065146
> > > > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> > > > > > config: m68k-allmodconfig (attached as .config)
> > > > > > compiler: m68k-linux-gcc (GCC) 9.3.0
> > > > > > reproduce (this is a W=1 build):
> > > > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > > > >         chmod +x ~/bin/make.cross
> > > > > >         # https://github.com/0day-ci/linux/commit/747483a6b8f2de98afe461dbf91227404a8e2e81
> > > > > >         git remote add linux-review https://github.com/0day-ci/linux
> > > > > >         git fetch --no-tags linux-review Pali-Roh-r/serial-mvebu-uart-Fixes-and-new-support-for-higher-baudrates/20210625-065146
> > > > > >         git checkout 747483a6b8f2de98afe461dbf91227404a8e2e81
> > > > > >         # save the attached .config to linux build tree
> > > > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k
> > > > > >
> > > > > > If you fix the issue, kindly add following tag as appropriate
> > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > >
> > > > > > All errors (new ones prefixed by >>):
> > > > > >
> > > > > >    m68k-linux-ld: drivers/tty/serial/mvebu-uart.o: in function `mvebu_uart_clock_prepare':
> > > > > >    mvebu-uart.c:(.text+0x6d0): undefined reference to `__udivdi3'
> > > > > > >> m68k-linux-ld: mvebu-uart.c:(.text+0x78c): undefined reference to `__udivdi3'
> > > > >
> > > > > Hello! Could you help me how to fix this issue? I'm using macro
> > > > > DIV_ROUND_CLOSEST() with two u64 values in that function. And I really
> > > > > do not know details about m68k arch and I never touched this arch.
> > > > >
> > > > > There is missing number of line which caused this error. So if it is
> > > > > possible I have suggestion for bot to compile kernel with -g flag. In
> > > > > this case linker show exact line number (and not only hex address) which
> > > > > caused that linker error. Also in future it could help identify source
> > > > > of errors...
> > > >
> > > > This error means your driver uses a 64-bit division without using the
> > > > proper methods from include/linux/math64.h.
> > >
> > > Ok. So whenever I need 64-bit division should I always use macros from
> > > this header file and also in case my driver is only for 64-bit platform?
> >
> > Exactly. As SERIAL_MVEBU_UART depends on ARCH_MVEBU || COMPILE_TEST,
> > it can be test-compiled on other architectures.
> >
> > > I see that in this header file is DIV64_U64_ROUND_CLOSEST() macro which
> > > seems to be 64-bit forced variant of DIV_ROUND_CLOSEST() which I'm
> > > using.
> >
> > Indeed.
> >
> > Please also consider if you really need to do a 64-bit division, and if a
> > simpler and faster 64-by-32 division would be sufficient.
>
> Good catch! I have checked this and numerator in the worst case does not
> fit into 32 bits (so u64 is needed) but denominator in the worst case
> fits into unsigned 32 bit integer.

Note that in some cases, the numerator is (unsigned) long, hence sometimes
32-bit, sometimes 64-bit, and there are separate helpers for that.

> So what is the preferred way to do u64/u32 division with rounding to the
> closest number which would work on all platforms?
>
> In the end I need to clamp this result into range 1..1023.

Without rounding, it is div_u64().
With rounding, that would be DIV_U64_ROUND_CLOSEST(), which doesn't
exist yet. So you have to add it first, cfr. DIV_S64_ROUND_CLOSEST().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
