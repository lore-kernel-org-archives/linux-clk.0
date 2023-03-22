Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B70C6FD1C
	for <linux-clk@archiver.kernel.org>; Wed, 22 Mar 2023 17:39:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjCVRjL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Mar 2023 13:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjCVRjK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Mar 2023 13:39:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93646BB
        for <linux-clk@vger.kernel.org>; Wed, 22 Mar 2023 10:39:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 20C58621F1
        for <linux-clk@vger.kernel.org>; Wed, 22 Mar 2023 17:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6612CC433EF;
        Wed, 22 Mar 2023 17:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679506748;
        bh=+cY6SLgySfXog0odOKNsMVvo+BxosOx02DWC6mWb+AM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YFPKcbYn8Z2xt7vnrjKuYmz6OrhyZroympdIeE9pzmKAApiFhtFyeF0PzV9B6nc4P
         Y2woVg6qZ8z7+QQ5aHnWvEEy/3s6MOBxbfR2GAjnOEeJilNc2Tnh866NTDmviv69NH
         BEVzJTgV6hX/RR6IL/PDnko7XvUw8KAbVGSVbYX6CjOywxLddAk0Qkv96Um3tCpFw3
         EONvs/aRO8J/JiWzXcvtFz3G4sBQFUyaRLr0Qj2yxq8ET2gAPZ31pAccCo2f/Z5W/a
         5sucLQHqOpWheqjNmLH/VUl8wekscwKpLO0CyQmCqlwWGy1AxwIzO8BGep5mu7BVMj
         WF717iIhsi1+g==
Message-ID: <81b2a67f89d7f46dd27f6d05606e753f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202303221947.pXP2v4xJ-lkp@intel.com>
References: <202303221947.pXP2v4xJ-lkp@intel.com>
Subject: Re: [clk:clk-sunplus 1/1] drivers/clk/clk-sp7021.c:316:8: warning: result of comparison of constant 18446744073709551615 with expression of type 'typeof (_Generic((_m), char: (unsigned char)0, unsigned char: (unsigned char)0, signed char: (unsigned char)0, unsigned short: (unsigne...
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Qin Jian <qinjian@cqplus1.com>, kernel test robot <lkp@intel.com>
Date:   Wed, 22 Mar 2023 10:39:06 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting kernel test robot (2023-03-22 04:17:48)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk=
-sunplus
> head:   d54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2
> commit: d54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2 [1/1] clk: Add Sunplus S=
P7021 clock driver
> config: mips-randconfig-r012-20230322 (https://download.01.org/0day-ci/ar=
chive/20230322/202303221947.pXP2v4xJ-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 6740=
9911353323ca5edf2049ef0df54132fa1ca7)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mipsel-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/c=
ommit/?id=3Dd54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2
>         git remote add clk https://git.kernel.org/pub/scm/linux/kernel/gi=
t/clk/linux.git
>         git fetch --no-tags clk clk-sunplus
>         git checkout d54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Dmips olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/clk/
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303221947.pXP2v4xJ-lkp@i=
ntel.com/
>=20

Does this fix it?

---8<---
diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
index 8fec14120105..caabbf5e2197 100644
--- a/drivers/clk/clk-sp7021.c
+++ b/drivers/clk/clk-sp7021.c
@@ -30,9 +30,9 @@ enum {
 	P_MAX
 };
=20
-#define MASK_SEL_FRA	GENMASK(1, 1)
-#define MASK_SDM_MOD	GENMASK(2, 2)
-#define MASK_PH_SEL	GENMASK(4, 4)
+#define MASK_SEL_FRA	BITMASK(1)
+#define MASK_SDM_MOD	BITMASK(2)
+#define MASK_PH_SEL	BITMASK(4)
 #define MASK_NFRA	GENMASK(12, 6)
 #define MASK_DIVR	GENMASK(8, 7)
 #define MASK_DIVN	GENMASK(7, 0)
