Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D161C48BC2
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 09:31:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8800961429
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 09:31:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhFYJd4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Jun 2021 05:33:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:35640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231153AbhFYJdy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 25 Jun 2021 05:33:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C8A561409;
        Fri, 25 Jun 2021 09:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624613494;
        bh=5UbQZR17tJp53BrGZ4NHl6B3UZeI092/ppxOont8+ew=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CTRhkMuysRnuWtv196Qeo/uQ+7drKzqnsmBZevX3JK3mD3Fec2TLP7dV5VMz6TEoD
         9YqxdZvADT35rRvNIWDIq2Y8ujk1EBvwT3ZfrWpzqzbnX4DFExO1CdJ/edEX7Z3ZJr
         IQZqgyrNQyA0O7525vBxvZjIGdUkCZPC9NBLksmXOSn6vsR0rlhfAyeTEmgF6p/QDI
         syMTcuDoovlvWw8CGPVZ1IT+8O4Dk512heNeYmO4IwISMbQ9kxkGsEqpTaMS3kcK6r
         CqMR48SyJUtaZxlY6/qcUph99uKjFas83Aavhjch5FreCKACbt3gJsRwJ1iR5eORlV
         dCpFnlQ2DqnPQ==
Received: by pali.im (Postfix)
        id F24DB60E; Fri, 25 Jun 2021 11:31:31 +0200 (CEST)
Date:   Fri, 25 Jun 2021 11:31:31 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kbuild-all@lists.01.org, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 07/10] serial: mvebu-uart: implement UART clock driver
 for configuring UART base clock
Message-ID: <20210625093131.aicap7ah5odokjvf@pali>
References: <20210624224909.6350-8-pali@kernel.org>
 <202106251653.IbU5dy4V-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106251653.IbU5dy4V-lkp@intel.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Friday 25 June 2021 16:15:38 kernel test robot wrote:
> Hi "Pali,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on tty/tty-testing clk/clk-next linus/master v5.13-rc7 next-20210624]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Pali-Roh-r/serial-mvebu-uart-Fixes-and-new-support-for-higher-baudrates/20210625-065146
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: m68k-allmodconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/747483a6b8f2de98afe461dbf91227404a8e2e81
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Pali-Roh-r/serial-mvebu-uart-Fixes-and-new-support-for-higher-baudrates/20210625-065146
>         git checkout 747483a6b8f2de98afe461dbf91227404a8e2e81
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    m68k-linux-ld: drivers/tty/serial/mvebu-uart.o: in function `mvebu_uart_clock_prepare':
>    mvebu-uart.c:(.text+0x6d0): undefined reference to `__udivdi3'
> >> m68k-linux-ld: mvebu-uart.c:(.text+0x78c): undefined reference to `__udivdi3'

Hello! Could you help me how to fix this issue? I'm using macro
DIV_ROUND_CLOSEST() with two u64 values in that function. And I really
do not know details about m68k arch and I never touched this arch.

There is missing number of line which caused this error. So if it is
possible I have suggestion for bot to compile kernel with -g flag. In
this case linker show exact line number (and not only hex address) which
caused that linker error. Also in future it could help identify source
of errors...

Anyway, driver is for Marvell Armada 3720 SoC which is arm64 so I did
not think that somebody even try to compile it for m68k.

> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


