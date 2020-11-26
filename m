Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7211EC56202
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 03:05:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03DD321734
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 03:05:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QeTQ5iJE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732508AbgKZDFE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Nov 2020 22:05:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731887AbgKZDFD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Nov 2020 22:05:03 -0500
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C85C061A04
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2020 19:05:03 -0800 (PST)
Received: by mail-oo1-xc43.google.com with SMTP id i13so95277oou.11
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2020 19:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ia7D6bExbGpst+sPe9IYyFsCKYnhwQ5YD1Ag6MqNa9Q=;
        b=QeTQ5iJEWt0cMw5dqYxHgFZVxroA73afTnZTUKin+4nghfef6B5yrxcFNPvegT8qBf
         YTefi635NXQkqTOruqoPH96n8Rx/WcMPI9Bt0KQGDGR/xgC/CjCqw8rov//5y2bYgMWA
         OHGf0ZH9xck3Y+FCvyCpunR1x18dZW2hPvQv7FiRqlnXS+VebnXMvYVFoZMjoW/lTXm/
         N34gqQikhzSAdBnbJaeqvCJQCksT3a4GZiFLQXB8cxO4Cv+iPqR053/SVkxnZv0vfou2
         9nsUUYFeJqWgspU+YFMLtB/DKtqU5WjjzifukOe1l36AM/AsXb/Ftw8un1Z9feEdbfu5
         6d+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ia7D6bExbGpst+sPe9IYyFsCKYnhwQ5YD1Ag6MqNa9Q=;
        b=tS8aAp11x3O4c8qm6ooLtxeiN+nYWmlJ8HVWCPcSPltVteDszFH0G6FZd15/r2+j6X
         orCsFsyW0Y4XxoKo2RNsbe19TKo1xJH6RoHWMHAlMs8pIg9ieEf9+J6eGuzBthDFWz8P
         p14JrvXBZF4hH6rPo79S7mdcFTdEDyVaWlhnSdcBLOMp0bjwhkkbL28TF+SHHWj3oQ09
         bWjUzgXtwbLP663XbeDMqzfFzA5IzNZFI1oSKkCCc/dPxVVFX/zkmi0VPBfbwjHzu+Fc
         J6kxbitIUK+Y9PwV1InEi2nbsJeoow+yrHSJ3p2ZcUFxSrJYMaYsRPwh4EVnauBNFSrG
         GXFQ==
X-Gm-Message-State: AOAM531LqVLcOpV8Gcx/ocN+8/ppSG3ceiN8lSe+R6UM8NoZJyNIQa4y
        Kxd+v00JeDcIQgnAPEYZnEQK/+ZM1FpNVAdtG65fKg==
X-Google-Smtp-Source: ABdhPJzEQJKg3GtGD4nIFKKsjIIVXwsdLRt5qMtGdVulnYTH6c76BbtnO7sKZ1nNwOktpYnj4U+GEioYklOycxeSWDs=
X-Received: by 2002:a4a:de19:: with SMTP id y25mr638218oot.33.1606359901824;
 Wed, 25 Nov 2020 19:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20201111100608.108842-2-zong.li@sifive.com> <202011250226.TqdPflR5-lkp@intel.com>
In-Reply-To: <202011250226.TqdPflR5-lkp@intel.com>
From:   Zong Li <zong.li@sifive.com>
Date:   Thu, 26 Nov 2020 11:04:51 +0800
Message-ID: <CANXhq0o-k0JwavOR9S=Wvjn9v5tkOSX1QYnoiGH1LRWeFaKaww@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] clk: sifive: Extract prci core to common base
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
        linux-clk@vger.kernel.org, kbuild-all@lists.01.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Nov 25, 2020 at 2:43 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Zong,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on clk/clk-next]
> [also build test ERROR on robh/for-next linus/master linux/master v5.10-rc5 next-20201124]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Zong-Li/clk-add-driver-for-the-SiFive-FU740/20201111-180900
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: riscv-randconfig-r003-20201124 (attached as .config)
> compiler: riscv32-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/f08e191181ee40e21d9c1d63cfa4d894bc86ff27
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Zong-Li/clk-add-driver-for-the-SiFive-FU740/20201111-180900
>         git checkout f08e191181ee40e21d9c1d63cfa4d894bc86ff27
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=riscv
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    riscv32-linux-ld: drivers/clk/sifive/sifive-prci.o: in function `sifive_prci_wrpll_recalc_rate':
> >> sifive-prci.c:(.text+0x398): undefined reference to `wrpll_calc_output_rate'
>    riscv32-linux-ld: drivers/clk/sifive/sifive-prci.o: in function `sifive_prci_wrpll_round_rate':
> >> sifive-prci.c:(.text+0x41a): undefined reference to `wrpll_configure_for_rate'
> >> riscv32-linux-ld: sifive-prci.c:(.text+0x428): undefined reference to `wrpll_calc_output_rate'
>    riscv32-linux-ld: drivers/clk/sifive/sifive-prci.o: in function `sifive_prci_wrpll_set_rate':
>    sifive-prci.c:(.text+0x480): undefined reference to `wrpll_configure_for_rate'
> >> riscv32-linux-ld: sifive-prci.c:(.text+0x4ee): undefined reference to `wrpll_calc_max_lock_us'
> >> riscv32-linux-ld: drivers/clk/sifive/sifive-prci.o:(.srodata+0x0): undefined reference to `__prci_init_clocks_fu540'
>

Fix the dependency of sifive-prci.c in the next version patch set by
following, only build core code if CONFIG_CLK_SIFIVE_PRCI is selected.

- obj-y  += sifive-prci.o
+ obj-$(CONFIG_CLK_SIFIVE_PRCI)   += sifive-prci.o

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
