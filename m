Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3A2C4361B
	for <linux-clk@archiver.kernel.org>; Wed,  9 Dec 2020 01:36:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E9F2238E9
	for <linux-clk@archiver.kernel.org>; Wed,  9 Dec 2020 01:36:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgLIBgH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Dec 2020 20:36:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgLIBgG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Dec 2020 20:36:06 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931CAC061793
        for <linux-clk@vger.kernel.org>; Tue,  8 Dec 2020 17:35:25 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id y24so714574otk.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Dec 2020 17:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N9+OxDZjSo4wCo8oLDWS807OvNQxIgRZodAcG7UCd+I=;
        b=c+FIQKRzvGpriFZSl9JtbrzU0NguMQjaMPEbpiHOTHcIFq3uhJuskhM97RuWyO6rT/
         jWV3CWSv61wM3itCcUqI5AgZFxfqifjuZxGXA07jMUhBghT9I/JdxPwtLSpBazuDstSW
         xy6siT4ao5gylL5EH9ebhFwScl3FXat3aVhSwAl3y7rdHk8TyQIeSv2imtSShpZ+9VyB
         xYP7pyMc3SnS6vdAZZ4RlW7EVZMxdWjDZ3P0obL49rwBHc+lL3oJeTJwTrBNtvhKBKRD
         5Fgyjyf1NbaVopWjgqC5qCmhPukDeVeU04Txc1FDIaVVwgPU6Vx3kHyd22hyxgcGxb8o
         ST+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N9+OxDZjSo4wCo8oLDWS807OvNQxIgRZodAcG7UCd+I=;
        b=nHGYlbqaUYB841Lpd/WJ6NALnOSIn65n6NBDdsViorREtn2SkNhxdFIaFLBR9BEhsJ
         cEj70ud950W77RZcr0qxcdFcPbeo0QkQdaoade6FupDYazCUAzFW/3ti2DPLZv9yp15q
         pmPoDCLD/zBLSUhQDtP8up2sOzKEHtVCC361jogXXm34UQiqaCR9oKKOTf0emKNa/AFH
         cfXb5EhQcTug7PMYnPBnpPTf5iR8t/GECWxNom6tfFGQlYRNo1r4XvBIYuMyQk/IzZDY
         No8dt/iNMcfGKixHTwcXvz4tlslDoGYBQ5S6SY9WksyJCMVwCkqDL+Kd4p2wWS7vUP5m
         Jg8Q==
X-Gm-Message-State: AOAM5336U/hajQbgywjdEBL1PT6gjvWxz1LQGtvi27z2FENYOqYj4NXv
        lYVcWJuASCWWuX3OrzHnb/6HSAJ8MrmYM8BYPI6wjhyTP2M/Og==
X-Google-Smtp-Source: ABdhPJxZcAcuOp4tKv7oC5X6OIAJoCrOyFzQcp9kYadOb9hq6dAqOMtYH8Zh5LSO46Ha/DsUJ/45YH7c21twa9tGjpo=
X-Received: by 2002:a9d:646:: with SMTP id 64mr827164otn.18.1607477724926;
 Tue, 08 Dec 2020 17:35:24 -0800 (PST)
MIME-Version: 1.0
References: <20201208071432.55583-2-zong.li@sifive.com> <202012090131.cj4wycAZ-lkp@intel.com>
In-Reply-To: <202012090131.cj4wycAZ-lkp@intel.com>
From:   Zong Li <zong.li@sifive.com>
Date:   Wed, 9 Dec 2020 09:35:13 +0800
Message-ID: <CANXhq0pGhyvevg7-D83V3+i_KRPWW1=RfzM8pBooPAeOQp00Wg@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] clk: sifive: Extract prci core to common base
To:     kernel test robot <lkp@intel.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Pragnesh Patel <pragnesh.patel@openfive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Michael Turquette <mturquette@baylibre.com>,
        Yash Shah <yash.shah@sifive.com>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Dec 9, 2020 at 1:08 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Zong,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on clk/clk-next]
> [also build test ERROR on robh/for-next linux/master linus/master v5.10-rc7 next-20201208]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Zong-Li/clk-add-driver-for-the-SiFive-FU740/20201208-151711
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: x86_64-randconfig-a016-20201208 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project a2f922140f5380571fb74179f2bf622b3b925697)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/5bfdddc125b80d4541a5a925918efec9b6fe0282
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Zong-Li/clk-add-driver-for-the-SiFive-FU740/20201208-151711
>         git checkout 5bfdddc125b80d4541a5a925918efec9b6fe0282
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: wrpll_configure_for_rate
>    >>> referenced by sifive-prci.c
>    >>> clk/sifive/sifive-prci.o:(sifive_prci_wrpll_round_rate) in archive drivers/built-in.a
>    >>> referenced by sifive-prci.c
>    >>> clk/sifive/sifive-prci.o:(sifive_prci_wrpll_set_rate) in archive drivers/built-in.a
> --
> >> ld.lld: error: undefined symbol: wrpll_calc_output_rate
>    >>> referenced by sifive-prci.c
>    >>> clk/sifive/sifive-prci.o:(sifive_prci_wrpll_round_rate) in archive drivers/built-in.a
>    >>> referenced by sifive-prci.c
>    >>> clk/sifive/sifive-prci.o:(sifive_prci_wrpll_recalc_rate) in archive drivers/built-in.a
> --
> >> ld.lld: error: undefined symbol: wrpll_calc_max_lock_us
>    >>> referenced by sifive-prci.c
>    >>> clk/sifive/sifive-prci.o:(sifive_prci_wrpll_set_rate) in archive drivers/built-in.a
> --
> >> ld.lld: error: undefined symbol: __prci_init_clocks_fu540
>    >>> referenced by sifive-prci.c
>    >>> clk/sifive/sifive-prci.o:(prci_clk_fu540) in archive drivers/built-in.a
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

This issue should be fixed in the v5 version, it seems to be a mess in
our v6 internal branch, I would rebase the codebase and send the v7
patches.
