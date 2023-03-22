Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6081C6FD1F
	for <linux-clk@archiver.kernel.org>; Wed, 22 Mar 2023 20:04:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbjCVUER (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Mar 2023 16:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbjCVUDX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Mar 2023 16:03:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A436C6A2
        for <linux-clk@vger.kernel.org>; Wed, 22 Mar 2023 12:59:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 48AC8B81DE7
        for <linux-clk@vger.kernel.org>; Wed, 22 Mar 2023 19:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C942C433A1;
        Wed, 22 Mar 2023 19:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679515176;
        bh=Pimu7YMlgMvD9aPxdSzZGlfStbfAP+xpCj244fNbLuw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QWZRqinq+D4RQIIIqJ/TFE2fD9b0RBdasDxZeH+x2+R52LrJ7DcwHsG4USO734qqS
         +GQ//TAE+3ERRJmp9oC0PVFXjNrqtqmwcs9TduwchmnHwGPZjKNDEYtKNMhJYDzShO
         w8ps28gwAa6zWD9tj6svba5YQuekBkcC3+mGLwynxDmClE6HZN7mAIVzS90tx/+ga+
         v3UkmpDmt1s2Js+RgPZHXnjAoaxegnrZVr8cXPj99HzJN4ehwub4rOPv0qN+IzP/gu
         va6F0B8LLRdqpY1I1DEXuyP7TOV9oTt+VfF4TA9dUqiGUpRB59vOVd0hukyy3gTZcO
         HCO0oWQjqUFUA==
Date:   Wed, 22 Mar 2023 12:59:33 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Qin Jian <qinjian@cqplus1.com>, kernel test robot <lkp@intel.com>,
        llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [clk:clk-sunplus 1/1] drivers/clk/clk-sp7021.c:316:8: warning:
 result of comparison of constant 18446744073709551615 with expression of
 type 'typeof (_Generic((_m), char: (unsigned char)0, unsigned char:
 (unsigned char)0, signed char: (unsigned char)0, unsigned short: (unsigne...
Message-ID: <20230322195933.GA2828949@dev-arch.thelio-3990X>
References: <202303221947.pXP2v4xJ-lkp@intel.com>
 <81b2a67f89d7f46dd27f6d05606e753f.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81b2a67f89d7f46dd27f6d05606e753f.sboyd@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 22, 2023 at 10:39:06AM -0700, Stephen Boyd wrote:
> Quoting kernel test robot (2023-03-22 04:17:48)
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-sunplus
> > head:   d54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2
> > commit: d54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2 [1/1] clk: Add Sunplus SP7021 clock driver
> > config: mips-randconfig-r012-20230322 (https://download.01.org/0day-ci/archive/20230322/202303221947.pXP2v4xJ-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install mips cross compiling tool for clang build
> >         # apt-get install binutils-mipsel-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?id=d54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2
> >         git remote add clk https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
> >         git fetch --no-tags clk clk-sunplus
> >         git checkout d54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/clk/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202303221947.pXP2v4xJ-lkp@intel.com/
> > 
> 
> Does this fix it?
> 
> ---8<---
> diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
> index 8fec14120105..caabbf5e2197 100644
> --- a/drivers/clk/clk-sp7021.c
> +++ b/drivers/clk/clk-sp7021.c
> @@ -30,9 +30,9 @@ enum {
>  	P_MAX
>  };
>  
> -#define MASK_SEL_FRA	GENMASK(1, 1)
> -#define MASK_SDM_MOD	GENMASK(2, 2)
> -#define MASK_PH_SEL	GENMASK(4, 4)
> +#define MASK_SEL_FRA	BITMASK(1)
> +#define MASK_SDM_MOD	BITMASK(2)
> +#define MASK_PH_SEL	BITMASK(4)
>  #define MASK_NFRA	GENMASK(12, 6)
>  #define MASK_DIVR	GENMASK(8, 7)
>  #define MASK_DIVN	GENMASK(7, 0)
> 

No (BITMASK did not exist but BIT_MASK does). It looks like clang is
complaining that mask is an unsigned int and it is being compared
against ~0ull, which will always be false. This makes the warning go
away for me, which is similar to commit cfd6fb45cfaf ("crypto: ccree -
avoid out-of-range warnings from clang"), but I am not sure if that is
correct or not.

diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
index 8fec14120105..11d22043ddd7 100644
--- a/drivers/clk/clk-sp7021.c
+++ b/drivers/clk/clk-sp7021.c
@@ -41,7 +41,7 @@ enum {
 /* HIWORD_MASK FIELD_PREP */
 #define HWM_FIELD_PREP(mask, value)		\
 ({						\
-	u32 _m = mask;				\
+	u64 _m = mask;				\
 	(_m << 16) | FIELD_PREP(_m, value);	\
 })
 

For the record, this only happens under W=1 but I think we would like to
eventually enable this warning so it would be good to avoid introducing
new instances.

Cheers,
Nathan
