Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924A6C6FD1F
	for <linux-clk@archiver.kernel.org>; Wed, 22 Mar 2023 23:48:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjCVXss (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Mar 2023 19:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjCVXsr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Mar 2023 19:48:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FAF3CC2D
        for <linux-clk@vger.kernel.org>; Wed, 22 Mar 2023 16:48:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EEF5262304
        for <linux-clk@vger.kernel.org>; Wed, 22 Mar 2023 23:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1EEC433D2;
        Wed, 22 Mar 2023 23:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679528925;
        bh=wWdLNiCNfnRGyGZ00699DT+v9vg5lBigHWNeZvkgUrw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=i9V+BBFcNtBZruyQRBAA4M+mpqfzubCFLDCmMm7KReRuxW+R3YTZt7uUqCzDUu/4s
         7QNCmWga6UjU7PO8YovoKse2Xlg39DYXAb0yWjfypCUrka7go2ravpJ0aR73J1lQhs
         PnpNc3sCC7qVWvhBHD+muC0KINu3a+sHecHrzss/Ety6btbusud9twK8AUSJvQWTYS
         AtenEzJN3YUppXMUwdkXPbr3tLBZ2I/ezzLNBZQCOLujgn88KOs+jMX5FtogxX7qb/
         yTNh6gJvMu3zrdgv2oYxHayFGYRDq93imbanJP+6e2K/c9GYl/9G/0HEuLmK/WMmJ0
         I0OmqXV1j2BNw==
Message-ID: <00c24196e5ceb60b7d69967b73910264.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230322195933.GA2828949@dev-arch.thelio-3990X>
References: <202303221947.pXP2v4xJ-lkp@intel.com> <81b2a67f89d7f46dd27f6d05606e753f.sboyd@kernel.org> <20230322195933.GA2828949@dev-arch.thelio-3990X>
Subject: Re: [clk:clk-sunplus 1/1] drivers/clk/clk-sp7021.c:316:8: warning: result of comparison of constant 18446744073709551615 with expression of type 'typeof (_Generic((_m), char: (unsigned char)0, unsigned char: (unsigned char)0, signed char: (unsigned char)0, unsigned short: (unsigne...
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Qin Jian <qinjian@cqplus1.com>, kernel test robot <lkp@intel.com>,
        llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 22 Mar 2023 16:48:43 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Nathan Chancellor (2023-03-22 12:59:33)
> On Wed, Mar 22, 2023 at 10:39:06AM -0700, Stephen Boyd wrote:
> > Quoting kernel test robot (2023-03-22 04:17:48)
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git=
 clk-sunplus
> > > head:   d54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2
> > > commit: d54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2 [1/1] clk: Add Sunpl=
us SP7021 clock driver
> > > config: mips-randconfig-r012-20230322 (https://download.01.org/0day-c=
i/archive/20230322/202303221947.pXP2v4xJ-lkp@intel.com/config)
> > > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project =
67409911353323ca5edf2049ef0df54132fa1ca7)
> > > reproduce (this is a W=3D1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install mips cross compiling tool for clang build
> > >         # apt-get install binutils-mipsel-linux-gnu
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.g=
it/commit/?id=3Dd54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2
> > >         git remote add clk https://git.kernel.org/pub/scm/linux/kerne=
l/git/clk/linux.git
> > >         git fetch --no-tags clk clk-sunplus
> > >         git checkout d54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cros=
s W=3D1 O=3Dbuild_dir ARCH=3Dmips olddefconfig
> > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cros=
s W=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/clk/
> > >=20
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Link: https://lore.kernel.org/oe-kbuild-all/202303221947.pXP2v4xJ-l=
kp@intel.com/
> > >=20
> >=20
> > Does this fix it?
> >=20
> > ---8<---
> > diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
> > index 8fec14120105..caabbf5e2197 100644
> > --- a/drivers/clk/clk-sp7021.c
> > +++ b/drivers/clk/clk-sp7021.c
> > @@ -30,9 +30,9 @@ enum {
> >       P_MAX
> >  };
> > =20
> > -#define MASK_SEL_FRA GENMASK(1, 1)
> > -#define MASK_SDM_MOD GENMASK(2, 2)
> > -#define MASK_PH_SEL  GENMASK(4, 4)
> > +#define MASK_SEL_FRA BITMASK(1)
> > +#define MASK_SDM_MOD BITMASK(2)
> > +#define MASK_PH_SEL  BITMASK(4)
> >  #define MASK_NFRA    GENMASK(12, 6)
> >  #define MASK_DIVR    GENMASK(8, 7)
> >  #define MASK_DIVN    GENMASK(7, 0)
> >=20
>=20
> No (BITMASK did not exist but BIT_MASK does).

Heh ok.

> It looks like clang is
> complaining that mask is an unsigned int and it is being compared
> against ~0ull, which will always be false. This makes the warning go
> away for me, which is similar to commit cfd6fb45cfaf ("crypto: ccree -
> avoid out-of-range warnings from clang"), but I am not sure if that is
> correct or not.

Cool thanks. Can you send it as a proper patch?

>=20
> diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
> index 8fec14120105..11d22043ddd7 100644
> --- a/drivers/clk/clk-sp7021.c
> +++ b/drivers/clk/clk-sp7021.c
> @@ -41,7 +41,7 @@ enum {
>  /* HIWORD_MASK FIELD_PREP */
>  #define HWM_FIELD_PREP(mask, value)            \
>  ({                                             \
> -       u32 _m =3D mask;                          \
> +       u64 _m =3D mask;                          \
>         (_m << 16) | FIELD_PREP(_m, value);     \
>  })
> =20
>=20
> For the record, this only happens under W=3D1 but I think we would like to
> eventually enable this warning so it would be good to avoid introducing
> new instances.

It makes sense to me because FIELD_PREP typically takes a GENMASK input,
which is an unsigned long long shifted around.=20

I think I'm building with W=3D1, but I'm not building with clang. I'll
have to go fetch another compiler and put it into circulation.
