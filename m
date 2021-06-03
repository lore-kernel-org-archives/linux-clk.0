Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B4AC47082
	for <linux-clk@archiver.kernel.org>; Thu,  3 Jun 2021 20:05:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D36461400
	for <linux-clk@archiver.kernel.org>; Thu,  3 Jun 2021 20:05:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhFCUGw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Jun 2021 16:06:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:38664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhFCUGw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 3 Jun 2021 16:06:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3575A61008;
        Thu,  3 Jun 2021 20:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622750707;
        bh=9dFMwUhZOQPsj8oP08P5XGUubz+vM0Q1A+HJ57RO8IA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=No7rDqKu3Nc+EVIZvEP5nwx8P4hcRf6sYF3l1PViKvLwHKBXndnn+RkbZQkuhJKs0
         IEGZH9DvUCgB0v6FTy8E7/uoqF8SGeaP6bmxhxgmzT491jjvHx+S1yAJFwiHclrnZO
         SBN8EEIjKY8oJsCWOQIwDZLpYHzrKVDRQATbMXIh2hU9aO8mszcE9uoQZqF+2Tl2Tt
         07C6abfSmB7JRpDlxHpnAjSMMvmgqLoaE2LGDzuvnWqLsLQMgliYPa0oSz9QvHuiuZ
         97Lz0+WHma+sWudU6JXr0u1c655WViETL03keWzBz2BgIXZWjWphmVoByyYS6O0BnR
         hW4WxsL3wfxjA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202106032204.RmTRwUJD-lkp@intel.com>
References: <202106032204.RmTRwUJD-lkp@intel.com>
Subject: Re: [clk:clk-versatile 1/1] clk-versatile.c:undefined reference to `of_iomap'
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
To:     Peter Collingbourne <pcc@google.com>,
        kernel test robot <lkp@intel.com>
Date:   Thu, 03 Jun 2021 13:05:05 -0700
Message-ID: <162275070593.1835121.5721436755445700602@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting kernel test robot (2021-06-03 07:58:13)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk=
-versatile
> head:   419b3ab6987f2a108cc4710030184365b17467ac
> commit: 419b3ab6987f2a108cc4710030184365b17467ac [1/1] clk: versatile: re=
move dependency on ARCH_*
> config: s390-allmodconfig (attached as .config)
> compiler: s390-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/c=
ommit/?id=3D419b3ab6987f2a108cc4710030184365b17467ac
>         git remote add clk https://git.kernel.org/pub/scm/linux/kernel/gi=
t/clk/linux.git
>         git fetch --no-tags clk clk-versatile
>         git checkout 419b3ab6987f2a108cc4710030184365b17467ac
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Ds390=20
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Probably ought to depend on HAS_IOMEM. Linus or Lee?

----8<----
diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconfig
index 792315d893db..481de5657d85 100644
--- a/drivers/clk/versatile/Kconfig
+++ b/drivers/clk/versatile/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
=20
 menu "Clock driver for ARM Reference designs"
+	depends on HAS_IOMEM
=20
 config ICST
 	bool "Clock driver for ARM Reference designs ICST"

>=20
> All errors (new ones prefixed by >>):
>=20
>    s390-linux-ld: kernel/dma/coherent.o: in function `dma_init_coherent_m=
emory':
>    coherent.c:(.text+0x3bc): undefined reference to `memremap'
>    s390-linux-ld: coherent.c:(.text+0x500): undefined reference to `memun=
map'
>    s390-linux-ld: kernel/dma/coherent.o: in function `dma_declare_coheren=
t_memory':
>    coherent.c:(.text+0xae6): undefined reference to `memunmap'
>    s390-linux-ld: drivers/irqchip/irq-al-fic.o: in function `al_fic_init_=
dt':
>    irq-al-fic.c:(.init.text+0x98): undefined reference to `of_iomap'
>    s390-linux-ld: irq-al-fic.c:(.init.text+0x596): undefined reference to=
 `iounmap'
>    s390-linux-ld: drivers/clk/clk-fixed-mmio.o: in function `fixed_mmio_c=
lk_setup':
>    clk-fixed-mmio.c:(.text+0x9a): undefined reference to `of_iomap'
>    s390-linux-ld: clk-fixed-mmio.c:(.text+0xe6): undefined reference to `=
iounmap'
>    s390-linux-ld: drivers/clk/versatile/clk-versatile.o: in function `cm_=
osc_setup':
> >> clk-versatile.c:(.init.text+0xbc): undefined reference to `of_iomap'
>    s390-linux-ld: drivers/clk/versatile/clk-sp810.o: in function `clk_sp8=
10_of_setup':
> >> clk-sp810.c:(.init.text+0x174): undefined reference to `of_iomap'
>    s390-linux-ld: drivers/clocksource/timer-of.o: in function `timer_of_i=
nit':
>    timer-of.c:(.init.text+0xcc): undefined reference to `of_iomap'
>    s390-linux-ld: timer-of.c:(.init.text+0x8ee): undefined reference to `=
iounmap'
>    s390-linux-ld: drivers/clocksource/timer-of.o: in function `timer_of_c=
leanup':
>    timer-of.c:(.init.text+0xb9a): undefined reference to `iounmap'
>    s390-linux-ld: drivers/clocksource/timer-microchip-pit64b.o: in functi=
on `mchp_pit64b_dt_init_timer':
>    timer-microchip-pit64b.c:(.init.text+0x150): undefined reference to `o=
f_iomap'
>    s390-linux-ld: timer-microchip-pit64b.c:(.init.text+0xc78): undefined =
reference to `iounmap'
>
