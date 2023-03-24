Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11F9C6FD20
	for <linux-clk@archiver.kernel.org>; Fri, 24 Mar 2023 14:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbjCXOvD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Mar 2023 10:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbjCXOvC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Mar 2023 10:51:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE882D5F
        for <linux-clk@vger.kernel.org>; Fri, 24 Mar 2023 07:51:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6854BB82498
        for <linux-clk@vger.kernel.org>; Fri, 24 Mar 2023 14:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21C6C433D2;
        Fri, 24 Mar 2023 14:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679669458;
        bh=8E2IvQpdT34xtqqpUMSWG8UjKpG0Mn8v7Bf/LKYHRAM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XIeIOprB0Jl+/v6D4q8V85bvTq2Ix7z4aqA5DSNMbpVKpDHYMh8z+TTpZAO7IMW9D
         FcR1+ocAe8uo+QmmOZXinK6C21XH5jopyKnNzaMekbMClRKhipUlBcZMmRroZFVjs9
         7QXE/jB6IJZS6eJP6+/WEtWk3IXe/e0Ss1MebWnZ4DQwH2Y2zRbkUQSrm5Ev2I3rA9
         TpR+F+7F0lF+Ky9qpCPEi0RXkry3tBWfzK8JtTWBKAGzDgT89cqMSL3kUQd4NXqVGB
         FQNKC/tv17zypCOXpt3PYG0NyjqreIyLx64hhHqpiKXHBlDXNiKAcRGMWXfePaEHv2
         qoy1pjnJKFWXA==
Date:   Fri, 24 Mar 2023 07:50:56 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Qin Jian <qinjian@cqplus1.com>, kernel test robot <lkp@intel.com>,
        llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [clk:clk-sunplus 1/1] drivers/clk/clk-sp7021.c:316:8: warning:
 result of comparison of constant 18446744073709551615 with expression of
 type 'typeof (_Generic((_m), char: (unsigned char)0, unsigned char:
 (unsigned char)0, signed char: (unsigned char)0, unsigned short: (unsigne...
Message-ID: <20230324145056.GA428955@dev-arch.thelio-3990X>
References: <202303221947.pXP2v4xJ-lkp@intel.com>
 <81b2a67f89d7f46dd27f6d05606e753f.sboyd@kernel.org>
 <20230322195933.GA2828949@dev-arch.thelio-3990X>
 <00c24196e5ceb60b7d69967b73910264.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00c24196e5ceb60b7d69967b73910264.sboyd@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 22, 2023 at 04:48:43PM -0700, Stephen Boyd wrote:
> Quoting Nathan Chancellor (2023-03-22 12:59:33)
> > On Wed, Mar 22, 2023 at 10:39:06AM -0700, Stephen Boyd wrote:
> > > Quoting kernel test robot (2023-03-22 04:17:48)
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-sunplus
> > > > head:   d54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2
> > > > commit: d54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2 [1/1] clk: Add Sunplus SP7021 clock driver
> > > > config: mips-randconfig-r012-20230322 (https://download.01.org/0day-ci/archive/20230322/202303221947.pXP2v4xJ-lkp@intel.com/config)
> > > > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
> > > > reproduce (this is a W=1 build):
> > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > >         chmod +x ~/bin/make.cross
> > > >         # install mips cross compiling tool for clang build
> > > >         # apt-get install binutils-mipsel-linux-gnu
> > > >         # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?id=d54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2
> > > >         git remote add clk https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
> > > >         git fetch --no-tags clk clk-sunplus
> > > >         git checkout d54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2
> > > >         # save the config file
> > > >         mkdir build_dir && cp config build_dir/.config
> > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
> > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/clk/
> > > > 
> > > > If you fix the issue, kindly add following tag where applicable
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Link: https://lore.kernel.org/oe-kbuild-all/202303221947.pXP2v4xJ-lkp@intel.com/
> > > > 
> > > 
> > > Does this fix it?
> > > 
> > > ---8<---
> > > diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
> > > index 8fec14120105..caabbf5e2197 100644
> > > --- a/drivers/clk/clk-sp7021.c
> > > +++ b/drivers/clk/clk-sp7021.c
> > > @@ -30,9 +30,9 @@ enum {
> > >       P_MAX
> > >  };
> > >  
> > > -#define MASK_SEL_FRA GENMASK(1, 1)
> > > -#define MASK_SDM_MOD GENMASK(2, 2)
> > > -#define MASK_PH_SEL  GENMASK(4, 4)
> > > +#define MASK_SEL_FRA BITMASK(1)
> > > +#define MASK_SDM_MOD BITMASK(2)
> > > +#define MASK_PH_SEL  BITMASK(4)
> > >  #define MASK_NFRA    GENMASK(12, 6)
> > >  #define MASK_DIVR    GENMASK(8, 7)
> > >  #define MASK_DIVN    GENMASK(7, 0)
> > > 
> > 
> > No (BITMASK did not exist but BIT_MASK does).
> 
> Heh ok.
> 
> > It looks like clang is
> > complaining that mask is an unsigned int and it is being compared
> > against ~0ull, which will always be false. This makes the warning go
> > away for me, which is similar to commit cfd6fb45cfaf ("crypto: ccree -
> > avoid out-of-range warnings from clang"), but I am not sure if that is
> > correct or not.
> 
> Cool thanks. Can you send it as a proper patch?

Sure thing, I will do so when I am back online next week.

> > diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
> > index 8fec14120105..11d22043ddd7 100644
> > --- a/drivers/clk/clk-sp7021.c
> > +++ b/drivers/clk/clk-sp7021.c
> > @@ -41,7 +41,7 @@ enum {
> >  /* HIWORD_MASK FIELD_PREP */
> >  #define HWM_FIELD_PREP(mask, value)            \
> >  ({                                             \
> > -       u32 _m = mask;                          \
> > +       u64 _m = mask;                          \
> >         (_m << 16) | FIELD_PREP(_m, value);     \
> >  })
> >  
> > 
> > For the record, this only happens under W=1 but I think we would like to
> > eventually enable this warning so it would be good to avoid introducing
> > new instances.
> 
> It makes sense to me because FIELD_PREP typically takes a GENMASK input,
> which is an unsigned long long shifted around. 
> 
> I think I'm building with W=1, but I'm not building with clang. I'll
> have to go fetch another compiler and put it into circulation.

If you have not seen it already, I provide prebuilt up to date versions
of clang on kernel.org, which I hope eases the friction of testing with
two compilers:

https://lore.kernel.org/20230319235619.GA18547@dev-arch.thelio-3990X/

Cheers,
Nathan
